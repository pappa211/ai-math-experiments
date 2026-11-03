#!/usr/bin/env python3
"""Independent literal-certificate checks for TUZA-14 auxiliaries.

Authored by structural critic without reading/importing discovery solver code.
Standard library only. Inputs are literal witnesses; all graph triangles are
regenerated. Historical witness JSON is read-only; no old solver code, remote,
installation, or census is used.
"""
from functools import lru_cache
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json
import time

START = time.monotonic()
DEADLINE = START + 25.0
ROOT = Path(__file__).resolve().parents[1]


def bounded():
    if time.monotonic() > DEADLINE:
        raise TimeoutError('Independent auxiliary checker exceeded its 25s budget')


def pair(u, v):
    assert u != v
    return (min(u, v), max(u, v))


def graph(n, raw_edges):
    edges = tuple(sorted({pair(*e) for e in raw_edges}))
    assert all(0 <= u < v < n for u, v in edges)
    edge_set = set(edges)
    triangles = tuple(t for t in combinations(range(n), 3)
                      if all(pair(*e) in edge_set for e in combinations(t, 2)))
    edge_index = {e: i for i, e in enumerate(edges)}
    masks = tuple(sum(1 << edge_index[pair(*e)] for e in combinations(t, 2))
                  for t in triangles)
    return edges, triangles, masks, edge_index


def edge_mask(raw_edges, edge_index):
    return sum(1 << edge_index[pair(*e)] for e in set(map(tuple, raw_edges)))


def cover_analysis(edges, masks, maximum):
    hits = [sum(1 << j for j, t in enumerate(masks) if t & (1 << i))
            for i in range(len(edges))]
    full = (1 << len(masks)) - 1
    counts = []
    for size in range(maximum + 1):
        bounded()
        covers = []
        checked = 0
        for chosen in combinations(range(len(edges)), size):
            checked += 1
            hit = 0
            for i in chosen:
                hit |= hits[i]
            if hit == full:
                covers.append(tuple(edges[i] for i in chosen))
        counts.append({'size': size, 'tested': checked, 'covers': len(covers)})
        if covers:
            return {'tau': size, 'all_minimum_covers_count': len(covers),
                    'all_minimum_covers': covers, 'enumeration_counts': counts}
    raise AssertionError('No cover found within supplied upper bound')


def packing(triangles, masks, eligible_indices, edge_count, forced=()):
    chosen_forced = tuple(triangles.index(tuple(sorted(t))) for t in forced)
    assert len(set(chosen_forced)) == len(chosen_forced)
    used_forced = 0
    for i in chosen_forced:
        assert i in eligible_indices and not (used_forced & masks[i])
        used_forced |= masks[i]
    candidates = tuple(i for i in eligible_indices if not (masks[i] & used_forced))
    trials = []
    remaining_bound = (edge_count - used_forced.bit_count()) // 3
    for add_size in range(min(len(candidates), remaining_bound), -1, -1):
        bounded()
        tested = 0
        for add in combinations(candidates, add_size):
            tested += 1
            used = used_forced
            valid = True
            for i in add:
                if used & masks[i]:
                    valid = False
                    break
                used |= masks[i]
            if valid:
                trials.append({'total_size': len(chosen_forced) + add_size,
                               'tested': tested, 'found': True})
                result = chosen_forced + add
                return {'k': len(result), 'packing': [triangles[i] for i in result],
                        'size_trials_descending': trials}
        trials.append({'total_size': len(chosen_forced) + add_size,
                       'tested': tested, 'found': False})
    raise AssertionError('Empty packing should always exist')


def verify_packing_literal(raw, triangles, masks, allowed):
    chosen = [triangles.index(tuple(sorted(t))) for t in raw]
    used = 0
    for i in chosen:
        assert i in allowed
        assert not (used & masks[i])
        used |= masks[i]
    return len(chosen)


def read_witness(name):
    path = ROOT / 'witnesses' / name
    raw = path.read_bytes()
    return json.loads(raw), {'path': str(path), 'sha256': sha256(raw).hexdigest()}


