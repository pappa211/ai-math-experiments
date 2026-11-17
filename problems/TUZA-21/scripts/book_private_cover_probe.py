#!/usr/bin/env python3
"""Bounded independently authored falsifier for minimum-cover private triangles."""
from functools import lru_cache
from itertools import combinations
from pathlib import Path
import datetime,json,platform,random,time,resource
assert platform.system()=='Darwin'
start=time.monotonic(); deadline=start+45; rng=random.Random(21003)
cap=2000; records=[]; found=None

def case(n,E,label):
 E=sorted(E); ei={e:i for i,e in enumerate(E)}
 tri=[tuple(t) for t in combinations(range(n),3) if all(e in ei for e in combinations(t,2))]
 if not tri:return
 masks=[sum(1<<ei[e] for e in combinations(t,2)) for t in tri]
 hit=[sum(1<<i for i,s in enumerate(masks) if s>>e&1) for e in range(len(E))]
 @lru_cache(None)
 def tau(ts):
  if not ts:return 0
  t=(ts&-ts).bit_length()-1
  return 1+min(tau(ts&~hit[e]) for e in range(len(E)) if masks[t]>>e&1)
 full=(1<<len(tri))-1; tv=tau(full)
 seen=set(); tested=0; capped=False
 @lru_cache(None)
 def nu(ts):
  if not ts:return 0
  i=(ts&-ts).bit_length()-1
  exclude=ts&~(1<<i)
  for e in range(len(E)):
   if masks[i]>>e&1:exclude &= ~hit[e]
  return max(nu(ts&~(1<<i)),1+nu(exclude))
 def walk(ts,c):
  nonlocal tested,capped
  global found
  if time.monotonic()>deadline:raise TimeoutError
  if not ts:
   if c in seen:return
   seen.add(c); tested+=1
   if tested>cap:capped=True;return
   private=sum(1<<i for i,s in enumerate(masks) if (s&c).bit_count()==1)
   pv=nu(private)
   if 2*pv<tv:
    found={'label':label,'n':n,'edges':E,'triangles':tri,'tau':tv,'cover':[E[e] for e in range(len(E)) if c>>e&1],'private_triangles':[t for i,t in enumerate(tri) if private>>i&1],'private_nu':pv}
   return
  i=(ts&-ts).bit_length()-1
  for e in range(len(E)):
   if masks[i]>>e&1:
    rem=ts&~hit[e]
    if tau(rem)==tau(ts)-1:
     walk(rem,c|1<<e)
     if found or capped:return
 walk(full,0)
 records.append({'label':label,'n':n,'m':len(E),'triangles':len(tri),'tau':tv,'covers_checked':min(tested,cap),'status':'COUNTEREXAMPLE' if found else 'PARTIAL' if capped else 'COMPLETE'})

try:
 # Literal random graphs are targeted at the universal quantifier over all minimum covers.
 for j in range(500):
  n=rng.choice([6,7,8,9]);prob=rng.choice([.45,.6,.75,.9])
  E={e for e in combinations(range(n),2) if rng.random()<prob}
  case(n,E,f'random-{j}-p{prob}')
  if found:break
except TimeoutError:
 records.append({'status':'UNKNOWN','reason':'45-second deadline inside current case'})
out={'seed':21003,'seconds':time.monotonic()-start,'deadline_seconds':45,'cover_cap':cap,'counterexample':found,'records':records,'peak_self_rss_bytes_Darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'run_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('results/book_private_cover_probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'cases':len(records),'counterexample':found,'seconds':out['seconds']}))
