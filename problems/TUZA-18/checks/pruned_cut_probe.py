"""Exact targeted discriminator for pruned packed-edge cut covers.
All graph triangles reconstructed; integers only. A timeout is UNKNOWN.
"""
import json, time, signal, hashlib, sys
from pathlib import Path
from functools import lru_cache
import networkx as nx
from apex_probe import Exact
ROOT=Path(__file__).resolve().parents[1]

class Timeout(Exception): pass
def alarm(*_): raise Timeout()
signal.signal(signal.SIGALRM,alarm)

def maxpackings(ex,state):
 if not state:
  yield ();return
 j=(state&-state).bit_length()-1
 val=ex.pack(state)
 if 1+ex.pack(state&~ex.conf[j])==val:
  for p in maxpackings(ex,state&~ex.conf[j]):yield (j,)+p
 if ex.pack(state&~(1<<j))==val:
  yield from maxpackings(ex,state&~(1<<j))

def packing_cuts(ex,P):
 B=0
 for j in P:B|=ex.tm[j]
 n=len(ex.g);p=len(P)
 for cut in range(1<<max(0,n-1)):
  same=sum(1<<i for i,(u,v) in enumerate(ex.edges) if ((cut>>u)^(cut>>v))&1==0)
  Q=B&same;D=0
  for tri in ex.tm:
   s=tri&same
   if s.bit_count()==1 and not s&B:D|=s
  cost=D.bit_count()
  if cost>2*p:continue
  state=ex.all
  for i in range(len(ex.edges)):
   if D>>i&1:state&=~ex.et[i]
  @lru_cache(None)
  def constrained(s):
   if not s:return 0,0
   j=min((j for j in range(len(ex.tm)) if s>>j&1),key=lambda j:(ex.tm[j]&Q).bit_count())
   opts=[(1+constrained(s&~ex.et[i])[0],(1<<i)|constrained(s&~ex.et[i])[1]) for i in range(len(ex.edges)) if (ex.tm[j]&Q)&(1<<i)]
   return min(opts) if opts else (100000,0)
  value,wit=constrained(state)
  if cost+value<=2*p:
   C=D|wit
   assert all(t&C for t in ex.tm)
   return dict(cut=cut,P=list(P),cover=[ex.edges[i] for i in range(len(ex.edges)) if C>>i&1],cost=cost+value,outside_fixed=D.bit_count())
 return None

def inspect(g,seconds):
 signal.setitimer(signal.ITIMER_REAL,seconds)
 started=time.monotonic();done=0;bad=[];good=[]
 try:
  ex=Exact(g);p=ex.pack(ex.all)
  for P in maxpackings(ex,ex.all):
   w=packing_cuts(ex,P);done+=1
   if w is None:bad.append(list(P))
   elif not good:good.append(w)
  status='COMPLETE'
 except Timeout:status='UNKNOWN'
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 result=dict(status=status,n=len(g),edges=sorted(tuple(sorted(e)) for e in g.edges()),packings_tested=done,bad_packings=bad,success_witness=good,elapsed=time.monotonic()-started)
 if status=='COMPLETE':result.update(nu=p,triangles=ex.tris,any_packing_claim=not bad,exists_packing_claim=bool(good))
 return result

def main():
 results=[];start=time.monotonic()
 for idx,g in enumerate(nx.graph_atlas_g()):
  r=inspect(g,0.5);r['atlas_index']=idx;results.append(r)
  if r['bad_packings']:print('BAD_PACKING',idx,len(r['bad_packings']),r['status'],flush=True)
  if r['status']=='COMPLETE' and not r['exists_packing_claim']:
   print('REFUTATION',idx,flush=True);break
  if idx%100==0:print('progress',idx,round(time.monotonic()-start,2),flush=True)
 out=dict(hypothesis='Every maximum packing admits a cut and pruning of selected packed edges to cost at most twice packing size; weaker version permits choosing maximum packing.',domain='NetworkX graph atlas, all unlabeled simple graphs order<=7; each maximum packing and each cut up to complement, stopping cuts upon a valid witness',method='exact exhaustive integer recurrences; per graph 0.5 seconds; timeout UNKNOWN',python=sys.version,networkx=nx.__version__,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),results=results,elapsed=time.monotonic()-start)
 (ROOT/'evidence/pruned_cut_atlas.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(dict(graphs=len(results),unknown=sum(r['status']=='UNKNOWN' for r in results),bad=sum(bool(r['bad_packings']) for r in results),elapsed=out['elapsed'])))
if __name__=='__main__':main()
