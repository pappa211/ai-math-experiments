#!/usr/bin/env python3
"""Bounded, independent semantic checks for the frozen star-packing proof.

No imports from producer code; no external data; exhaustive universes n <= 7.
This is supporting evidence, not a proof for arbitrary finite graphs.
"""
import collections
import hashlib
import itertools
import json
import pathlib
import sys
import time

START = time.time()
COUNTS = collections.Counter()
STRICT_LOCAL_EXAMPLES = []


def check(n, k, present, name=None):
    pairs = [(2*i+1, 2*i+2) for i in range(k)]
    edges = list(itertools.combinations(range(n), 2))
    bit = {e: 1 << q for q, e in enumerate(edges)}
    eb = lambda a, b: bit[tuple(sorted((a, b)))]
    tm = lambda t: sum(eb(a, b) for a, b in itertools.combinations(t, 2))
    graph = sum(bit[e] for e in present)
    ts = [(t, tm(t)) for t in itertools.combinations(range(n), 3)
          if tm(t) & graph == tm(t)]
    packed = [tm((0, a, b)) for a, b in pairs]
    B = sum(packed)
    assert B & graph == B

    def family(candidates, need, used=0, at=0):
        if not need:
            return []
        for q in range(at, len(candidates) - need + 1):
            t, mask = candidates[q]
            if mask & used:
                continue
            tail = family(candidates, need-1, used | mask, q+1)
            if tail is not None:
                return [(t, mask)] + tail
        return None

    augmentation = None
    for j in range(min(2, k) + 1):
        for removed in itertools.combinations(range(k), j):
            forbidden = B
            for i in removed:
                forbidden ^= packed[i]
            candidates = [x for x in ts if not x[1] & forbidden]
            witness = family(candidates, j+1)
            if witness is not None:
                assert len(witness) == j+1
                used = forbidden
                for _, mask in witness:
                    assert not mask & used
                    used |= mask
                augmentation = {'j': j, 'removed': list(removed),
                                'triangles': [list(t) for t, _ in witness]}
                break
        if augmentation is not None:
            COUNTS['augmentation_' + str(j)] += 1
            return {'name': name, 'outcome': 'augmentation', **augmentation}

    U = {x for p in pairs for x in p}
    W = {x for x in range(1, n) if eb(0, x) & graph and x not in U}
    bases = [eb(a, b) for a, b in pairs]
    tips = [set() for _ in pairs]
    for t, mask in ts:
        if 0 not in t:
            indices = [i for i, base in enumerate(bases) if mask & base]
            assert len(indices) == 1
            i = indices[0]
            tips[i].update(set(t) - set(pairs[i]))
    active = {i for i in range(k) if tips[i]}
    assert not any(eb(a, b) & graph for a, b in itertools.combinations(W, 2))
    outgoing = {i: None for i in active}
    centers = {}
    adjacency = {i: set() for i in active}

    def arc(i, j, center=None):
        assert outgoing[i] is None
        outgoing[i] = j
        centers[i] = center
        adjacency[i].add(j)
        adjacency[j].add(i)

    for i, j in itertools.combinations(sorted(active), 2):
        cross = [(a, b) for a in pairs[i] for b in pairs[j] if eb(a, b) & graph]
        if not cross:
            continue
        assert len(cross) in (2, 3, 4)
        if len(cross) == 2:
            left = {a for a, _ in cross}
            right = {b for _, b in cross}
            assert len(left) == 1 or len(right) == 1
            if len(right) == 1:
                center = next(iter(right))
                assert tips[i] == {center}
                arc(i, j, center)
            else:
                center = next(iter(left))
                assert tips[j] == {center}
                arc(j, i, center)
        else:
            assert tips[i] == {b for b in pairs[j] if all(eb(a, b) & graph for a in pairs[i])}
            assert tips[j] == {a for a in pairs[i] if all(eb(a, b) & graph for b in pairs[j])}
            arc(i, j)
            arc(j, i)

    terminal = {}
    for i in active:
        neighbors = {w for w in W if any(eb(a, w) & graph for a in pairs[i])}
        if neighbors:
            assert len(neighbors) == 1 and tips[i] == neighbors
            assert outgoing[i] is None
            terminal[i] = next(iter(neighbors))

    indegree = {i: sum(outgoing[j] == i for j in active) for i in active}
    queue = collections.deque(i for i in active if indegree[i] == 0 and outgoing[i] is not None)
    removed = []
    remaining = set(active)
    while queue:
        i = queue.popleft()
        remaining.remove(i)
        removed.append(i)
        j = outgoing[i]
        indegree[j] -= 1
        if indegree[j] == 0 and outgoing[j] is not None:
            queue.append(j)
    I = set()
    while remaining:
        first = min(remaining)
        component, todo = set(), [first]
        while todo:
            i = todo.pop()
            if i in component:
                continue
            component.add(i)
            todo.extend(adjacency[i] & remaining - component)
        remaining -= component
        if len(component) == 1:
            assert outgoing[first] is None
            I.update(pairs[first] if first in terminal else pairs[first][:1])
        elif len(component) == 2:
            assert all(outgoing[i] in component for i in component)
            I.update(pairs[first])
        else:
            for i in component:
                previous = [j for j in component if outgoing[j] == i]
                assert len(previous) == 1
                I.update(set(pairs[i]) - {centers[previous[0]]})
    for i in reversed(removed):
        center = centers[i]
        assert center is not None
        if center in I:
            I.remove(center)
            I.update(pairs[i])
        else:
            I.add(pairs[i][0])
    assert len(I) >= len(active) + len(terminal)
    assert not any(eb(a, b) & graph and eb(a, b) not in bases
                   for a, b in itertools.combinations(I, 2))

    # Compute ORIGINAL allowed edges directly from all actual K4s and private faces.
    allowed = B
    private_completions = []
    for i, (a, b) in enumerate(pairs):
        original = (0, a, b)
        for x in set(range(n)) - set(original):
            four = set(original) | {x}
            km = sum(eb(c, d) for c, d in itertools.combinations(sorted(four), 2))
            if km & graph != km:
                continue
            faces = [tm(t) for t in itertools.combinations(sorted(four), 3) if tuple(t) != original]
            if all((face & B).bit_count() == 1 and (face & B) & packed[i] == (face & B)
                   for face in faces):
                allowed |= km
                private_completions.append((i, x))
    W0 = set(terminal.values())
    C = sum(bases[i] for i in active)
    C |= sum(eb(0, x) for x in U - I)
    C |= sum(eb(0, w) for w in W0)
    assert C & ~allowed == 0
    assert C.bit_count() <= 2*k
    assert all(mask & C for _, mask in ts)
    assert all((i, w) in private_completions for i, w in terminal.items())
    outside_tips = {x for tipset in tips for x in tipset if not eb(0, x) & graph}
    endpoints_removed = sum(len(set(pairs[i]) - I) for i in terminal)
    COUNTS['cover_verified'] += 1
    COUNTS['covers_with_terminal'] += bool(terminal)
    COUNTS['covers_with_terminal_endpoint_removed'] += bool(endpoints_removed)
    COUNTS['covers_with_outside_neighborhood_old_tip'] += bool(outside_tips)
    COUNTS['covers_with_shared_terminal_tip'] += len(W0) < len(terminal)
    larger_packing = family(ts, k+1)
    nonmaximum = larger_packing is not None
    COUNTS['locally_stable_but_not_maximum'] += nonmaximum
    if nonmaximum and not STRICT_LOCAL_EXAMPLES:
        STRICT_LOCAL_EXAMPLES.append({
            'n': n, 'k': k, 'graph_edges': [list(e) for e in edges if bit[e] & graph],
            'star_packing': [[0, a, b] for a, b in pairs],
            'larger_packing': [list(t) for t, _ in larger_packing],
            'constructed_cover': [list(e) for e in edges if bit[e] & C],
            'small_augmentation_search': 'exhaustive for j = 0, 1, 2; none found'})
    return {'name': name, 'outcome': 'cover', 'n': n, 'k': k,
            'size': C.bit_count(), 'active': len(active), 'terminal': len(terminal),
            'independent_size': len(I), 'terminal_endpoints_removed': endpoints_removed,
            'outside_neighborhood_old_tips': sorted(outside_tips),
            'locally_stable_but_not_maximum': nonmaximum}


