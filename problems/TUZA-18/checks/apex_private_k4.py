from apex_probe import Exact,ROOT
from pruned_cut_probe import maxpackings
from functools import lru_cache
from itertools import combinations
import networkx as nx,signal,time,json,hashlib
from pathlib import Path
class Timeout(Exception):pass
def alarm(*_):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
def allowed(ex,P):
 B=0
 for j in P:B|=ex.tm[j]
 A=B;blocks=[]
 for j in P:
  t=set(ex.tris[j])
  for x in set(ex.g)-t:
   vs=sorted(t|{x});es=list(combinations(vs,2))
   if not all(e in ex.eidx for e in es):continue
   outside=sum(1<<ex.eidx[tuple(sorted((x,v)))] for v in t)
   if outside&B:continue
   A|=outside;blocks.append(vs)
 return A,blocks
def cover_allowed(ex,A):
 @lru_cache(None)
 def go(state):
  if not state:return 0,0
  j=min((j for j in range(len(ex.tris)) if state>>j&1),key=lambda j:(ex.tm[j]&A).bit_count())
  opts=[]
  for e in range(len(ex.edges)):
   if ex.tm[j]&A&(1<<e):
    v,w=go(state&~ex.et[e]);opts.append((1+v,w|(1<<e)))
  return min(opts) if opts else (10**6,0)
 return go(ex.all)
start=time.time();results=[]
for idx,g in enumerate(nx.graph_atlas_g()):
 t=time.time();done=0;bad=[];good=None;status='COMPLETE';signal.setitimer(signal.ITIMER_REAL,.5)
 try:
  ex=Exact(g);p=ex.pack(ex.all)
  for P in maxpackings(ex,ex.all):
   A,blocks=allowed(ex,P);v,w=cover_allowed(ex,A);done+=1
   if v>2*p:bad.append(dict(P=P,allowed=[e for i,e in enumerate(ex.edges) if A>>i&1],minimum_cover=v,private_blocks=blocks))
   elif good is None:good=dict(P=P,cover=[e for i,e in enumerate(ex.edges) if w>>i&1],cost=v)
 except Timeout:status='UNKNOWN'
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 row=dict(index=idx,status=status,edges=sorted(g.edges()),packings_tested=done,bad=bad,good=good,elapsed=time.time()-t)
 if status=='COMPLETE':row.update(nu=p,all_claim=not bad,exists_claim=good is not None,triangles=ex.tris)
 results.append(row)
 if bad:print('BAD',idx,len(bad),status,flush=True)
 if status=='COMPLETE' and good is None:print('FULL_REFUTATION',idx,flush=True);break
result=dict(domain='NetworkX atlas through7 vertices, all maximum packings; .5s per graph; timeout UNKNOWN',results=results,elapsed=time.time()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_private_k4.json').write_text(json.dumps(result,indent=2));print(json.dumps(dict(graphs=len(results),bad=sum(bool(r['bad']) for r in results),unknown=sum(r['status']=='UNKNOWN' for r in results),elapsed=result['elapsed'])))
