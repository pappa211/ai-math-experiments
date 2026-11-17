#!/usr/bin/env python3
"""Independent TUZA-20 exact checker. Standard library; no producer imports.

Graph universe: all labelled simple undirected graphs on 0..n-1. Triangles
are reconstructed from the edge list. Every maximum packing is visited with
strictly increasing triangle index; no orbit reduction and no success exit.
Graph6 small-order decoding uses bits for (0,1),(0,2),(1,2),(0,3),... .
"""
from itertools import combinations,product
from functools import lru_cache
from pathlib import Path
import json,time,datetime,hashlib,sys,platform

ROOT=Path(__file__).resolve().parents[1]
def edge(a,b):return tuple(sorted((a,b)))
def faces(t):return frozenset(combinations(sorted(t),2))
def reconstruct(n,E):
 E=frozenset(tuple(sorted(e)) for e in E)
 assert all(0<=a<b<n for a,b in E)
 T=tuple(t for t in combinations(range(n),3) if faces(t)<=E)
 return E,T

def graph6(s):
 if s.startswith('>>graph6<<'):s=s[10:]
 a=[ord(x)-63 for x in s.strip()]
 assert a and all(0<=x<64 for x in a)
 n=a.pop(0);assert n<63
 bits=[(v>>b)&1 for v in a for b in range(5,-1,-1)]
 assert len(bits)>=n*(n-1)//2
 E=[];p=0
 for j in range(1,n):
  for i in range(j):
   if bits[p]:E.append((i,j))
   p+=1
 assert all(b==0 for b in bits[p:])
 return n,E

def maximum_packings(T):
 """Enumerate all edge-disjoint subsets, pruning only impossible size bounds."""
 F=tuple(faces(t) for t in T); best=-1; solutions=[]
 def visit(pos,used,sel):
  nonlocal best,solutions
  if len(sel)+len(T)-pos<best:return
  if pos==len(T):
   if len(sel)>best:best=len(sel);solutions=[tuple(sel)]
   elif len(sel)==best:solutions.append(tuple(sel))
   return
  if not used&F[pos]:visit(pos+1,used|F[pos],sel+[pos])
  visit(pos+1,used,sel)
 visit(0,frozenset(),[])
 return best,tuple(tuple(T[i] for i in z) for z in solutions)

def allowed(n,E,T,P):
 B=frozenset(e for t in P for e in faces(t)); private={}
 for owner in P:
  private[owner]=tuple(q for q in T if q not in P and len(faces(q)&B)==1 and faces(q)&B<=faces(owner))
 K=[]; A=set(B)
 for owner in P:
  for z in range(n):
   if z in owner:continue
   verts=tuple(sorted((*owner,z)))
   if not frozenset(combinations(verts,2))<=E:continue
   other=[q for q in combinations(verts,3) if q!=owner]
   if all(q in private[owner] for q in other):
    K.append((owner,z));A.update(combinations(verts,2))
 return B,frozenset(A),private,tuple(K)

def cover_at_most(T,A,budget):
 clauses=frozenset(faces(t)&A for t in T)
 if frozenset() in clauses:return None
 # Superset clauses are redundant for hitting-set existence, unlike shortening.
 clauses=frozenset(c for c in clauses if not any(d<c for d in clauses))
 @lru_cache(None)
 def solve(C,b):
  if not C:return frozenset()
  if b==0:return None
  q=min(C,key=lambda z:(len(z),sorted(z)))
  for e in sorted(q):
   r=solve(frozenset(c for c in C if e not in c),b-1)
   if r is not None:return r|{e}
  return None
 return solve(clauses,budget)

def exact_cover(T,A):
 for k in range(len(A)+1):
  c=cover_at_most(T,A,k)
  if c is not None:return k,c
 raise AssertionError('no cover')

def brute_optima(T,A):
 """Separate finite-control verification via exhaustive combinations."""
 all_counts={}; edges=sorted(A)
 for k in range(len(edges)+1):
  tried=0;valid=[]
  for c in combinations(edges,k):
   tried+=1
   if all(set(c)&faces(t) for t in T):valid.append(c)
  all_counts[k]={'tested':tried,'covers':len(valid)}
  if valid:return k,valid,all_counts

