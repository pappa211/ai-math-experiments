"""Exact joint objective on seven representative minimum covers of the same52vertex graph.
One retained minimizing W perlocalboundary pattern, not all minimum covers.
"""
import json,itertools,time,networkx as nx
from pathlib import Path
R=Path(__file__).resolve().parents[1];x=json.loads((R/'evidence/challenger_cycle_two_matching.json').read_text());start=time.monotonic()
V=[v for v in range(32) if v.bit_count()%2==0];vi={v:i for i,v in enumerate(V)};L={tuple(sorted((a,b))) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4};J=list(map(tuple,x['shared_local_edges_incoming']+x['shared_local_edges_outgoing']));ji={e:i for i,e in enumerate(J)};maps=[{int(k):v for k,v in m.items()} for m in x['local_vertex_maps']];T=list(map(tuple,x['triangles']));h=x['conditional_cover_h'];hw=x['conditional_cover_argmin_W']
def ge(mp,e):return tuple(sorted(mp[v] for v in e))
def tri(mp,e):return tuple(sorted([mp[32]]+[mp[v] for v in e]))
patterns=[]
for f in range(256):
 local=[((f>>(2*((i-1)%4)))&3)|(((f>>(2*i))&3)<<2) for i in range(4)]
 if f.bit_count()+sum(h[a] for a in local)==44:patterns.append((f,local))
rows=[]
for f,local in patterns:
 C=set()
 for mp,mask in zip(maps,local):
  w=hw[mask];C|={ge(mp,(32,v)) for j,v in enumerate(V) if not w>>j&1};C|={ge(mp,e) for e in L if e not in ji and all(w>>vi[v]&1 for v in e)};C|={ge(mp,e) for j,e in enumerate(J) if mask>>j&1}
 assert len(C)==44 and all(set(itertools.combinations(t,2))&C for t in T)
 tables=[[],[]];wits=[[],[]]
 for mp in maps:
  priv={e:len(set(itertools.combinations(tri(mp,e),2))&C)==1 for e in L}
  for mode in [0,1]:
   vals=[];ms=[]
   for allow in range(16):
    H=nx.Graph();H.add_nodes_from(V)
    for e in L:
     if e not in ji or allow>>ji[e]&1:H.add_edge(*e,weight=int(priv[e]) if mode==0 else 100*int(priv[e])+1)
    M=[tuple(sorted(e)) for e in nx.max_weight_matching(H,maxcardinality=mode==0)];q=sum(priv[e] for e in M);p=len(M);vals.append((p,q) if mode==0 else(q,p));ms.append(M)
   tables[mode].append(vals);wits[mode].append(ms)
 bests=[];packs=[]
 for mode in [0,1]:
  best=(-1,-1);bestperms=None
  for own in range(256):
   perms=[(((~own)>>(2*((i-1)%4)))&3)|(((own>>(2*i))&3)<<2) for i in range(4)];val=tuple(sum(tables[mode][i][a][j] for i,a in enumerate(perms)) for j in [0,1])
   if val>best:best=val;bestperms=perms
  P=[tri(mp,e) for i,(mp,a) in enumerate(zip(maps,bestperms)) for e in wits[mode][i][a]]
  assert all(not set(itertools.combinations(a,2))&set(itertools.combinations(b,2)) for a,b in itertools.combinations(P,2));bests.append(best);packs.append(P)
 row={'shared_cover_pattern':f,'C':sorted(C),'local_W':[hw[a] for a in local],'nu_full':bests[0][0],'private_among_full_maxima':bests[0][1],'nu_private':bests[1][0],'p_star':bests[1][1],'joint_attainable':bests[0][1]==bests[1][0],'full_first_packing':packs[0],'private_first_packing':packs[1],'local_lex_tables':tables};rows.append(row)
 (R/'evidence/challenger_cycle_joint.json').write_text(json.dumps({'scope':'Seven sharedcoverpatterns, one canonical localW perpattern; not every minimumcover. Full literalgraph in challenger_cycle_two_matching.json.','rows':rows,'seconds':time.monotonic()-start},indent=2)+'\n')
 print('pattern',f,'fullfirst',bests[0],'privatefirst',bests[1],'joint',row['joint_attainable'],flush=True)
 if not row['joint_attainable']:break
print('DONE',len(rows),time.monotonic()-start)
