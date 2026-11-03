#!/usr/bin/env python3
"""Independent TUZA-15 finite audit, derived from proof Sections 0, 8, 10, 11.

No old generator/checker is read or imported. Only Python's standard library is
used. The input is untrusted JSON certificate DATA. Numerical claim counts are
observations, never acceptance criteria. Graph edges are unordered actual pairs;
mask bit i corresponds to itertools.combinations(range(6), 2)[i]. A permutation
maps OLD labels to NEW labels, including in the exhaustive coverage receipt.

The finite cone checks do not prove the imported minimality/codegree/robustness
lemmas or replace the symbolic proof for arbitrarily many outside vertices.
"""
import argparse
import copy
import hashlib
import itertools
import json
import platform
import resource
import sys
import time
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path

V6 = tuple(range(6))
PAIRS6 = tuple(itertools.combinations(V6, 2))
INDEX6 = {e: i for i, e in enumerate(PAIRS6)}
FULL6 = (1 << len(PAIRS6)) - 1

class Invalid(ValueError):
    pass

def need(test, message):
    if not test:
        raise Invalid(message)

def edge(a, b):
    need(a != b, 'loop is not an actual simple-graph edge')
    return (min(a, b), max(a, b))

def pairs(vertices):
    return set(itertools.combinations(sorted(vertices), 2))

def parse_edges(raw, n, name):
    need(isinstance(raw, list), name + ': expected edge list')
    result = set()
    for item in raw:
        need(isinstance(item, list) and len(item) == 2, name + ': malformed edge')
        need(all(type(x) is int and 0 <= x < n for x in item), name + ': bad endpoint')
        e = edge(*item)
        need(e not in result, name + ': duplicate edge')
        result.add(e)
    return result

def decode(mask):
    need(type(mask) is int and 0 <= mask <= FULL6, 'mask out of range')
    return {e for i, e in enumerate(PAIRS6) if (mask >> i) & 1}

def encode(E):
    need(E <= set(PAIRS6), 'encoding requires six labels')
    return sum(1 << INDEX6[e] for e in E)

def relabel(E, permutation):
    return {edge(permutation[a], permutation[b]) for a, b in E}

def degrees(E, vertices=V6):
    return {x: sum(x in e for e in E) for x in vertices}

def connected(E, vertices=V6):
    remaining = set(vertices)
    if not remaining:
        return True
    seen = {min(remaining)}
    frontier = list(seen)
    while frontier:
        x = frontier.pop()
        for a, b in E:
            if a == x and b not in seen:
                seen.add(b); frontier.append(b)
            if b == x and a not in seen:
                seen.add(a); frontier.append(a)
    return seen == remaining

def classify_input(E):
    ds = degrees(E)
    if min(ds.values()) < 2:
        return 'excluded_by_triangle_codegree'
    if not connected(E):
        return 'excluded_by_link_component_robustness'
    if max(degrees(set(PAIRS6) - E).values()) <= 1:
        return 'complement_is_matching_boundary'
    return 'certificate_domain'

def triangles(E, vertices):
    return [t for t in itertools.combinations(sorted(vertices), 3) if pairs(t) <= E]

def read_triangles(raw, E, vertices, packing=False, name='triangles'):
    need(isinstance(raw, list), name + ': expected list')
    result, used = [], set()
    allowed = set(vertices)
    for item in raw:
        need(isinstance(item, list) and len(item) == 3, name + ': malformed triple')
        need(all(type(x) is int and x in allowed for x in item), name + ': bad vertex')
        need(len(set(item)) == 3, name + ': repeated triangle vertex')
        t = tuple(sorted(item))
        te = pairs(t)
        need(te <= E, name + ': non-triangle')
        if packing:
            need(not (te & used), name + ': overlapping packed triangles')
        else:
            need(t not in result, name + ': duplicate triangle')
        used.update(te)
        result.append(t)
    return result

