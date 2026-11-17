#!/usr/bin/env python3
"""Independent literal and exhaustive boundary-DP verification of one D witness.
Uses only the producer's literal graph, candidate C/Q and indicated apex labels.
Does not import/read producer algorithms, tables, claimed optima or historical Clebsch optimization.
"""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
from collections import Counter
import json,hashlib,time,datetime
R=Path(__file__).resolve().parents[1];src=R/'evidence/d_extension_literal_input.json';data=json.loads(src.read_text());start=time.monotonic()
n=data['n'];E=set(tuple(sorted(e)) for e in data['edges']);assert len(E)==len(data['edges'])
assert all(0<=a<b<n for a,b in E)
T=[t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))];TM=[frozenset(combinations(t,2)) for t in T]
assert len(T)==160 and set(T)==set(tuple(sorted(t)) for t in data['triangles'])
apices=sorted(int(mp['32']) for mp in data['local_vertex_maps']);assert len(set(apices))==4
assert all(len(set(t)&set(apices))==1 for t in T)
pieces=[]
for z in apices:
 rim=sorted({b if a==z else a for a,b in E if z in(a,b)});assert len(rim)==16
 localtri=[t for t in T if z in t];LE={tuple(v for v in t if v!=z) for t in localtri};assert len(LE)==40
 assert not any(set(combinations(t,2))<=LE for t in combinations(rim,3))
 spokes={tuple(sorted((z,v))) for v in rim};PE=LE|spokes
 pieces.append({'apex':z,'rim':rim,'rim_edges':LE,'spokes':spokes,'edges':PE})
counts=Counter(e for p in pieces for e in p['edges']);assert set(counts)==E
assert set(counts.values())=={1,2}
shared=sorted(e for e,c in counts.items() if c==2);assert len(shared)==8
assert not any(set(e)&set(apices) for e in shared)
Sidx={e:i for i,e in enumerate(shared)}
conditionals=[]
for p in pieces:
 rim=p['rim'];ix={v:i for i,v in enumerate(rim)};LE=p['rim_edges'];boundary=sorted(LE&set(shared));assert len(boundary)==4
 adj=[0]*16
 for a,b in LE:adj[ix[a]]|=1<<ix[b];adj[ix[b]]|=1<<ix[a]
 incident=[[] for _ in range(16)]
 for j,(a,b) in enumerate(boundary):incident[ix[a]].append((ix[b],j));incident[ix[b]].append((ix[a],j))
 size=1<<16;ec=[0]*size;bm=[0]*size;mins=[10**9]*16;arg=[None]*16
 for W in range(size):
  if W:
   bit=W&-W;v=bit.bit_length()-1;rest=W^bit;ec[W]=ec[rest]+(adj[v]&rest).bit_count();bm[W]=bm[rest]
   for u,j in incident[v]:
    if rest>>u&1:bm[W]|=1<<j
  # Shared selected edges are paid once globally; all unselected internal shared edges forbid this W.
  cost=16-W.bit_count()+ec[W]-bm[W].bit_count();r=bm[W]
  if cost<mins[r]:mins[r]=cost;arg[r]=W
 h=[];witness=[]
 for B in range(16):
  feasible=[r for r in range(16) if r&~B==0]
  r=min(feasible,key=lambda r:mins[r]);h.append(mins[r]);witness.append(arg[r])
 conditionals.append({'apex':p['apex'],'rim':rim,'boundary_edges':boundary,'exact_internal_boundary_min':mins,'h':h,'argmin_omitted_spokes_masks':witness,'enumerated_W_count':size})
pattern_costs=[];best=10**9;bestpat=None
for pattern in range(1<<len(shared)):
 total=pattern.bit_count();local=[]
 for tab in conditionals:
  B=sum(1<<j for j,e in enumerate(map(tuple,tab['boundary_edges'])) if pattern>>Sidx[e]&1)
  total+=tab['h'][B];local.append(B)
 pattern_costs.append({'shared_pattern':pattern,'local_masks':local,'total':total})
 if total<best:best=total;bestpat=pattern
computedC={e for i,e in enumerate(shared) if bestpat>>i&1}
for p,tab,B in zip(pieces,conditionals,pattern_costs[bestpat]['local_masks']):
 W=tab['argmin_omitted_spokes_masks'][B];omitted={v for i,v in enumerate(p['rim']) if W>>i&1}
 computedC|={tuple(sorted((p['apex'],v))) for v in p['rim'] if v not in omitted}
 computedC|={e for e in p['rim_edges'] if set(e)<=omitted and e not in shared}