def check_a3():
    witness, source = read_witness('track_a_unique_prepacking.json')
    built = set(combinations((1, 2, 3, 4, 7), 2))
    built.update(combinations((0, 5, 7, 8), 2))
    for t in ((2, 4, 6), (4, 6, 8), (4, 7, 8)):
        built.update(combinations(t, 2))
    assert built == set(map(tuple, witness['edges']))
    edges, triangles, masks, index = graph(9, built)
    cover = tuple(sorted(map(tuple, witness['cover'])))
    cmask = edge_mask(cover, index)
    assert all(t & cmask for t in masks)
    red_counts = tuple((t & cmask).bit_count() for t in masks)
    eligible = tuple(i for i, r in enumerate(red_counts) if r in (1, 2))
    private = {str(e): [triangles[i] for i, t in enumerate(masks)
                       if t & cmask == 1 << index[e]] for e in cover}
    unique = {e: ts for e, ts in private.items() if len(ts) == 1}
    assert unique == {'(4, 6)': [(4, 6, 8)]}
    solved_cover = cover_analysis(edges, masks, len(cover))
    solved_pack = packing(triangles, masks, eligible, len(edges))
    solved_forced = packing(triangles, masks, eligible, len(edges), ((4, 6, 8),))
    assert (solved_cover['tau'], solved_pack['k'], solved_forced['k']) == (7, 5, 4)
    assert verify_packing_literal(witness['eligible_packing'], triangles, masks, eligible) == 5
    assert verify_packing_literal(witness['forced_packing'], triangles, masks, eligible) == 4
    k5 = {t for t in triangles if set(t) <= {1, 2, 3, 4, 7}}
    k4 = {t for t in triangles if set(t) <= {0, 5, 7, 8}}
    outside = set(triangles) - k5 - k4
    assert outside == {(2, 4, 6), (4, 6, 8), (4, 7, 8)}
    assert len(k5) == 10 and len(k4) == 4
    return {'source': source, 'n': 9, 'edges': edges, 'triangles': triangles,
            'cover': cover, 'red_counts': dict(zip(map(str, triangles), red_counts)),
            'private_witnesses': private, 'unique_private_witnesses': unique,
            'minimum_cover_check': solved_cover, 'eligible_packing_check': solved_pack,
            'forced_unique_packing_check': solved_forced,
            'verdict': 'A3_REFUTED_EXACT_AUXILIARY_ONLY'}


def check_central_pages():
    center = ((0, 1), (0, 2), (1, 2))
    built = set(center)
    for (u, v), leaves in zip(center, ((3, 4), (5, 6), (7, 8))):
        for w in leaves:
            built.add(pair(u, w))
            built.add(pair(v, w))
    edges, triangles, masks, index = graph(9, built)
    cmask = edge_mask(center, index)
    red_counts = tuple((t & cmask).bit_count() for t in masks)
    eligible = tuple(i for i, r in enumerate(red_counts) if r in (1, 2))
    solved_cover = cover_analysis(edges, masks, 3)
    solved_pack = packing(triangles, masks, eligible, len(edges))
    assert len(edges) == 15 and len(triangles) == 7
    assert solved_cover['tau'] == solved_pack['k'] == 3
    assert solved_cover['all_minimum_covers'] == [center]
    assert [triangles[i] for i, r in enumerate(red_counts) if r == 3] == [(0, 1, 2)]
    return {'n': 9, 'edges': edges, 'triangles': triangles, 'cover': center,
            'minimum_cover_check': solved_cover, 'eligible_packing_check': solved_pack,
            'verdict': 'UNIQUE_OPTIMUM_WITH_ALL_RED_TRIANGLE_CONFIRMED'}


def exact_independence_number(n, edges):
    neighbors = [0] * n
    for u, v in edges:
        neighbors[u] |= 1 << v
        neighbors[v] |= 1 << u
    @lru_cache(None)
    def solve(available):
        if not available:
            return ()
        vbit = available & -available
        v = vbit.bit_length() - 1
        remaining = available ^ vbit
        without = solve(remaining)
        with_v = (v,) + solve(remaining & ~neighbors[v])
        return with_v if len(with_v) > len(without) else without
    witness = solve((1 << n) - 1)
    bounded()
    return {'alpha': len(witness), 'independent_set': witness,
            'method': 'fresh vertex include/exclude DP on actual base adjacency',
            'cached_states': solve.cache_info().currsize}