def packing_edges(P):
    return set().union(*(pairs(t) for t in P)) if P else set()

def check_packing(P, E, vertices, name='packing'):
    return read_triangles([list(t) for t in P], E, vertices, True, name)

def all_cliques(E, vertices, maxsize=5):
    for size in range(1, min(maxsize, len(vertices)) + 1):
        for C in itertools.combinations(sorted(vertices), size):
            if pairs(C) <= E:
                yield C

def is_star(E):
    if not E:
        return True
    return bool(set.intersection(*(set(e) for e in E)))

def check_footprint(D, J, vertices):
    need(D <= J, 'surviving footprint contains absent residual edge')
    checked, maximum = Counter(), 0
    for C in all_cliques(J, vertices):
        F = D & pairs(C)
        checked[len(C)] += 1
        maximum = max(maximum, len(F))
        if len(C) <= 4:
            need(is_star(F), 'nonstar K4 footprint: ' + repr((C, sorted(F))))
        need(len(F) <= 2, 'more than two edges in K5 footprint: ' + repr((C, sorted(F))))
    return {'cliques_by_size': dict(sorted(checked.items())), 'max_footprint_edges': maximum}

def components_of_triangles(T):
    remaining = set(T)
    result = []
    while remaining:
        seed = min(remaining)
        remaining.remove(seed)
        component, frontier = {seed}, [seed]
        while frontier:
            t = frontier.pop()
            adjacent = {s for s in remaining if pairs(t) & pairs(s)}
            remaining.difference_update(adjacent)
            component.update(adjacent)
            frontier.extend(adjacent)
        result.append(sorted(component))
    return result

def check_nonclique_witness(raw, J):
    T = read_triangles(raw, J, V6, False, 'residual witness')
    need(bool(T), 'empty residual witness')
    need(len(components_of_triangles(T)) == 1, 'residual witness not edge-sharing-connected')
    S = set().union(*(set(t) for t in T))
    missing = pairs(S) - J
    need(len(S) > 5 or bool(missing), 'residual witness vertices still lie in a clique of size at most five')
    full_components = components_of_triangles(triangles(J, V6))
    containing = [C for C in full_components if set(T) <= set(C)]
    need(len(containing) == 1, 'witness is not in exactly one actual residual triangle component')
    C = containing[0]
    support = packing_edges(C)
    vertices = set().union(*(set(t) for t in C))
    need(len(vertices) not in (4, 5) or support != pairs(vertices), 'actual residual support is a K4/K5')
    return {'witness_vertices': sorted(S), 'missing_pairs': sorted(missing),
            'actual_component_triangles': C, 'actual_component_support': sorted(support),
            'actual_component_vertices': sorted(vertices)}

def reduction(E, M, Q):
    need(M <= E, 'matching edge absent from H')
    endpoints = [x for e in M for x in e]
    need(len(endpoints) == len(set(endpoints)), 'matching has overlapping endpoints')
    need(M, 'empty matching reduction')
    need(len(Q) <= len(M), 'cover exceeds balanced budget')
    J = E - M
    need(all(set(e) & Q for e in J), 'Q does not cover H-M')
    spokes = {edge(x, 6) for x in V6}
    core = E | spokes
    deleted = M | spokes
    X = M | {edge(q, 6) for q in Q}
    P0 = [tuple(sorted((*e, 6))) for e in sorted(M)]
    check_packing(P0, core, range(7), 'deleted-edge packing')
    need(packing_edges(P0) <= deleted, 'baseline packing has surviving edge')
    residual_triangles = set(triangles(J, V6))
    lost = [t for t in triangles(core, range(7)) if t not in residual_triangles]
    need(all(pairs(t) & X for t in lost), 'X misses actual lost core triangle')
    # The only lost non-core triangles use M: a deleted spoke cannot reach
    # another link component by closedness. Such a page meets its M base in X.
    external_page_templates = [tuple((*e, 7)) for e in sorted(M)]
    need(all(pairs(t) & X for t in external_page_templates), 'X misses deleted-rim page')
    return J, core, {'r': len(M), 'M': sorted(M), 'Q': sorted(Q), 'X': sorted(X),
                     'baseline_packing': P0, 'lost_core_triangles': lost,
                     'external_lost_page_bases': sorted(M), 'strict_cover': len(Q) < len(M)}

