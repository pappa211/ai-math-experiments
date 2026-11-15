#!/usr/bin/env python3
"""Literal K4 barycentric triangle-complex transfer obstruction; no solver."""
from itertools import combinations,permutations
from pathlib import Path
import json,platform
assert platform.system()=='Darwin'
base_vertices=list(range(4));base_edges=list(combinations(base_vertices,2));base_triangles=list(combinations(base_vertices,3))
faces=[(v,) for v in base_vertices]+base_edges+base_triangles
fid={s:i for i,s in enumerate(faces)}
E=[(i,j) for i,j in combinations(range(len(faces)),2) if set(faces[i])<set(faces[j]) or set(faces[j])<set(faces[i])]
Es=set(E)
Ts=[t for t in combinations(range(len(faces)),3) if all(e in Es for e in combinations(t,2))]
flags={tuple(sorted((fid[(v,)],fid[e],fid[T]))):(v,e,T) for T in base_triangles for e in combinations(T,2) for v in e}
assert set(Ts)==set(flags) and len(Ts)==24 and len(E)==36
parity={};permutation={}
for p in permutations(base_vertices):
    t=tuple(sorted((fid[(p[0],)],fid[tuple(sorted(p[:2]))],fid[tuple(sorted(p[:3]))])))
    assert t in flags and t not in parity
    parity[t]=sum(p[i]>p[j] for i in range(4) for j in range(i+1,4))%2
    permutation[t]=p
inc={e:[t for t in Ts if set(e)<=set(t)] for e in E}
assert all(len(ts)==2 and parity[ts[0]]!=parity[ts[1]] for ts in inc.values())
for ts in inc.values():
    p,q=[permutation[t] for t in ts]
    assert any(tuple(p[:i]+(p[i+1],p[i])+p[i+2:])==q for i in range(3))
P=[t for t in Ts if parity[t]==0]
used=[e for t in P for e in combinations(t,2)]
assert len(P)==12 and len(used)==len(set(used))==len(E) and set(used)==Es
C=[e for e in E if sorted(len(faces[v]) for v in e)==[1,2]]
assert len(C)==12 and all(set(combinations(t,2))&set(C) for t in Ts)
out={'scope':'one K4 control; universal integer-weight conclusion is the ordinary bipartite-incidence/TU proof','base_vertices':base_vertices,'base_edges':base_edges,'base_triangles':base_triangles,'faces':faces,'edges':E,'actual_triangles':Ts,'flag_permutations':[{'triangle':t,'permutation':permutation[t],'parity':parity[t]} for t in Ts],'packing':P,'cover':C,'edge_triangle_incidence':[{'edge':e,'triangles':ts} for e,ts in inc.items()],'nu':12,'tau':12,'status':'PASS'}
path=Path(__file__).resolve().parents[1]/'evidence/global_routes/barycentric_k4.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'vertices':len(faces),'edges':len(E),'actual_triangles':len(Ts),'packing':len(P),'cover':len(C),'all_edge_columns_have_two_opposite_parities':True,'status':'PASS'}))