def check_a4():
    witness, source = read_witness('track_a_private_multiplicity_two.json')
    edges, triangles, masks, index = graph(witness['n'], witness['edges'])
    base_edges = tuple(e for e in edges if 21 not in e)
    assert base_edges == tuple(sorted(map(tuple, witness['base_edges'])))
    assert set(edges) - set(base_edges) == {(v, 21) for v in range(21)}
    be, bt, bm, bi = graph(21, base_edges)
    assert bt == ()
    pairs = tuple(combinations(range(6), 2))
    incidence = {pair(v, 6+i) for i, p in enumerate(pairs) for v in p}
    qedges = set(base_edges) - incidence
    assert len(incidence) == len(qedges) == 30
    assert all(u >= 6 and v >= 6 and set(pairs[u-6]).isdisjoint(pairs[v-6])
               for u, v in qedges)
    assert set(triangles) == {tuple(sorted((u, v, 21))) for u, v in base_edges}
    cover = tuple(sorted(map(tuple, witness['cover'])))
    assert cover == tuple((v, 21) for v in range(6, 21))
    cmask = edge_mask(cover, index)
    red_counts = tuple((t & cmask).bit_count() for t in masks)
    assert set(red_counts) == {1, 2}
    private = tuple(i for i, r in enumerate(red_counts) if r == 1)
    eligible = tuple(range(len(triangles)))
    multiplicities = [sum(t & cmask == 1 << index[e] for t in masks) for e in cover]
    assert multiplicities == [2] * 15
    independence = exact_independence_number(21, base_edges)
    assert independence['alpha'] == 6
    private_witness_size = verify_packing_literal(witness['private_packing'], triangles, masks, private)
    eligible_witness_size = verify_packing_literal(witness['eligible_packing'], triangles, masks, eligible)
    assert private_witness_size == 6 and eligible_witness_size == 10
    private_spokes = {index[(v, 21)] for v in range(6)}
    assert all(sum(bool(masks[i] & (1 << j)) for j in private_spokes) == 1 for i in private)
    all_spokes = {index[(v, 21)] for v in range(21)}
    assert all(sum(bool(m & (1 << j)) for j in all_spokes) == 2 for m in masks)
    tau = 21 - independence['alpha']
    assert tau == len(cover) == 15
    return {'source': source, 'n': 22, 'edge_count': len(edges), 'edges': edges,
            'triangles': triangles, 'base_triangle_count': len(bt),
            'base_independence_check': independence, 'cover': cover,
            'tau_from_trianglefree_cone_identity': tau,
            'private_multiplicities': multiplicities,
            'private_k': 6, 'private_packing': witness['private_packing'],
            'private_upper_certificate': 'Every private triangle uses one of six distinct I spokes',
            'eligible_k': 10, 'eligible_packing': witness['eligible_packing'],
            'eligible_upper_certificate': 'Every triangle uses two of the 21 cone spokes',
            'verdict': 'A4_REFUTED_EXACT_AUXILIARY_ONLY; S_AND_E_NOT_REFUTED'}



def check_a4_reduced():
    witness, source = read_witness('track_a_private_multiplicity_two_reduced.json')
    original, original_source = read_witness('track_a_private_multiplicity_two.json')
    kept = [v for v in range(22) if v not in {6, 7}]
    renumber = {v: i for i, v in enumerate(kept)}
    assert {int(k): v for k, v in witness['old_to_new'].items()} == renumber
    derived = {pair(renumber[u], renumber[v]) for u, v in original['edges']
               if u in renumber and v in renumber}
    assert derived == set(map(tuple, witness['edges']))
    edges, triangles, masks, index = graph(20, derived)
    base_edges = tuple(e for e in edges if 19 not in e)
    assert base_edges == tuple(sorted(map(tuple, witness['base_edges'])))
    assert set(edges) - set(base_edges) == {(v, 19) for v in range(19)}
    assert graph(19, base_edges)[1] == ()
    assert set(triangles) == {tuple(sorted((u, v, 19))) for u, v in base_edges}
    cover = tuple(sorted(map(tuple, witness['cover'])))
    assert cover == tuple((v, 19) for v in range(6, 19))
    cmask = edge_mask(cover, index)
    red_counts = tuple((t & cmask).bit_count() for t in masks)
    assert set(red_counts) == {1, 2}
    private = tuple(i for i, r in enumerate(red_counts) if r == 1)
    eligible = tuple(range(len(triangles)))
    multiplicities = [sum(t & cmask == 1 << index[e] for t in masks) for e in cover]
    assert multiplicities == [2] * 13
    independence = exact_independence_number(19, base_edges)
    assert independence['alpha'] == 6
    assert verify_packing_literal(witness['private_packing'], triangles, masks, private) == 6
    assert verify_packing_literal(witness['eligible_packing'], triangles, masks, eligible) == 9
    six_spokes = {index[(v, 19)] for v in range(6)}
    all_spokes = {index[(v, 19)] for v in range(19)}
    assert all(sum(bool(masks[i] & (1 << j)) for j in six_spokes) == 1 for i in private)
    assert all(sum(bool(m & (1 << j)) for j in all_spokes) == 2 for m in masks)
    assert 19 - independence['alpha'] == len(cover) == 13
    return {'source': source, 'original_source': original_source,
            'induced_restriction_confirmed': True, 'deleted_original_vertices': [6, 7],
            'n': 20, 'edge_count': len(edges), 'edges': edges, 'triangles': triangles,
            'base_independence_check': independence, 'cover': cover,
            'tau_from_trianglefree_cone_identity': 13, 'private_multiplicities': multiplicities,
            'private_k': 6, 'private_packing': witness['private_packing'],
            'eligible_k': 9, 'eligible_packing': witness['eligible_packing'],
            'upper_certificates': ['Each private triangle uses one of six I spokes',
                                   'Each actual triangle uses two of 19 cone spokes'],
            'verdict': 'A4_REFUTED_EXACT_AUXILIARY_ONLY; S_AND_E_NOT_REFUTED'}



