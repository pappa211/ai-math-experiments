from apex_probe import Exact,ROOT
from apex_private_k4 import cover_allowed
from itertools import combinations
from pathlib import Path
import random,networkx as nx,json,time,signal,hashlib
class Timeout(Exception):pass
def alarm(*_):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
rng=random.Random(18141120261915);start=time.time();ledger=[];counts={};bad=None;best=-99
while time.time()-start<88:
 p=rng.randrange(3,6);n=rng.randrange(8,min(12,3*p+1));pool=list(combinations(range(n),3));rng.shuffle(pool);P=[];B=set()
 for t in pool:
  et=set(combinations(t,2))
  if not et&B:P.append(t);B|=et
  if len(P)==p:break
 if len(P)!=p:continue
 VP=set().union(*(set(t) for t in P));E=set(B);chosen=[];feasible=True
 for t in P:
  ee=list(combinations(t,2));rng.shuffle(ee);opts=[]
  for e in ee:
   for z in VP-set(t):
    extra={tuple(sorted((e[0],z))),tuple(sorted((e[1],z)))}
    if not extra&B:opts.append((e,z,extra))
  if not opts:feasible=False;break
  e,z,extra=rng.choice(opts);E|=extra;chosen.append(e)
 if not feasible:continue
 blue=B-set(chosen);add=[]
 for e,f in combinations(blue,2):
  if len(set(e)&set(f))==1:
   ends=tuple(sorted(set(e)^set(f)))
   if ends not in E:add.append(ends)
 rng.shuffle(add);E.update(add[:rng.randrange(min(6,len(add))+1)])
 row=dict(n=n,P=P,edges=sorted(E));signal.setitimer(signal.ITIMER_REAL,.18)
 try:
  ex=Exact(nx.Graph(list(E)));tidx={t:i for i,t in enumerate(ex.tris)};ids=[tidx[t] for t in P];bm=sum(1<<ex.eidx[e] for e in B)
  ty=[]
  for j in ids:
   bases={ex.tm[k]&bm for k in range(len(ex.tris)) if k!=j and (ex.tm[k]&bm).bit_count()==1 and (ex.tm[k]&bm)&ex.tm[j]}
   ty.append(len(bases))
  if ty!=[1]*p:row['status']='NOT_ALL_TYPE1';row['types']=ty
  else:
   nu=ex.pack(ex.all)
   if nu!=p:row['status']='NOT_MAXIMUM';row['nu']=nu
   else:
    v,w=cover_allowed(ex,bm);row.update(status='COMPLETE',nu=nu,constrained_cover=v,cover=[e for i,e in enumerate(ex.edges) if w>>i&1],triangles=ex.tris)
    best=max(best,v-2*p)
    if v>2*p:bad=row
 except Timeout:row['status']='UNKNOWN'
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 ledger.append(row);counts[row['status']]=counts.get(row['status'],0)+1
 if bad:break
 if len(ledger)%5000==0:print(len(ledger),counts,round(time.time()-start,1),flush=True)
result=dict(seed=18141120261915,domain='specified P of3..5 on8..11 vertices; internal privatepages and added blue closure edges; each literal attempted case retained',counts=counts,attempts=len(ledger),best_excess=best,bad=bad,elapsed=time.time()-start,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_type1_directed.json').write_text(json.dumps(result,indent=2));(ROOT/'evidence/apex_type1_directed_ledger.json').write_text(json.dumps(ledger));print(json.dumps(result,indent=2))