def all_matchings(E, vertices):
    vertices = frozenset(vertices)
    if not vertices:
        yield frozenset()
        return
    x = min(vertices)
    rest = vertices - {x}
    yield from all_matchings(E, rest)
    for y in sorted(rest):
        e = edge(x, y)
        if e in E:
            for M in all_matchings(E, rest - {y}):
                yield M | {e}

def bipartition(E):
    colours = {0: 0}
    queue = [0]
    while queue:
        x = queue.pop()
        for a, b in E:
            if x not in (a, b):
                continue
            y = b if a == x else a
            if y not in colours:
                colours[y] = 1 - colours[x]; queue.append(y)
            else:
                need(colours[y] != colours[x], 'symbolic family is not bipartite')
    need(len(colours) == 6, 'symbolic bipartite graph not connected')
    return [sorted(x for x in V6 if colours[x] == c) for c in (0, 1)]

def check_bipartite_interface(E, family):
    sides = bipartition(E)
    sizes = sorted(map(len, sides))
    expected = {'K2,4': ([2, 4], 8), 'K3,3-minus-edge': ([3, 3], 8), 'K3,3': ([3, 3], 9)}
    need(family in expected, 'unknown bipartite family')
    need((sizes, len(E)) == expected[family], 'wrong bipartite symbolic family')
    need(min(degrees(E).values()) >= 2, 'BIP interface lacks minimum degree two')
    matchings = list(all_matchings(E, V6))
    r = max(map(len, matchings))
    maximum = sorted(set(M for M in matchings if len(M) == r), key=lambda M: sorted(M))
    need(len(maximum) >= 2, 'BIP alternate maximum matching missing')
    M, alternate = set(maximum[0]), set(maximum[1])
    f = min(M - alternate)
    covers = [set(Q) for Q in itertools.combinations(V6, r) if all(set(e) & set(Q) for e in E)]
    need(covers, 'BIP Konig-size vertex cover missing')
    Q = covers[0]
    J, core, base = reduction(E, M, Q)
    page = tuple((*f, 7))
    all_page_spokes = {edge(x, 7) for x in V6}
    P = [tuple((*e, 6)) for e in sorted(alternate)] + [page]
    check_packing(P, core | all_page_spokes, range(8), 'BIP page packing')
    model_residual = J | all_page_spokes
    D = packing_edges(P) & model_residual
    footprint = check_footprint(D, model_residual, (*V6, 7))
    return {'lemma': 'BIP, proof Section 8', 'bipartition': sides,
            'maximum_matching_size': r, 'number_of_maximum_matchings': len(maximum),
            'reduction': base, 'alternate_matching': sorted(alternate), 'page_base': f,
            'page_packing': P, 'model_surviving_footprint': sorted(D), 'footprint': footprint}

def sun_labelling(E):
    ds = degrees(E)
    centres = sorted(x for x in V6 if ds[x] == 4)
    ears = sorted(x for x in V6 if ds[x] == 2)
    need(len(centres) == len(ears) == 3, 'not a three-sun degree pattern')
    need(pairs(centres) <= E and not (pairs(ears) & E), 'not a three-sun centre/ear pattern')
    a, b, c = centres
    ear_for_pair = {}
    for x in ears:
        N = tuple(sorted(y for y in centres if edge(x, y) in E))
        need(len(N) == 2 and N not in ear_for_pair, 'three-sun ear neighborhood repeated or wrong')
        ear_for_pair[N] = x
    need(set(ear_for_pair) == pairs(centres), 'three-sun central pairs incomplete')
    x, y, z = (ear_for_pair[edge(a, b)], ear_for_pair[edge(b, c)], ear_for_pair[edge(c, a)])
    return a, b, c, x, y, z

