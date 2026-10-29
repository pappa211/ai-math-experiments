"""Independent exact verification of TUZA-03 recurrence certificates.

This verifier imports no search code. It regenerates the complete graph-triangle
family and checks every take/skip packing branch and every edge choice in each
cover branch. Named TUZA-02 witnesses are additionally checked by direct subset
enumeration. All output is written below TUZA-03/checks.
"""
from itertools import combinations
from pathlib import Path
import hashlib
import json
import time

ROOT = Path(__file__).resolve().parents[1]


def edge_set(vertices):
    return frozenset(combinations(sorted(vertices), 2))


def all_triangles(edges):
    vertices = sorted({v for e in edges for v in e})
    return tuple(t for t in combinations(vertices, 3) if edge_set(t) <= edges)


def valid_witnesses(edges, result, triangles=None):
    triangles = all_triangles(edges) if triangles is None else triangles
    ts = set(triangles)
    packing = [tuple(sorted(t)) for t in result['packing']]
    cover = {tuple(sorted(e)) for e in result['cover']}
    assert len(packing) == result['nu']
    assert len(cover) == result['tau'] and cover <= edges
    used = set()
    for t in packing:
        assert t in ts and not (used & edge_set(t))
        used.update(edge_set(t))
    assert all(cover & edge_set(t) for t in triangles)


def direct_optima(edges, result, triangles=None):
    triangles = all_triangles(edges) if triangles is None else triangles
    valid_witnesses(edges, result, triangles)
    masks = [edge_set(t) for t in triangles]
    for choice in combinations(masks, result['nu'] + 1):
        union = set().union(*choice)
        assert len(union) < 3 * len(choice), 'larger packing exists'
    active = sorted(set().union(*masks)) if masks else []
    # If a smaller cover exists, a cover of size tau-1 exists by padding.
    if result['tau']:
        for choice in combinations(active, result['tau'] - 1):
            cover = set(choice)
            assert not all(cover & t for t in masks), 'smaller cover exists'


def verify_recurrence(c):
    edges = {tuple(e) for e in c['edges']}
    ts = tuple(tuple(t) for t in c['triangles'])
    assert ts == all_triangles(edges), 'triangle list not the complete graph family'
    es = tuple(sorted(edges)); ei = {e: i for i, e in enumerate(es)}
    te = [tuple(ei[e] for e in combinations(t, 2)) for t in ts]
    hit = [sum(1 << j for j, t in enumerate(te) if i in t) for i in range(len(es))]
    conflicts = [hit[a] | hit[b] | hit[d] for a, b, d in te]
    pv = {0: 0}; cv = {0: 0}
    pn = {int(k): v for k, v in c['packing_nodes'].items()}
    cn = {int(k): v for k, v in c['cover_nodes'].items()}
    for r, (i, a, b, value) in sorted(pn.items(), key=lambda kv: kv[0].bit_count()):
        assert (r >> i) & 1
        assert a == r & ~(1 << i) and b == r & ~conflicts[i]
        assert value == max(pv[a], 1 + pv[b])
        pv[r] = value
    for r, (i, children, value) in sorted(cn.items(), key=lambda kv: kv[0].bit_count()):
        assert (r >> i) & 1
        assert children == [r & ~hit[e] for e in te[i]]
        assert value == 1 + min(cv[t] for t in children)
        cv[r] = value
    full = (1 << len(ts)) - 1
    return pv[full], cv[full], len(pn), len(cn), pv, hit, ei, full


def objects(value):
    if isinstance(value, dict):
        yield value
        for v in value.values():
            yield from objects(v)
    elif isinstance(value, list):
        for v in value:
            yield from objects(v)


def main():
    started = time.monotonic()
    prior = json.loads((ROOT / 'baseline/TUZA-02/checks/independent_certificates.json').read_text())
    prior_checks = []
    for s in prior['star_cores']:
        edges = {tuple(e) for e in s['edges']}
        direct_optima(edges, s)
        for d in s['deletion_packings']:
            reduced = edges - {tuple(d['deleted_edge'])}
            packing = [tuple(t) for t in d['packing']]
            assert len(packing) == s['nu']
            assert all(edge_set(t) <= reduced for t in packing)
            assert len(set().union(*(edge_set(t) for t in packing))) == 3 * s['nu']
        labels = {tuple(z[:2]): z[2] for z in s['edge_labels']}
        assert all({labels[e] for e in edge_set(t)} == {1, 2, 3} for t in all_triangles(edges))
        prior_checks.append({'star_leaves': s['leaves'], 'nu': s['nu'], 'tau': s['tau']})
    ex = prior['definition_counterexample']; ge = {tuple(e) for e in ex['edges']}
    he = ge - edge_set(ex['t1']) - edge_set(ex['t2'])
    for key, edges in [('H', he), ('G', ge)]:
        direct_optima(edges, ex[key])
    for key in ['full_F1', 'full_F2', 'individual_F1', 'individual_F2']:
        direct_optima(ge, ex[key], tuple(tuple(t) for t in ex[key]['triangles']))
    seen = set(); results = []
    for path in sorted(ROOT.rglob('*.json')):
        if path.parent.name in ('context', 'checks') or 'baseline' in path.relative_to(ROOT).parts:
            continue
        data = json.loads(path.read_text())
        for o in objects(data):
            if 'certificate' not in o:
                continue
            c = o['certificate']
            if not isinstance(c, dict) or 'packing_nodes' not in c:
                continue
            fingerprint = hashlib.sha256(json.dumps(c, sort_keys=True).encode()).hexdigest()
            if fingerprint in seen:
                continue
            seen.add(fingerprint)
            nu, tau, pnodes, cnodes, packing_values, hit, ei, full = verify_recurrence(c)
            edges = {tuple(e) for e in c['edges']}
            if 'H' in o:
                assert (nu, tau) == (o['H']['nu'], o['H']['tau'])
                valid_witnesses(edges, o['H'])
            if 'edge_labels' in o:
                labels = {tuple(z[:2]): z[2] for z in o['edge_labels']}
                assert set(labels) == edges
                assert len(set(labels.values())) <= 3
                assert all(len({labels[e] for e in edge_set(t)}) == 3 for t in all_triangles(edges))
            for d in o.get('deletion_packings', []):
                deleted = tuple(d['deleted_edge'])
                pp = [tuple(t) for t in d['packing']]
                assert d.get('nu', len(pp)) == len(pp)
                reduced_mask = full & ~hit[ei[deleted]]
                assert packing_values[reduced_mask] == len(pp)
                assert all(edge_set(t) <= edges - {deleted} for t in pp)
                assert len(set().union(*(edge_set(t) for t in pp))) == 3 * len(pp)
            results.append({'file': str(path.relative_to(ROOT)), 'certificate_sha256': fingerprint,
                            'nu': nu, 'tau': tau, 'packing_nodes': pnodes, 'cover_nodes': cnodes})
    out = {'status': 'PASS', 'method': 'independent full recurrence replay; prior named graphs direct subset enumeration',
           'prior_star_checks': prior_checks, 'prior_definition_example': 'PASS',
           'new_certificates_checked': len(results), 'certificates': results,
           'seconds': time.monotonic() - started}
    target = Path(__file__).with_name('certificate_verification.json')
    target.write_text(json.dumps(out, indent=2) + '\n')
    print(json.dumps({k: v for k, v in out.items() if k != 'certificates'}))


if __name__ == '__main__':
    main()
