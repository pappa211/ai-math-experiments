#!/usr/bin/env python3
"""Fresh TUZA-12 B checker. Standard library, full actual triangle families.
No discovery or reviewer code was read/imported in creating this checker.
Run: python checks/check_b.py --output evidence/check_b.json
"""
import argparse
import collections
import hashlib
import itertools as it
import json
import signal
import time
from functools import lru_cache


def edge(a, b):
    return tuple(sorted((a, b)))


def full_triangles(n, edges):
    return [t for t in it.combinations(range(n), 3)
            if all(e in edges for e in it.combinations(t, 2))]


def packing(triangle_edges):
    """Independent-set recurrence on the actual triangle conflict graph."""
    conflicts = [sum(1 << j for j, b in enumerate(triangle_edges) if a & b)
                 for a in triangle_edges]
    @lru_cache(None)
    def solve(remaining):
        if not remaining:
            return ()
        i = (remaining & -remaining).bit_length() - 1
        skip = solve(remaining ^ (1 << i))
        take = (i,) + solve(remaining & ~conflicts[i])
        return take if len(take) > len(skip) else skip
    return solve((1 << len(triangle_edges)) - 1)


def edge_cover(triangle_edges):
    labels = sorted(set().union(*triangle_edges)) if triangle_edges else []
    incidence = {e: sum(1 << i for i, t in enumerate(triangle_edges) if e in t)
                 for e in labels}
    @lru_cache(None)
    def solve(uncovered):
        if not uncovered:
            return ()
        i = (uncovered & -uncovered).bit_length() - 1
        choices = [(e,) + solve(uncovered & ~incidence[e])
                   for e in sorted(triangle_edges[i])]
        return min(choices, key=lambda c: (len(c), c))
    return solve((1 << len(triangle_edges)) - 1)


def claw_witness(triangle_edges):
    for i, center in enumerate(triangle_edges):
        nbr = [j for j, t in enumerate(triangle_edges) if j != i and t & center]
        for a, b, c in it.combinations(nbr, 3):
            if not (triangle_edges[a] & triangle_edges[b] or
                    triangle_edges[a] & triangle_edges[c] or
                    triangle_edges[b] & triangle_edges[c]):
                return [i, a, b, c]
    return None


