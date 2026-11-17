#!/usr/bin/env python3
"""Independent definition-based verifier for the frozen four-K5 ring.

Standard library only. Never imports or executes the discovery checker.
The certificate supplies lower-bound witnesses; all graph predicates, local
extremal bounds, deletion coverage, coboundary maps and ranks are rebuilt here.
"""
from collections import Counter
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path
import hashlib
import json
import os
import platform
import pwd
import resource
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
START = time.monotonic()


def require(condition, description):
    if not condition:
        raise ValueError(description)


def edges_on(vertices):
    return frozenset(tuple(sorted(e)) for e in combinations(vertices, 2))


def normalize_edge(edge):
    require(len(edge) == 2 and len(set(edge)) == 2, 'malformed edge')
    return tuple(sorted(edge))


def gf2_rank(vectors):
    """Row reduction with sets and symmetric difference, over F2."""
    basis = {}
    for vector in vectors:
        remainder = set(vector)
        while remainder:
            pivot = min(remainder)
            if pivot not in basis:
                basis[pivot] = remainder
                break
            remainder.symmetric_difference_update(basis[pivot])
    return len(basis)


def connected_components(items, adjacent):
    unseen = set(items)
    components = []
    while unseen:
        seed = unseen.pop()
        reached, frontier = {seed}, [seed]
        while frontier:
            vertex = frontier.pop()
            found = {other for other in unseen if adjacent(vertex, other)}
            unseen.difference_update(found)
            reached.update(found)
            frontier.extend(found)
        components.append(sorted(reached))
    return components


require(platform.system() == 'Darwin', 'must execute on local Mac')
require(os.environ.get('PYTHONDONTWRITEBYTECODE') == '1', 'pinned environment missing')
require(Path(sys.executable).parent == Path('PRIVATE_PATH_REMOVED'), 'unexpected Python environment')

# The graph is generated only from the mathematical definition.
vertices = tuple(range(12))
pairs = [frozenset((2*i, 2*i+1)) for i in range(4)]
cliques = [pairs[i] | pairs[(i+1) % 4] | {8+i} for i in range(4)]
clique_edges = [edges_on(q) for q in cliques]
edges = frozenset().union(*clique_edges)
triangles = [t for t in combinations(vertices, 3) if edges_on(t) <= edges]
triangle_edges = {t: edges_on(t) for t in triangles}
triangle_set = set(triangles)
owners = {t: [i for i,q in enumerate(cliques) if set(t) <= q] for t in triangles}
require(all(len(v) == 1 for v in owners.values()), 'cross-piece or multiply owned triangle')
edge_multiplicity = Counter(e for q in clique_edges for e in q)
shared_edges = {e for e,multiplicity in edge_multiplicity.items() if multiplicity == 2}
require(all(m in (1,2) for m in edge_multiplicity.values()), 'unexpected clique overlap')
require(shared_edges == {tuple(sorted(p)) for p in pairs}, 'shared edges differ from pair edges')

# Enumerate each ten-triangle K5 locally, without an optimizer. This gives
# the upper bound on any global packing from unique triangle ownership.
local_bounds = []
for i, q in enumerate(cliques):
    local_triangles = [t for t in triangles if set(t) <= q]
    local_packing_max = 0
    local_packings = []
    for count in range(len(local_triangles)+1):
        for family in combinations(local_triangles, count):
            used = frozenset().union(*(triangle_edges[t] for t in family))
            if len(used) == 3*count:
                local_packing_max = max(local_packing_max, count)
                local_packings.append((used, family))
    local_cover_min = None
    for count in range(len(clique_edges[i])+1):
        if any(all(set(c) & triangle_edges[t] for t in local_triangles)
               for c in combinations(sorted(clique_edges[i]), count)):
            local_cover_min = count
            break
    local_two_deletion_min = min(
        max(len(family) for used,family in local_packings if not used & set(deleted))
        for count in range(3)
        for deleted in combinations(sorted(clique_edges[i]), count)
    )
    local_bounds.append({'clique': i, 'triangle_count': len(local_triangles),
                         'packing_max': local_packing_max,
                         'cover_min': local_cover_min,
                         'packing_min_after_at_most_two_deletions': local_two_deletion_min})
packing_upper = sum(x['packing_max'] for x in local_bounds)
cover_lower = sum(x['cover_min'] for x in local_bounds) - len(shared_edges)

cert_path = ROOT/'evidence/ring_certificate.json'
cert_bytes = cert_path.read_bytes()
cert = json.loads(cert_bytes)
require({normalize_edge(e) for e in cert['edges']} == edges and len(cert['edges']) == len(edges), 'certificate graph mismatch')
require({tuple(sorted(t)) for t in cert['triangles']} == triangle_set and len(cert['triangles']) == len(triangles), 'certificate triangle mismatch')
require([set(q) for q in cert['cliques']] == [set(q) for q in cliques], 'certificate clique mismatch')
require(cert['triangle_owners'] == [owners[tuple(sorted(t))][0] for t in cert['triangles']], 'certificate owner mismatch')

