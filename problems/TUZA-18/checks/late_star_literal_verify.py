"""Independent literal verification of the star-selection obstruction; stdlib only."""
from itertools import combinations,product
from collections import Counter
from pathlib import Path
import json
V=(0,1,2,3,4,5,7)
E=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
P=((2,3,7),(0,1,2),(1,4,7),(3,4,5))
pt=[set(combinations(t,2)) for t in P]
B=set().union(*pt)
assert len(B)==12 and len(E)==17
T=[tuple(t) for t in combinations(V,3) if set(combinations(t,2))<=E]
assert T==[(0,1,2),(0,1,4),(0,1,7),(0,2,3),(0,2,7),(0,3,4),(0,3,7),(0,4,7),(1,2,5),(1,2,7),(1,4,5),(1,4,7),(2,3,5),(2,3,7),(3,4,5),(3,4,7)]
te=[set(combinations(t,2)) for t in T]
odd=[v for v in V if sum(v in e for e in E)%2]
assert odd==[0,1,2,3,4,7]
private=[]
for F in pt:
    bases={tuple(next(iter(Q&B))) for Q in te if len(Q&B)==1 and Q&B<=F}
    assert len(bases)==1
    private.append(next(iter(bases)))
assert private==[(3,7),(1,2),(4,7),(3,4)]
R=set(private);U=sorted(B-R)
def cover(C):return all(C&Q for Q in te)
allcovers=[]
for mask in range(1<<len(U)):
    C=R|{e for i,e in enumerate(U) if mask>>i&1}
    if cover(C):allcovers.append(C)
minimum=min(map(len,allcovers));minimum_covers=[C for C in allcovers if len(C)==minimum]
assert minimum==8 and len(minimum_covers)==9
canonical=(2,0,1,5)
def feasible(C,centres):
    cap=Counter(centres);cost=Counter()
    for F,c in zip(pt,centres):cost[c]+=len(F&C)
    return all(cost[c]<=2*cap[c] for c in cap)
assert not any(feasible(C,canonical) for C in allcovers)
bad=R|{(0,1),(0,2),(1,4),(2,3)}
good=R|{(0,2),(1,4),(1,7),(2,3)}
assert bad in minimum_covers and good in minimum_covers
assert not any(feasible(bad,c) for c in product(*P))
assert feasible(good,(2,0,4,4))
# Independently enumerate all triangle subfamilies: certify packing optimum four.
nu=0;packings=0
for k in range(1,6):
    for inds in combinations(range(len(T)),k):
        if len(set().union(*(te[i] for i in inds)))==3*k:
            nu=max(nu,k);packings+=1
assert nu==4
result={'status':'PASS','vertices':V,'edges':sorted(E),'all_actual_triangles':T,'P':P,'nu':nu,'packing_upper_ordinary':'Six odd-degree vertices cannot be the odd set of a two-edge leave after five triangles','private_bases':private,'support_cover_number':minimum,'all_minimum_support_covers':[sorted(C) for C in minimum_covers],'canonical_centres':canonical,'canonical_compatible':False,'bad_minimum_cover':sorted(bad),'bad_cover_any_centre_assignment':False,'good_minimum_cover':sorted(good),'good_centres':(2,0,4,4),'scope':'Auxiliary selection obstructions only; full existential gluing succeeds'}
p=Path(__file__).resolve().parents[1]/'evidence'/'late_star_literal_verified.json';p.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','nu':nu,'support_tau':minimum,'minimum_covers':len(minimum_covers),'path':str(p)}))