def check_sun_interface(E):
    a, b, c, x, y, z = sun_labelling(E)
    M0 = {edge(a, z), edge(b, x), edge(c, y)}
    M1 = {edge(a, x), edge(b, y), edge(c, z)}
    J, core, base = reduction(E, M0, {a, b, c})
    need(J == pairs((a, b, c)) | M1, 'three-sun residual is not triangle plus pendant matching')
    spokes = {edge(t, 7) for t in V6}
    residual_model = J | spokes
    page_cases = []
    for f in sorted(M0):
        P = [tuple((*e, 6)) for e in sorted(M1)] + [tuple((*f, 7))]
        check_packing(P, core | spokes, range(8), 'three-sun page packing')
        D = packing_edges(P) & residual_model
        page_cases.append({'page_base': f, 'packing': P, 'surviving_footprint': sorted(D),
                           'footprint': check_footprint(D, residual_model, (*V6, 7))})
    Z = {edge(t, 6) for t in (a, b, c)} | pairs((a, b, c))
    lost = base['lost_core_triangles']
    need(all(pairs(t) & Z for t in lost), 'three-sun saving cover misses lost core triangle')
    need(tuple(sorted((a, b, c))) in triangles(J, V6), 'three-sun retained triangle absent')
    need(len(Z) - 1 < 2 * len(M0), 'three-sun retained-triangle saving not strict')
    return {'lemma': 'THREE-SUN, proof Section 10', 'labelling_abcxyz': [a,b,c,x,y,z],
            'reduction': base, 'page_cases': page_cases, 'no_external_page_cover': sorted(Z),
            'retained_triangle': sorted((a,b,c)), 'saving_increment_bound': len(Z)-1}

def check_record(record):
    need(isinstance(record, dict), 'record not a dictionary')
    E = parse_edges(record['edges'], 6, 'H edges')
    need(record['mask'] == encode(E), 'mask/edge encoding mismatch')
    need(classify_input(E) == 'certificate_domain', 'record outside mathematically derived certificate domain')
    cert = record['certificate']
    kind = cert['kind']
    out = {'mask': record['mask'], 'edges': sorted(E), 'kind': kind}
    if kind == 'symbolic_exception':
        permutation = cert['permutation']
        need(isinstance(permutation, list) and all(type(x) is int for x in permutation)
             and sorted(permutation) == list(V6), 'invalid symbolic permutation')
        labelled = relabel(E, permutation)
        family = cert['family']
        need(family in {'K2,4', 'K3,3-minus-edge', 'K3,3', 'three-sun'}, 'unknown symbolic family')
        out['family'] = family
        out['data_permutation_old_to_new'] = permutation
        if family == 'three-sun':
            out['symbolic_interface'] = check_sun_interface(labelled)
        else:
            out['symbolic_interface'] = check_bipartite_interface(labelled, family)
        return out
    M = parse_edges(cert['M'], 6, 'M')
    qraw = cert['Q']
    need(isinstance(qraw, list) and all(type(x) is int and x in V6 for x in qraw), 'invalid Q vertex')
    need(len(qraw) == len(set(qraw)), 'duplicate Q vertex')
    J, core, base = reduction(E, M, set(qraw))
    out['reduction'] = base
    if kind == 'local_gain':
        P = read_triangles(cert['packing'], core, range(7), True, 'gain packing')
        need(len(P) >= len(M) + 1, 'packing gain too small')
        D = packing_edges(P) & J
        out.update({'packing': P, 'entire_surviving_footprint': sorted(D),
                    'footprint': check_footprint(D, J, V6)})
    elif kind == 'residual_nonclique':
        out['nonclique'] = check_nonclique_witness(cert['triangles'], J)
    else:
        raise Invalid('unknown certificate kind')
    return out

