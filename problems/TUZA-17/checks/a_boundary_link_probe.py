#!/usr/bin/env python3
import itertools,json,resource,signal,sys,time
from functools import lru_cache
from pathlib import Path
start=time.monotonic();signal.alarm(45);resource.setrlimit(resource.RLIMIT_CPU,(45,45))
root=Path(__file__).resolve().parent.parent

def inspect(name,n,E):
 E=tuple(sorted({tuple(sorted(e)) for e in E}));adj=[0]*n
 for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
 @lru_cache(None)
 def matching(mask):
  if not mask:return (0,())
  bit=mask&-mask;v=bit.bit_length()-1;rem=mask^bit
  best=matching(rem)
  ns=adj[v]&rem
  while ns:
   ubit=ns&-ns;ns^=ubit;u=ubit.bit_length()-1
   val,p=matching(rem^ubit)
   if val+1>best[0]:best=(val+1,p+((v,u),))
  return best
 full=(1<<n)-1;m,M=matching(full)
 @lru_cache(None)
 def independent(mask):
  if not mask:return (0,())
  bit=mask&-mask;v=bit.bit_length()-1
  a,A=independent(mask^bit);b,B=independent(mask&~bit&~adj[v])
  return (b+1,B+(v,)) if b+1>a else (a,A)
 alpha,I=independent(full)
 triangles=[T for T in itertools.combinations(range(n),3) if all(adj[u]>>v&1 for u,v in itertools.combinations(T,2))]
 six_min_edges=10**9;six_matching_sets=[];best=None;counts={}
 for s in range(n,-1,-1):
  tested=0;matchinduced=0;extendable=0
  for V in itertools.combinations(range(n),s):
   mask=sum(1<<v for v in V);F=[];used=0;valid=True
   edgecount=sum((adj[v]&mask).bit_count() for v in V)//2
   if s==6:six_min_edges=min(six_min_edges,edgecount)
   for u,v in E:
    if mask>>u&1 and mask>>v&1:
     F.append((u,v))
     if used>>u&1 or used>>v&1:valid=False
     used|=(1<<u)|(1<<v)
   tested+=1
   if not valid:continue
   matchinduced+=1
   if s==6:six_matching_sets.append({'vertices':V,'edges':F})
   k,P=matching(full&~used)
   if len(F)+k==m:
    extendable+=1
    if best is None:best={'independent_after_deletion':V,'forced_induced_matching':F,'maximum_matching':F+list(P),'independence_size':s,'residual_vc':n-s}
  counts[s]={'vertex_subsets':tested,'induced_matching_subsets':matchinduced,'extendable_to_maximum':extendable}
 # continue all sizes to retain exact six-set diagnostics and full completeness counts
 assert best is not None
 states=[]
 for v in range(n):states.append(matching(full&~(1<<v))[0])
 out={'name':name,'n':n,'edges':E,'actual_triangles':triangles,'matching_number':m,'matching_witness':M,'independence_number':alpha,'independent_set':I,'vertex_cover_number':n-alpha,'vertex_deletion_matching_numbers':states,'best_matching_deletion':best,'min_induced_edges_on_six_vertices':six_min_edges,'six_vertex_induced_matchings':six_matching_sets,'subset_counts':counts,'matching_cache_states':matching.cache_info().currsize,'independence_cache_states':independent.cache_info().currsize}
 return out
E13={(i,(i+d)%13) for i in range(13) for d in (1,5)}
E15={(5*k+i,5*k+(i+1)%5) for k in range(3) for i in range(5)}
rows=[inspect('C13_steps_1_5',13,E13),inspect('three_disjoint_C5',15,E15)]
assert [(r['matching_number'],r['vertex_cover_number']) for r in rows]==[(6,9),(6,9)]
assert not any(r['actual_triangles'] for r in rows)
out={'status':'COMPLETE','scope':'two specified links only; no full eligible H boundary realization','rows':rows,'python':sys.version,'elapsed_seconds':time.monotonic()-start,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
(root/'evidence/a_boundary_link_probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'results':[{'name':r['name'],'mu':r['matching_number'],'vc':r['vertex_cover_number'],'min_vc_after_maximum_matching_deletion':r['best_matching_deletion']['residual_vc'],'min_edges_on_six_vertices':r['min_induced_edges_on_six_vertices'],'six_induced_matching_count':len(r['six_vertex_induced_matchings'])} for r in rows],'elapsed_seconds':out['elapsed_seconds']}))
