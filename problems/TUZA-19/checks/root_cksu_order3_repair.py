#!/usr/bin/env python3
"""Literal finite controls for the repaired CKSU order3 construction.
The theorem is ordinary and independently reviewed; this is no all-size reduction.
"""
from itertools import combinations,permutations
from pathlib import Path
import hashlib,json,platform,time
import networkx as nx
from global_routes_deletion_gate import Exact
assert platform.system()=='Darwin'
start=time.time()
def ek(u,v):return tuple(sorted((u,v)))
def te(t):return {ek(u,v) for u,v in combinations(t,2)}
def analyze(G,P):
 E={ek(u,v) for u,v in G.edges()};T=[t for t in combinations(G.nodes(),3) if te(t)<=E]
 pe=[te(t) for t in P];B=set().union(*pe);owner={e:i for i,p in enumerate(pe) for e in p}
 assert len(B)==3*len(P)
 pages=[[] for _ in P]
 for t in T:
  hit=te(t)&B
  if len(hit)==1:
   e=next(iter(hit));i=owner[e]
   pages[i].append((e,next(v for v in t if v not in e),t))
 bases=[{e for e,z,t in q} for q in pages];types=[len(s) for s in bases]
 assert all(x in (0,1,3) for x in types)
 pairs=set()
 for i,p in enumerate(P):
  if types[i]!=1 or len(pages[i])!=2:continue
  b=next(iter(bases[i]));v=next(x for x in p if x not in b);tips={z for e,z,t in pages[i]}
  for j,q in enumerate(P):
   if j==i or set(q)!={v,*tips} or types[j]!=1:continue
   if next(iter(bases[j]))!=tuple(sorted(tips)) or {z for e,z,t in pages[j]}!=set(b):continue
   pairs.add(tuple(sorted((i,j))))
 assert len({i for pair in pairs for i in pair})==2*len(pairs)
 # Check every amended doubly-attached case directly.
 casecounts=[0]*5
 for t in T:
  hit=te(t)&B
  if len(hit)!=2:continue
  i,j=sorted({owner[e] for e in hit}); ti,tj=types[i],types[j]
  assert len({owner[e] for e in hit})==2
  if ti==tj==3:raise AssertionError('forbidden [3,3]')
  if sorted((ti,tj))==[1,3]:
   k=i if ti==1 else j
   assert bool(bases[k]&te(t)) or (len(pages[k])==1 and pages[k][0][1] in t)
  if ti==tj==1:
   if (bases[i]|bases[j])&te(t):casecounts[1]+=1
   elif any(len(pages[k])==1 and pages[k][0][1] in t for k in (i,j)):casecounts[2]+=1
   elif len(pages[i])==len(pages[j])==1 and pages[i][0][1]==pages[j][0][1] and set(next(iter(bases[i])))&set(next(iter(bases[j]))):casecounts[3]+=1
   else:
    assert (i,j) in pairs
    casecounts[4]+=1
 sing=[i for i in range(len(P)) if types[i]==1 and len(pages[i])==1]
 paired={i for ij in pairs for i in ij}
 ordercount=0;witness=None
 for order in permutations(sing):
  w={e:0 for e in E}
  def put(e,k):w[e]=max(w[e],k)
  for i,p in enumerate(P):
   if types[i]==0:
    for e in pe[i]:put(e,2)
   elif types[i]==3:
    assert len(pages[i])==3 and len({z for e,z,t in pages[i]})==1
    verts=set(p)|{pages[i][0][1]}
    for e in combinations(sorted(verts),2):put(e,1)
  for i,j in pairs:
   verts=set(P[i])|set(P[j]);bb=bases[i]|bases[j]
   assert len(verts)==5 and set(combinations(sorted(verts),2))<=E
   for e in combinations(sorted(verts),2):put(e,2 if e in bb else 1)
  for i,p in enumerate(P):
   if types[i]==1 and len(pages[i])>=2 and i not in paired:
    for e in pe[i]:put(e,3 if e in bases[i] else 1)
  for i in order:
   b,z,_=pages[i][0];v=next(x for x in P[i] if x not in b);put(b,2)
   for u in b:
    a=ek(u,v);d=ek(u,z)
    assert w[a]==0 and d not in B
    if w[d]==0:put(d,1);put(a,1)
    else:
     assert w[d]==1
     put(a,2)
  assert all(sum(w[e] for e in te(t))>=3 for t in T)
  assert sum(w.values())<=6*len(P)
  assert set(w.values())<={0,1,2,3}
  ordercount+=1
  if witness is None:witness={'weights_times3':[[list(e),w[e]] for e in sorted(E)],'mass_times3':sum(w.values()),'private_types':types,'exceptional_pairs':sorted(pairs),'singleton_order':order}
 return ordercount,casecounts,witness
count_graphs=count_packings=count_orders=0;casecounts=[0]*5;examples=[]
for idx,G in enumerate(nx.graph_atlas_g()):
 if len(G)>6:break
 ex=Exact(G);k=ex.nu(ex.full)
 count_graphs+=1
 for inds in combinations(range(len(ex.tri)),k):
  used=0;ok=True
  for i in inds:
   if used&ex.tri[i]:ok=False;break
   used|=ex.tri[i]
  if not ok:continue
  P=[ex.triples[i] for i in inds]
  orders,cc,w=analyze(G,P);count_packings+=1;count_orders+=orders
  casecounts=[a+b for a,b in zip(casecounts,cc)]
  if w['exceptional_pairs'] and len(examples)<3:examples.append({'atlas_index':idx,'edges':ex.edges,'packing':P,**w})
# A real external doubly-attached triangle at an exceptional base.
G=nx.complete_graph(5);G.add_edges_from([(0,5),(0,6),(5,6),(1,5)])
P=[(0,1,4),(2,3,4),(0,5,6)]
ex=Exact(G);assert ex.nu(ex.full)==len(P)
orders,cc,w=analyze(G,P)
examples.append({'label':'K5_pair_with_external_type0_or1_interface','edges':ex.edges,'packing':P,**w})
out={'status':'PASS','scope':'Every maximum packing in each atlas graph through6 vertices, every singleton processing order; one specified7-vertex exceptional-base interface. No all-size computational claim.','atlas_graphs':count_graphs,'maximum_packings':count_packings,'singleton_orders':count_orders,'type11_case_occurrences':casecounts,'explicit_controls':examples,'seconds':time.time()-start,'proof_sha256':hashlib.sha256(Path('notes/root_cksu_order3_repair.md').read_bytes()).hexdigest()}
p=Path('evidence/cksu_order3_repair');p.mkdir(exist_ok=True);(p/'producer_check.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='explicit_controls'},indent=2))
