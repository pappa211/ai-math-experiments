from functools import lru_cache
from itertools import combinations
import networkx as nx, json, time, sys, hashlib, platform
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
class Exact:
 def __init__(self,g):
  self.g=g;self.edges=sorted(tuple(sorted(e)) for e in g.edges());self.eidx={e:i for i,e in enumerate(self.edges)}
  self.tris=[t for t in combinations(sorted(g),3) if all(g.has_edge(*e) for e in combinations(t,2))]
  self.tm=[sum(1<<self.eidx[e] for e in combinations(t,2)) for t in self.tris]
  self.et=[sum(1<<j for j,t in enumerate(self.tm) if t>>i&1) for i in range(len(self.edges))]
  self.conf=[sum(1<<j for j,u in enumerate(self.tm) if t&u) for t in self.tm]
  @lru_cache(None)
  def cover(s):
   if not s:return 0
   j=(s&-s).bit_length()-1
   return 1+min(cover(s&~self.et[i]) for i in range(len(self.edges)) if self.tm[j]>>i&1)
  @lru_cache(None)
  def pack(s):
   if not s:return 0
   j=max((i for i in range(len(self.tris)) if s>>i&1),key=lambda i:(s&self.conf[i]).bit_count())
   if (s&self.conf[j]).bit_count()==1:return 1+pack(s&~(1<<j))
   return max(pack(s&~(1<<j)),1+pack(s&~self.conf[j]))
  self.cover=cover;self.pack=pack;self.all=(1<<len(self.tris))-1
 def inspect(self):
  p=self.pack(self.all);tg=self.cover(self.all);rows=[]
  for z in self.g:
   hstate=sum(1<<i for i,t in enumerate(self.tris) if z not in t);th=self.cover(hstate);X=sorted(self.g[z]);lam=None;wit=None
   for k in range(len(X)+1):
    for S in combinations(X,k):
     keep=set(X)-set(S);F=[i for i,(a,b) in enumerate(self.edges) if a in keep and b in keep]
     if len(F)>th:continue
     state=hstate
     for i in F:state&=~self.et[i]
     if len(F)+self.cover(state)==th:lam=k;wit=list(S);break
    if lam is not None:break
   rows.append(dict(z=z,tau_h=th,lambda_min=lam,min_restricted=th+lam,tau_g=tg,nu_g=p,S=wit))
  return rows

def main():
 t=time.time();mode=sys.argv[1] if len(sys.argv)>1 else 'atlas';out=[];bad=[];gap=[];count=0;rowscount=0;maxdiff=-100
 if mode=='atlas':seq=enumerate(nx.graph_atlas_g())
 else:raise ValueError(mode)
 for i,g in seq:
  ex=Exact(g);rows=ex.inspect();count+=1;rowscount+=len(rows)
  for r in rows:
   diff=r['min_restricted']-2*r['nu_g'];maxdiff=max(maxdiff,diff)
   if diff>0:bad.append(dict(index=i,edges=ex.edges,triangles=ex.tris,row=r))
   if r['min_restricted']>r['tau_g'] and len(gap)<10:gap.append(dict(index=i,edges=ex.edges,triangles=ex.tris,row=r))
  if i%100==0:print(i,round(time.time()-t,2),len(bad),len(gap),flush=True)
 data=dict(mode=mode,graphs=count,apex_instances=rowscount,UAC_counterexamples=bad,minimum_restriction_gaps=gap,max_UAC_excess=maxdiff,elapsed=time.time()-t,python=sys.version,networkx=nx.__version__,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (ROOT/'evidence'/f'apex_{mode}.json').write_text(json.dumps(data,indent=2))
 print(json.dumps({k:v for k,v in data.items() if k not in ['minimum_restriction_gaps','UAC_counterexamples']}));print('bad',len(bad),'gap',len(gap))
if __name__=='__main__':main()
