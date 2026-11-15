#!/usr/bin/env python3
"""One bounded, exact-CNF discriminator, not an isomorph-free graph census.
Search: n=11, alpha=4, connected triangle-free alpha-critical noncycle, M<=9.
SAT candidates are independently checked by all 2048 vertex subsets.
UNSAT means only this finite solver-level result, with no proof trace claim.
"""
from itertools import combinations
from pathlib import Path
import json,time,platform
from global_routes_sat import CNF
n=11;alpha=4;bound=9
pairs=list(combinations(range(n),2));eid={e:i+1 for i,e in enumerate(pairs)}
F=CNF(len(pairs))
def es(U):return [eid[e] for e in combinations(U,2)]
for T in combinations(range(n),3):F.add(*[-x for x in es(T)])
# Every vertex of a connected nontrivial alpha-critical graph lies in a maximum
# independent set: use an alpha+1 witness for any incident critical edge.
# Therefore label a degree>=3 vertex 0 and a maximum independent set 0,1,2,3.
for e in combinations(range(alpha),2):F.add(-eid[e])
F.atleast([eid[tuple(sorted((0,v)))] for v in range(1,n)],3)
for v in range(n):F.atleast([eid[tuple(sorted((v,w)))] for w in range(n) if w!=v],2)
for U in combinations(range(n),alpha+1):F.add(*es(U))
witnesses={e:[] for e in pairs}
for U in combinations(range(n),alpha+1):
    E=es(U)
    for e in combinations(U,2):
        w=F.var();witnesses[e].append(w);F.add(-w,eid[e])
        for f in E:
            if f!=eid[e]:F.add(-w,-f)
for e in pairs:F.add(-eid[e],*witnesses[e])
for U in combinations(range(n),6):F.atleast(es(U),3)
records=[];start=time.monotonic();answer=None
for iteration in range(8):
    result=F.solve(timeout=20)
    model=result.pop('positive',None)
    print(json.dumps({'iteration':iteration,**result}),flush=True)
    if model is None:
        records.append({'iteration':iteration,**result});answer=result['status'];break
    E=[e for e in pairs if eid[e] in model];adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    size=[0]*(1<<n);ec=[0]*(1<<n);ind=[];worth=-1;bad=[]
    for mask in range(1,1<<n):
        bit=mask&-mask;v=bit.bit_length()-1;rest=mask^bit
        size[mask]=size[rest]+1;ec[mask]=ec[rest]+(adj[v]&rest).bit_count()
        if not ec[mask]:ind.append(mask)
        w=2*size[mask]-ec[mask];worth=max(worth,w)
        if w>bound:bad.append(mask)
    actual_alpha=max(size[s] for s in ind)
    assert actual_alpha==alpha
    triangles=[T for T in combinations(range(n),3) if all(e in E for e in combinations(T,2))]
    assert not triangles
    ew={}
    for e in E:
        mask_e=sum(1<<v for v in e)
        candidates=[s for s in range(1<<n) if size[s]==alpha+1 and ec[s]==1 and s&mask_e==mask_e]
        assert candidates
        ew[str(e)]=[v for v in range(n) if candidates[0]>>v&1]
    reached=1
    while True:
        more=reached
        for v in range(n):
            if reached>>v&1:more|=adj[v]
        if more==reached:break
        reached=more
    connected=reached==(1<<n)-1
    rec={'iteration':iteration,**result,'edges':E,'actual_alpha':actual_alpha,'maximum_worth':worth,'connected':connected,'critical_edge_witnesses':ew,'violating_subset_count':len(bad)}
    records.append(rec)
    if not connected:
        cross=[eid[e] for e in pairs if bool(reached>>e[0]&1)!=bool(reached>>e[1]&1)]
        F.add(*cross)
    if not bad and connected:
        answer='VERIFIED_COUNTEREXAMPLE';break
    # Add every violated worth constraint in this candidate (at most 2048).
    for mask in bad:
        U=[v for v in range(n) if mask>>v&1]
        F.atleast(es(U),2*len(U)-bound)
else:answer='UNKNOWN_ITERATION_LIMIT'
out={'scope':'single fixed n=11 alpha=4 target; not a general proof','host':platform.system(),'n':n,'alpha':alpha,'maximum_worth_bound':bound,'answer':answer,'seconds':time.monotonic()-start,'records':records}
path=Path(__file__).resolve().parents[1]/'evidence/global_routes/worth_critical_n11_a4.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'answer':answer,'seconds':out['seconds'],'evidence':str(path)}),flush=True)
