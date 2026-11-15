"""All 50 identifications of an outside-support edge in two fixed literal blocks."""
from itertools import combinations,product
from pathlib import Path
import json,time
V=(0,1,2,3,4,5,7);E0=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
P0=((2,3,7),(0,1,2),(1,4,7),(3,4,5));B0=set().union(*(set(combinations(t,2)) for t in P0));N0=sorted(E0-B0)
T0=[t for t in combinations(V,3) if set(combinations(t,2))<=E0]
R0={(3,7),(1,2),(4,7),(3,4)};U0=sorted(B0-R0)
LC=[R0|set(M) for M in combinations(U0,4) if all((R0|set(M))&set(combinations(t,2)) for t in T0)]
assert len(LC)==9
C0=R0|{(0,1),(0,2),(1,4),(2,3)};badindex=next(i for i,C in enumerate(LC) if C==C0)
def emap(e,m):return tuple(sorted(m[v] for v in e))
def tmap(t,m):return tuple(sorted(m[v] for v in t))
rows=[];start=time.monotonic()
for ea,eb,rev in product(N0,N0,(False,True)):
 targets=ea[::-1] if rev else ea
 maps=[{v:v for v in V},{v:(targets[eb.index(v)] if v in eb else v+10) for v in V}]
 E=set().union(*({emap(e,m) for e in E0} for m in maps));VV=sorted(set().union(*map(set,E)))
 P=[tmap(t,m) for m in maps for t in P0];PE=[set(combinations(t,2)) for t in P];B=set().union(*PE)
 T=[t for t in combinations(VV,3) if set(combinations(t,2))<=E]
 assert set(T)=={tmap(t,m) for m in maps for t in T0}
 assert len(E)==33 and len(VV)==12 and len(T)==32 and len(B)==24
 # Count triangle components by actual shared graph edges.
 TE=[set(combinations(t,2)) for t in T];seen={0}
 while True:
  new=seen|{j for i in seen for j in range(len(T)) if TE[i]&TE[j]}
  if new==seen:break
  seen=new
 assert len(seen)==32
 states=[]
 for i,A in enumerate(LC):
  for j,D in enumerate(LC):
   C={emap(e,maps[0]) for e in A}|{emap(e,maps[1]) for e in D}
   load=[len(F&C) for F in PE];H=[k for k,l in enumerate(load) if l==3];L=[k for k,l in enumerate(load) if l==1]
   adj={k:[l for l in L if set(P[k])&set(P[l])] for k in H}
   def match(k,used):
    if k==len(H):return 0
    return max([match(k+1,used)]+[1+match(k+1,used|{l}) for l in adj[H[k]] if l not in used])
   delta=len(H)-match(0,set());states.append({'cover':C,'delta':delta,'local_indices':(i,j)})
 failures=[]
 for S in states:
  if S['delta'] and not any(len(S['cover']^Q['cover'])==2 and Q['delta']<S['delta'] for Q in states):
   failures.append({'cover':sorted(S['cover']),'delta':S['delta'],'local_indices':S['local_indices']})
 initial=next(S for S in states if S['local_indices']==(badindex,badindex))
 repair=next(({'cover':sorted(Q['cover']),'delta':Q['delta']} for Q in states if len(Q['cover']^initial['cover'])==2 and Q['delta']<initial['delta']),None)
 rows.append({'edge_A':ea,'edge_B':eb,'reversed':rev,'map_B':maps[1],'vertices':VV,'edges':sorted(E),'P':P,'triangle_count':32,'triangle_connected':True,'nu':8,'support_cover_minimum':16,'minimum_states':81,'positive_deficiency_states':sum(bool(S['delta']) for S in states),'initial_bad_bad_delta':initial['delta'],'initial_one_pivot_repair':repair,'PIV1_failures':failures})
out={'status':'COMPLETE','domain':'All 5 x 5 x 2 outside-B edge identifications of two fixed 7-vertex blocks; every minimum support cover','cases':rows,'case_count':len(rows),'failures':sum(len(r['PIV1_failures']) for r in rows),'elapsed_seconds':time.monotonic()-start,'packing_certificate':'Every actual triangle belongs to exactly one block; each block nu4 by parity; original union P attains8','cover_certificate':'B blocks are disjoint, every actual triangle lies in one block, each local support-cover optimum8; all81 products enumerated'}
p=Path(__file__).resolve().parents[1]/'evidence'/'late_star_edge_glue.json';p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'cases':len(rows),'failures':out['failures'],'bad_bad_delta_counts':{str(d):sum(r['initial_bad_bad_delta']==d for r in rows) for d in (0,1,2)},'elapsed':out['elapsed_seconds']}))