def fixed_edges(k):
    return {tuple(sorted(e)) for i in range(k)
            for e in [(0, 2*i+1), (0, 2*i+2), (2*i+1, 2*i+2)]}


universes = []
for n, k in [(5, 0), (6, 1), (7, 2), (7, 3)]:
    mandatory = fixed_edges(k)
    optional = [e for e in itertools.combinations(range(n), 2) if e not in mandatory]
    before = COUNTS.copy()
    for mask in range(1 << len(optional)):
        present = mandatory | {e for q, e in enumerate(optional) if mask >> q & 1}
        check(n, k, present)
    universes.append({'n': n, 'k': k, 'graphs': 1 << len(optional),
                      'results': dict(COUNTS - before)})

specials = []
def special(name, n, k, added):
    present = fixed_edges(k) | {tuple(sorted(e)) for e in added}
    result = check(n, k, present, name)
    specials.append(result)
    return result

for k in (4, 5):
    added = [(x, 2*((i+1) % k)+1) for i in range(k) for x in (2*i+1, 2*i+2)]
    assert special('directed_cycle_' + str(k), 2*k+1, k, added)['outcome'] == 'cover'
assert special('two_leaf_centers_at_private_K4_sink', 8, 3,
               [(0,7),(1,7),(2,7),(3,1),(4,1),(5,2),(6,2)])['terminal_endpoints_removed'] == 2
assert special('two_private_K4_sinks_share_tip', 6, 2,
               [(0,5),(1,5),(2,5),(3,5),(4,5)])['terminal'] == 2
assert special('outside_tip_and_inactive_unmatched_neighbor', 7, 2,
               [(1,5),(2,5),(1,3),(0,6),(3,6),(5,6)])['outcome'] == 'cover'
assert special('two_outside_neighborhood_tips', 7, 2,
               [(1,5),(2,5),(1,6),(2,6)])['outside_neighborhood_old_tips'] == [5,6]
assert special('three_edge_mutual_block_with_leaf', 7, 3,
               [(1,3),(1,4),(2,3),(5,2),(6,2)])['outcome'] == 'cover'
assert special('four_edge_mutual_block', 5, 2,
               [(1,3),(1,4),(2,3),(2,4)])['outcome'] == 'cover'
assert special('forbidden_single_interpair_edge', 7, 2,
               [(1,5),(2,5),(3,6),(4,6),(1,3)])['j'] == 2
assert special('unmatched_neighbor_different_tip', 5, 1,
               [(0,3),(1,3),(1,4),(2,4)])['j'] == 1

result = {'status': 'PASS', 'scope': 'bounded semantic supporting evidence only',
          'python': sys.version, 'exhaustive_universes': universes,
          'exhaustive_graph_count': sum(x['graphs'] for x in universes),
          'special_cases': specials, 'total_results': dict(COUNTS),
          'strict_local_examples': STRICT_LOCAL_EXAMPLES,
          'elapsed_seconds': round(time.time()-START, 6),
          'script_sha256': hashlib.sha256(pathlib.Path(__file__).read_bytes()).hexdigest()}
pathlib.Path('SCRATCH_OUTPUT/tuza18_star_fresh_verifier.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
