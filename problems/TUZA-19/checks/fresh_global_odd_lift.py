#!/usr/bin/env python3
"""Independent literal fixed C9-square optimal-odd-cover lift certificate."""
from itertools import combinations,product
from pathlib import Path
import hashlib,json,platform

def edge(a,b):return tuple(sorted((a,b)))
def triangles(n,E):
    return {t:frozenset(edge(a,b) for a,b in combinations(t,2)) for t in combinations(range(n),3)
            if all(edge(a,b) in E for a,b in combinations(t,2))}
def component_cycle(ts):
    names=list(ts);adj={t:set() for t in names}
    for a,b in combinations(names,2):
        if ts[a]&ts[b]:adj[a].add(b);adj[b].add(a)
    assert all(len(ns)==2 for ns in adj.values())
    first=names[0];order=[first];prev=None;v=first
    while True:
        nex=next(x for x in adj[v] if x!=prev)
        if nex==first:break
        assert nex not in order;order.append(nex);prev,v=v,nex
    assert len(order)==len(names)
    return order

def main():
    assert platform.system()=="Darwin";n=9;k=(n-1)//2
    rim=[edge(i,(i+1)%n) for i in range(n)];chord=[edge(i,(i+2)%n) for i in range(n)]
    E=set(rim+chord);T=triangles(n,E)
    expected={tuple(sorted((i,(i+1)%n,(i+2)%n))) for i in range(n)}
    assert set(T)==expected and len(E)==2*n
    order=component_cycle(T)
    solutions=[];best=2*n
    for bits in product((0,1),repeat=n):
        c=[1^bits[i]^bits[(i+1)%n] for i in range(n)]
        C={rim[i] for i,x in enumerate(bits) if x}|{chord[i] for i,x in enumerate(c) if x}
        assert all(len(C&es)%2==1 for es in T.values())
        if len(C)<best:best=len(C);solutions=[]
        if len(C)==best:solutions.append(sorted(C))
    assert best==k+1 and len(solutions)==9
    assert all(len(set(map(tuple,C))&set(rim))==k for C in solutions)
    assert all((n-len(set(map(tuple,C))&set(rim)))%2==1 for C in solutions)
    C={rim[i] for i in range(0,2*k,2)}|{chord[n-2]}
    assert sorted(C) in solutions
    # Triangle-degree counting proves tau>=ceil(n/2), and this cover attains it.
    byedge={e:[t for t in T if e in T[t]] for e in E}
    assert all(len(v)==(2 if e in rim else 1) for e,v in byedge.items())
    assert all(len(C&es)==1 for es in T.values())
    # Every edge occurs in a rotated minimum cover: exact criticality witnesses.
    covers=[{edge((u+s)%n,(v+s)%n) for u,v in C} for s in range(n)]
    assert set().union(*covers)==E
    # Literal packing DP on the small actual triangle-conflict graph.
    def packing(ts):
        names=list(ts);best=[]
        for mask in range(1<<len(names)):
            if mask.bit_count()<=len(best):continue
            chosen=[names[i] for i in range(len(names)) if mask>>i&1]
            if all(not(ts[a]&ts[b]) for a,b in combinations(chosen,2)):best=chosen
        return best
    P=packing(T);assert len(P)==k
    single={}
    for e in sorted(E):
        p=packing({t:es for t,es in T.items() if e not in es});assert len(p)==k;single[str(e)]=p
    D={rim[0],rim[2]};PD=packing({t:es for t,es in T.items() if not es&D});assert len(PD)==k-1
    # Build the actual graph lift, then enumerate ALL its actual triangles.
    EL=set()
    for u,v in E:
        y=int((u,v) not in C)
        for bit in (0,1):EL.add(edge(2*u+bit,2*v+(bit^y)))
    TL=triangles(2*n,EL);assert len(TL)==2*n
    lift_order=component_cycle(TL)
    PL=lift_order[::2];assert len(PL)==n
    assert all(not(TL[a]&TL[b]) for a,b in combinations(PL,2))
    CL=set()
    for i in range(0,2*n,2):
        common=TL[lift_order[i]]&TL[lift_order[i+1]];assert len(common)==1;CL|=common
    assert len(CL)==n and all(len(CL&es)==1 for es in TL.values())
    # Traverse the lifted rim to certify the covering graph is C18 squared.
    rimadj={v:set() for v in range(2*n)}
    for u,v in EL:
        if edge(u//2,v//2) in rim:rimadj[u].add(v);rimadj[v].add(u)
    assert all(len(ns)==2 for ns in rimadj.values())
    vertices=[0];prev=None;v=0
    while True:
        q=next(w for w in rimadj[v] if w!=prev)
        if q==0:break
        assert q not in vertices;vertices.append(q);prev,v=v,q
    assert len(vertices)==2*n
    squared={edge(vertices[i],vertices[(i+d)%(2*n)]) for i in range(2*n) for d in (1,2)}
    assert squared==EL
    out=dict(status="PASS",base_vertices=n,base_edges=sorted(E),base_triangles=list(T),nu=k,tau=best,pi=best,
             optimal_odd_covers=solutions,chosen_odd_cover=sorted(C),critical_cover_family=[sorted(c) for c in covers],
             single_edge_packing_witnesses=single,two_edge_blocker=sorted(D),packing_after_blocker=PD,
             lift_vertices=2*n,lift_edges=sorted(EL),lift_triangles=list(TL),lift_cycle_order=vertices,
             lift_packing=PL,lift_odd_cover=sorted(CL),lift_nu=n,lift_tau=n,lift_pi=n,
             checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    Path("evidence/fresh_global/odd_lift_c9.json").write_text(json.dumps(out,indent=2)+"\n")
    print(json.dumps({k:v for k,v in out.items() if k in ("status","nu","tau","pi","lift_nu","lift_tau","lift_pi","checker_sha256")},indent=2))
if __name__=="__main__":main()
