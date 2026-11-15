#!/usr/bin/env python3
"""TUZA-16 exact standard-library controls; creates only selected output JSON."""
from itertools import combinations, product
from pathlib import Path
from functools import lru_cache
import json,sys,time,platform

def edge(a,b): return tuple(sorted((a,b)))
def triangles(n,E):
 E=set(map(tuple,E)); return [t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))]
def validate(n,E,P,C):
 E=set(E); T=triangles(n,E); used=set()
 for t in P:
  es=set(combinations(sorted(t),2)); assert es<=E and not es&used;used|=es
 assert set(C)<=E and all(set(combinations(t,2))&set(C) for t in T)
 return T

def exact_small(n,E):
 E=sorted(E);T=triangles(n,E); ix={e:i for i,e in enumerate(E)}
 masks=[sum(1<<ix[e] for e in combinations(t,2)) for t in T]
 @lru_cache(None)
 def pack(i,used):
  if i==len(T):return ()
  best=pack(i+1,used)
  if not masks[i]&used:
   alt=(i,)+pack(i+1,used|masks[i])
   if len(alt)>len(best):best=alt
  return best
 @lru_cache(None)
 def cover(rem):
  if not rem:return ()
  i=(rem&-rem).bit_length()-1
  best=None
  for e in combinations(T[i],2):
   keep=rem
   for j,m in enumerate(masks):
    if m>>ix[e]&1:keep&=~(1<<j)
   alt=(e,)+cover(keep)
   if best is None or len(alt)<len(best):best=alt
  return best
 P=[T[i] for i in pack(0,0)]; C=list(cover((1<<len(T))-1));validate(n,E,P,C)
 return {'n':n,'edges':E,'triangles':T,'packing':P,'cover':C,'nu':len(P),'tau':len(C),'optimality':'exhaustive integer recursion on all actual triangles'}

def vb():
 J=[e for e in combinations(range(13),2) if (e[1]-e[0])%13 in {1,5,8,12}]
 assert not triangles(13,J)
 independent=[];alpha=0
 for bits in range(1<<13):
  if all(not(bits>>i&1 and bits>>j&1) for i,j in J):
   k=bits.bit_count()
   if k>alpha:alpha=k;independent=[]
   if k==alpha:independent.append([i for i in range(13) if bits>>i&1])
 H=sorted({edge(2*i+a,2*j+b) for i,j in J for a in range(2) for b in range(2)})
 E=H+[(i,26) for i in range(26)];T=triangles(27,E)
 P=[tuple(sorted((2*i,2*((i+1)%13)+1,26))) for i in range(13)]
 best=10**9; opts=[]; count=0
 for u in product(range(3),repeat=13):
  cost=26-sum(u)+sum(u[i]*u[j] for i,j in J);count+=1
  if cost<best:best=cost;opts=[]
  if cost==best:opts.append(u)
 covers=[]
 for u in opts:
  U={2*i+a for i in range(13) for a in range(u[i])}
  C=sorted([(i,26) for i in range(26) if i not in U]+[e for e in H if set(e)<=U])
  assert len(C)==best;validate(27,E,P,C);covers.append(C)
 assert all(set(u)<={0,2} for u in opts)
 return {'n':27,'J_edges':J,'J_alpha':alpha,'J_max_independent_sets':independent,'H_alpha':2*alpha,'edges':sorted(E),'triangles':T,'packing':P,'cover':covers[0],'all_minimum_covers':covers,'nu':13,'tau':best,'occupancy_patterns':count,'optimal_occupancies':opts,'number_optimal_occupancies':len(opts),'all_optimal_covers_spokes_only':all(all(26 in e for e in C) for C in covers),'optimality':'all triangles use two of 26 spokes; attaining perfect matching; exact 3^13 occupancy cover enumeration; twin alpha doubles','VB_apex_lhs':best,'VB_apex_rhs_numerator':4*13,'VB_apex_rhs_denominator':3}

def clebsch():
 H=[(i,j) for i,j in combinations(range(16),2) if i^j in {1,2,4,8,15}]; E=H+[(i,16) for i in range(16)]
 assert not triangles(16,H)
 best=100;Us=[]
 for bits in range(1<<16):
  cost=16-bits.bit_count()+sum(bool(bits>>i&1 and bits>>j&1) for i,j in H)
  if cost<best:best=cost;Us=[]
  if cost==best:Us.append([i for i in range(16) if bits>>i&1])
 P=[(i,i^1,16) for i in range(0,16,2)];rows=[]
 for U in Us:
  assert len(U)==5 and all(not(set(e)<=set(U)) for e in H)
  C=[(i,16) for i in range(16) if i not in U];validate(17,E,P,C)
  v=next(v for v in range(16) if {v^d for d in [1,2,4,8,15]}==set(U))
  privateP=[tuple(sorted((a^v,b^v,16))) for a,b in [(1,3),(2,6),(4,12),(8,9),(15,7)]]
  used=set()
  for t in privateP:
   es=set(combinations(t,2));assert not es&used and len(es&set(C))==1 and es<=set(E);used|=es
  rows.append({'cover':C,'private_packing':privateP,'private_upper_bound':len(U)})
 return {'n':17,'edges':sorted(E),'triangles':triangles(17,E),'packing':P,'cover':rows[0]['cover'],'nu':8,'tau':best,'minimum_covers':rows,'optimality':'all 2^16 unselected-spoke subsets plus explicit 8-packing / 16-spoke upper bound'}