def check_b5_star_optimal():
    edges, triangles, masks, index = graph(5, combinations(range(5), 2))
    cover = ((0, 1), (0, 4), (1, 2), (2, 3), (3, 4))
    cmask = edge_mask(cover, index)
    assert all(1 <= (m & cmask).bit_count() <= 2 for m in masks)
    solved_cover = cover_analysis(edges, masks, 4)
    solved_pack = packing(triangles, masks, tuple(range(len(triangles))), len(edges))
    assert solved_cover['tau'] == 4 and solved_pack['k'] == 2
    stars = []
    for v in range(5):
        vertices = tuple(u for u in range(5) if u != v)
        constraints = tuple((x, y) for x, y in combinations(vertices, 2)
                            if (x, y) not in cover)
        minimum = None
        for size in range(5):
            covers = [q for q in combinations(vertices, size)
                      if all(x in q or y in q for x, y in constraints)]
            if covers:
                minimum = size
                break
        red_neighbors = tuple(u for u in vertices if pair(u, v) in cover)
        assert len(constraints) == 3 and minimum == len(red_neighbors) == 2
        stars.append({'vertex': v, 'auxiliary_edges': constraints,
                      'minimum_vertex_cover_size': minimum, 'red_neighbors': red_neighbors})
    improved = ((0, 3), (0, 4), (1, 2), (3, 4))
    imask = edge_mask(improved, index)
    assert all(m & imask for m in masks)
    return {'n': 5, 'edges': edges, 'triangles': triangles, 'cover': cover,
            'global_cover_check': solved_cover, 'eligible_packing_check': solved_pack,
            'star_checks': stars, 'smaller_cover': improved,
            'verdict': 'STAR_LOCAL_RELAXATION_REFUTED; DESIGNATED_C_NOT_GLOBALLY_MINIMUM'}



def check_b1_k7():
    edges, triangles, masks, index = graph(7, combinations(range(7), 2))
    full_packing = ((0,1,2), (0,3,4), (0,5,6), (1,3,5), (1,4,6), (2,3,6), (2,4,5))
    assert verify_packing_literal(full_packing, triangles, masks, tuple(range(35))) == 7
    template = ((0,1,3), (1,2,4), (0,2,5), (0,4,6), (1,5,6), (2,3,6))
    records=[]
    for a in combinations(range(7),3):
        b=tuple(v for v in range(7) if v not in a)
        cover=tuple(sorted(set(combinations(a,2)) | set(combinations(b,2))))
        cmask=edge_mask(cover,index)
        assert len(cover)==9 and all(m & cmask for m in masks)
        eligible=tuple(i for i,m in enumerate(masks) if 1 <= (m & cmask).bit_count() <= 2)
        assert len(eligible)==30
        assert all((masks[i] & cmask).bit_count()==1 for i in eligible)
        relabel=a+b
        witness=tuple(tuple(sorted(relabel[v] for v in t)) for t in template)
        assert verify_packing_literal(witness,triangles,masks,eligible)==6
        assert len(edges)-len(cover)==12
        records.append({'part_size_three':a,'cover':cover,'eligible_six_packing':witness})
    assert len(records)==35
    return {'n':7,'edges':edges,'triangles':triangles,'full_k':7,
            'full_packing':full_packing,'partition_cover_records':records,
            'tau':9,'every_minimum_cover_eligible_k':6,
            'lower_bound_and_completeness_scope':
                'Ordinary proof: trianglefree complement m<=d(7-d)<=12; equality forces K3,4',
            'eligible_upper_scope':'Each eligible triangle uses two of12blue edges',
            'verdict':'FULL_PACKING_COMPATIBILITY_REFUTED_AUXILIARY_ONLY'}



