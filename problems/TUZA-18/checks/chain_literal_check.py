"""Independent N=3 replay for the edge-clique-sum Hall plateau.
The all-N proof is audited separately. No producer checker is imported.
"""
from datetime import datetime,timezone
from functools import lru_cache
from hashlib import sha256
from itertools import combinations,product
from pathlib import Path
import json

STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
started=datetime.now(timezone.utc);assert started<STOP
root=Path('SCRATCH_OUTPUT')
producer=json.loads((root/'tuza18_chain_input_late_star_connected_chain_verified.json').read_text())
def edge(a,b):return tuple(sorted((a,b)))
def te(t):return frozenset(combinations(sorted(t),2))
def tris(V,E):return tuple(t for t in combinations(sorted(V),3) if te(t)<=E)
V0=(0,1,2,3,4,5,7)
E0=frozenset(combinations(V0,2))-{(0,5),(5,7),(1,3),(2,4)}
T0=tris(V0,E0)
P0=((2,3,7),(0,1,2),(1,4,7),(3,4,5))
B0=frozenset().union(*(te(t) for t in P0))
R0=frozenset({(3,7),(1,2),(4,7),(3,4)})
C0=R0|{(0,1),(0,2),(1,4),(2,3)}
assert len(T0)==16 and len(E0)==17 and len(B0)==12
assert sum(sum(v in e for e in E0)%2 for v in V0)==6
assert all(t in T0 for t in P0) and sum(len(te(t)) for t in P0)==len(B0)
# The parity certificate: five packed triangles would leave two edges but six
# odd-degree vertices, impossible. The displayed four-packing attains the bound.
local_min=[]
for size in range(len(B0)+1):
    local_min=[frozenset(C) for C in combinations(sorted(B0),size) if all(te(t)&set(C) for t in T0)]
    if local_min:break
assert size==8 and len(local_min)==9 and C0 in local_min

N=3;maps=[];counter=0
for i in range(N):
    m={}
    if i:
        m[5]=maps[-1][0];m[1]=maps[-1][7]
    for v in V0:
        if v not in m:m[v]=counter;counter+=1
    assert len(set(m.values()))==7
    maps.append(m)
assert maps==[{int(k):v for k,v in m.items()} for m in producer['vertex_maps']]
def mapped_edges(E,m):return frozenset(edge(m[a],m[b]) for a,b in E)
def mapped_tri(t,m):return tuple(sorted(m[x] for x in t))
blockE=[mapped_edges(E0,m) for m in maps]
blockB=[mapped_edges(B0,m) for m in maps]
blockT=[tuple(mapped_tri(t,m) for t in T0) for m in maps]
blockP=[tuple(mapped_tri(t,m) for t in P0) for m in maps]
V=set(range(counter));E=frozenset().union(*blockE);B=frozenset().union(*blockB)
P=tuple(t for block in blockP for t in block);T=tris(V,E)
assert (len(V),len(E),len(T),len(P),len(B))==(17,49,48,12,36)
assert E==frozenset(map(tuple,producer['edges']))
assert set(T)==set(map(tuple,producer['actual_triangles']))
assert set(P)==set(map(tuple,producer['P']))
for i,j in combinations(range(N),2):
    common=set(maps[i].values())&set(maps[j].values())
    assert len(common)==(2 if j==i+1 else 0)
    assert len(blockE[i]&blockE[j])==(1 if j==i+1 else 0)
    assert not blockB[i]&blockE[j]
assert all(sum(te(t)<=Ei for Ei in blockE)==1 for t in T)
assert set(T)==set(t for block in blockT for t in block)
assert len(frozenset().union(*(te(t) for t in P)))==3*len(P)
# Unique triangle ownership gives nu<=4N, attained by P. No large packing search.
seen={T[0]};todo=[T[0]]
while todo:
    t=todo.pop()
    for q in T:
        if q not in seen and te(t)&te(q):seen.add(q);todo.append(q)
assert seen==set(T)
for t in P:
    bases={next(iter(te(q)&B)) for q in T if q!=t and len(te(q)&B)==1 and te(q)&B<=te(t)}
    assert len(bases)==1
    for w in V-set(t):
        faces=[tuple(sorted((w,*e))) for e in combinations(t,2)]
        assert not all(q in T and len(te(q)&B)==1 and te(q)&B<=te(t) for q in faces)

