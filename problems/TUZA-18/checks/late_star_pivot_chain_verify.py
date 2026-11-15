"""Literal two-block certifier; no discovery imports."""
from itertools import combinations
from pathlib import Path
import json
V=(0,1,2,3,4,5,7);E0=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
P0=((2,3,7),(0,1,2),(1,4,7),(3,4,5));B0=set().union(*(set(combinations(t,2)) for t in P0))
T0=[t for t in combinations(V,3) if set(combinations(t,2))<=E0]
R0={(3,7),(1,2),(4,7),(3,4)};U0=sorted(B0-R0)
def local_cover(C):return all(C&set(combinations(t,2)) for t in T0)
LC=[]
for M in combinations(U0,4):
 C=R0|set(M)
 if local_cover(C):LC.append(C)
assert len(LC)==9
assert not any(local_cover(R0|set(M)) for M in combinations(U0,3))
# Identify 0 in first copy with 5 in second copy; all other labels disjoint.
maps=[{v:v for v in V},{v:(0 if v==5 else v+10) for v in V}]
def emap(e,m):return tuple(sorted(m[v] for v in e))
def tmap(t,m):return tuple(sorted(m[v] for v in t))
E=set().union(*({emap(e,m) for e in E0} for m in maps))
VV=sorted(set().union(*map(set,E)))
P=[tmap(t,m) for m in maps for t in P0];PE=[set(combinations(t,2)) for t in P]
B=set().union(*PE);T=[t for t in combinations(VV,3) if set(combinations(t,2))<=E]
expected={tmap(t,m) for m in maps for t in T0}
assert set(T)==expected and len(T)==32 and len(VV)==13 and len(E)==34 and len(B)==24
for m in maps:
 locE={emap(e,m) for e in E0};odd=[v for v in m.values() if sum(v in e for e in locE)%2]
 assert len(odd)==6
# Each block nu=4 by the local four-packing and six-odd-vertex two-edge-leave bound.
allC=[]
for A in LC:
 for D in LC:allC.append({emap(e,maps[0]) for e in A}|{emap(e,maps[1]) for e in D})
assert len(allC)==81 and all(len(C)==16 for C in allC)
def d(C):
 load=[len(F&C) for F in PE];H=[i for i,l in enumerate(load) if l==3];L=[i for i,l in enumerate(load) if l==1]
 adj={i:[j for j in L if set(P[i])&set(P[j])] for i in H}
 def match(k,used):
  if k==len(H):return 0
  return max([match(k+1,used)]+[1+match(k+1,used|{j}) for j in adj[H[k]] if j not in used])
 return len(H)-match(0,set()),load,adj
C0=R0|{(0,1),(0,2),(1,4),(2,3)}
start=set().union(*({emap(e,m) for e in C0} for m in maps))
assert start in allC and d(start)[0]==1
neighbours=[C for C in allC if len(C^start)==2]
assert len(neighbours)==8 and all(d(C)[0]==1 for C in neighbours)
goodlocal=(C0-{(0,1)})|{(1,7)}
good=set().union(*({emap(e,m) for e in goodlocal} for m in maps))
assert good in allC and d(good)[0]==0 and len(good^start)==4
compatible=[C for C in allC if d(C)[0]==0]
assert min(len(C^start) for C in compatible)==4
out={'status':'PASS','vertices':VV,'edges':sorted(E),'actual_triangles':T,'P':P,'nu':8,'support_cover_minimum':16,'minimum_support_covers':81,'start_cover':sorted(start),'start_deficiency':1,'one_pivot_count':len(neighbours),'one_pivot_deficiencies':[d(C)[0] for C in neighbours],'minimum_symmetric_difference_to_compatible':4,'compatible_cover':sorted(good),'compatible_deficiency':0,'scope':'Two shared-vertex blocks; global PIV1 false, componentwise PIV1 not refuted'}
p=Path(__file__).resolve().parents[1]/'evidence'/'late_star_pivot_chain_verified.json';p.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'status':'PASS','nu':8,'support_tau':16,'one_pivots':8,'minimum_distance':4,'path':str(p)}))
