#!/usr/bin/env python3
"""Fresh reviewer checker. No producer code/evidence imported; standard library only.
Checks finite diagnostics, not the arbitrary-J theorem by enumeration.
"""
from fractions import Fraction as F
from functools import lru_cache
from itertools import combinations, product
from pathlib import Path
from hashlib import sha256
import json, platform, sys, time

EXPECTED = "6166d3f4202cb91769e09508ba6601db56f320e06b6a2032e9b6960c738d7434"

def E(a,b): return tuple(sorted((a,b)))
def actual_triangles(vertices,edges):
    return {tuple(sorted((E(a,b), E(a,c), E(b,c)))) for a,b,c in combinations(vertices,3)
            if {E(a,b), E(a,c), E(b,c)} <= edges}

def components(mask, links):
    parts=[]
    while mask:
        seed=mask & -mask; component=0; frontier=seed
        while frontier:
            component |= frontier
            reach=0
            t=frontier
            while t:
                bit=t & -t; t ^= bit; reach |= links[bit.bit_length()-1]
            frontier=reach & mask & ~component
        mask &= ~component; parts.append(component)
    return parts

def packing(tris):
    tris=list(map(set,tris)); n=len(tris)
    links=[sum(1<<j for j in range(n) if tris[i]&tris[j]) for i in range(n)]
    @lru_cache(None)
    def solve(mask):
        if not mask: return 0
        parts=components(mask,links)
        if len(parts)>1: return sum(solve(p) for p in parts)
        ids=[i for i in range(n) if mask>>i&1]
        i=max(ids,key=lambda j:(links[j]&mask).bit_count())
        return max(solve(mask&~(1<<i)),1+solve(mask&~links[i]))
    answer=solve((1<<n)-1)
    return answer,solve.cache_info().currsize

def cover(tris):
    tris=list(map(set,tris)); n=len(tris)
    edges=set().union(*tris) if tris else set()
    raw={sum(1<<i for i,t in enumerate(tris) if e in t) for e in edges}
    @lru_cache(None)
    def solve(mask):
        if not mask: return 0
        candidates={c&mask for c in raw}-{0}
        candidates={c for c in candidates if not any(c!=d and c&d==c for d in candidates)}
        links=[0]*n
        for c in candidates:
            t=c
            while t:
                bit=t&-t; t^=bit; links[bit.bit_length()-1] |= c
        parts=components(mask,links)
        if len(parts)>1: return sum(solve(p) for p in parts)
        ids=[i for i in range(n) if mask>>i&1]
        i=min(ids,key=lambda j:(sum(bool(c>>j&1) for c in candidates),
                                -sum(c.bit_count() for c in candidates if c>>j&1)))
        options=sorted((c for c in candidates if c>>i&1),key=int.bit_count,reverse=True)
        return 1+min(solve(mask&~c) for c in options)
    answer=solve((1<<n)-1)
    return answer,solve.cache_info().currsize

def rank(rows,n):
    basis={}
    for original in rows:
        row=list(map(F,original))
        for col in range(n):
            if not row[col]: continue
            if col in basis:
                factor=row[col]
                row=[a-factor*b for a,b in zip(row,basis[col])]
            else:
                factor=row[col]; basis[col]=[a/factor for a in row]; break
    return len(basis)

