"""Tiny exact controls for the two matching-shape theorem statements."""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json
def solve(name,E,S):
 E=sorted(E);n=1+max(max(e) for e in E)
 T=[t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))]
 M=[sum(1<<E.index(e) for e in combinations(t,2)) for t in T]
 @lru_cache(None)
 def pack(ts):
  if not ts:return ()
  choices=[(j,)+pack(tuple(k for k in ts if not M[j]&M[k])) for j in ts]
  return max(choices,key=len)
 @lru_cache(None)
 def cover(ts):
  if not ts:return ()
  return min(((i,)+cover(tuple(j for j in ts if not M[j]>>i&1)) for i in range(len(E)) if M[ts[0]]>>i&1),key=len)
 ts=tuple(range(len(T)));p=pack(ts);c=cover(ts)
 dels=[]
 for i,e in enumerate(E):
  z=pack(tuple(j for j in ts if not M[j]>>i&1));dels.append({'edge':e,'nu':len(z),'packing':[T[j] for j in z]})
 sm=sum(1<<E.index(e) for e in S);old=tuple(j for j in ts if not M[j]&sm)
 return {'name':name,'edges':E,'S':S,'all_actual_triangles':T,'nu':len(p),'tau':len(c),'packing':[T[j] for j in p],'cover':[E[i] for i in c],'deletion_packings':dels,'single_edge_resilient':all(x['nu']==len(p) for x in dels),'L_nu':len(pack(old)),'L_tau':len(cover(old)),'L_triangles':[T[j] for j in old]}
clique=lambda vs:set(combinations(vs,2))
records=[solve('twoK4_shared_edge_matching',clique([0,1,2,3])|clique([0,1,4,5]),[(0,1),(2,3),(4,5)]),solve('K5_minus02_P3_plus_edge',clique(range(5))-{(0,2)},[(0,1),(1,2),(3,4)])]
rim=[0,4,3,2,5];E={tuple(sorted((rim[i],rim[(i+1)%5]))) for i in range(5)}|{tuple(sorted((1,v))) for v in rim}
records.append(solve('W5_P3_plus_edge',E,[(0,1),(1,2),(3,4)]))
p=Path(__file__).resolve().parents[1]/'evidence/matching26_controls.json';p.write_text(json.dumps({'status':'EXACT_SMALL_CONTROLS','method':'Exhaustive memoized packing and cover recursion over every actual triangle. Deletion packings are explicit lower witnesses; recursion supplies exact optima.','records':records},indent=2)+'\n')
for r in records:print(r['name'],r['nu'],r['tau'],r['single_edge_resilient'],r['L_nu'],r['L_tau'])
print(p)
