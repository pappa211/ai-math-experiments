"""TUZA-25 exact finite oracle. Literal triangles; complete cached recurrences.
Pack/cover recurrence adapted from scoped TUZA-22 scripts/exact_graph.py.
All returned results are exact iff solve completes. SIGALRM raises UNKNOWN.
"""
from itertools import combinations
from functools import lru_cache
import signal,time

def edge(u,v):return (min(u,v),max(u,v))
def clique(vs):return {edge(*e) for e in combinations(vs,2)}
def canonical(E):
 vs=sorted(set().union(*map(set,E))) if E else []
 mp={v:i for i,v in enumerate(vs)}
 return len(vs),{edge(mp[u],mp[v]) for u,v in E}
class Exact:
 def __init__(self,n,E):
  self.n=n;self.E=sorted(set(E));self.ei={e:i for i,e in enumerate(self.E)}
  self.T=[t for t in combinations(range(n),3) if clique(t)<=set(self.E)]
  self.tm=[sum(1<<self.ei[e] for e in clique(t)) for t in self.T]
  self.hits=[sum(1<<i for i,t in enumerate(self.tm) if t>>e&1) for e in range(len(self.E))]
  self.conflicts=[sum(1<<j for j,u in enumerate(self.tm) if u&t) for t in self.tm]
  self.full=(1<<len(self.T))-1
  @lru_cache(maxsize=300000)
  def pack(s):
   if not s:return ()
   ids=[];rem=s
   while rem:
    b=rem&-rem;rem-=b;ids.append(b.bit_length()-1)
   for j in ids:
    if self.conflicts[j]&s==1<<j:return (j,)+pack(s&~(1<<j))
   j=max(ids,key=lambda i:(self.conflicts[i]&s).bit_count())
   take=(j,)+pack(s&~self.conflicts[j]);skip=pack(s&~(1<<j))
   return take if len(take)>=len(skip) else skip
  @lru_cache(maxsize=300000)
  def cover(s):
   if not s:return ()
   ids=[];rem=s
   while rem:
    b=rem&-rem;rem-=b;ids.append(b.bit_length()-1)
   # Branch triangle whose least popular edge is best, reducing all three branches.
   j=max(ids,key=lambda i:min((self.hits[e]&s).bit_count() for e in range(len(self.E)) if self.tm[i]>>e&1))
   opts=[e for e in range(len(self.E)) if self.tm[j]>>e&1]
   opts.sort(key=lambda e:-(self.hits[e]&s).bit_count())
   results=[(e,)+cover(s&~self.hits[e]) for e in opts]
   return min(results,key=len)
  self.pack=pack;self.cover=cover
 def without(self,edges):
  s=self.full
  for e in edges:
   if e in self.ei:s&=~self.hits[self.ei[e]]
  return s
 def values(self):return len(self.pack(self.full)),len(self.cover(self.full))
 def connected(self):
  if not self.full:return False
  seen=0;front=1
  while front:
   seen|=front;rem=front;new=0
   while rem:
    b=rem&-rem;rem-=b;new|=self.conflicts[b.bit_length()-1]
   front=new&~seen
  return seen==self.full
 def profile(self):
  p,c=self.values();r={'n':self.n,'edges':self.E,'triangles':self.T,'nu':p,'tau':c,'packing':[self.T[i] for i in self.pack(self.full)],'cover':[self.E[i] for i in self.cover(self.full)],'triangle_connected':self.connected(),'all_edges_triangular':all(self.hits),'edge_deletions':[],'triangle_deletions':[]}
  for e in self.E:
   P=self.pack(self.without([e]));r['edge_deletions'].append({'edge':e,'nu':len(P),'packing':[self.T[i] for i in P]})
  for t in self.T:
   P=self.pack(self.without(clique(t)));r['triangle_deletions'].append({'triangle':t,'nu':len(P),'packing':[self.T[i] for i in P]})
  r['one_edge_resilient']=all(x['nu']==p for x in r['edge_deletions']);r['all_triangles_extend']=all(x['nu']==p-1 for x in r['triangle_deletions'])
  return r
 def clear(self):self.pack.cache_clear();self.cover.cache_clear()

def star(leaves=(5,5,5)):
 E=clique(range(4));n=4;pieces=[list(range(4))]
 for i,k in enumerate(leaves,1):
  Q=[0,i]+list(range(n,n+k-2));n+=k-2;E|=clique(Q);pieces.append(Q)
 return n,E,pieces
