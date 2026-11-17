"""Exact private packing by shared-rim ownership and local ordinary matchings."""
import json,itertools,networkx as nx,time
from pathlib import Path
R=Path(__file__).resolve().parents[1];x=json.loads((R/'evidence/challenger_cycle_cones.json').read_text());t0=time.monotonic()
E=set(map(tuple,x['edges']));C=set(map(tuple,x['minimum_cover']));T=list(map(tuple,x['triangles']));P=list(map(tuple,x['Q']));maps=[{int(k):v for k,v in m.items()} for m in x['local_vertex_maps']];J=[tuple(e) for e in x['shared_local_edges_incoming']+x['shared_local_edges_outgoing']];r=len(maps)
V=[v for v in maps[0] if v!=32];L={tuple(sorted((a,b))) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4}
def ge(mp,e):return tuple(sorted(mp[v] for v in e))
F=[t for t in T if len(set(itertools.combinations(t,2))&C)==1]
tables=[];witnesses=[]
for mp in maps:
 private=[]
 for e in L:
  tri=tuple(sorted((mp[32],mp[e[0]],mp[e[1]])))
  if tri in F:private.append(e)
 row=[];wit=[]
 for perm in range(64):
  H=nx.Graph();H.add_nodes_from(V);H.add_edges_from(e for e in private if e not in J or perm>>J.index(e)&1)
  M=nx.max_weight_matching(H,maxcardinality=True);row.append(len(M));wit.append([tuple(sorted(e)) for e in M])
 tables.append(row);witnesses.append(wit)
best=-1;bestown=None;bestperms=None
for own in range(1<<12):
 perms=[];val=0
 for i in range(4):
  incoming=((~own)>>(3*((i-1)%4)))&7;outgoing=(own>>(3*i))&7;perm=incoming|(outgoing<<3);perms.append(perm);val+=tables[i][perm]
 if val>best:best=val;bestown=own;bestperms=perms
Q=[]
for mp,wit,perm in zip(maps,witnesses,bestperms):Q.extend(tuple(sorted((mp[32],mp[a],mp[b]))) for a,b in wit[perm])
qe=[set(itertools.combinations(t,2)) for t in Q];assert all(t in F for t in Q) and all(not a&b for a,b in itertools.combinations(qe,2))
private_in_P=[t for t in P if t in F]
res=[t for t in T if all(not set(itertools.combinations(t,2))&e for e in qe)]
x.update(private_family=F,private_packing_tables=tables,private_maximum=best,private_maximum_packing=Q,private_in_bad_P=private_in_P,private_in_bad_P_size=len(private_in_P),private_best_ownership=bestown,private_best_permissions=bestperms,residual_after_maximum_private=res,private_computation_seconds=time.monotonic()-t0)
(R/'evidence/challenger_cycle_private.json').write_text(json.dumps(x,indent=2)+'\n')
print('tau',x['tau_exact'],'private',best,'private_in_bad_P',len(private_in_P),'residual_triangles',len(res),'seconds',time.monotonic()-t0)