def find_packing(E, vertices, k):
    T = triangles(E, vertices)
    def search(start, used, selected):
        if len(selected) == k:
            return selected
        if len(T) - start < k - len(selected):
            return None
        for i in range(start, len(T)):
            te = pairs(T[i])
            if not te & used:
                found = search(i+1, used | te, selected + [T[i]])
                if found is not None:
                    return found
        return None
    return search(0, set(), [])

def check_r6_boundary():
    # v=0, missing rim pairs 12 and 34, exactly as proof Section 1.
    vertices = tuple(range(7))
    B = pairs(vertices) - {(1,2), (3,4)}
    W = {1,2,3,4,5}
    R = (pairs(W) & B) | {(5,6)}
    deleted = {edge(0,x) for x in range(1,7)} | R
    K = B - deleted
    P0 = [(0,1,4),(0,2,3),(0,5,6),(1,3,5),(2,4,5)]
    check_packing(P0, B, vertices, 'R6 baseline')
    need(packing_edges(P0) <= deleted, 'R6 baseline uses surviving edge')
    X = R | {(0,6)}
    need(len(X) == 2*len(P0), 'R6 baseline is not balanced')
    need(all(pairs(t) & X for t in triangles(B,vertices)), 'R6 local lost cover misses triangle')
    need(K == {(1,6),(2,6),(3,6),(4,6)}, 'R6 surviving rim is not stated star')
    avoiding = {}
    for f in sorted(B):
        P = find_packing(B - {f}, vertices, 5)
        need(P is not None, 'R6 no five-packing avoiding edge ' + repr(f))
        check_packing(P, B-{f}, vertices, 'R6 edge-avoiding packing')
        avoiding[str(f)] = P
    outside_spokes = {edge(x,7) for x in range(1,7)}
    residual_model = K | outside_spokes
    pages = []
    for f in sorted(R):
        P = avoiding[str(f)] + [tuple((*f,7))]
        check_packing(P, B | outside_spokes, range(8), 'R6 external-page packing')
        D = packing_edges(P) & residual_model
        pages.append({'base': f, 'packing': P, 'entire_surviving_footprint': sorted(D),
                      'footprint': check_footprint(D, residual_model, range(1,8))})
    Z = {(0,1),(0,2),(3,5),(3,6),(4,5),(4,6),(5,6)}
    need(all(pairs(t)&Z for t in triangles(B,vertices)), 'R6 seven-edge core cover misses triangle')
    return {'lemma': 'R6, proof Section 1', 'R': sorted(R), 'baseline_packing': P0,
            'lost_core_cover': sorted(X), 'all_edge_avoidance_witnesses': avoiding,
            'external_page_interfaces': pages, 'no_external_page_cover': sorted(Z)}

