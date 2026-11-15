#!/usr/bin/env python3
"""Fresh, serial TUZA-18/19 finite Lean replay; Python standard library only.

Inputs are public source files plus explicit installed Lean/Mathlib dependencies.
Outputs must be a new directory outside the checkout. No archived log or object
is read. The all-size results and ordinary reductions are NOT formalized here.
"""
from __future__ import annotations
import argparse
import ast
from collections import Counter
from datetime import datetime, timedelta, timezone
import hashlib
from itertools import combinations, product
import json
import os
from pathlib import Path
import platform
import re
import shutil
import signal
import subprocess
import sys
import time

LEAN_VERSION = '4.33.1'
LEAN_COMMIT = '819816b2e0a3bf405af45ae5c7af2491d8f5bee6'
TOOLCHAIN = 'leanprover/lean4:v4.33.1'
INPUT_HASH = 'e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1'
ROLE_HASH = 'bda7467d6fb23bd221f7792ff350206e8f93ddabdfd674e77b14bbfe6c1666f6'
FROZEN_WKE_SOURCES = {
    'Core.lean': '77dad262c00416c2e8807a2b3539ce4b83ce621fc8b0fe859ef6c3a6174939f6',
    'Domain.lean': '14fa6e706f08aa74d883eb7ac68600dc9e8c564c5cdf7cde5850ffd12b7ab734',
    'Coverage.lean': 'b3e4356a4275d7f2c8fafffcccc4d223f42f901d7f2cb77ae2bc56d6a68de33f',
    'NegativeChecks.lean': '302492cf5eb4d06e74ca207aa30850ccc2b4e966e676f723d8c8df195e891c53',
    'RejectMissingRow.lean': 'aa09166516d87d9e637dc7b3e6ebc7a2c941b5fe1f5121f6da4ed0b0ed078274',
    'RejectEmptyCover.lean': '4477632631749a47aaa2d88841672df700835448fe895b7ad3a2149b0b9aa93a',
    'RejectRepeatedMatching.lean': '302a9427af7af773f7c925daa76e02e2ca324e61da8dead0f2f21e23da443197',
}
PINNED_PACKAGES = {
    'mathlib': '0df444a360eaa60ab8c11dca51a86af692955474',
    'plausible': 'b7eb3304aeae834b12dda98993a37f6a41f6f0bb',
    'LeanSearchClient': '5f4d51b81cbd3f6b32b156bfad9056621a040404',
    'importGraph': '16f02aa7642864af59f1ff0e384a015994db9118',
    'proofwidgets': '4be2e3d5087eeb272cf5a8853b8f9dd025ef5957',
    'aesop': '3448c0bcc5ce01b2d1546e483ec3620e32df3d0e',
    'Qq': '92c15be17b7caf78c2ad767ec40f89052d908d81',
    'batteries': '4488d40d070b9700d4d5a6aa342f0d40c31b2a2d',
    'Cli': '6130a47896ce867c6a4a55373441e59e565bad0f',
}
ALLOWED_AXIOMS = {'propext', 'Classical.choice', 'Quot.sound'}
POSITIVE_MODULES = ['Core'] + [f'Chunk{i:03d}' for i in range(128)] + [
    'Domain', 'Coverage', 'NegativeChecks']
NEGATIVE_MODULES = ['RejectMissingRow', 'RejectEmptyCover', 'RejectRepeatedMatching']
WALL_SECONDS = 240
RSS_BYTES = 2200 * 2**20
SAMPLE_SECONDS = 0.025


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def utc():
    return datetime.now(timezone.utc).isoformat()


def sha(data):
    return hashlib.sha256(data).hexdigest()


def filehash(path):
    return sha(Path(path).read_bytes())


def write_json(path, obj):
    Path(path).write_text(json.dumps(obj, indent=2, sort_keys=True) + '\n')