# Test exactly all subsets of graph edges of cardinality 0, 1, or 2, checking
# supplied witnesses as actual graph triangles, not trusting any verdict.
required_deletions = {frozenset(d) for n in range(3) for d in combinations(sorted(edges), n)}
checked_deletions = set()
witness_sizes = Counter()
for case in cert['resilience_witnesses']:
    deleted_list = [normalize_edge(e) for e in case['deleted_edges']]
    deleted = frozenset(deleted_list)
    require(len(deleted_list) == len(deleted), 'repeated deleted edge')
    require(deleted in required_deletions, 'out-of-domain deletion')
    require(deleted not in checked_deletions, 'duplicate deletion case')
    packing = [tuple(sorted(t)) for t in case['packing']]
    require(all(len(t) == 3 and len(set(t)) == 3 and t in triangle_set for t in packing), 'nontriangle in packing')
    require(len(packing) == len(set(packing)), 'repeated triangle in packing')
    used = frozenset().union(*(triangle_edges[t] for t in packing))
    require(len(used) == 3*len(packing), 'packing triangles share an edge')
    require(not used & deleted, 'packing uses a deleted edge')
    require(len(packing) == packing_upper, 'packing fails to attain global upper bound')
    checked_deletions.add(deleted)
    witness_sizes[len(packing)] += 1
require(checked_deletions == required_deletions, 'missing deletion cases')
packing_lower = min(witness_sizes)
require(packing_lower == packing_upper, 'packing bounds fail to meet')

# An independent 12-edge cover: all pair edges, and x_i joined to P_i.
cover = shared_edges | {tuple(sorted((v,8+i))) for i in range(4) for v in pairs[i]}
require(all(cover & triangle_edges[t] for t in triangles), 'constructed set misses a triangle')
require(len(cover) == cover_lower, 'cover upper and lower bounds fail to meet')
coloring = {v: i % 2 for i in range(4) for v in pairs[i]}
coloring.update({8+i: i % 2 for i in range(4)})
require(cover == {e for e in edges if coloring[e[0]] == coloring[e[1]]}, 'constructed cover is not cut complement')

# Exhaust all vertex bipartitions (fix vertex 0 to remove complementation).
# This is cheap and independently checks the claimed minimum cut-cover size.
cut_cover_min = len(edges)
cut_cover_minimizers = 0
for bits in range(1 << (len(vertices)-1)):
    color = lambda v: 0 if v == 0 else (bits >> (v-1)) & 1
    size = sum(color(u) == color(v) for u,v in edges)
    if size < cut_cover_min:
        cut_cover_min, cut_cover_minimizers = size, 1
    elif size == cut_cover_min:
        cut_cover_minimizers += 1
require(cut_cover_min == len(cover), 'minimum cut-cover mismatch')
cert_cover = {normalize_edge(e) for e in cert['minimum_cut_cover']}
cert_bits = cert['cut_partition_bits']
require(0 <= cert_bits < (1 << 11), 'invalid fixed-vertex cut encoding')
cert_color = lambda v: 0 if v == 0 else (cert_bits >> (v-1)) & 1
require(cert_cover == {e for e in edges if cert_color(e[0]) == cert_color(e[1])}, 'certificate cut encoding mismatch')
require(len(cert_cover) == cut_cover_min, 'certificate cut is not minimum')

support = frozenset().union(*triangle_edges.values())
triangle_components = connected_components(triangles, lambda t,u: bool(triangle_edges[t] & triangle_edges[u]))
vertex_components = connected_components(vertices, lambda u,v: tuple(sorted((u,v))) in edges)
require(support == edges, 'nontriangular edge')
require(len(triangle_components) == 1, 'triangle support not connected through shared edges')
require(len(vertex_components) == 1, 'graph disconnected')

# Actual cochain matrices: delta0 maps vertex indicators to incident-edge
# vectors; delta1 rows have the three edges of each actual triangle.
d0_columns = [{e for e in edges if v in e} for v in vertices]
d1_rows = list(triangle_edges.values())
require(all(len(v & t) % 2 == 0 for v in d0_columns for t in d1_rows), 'cochain condition failed')
rank0, rank1 = gf2_rank(d0_columns), gf2_rank(d1_rows)
h1 = len(edges)-rank0-rank1
cocycle = {tuple(sorted((u,v))) for u in pairs[0] for v in pairs[1] | {8}}
require(cocycle <= edges, 'cocycle includes nongraph edge')
require(all(len(cocycle & t) % 2 == 0 for t in d1_rows), 'proposed cocycle not closed')
cycle_vertices = [0,2,4,6]
cycle_edges = {tuple(sorted((cycle_vertices[i], cycle_vertices[(i+1) % 4]))) for i in range(4)}
require(cycle_edges <= edges, 'noncut witness is not a graph cycle')
cycle_parity = len(cycle_edges & cocycle) % 2
require(cycle_parity == 1, 'cocycle has even test-cycle parity')
require(gf2_rank(d0_columns+[cocycle]) == rank0+1, 'cocycle is a coboundary')
require({normalize_edge(e) for e in cert['cocycle']} == cocycle, 'certificate cocycle differs')
require({normalize_edge(e) for e in cert['noncut_cycle']} == cycle_edges, 'certificate cycle differs')

