#!/usr/bin/env python3
"""Search witnesses only; hard combined cap 480s. No optimum claim from search."""
import itertools as it, json,time,random,sys
from pathlib import Path
import networkx as nx
START=time.monotonic();DEADLINE=START+480
rng=random.Random(160411)
def e(a,b):return tuple(sorted((a,b)))
def tri(E,n):return [t for t in it.combinations(range(n),3) if set(it.combinations(t,2))<=E]
def exact_decomposition(E,n):
 E=sorted(E);idx={x:i for i,x in enumerate(E)};T=tri(set(E),n);M=[sum(1<<idx[x] for x in it.combinations(t,2)) for t in T];inc=[[] for x in E]
 for j,m in enumerate(M):
  for k in range(len(E)):
   if m>>k&1:inc[k].append(j)
 fail=set();nodes=0
 def go(rem):
  nonlocal nodes
  nodes+=1
  if nodes%10000==0 and time.monotonic()>DEADLINE:raise TimeoutError()
  if not rem:return []
  if rem in fail:return None
  best=None
  for k in range(len(E)):
   if rem>>k&1:
    avail=[j for j in inc[k] if M[j]&rem==M[j]]
    if not avail:return None
    if best is None or len(avail)<len(best):best=avail
    if len(best)==1:break
  for j in best:
   tail=go(rem^M[j])
   if tail is not None:return [T[j]]+tail
  fail.add(rem);return None
 return go((1<<len(E))-1),nodes
classes=[]
for g in nx.graph_atlas_g():
 if 2<=len(g)<=5 and g.number_of_edges() and min(dict(g.degree()).values())>0:
  classes.append(sorted(e(a,b) for a,b in g.edges()))
assert len(classes)==33
result={'scope':'All 33 nonempty unlabeled edge sets with no isolated support vertices and support <=5; embedded in K10 and K11','python':sys.version,'networkx':nx.__version__,'combined_time_cap_seconds':480,'classes':classes,'graphs':{}}
for n in [10,11]:
 E=set(it.combinations(range(n),2));leave=({(0,1),(0,2),(0,3),(4,5),(6,7),(8,9)} if n==10 else {(0,1),(1,2),(2,3),(0,3)})
 P,nodes=exact_decomposition(E-leave,n);assert P is not None
 opt=13 if n==10 else 17;assert len(P)==opt
 rows=[]
 for index,F in enumerate(classes):
  target=opt-(len(F)+1)//2+1;found=None;attempts=0;best=[]
  while time.monotonic()<DEADLINE and attempts<300000:
   attempts+=1;perm=list(range(n));rng.shuffle(perm)
   Q=[tuple(sorted(perm[v] for v in t)) for t in P]
   Q=[t for t in Q if not(set(it.combinations(t,2))&set(F))]
   # Fill newly freed residual triangles greedily after a random baseline permutation.
   used=set(x for t in Q for x in it.combinations(t,2));available=tri(E-set(F)-used,n);rng.shuffle(available)
   for t in available:
    es=set(it.combinations(t,2))
    if not used&es:Q.append(t);used|=es
   if len(Q)>len(best):best=Q
   if len(Q)>=target:found=Q;break
  rows.append({'class_index':index,'F':F,'f':len(F),'target':target,'status':'WITNESS' if found else 'UNKNOWN','packing':found or best,'attempts':attempts})
  print(n,index,len(F),target,len(found or best),attempts,flush=True)
  if time.monotonic()>=DEADLINE:break
 result['graphs'][str(n)]={'n':n,'edges':sorted(E),'triangles':tri(E,n),'nu':opt,'baseline_packing':P,'baseline_leave':sorted(leave),'decomposition_search_nodes':nodes,'upper_bound':('degree bound: 3nu <= sum_v floor(9/2)=40' if n==10 else '18 triangles would leave one edge; K11 degrees and triangle-used degrees are even, so one-edge leave is impossible'),'cases':rows}
 if time.monotonic()>=DEADLINE:break
result['elapsed_seconds']=time.monotonic()-START
result['completed']=all(str(n) in result['graphs'] and len(result['graphs'][str(n)]['cases'])==33 and all(r['status']=='WITNESS' for r in result['graphs'][str(n)]['cases']) for n in [10,11])
Path('evidence/k10_k11.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'completed':result['completed'],'seconds':result['elapsed_seconds']}))