def finite(n,edges,P,name):
 E,T=reconstruct(n,edges);nu,ps=maximum_packings(T)
 assert any(set(P)==set(q) for q in ps)
 B,A,priv,K=allowed(n,E,T,tuple(P))
 cost,C=exact_cover(T,A);bc,bs,counts=brute_optima(T,A)
 assert bc==cost
 # All subsets of triangle family of cardinality nu+1 fail: independent bound.
 larger=list(combinations(T,nu+1));assert all(len(set().union(*(faces(t) for t in q)))<3*len(q) for q in larger)
 return {'name':name,'n':n,'edges':sorted(E),'triangles':T,'nu':nu,'maximum_packings_count':len(ps),'packing':P,'support':sorted(B),'allowed':sorted(A),'private_pages':[{'owner':p,'pages':q} for p,q in priv.items()],'private_completions':K,'restricted_cost':cost,'cover':sorted(C),'cover_lower_bound_enumeration':counts,'packing_upper_bound_subsets_checked':len(larger),'all_maximum_packings':ps}

def validate_certificate(d):
 E,T=reconstruct(d['n'],d['edges'])
 assert tuple(tuple(x) for x in d['triangles'])==T,'triangle family differs'
 P=tuple(tuple(x) for x in d['packing'])
 assert all(p in T for p in P),'nontriangle in packing'
 assert len(frozenset(e for p in P for e in faces(p)))==3*len(P),'packing overlap'
 nu,_=maximum_packings(T);assert len(P)==nu,'packing not maximum'
 B,A,_,K=allowed(d['n'],E,T,P)
 assert frozenset(tuple(x) for x in d['allowed'])==A,'allowed mismatch'
 assert tuple((tuple(p),z) for p,z in d['private_completions'])==K,'completion privacy mismatch'
 C=frozenset(tuple(x) for x in d['cover'])
 assert C<=A and all(C&faces(t) for t in T),'not allowed cover'
 return True