def negative_controls(records):
    controls = []
    def rejects(name, fn, expected):
        try:
            fn()
        except Invalid as exc:
            message = str(exc)
            need(expected in message, 'negative control rejected for wrong reason: ' + name + ': ' + message)
            controls.append({'name': name, 'rejected': True, 'reason': message})
        else:
            raise Invalid('negative control accepted: ' + name)
    gain = next(r for r in records if r['certificate']['kind'] == 'local_gain')
    E = parse_edges(gain['edges'],6,'control H') | {edge(x,6) for x in V6}
    absent = next(t for t in itertools.combinations(range(7),3) if not pairs(t) <= E)
    bad = copy.deepcopy(gain); bad['certificate']['packing'][0] = list(absent)
    rejects('nontriangle_in_packing', lambda: check_record(bad), 'non-triangle')
    bad = copy.deepcopy(gain); bad['certificate']['packing'][1] = bad['certificate']['packing'][0]
    rejects('edge_overlap_in_packing', lambda: check_record(bad), 'overlapping packed triangles')
    bad = copy.deepcopy(gain); bad['certificate']['Q'] = []
    rejects('wrong_vertex_cover', lambda: check_record(bad), 'Q does not cover')
    bad = copy.deepcopy(gain); bad['certificate']['Q'] = list(V6)
    rejects('cover_above_budget', lambda: check_record(bad), 'cover exceeds balanced budget')
    bad = copy.deepcopy(gain); bad['mask'] ^= 1
    rejects('wrong_mask_encoding', lambda: check_record(bad), 'mask/edge encoding mismatch')
    original = parse_edges(gain['edges'],6,'control H')
    shared = next((a,b) for a,b in itertools.combinations(sorted(original),2) if set(a)&set(b))
    bad = copy.deepcopy(gain); bad['certificate']['M'] = [list(e) for e in shared]
    rejects('overlapping_matching', lambda: check_record(bad), 'matching has overlapping endpoints')
    rejects('disconnected_residual_witness',
            lambda: check_nonclique_witness([[0,1,2],[3,4,5]], pairs((0,1,2))|pairs((3,4,5))),
            'not edge-sharing-connected')
    rejects('clique_residual_witness', lambda: check_nonclique_witness([[0,1,2]], pairs((0,1,2))),
            'still lie in a clique')
    rejects('nonstar_K4_footprint', lambda: check_footprint({(0,1),(2,3)}, pairs(range(4)), range(4)),
            'nonstar K4 footprint')
    rejects('three_edge_star_in_K5', lambda: check_footprint({(0,1),(0,2),(0,3)}, pairs(range(5)), range(5)),
            'more than two edges')
    bad = copy.deepcopy(gain)
    bad['certificate'] = {'kind':'symbolic_exception','family':'three-sun','permutation':list(V6)}
    rejects('false_three_sun_label', lambda: check_record(bad), 'not a three-sun')
    return controls

