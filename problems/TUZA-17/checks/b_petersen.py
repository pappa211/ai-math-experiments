#!/usr/bin/env python3
"""Complete tiny certificate for the Petersen link-only limitation."""
from pathlib import Path
from itertools import combinations
import json,time,platform
W=Path(__file__).resolve().parents[1];start=time.monotonic();n=10
E={tuple(sorted(e)) for i in range(5) for e in [(i,(i+1)%5),(5+i,5+(i+2)%5),(i,5+i)]}
A=[set() for _ in range(n)]
for u,v in E:A[u].add(v);A[v].add(u)
assert all(len(a)==3 for a in A)
assert not any(all(tuple(sorted(e)) in E for e in combinations(t,2)) for t in combinations(range(n),3))
def enumerate_pm(left):
 if not left:return [()]
 u=min(left);out=[]
 for v in sorted(A[u]&left):
  for rem in enumerate_pm(left-{u,v}):out.append((tuple(sorted((u,v))),)+rem)
 return out
pms=enumerate_pm(set(range(n)));assert len(pms)==6
rows=[]
for M in pms:
 mm=set(M);compE=E-mm;adj=[set() for _ in range(n)]
 for u,v in compE:adj[u].add(v);adj[v].add(u)
 assert all(len(a)==2 for a in adj)
 seen=set();comps=[]
 for r in range(n):
  if r in seen:continue
  todo=[r];seen.add(r);part=[]
  while todo:
   u=todo.pop();part.append(u)
   for v in adj[u]:
    if v not in seen:seen.add(v);todo.append(v)
  comps.append(sorted(part))
 assert sorted(map(len,comps))==[5,5]
 rows.append({'matching':sorted(mm),'complement_edges':sorted(compE),'complement_components':comps,'vertex_cover_of_complement':6})
forced=set.intersection(*(set(M) for M in pms));assert not forced
ind=[]
for k in range(n+1):
 curr=[list(S) for S in combinations(range(n),k) if not any(tuple(sorted(e)) in E for e in combinations(S,2))]
 if curr:alpha=k;ind=curr
assert alpha==4
out={'status':'PASS','vertices':'0..4 are outer u_i;5..9 are inner v_i','edges':sorted(E),'trianglefree':True,'matching':5,'independence':4,'vertex_cover':6,'maximum_independent_sets':ind,'perfect_matching_count':len(pms),'all_perfect_matchings':rows,'forced_edges':sorted(forced),'completeness':'recursively pair the least remaining vertex with each available neighbor; every perfect matching takes exactly one such branch at every depth','family_consequence':'q disjoint copies, q>=2: m=5q, every maxM leaves2q C5s and vc=6q>m+1; R empty','not_claimed':'No surrounding eligible H at budgetm+1, no AC counterexample','runtime_seconds':time.monotonic()-start,'python':platform.python_version()}
(W/'evidence/b_petersen.json').write_text(json.dumps(out,indent=2)+'\n');print('six perfect matchings',len(pms),'alpha',alpha,'runtime',out['runtime_seconds'])
