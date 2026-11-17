"""One literal graph, independent exact cover recurrence; no producer import."""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import hashlib,json,time
ROOT=Path(__file__).resolve().parents[1]
start=time.monotonic(); deadline=start+25
pairs=list(combinations(range(5),2)); n=12
P={tuple(sorted((i,j))) for i,j in combinations(range(10),2) if set(pairs[i]).isdisjoint(pairs[j])}
E=P|{(i,a) for i in range(10) for a in (10,11)}
def all_triangles(edges):
 return [t for t in combinations(range(n),3) if all(tuple(sorted(e)) in edges for e in combinations(t,2))]
T=all_triangles(E)
u=pairs.index((0,1));v=pairs.index((2,3));removed=tuple(sorted((u,v,10)))
assert removed in T
F=E-{tuple(sorted(e)) for e in combinations(removed,2)}
R=all_triangles(F);edges=sorted(F)
hits=[sum(1<<i for i,t in enumerate(R) if set(e)<=set(t)) for e in edges]
options=[[j for j,e in enumerate(edges) if set(e)<=set(t)] for t in R]
full=(1<<len(R))-1;nodes=0
@lru_cache(maxsize=300000)
def minimum(s):
 global nodes
 nodes+=1
 if nodes%1024==0 and time.monotonic()>deadline: raise TimeoutError
 if not s:return ()
 remaining=[i for i in range(len(R)) if s>>i&1]
 t=max(remaining,key=lambda i:max((s&hits[e]).bit_count() for e in options[i]))
 choices=sorted(options[t],key=lambda e:-(s&hits[e]).bit_count())
 best=None
 for e in choices:
  ans=(e,)+minimum(s&~hits[e])
  if best is None or len(ans)<len(best):best=ans
 return best
result={'status':'UNKNOWN','domain':'one fixed Petersen double-cone residual; no census','n':n,'vertex_labels':[list(x) for x in pairs]+['a','b'],'original_edges':sorted(E),'original_triangles':T,'removed_triangle':removed,'residual_edges':edges,'residual_triangles':R,'original_counts':{'vertices':n,'edges':len(E),'triangles':len(T)},'residual_counts':{'edges':len(F),'triangles':len(R)},'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'ordinary_source_sha256':hashlib.sha256((ROOT/'notes/minimum_exact_cover_fractional_residual_boundary_v1.md').read_bytes()).hexdigest(),'producer_optimizer_imported':False,'internal_deadline_seconds':25}
try:
 answer=minimum(full);cover=[edges[e] for e in answer]
 assert all(any(set(e)<=set(t) for e in cover) for t in R)
 assert len(set(cover))==len(cover)
 result.update(status='EXACT',tau=len(cover),cover=cover,budget_9_feasible=len(cover)<=9,budget_10_feasible=len(cover)<=10)
except TimeoutError:
 result['unknown_reason']='internal_deadline'
result.update(seconds=time.monotonic()-start,nodes=nodes,cache=minimum.cache_info()._asdict())
(ROOT/'evidence/petersen_double_cone_residual_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('status','seconds','nodes')}|{'tau':result.get('tau')}))
