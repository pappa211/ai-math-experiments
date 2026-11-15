from apex_probe import Exact, ROOT
import networkx as nx, random, time, signal, json, sys, hashlib
from itertools import combinations
from pathlib import Path
class Timeout(Exception):pass
def timeout(a,b):raise Timeout()
signal.signal(signal.SIGALRM,timeout)
rng=random.Random(1814112026);start=time.time();done=0;unknown=0;bad=[];maxex=-99;best=[];types={}
while time.time()-start<175:
 i=done+unknown;n=rng.randrange(7,13);mode=i%3;g=nx.empty_graph(n)
 if mode==0:
  prob=rng.uniform(.3,.85)
  g.add_edges_from(e for e in combinations(range(n),2) if rng.random()<prob)
 elif mode==1:
  for j in range(rng.randrange(2,6)):
   g.add_edges_from(combinations(rng.sample(range(n),rng.choice([3,4,4,5])),2))
 else:
  g.add_edges_from(combinations(range(rng.choice([4,5])),2))
  for v in range(5,n):
   pool=list(range(v));rng.shuffle(pool)
   g.add_edges_from(combinations([v]+pool[:rng.choice([2,3,4])],2))
  for e in list(g.edges()):
   if rng.random()<.1:g.remove_edge(*e)
 try:
  signal.setitimer(signal.ITIMER_REAL,.3)
  ex=Exact(g);rows=ex.inspect();signal.setitimer(signal.ITIMER_REAL,0)
 except Timeout:
  signal.setitimer(signal.ITIMER_REAL,0);unknown+=1;continue
 done+=1;types[mode]=types.get(mode,0)+1
 for row in rows:
  score=row['min_restricted']-2*row['nu_g']
  if score>maxex:maxex=score;best=[dict(edges=ex.edges,row=row)]
  if score>0:bad.append(dict(edges=ex.edges,triangles=ex.tris,row=row))
 if bad:break
 if done%1000==0:print(done,unknown,round(time.time()-start,1),maxex,flush=True)
data=dict(seed=1814112026,domain='three specified random/structured generators order7..12; individual .3s timeout',completed=done,unknown=unknown,types=types,bad=bad,max_excess=maxex,best=best,elapsed=time.time()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence'/'apex_random.json').write_text(json.dumps(data,indent=2));print(json.dumps({k:v for k,v in data.items() if k not in ['best','bad']}));print('BAD',len(bad))