def read_command(argv, cwd=None, env=None):
    p = subprocess.run(argv, cwd=cwd, env=env, text=True,
                       capture_output=True, timeout=30)
    require(p.returncode == 0, 'Read-only command failed: ' + repr(argv) + '\n' + p.stderr)
    return p.stdout.strip()


def git(path, *args):
    return read_command(['git', '--no-optional-locks', '-C', str(path), *args],
                        env=dict(os.environ, GIT_OPTIONAL_LOCKS='0'))


def repo_state(repo):
    if not (repo / '.git').exists():
        return {'git': 'NOT_PRESENT; source-copy verification'}
    return {'head': git(repo, 'rev-parse', 'HEAD'),
            'status': git(repo, 'status', '--porcelain=v1', '--untracked-files=all')}


def installed_lean(requested):
    """Resolve an installed compiler without ever executing an elan proxy.

    Elan may install proxies as symlinks OR hard links. An unrecognized wrapper
    is rejected unless it has the native toolchain layout and Mach-O header.
    """
    found = shutil.which(requested)
    require(found is not None, 'Lean executable not found')
    selected = Path(found).absolute()
    resolved = selected.resolve()
    sibling_elan = selected.with_name('elan')
    is_proxy = resolved.name == 'elan' or (
        sibling_elan.is_file() and selected.samefile(sibling_elan))
    if is_proxy:
        root = Path(os.environ.get('ELAN_HOME', str(selected.parent.parent)))
        native = (root / 'toolchains/leanprover--lean4---v4.33.1/bin/lean').resolve()
        require(native.is_file() and not native.samefile(selected),
                'Pinned toolchain absent; no installation is permitted')
    else:
        native = resolved
    require((native.parent.parent / 'lib/lean/Init.olean').is_file(),
            'Expected installed native toolchain layout; no proxy invocation permitted')
    with native.open('rb') as stream:
        magic = stream.read(4)
    require(magic in {bytes.fromhex(x) for x in
                     ['feedface', 'cefaedfe', 'feedfacf', 'cffaedfe',
                      'cafebabe', 'bebafeca', 'cafebabf', 'bfbafeca']},
            'Expected native Mach-O compiler, not a shell/proxy wrapper')
    return native, {'requested_executable': str(selected),
                    'requested_executable_sha256': filehash(selected),
                    'elan_proxy_resolved_without_execution': is_proxy,
                    'native_compiler': str(native),
                    'native_compiler_sha256': filehash(native),
                    'policy': 'Installed native layout/header checked before any executable invocation'}


def package_state(packages):
    rows = {}
    for name, rev in PINNED_PACKAGES.items():
        p = packages / name
        actual = git(p, 'rev-parse', 'HEAD')
        status = git(p, 'status', '--porcelain=v1', '--untracked-files=no')
        require(actual == rev, 'Wrong dependency revision: ' + name)
        require(status == '', 'Tracked dependency changes: ' + name)
        lib = p / '.lake/build/lib/lean'
        rows[name] = {'revision': actual, 'tracked_status': status,
                      'compiled_library': str(lib) if lib.is_dir() else None}
    return rows