def check(label,n,oriented,integral=True):
    core={E(u,v) for u,v in oriented}
    assert len(core)==len(oriented)
    assert all(0<=u<n and 0<=v<n and u!=v for u,v in oriented)
    graph=set(core); H=set(); wheels=[]; expected_local=set(); avoid=set(); chosen=set(); bad=set()
    for j,(u,v) in enumerate(oriented):
        a,b,c,d=range(n+4*j,n+4*j+4); rim=[v,a,b,c,d]
        spokes={E(u,r) for r in rim}; rimedges={E(rim[k],rim[(k+1)%5]) for k in range(5)}
        wheel=spokes|rimedges; graph |= wheel; H |= spokes; wheels.append(wheel)
        expected_local |= {tuple(sorted((E(u,rim[k]),E(u,rim[(k+1)%5]),E(rim[k],rim[(k+1)%5])))) for k in range(5)}
        avoid |= {tuple(sorted((E(u,a),E(u,b),E(a,b)))),tuple(sorted((E(u,c),E(u,d),E(c,d))))}
        chosen |= {E(u,v),E(u,b),E(u,d)}; bad |= {E(u,a),E(u,c),E(u,d)}
    m=len(core); vertices=range(n+4*m)
    assert len(graph)==10*m and len(H)==5*m
    assert set().union(*wheels)==graph if wheels else graph==set()
    assert all(not (wheels[i]&wheels[j]) for i in range(m) for j in range(i))
    tris=actual_triangles(vertices,graph); coretris=actual_triangles(range(n),core)
    assert tris==expected_local|coretris and not expected_local&coretris
    assert len(tris)==5*m+len(coretris)
    assert {e for e in H if max(e)<n}==core
    assert all(sum(v in e for e in H)==1 for v in range(n,n+4*m))
    x={e:F(1,2) if e in H else F(0) for e in graph}
    y={t:F(1,2) if t in expected_local else F(0) for t in tris}
    loads={e:sum(y[t] for t in tris if e in t) for e in graph}
    assert all(sum(x[e] for e in t)>=1 for t in tris)
    assert all(loads[e]<=1 for e in graph)
    assert sum(x.values())==sum(y.values())==F(5*m,2)
    assert all(loads[e]==(1 if e in H else F(1,2)) for e in graph)
    ordered=sorted(graph); rows=[]
    for e in ordered:
        if loads[e]<1: rows.append([int(f==e) for f in ordered])
    rows.extend([int(e in t) for e in ordered] for t in tris if y[t]>0)
    matrix_rank=rank(rows,len(ordered)); assert matrix_rank==len(graph)
    hs=sorted(H); hpos={e:i for i,e in enumerate(hs)}; links=[0]*len(H); degrees=[0]*len(H)
    for t in tris:
        if sum(x[e] for e in t)==1:
            active=[e for e in t if e in H]; assert len(active)==2
            i,j=map(hpos.get,active); links[i]|=1<<j;links[j]|=1<<i;degrees[i]+=1;degrees[j]+=1
        else: assert t in coretris and sum(x[e] for e in t)==F(3,2)
    parts=components((1<<len(H))-1,links)
    assert len(parts)==m and all(p.bit_count()==5 for p in parts) and all(d==2 for d in degrees)
    assert len(chosen)==len(bad)==3*m and all(set(t)&chosen for t in tris)
    assert all(set(t)&bad for t in expected_local)
    assert all(not(set(t)&bad) for t in coretris)
    assert len(avoid)==2*m and not any(set(t)&core for t in avoid)
    assert all(not(set(s)&set(t)) for s,t in combinations(avoid,2))
    result=dict(label=label,n=n,m=m,vertices=len(vertices),edges=len(graph),triangles=len(tris),
                core_triangles=len(coretris),certificate_rank=matrix_rank,integral_checked=integral)
    if integral:
        nuj,_=packing(coretris); nu,ps=packing(tris); tau,cs=cover(tris)
        assert nu==2*m+nuj and tau==3*m
        result.update(nu=nu,tau=tau,nu_core=nuj,packing_states=ps,cover_states=cs)
    return result

def main():
    assert platform.system()=="Darwin"
    note=Path("notes/fractional_routes_halfcover_embedding.md")
    assert sha256(note.read_bytes()).hexdigest()==EXPECTED
    started=time.time(); results=[]
    # Every labeled core graph through three vertices, with every orientation.
    for n in range(4):
        pairs=list(combinations(range(n),2))
        for states in product(range(3),repeat=len(pairs)):
            oriented=[(u,v) if s==1 else (v,u) for (u,v),s in zip(pairs,states) if s]
            results.append(check(f"all_n{n}_states{''.join(map(str,states))}",n,oriented))
    # Every labeled four-vertex core graph, one orientation each.
    pairs=list(combinations(range(4),2))
    for bits in range(1<<len(pairs)):
        results.append(check(f"n4_mask{bits}",4,[e for i,e in enumerate(pairs) if bits>>i&1]))
    # Interfaces with repeated source/sink vertices and distinct triangle overlaps.
    results.append(check("bowtie",5,[(0,1),(1,2),(2,0),(0,3),(3,4),(4,0)]))
    results.append(check("C5",5,[(i,(i+1)%5) for i in range(5)]))
    results.append(check("K4_reversed",4,[(v,u) for u,v in pairs]))
    results.append(check("K4_mixed",4,[(v,u) if i%2 else (u,v) for i,(u,v) in enumerate(pairs)]))
    results.append(check("K5_LP_geometry_only",5,list(combinations(range(5),2)),integral=False))
    report=dict(status="PASS",scope="Finite diagnostic checks; arbitrary-J argument reviewed separately",
                host=platform.system(),python=sys.version,elapsed_seconds=time.time()-started,
                frozen_input_sha256=EXPECTED,checker_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),
                cases=len(results),exact_integral_cases=sum(r["integral_checked"] for r in results),results=results)
    target=Path("evidence/fractional_fresh/checker_results.json")
    target.write_text(json.dumps(report,indent=2)+"\n")
    print(json.dumps({k:v for k,v in report.items() if k!="results"},indent=2))
if __name__=="__main__": main()
