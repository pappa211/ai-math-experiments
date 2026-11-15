#!/usr/bin/env python3
"""Six fixed literal-triangle SAT controls for the abv-page profile.
The all-size theorem is ordinary proof; solver UNSAT is not a kernel proof.
"""
from itertools import combinations
from pathlib import Path
import json, platform
from global_routes_sat import TriangleSAT
assert platform.system()=='Darwin'
BASE=Path(__file__).resolve().parents[1]

def matchings(edges):
    out=[()]
    for e in edges:
        out += [M+(e,) for M in out if not(set(e)&{v for f in M for v in f})]
    return out

def expectation(n,edges,U):
    ms=matchings([e for e in edges if not(set(e)&U)])
    m=max(map(len,ms));nonisolated={v for e in edges for v in e}
    eps=any(nonisolated-U-{v for e in M for v in e} for M in ms if len(M)==m)
    return 2*n+m+int(eps),m,int(eps)

def make_graph(n,rim):
    # apices0,1; rim vertexv is2+v; privatepair is2+n+2v,3+n+2v
    E={tuple(sorted((u+2,v+2))) for u,v in rim};pages=[]
    for v in range(n):
        P={0,1,2+v,2+n+2*v,3+n+2*v};pages.append(P)
        E.update(combinations(sorted(P),2))
    ts=TriangleSAT(2+3*n,E)
    assert len(ts.triples)==10*n+2*len(rim)
    for T in ts.triples:
        if any(set(T)<=P for P in pages):continue
        assert sum(v in (0,1) for v in T)==1
        rs=tuple(sorted(v-2 for v in T if v not in (0,1)))
        assert rs in rim
    return ts

rows=[]
for name,n,rim in [('K2',2,[(0,1)]),('P3',3,[(0,1),(1,2)]),('C5',5,[(0,1),(1,2),(2,3),(3,4),(0,4)])]:
    ts=make_graph(n,rim)
    for U in (set(),{0,1}):
        target,m,eps=expectation(n,rim,U)
        D=[ts.eid[(0,v+2)] for v in sorted(U)]
        lower=ts.pack(target,deleted=D,timeout=3)
        upper=ts.pack(target+1,deleted=D,timeout=3)
        assert lower['status']=='SAT',(name,U,'lower',lower)
        assert upper['status']=='UNSAT',(name,U,'upper',upper)
        rows.append({'rim':name,'rim_n':n,'deleted_a_spokes_at':sorted(U),'vertices':ts.n,'edges':len(ts.edges),'actual_triangles':len(ts.triples),'matching':m,'epsilon':eps,'expected_nu':target,'lower':lower,'upper':upper})
# Literal independent local K5 capacity checks.
k5=TriangleSAT(5,list(combinations(range(5),2)))
local=[]
for mask in range(8):
    reserved=[k5.eid[e] for j,e in enumerate([(0,1),(0,2),(1,2)]) if mask&(1<<j)]
    tris=[set(t) for t in k5.ts if not(set(t)&set(reserved))]
    cap=2 if any(not(t&u) for t,u in combinations(tris,2)) else int(bool(tris))
    assert cap==(1 if mask==7 else 2)
    local.append({'unavailable_base_mask':mask,'capacity':cap})
report={'status':'PASS','scope':'six fixed controls; SAT lower models literally verified; UNSAT solver-level only; all-size statement proved separately','rows':rows,'local_K5_states':local}
out=BASE/'evidence/global_routes/abv_reservoir_controls.json'
out.write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'status':'PASS','fixed_global_states':len(rows),'local_states':len(local),'output':str(out)}))
