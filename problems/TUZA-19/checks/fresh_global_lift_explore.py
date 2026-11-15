#!/usr/bin/env python3
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json,time,hashlib,platform
from global_routes_sat import TriangleSAT

def build(L=7,w=3):
    coords=[(p,2*r+(p%2)) for p in range(L) for r in range(w)]
    ids={v:i for i,v in enumerate(coords)}
    def canon(p,q):
        k,p=divmod(p,L)
        if k%2:q=-q-1
        q%=2*w
        return ids[p,q]
    E=set();D=set()
    for i,(p,q) in enumerate(coords):
        for dp,dq in ((1,1),(1,-1),(2,0)):
            j=canon(p+dp,q+dq);assert i!=j
            e=tuple(sorted((i,j)));E.add(e)
            if (dp,dq)==(2,0):D.add(e)
    return coords,E,D

def independent_exact(ts):
    n=len(ts); sets=list(map(set,ts))
    links=[sum(1<<j for j in range(n) if sets[i]&sets[j]) for i in range(n)]
    def comps(mask):
        parts=[]
        while mask:
            todo=mask&-mask; c=0
            while todo:
                c|=todo; reach=0
                while todo:
                    z=todo&-todo;todo^=z;reach|=links[z.bit_length()-1]
                todo=reach&mask&~c
            mask&=~c;parts.append(c)
        return parts
    @lru_cache(None)
    def rec(mask):
        if not mask:return 0
        ps=comps(mask)
        if len(ps)>1:return sum(rec(p) for p in ps)
        ids=[i for i in range(n) if mask>>i&1]
        v=max(ids,key=lambda i:(links[i]&mask).bit_count())
        return max(rec(mask&~(1<<v)),1+rec(mask&~links[v]))
    return rec((1<<n)-1),rec.cache_info().currsize

def main():
    assert platform.system()=="Darwin";started=time.time()
    coords,E,D=build();G=TriangleSAT(len(coords),E)
    out=dict(construction="Triangular-lattice Klein quotient L=7,w=3",vertices=coords,edges=G.edges,triangles=G.triples,diagonal_cover=sorted(D),calls=[])
    target=Path("evidence/fresh_global/klein_lift_explore.json")
    def save():target.write_text(json.dumps(out,indent=2)+"\n")
    assert len(E)==3*len(coords) and len(G.triples)==2*len(coords)
    assert all(len(a)==2 for a in G.byedge)
    assert all(sum(G.edges[e] in D for e in t)==1 for t in G.ts)
    exact,states=independent_exact(G.ts);out.update(nu=exact,independent_DP_states=states,tau=len(D),pi=len(D))
    p=G.pack(exact);assert p["status"]=="SAT";out["initial_packing"]=p
    print("base",len(coords),len(E),len(G.triples),"nu",exact,"tau/pi",len(D),"DPstates",states,flush=True);save()
    # Every positive cover certificate is verified against every actual triangle.
    pending=set(range(len(E)));covers=[]
    while pending:
        e=min(pending);r=G.cover(len(D),forced=[e],timeout=10)
        out["calls"].append(dict(kind="critical",edge=e,**r))
        if r["status"]!="SAT":out["critical_status"]=r["status"];out["critical_failure_edge"]=e;break
        covers.append(r["cover_indices"]);pending-=set(r["cover_indices"]);save()
    else:out["critical_status"]="CERTIFIED_ALL_EDGES";out["critical_cover_family"]=covers
    print("critical",out["critical_status"],"covers",len(covers),flush=True);save()
    # One maximal packing certifies every deleted pair in its unused edge set.
    pending=set(combinations(range(len(E)),2));packs=[]
    def use_pack(r):
        used={e for t in r["packing_indices"] for e in G.ts[t]}
        unused=set(range(len(E)))-used
        pending.difference_update(combinations(sorted(unused),2));packs.append(r["packing_indices"])
    use_pack(p)
    while pending:
        pair=min(pending);r=G.pack(exact,deleted=pair,timeout=10)
        out["calls"].append(dict(kind="resilience",deleted=pair,**r))
        if r["status"]!="SAT":out["resilience_status"]=r["status"];out["resilience_failure_pair"]=pair;break
        use_pack(r)
        if len(packs)%25==0:print("pair certificates",len(packs),"remaining",len(pending),flush=True)
        save()
    else:out["resilience_status"]="CERTIFIED_ALL_PAIRS"
    out["resilience_packing_family"]=packs;out["resilience_pending_pairs"]=len(pending)
    # Triangle-even double lift for the displayed optimal odd cover.
    EL=set()
    for u,v in E:
        y=int((u,v) not in D)
        for bit in (0,1):EL.add(tuple(sorted((2*u+bit,2*v+(bit^y)))))
    LG=TriangleSAT(2*len(coords),EL)
    assert len(LG.triples)==2*len(G.triples)
    adj=[set() for _ in LG.ts]
    for a in LG.byedge:
        assert len(a)==2;i,j=a;adj[i].add(j);adj[j].add(i)
    colors={};bip=True
    for first in range(len(adj)):
        if first in colors:continue
        colors[first]=0;todo=[first]
        while todo:
            v=todo.pop()
            for u in adj[v]:
                if u in colors:
                    if colors[u]==colors[v]:bip=False
                else:colors[u]=1-colors[v];todo.append(u)
    out["lift"]=dict(vertices=LG.n,edges=LG.edges,triangles=LG.triples,conflict_bipartite=bip)
    if bip:
        chosen=[i for i in colors if colors[i]==0]
        assert len(chosen)==len(G.triples)
        es=[e for i in chosen for e in LG.ts[i]];assert len(es)==len(set(es))==len(LG.edges)
        out["lift"].update(nu=len(chosen),packing=[LG.triples[i] for i in chosen])
    out["elapsed_seconds"]=time.time()-started;save()
    print("resilience",out["resilience_status"],"lift nu",out["lift"].get("nu"),flush=True)
if __name__=="__main__":main()