def make_root(n, edges, triangles, triangle_edges):
    # Identify exceptional triangle-edge components directly, not by guessed pieces.
    unseen = set(range(len(triangles)))
    exceptions, removed = [], set()
    while unseen:
        seed = min(unseen)
        component, stack = {seed}, [seed]
        unseen.remove(seed)
        while stack:
            i = stack.pop()
            new = {j for j in unseen if triangle_edges[i] & triangle_edges[j]}
            unseen -= new
            component |= new
            stack.extend(new)
        support = set().union(*(triangle_edges[i] for i in component))
        verts = set().union(*(set(triangles[i]) for i in component))
        if len(verts) == 5 and len(support) in (9, 10):
            expected = set(full_triangles(n, support))
            assert expected == {triangles[i] for i in component}
            complement_root = {i: tuple(sorted(verts - set(triangles[i]))) for i in component}
            assert all(len(e) == 2 for e in complement_root.values())
            for i, j in it.combinations(sorted(component), 2):
                assert bool(triangle_edges[i] & triangle_edges[j]) == bool(set(complement_root[i]) & set(complement_root[j]))
            exceptions.append({'vertices': sorted(verts), 'edges': sorted(support),
                               'triangles': sorted(component),
                               'exceptional_line_root': sorted(complement_root.items()),
                               'type': 'K5' if len(support) == 10 else 'K5-e'})
            removed |= component
    # Every K5/e support really is isolated, including arbitrary external attachments.
    for verts in it.combinations(range(n), 5):
        supp = set(it.combinations(verts, 2)) & edges
        if len(supp) < 9:
            continue
        for t, te in zip(triangles, triangle_edges):
            assert not (te & supp) or set(t) <= set(verts)
    remaining_ids = [i for i in range(len(triangles)) if i not in removed]
    rt = [triangles[i] for i in remaining_ids]
    rte = [triangle_edges[i] for i in remaining_ids]
    used = set().union(*rte) if rte else set()
    k4s = [q for q in it.combinations(range(n), 4)
           if set(it.combinations(q, 2)) <= used]
    owner, ports, nodes, weights, node_edge = {}, {}, [], {}, {}
    def resource(e):
        key = ('edge',) + e
        if key not in weights:
            nodes.append(key)
            weights[key] = 1
            node_edge[key] = e
        return key
    for q in k4s:
        qset = set(q)
        faces = [i for i, t in enumerate(rt) if set(t) <= qset]
        assert len(faces) == 4
        assert all(i not in owner for i in faces), 'triangle in two residual K4s'
        for i in faces:
            owner[i] = q
        qe = set(it.combinations(q, 2))
        active = {e for e in qe if any(e in te and i not in faces for i, te in enumerate(rte))}
        assert len(active) <= 2
        assert all(set(e).isdisjoint(f) for e, f in it.combinations(active, 2))
        choices = [(e, f) for e, f in it.combinations(sorted(qe), 2)
                   if set(e).isdisjoint(f) and active <= {e, f}]
        assert choices
        ports[q] = min(choices)
        hub = ('hub',) + q
        nodes.append(hub)
        weights[hub] = 2
        for e in ports[q]:
            resource(e)
    counts = collections.Counter(e for te in rte for e in te)
    root_edges = []
    chosen = {}
    for i, (t, te) in enumerate(zip(rt, rte)):
        if i in owner:
            q = owner[i]
            ps = [e for e in ports[q] if e in te]
            assert len(ps) == 1
            endpoints = (('hub',) + q, resource(ps[0]))
        else:
            shared = {e for e in te if counts[e] > 1}
            assert len(shared) <= 2
            chosen[i] = tuple(sorted(shared | set(sorted(te - shared)[:2-len(shared)])))
            assert len(chosen[i]) == 2
            endpoints = tuple(resource(e) for e in chosen[i])
        assert endpoints[0] != endpoints[1]
        root_edges.append(endpoints)
    for i, j in it.combinations(range(len(rt)), 2):
        assert bool(rte[i] & rte[j]) == bool(set(root_edges[i]) & set(root_edges[j]))
    adjacency = {v: set() for v in nodes}
    for u, v in root_edges:
        adjacency[u].add(v)
        adjacency[v].add(u)
        assert not (weights[u] == weights[v] == 2)
    for u in nodes:
        for v in adjacency[u]:
            assert not (adjacency[u] & adjacency[v]), 'root triangle'
    # Independent local closed-conflict-neighborhood two-edge certificate.
    for i, te in enumerate(rte):
        cover = set(ports[owner[i]]) if i in owner else set(chosen[i])
        assert len(cover) == 2
        assert all(bool(cover & other) for other in rte if te & other)
    return {'triangles': rt, 'triangle_edges': rte, 'root_edges': root_edges,
            'nodes': nodes, 'weights': weights, 'node_edge': node_edge,
            'owner': owner, 'ports': ports, 'chosen': chosen, 'exceptions': exceptions,
            'all_triangle_ids': remaining_ids}


def root_optima(root):
    # Matching branches on root VERTICES, separately from triangle packing recurrence.
    nodes, re = root['nodes'], root['root_edges']
    ids = {v: i for i, v in enumerate(nodes)}
    adj = [set() for _ in nodes]
    for a, b in re:
        adj[ids[a]].add(ids[b])
        adj[ids[b]].add(ids[a])
    @lru_cache(None)
    def match(mask):
        if not mask:
            return 0
        a = (mask & -mask).bit_length() - 1
        rest = mask ^ (1 << a)
        return max([match(rest)] + [1+match(rest & ~(1 << b)) for b in adj[a] if rest >> b & 1])
    incident = {v: sum(1 << i for i, e in enumerate(re) if v in e) for v in nodes}
    @lru_cache(None)
    def vertex_cover(mask):
        if not mask:
            return (0, ())
        i = (mask & -mask).bit_length() - 1
        options = []
        for v in re[i]:
            cost, vs = vertex_cover(mask & ~incident[v])
            options.append((cost + root['weights'][v], (v,) + vs))
        return min(options)
    return match((1 << len(nodes))-1), vertex_cover((1 << len(re))-1)


