"""Explicit certificate enhancement for the frozen D-all/D-some-extension witness."""
import json,itertools,networkx as nx,time
from pathlib import Path
R=Path(__file__).resolve().parents[1];x=json.loads((R/'evidence/challenger_cycle_two_matching.json').read_text());begin=time.monotonic()
E=set(map(tuple,x['edges']));T=list(map(tuple,x['triangles']));C=set(map(tuple,x['original_spoke_cover']));badQ=list(map(tuple,x['Q']));maps=[{int(k):v for k,v in m.items()} for m in x['local_vertex_maps']];J=[tuple(e) for e in x['shared_local_edges_incoming']+x['shared_local_edges_outgoing']];r=4;t=2
V=[v for v in maps[0] if v!=32];I={31^(1<<i) for i in range(5)};L={tuple(sorted((a,b))) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4}
def tri(mp,a,b):return tuple(sorted((mp[32],mp[a],mp[b])))
def edges(t):return set(itertools.combinations(t,2))
private=[tt for tt in T if len(edges(tt)&C)==1]
private_cover={tuple(sorted((mp[32],mp[v]))) for mp in maps for v in I}
assert len(private_cover)==20 and all(edges(tt)&private_cover for tt in private)
assert len(badQ)==20 and all(tt in private for tt in badQ)
assert all(not edges(a)&edges(b) for a,b in itertools.combinations(badQ,2))
assert all(any(edges(tt)&edges(q) for q in badQ) for tt in T)
full=[]
for mp in maps:
 for a in V:
  b=a^15
  if a<b:full.append(tri(mp,a,b))
assert len(full)==32 and all(tt in T for tt in full) and all(not edges(a)&edges(b) for a,b in itertools.combinations(full,2))
# A different maximum private packing, avoiding every shared rim edge.
alt=[];active=[]
for mp in maps:
 H=nx.Graph();H.add_nodes_from(V);H.add_edges_from(e for e in L if ((e[0] in I)!=(e[1] in I)) and e not in J)
 M=[tuple(sorted(e)) for e in nx.max_weight_matching(H,maxcardinality=True)];assert len(M)==5
 alt.extend(tri(mp,a,b) for a,b in M);active.append(set(V)-set(itertools.chain.from_iterable(M)))
tables=[];wits=[]
for U in active:
 vals=[];ws=[]
 for allow in range(16):
  H=nx.Graph();H.add_nodes_from(U);H.add_edges_from(e for e in L if set(e)<=U and (e not in J or allow>>J.index(e)&1))
  M=[tuple(sorted(e)) for e in nx.max_weight_matching(H,maxcardinality=True)];vals.append(len(M));ws.append(M)
 tables.append(vals);wits.append(ws)
best=-1;bestpermissions=[]
for own in range(256):
 permissions=[];val=0
 for i in range(4):
  incoming=((~own)>>(2*((i-1)%4)))&3;outgoing=(own>>(2*i))&3;permission=incoming|(outgoing<<2);permissions.append(permission);val+=tables[i][permission]
 if val>best:best=val;bestpermissions=permissions
extension=alt[:]
for mp,ws,permission in zip(maps,wits,bestpermissions):extension.extend(tri(mp,a,b) for a,b in ws[permission])
assert all(tt in private for tt in alt) and len(alt)==20
assert len(extension)>=22 and all(tt in T for tt in extension) and all(not edges(a)&edges(b) for a,b in itertools.combinations(extension,2))
x.update(claim_status='PROPOSED_COUNTEREXAMPLE_PENDING_FRESH_REVIEW',refuted_variants=['D-all','D-some-extension'],not_refuted=['D-some-choice','unrestricted Tuza'],minimum_cover=sorted(C),private_family=private,private_family_cover=sorted(private_cover),nu_private_exact=20,bad_maximum_private_packing=badQ,maximum_extension_of_bad_Q=20,nu_full_exact=32,full_maximum_packing=full,alternative_maximum_private_packing=alt,successful_extension=extension,successful_extension_size=len(extension),alternative_maximum_extension_size=len(extension),alternative_extension_tables=tables,alternative_extension_permissions=bestpermissions,certificate_enhancement_seconds=time.monotonic()-begin)
good=[tt for tt in full if tt in private]
assert len(good)==20
x.update(successful_maximum_private_packing=good,successful_full_extension=full,successful_full_extension_size=32,successful_construction='XOR15 perfect rim matching in each piece; its five I-crossing edges give a private maximum, and all eight edges give the full extension. Shared rim edges have XOR30.')
(R/'evidence/challenger_D_counterexample.json').write_text(json.dumps(x,indent=2)+'\n')
print('tau44 private20 bad_extension20 fullnu32 good_extension',len(extension),'seconds',time.monotonic()-begin)