def check_b9_unique_deletion():
    path=ROOT/'evidence'/'track_b_unique_deletion_refutation.json'
    raw=path.read_bytes()
    witness=json.loads(raw)
    source={'path':str(path),'sha256':sha256(raw).hexdigest()}
    old_path=ROOT.parent/'TUZA-13'/'witnesses'/'theory_tau_drop.json'
    old_raw=old_path.read_bytes()
    old=json.loads(old_raw)
    assert set(map(tuple,witness['edges']))==set(map(tuple,old['input']['edges']))
    edges,triangles,masks,index=graph(9,witness['edges'])
    assert len(edges)==21 and len(triangles)==16
    assert triangles==tuple(map(tuple,witness['triangles']))
    c=tuple(sorted(map(tuple,witness['unique_witness_optimum_C'])))
    d=tuple(sorted(map(tuple,witness['all_red_optimum_D'])))
    f=tuple(sorted(map(tuple,witness['almost_cover_F'])))
    q=(1,2,5)
    qedges=set(combinations(q,2))
    cmask=edge_mask(c,index)
    dmask=edge_mask(d,index)
    fmask=edge_mask(f,index)
    assert len(c)==len(d)==7 and len(f)==6
    assert all(t & cmask for t in masks) and all(t & dmask for t in masks)
    assert [triangles[i] for i,t in enumerate(masks) if not (t & fmask)]==[q]
    assert set(c)==set(f)|{(1,2)} and qedges<=set(d)
    assert [triangles[i] for i,t in enumerate(masks) if t & cmask==1<<index[(1,2)]]==[q]
    solved=cover_analysis(edges,masks,7)
    assert solved['tau']==7
    eligible=tuple(i for i,t in enumerate(masks) if 1 <= (t & cmask).bit_count() <= 2)
    assert len(eligible)==len(triangles)
    solved_pack=packing(triangles,masks,eligible,len(edges))
    assert solved_pack['k']==6
    assert verify_packing_literal(witness['eligible_packing_C'],triangles,masks,eligible)==6
    re,rt,rm,ri=graph(9,set(edges)-qedges)
    residual_cover=tuple(sorted(set(d)-qedges))
    assert residual_cover==tuple(sorted(map(tuple,witness['residual_cover'])))
    assert len(residual_cover)==4 and all(t & edge_mask(residual_cover,ri) for t in rm)
    residual_solved=cover_analysis(re,rm,4)
    assert residual_solved['tau']==4
    residual_pack=((0,1,3),(0,2,8),(0,4,7),(2,3,6))
    assert verify_packing_literal(residual_pack,rt,rm,tuple(range(len(rt))))==4
    return {'source':source,'historical_source':{'path':str(old_path),'sha256':sha256(old_raw).hexdigest()},
            'historical_graph_identity_confirmed':True,'n':9,'edges':edges,'triangles':triangles,
            'C':c,'D':d,'F':f,'unique_private_edge':(1,2),'Q':q,
            'minimum_cover_check':solved,'eligible_packing_check_C':solved_pack,
            'residual_edges':re,'residual_triangles':rt,'residual_cover':residual_cover,
            'residual_cover_check':residual_solved,'residual_four_packing':residual_pack,
            'tau_drop':3,'verdict':'B9_REFUTED_EXACT_AUXILIARY_ONLY; REINTERPRETATION_OF_TUZA13_GRAPH'}


def main():
    result = {'scope': 'Seven named literal auxiliary certificates; no graph census',
              'independence': 'No discovery solver code read or imported',
              'A3': check_a3(), 'central_pages': check_central_pages(), 'A4': check_a4(),
              'A4_reduced': check_a4_reduced(), 'B5_star_optimal': check_b5_star_optimal(),
              'B1_K7': check_b1_k7(), 'B9_unique_deletion': check_b9_unique_deletion(),
              'elapsed_seconds': time.monotonic() - START,
              'status': 'PASS'}
    bounded()
    destination = ROOT / 'evidence' / 'independent_auxiliary.json'
    destination.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'elapsed_seconds': result['elapsed_seconds'],
                      'A3': [result['A3']['minimum_cover_check']['tau'],
                             result['A3']['eligible_packing_check']['k'],
                             result['A3']['forced_unique_packing_check']['k']],
                      'central_pages': [3, 3, 1], 'A4': [15, 6, 10], 'A4_reduced': [13, 6, 9],
                      'B5': [5, 4, 2], 'B1': [9, 6, 7, 35], 'B9': [7, 4, 6],
                      'output': str(destination)}))


if __name__ == '__main__':
    main()