def normalize(root, actual_cover):
    # All unchosen ordinary edges are truly private. K4 cross edges private to Q.
    cover = set(actual_cover)
    for i, pair in root['chosen'].items():
        unchosen = root['triangle_edges'][i] - set(pair)
        for e in unchosen & cover:
            assert sum(e in t for t in root['triangle_edges']) == 1
            cover.remove(e)
            cover.add(pair[0])
    vertices = {v for v, e in root['node_edge'].items() if e in cover}
    charged_cross_edges = set()
    for q, ps in root['ports'].items():
        cross = set(it.combinations(q, 2)) - set(ps)
        assert not (charged_cross_edges & cross)
        charged_cross_edges |= cross
        for e in cross:
            assert all(set(root['triangles'][i]) <= set(q)
                       for i, te in enumerate(root['triangle_edges']) if e in te)
        if not set(ps) <= cover:
            assert len(cross & cover) >= 2
            vertices.add(('hub',) + q)
    assert all(set(e) & vertices for e in root['root_edges'])
    cost = sum(root['weights'][v] for v in vertices)
    assert cost <= len(actual_cover)
    return vertices


def realize(root, vertices):
    actual = set()
    for v in vertices:
        if v[0] == 'hub':
            actual.update(root['ports'][v[1:]])
        else:
            actual.add(root['node_edge'][v])
    assert all(t & actual for t in root['triangle_edges'])
    assert len(actual) <= sum(root['weights'][v] for v in vertices)
    return actual


def audit(n, edges, exhaustive_normalization=False):
    triangles = full_triangles(n, edges)
    te = [set(it.combinations(t, 2)) for t in triangles]
    pack, cover = packing(te), edge_cover(te)
    claw = claw_witness(te)
    ans = {'n': n, 'edges': sorted(edges), 'triangles': triangles,
           'nu': len(pack), 'tau': len(cover), 'packing': [triangles[i] for i in pack],
           'cover': cover, 'claw_free': claw is None, 'claw': claw}
    if claw is not None:
        return ans
    root = make_root(n, edges, triangles, te)
    rp, rc = packing(root['triangle_edges']), edge_cover(root['triangle_edges'])
    mu, (vcw, vs) = root_optima(root)
    assert len(rp) == mu
    assert len(rc) == vcw
    assert vcw <= 2*mu
    normalize(root, rc)
    realize(root, vs)
    exnu = extau = 0
    for ex in root['exceptions']:
        et = [te[i] for i in ex['triangles']]
        ev = (len(packing(et)), len(edge_cover(et)))
        assert ev == ((2, 4) if ex['type'] == 'K5' else (2, 3))
        exnu += ev[0]
        extau += ev[1]
    assert len(pack) == mu+exnu and len(cover) == vcw+extau
    assert len(cover) <= 2*len(pack)
    ans['root'] = {'vertices': [(v, root['weights'][v]) for v in root['nodes']],
                   'edges_with_triangle_identity': list(zip(root['triangles'], root['root_edges'])),
                   'mu': mu, 'weighted_vc': vcw, 'cover_vertices': vs,
                   'realized_actual_cover': sorted(realize(root, vs)),
                   'normalized_minimum_actual_cover': sorted(normalize(root, rc)),
                   'exceptions': root['exceptions']}
    if exhaustive_normalization:
        labels = sorted(set().union(*root['triangle_edges'])) if root['triangle_edges'] else []
        tested = 0
        for mask in range(1 << len(labels)):
            ac = {e for j, e in enumerate(labels) if mask >> j & 1}
            if all(ac & t for t in root['triangle_edges']):
                normalize(root, ac)
                tested += 1
        ans['all_actual_cover_subsets_normalized'] = tested
        ans['all_edge_subsets_considered'] = 1 << len(labels)
        # Independently enumerate every root vertex set, validate realizations of covers.
        root_covers = 0
        for mask in range(1 << len(root['nodes'])):
            vs = {v for j, v in enumerate(root['nodes']) if mask >> j & 1}
            if all(vs & set(e) for e in root['root_edges']):
                realize(root, vs)
                root_covers += 1
        ans['all_weighted_root_covers_realized'] = root_covers
    return ans


