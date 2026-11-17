"""TUZA-26 separately authored exact finite checker. Python stdlib only.
All graph triangles are enumerated; completed recursive optima are exact.
"""
from itertools import combinations
from functools import lru_cache

def edge(u,v): return tuple(sorted((u,v)))
def clique(V): return set(combinations(sorted(V),2))

class Solver:
 def __init__(self,E):
  self.E=tuple(sorted(set(map(tuple,E))))
  self.V=tuple(sorted(set().union(*map(set,self.E)))) if self.E else ()
  self.T=tuple(t for t in combinations(self.V,3) if clique(t)<=set(self.E))
  self.F=tuple(frozenset(clique(t)) for t in self.T)
  self.hits={e:frozenset(i for i,t in enumerate(self.F) if e in t) for e in self.E}
  self.all=frozenset(range(len(self.T)))
  @lru_cache(None)
  def pack(S):
   if not S:return ()
   i=min(S,key=lambda j:sum(bool(self.F[j]&self.F[k]) for k in S))
   no=pack(S-{i})
   yes=(i,)+pack(frozenset(j for j in S if not self.F[i]&self.F[j]))
   return yes if len(yes)>len(no) else no
  @lru_cache(None)
  def cover(S):
   if not S:return ()
   t=max(S,key=lambda i:sum(len(self.hits[e]&S) for e in self.F[i]))
   options=[(e,)+cover(S-self.hits[e]) for e in sorted(self.F[t])]
   return min(options,key=len)
  self.pack=pack;self.cover=cover
 def remaining(self,D):
  return self.all-frozenset().union(*(self.hits.get(e,frozenset()) for e in D))
 def nu(self,D=()):return len(self.pack(self.remaining(D)))
 def tau(self,D=()):return len(self.cover(self.remaining(D)))
 def supported(self):return bool(self.T) and all(self.hits.values())
 def connected(self):
  if not self.T:return False
  reached={0}
  while True:
   nxt=reached|{j for j in self.all if any(self.F[j]&self.F[i] for i in reached)}
   if nxt==reached:return reached==set(self.all)
   reached=nxt
 def universal(self):return [v for v in self.V if all(v==w or edge(v,w) in self.E for w in self.V)]
 def certificate(self):
  k=self.nu();dels=[]
  for e in self.E:
   p=self.pack(self.remaining([e]));dels.append({'edge':e,'nu':len(p),'packing':[self.T[i] for i in p]})
  return {'edges':self.E,'triangles':self.T,'nu':k,'tau':self.tau(),'defect':2*k-self.tau(),'cover':self.cover(self.all),'packing':[self.T[i] for i in self.pack(self.all)],'single_deletions':dels,'single_edge_resilient':all(x['nu']==k for x in dels),'triangle_supported':self.supported(),'triangle_connected':self.connected(),'universal_vertices':self.universal(),'every_triangle_extends':all(self.nu(self.F[i])==k-1 for i in self.all)}

def matchings(E):
 E=tuple(sorted(E))
 def rec(i,used,M):
  if i==len(E):yield M;return
  yield from rec(i+1,used,M)
  e=E[i]
  if not set(e)&used:yield from rec(i+1,used|set(e),M+(e,))
 yield from rec(0,set(),())

def vc(E):
 V=tuple(sorted(set().union(*map(set,E)))) if E else ()
 for k in range(len(V)+1):
  for C in combinations(V,k):
   if all(set(C)&set(e) for e in E):return C

def cone_formulas(L):
 L=set(L);S=Solver(L)
 pack_rows=[(len(M)+Solver(L-set(M)).nu(),M) for M in matchings(L)]
 best_pack=max(pack_rows,key=lambda x:x[0])
 cover_rows=[]
 for k in range(len(L)+1):
  for C in combinations(sorted(L),k):
   if all(set(C)&F for F in S.F):
    W=vc(L-set(C));cover_rows.append((len(C)+len(W),C,W))
 best_cover=min(cover_rows,key=lambda x:x[0])
 return {'nu_formula':best_pack[0],'matching':best_pack[1],'tau_formula':best_cover[0],'link_triangle_cover':best_cover[1],'remaining_vertex_cover':best_cover[2],'matchings_checked':len(pack_rows),'triangle_covers_checked':len(cover_rows)}

if __name__=='__main__':
 import json,sys,time
 t=time.time();E=clique(range(5))|clique([0,1,5,6,7]);L={e for e in E if 0 not in e}
 r={'control':'two_K5_shared_edge','graph':Solver(E).certificate(),'link':{'edges':sorted(L),'matching_number':max(map(len,matchings(L))),'vertex_cover_number':len(vc(L)),'triangle_nu':Solver(L).nu(),'triangle_tau':Solver(L).tau()},'cone':cone_formulas(L),'status':'VERIFIED_FINITE','seconds':time.time()-t}
 assert (r['graph']['nu'],r['graph']['tau'],r['graph']['single_edge_resilient'])==(4,7,True)
 assert (r['link']['matching_number'],r['link']['vertex_cover_number'])==(3,5)
 assert (r['cone']['nu_formula'],r['cone']['tau_formula'])==(4,7)
 print(json.dumps(r,indent=2))
