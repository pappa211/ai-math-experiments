"""Independent reconstruction of the literal parity-cone obstruction.
Reads no producer code or certificates. Local exact branch recursion and arithmetic.
"""
from functools import lru_cache
from itertools import combinations
from pathlib import Path
from fractions import Fraction
import hashlib, json, platform, time

started=time.time()
n=35
rim={tuple(sorted((u,(u+d)%n))) for u in range(n) for d in (1,7,11,16)}
assert len(rim)==140
assert not any(all(tuple(sorted(e)) in rim for e in combinations(t,2)) for t in combinations(range(n),3))

def independence(edges, forbidden=()):
    adjacency=[0]*n
    for u,v in edges:
        adjacency[u]|=1<<v
        adjacency[v]|=1<<u
    @lru_cache(None)
    def solve(mask):
        if not mask: return 0
        verts=[v for v in range(n) if mask>>v&1]
        v=max(verts,key=lambda v:(mask&adjacency[v]).bit_count())
        rest=mask&~(1<<v)
        return max(solve(rest),1+solve(rest&~adjacency[v]))
    mask=((1<<n)-1)&~sum(1<<v for v in forbidden)
    value=solve(mask)
    chosen=[]
    while mask:
        verts=[v for v in range(n) if mask>>v&1]
        v=max(verts,key=lambda v:(mask&adjacency[v]).bit_count())
        rest=mask&~(1<<v)
        if 1+solve(rest&~adjacency[v])==solve(mask):
            chosen.append(v);mask=rest&~adjacency[v]
        else: mask=rest
    assert len(chosen)==value
    assert not any(tuple(sorted(e)) in edges for e in combinations(chosen,2))
    return value,chosen,solve.cache_info()._asdict()

alpha,I,cache=independence(rim)
assert alpha==8
critical=[]
for d in (1,7,11,16):
    value,J,stats=independence(rim-{(0,d)})
    assert value==9 and 0 in J and d in J
    critical.append({'deleted_edge':[0,d],'independent_set':J,'alpha':value,'cache':stats})
value,J,stats=independence(rim,(0,))
assert value==8
apex=35
edges=rim|{(v,apex) for v in range(n)}
triangles=[list(t) for t in combinations(range(n+1),3) if all(tuple(e) in edges for e in combinations(t,2))]
assert len(edges)==175 and len(triangles)==140 and all(apex in t for t in triangles)
packing=[[u,u+1,apex] for u in range(0,34,2)]
used=[tuple(e) for t in packing for e in combinations(t,2)]
assert len(used)==len(set(used))==51 and all(e in edges for e in used)
cover={(v,apex) for v in range(n) if v not in I}
assert len(cover)==27 and all(any(tuple(e) in cover for e in combinations(t,2)) for t in triangles)
remaining_packing=packing[1:]
assert len(remaining_packing)==16
assert all((0,apex) not in set(combinations(t,2)) and (1,apex) not in set(combinations(t,2)) for t in remaining_packing)
lower=Fraction(n*n-alpha*alpha,4*alpha)
assert lower>34
# Verify the quadratic lower bound for every possible rim-side size with exact arithmetic.
rows=[]
for q in range(n//2+1):
    p=n-q
    bound=Fraction(p*(p-alpha)+q*(q-alpha),2*alpha)+q
    assert bound>=lower
    rows.append({'smaller_side':q,'bound':str(bound)})
receipt={
 'status':'PASS','host':platform.system(),'method':'independent max-degree include/exclude recursion; no producer imports',
 'rim_edges':[list(e) for e in sorted(rim)],'full_edges':[list(e) for e in sorted(edges)],'all_triangles':triangles,
 'alpha':alpha,'independent_set':I,'alpha_cache':cache,'rim_criticality_orbit_witnesses':critical,
 'independent_set_avoiding_zero':J,'avoid_zero_cache':stats,'packing':packing,'cover':[list(e) for e in sorted(cover)],
 'nu':17,'tau':27,'pi_lower_bound':str(lower),'pi_integer_lower_bound':37,
 'two_spoke_blocker':[[0,apex],[1,apex]],'packing_after_blocker':remaining_packing,
 'nu_after_blocker':16,'quadratic_checks':rows,
 'proof_limits':'Matching and cover optima use the proved cone identities and exhaustive alpha recursion; pi exact optimum not computed. No Lean.',
 'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'elapsed_seconds':time.time()-started}
out=Path('evidence/parity_cone_root');out.mkdir(parents=True,exist_ok=True)
(out/'verification.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps({k:receipt[k] for k in ('status','alpha','nu','tau','pi_integer_lower_bound','elapsed_seconds')}))
