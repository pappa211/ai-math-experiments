#!/usr/bin/env python3
"""Separately written verifier: reconstruct all actual triangles and check certificates."""
import itertools,json,resource,signal,sys,time
from pathlib import Path
start=time.monotonic();signal.alarm(60);resource.setrlimit(resource.RLIMIT_CPU,(60,60))
root=Path(__file__).resolve().parent.parent
source=root/'evidence/a_constructive_checks.json'
data=json.loads(source.read_text());summaries=[]
for case in data['probes']:
 b,t,q=case['base_n'],case['t'],case['q'];N=2*b*t
 base={frozenset(e) for e in case['base_edges']}
 V=range(N+q)
 def adjacent(u,v):
  if u==v:return False
  if max(u,v)>=N:return min(u,v)<N
  cu,cv=u//t,v//t;lu,bu=divmod(cu,b);lv,bv=divmod(cv,b)
  return (lu==lv and frozenset((bu,bv)) in base) or (lu!=lv and bu==bv)
 E={frozenset((u,v)) for u,v in itertools.combinations(V,2) if adjacent(u,v)}
 T=[];incidence={e:0 for e in E}
 for triple in itertools.combinations(V,3):
  edges=[frozenset(x) for x in itertools.combinations(triple,2)]
  if all(e in E for e in edges):
   T.append(frozenset(triple))
   for e in edges:incidence[e]+=1
 Tset=set(T)
 assert len(E)==case['graph_edges'] and len(T)==case['predicted_triangles']
 assert all(len([v for v in T0 if v>=N])==1 for T0 in T)
 assert min(incidence.values())==q
 for cert in case['certificates']:
  triangles=[];packing_edges=[]
  assert len(cert['rim_perfect_matchings'])==q
  for a,M in enumerate(cert['rim_perfect_matchings']):
   endpoints=[v for uv in M for v in uv]
   assert sorted(endpoints)==list(range(N)), 'not a perfect rim matching'
   for u,v in M:
    tri=frozenset((N+a,u,v));assert tri in Tset
    triangles.append(tri);packing_edges += [frozenset(x) for x in itertools.combinations(tri,2)]
  assert len(triangles)==q*N//2
  assert len(set(packing_edges))==3*len(triangles), 'reused graph edge'
  assert {frozenset((N+a,u,v)) for a,u,v in cert['prescribed']}<=set(triangles)
  used_spokes=[e for e in packing_edges if any(v>=N for v in e)]
  assert len(used_spokes)==q*N and len(set(used_spokes))==q*N
 summaries.append({'q':q,'t':t,'graph_order':N+q,'graph_edges':len(E),'all_actual_triangles':len(T),'exact_nu_from_spoke_upper_and_witness':q*N//2,'checked_packing_certificates':len(case['certificates']),'minimum_triangle_codegree':min(incidence.values()),'status':'PASS'})
# Rebuild the seed with a second explicit construction, then check adjacency.
vertices=5;edges={tuple(sorted((i,(i+1)%5))) for i in range(5)}
for step in range(2):
 old=edges.copy();new_edges=old.copy()
 for i in range(vertices):
  new_edges.add((vertices+i,2*vertices))
  for j in range(vertices):
   if tuple(sorted((i,j))) in old:new_edges.add(tuple(sorted((vertices+i,j))))
 edges=new_edges;vertices=2*vertices+1
assert vertices==data['large_symbolic_seed']['base_n']==23
assert edges=={tuple(e) for e in data['large_symbolic_seed']['base_edges']}
assert len(edges)==71
assert not any(all(tuple(sorted(x)) in edges for x in itertools.combinations(T0,2)) for T0 in itertools.combinations(range(vertices),3))
large=data['large_symbolic_seed'];q,t=large['q'],large['t'];b=2*vertices
assert t>=2*q+8
assert q+b*t==large['graph_order']
assert q*b*t//2==large['nu']
assert 2*t*t==large['colour_cost_lower_bound']>large['two_nu']==q*b*t
assert q*(b-1)*t==large['explicit_cover_size']<large['two_nu']
assert q*(2*71+23)*t*t==large['actual_triangle_count_formula']
out={'status':'PASS','verifier':'separate source; same Track A AI author; no call to producer and no optimisation solver','python':sys.version,'scope':'all actual triangles of three finite probe graphs; 116 packing certificates; independently rebuilt 23-vertex seed and symbolic large-example arithmetic','summaries':summaries,'large_graph_enumerated':False,'universal_extension_theorem':'ordinary proof; not inferred from finite checks','time_limit_seconds':60,'elapsed_seconds':time.monotonic()-start,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
(root/'evidence/a_verified.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'graphs':len(summaries),'certificates':sum(s['checked_packing_certificates'] for s in summaries),'triangles':sum(s['all_actual_triangles'] for s in summaries),'elapsed_seconds':out['elapsed_seconds'],'peak_rss_bytes_darwin':out['peak_rss_bytes_darwin']}))
