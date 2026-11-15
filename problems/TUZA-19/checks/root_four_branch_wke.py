#!/usr/bin/env python3
"""Complete fixed canonical domain for the four-branch WKE candidate.
No arbitrary graph census: completeness requires the separately written reductions.
"""
from itertools import combinations,product
from functools import lru_cache
from pathlib import Path
import json,time,platform,hashlib
assert platform.system()=='Darwin'
start=time.time()
def build(b,states):
 E=set();n=b
 for (u,v),s in zip(combinations(range(b),2),states):
  if s in (1,4):E.add((u,v))
  if s in (2,4):E.update([(u,n),(v,n)]);n+=1
  if s==3:E.update([(u,n),(n,n+1),(v,n+1)]);n+=2
 return n,sorted(tuple(sorted(e)) for e in E)
def witness(n,E,b):
 adj=[0]*n
 for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
 full=(1<<n)-1
 @lru_cache(None)
 def matching(mask):
  if not mask:return ()
  u=(mask&-mask).bit_length()-1;rest=mask&~(1<<u);best=matching(rest);c=adj[u]&rest
  while c:
   v=(c&-c).bit_length()-1;c&=c-1
   z=((u,v),)+matching(rest&~(1<<v))
   if len(z)>len(best):best=z
  return best
 limit=len(matching(full))
 branch=(1<<b)-1
 def check(q):
  U=full&~q;force=[];used=0
  for u in range(n):
   if not U>>u&1:continue
   z=adj[u]&U
   if z.bit_count()>1:return None
   if z:
    v=z.bit_length()-1
    if u<v:force.append((u,v));used|=(1<<u)|(1<<v)
  M=tuple(force)+matching(full&~used)
  if len(M)>=q.bit_count():
   Q=[i for i in range(n) if q>>i&1];ms={tuple(sorted(e)) for e in M}
   assert len(set(x for e in M for x in e))==2*len(M)
   assert ms<=set(E) and all(e in ms or e[0] in Q or e[1] in Q for e in E)
   return {'M':M,'Q':Q}
  return None
 z=check(branch)
 if z:return z
 for r in range(limit+1):
  for qs in combinations(range(n),r):
   q=sum(1<<v for v in qs)
   if q==branch:continue
   z=check(q)
   if z:return z
 return None
rows=[];counts={};failure=None;raw=0
for b in range(1,5):
 counts[str(b)]=0
 pairs=list(combinations(range(b),2))
 for states in product(range(5),repeat=len(pairs)):
  raw+=1;deg=[0]*b
  for (u,v),s in zip(pairs,states):
   c=2 if s==4 else int(s!=0);deg[u]+=c;deg[v]+=c
  if min(deg,default=0)<3:continue
  # Retain every kernel, connected or not: enlarging this finite domain is harmless.
  n,E=build(b,states);z=witness(n,E,b)
  counts[str(b)]+=1
  row={'branches':b,'states':states,'n':n,'edges':E,'witness':z};rows.append(row)
  if z is None:failure=row;break
 if failure:break
out={'status':'COUNTEREXAMPLE' if failure else 'ALL_FIXED_KERNELS_CERTIFIED','raw_state_vectors':raw,'counts':counts,'kernels':rows,'failure':failure,'seconds':time.time()-start,'scope':'All pair states0,D,E2,O3,D+E2 on at most4 labeled branches, each degree>=3; no loops. All-size scope depends on proved reductions.'}
p=Path('evidence/four_branch_wke');p.mkdir(exist_ok=True);(p/'canonical_witnesses.json').write_text(json.dumps(out,separators=(',',':'))+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='kernels'},indent=2))