mapped_min=[[mapped_edges(C,m) for C in local_min] for m in maps]
start=frozenset().union(*(mapped_edges(C0,m) for m in maps))
assert start==frozenset(map(tuple,producer['start_cover']))
def deficiency(C):
    costs=[len(te(t)&C) for t in P]
    assert all(1<=n<=3 for n in costs)
    H=[i for i,n in enumerate(costs) if n==3]
    L=[i for i,n in enumerate(costs) if n==1]
    adj=[tuple(j for j,l in enumerate(L) if set(P[h])&set(P[l])) for h in H]
    @lru_cache(None)
    def solve(i,used):
        if i==len(H):return 0
        return max([solve(i+1,used)]+[1+solve(i+1,used|1<<j) for j in adj[i] if not used>>j&1])
    return len(H)-solve(0,0),costs
assert deficiency(start)[0]==1
records=[];best=None;compatible=0
for ids in product(range(9),repeat=N):
    Cs=[mapped_min[i][ids[i]] for i in range(N)]
    C=frozenset().union(*Cs)
    assert len(C)==24 and all(te(t)&C for t in T)
    delta,costs=deficiency(C)
    assert all(sum(c==3 for c in costs[4*i:4*i+4])==sum(c==1 for c in costs[4*i:4*i+4]) for i in range(N))
    changed=[i for i in range(N) if Cs[i]!=mapped_edges(C0,maps[i])]
    distance=len(C^start)
    if delta==0:
        compatible+=1
        assert 0 in changed and all(i in changed or i+1 in changed for i in range(N-1))
        assert len(changed)>=2 and distance>=4
        best=distance if best is None else min(best,distance)
    records.append({'local_states':ids,'deficiency':delta,'changed_blocks':[i+1 for i in changed],'symmetric_difference':distance})
assert len(records)==729 and best==4
one=[]
for a,b in product(sorted(start),sorted(B-start)):
    C=(start-{a})|{b}
    if all(te(t)&C for t in T):one.append({'removed':a,'added':b,'deficiency':deficiency(C)[0]})
assert len(one)==12 and set(x['deficiency'] for x in one)=={1,2}
assert sorted(x['deficiency'] for x in one)==sorted(producer['one_pivot_deficiencies'])
repair=frozenset().union(*(mapped_edges((C0-{(2,3)})|{(3,5)} if i%2==0 else C0,m) for i,m in enumerate(maps)))
assert deficiency(repair)[0]==0 and len(repair^start)==4
assert repair==frozenset(map(tuple,producer['repair_cover']))
# Explicit saturating matching: H1-L2, H2-T1_1, H3-T1_3.
matching=((1,7),(5,0),(9,8))
assert all(set(P[a])&set(P[b]) for a,b in matching)
costs=deficiency(repair)[1]
assert {a for a,b in matching}=={i for i,n in enumerate(costs) if n==3}
assert {b for a,b in matching}=={i for i,n in enumerate(costs) if n==1}
finished=datetime.now(timezone.utc);assert finished<STOP
out={'status':'PASS','started_utc':started.isoformat(),'finished_utc':finished.isoformat(),
     'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
     'input_sha256':{p.name:sha256(p.read_bytes()).hexdigest() for p in sorted(root.glob('tuza18_chain_input_*'))},
     'N':N,'vertices':len(V),'edges':len(E),'actual_triangles':len(T),'triangle_components':1,
     'nu':12,'packing_upper_method':'Unique local triangle ownership plus the six-odd-vertices local parity bound; no global packing oracle.',
     'support_cover_minimum':24,'support_minimum_factorization':'Each B edge belongs to one block, every actual triangle belongs to one block, and each local minimum is eight.',
     'all_type1':True,'private_K4_completions':0,'initial_deficiency':1,
     'minimum_states':729,'compatible_states':compatible,'minimum_symmetric_difference':best,
     'one_pivots':one,'repair_cover':sorted(repair),'repair_matching_indices':matching,'state_rows':records,
     'limitations':['Only N=3 is replayed. The unbounded radius obstruction is an ordinary proof.',
                    'No broad graph corpus or producer checker is used.',
                    'The obstruction concerns strict decrease of global Hall deficiency on equal-cost covers for this fixed P.']}
(root/'tuza18_chain_literal_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in out.items() if k in ['status','finished_utc','script_sha256','N','vertices','edges','actual_triangles','triangle_components','nu','support_cover_minimum','minimum_states','compatible_states','minimum_symmetric_difference']},sort_keys=True))
