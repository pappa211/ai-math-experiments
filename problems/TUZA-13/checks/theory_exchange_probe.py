#!/usr/bin/env python3
"""Bounded auxiliary hitting-set test; does not test central two-red conjecture."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json,time,fcntl,sys,hashlib
W=Path(__file__).resolve().parents[1]
class Limit(Exception):pass

def smaller_cover(n,edges,C,seconds=.5):
 es=[tuple(e) for e in edges]; ix={e:i for i,e in enumerate(es)}
 ts=[t for t in combinations(range(n),3) if all(e in ix for e in combinations(t,2))]
 masks=[sum(1<<ix[e] for e in combinations(t,2)) for t in ts]
 cm=sum(1<<ix[tuple(e)] for e in C)
 elig=[m for m in masks if (m&cm).bit_count()<3]
 inc=[sum(1<<j for j,m in enumerate(elig) if m>>i&1) for i in range(len(es))]
 until=time.monotonic()+seconds;nodes=0
 @lru_cache(None)
 def solve(U,k):
  nonlocal nodes
  nodes+=1
  if nodes%128==0 and time.monotonic()>until:raise Limit()
  if not U:return ()
  if not k:return None
  mh=max((U&m).bit_count() for m in inc)
  if U.bit_count()>k*mh:return None
  ids=[j for j in range(len(elig)) if U>>j&1]
  used=0;lb=0
  for j in ids:
   if not used&elig[j]:used|=elig[j];lb+=1
  if lb>k:return None
  t=max(ids,key=lambda j:sum((U&inc[e]).bit_count() for e in range(len(es)) if elig[j]>>e&1))
  choices=sorted([e for e in range(len(es)) if elig[t]>>e&1],key=lambda e:-(U&inc[e]).bit_count())
  for e in choices:
   ans=solve(U&~inc[e],k-1)
   if ans is not None:return (e,)+ans
  return None
 ans=solve((1<<len(elig))-1,len(C)-1)
 return None if ans is None else [es[e] for e in ans],nodes,ts

def main():
 out={'claim':'tau(T<=2(C)) = tau(G) for every minimum C','status':'SURVIVED_TESTED_DOMAIN','records':[],'timeouts':[],'graph_count':0,'cover_count':0,'allred_cover_count':0,'skipped_no_T3':0,'sources':[]}
 start=time.monotonic();end=start+80
 with (W/'evidence/compute.lock').open('a+') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX);start=time.monotonic();end=start+80
  for file in sys.argv[1:]:
   p=W/'evidence'/file
   out['sources'].append({'path':file,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
   for line in p.read_text().splitlines():
    g=json.loads(line)
    if g.get('status')!='EXACT':continue
    out['graph_count']+=1
    for r in g['records']:
     out['cover_count']+=1
     if r['class_sizes'][2]==0:out['skipped_no_T3']+=1;continue
     out['allred_cover_count']+=1
     label=g['input']['name']
     try:
      F,nodes,ts=smaller_cover(g['input']['n'],g['input']['edges'],r['cover'])
     except Limit:
      out['timeouts'].append({'graph':label,'cover':r['cover']});continue
     out['records'].append({'graph':label,'cover':r['cover'],'nodes':nodes,'smaller_cover':F})
     if F is not None:
      out['status']='AUXILIARY_REFUTED_EXACT'
      witness={'input':g['input'],'triangles':ts,'minimum_C':r['cover'],'tau_G':g['tau'],'eligible_cover_F':F,'discovery_record':g,'warning':'This is not a refutation of two-red packing conjecture.'}
      (W/'witnesses/theory_tau_drop.json').write_text(json.dumps(witness,indent=2)+'\n')
      out['witness']='witnesses/theory_tau_drop.json';break
    if out['status']=='AUXILIARY_REFUTED_EXACT' or time.monotonic()>end:break
   if out['status']=='AUXILIARY_REFUTED_EXACT' or time.monotonic()>end:break
 out['elapsed_seconds']=time.monotonic()-start
 (W/'evidence/theory_exchange_probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'},indent=2))
if __name__=='__main__':main()