def canonical_graph(branches, states):
    n, es = branches, []
    require(len(states) == branches * (branches - 1) // 2, 'Bad state length')
    for (u, v), s in zip(combinations(range(branches), 2), states):
        require(type(s) is int and 0 <= s < 5, 'Bad state digit')
        if s == 1:
            es.append((u, v))
        elif s == 2:
            es += [(u, n), (v, n)]
            n += 1
        elif s == 3:
            es += [(u, n), (n, n + 1), (v, n + 1)]
            n += 2
        elif s == 4:
            es += [(u, v), (u, n), (v, n)]
            n += 1
    return n, sorted(es)


def lean_list(xs):
    return '[' + ','.join(map(str, xs)) + ']'


def lean_edges(xs):
    return '[' + ','.join(f'({u},{v})' for u, v in xs) + ']'


def row_text(r):
    return '⟨' + ','.join([lean_list(r['states']), str(r['n']), lean_edges(r['edges']),
                            lean_edges(r['witness']['M']), lean_list(r['witness']['Q'])]) + '⟩'


def chunk_source(name, branches, head, tail, rows):
    return ('import Core\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\n'
            'namespace FourBranch.' + name + '\n'
            'def rows : List Row := [\n' + ',\n'.join(row_text(r) for r in rows) + '\n]\n'
            'def segment : Segment := ⟨' + str(branches) + ',' + lean_list(head) + ',' +
            str(tail) + ',rows⟩\n'
            'theorem correct : checkSegment segment = true := by decide\n'
            '#print axioms correct\nend FourBranch.' + name + '\n')


def correspondence(source, dest):
    raw = (source / 'inputs/canonical_witnesses.json').read_bytes()
    require(sha(raw) == INPUT_HASH, 'Canonical input hash mismatch')
    table = {}
    for r in json.loads(raw)['kernels']:
        b, states = r['branches'], tuple(r['states'])
        key = (b, states)
        require(b in range(1, 5) and key not in table, 'Duplicate/out-of-domain kernel')
        n, es = canonical_graph(b, states)
        require(n == r['n'] and es == list(map(tuple, r['edges'])), 'Graph mismatch')
        require(all(sum(v in e for e in es) >= 3 for v in range(b)), 'Inadmissible branch')
        m, q = list(map(tuple, r['witness']['M'])), r['witness']['Q']
        endpoints = [v for e in m for v in e]
        require(set(m) <= set(es) and len(set(endpoints)) == len(endpoints), 'Invalid matching')
        require(len(q) == len(set(q)) and all(type(v) is int and 0 <= v < n for v in q), 'Invalid cover vertices')
        require(len(q) <= len(m) and all(e in m or e[0] in q or e[1] in q for e in es), 'Invalid WKE cover')
        table[key] = r
    expected = set()
    raw_count = 0
    for b in range(1, 5):
        for states in product(range(5), repeat=b * (b - 1) // 2):
            raw_count += 1
            _, es = canonical_graph(b, states)
            if all(sum(v in e for e in es) >= 3 for v in range(b)):
                expected.add((b, states))
    require(set(table) == expected and len(table) == 5375 and raw_count == 15756,
            'Regenerated domain is not exactly the retained table')
    schedule = [(1, (), 0), (2, (), 1), (3, (), 3)] + [(4, h, 3) for h in product(range(5), repeat=3)]
    generation = json.loads((source / 'generation.json').read_bytes())
    cov = (source / 'Coverage.lean').read_text()
    headers = ast.literal_eval(re.search(r'def recordedHeaders[^=]*:= (.*)', cov).group(1))
    counts = ast.literal_eval(re.search(r'def recordedRetainedCounts[^=]*:= (.*)', cov).group(1))
    require(len(headers) == len(counts) == len(generation['segments']) == 128, 'Wrong schedule size')
    regenerated, assigned = [], []
    for i, (b, head, tail) in enumerate(schedule):
        name = f'Chunk{i:03d}'
        rows = [table[(b, head + suffix)] for suffix in product(range(5), repeat=tail)
                if (b, head + suffix) in table]
        src = chunk_source(name, b, head, tail, rows).encode()
        require(src == (source / (name + '.lean')).read_bytes(), 'Generated source mismatch: ' + name)
        # Only the independently generated, byte-compared source is compiled.
        (dest / (name + '.lean')).write_bytes(src)
        item = {'module': name, 'branches': b, 'head': list(head), 'suffixLength': tail, 'rows': len(rows)}
        require(generation['segments'][i] == item, 'Generation record mismatch: ' + name)
        require(headers[i] == (b, list(head), tail) and counts[i] == len(rows), 'Coverage mismatch: ' + name)
        regenerated.append(item)
        assigned.extend((b, tuple(r['states'])) for r in rows)
    regenerated_generation = {'input_sha256': INPUT_HASH, 'rows': len(table), 'segments': regenerated}
    require(generation == regenerated_generation, 'Full generation.json mismatch')
    generated_bytes = (json.dumps(regenerated_generation, indent=2) + '\n').encode()
    require(generated_bytes == (source / 'generation.json').read_bytes(), 'generation.json serialization changed')
    (dest / 'generation.json').write_bytes(generated_bytes)
    require(len(assigned) == len(set(assigned)) == 5375 and set(assigned) == expected, 'Chunk assignment mismatch')
    return {'status': 'PASS', 'input_sha256': INPUT_HASH, 'source_bytes_equal_modules': 128,
            'generation_schedule_equal': True, 'coverage_headers_equal': True, 'coverage_counts_equal': True,
            'complete_regenerated_domain': True, 'raw_vectors': raw_count, 'canonical_records': len(table),
            'per_branch_records': dict(Counter(str(b) for b, _ in assigned)),
            'branch_1_records': 0, 'branch_2_records': 0, 'largest_chunk': max(counts)}


def named_declarations(source):
    """Inventory explicit top-level names, not compiler-generated helper names."""
    namespace = []
    rows = []
    for line in source.splitlines():
        if m := re.match(r'^namespace\s+(\S+)\s*$', line):
            namespace.append(m[1])
        elif re.match(r'^end(?:\s+\S+)?\s*$', line):
            require(namespace, 'Unexpected namespace end')
            namespace.pop()
        elif m := re.match(r'^(theorem|def|abbrev|structure)\s+([A-Za-z_][A-Za-z0-9_\'.]*)\b', line):
            rows.append({'kind': m[1], 'name': '.'.join(namespace + [m[2]])})
    require(not namespace and rows, 'Namespace/declaration inventory failed')
    return rows


def process_snapshot():
    raw = subprocess.run(['/bin/ps', '-axo', 'pid=,ppid=,pgid=,rss='],
                         capture_output=True, text=True, timeout=5, check=True).stdout
    return {r[0]: r for line in raw.splitlines() if len(r := tuple(map(int, line.split()))) == 4}


def owned_processes(snapshot, leader):
    owned = {pid for pid, (_, _, pgid, _) in snapshot.items() if pgid == leader}
    if leader in snapshot:
        owned.add(leader)
    while True:
        expanded = owned | {pid for pid, (_, ppid, _, _) in snapshot.items() if ppid in owned}
        if expanded == owned:
            return owned
        owned = expanded


def kill_owned(leader):
    # The group was created by this runner; no unrelated process group is targeted.
    try:
        snapshot = process_snapshot()
        owned = owned_processes(snapshot, leader)
    except Exception:
        owned = set()
    try:
        os.killpg(leader, signal.SIGKILL)
    except ProcessLookupError:
        pass
    for pid in owned - {leader}:
        try:
            os.kill(pid, signal.SIGKILL)
        except ProcessLookupError:
            pass


class Runner:
    def __init__(self, output, lean, base_env):
        self.output, self.lean, self.base_env = output, lean, base_env
        self.commands = []
        self.logs = output / 'logs'
        self.logs.mkdir()

    def compile(self, directory, module, search_paths, label, memory=1200, expected_failure=False):
        require(memory <= 2200, 'Lean allocation setting exceeds allowed limit')
        src, obj = directory / (module + '.lean'), directory / (module + '.olean')
        require(src.is_file() and not obj.exists(), 'Missing source or stale object: ' + module)
        stdout, stderr = self.logs / (label + '.stdout'), self.logs / (label + '.stderr')
        env = dict(self.base_env, LEAN_PATH=os.pathsep.join(map(str, search_paths)), LEAN_NUM_THREADS='1')
        cmd = ['/usr/bin/time', '-l', self.lean, '-M', str(memory), '-j', '1',
               src.name, '-o', obj.name]
        start, began = time.monotonic(), datetime.now(timezone.utc)
        peak, samples, reason = 0, 0, None
        process = None
        try:
            with stdout.open('w') as out, stderr.open('w') as err:
                process = subprocess.Popen(cmd, cwd=directory, env=env, stdout=out, stderr=err,
                                           start_new_session=True)
                while process.poll() is None:
                    snapshot = process_snapshot()
                    owned = owned_processes(snapshot, process.pid)
                    rss = sum(snapshot[pid][3] for pid in owned) * 1024
                    peak, samples = max(peak, rss), samples + 1
                    if rss > RSS_BYTES:
                        reason = 'RSS_LIMIT_EXCEEDED'
                        kill_owned(process.pid)
                        break
                    if time.monotonic() - start >= WALL_SECONDS:
                        reason = 'WALL_TIMEOUT'
                        kill_owned(process.pid)
                        break
                    time.sleep(SAMPLE_SECONDS)
                rc = process.wait(timeout=10)
                # A compiler wrapper must not leave descendants running after its exit.
                remaining = owned_processes(process_snapshot(), process.pid)
                if remaining:
                    reason = reason or 'DESCENDANT_LEFT_RUNNING'
                    kill_owned(process.pid)
        except BaseException:
            if process is not None:
                kill_owned(process.pid)
                process.wait(timeout=10)
            raise
        errtext = stderr.read_text()
        m = re.search(r'(\d+)\s+maximum resident set size', errtext)
        timed_peak = int(m.group(1)) if m else None
        if timed_peak is None:
            reason = reason or 'MISSING_TIME_RSS'
        elif timed_peak > RSS_BYTES:
            reason = reason or 'TIME_REPORTED_RSS_LIMIT_EXCEEDED'
        text = stdout.read_text()
        expected_diag = 'proved that the proposition' in text and 'is false' in text
        unrelated = bool(re.search(r'unknown (?:module|namespace)|object file .*does not exist|failed to import|unknown identifier', text, re.I))
        accepted = reason is None and ((rc == 1 and expected_diag and not unrelated) if expected_failure else rc == 0)
        if not expected_failure:
            accepted = accepted and obj.is_file()
            accepted = accepted and not re.search(r'\bsorryAx\b|declaration uses .sorry.|\bpanic\b', text + errtext)
        entry = {'label': label, 'module': module, 'command': cmd, 'cwd': str(directory),
                 'started_utc': began.isoformat(), 'deadline_utc': (began + timedelta(seconds=WALL_SECONDS)).isoformat(),
                 'finished_utc': utc(), 'wall_seconds': time.monotonic() - start,
                 'wall_limit_seconds': WALL_SECONDS, 'rss_limit_bytes': RSS_BYTES,
                 'rss_scope': 'sampled aggregate owned process group and descendants; not an OS allocation guarantee',
                 'sample_interval_seconds': SAMPLE_SECONDS, 'rss_samples': samples,
                 'sampled_peak_RSS_bytes': peak, 'time_reported_max_RSS_bytes': timed_peak,
                 'lean_memory_setting_MiB': memory, 'threads': 1, 'returncode': rc,
                 'termination_reason': reason, 'expected_failure': expected_failure,
                 'expected_false_proposition_diagnostic': expected_diag if expected_failure else None,
                 'stdout': str(stdout.relative_to(self.output)), 'stderr': str(stderr.relative_to(self.output)),
                 'stdout_sha256': filehash(stdout), 'stderr_sha256': filehash(stderr),
                 'source_sha256': filehash(src), 'object_sha256': filehash(obj) if obj.is_file() else None,
                 'accepted': bool(accepted)}
        self.commands.append(entry)
        with (self.output / 'commands.jsonl').open('a') as out:
            out.write(json.dumps(entry, sort_keys=True) + '\n')
        write_json(self.logs / (label + '.json'), entry)
        require(accepted, 'Compiler outcome rejected: ' + label + '; see its fresh log/receipt')
        return text, entry


def audit_module(runner, directory, module, search_paths, declarations, output):
    audit = 'Audit' + module
    lines = [f'import {module}', 'set_option format.width 1000000', 'set_option pp.fullNames true',
             'set_option pp.universes true']
    for d in declarations:
        lines += ['#check ' + d['name'], '#print axioms ' + d['name']]
    (directory / (audit + '.lean')).write_text('\n'.join(lines) + '\n')
    text, command = runner.compile(directory, audit, search_paths, 'audit_' + module,
                                   memory=2200 if module == 'RoleWitness' else 1200)
    reports = {}
    for m in re.finditer(r"'([^']+)' (?:does not depend on any axioms|depends on axioms:\s*\[([^\]]*)\])", text):
        reports[m[1]] = [] if m[2] is None else [re.sub(r'\.\{[^}]*\}', '', v.strip()) for v in m[2].split(',') if v.strip()]
    inventory = []
    for d in declarations:
        name = d['name']
        require(name in reports, 'Missing transitive axiom report: ' + name)
        require(set(reports[name]) <= ALLOWED_AXIOMS, 'Unexpected axiom: ' + name)
        if name.endswith('.correct') or name.startswith('FourBranch.Negative.'):
            require(not reports[name], 'Finite/rejection declaration unexpectedly has axioms: ' + name)
        # pp.width is intentionally large; preserve any continuation lines verbatim.
        marker = re.search(r'^' + re.escape(name) + r'(?:\.\{[^\n]*?\})?\s*(?:\(|:)', text, re.M)
        require(marker is not None, 'Missing literal type: ' + name)
        next_axiom = re.search(r"^'" + re.escape(name) + r"' (?:does not depend|depends)", text[marker.start():], re.M)
        require(next_axiom is not None, 'Cannot delimit type: ' + name)
        literal_type = text[marker.start():marker.start() + next_axiom.start()].strip()
        inventory.append({**d, 'module': module, 'literal_type': literal_type,
                          'transitive_axioms': reports[name], 'audit_stdout': command['stdout']})
    write_json(output / ('declarations_' + module + '.json'), inventory)
    return inventory


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--lean', default='lean', help='Installed Lean binary or installed elan proxy')
    parser.add_argument('--mathlib-packages', required=True, type=Path,
                        help='Explicit existing package directory with pinned native compiled dependencies')
    args = parser.parse_args()
    require(platform.system() == 'Darwin', 'This publication replay requires the local Darwin host')
    require(sys.flags.optimize == 0, 'Python optimization must be disabled')
    repo, output, packages = args.repo.resolve(), args.output.resolve(), args.mathlib_packages.resolve()
    require(repo.is_dir() and packages.is_dir(), 'Missing repository or dependency directory')
    require(output != repo and repo not in output.parents, '--output must be outside the checkout')
    require(not output.exists(), '--output must be new; refusing stale receipts/objects')
    require(output != packages and packages not in output.parents, 'Output cannot be inside dependencies')
    source19 = repo / 'problems/TUZA-19/formal/four_branch_wke'
    source18 = repo / 'problems/TUZA-18/lean/RoleWitness.lean'
    manifest = repo / 'problems/TUZA-18/evidence/lean_lake_manifest.json'
    inputs = [source18, manifest, source19 / 'inputs/canonical_witnesses.json', source19 / 'generation.json']
    inputs += [source19 / (name + '.lean') for name in POSITIVE_MODULES + NEGATIVE_MODULES]
    require(all(p.is_file() and repo in p.resolve().parents for p in inputs), 'Missing public input or source escapes checkout')
    before = {str(p.relative_to(repo)): filehash(p) for p in inputs}
    require(before[str(source18.relative_to(repo))] == ROLE_HASH, 'RoleWitness source hash mismatch')
    for name, expected in FROZEN_WKE_SOURCES.items():
        require(filehash(source19 / name) == expected, 'Frozen WKE source hash mismatch: ' + name)
    pins = {p['name']: p['rev'] for p in json.loads(manifest.read_text())['packages']}
    require(pins == PINNED_PACKAGES, 'Public dependency manifest pin mismatch')
    git_before = repo_state(repo)
    dependency_before = package_state(packages)
    lean, compiler_resolution = installed_lean(args.lean)
    base_env = dict(os.environ, ELAN_TOOLCHAIN=TOOLCHAIN, LEAN_NUM_THREADS='1')
    base_env.pop('LEAN_PATH', None)
    version = read_command([str(lean), '--version'], env=base_env)
    require('version ' + LEAN_VERSION + ',' in version and LEAN_COMMIT in version and 'apple-darwin' in version,
            'Unexpected compiler version/commit/platform: ' + version)
    direct = {}
    for name in ['Powerset', 'Union']:
        stem = Path('Mathlib/Data/Finset') / name
        src = packages / 'mathlib' / stem.with_suffix('.lean')
        obj = packages / 'mathlib/.lake/build/lib/lean' / stem.with_suffix('.olean')
        require(src.is_file() and obj.is_file(), 'Missing direct compiled Mathlib import: ' + name)
        direct[name] = {'source_sha256': filehash(src), 'object_sha256': filehash(obj)}
    output.mkdir(parents=True)
    write_json(output / 'environment.json', {'created_utc': utc(), 'platform': platform.platform(),
               'python': sys.version, 'lean': str(lean), 'lean_version': version, 'lean_executable_sha256': filehash(lean),
               'toolchain': TOOLCHAIN, 'packages': dependency_before, 'direct_imports': direct,
               'dependency_scope': 'Existing pinned compiled dependencies reused; no cold rebuild or independent kernel implementation',
               'runner_sha256': filehash(__file__), 'compiler_resolution': compiler_resolution})
    write_json(output / 'source_before.json', {'files': before, 'repository': git_before})
    status = {'status': 'RUNNING', 'started_utc': utc(), 'all_size_formalization': False}
    write_json(output / 'verification.json', status)
    runner = None
    try:
        wke, role = output / 'wke', output / 'role'
        wke.mkdir(); role.mkdir(); (wke / 'inputs').mkdir()
        shutil.copyfile(source18, role / 'RoleWitness.lean')
        shutil.copyfile(manifest, role / 'lake-manifest.json')
        (role / 'lean-toolchain').write_text(TOOLCHAIN + '\n')
        shutil.copyfile(source19 / 'inputs/canonical_witnesses.json', wke / 'inputs/canonical_witnesses.json')
        for name in ['Core', 'Domain', 'Coverage', 'NegativeChecks'] + NEGATIVE_MODULES:
            shutil.copyfile(source19 / (name + '.lean'), wke / (name + '.lean'))
        correspondence_receipt = correspondence(source19, wke)
        write_json(output / 'source_correspondence.json', correspondence_receipt)
        modules = [(wke, name) for name in POSITIVE_MODULES] + [(role, 'RoleWitness')]
        declarations = {}
        for directory, name in modules:
            src = (directory / (name + '.lean')).read_text()
            require(not re.search(r'\b(?:sorry|admit|axiom|native_decide)\b', src), 'Forbidden accepted source token: ' + name)
            declarations[name] = named_declarations(src)
        theorem_count = sum(d['kind'] == 'theorem' for ds in declarations.values() for d in ds)
        require(theorem_count == 150, 'Unexpected accepted theorem inventory')
        write_json(output / 'declaration_source_inventory.json', declarations)
        runner = Runner(output, str(lean), base_env)
        role_paths = [role] + [packages / name / '.lake/build/lib/lean' for name in PINNED_PACKAGES if (packages / name / '.lake/build/lib/lean').is_dir()]
        all_declarations = []
        for i, name in enumerate(POSITIVE_MODULES):
            runner.compile(wke, name, [wke], 'build_' + name,
                           memory=2200 if name.startswith('Chunk') or name == 'Core' else 1200)
            all_declarations += audit_module(runner, wke, name, [wke], declarations[name], output)
            if i % 10 == 0 or i == len(POSITIVE_MODULES) - 1:
                print(json.dumps({'progress': 'accepted WKE module and declarations', 'module': name,
                                  'completed': i + 1, 'total': len(POSITIVE_MODULES)}), flush=True)
        negative = []
        for name in NEGATIVE_MODULES:
            _, receipt = runner.compile(wke, name, [wke], 'reject_' + name, expected_failure=True)
            negative.append(receipt)
        runner.compile(role, 'RoleWitness', role_paths, 'build_RoleWitness', memory=2200)
        all_declarations += audit_module(runner, role, 'RoleWitness', role_paths,
                                         declarations['RoleWitness'], output)
        write_json(output / 'declarations.json', all_declarations)
        after = {str(p.relative_to(repo)): filehash(p) for p in inputs}
        git_after = repo_state(repo)
        dependency_after = package_state(packages)
        require(before == after and git_before == git_after, 'Publication source/Git state changed')
        require(dependency_before == dependency_after, 'Dependency Git state changed')
        for name in direct:
            stem = Path('Mathlib/Data/Finset') / name
            src = packages / 'mathlib' / stem.with_suffix('.lean')
            obj = packages / 'mathlib/.lake/build/lib/lean' / stem.with_suffix('.olean')
            require(direct[name] == {'source_sha256': filehash(src), 'object_sha256': filehash(obj)},
                    'Direct dependency bytes changed')
        write_json(output / 'source_after.json', {'files': after, 'repository': git_after,
                                                 'selected_source_preservation': 'PASS',
                                                 'dependency_git_preservation': 'PASS'})
        objects = {str(p.relative_to(output)): filehash(p) for p in output.rglob('*.olean')}
        write_json(output / 'object_hashes.json', objects)
        status.update(status='PASS_FRESH_FINITE_FORMAL_REPLAY', finished_utc=utc(),
                      canonical_records=5375, separately_compiled_chunks=128,
                      accepted_source_modules=len(modules), accepted_named_theorems=theorem_count,
                      explicitly_named_source_declarations=len(all_declarations),
                      compiler_commands=len(runner.commands), negative_controls=len(negative),
                      all_commands_serial=True, one_thread_per_command=True,
                      per_command_seconds=WALL_SECONDS, observed_RSS_limit_bytes=RSS_BYTES,
                      maximum_sampled_RSS_bytes=max(r['sampled_peak_RSS_bytes'] for r in runner.commands),
                      maximum_time_reported_RSS_bytes=max(r['time_reported_max_RSS_bytes'] or 0 for r in runner.commands),
                      selected_source_preservation=True, dependency_git_preservation=True,
                      correspondence=correspondence_receipt,
                      scope='TUZA-18 fixed six-vertex role witness; TUZA-19 finite 5375-case WKE bundle, separate domain/schedule lemmas, explicit cross-file correspondence. No aggregate, all-size WKE theorem, common-vertex theorem, chain theorem, or core localization formalized.',
                      audit_scope='Every explicitly named top-level source def/abbrev/structure/theorem; compiler-generated helpers are covered transitively, not separately inventoried.',
                      trust_boundary='Installed standard Lean kernel and reused pinned compiled dependencies. Fresh project objects, not a cold dependency build or an independent kernel implementation.')
        write_json(output / 'verification.json', status)
        print(json.dumps(status, indent=2), flush=True)
    except BaseException as exc:
        status.update(status='FAIL_OR_INTERRUPTED', finished_utc=utc(), error=repr(exc),
                      compiler_commands=len(runner.commands) if runner else 0)
        write_json(output / 'verification.json', status)
        raise


if __name__ == '__main__':
    main()