def clique(vs):
    return set(it.combinations(vs, 2))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--output', required=True)
    args = ap.parse_args()
    signal.alarm(180)
    start = time.monotonic()
    all_edges = list(it.combinations(range(6), 2))
    counts = collections.Counter()
    histogram = collections.Counter()
    digest = hashlib.sha256()
    for mask in range(1 << 15):
        edges = {e for i, e in enumerate(all_edges) if mask >> i & 1}
        a = audit(6, edges)
        counts['graphs'] += 1
        counts['claw_free'] += a['claw_free']
        counts['nonempty_claw_free'] += a['claw_free'] and bool(a['triangles'])
        counts['tuza_violations'] += a['tau'] > 2*a['nu']
        if a['claw_free']:
            counts['claw_free_with_exception'] += bool(a['root']['exceptions'])
            counts['claw_free_with_hub'] += any(v[0][0] == 'hub' for v in a['root']['vertices'])
        histogram[str((a['nu'], a['tau'], a['claw_free']))] += 1
        digest.update(json.dumps([mask,a], sort_keys=True, separators=(',', ':')).encode())
    examples = {
        'empty': (0, set()), 'triangle_free_background': (5, {edge(i,i+1) for i in range(4)}),
        'triangle': (3, clique(range(3))), 'diamond': (4, clique(range(4))-{(2,3)}),
        'K4': (4, clique(range(4))), 'K5': (5, clique(range(5))),
        'K5_minus_e': (5, clique(range(5))-{(3,4)}),
        'K5_background_path': (7, clique(range(5))|{(4,5),(5,6)}),
        'opposite_K4_pages': (6, clique(range(4))|{(0,4),(1,4),(2,5),(3,5)}),
        'adjacent_K4_pages_negative': (6, clique(range(4))|{(0,4),(1,4),(0,5),(2,5)}),
        'three_support_edges_negative': (6, clique(range(3))|{(0,3),(1,3),(1,4),(2,4),(0,5),(2,5)}),
        'K4s_share_edge': (6, clique((0,1,2,3))|clique((0,1,4,5))),
        'K4s_share_vertex': (7, clique((0,1,2,3))|clique((0,4,5,6))),
        'K4_chain_three': (8, clique((0,1,2,3))|clique((2,3,4,5))|clique((4,5,6,7))),
        'ordinary_two_shared_edges': (5, clique((0,1,2))|clique((0,1,3))|clique((1,2,4))),
        'disjoint_triangles': (6, clique((0,1,2))|clique((3,4,5))),
    }
    targeted = {name: audit(n, es, exhaustive_normalization=True)
                for name, (n, es) in examples.items()}
    assert not targeted['adjacent_K4_pages_negative']['claw_free']
    assert not targeted['three_support_edges_negative']['claw_free']
    result = {'status': 'PASS', 'domain': 'all 32768 labelled simple graphs on six vertices, full actual triangles; 16 named controls',
              'counts': dict(counts), 'histogram': dict(histogram),
              'canonical_census_certificate_sha256': digest.hexdigest(),
              'checks': ['actual nu/tau for every graph', 'induced claw recognition',
                         'exception isolation and exact optima', 'residual K4 port structure',
                         'ordinary shared-edge bound', 'labelled pairwise line-graph identity',
                         'loopless root including parallel edges', 'triangle-free underlying root',
                         'independent weight-two hubs', 'separate root mu/weighted-vc optima',
                         'two-way optimum equality on every claw-free census graph',
                         'all actual covers normalized and all root covers realized on named positive controls',
                         'local two-edge closed-neighborhood covers'],
              'targeted': targeted, 'elapsed_seconds': time.monotonic()-start,
              'limitations': 'Finite checks only; universal proof is INDEPENDENT_PROOF_B.md. No random domain or huge enumeration implied.'}
    with open(args.output, 'w') as f:
        json.dump(result, f, indent=2)
        f.write('\n')
    print(json.dumps({k: result[k] for k in ['status','counts','elapsed_seconds','canonical_census_certificate_sha256']}))


if __name__ == '__main__':
    main()
