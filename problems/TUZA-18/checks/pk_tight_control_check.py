"""Independent finite audit of the individually tight, nonmaximum-star control."""
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json

STOP = datetime(2026, 11, 14, 21, 0, 10, tzinfo=timezone.utc)
started = datetime.now(timezone.utc)
assert started < STOP, 'Research deadline reached'
def edge(a, b):
    return tuple(sorted((a, b)))
def ted(t):
    return frozenset(combinations(sorted(t), 2))
def triangles(n, E):
    return tuple(t for t in combinations(range(n), 3) if ted(t) <= E)

base = Path('SCRATCH_OUTPUT')
proof = base / 'tuza18_pk_input_criticality_star_tight_control.md'
evidence = base / 'tuza18_pk_input_criticality_star_tight_control.json'
assert sha256(proof.read_bytes()).hexdigest() == 'cec71b76e7695f6e319464851891cb2226acbbf1a3d8c0790eafb42f838be2cd'
d = json.loads(evidence.read_text())
F = {edge(start+i, start+(i+1)%5) for start in (1,6,11) for i in range(5)}
F |= {(0,1),(0,6),(0,11)}
M = {(0,5),(1,3),(2,4),(6,11),(7,9),(8,10),(12,14),(13,15)}
H = F | M
assert F.isdisjoint(M) and len({v for e in M for v in e}) == 16
assert H == set(map(tuple,d['H_edges']))
assert not triangles(16,F)
old = triangles(16,H)
assert old == tuple(map(tuple,d['H_triangles'])) and len(old) == 8
assert all(sum(e in ted(t) for t in old) == 1 for e in M)

def perfect_matchings(remaining):
    if not remaining:
        yield frozenset()
        return
    a = min(remaining)
    for b in sorted(remaining - {a}):
        e = edge(a,b)
        if e in H:
            for rest in perfect_matchings(remaining - {a,b}):
                yield rest | {e}

pms = set(perfect_matchings(set(range(16))))
assert len(pms) == 12
assert pms == {frozenset(map(tuple,P)) for P in d['all_perfect_matchings']}
assert all(len(ted(t) & P) == 1 for t in old for P in pms)
alpha = 0
independent = None
for mask in range(1 << 16):
    if mask.bit_count() > alpha and all(not (mask >> a & 1 and mask >> b & 1) for a,b in F):
        alpha = mask.bit_count()
        independent = [v for v in range(16) if mask >> v & 1]
assert alpha == 7

G = H | {(v,16) for v in range(16)}
actual = triangles(17,G)
assert actual == tuple(map(tuple,d['G_triangles'])) and len(actual) == 34
P = tuple(tuple(sorted((*e,16))) for e in sorted(M))
B = frozenset().union(*(ted(t) for t in P))
for t in P:
    pages = [q for q in actual if q != t and len(ted(q) & B) == 1 and (ted(q) & B) <= ted(t)]
    assert len(pages) == 1 and (ted(pages[0]) & B) == {tuple(t[:2])}
# Therefore each old triangle forces its distinct M edge, and all other
# requirements are exactly a vertex cover of F selected as apex spokes.
restricted_optimum = len(M) + 16 - alpha
assert restricted_optimum == 17
larger = tuple(map(tuple,d['larger_packing']))
assert len(larger) == 9 and all(t in actual for t in larger)
assert len(set().union(*(ted(t) for t in larger))) == 27
cover = set(map(tuple,d['ordinary_triangle_cover']))
assert len(cover) == 17 and cover <= B
assert all(ted(t) & cover for t in actual)
finished = datetime.now(timezone.utc)
assert finished < STOP, 'Research deadline reached'
out = {
    'status': 'PASS', 'started_utc': started.isoformat(), 'finished_utc': finished.isoformat(),
    'proof_sha256': sha256(proof.read_bytes()).hexdigest(),
    'producer_evidence_sha256': sha256(evidence.read_bytes()).hexdigest(),
    'script_sha256': sha256(Path(__file__).read_bytes()).hexdigest(),
    'rim_vertices': 16, 'rim_edges': len(H), 'rim_triangles': len(old),
    'perfect_matching_count': len(pms), 'all_triangles_individually_tight': True,
    'active_matching_edges': len(M), 'residual_independence_number': alpha,
    'independent_set': independent, 'cone_vertices': 17, 'cone_edges': len(G),
    'cone_triangles': len(actual), 'prescribed_packing_size': 8,
    'prescribed_packing_maximum': False, 'larger_packing_size': 9,
    'support_cover_optimum': restricted_optimum,
    'ordinary_cover_size': len(cover),
    'scope': 'Refutes individual-tight-triangle relaxation only; no PK or Tuza counterexample.',
}
(base/'tuza18_pk_tight_control_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps(out,sort_keys=True))