def controls():
 n,E=graph6('FCZnw');p=((0,3,6),(1,4,5),(2,4,6));p2=((0,5,6),(1,4,5),(2,4,6))
 a=finite(n,E,p,'FCZnw-P');b=finite(n,E,p2,'FCZnw-Pprime')
 assert a['nu']==b['nu']==3 and a['restricted_cost']==5 and b['restricted_cost']==4
 assert p2[0] in tuple(tuple(q) for r in a['private_pages'] if r['owner']==p[0] for q in r['pages'])
 assert p[0] in tuple(tuple(q) for r in b['private_pages'] if r['owner']==p2[0] for q in r['pages'])
 k4=finite(4,list(combinations(range(4),2)),((0,1,2),),'K4')
 k5=finite(5,list(combinations(range(5),2)),((0,1,2),(0,3,4)),'K5')
 assert k4['restricted_cost']==2 and k5['restricted_cost']==4
 Ecore=set(combinations((0,1,2,4,5),2))|{(0,3),(1,3),(0,6),(3,6),(0,7),(3,7)}
 pcore=((0,1,3),(1,2,4),(0,2,5))
 core=finite(8,Ecore,pcore,'private-pair-core')
 bases={(0,3),(1,4),(0,5)};sp=[[(0,1),(1,3)],[(1,2),(2,4)],[(0,2),(2,5)]]
 E,T=reconstruct(8,Ecore)
 Bcore=frozenset(e for p in pcore for e in faces(p))
 clauses=[(faces(t)&Bcore)-bases for t in T if not faces(t)&bases]
 full=[list(z) for z in product(*sp) if all(set(z)&q for q in clauses)]
 false=[q if q!=faces((0,1,2)) else frozenset({(1,2),(0,2)}) for q in clauses]
 short=[list(z) for z in product(*sp) if all(set(z)&q for q in false)]
 unequal=bases|{(1,2),(2,4)}
 assert len(full)>0 and not short and all(unequal&faces(t) for t in T)
 core['semantic_controls']={'residual_clauses':[sorted(q) for q in clauses],'full_equal_allocations':full,'shortened_equal_allocations':short,'unequal_cover':sorted(unequal),'unequal_spoke_loads':[sum(e in unequal for e in s) for s in sp]}
 # K5 equal allocation: add bases and one spoke per owner; no assignment covers.
 B,A,priv,K=allowed(5,*reconstruct(5,set(combinations(range(5),2))),((0,1,2),(0,3,4)))
 bases5=set(e for pages in priv.values() for q in pages for e in faces(q)&B)
 spokes5=[sorted(faces(p)-bases5) for p in ((0,1,2),(0,3,4))]
 _,T5=reconstruct(5,set(combinations(range(5),2)))
 equal5=[z for z in product(*spokes5) if all((set(z)|bases5)&faces(t) for t in T5)]
 assert not equal5
 k5['one_spoke_each_solutions']=equal5;k5['bases']=sorted(bases5)
 out=[a,b,k4,k5,core]
 for d in out:validate_certificate(d)
 import copy
 negatives={}
 for name,base,mut in [
 ('omitted_triangle',a,lambda d:d['triangles'].pop()),
 ('missing_cover_edge',a,lambda d:d['cover'].pop()),
 ('overlapping_packing_edges',k4,lambda d:d['packing'].append([0,1,3])),
 ('false_private_completion',k5,lambda d:d['private_completions'].append([[0,1,2],3])),
 ('nonmaximum_packing',a,lambda d:d['packing'].pop()),
 ]:
  d=json.loads(json.dumps(base));mut(d)
  try:validate_certificate(d)
  except AssertionError as ex:negatives[name]={'rejected':True,'reason':str(ex)}
  else:raise AssertionError('negative control accepted: '+name)
 (ROOT/'data/verifier_controls.json').write_text(json.dumps(out,indent=2)+'\n')
 return {'controls':[{'name':d['name'],'n':d['n'],'edges':len(d['edges']),'triangles':len(d['triangles']),'nu':d['nu'],'restricted_cost':d['restricted_cost'],'maximum_packings':d['maximum_packings_count']} for d in out],'negative_controls':negatives}

def census(maxn=6,seconds=600):
 deadline=time.monotonic()+seconds; rows=[];failure=[];unknown=[]
 for n in range(maxn+1):
  pairs=list(combinations(range(n),2));graphs=packings=0
  for m in range(1<<len(pairs)):
   if time.monotonic()>deadline:
    unknown.append({'n':n,'next_graph_mask':m,'remaining_graphs_this_order':(1<<len(pairs))-m,'unstarted_orders':list(range(n+1,maxn+1))});break
   E,T=reconstruct(n,[e for i,e in enumerate(pairs) if m&(1<<i)])
   nu,ps=maximum_packings(T)
   for P in ps:
    B,A,priv,K=allowed(n,E,T,P);C=cover_at_most(T,A,2*nu)
    packings+=1
    if C is None:failure.append({'n':n,'mask':m,'edges':sorted(E),'packing':P,'nu':nu,'allowed':sorted(A)})
   graphs+=1
  rows.append({'n':n,'universe_graph_count':1<<len(pairs),'fully_checked_graphs':graphs,'partly_checked_graphs':0,'all_maximum_packings_checked':packings})
  print(json.dumps(rows[-1]),flush=True)
  if unknown:break
 return {'universe':'Every labelled simple graph on vertex set range(n), each order 0 through maxn; all binary edge masks. No isomorphism/orbit reduction. Every maximum packing checked; no exit on successful packing. Empty packing counted once for triangle-free graph.','maxn':maxn,'counts':rows,'failures':failure,'unknown':unknown}

if __name__=='__main__':
 start=time.time();mode=sys.argv[1] if len(sys.argv)>1 else 'controls'
 payload=controls() if mode=='controls' else census(int(sys.argv[2]) if len(sys.argv)>2 else 6)
 receipt={'mode':mode,'started_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-start,'platform':platform.platform(),'python':sys.version,'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'result':payload}
 (ROOT/f'receipts/verifier_{mode}.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt))