assert len(computedC)==best and all(t&computedC for t in TM)
C=set(map(tuple,data['original_spoke_cover']));assert C<=E and len(C)==best and all(t&C for t in TM)
private=[t for t,m in zip(T,TM) if len(m&C)==1]
Q=[tuple(sorted(t)) for t in data['Q']];assert len(set(Q))==len(Q) and all(t in private for t in Q)
QE=set().union(*(set(combinations(t,2)) for t in Q));assert len(QE)==3*len(Q)
allspokes=set().union(*(p['spokes'] for p in pieces));privatecover=allspokes-C
assert len(privatecover)==20 and all(set(combinations(t,2))&privatecover for t in private)
assert len(Q)==len(privatecover)==20
residual=[t for t,m in zip(T,TM) if not m&QE];assert not residual
# Independently construct a maximum full packing: a perfect rim matching per apex,
# avoiding every shared rim edge, so pieces cannot conflict on their rim resource.
full=[];matchingrows=[]
for p in pieces:
 rim=p['rim'];ix={v:i for i,v in enumerate(rim)};adj=[0]*16
 for a,b in p['rim_edges']-set(shared):adj[ix[a]]|=1<<ix[b];adj[ix[b]]|=1<<ix[a]
 @lru_cache(None)
 def matching(remaining):
  if not remaining:return ()
  b=remaining&-remaining;v=b.bit_length()-1;rest=remaining^b;avail=adj[v]&rest
  while avail:
   q=avail&-avail;u=q.bit_length()-1;avail^=q;tail=matching(rest^q)
   if tail is not None:return ((rim[v],rim[u]),)+tail
  return None
 M=matching((1<<16)-1);assert M is not None and len(M)==8
 matchingrows.append({'apex':p['apex'],'matching':M});full.extend(tuple(sorted((p['apex'],a,b))) for a,b in M)
assert len(full)==32 and all(t in T for t in full)
assert len(set().union(*(set(combinations(t,2)) for t in full)))==3*len(full)
assert len(allspokes)==64 and all(len(m&allspokes)==2 for m in TM)
goodQ=[t for t in full if len(set(combinations(t,2))&C)==1]
assert len(goodQ)==len(privatecover)==20
common_vertices=set(T[0])
for t in T:common_vertices&=set(t)
assert not common_vertices
pending=set(range(len(T)));components=[]
while pending:
 q=[pending.pop()];c=[]
 while q:
  i=q.pop();c.append(i);new={j for j in pending if TM[i]&TM[j]};pending-=new;q.extend(new)
 components.append(c)
assert len(components)==1
out={'identity':'TUZA22-independent-D-extension-validator-v2','source_literal_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'elapsed_seconds':time.monotonic()-start,'n':n,'m':len(E),'actual_triangle_count':len(T),'actual_triangles':T,'apices':apices,'piece_rims':[p['rim'] for p in pieces],'piece_rim_edges':[sorted(p['rim_edges']) for p in pieces],'shared_edges':shared,'conditional_cover_tables':conditionals,'all_shared_pattern_costs':pattern_costs,'cover_optimum':best,'computed_minimum_cover':sorted(computedC),'displayed_minimum_C':sorted(C),'private_triangle_count':len(private),'private_triangles':private,'maximum_private_Q':Q,'private_packing_upper_cover':sorted(privatecover),'private_nu':len(Q),'residual_after_Q_triangles':residual,'maximum_extension_size':len(Q),'successful_maximum_private_Q':goodQ,'successful_extension_size':len(full),'full_packing':full,'full_piece_matchings':matchingrows,'ordinary_nu':32,'ordinary_nu_upper_bound_reason':'Every actual triangle uses exactly two edges from the64 distinct apex spokes.','triangle_component_count':len(components),'common_apex_vertices':sorted(common_vertices),'D_all':'REFUTED_BY_DISPLAYED_MINIMUM_C_AND_MAXIMUM_PRIVATE_Q','D_some_extension':'REFUTED_BY_SAME_C_Q_NO_RESIDUAL_TRIANGLE','D_some_choice':'SATISFIED_ON_THIS_GRAPH_BY_SAME_C_AND_DIFFERENT_MAXIMUM_PRIVATE_Q','unrestricted_Tuza':'SATISFIED_ON_THIS_GRAPH','validation':'PASS'}
(R/'evidence/d_extension_independent_verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['identity','elapsed_seconds','n','m','actual_triangle_count','cover_optimum','private_triangle_count','private_nu','maximum_extension_size','ordinary_nu','triangle_component_count','common_apex_vertices','D_all','D_some_extension','D_some_choice','validation']},indent=2))