def cartesian():
 E=[(5*i+j,5*k+l) for i,j in product(range(4),range(5)) for k,l in product(range(4),range(5)) if 5*i+j<5*k+l and ((i==k) != (j==l))]
 blocks=[[5*i+j for j in range(5)] for i in range(4)]+[[5*i+j for i in range(4)] for j in range(5)]
 P=[];C=[];local=[]
 for B in blocks:
  r=exact_small(len(B),list(combinations(range(len(B)),2)));local.append(r)
  P += [tuple(sorted(B[i] for i in t)) for t in r['packing']]
  C += [edge(*(B[i] for i in e)) for e in r['cover']]
 T=validate(20,E,P,C)
 assert all(sum(set(t)<=set(B) for B in blocks)==1 for t in T)
 assert len(set(e for B in blocks for e in combinations(B,2)))==len(E)
 return {'n':20,'edges':E,'triangles':T,'packing':P,'cover':C,'nu':len(P),'tau':len(C),'blocks':blocks,'local_certificates':local,'optimality':'every actual triangle lies in exactly one of 5 K4 or 4 K5 edge-disjoint blocks; both optima add'}

def main():
 start=time.monotonic(); result={'runtime':{'python':sys.version,'platform':platform.platform(),'solver':'standard-library exhaustive integer routines'}}
 result['empty']=exact_small(0,[])
 for n in (3,4,5): result['K'+str(n)]=exact_small(n,list(combinations(range(n),2)))
 result['book7']=exact_small(9,[(0,1)]+[(v,i) for v in (0,1) for i in range(2,9)])
 result['VB27']=vb();result['clebsch']=clebsch();result['cartesian_K4_K5']=cartesian()
 E=[tuple(map(int,s)) for s in ['01','02','03','04','07','12','13','14','15','23','25','26','36','37','45','47','56']]
 result['four_port_G']=exact_small(8,E);result['four_port_H']=exact_small(8,[e for e in E if e not in [(0,2),(1,3)]])
 # Vertex-sharing literal blocks, with no extra edges.
 blocks=[[0,1,2,3],[0,4,5,6],[0,7,8,9],[0,10,11,12,13],[0,14,15,16,17]]
 E=sorted({e for B in blocks for e in combinations(B,2)});P=[];C=[]
 for B in blocks:
  r=result['K'+str(len(B))];P += [tuple(B[i] for i in t) for t in r['packing']];C += [tuple(B[i] for i in e) for e in r['cover']]
 T=validate(18,E,P,C);assert all(sum(set(t)<=set(B) for B in blocks)==1 for t in T)
 result['shared_vertex_blocks']={'n':18,'edges':E,'triangles':T,'packing':P,'cover':C,'nu':len(P),'tau':len(C),'blocks':blocks,'optimality':'full triangle family decomposes into edge-disjoint literal K4/K5 blocks'}
 lines=[sorted({i,j,i^j}) for i in range(1,8) for j in range(i+1,8)];lines=sorted({tuple(t) for t in lines});assert len(lines)==7
 covers=[S for k in range(8) for S in combinations(range(1,8),k) if all(set(S)&set(L) for L in lines)]
 result['abstract_Fano']={'hypergraph_vertices':list(range(1,8)),'hyperedges':lines,'nu':1,'tau':min(map(len,covers)),'cover':min(covers,key=len),'pairwise_intersect':all(set(A)&set(B) for A,B in combinations(lines,2)),'actual_graph':'NOT_APPLICABLE'}
 result['Baron_Kahn']={'status':'NOT_AVAILABLE','scope':'No certified finite instance located in selected pinned public inventory; no construction attempted'}
 result['elapsed_seconds']=time.monotonic()-start
 Path(sys.argv[1] if len(sys.argv)>1 else 'evidence/controls.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({'seconds':result['elapsed_seconds'],'controls':{k:{x:v[x] for x in ['n','nu','tau','number_optimal_occupancies'] if x in v} for k,v in result.items() if isinstance(v,dict)}},indent=2))
if __name__=='__main__':main()
