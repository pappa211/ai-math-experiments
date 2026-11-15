#!/usr/bin/env python3
"""Bounded exact probes. All actual triangles; no solver verdict reliance."""
from functools import lru_cache
from itertools import combinations,product
from pathlib import Path
import json,time,signal,resource,sys,random
resource.setrlimit(resource.RLIMIT_CPU,(180,185))
# Mac RLIMIT_AS unsuitable; graph sizes capped and recurrences caches bounded.
START=time.monotonic()
W=Path(__file__).resolve().parents[1]
def edge(u,v):return tuple(sorted((u,v)))
def graph(n,es):
 es=tuple(sorted(set(edge(*x) for x in es))); idx={e:i for i,e in enumerate(es)}
 ts=[(a,b,c) for a,b,c in combinations(range(n),3) if all(edge(*e) in idx for e in [(a,b),(a,c),(b,c)])]
 tm=tuple(sum(1<<idx[edge(*e)] for e in combinations(t,2)) for t in ts)
 return es,idx,ts,tm
@lru_cache(maxsize=200000)
def pack(ts):
 if not ts:return 0
 t=ts[0]
 return max(pack(ts[1:]),1+pack(tuple(s for s in ts[1:] if not s&t)))
@lru_cache(maxsize=200000)
def cover(ts):
 if not ts:return 0
 t=ts[0];ans=10000
 while t:
  b=t&-t;t-=b
  ans=min(ans,1+cover(tuple(s for s in ts if not s&b)))
 return ans
@lru_cache(maxsize=100000)
def mincovers(ts):
 if not ts:return (0,)
 k=cover(ts);t=ts[0];out=set()
 while t:
  b=t&-t;t-=b;rem=tuple(s for s in ts if not s&b)
  if cover(rem)==k-1:
   out.update(c|b for c in mincovers(rem))
 return tuple(sorted(out))
@lru_cache(maxsize=100000)
def vc(es):
 if not es:return 0
 a,b=es[0]
 return 1+min(vc(tuple(e for e in es if a not in e)),vc(tuple(e for e in es if b not in e)))
def colour(n,es):
 # explicit proper 4 vertex colouring => F2^2 differences rainbow every triangle.
 adj=[set() for _ in range(n)]
 for a,b in es:adj[a].add(b);adj[b].add(a)
 col=[-1]*n
 def rec():
  todo=[v for v in range(n) if col[v]<0]
  if not todo:return True
  v=max(todo,key=lambda v:(len({col[u] for u in adj[v] if col[u]>=0}),len(adj[v])))
  for c in range(4):
   if all(col[u]!=c for u in adj[v]):
    col[v]=c
    if rec():return True
  col[v]=-1;return False
 return col if rec() else None

def probe(name,n,E):
 es,idx,ts,tm=graph(n,E);co=colour(n,es)
 if co is None:return {'name':name,'status':'NOT_APPLICABLE','why':'no vertex4color found (not full edge3colour test)'}
 ec={e:co[e[0]]^co[e[1]] for e in es}
 assert all(len({ec[edge(*e)] for e in combinations(t,2)})==3 for t in ts)
 p=pack(tm);tau=cover(tm);cs=mincovers(tm);hist={};fail=[];best=[];count=0
 for xm in range(1<<n):
  X=[v for v in range(n) if xm>>v&1]
  if any(all(xm>>v&1 for v in t) for t in ts):continue
  le=tuple(e for e in es if all(xm>>v&1 for v in e))
  if not le:continue
  count+=1
  lam=min(vc(tuple(e for e in le if not (c>>idx[e]&1))) for c in cs)
  ges,gidx,gts,gtm=graph(n+1,es+tuple((v,n) for v in X))
  pg=pack(gtm);gap=tau+lam-2*pg
  hist[gap]=hist.get(gap,0)+1
  row={'X':X,'lambda':lam,'nu_G':pg,'gain':pg-p,'gap':gap,'old_link_edges':sum(any((1<<idx[e])&t for t in tm) for e in le)}
  if gap>0:fail.append(row)
  if lam>0 and pg==p:best.append(row)
 return {'name':name,'n':n,'edges':es,'vertex4colouring':co,'nu_H':p,'tau_H':tau,'D_H':2*p-tau,'minimum_cover_count':len(cs),'eligible_nonempty_links':count,'gap_histogram':hist,'failures':fail,'nongain_positive_lambda':best,'status':'FAIL' if fail else 'PASS'}

def main():
 cases=[]
 def add(name,n,cliques,extra=()):cases.append((name,n,[e for c in cliques for e in combinations(c,2)]+list(extra)))
 add('K4',4,[range(4)])
 add('twoK4_edge',6,[[0,1,2,3],[0,1,4,5]])
 add('twoK4_triangle',5,[[0,1,2,3],[0,1,2,4]])
 add('threeK4_edge',8,[[0,1,2,3],[0,1,4,5],[0,1,6,7]])
 add('K4_path_edge',8,[[0,1,2,3],[2,3,4,5],[4,5,6,7]])
 add('K4_cycle_edge',6,[[0,1,2,3],[2,3,4,5],[4,5,0,1]])
 add('K4_tri_pagetips',8,[[0,1,2,3],[0,1,4],[1,2,5],[2,3,6],[0,3,7]])
 add('fourport_G',8,[[0,1,2,3],[0,1,4],[1,2,5],[2,3,6],[0,3,7]],[(4,5),(4,7),(5,6)])
 # exact published four-port apex decompositions selected by all vertices later.
 out=[]
 for name,n,E in cases:
  r=probe(name,n,E);out.append(r)
  print(name,r['status'],r.get('D_H'),r.get('gap_histogram'),flush=True)
  (W/'evidence/b_probe.json').write_text(json.dumps({'runtime_s':time.monotonic()-START,'cases':out},indent=2)+'\n')
 if any(r.get('failures') for r in out):print('COUNTEREXAMPLE',flush=True)
if __name__=='__main__':main()