def exhaustive_coverage(records):
    permutations = tuple(itertools.permutations(V6))
    ownership, orbit_results = {}, []
    for index, record in enumerate(records):
        E = parse_edges(record['edges'],6,'orbit representative')
        orbit = {}
        for p in permutations:
            image = relabel(E,p)
            mask = encode(image)
            # A separate decode check verifies the advertised old-to-new map.
            need(decode(mask) == {tuple(sorted((p[a],p[b]))) for a,b in E}, 'bad orbit relabelling')
            orbit.setdefault(mask,p)
        for mask,p in orbit.items():
            need(mask not in ownership, 'duplicate or overlapping certificate orbits')
            ownership[mask] = (index, record['mask'], p)
        orbit_results.append({'record_index':index,'representative_mask':record['mask'],
                              'orbit_size':len(orbit), 'automorphism_count':len(permutations)//len(orbit)})
    dispositions, eligible, boundary = Counter(), {}, {}
    for mask in range(1 << len(PAIRS6)):
        E = decode(mask)
        need(encode(E) == mask, 'mask encoding does not round-trip')
        kind = classify_input(E)
        dispositions[kind] += 1
        if kind == 'certificate_domain':
            need(mask in ownership, 'eligible labelled graph has no certificate orbit: ' + str(mask))
            index, representative, p = ownership[mask]
            need(relabel(parse_edges(records[index]['edges'],6,'mapped representative'),p) == E,
                 'advertised labelled graph map does not reconstruct graph')
            eligible[mask] = [representative,list(p)]
        elif kind == 'complement_is_matching_boundary':
            complement = set(PAIRS6) - E
            need(all(d <= 1 for d in degrees(complement).values()), 'boundary complement not a matching')
            size = len(complement)
            need(size in (0,1,2,3), 'boundary matching size impossible')
            boundary.setdefault(size,[]).append(mask)
    need(set(ownership) == set(eligible), 'certificate orbit contains an extra, ineligible input')
    # These are structural target shapes, not asserted orbit/count totals.
    target_shapes = {0: 'K6', 1: 'K6-minus-one-edge',
                     2: 'K6-minus-two-disjoint-edges; excluded by R6',
                     3: 'K6-minus-perfect-matching'}
    boundary_results = []
    for size,masks in sorted(boundary.items()):
        representative = min(masks)
        image_masks = {encode(relabel(decode(representative),p)) for p in permutations}
        need(set(masks) == image_masks, 'matching boundary size is not one complete orbit')
        boundary_results.append({'missing_matching_size':size, 'shape':target_shapes[size],
                                 'representative_mask':representative,'labelled_count':len(masks),
                                 'complement_edges':sorted(set(PAIRS6)-decode(representative))})
    need(set(boundary) == {0,1,2,3}, 'not all structurally possible matching boundaries represented')
    # A completeness negative control must expose an orbit removed from coverage.
    first = min(ownership)
    removed_representative = ownership[first][1]
    reduced = {m for m,(_,rep,_) in ownership.items() if rep != removed_representative}
    missing = set(eligible)-reduced
    need(missing, 'missing-orbit negative control failed')
    return {'labelled_graphs_enumerated':sum(dispositions.values()),
            'input_dispositions':dict(sorted(dispositions.items())),
            'certificate_orbits':orbit_results,'eligible_labelled_count':len(eligible),
            'eligible_labelled_maps_mask_to_representative_and_old_to_new':eligible,
            'boundary':boundary_results,
            'allowed_after_R6':['K6','K6-minus-one-edge','K6-minus-perfect-matching'],
            'missing_orbit_negative_control':{'removed_representative':removed_representative,
                                              'uncovered_graph_count':len(missing),'rejected':True}}

def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--certificate', required=True)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    start = time.perf_counter()
    data = json.loads(Path(args.certificate).read_text())
    need(isinstance(data,dict) and isinstance(data.get('records'),list), 'invalid certificate DATA shape')
    records = data['records']
    need(records, 'empty certificate DATA')
    validated = [check_record(r) for r in records]
    negative = negative_controls(records)
    r6 = check_r6_boundary()
    coverage = exhaustive_coverage(records)
    elapsed = time.perf_counter() - start
    rss = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    rss_bytes = rss if sys.platform == 'darwin' else rss*1024
    result = {'status':'PASS','created_utc':datetime.now(timezone.utc).isoformat(),
              'checker_sha256':sha256(__file__),'certificate_sha256':sha256(args.certificate),
              'python':sys.version,'platform':platform.platform(),
              'elapsed_seconds':elapsed,'peak_rss_bytes':rss_bytes,
              'encoding':{'vertices':list(V6),'hub':6,'generic_page_apex':7,
                          'edge_bits_low_to_high':PAIRS6,'permutation':'old label i maps to permutation[i]'},
              'counts_observed_not_acceptance_criteria':{
                  'representatives':len(records),'certificate_kinds':dict(Counter(r['kind'] for r in validated))},
              'validated_records':validated,'negative_controls':negative,'r6_boundary':r6,'coverage':coverage,
              'scope_limits':[
                  'Finite exact classification, not Lean verification.',
                  'Imported combined-minimal criticality, balanced accounting, codegree and robustness remain ordinary/published inputs.',
                  'Generic one-page clique models bound all selected footprints; arbitrary unselected outside vertices have no selected edges.',
                  'The unbounded BIP proof and the universal outside-attachment lifting are separately assessed in CERTIFICATE_INITIAL.md.',
                  'No conclusion about arbitrary finite graph equality follows from the finite JSON alone.']}
    output = Path(args.output)
    output.write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
    print(json.dumps({'status':'PASS','output':str(output),'elapsed_seconds':elapsed,
                      'peak_rss_bytes':rss_bytes,'representatives':len(records),
                      'eligible_labelled_count':coverage['eligible_labelled_count'],
                      'input_dispositions':coverage['input_dispositions'],
                      'negative_controls':len(negative)+1},sort_keys=True))

if __name__ == '__main__':
    main()
