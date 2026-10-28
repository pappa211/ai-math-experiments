#!/usr/bin/env python3
"""Verify pins and compile only TUZA modules, sequentially, with finite timeouts."""
import json
import os
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parent
os.chdir(ROOT)
OUT = ROOT / 'reproduction-output'
OUT.mkdir(exist_ok=True)
LOG = OUT / 'build.log'
EXPECTED_VERSION = '4.33.1'
EXPECTED_COMPILER = '819816b2e0a3bf405af45ae5c7af2491d8f5bee6'

def main():
    with LOG.open('w') as log:
        def run(args, timeout=120):
            result = subprocess.run(args, text=True, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT, timeout=timeout)
            print('$ ' + ' '.join(args), file=log)
            print(result.stdout, end='', file=log)
            log.flush()
            print(result.stdout, end='')
            if result.returncode:
                raise RuntimeError(f'{args[0]} exited {result.returncode}')
            return result.stdout

        version = run(['lake', 'env', 'lean', '--version'])
        if f'version {EXPECTED_VERSION}' not in version or EXPECTED_COMPILER not in version:
            raise RuntimeError('Unexpected Lean compiler')
        manifest = json.loads(Path('lake-manifest.json').read_text())
        for package in manifest['packages']:
            path = Path('.lake/packages') / package['name']
            actual = run(['git', '-C', str(path), 'rev-parse', 'HEAD']).strip()
            if actual != package['rev']:
                raise RuntimeError(f'Pin mismatch: {package["name"]}')
            if run(['git', '-C', str(path), 'status', '--porcelain', '--untracked-files=no']).strip():
                raise RuntimeError(f'Modified tracked dependency: {package["name"]}')
        forbidden = re.compile(r'\b(sorry|admit|axiom|unsafe|native_decide|sorryAx)\b')
        sources = [Path('Tuza.lean'), *sorted(Path('Tuza').glob('*.lean'))]
        for source in sources:
            if forbidden.search(source.read_text()):
                raise RuntimeError(f'Forbidden proof token: {source}')
        # The Lake environment provides pinned dependency paths. Our own outputs are
        # generated anew here and are never taken from the validation archive.
        output = Path('.lake/build/lib/lean')
        (output / 'Tuza').mkdir(parents=True, exist_ok=True)
        for name in ['Basic', 'Intersecting', 'Graph', 'Lifting', 'Coloring', 'OCT', 'Sanity']:
            run(['lake', 'env', 'lean', '-j', '1', '-o', str(output / 'Tuza' / (name + '.olean')),
                 'Tuza/' + name + '.lean'])
        audit = run(['lake', 'env', 'lean', '-j', '1', '-o', str(output / 'Tuza.olean'), 'Tuza.lean'])
        expected = ['Tuza.triangle_deletion', 'Tuza.oct_four', 'Tuza.graph_min_cover',
                    'Tuza.Sanity.K4_parameters', 'Tuza.Sanity.K5_parameters',
                    'Tuza.Sanity.C5_parameters', 'Tuza.Sanity.K5_not_four_colorable',
                    'Tuza.Sanity.K5_deletion_tripartite']
        allow = {'propext', 'Classical.choice', 'Quot.sound'}
        for name in expected:
            match = re.search(re.escape("'" + name + "'") + r' depends on axioms: \[([^\]]*)\]', audit)
            if not match or set(x.strip() for x in match[1].split(',')) - allow:
                raise RuntimeError(f'Missing or disallowed axiom report: {name}')
        print('PASS: pinned dependencies, project source scan, all modules and eight axiom audits.', file=log)
        print('PASS: pinned dependencies, project source scan, all modules and eight axiom audits.')
        print('External AharoniInput and HNSInput hypotheses remain mathematical obligations.')

if __name__ == '__main__':
    try:
        main()
    except (OSError, RuntimeError, subprocess.TimeoutExpired) as error:
        print(f'FAIL: {error}', file=sys.stderr)
        sys.exit(1)