computed = {'n':len(vertices), 'm':len(edges), 'nu':packing_upper, 'tau':len(cover),
            'rank_d0':rank0, 'rank_d1':rank1, 'h1_dimension':h1,
            'deletion_cases':len(required_deletions)}
for key,value in computed.items():
    require(cert[key] == value, f'certificate numeric mismatch: {key}')
require(computed == {'n':12,'m':36,'nu':8,'tau':12,'rank_d0':11,'rank_d1':24,'h1_dimension':1,'deletion_cases':667}, 'frozen numeric claim mismatch')
require(len(triangles) == 40, 'frozen triangle count mismatch')

# Requested source-scope control: K4 is tight and single-edge resilient.
k4_edges = edges_on(range(4))
k4_triangles = [edges_on(t) for t in combinations(range(4),3)]
k4_nu_by_deletion = {}
for size in range(2):
    for removed in combinations(sorted(k4_edges),size):
        available = [t for t in k4_triangles if not t & set(removed)]
        maximum = max(n for n in range(len(available)+1)
                      if any(len(frozenset().union(*family)) == 3*n
                             for family in combinations(available,n)))
        k4_nu_by_deletion[str(removed)] = maximum
k4_tau = min(n for n in range(7)
             if any(all(set(c) & t for t in k4_triangles)
                    for c in combinations(sorted(k4_edges),n)))
require(set(k4_nu_by_deletion.values()) == {1} and k4_tau == 2, 'K4 source-scope control failed')

result = {
    'status':'PASS',
    'verification_status':'VERIFIED_FINITE',
    'independence':'New standard-library checker reconstructed graph and predicates; no discovery script read, imported or executed.',
    'universe':'One explicitly labelled 12-vertex graph; every actual triangle; all graph-edge deletion sets of size at most two.',
    'computed':computed,
    'triangle_count':len(triangles),
    'clique_triangle_counts':dict(Counter(owner[0] for owner in owners.values())),
    'local_exhaustive_bounds':local_bounds,
    'packing_upper':packing_upper,
    'packing_lower':packing_lower,
    'cover_lower':cover_lower,
    'cover_upper':len(cover),
    'cover_witness':sorted(cover),
    'cut_cover_minimum':cut_cover_min,
    'certificate_cut_bits_encoding':'Vertex 0 has color 0; bit v-1 is color of vertex v for 1 <= v <= 11.',
    'resolved_schema_omission':'Initial certificate omitted the fixed-vertex convention; independent reconstruction identified it.',
    'K4_scope_control':{'n':4,'m':6,'triangles':4,'nu':1,'tau':k4_tau,'single_edge_resilient':True,'deletion_cases':len(k4_nu_by_deletion),'nu_by_deletion':k4_nu_by_deletion,'implication':'K5 is not the sole tight one-edge-resilient graph through order 10 when order 4 is included.'},
    'cut_partitions_examined':1 << (len(vertices)-1),
    'cut_cover_minimizers_up_to_complement':cut_cover_minimizers,
    'all_667_deletion_witnesses_valid':True,
    'deletion_sets_by_size':dict(Counter(map(len,checked_deletions))),
    'packing_sizes_by_case_count':dict(witness_sizes),
    'triangle_components':len(triangle_components),
    'every_edge_triangular':True,
    'vertex_components':len(vertex_components),
    'cocycle':sorted(cocycle),
    'noncut_cycle_edges':sorted(cycle_edges),
    'cocycle_cycle_pairing':cycle_parity,
    'proof_status':'Finite certificate verification plus ordinary proofs; no Lean, external peer review, or separate final audit.',
    'refutation_scope':'Two-edge packing resilience plus connected nonempty triangle support and every edge triangular does not imply H1(F2)=0.',
    'excluded_refutations':['unrestricted Tuza','universal CS','defect-one residual rigidity','scoped cut-cover bound','reported census through ten vertices'],
    'solver':'None; complete local enumeration, witness verification, and exact F2 elimination.',
    'timeouts':0,
    'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    'certificate_sha256':hashlib.sha256(cert_bytes).hexdigest(),
    'frozen_note_sha256':hashlib.sha256((ROOT/'notes/ring_frozen.md').read_bytes()).hexdigest(),
    'python':sys.version,
    'python_executable':sys.executable,
    'platform':platform.platform(),
    'host':platform.node(),
    'user':pwd.getpwuid(os.getuid()).pw_name,
    'actual_home':pwd.getpwuid(os.getuid()).pw_dir,
    'completed_utc':datetime.now(timezone.utc).isoformat(),
    'elapsed_seconds':time.monotonic()-START,
    'max_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,
}
output = ROOT/'evidence/critic_ring_check.json'
output.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':result['status'],**computed,'triangles':len(triangles),'elapsed_seconds':result['elapsed_seconds'],'output':str(output)}))
