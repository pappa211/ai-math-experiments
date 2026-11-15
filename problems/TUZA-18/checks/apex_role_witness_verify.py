from itertools import combinations
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parents[1]
E=set(combinations((0,1,4,5),2))|{(2,4),(2,5),(3,4),(3,5)}
T=[t for t in combinations(range(6),3) if set(combinations(t,2))<=E]
TE=[set(combinations(t,2)) for t in T]
packings=[]
for k in range(len(T)+1):
 ps=[p for p in combinations(range(len(T)),k) if len(set().union(*(TE[i] for i in p)))==3*k]
 if ps:packings=ps;nu=k
assert nu==2 and len(packings)==4
C={(0,1),(4,5)}
assert all(C&t for t in TE)
rows=[]
for P in packings:
 B=set().union(*(TE[i] for i in P));VP=set().union(*(set(T[i]) for i in P));books=[]
 for i in P:
  private=[j for j in range(len(T)) if j!=i and len(TE[j]&B)==1 and (TE[j]&B)<=TE[i]]
  bases=set().union(*(TE[j]&B for j in private));assert len(bases)==1
  base=next(iter(bases));tip=next(v for v in T[i] if v not in base)
  books.append(dict(triangle=T[i],base=base,tip=tip,private=[T[j] for j in private]))
 collisions=[dict(tip=a['tip'],from_triangle=a['triangle'],to_base=b['base']) for a in books for b in books if a is not b and a['tip'] in b['base']]
 assert len(VP)==5 and collisions
 rows.append(dict(P=[T[i] for i in P],vertices=sorted(VP),books=books,collisions=collisions))
result=dict(status='PASS',vertices=list(range(6)),edges=sorted(E),triangles=T,nu=nu,tau=2,cover=sorted(C),max_vertex_support=5,all_maximum_packings=rows,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_role_witness_verified.json').write_text(json.dumps(result,indent=2));print(json.dumps(dict(status='PASS',triangles=len(T),nu=nu,tau=2,maxpackings=len(rows))))
