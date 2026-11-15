#!/usr/bin/env python3
"""Fresh standard-library-only Delta-Y audit; imports no producer checker."""
from itertools import combinations
from pathlib import Path
from collections import Counter
import hashlib,json,platform,shutil
EXPECTED='ac32c0f5d76207fb644b5f82bf34b1d1e99ecef2015ace820eb548fd07b0c8a8'

def e(u,v):return tuple(sorted((u,v)))
def tris(n,E):return {t:frozenset(combinations(t,2)) for t in combinations(range(n),3) if set(combinations(t,2))<=E}
def connected(E):
    V={v for ed in E for v in ed}
    if not V:return True
    seen={min(V)}
    while True:
        nxt=seen|{v for a,b in E for v in (a,b) if a in seen or b in seen}
        if nxt==seen:return seen==V
        seen=nxt

def transform(n,E,P):
    owner={};phi={}
    for j,t in enumerate(P):
        for ed in combinations(t,2):
            assert ed not in owner;owner[ed]=n+j;phi[ed]=e(n+j,next(v for v in t if v not in ed))
    for ed in E:
        if ed not in phi:phi[ed]=ed
    HE=set(phi.values());assert len(HE)==len(E)
    N=E-set(owner);stars={n+j:{e(n+j,v) for v in t} for j,t in enumerate(P)}
    return HE,phi,owner,N,stars

def iscycle(C):
    counts=Counter(v for ed in C for v in ed)
    return len(C)>=3 and all(v==2 for v in counts.values()) and connected(C)
def oddvertices(F):return {v for v,d in Counter(v for ed in F for v in ed).items() if d%2}

def exact_cycles(n,E,P):
    T=tris(n,E);HE,phi,owner,N,stars=transform(n,E,P)
    assert connected(HE) and not tris(n+len(P),HE)
    generated={};clauses=[]
    for t,Q in T.items():
        if t in P:continue
        chosen={owner[x] for x in Q if x in owner};r=len(chosen)
        assert r==sum(x in owner for x in Q) and 1<=r<=3
        L=set()
        for u,v in Q:
            if (u,v) in owner:L|={e(u,owner[u,v]),e(v,owner[u,v])}
            else:L.add((u,v))
        X={phi[x] for x in Q}
        for c in chosen:X.symmetric_difference_update(stars[c])
        assert X==L and iscycle(L) and len(L)==3+r
        assert sum(2 if ed in N else 1 for ed in L)==6
        off=set(L)&N
        for c in chosen:
            omitted=stars[c]-L;assert len(omitted)==1;off|=omitted
        assert off=={phi[x] for x in Q}
        generated[frozenset(L)]=dict(triangle=t,cycle=sorted(L),outside_rule_edges=sorted(off),r=r)
        clauses.append(off)
    found=set()
    for length in (4,5,6):
        for C in combinations(sorted(HE),length):
            if sum(2 if ed in N else 1 for ed in C)==6 and iscycle(C):found.add(frozenset(C))
    assert found==set(generated)
    return HE,phi,stars,clauses,list(generated.values())

def main():
    assert platform.system()=='Darwin'
    note=Path('notes/packing_new_delta_y_gate.md');assert hashlib.sha256(note.read_bytes()).hexdigest()==EXPECTED
    outdir=Path('evidence/delta_y_fresh');outdir.mkdir(parents=True,exist_ok=True)
    snap=Path('review/delta_y_fresh_inputs');snap.mkdir(parents=True,exist_ok=True);shutil.copyfile(note,snap/note.name)
    E=set(combinations(range(5),2));T=tris(5,E)
    packings=[tuple(P) for P in combinations(T,2) if not(T[P[0]]&T[P[1]])];assert len(packings)==15
    mincovers=[]
    for C in combinations(sorted(E),4):
        if all(set(C)&Q for Q in T.values()):mincovers.append(set(C))
    assert len(mincovers)==10 and all(all(len(C&Q)%2==1 for Q in T.values()) for C in mincovers)
    reports=[];boundary_options=set();boundary_rows=[]
    for P in packings:
        HE,phi,stars,clauses,cycles=exact_cycles(5,E,P);assert len(cycles)==8
        inv={f:g for g,f in phi.items()};HEL=sorted(HE);joins=[]
        for bits in range(1<<len(HEL)):
            F={HEL[i] for i in range(len(HEL)) if bits>>i&1};C={inv[f] for f in F}
            actual_cover=all(C&Q for Q in T.values())
            encoded_cover=all(F&S for S in stars.values()) and all(F&clause for clause in clauses)
            assert actual_cover==encoded_cover
            if oddvertices(F)==set(stars):joins.append(dict(F=sorted(F),C=sorted(C),size=len(F),cover=actual_cover))
        assert len(joins)==16 and min(x['size'] for x in joins)==2
        cc=Counter(x['size'] for x in joins if x['cover']);assert cc=={6:5,8:2}
        v=next(iter(set(P[0])&set(P[1])))
        for C in mincovers:
            F={phi[x] for x in C};old=oddvertices(F)&set(range(5));dc=Counter(u for ed in C for u in ed)
            dp=Counter(u for t in P for u in t)
            assert old=={u for u in range(5) if (dc[u]+dp[u])%2}
            assert len(old)==(2 if dc[v]==2 else 4)
            boundary_options.add((int(0 in old),len(old-{0})))
            boundary_rows.append(dict(P=P,C=sorted(C),old_boundary=sorted(old)))
        reports.append(dict(P=P,Tjoin_states=joins,cover_state_counts=dict(cc),cycles=cycles))
    # Check the four-free-bit equations literally in the canonical labelled packing.
    canonical=((0,1,2),(0,3,4));HE,phi,owner,N,stars=transform(5,E,canonical)
    for bits in range(16):
        p,q,r,s=[(bits>>i)&1 for i in range(4)];t=1^p^q^r^s
        values={(1,3):p,(1,4):q,(2,3):r,(2,4):s,(1,2):t,(3,4):t,
                (0,2):p^q,(0,1):r^s,(0,4):p^r,(0,3):q^s}
        C={ed for ed,x in values.items() if x};F={phi[x] for x in C}
        assert oddvertices(F)=={5,6}
    # Consequential r=3 / six-cycle test on a full seven-packing of K7.
    K7=set(combinations(range(7),2));P7=((3,5,6),(2,4,6),(1,4,5),(1,2,3),(0,3,4),(0,2,5),(0,1,6))
    assert set().union(*(set(combinations(t,2)) for t in P7))==K7 and sum(3 for _ in P7)==len(K7)
    _,_,_,_,cycles7=exact_cycles(7,K7,P7)
    assert len(cycles7)==28 and all(row['r']==3 and len(row['cycle'])==6 for row in cycles7)
    # Local boundary options, then exact two-state product calculation for bounded controls.
    assert boundary_options=={(1,1),(0,2),(1,3),(0,4)}
    bouquet_bounds=[]
    dp={0:0}
    for m in range(1,9):
        nxt={}
        for parity,cost in dp.items():
            for shared,private in boundary_options:
                q=parity^shared;nxt[q]=min(nxt.get(q,10**9),cost+private)
        dp=nxt;best=min(cost+parity for parity,cost in dp.items());assert best==m+(m%2)
        bouquet_bounds.append(dict(m=m,minimum_old_boundary=best))
    explicit=[]
    for m in (3,4):
        GE=set();P=[];C=set();Cclosed=set();private_u=[]
        for j in range(m):
            v,u,x,y=range(1+4*j,5+4*j);block=[0,v,u,x,y]
            GE|=set(combinations(sorted(block),2));P.extend([tuple(sorted((v,0,x))),tuple(sorted((v,u,y)))])
            C|=set(combinations(sorted((v,0,u)),2))|{e(x,y)}
            Cclosed|=set(combinations(sorted((0,u,x,y)),2));private_u.append(u)
        n=4*m+1;GT=tris(n,GE);assert len(GT)==10*m and len(C)==4*m and all(C&Q for Q in GT.values())
        HE,phi,_,_,stars=transform(n,GE,P);F={phi[x] for x in C};old=oddvertices(F)&set(range(n))
        assert old==set(private_u)|({0} if m%2 else set()) and len(old)==2*((m+1)//2)
        assert oddvertices(F)-set(range(n))==set(stars)
        Fclosed={phi[x] for x in Cclosed};assert len(Fclosed)==6*m and oddvertices(Fclosed)==set(stars)
        assert all(Cclosed&Q for Q in GT.values())
        explicit.append(dict(m=m,edges=sorted(GE),P=P,factor_two_cover=sorted(C),old_boundary=sorted(old),closed_boundary_cover=sorted(Cclosed)))
    # Same-ground-set matroid augmentation failure.
    star={(0,1),(0,2),(0,3)};cycle={(0,1),(1,2),(2,3),(0,3)}
    assert not tris(4,star) and not tris(4,cycle) and len(cycle)>len(star)
    assert all(tris(4,star|{x}) for x in cycle-star)
    result=dict(status='PASS',host=platform.system(),frozen_note_sha256=EXPECTED,
                checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),K5_maximum_packings=15,K5_join_states_per_packing=16,
                K5_covering_join_cost_distribution={6:5,8:2},K5_full_cover_equivalence_states=15*1024,
                K5_local_boundary_rows=len(boundary_rows),K7_nonpacked_triangles_and_six_cycles=len(cycles7),
                local_boundary_options=sorted(boundary_options),bouquet_bounds=bouquet_bounds)
    (outdir/'results.json').write_text(json.dumps(result,indent=2)+'\n')
    (outdir/'K5_states_and_cycles.json').write_text(json.dumps(reports,indent=2)+'\n')
    (outdir/'boundary_and_bouquets.json').write_text(json.dumps(dict(local_rows=boundary_rows,explicit_bouquets=explicit),indent=2)+'\n')
    (outdir/'K7_six_cycles.json').write_text(json.dumps(dict(edges=sorted(K7),P=P7,cycles=cycles7),indent=2)+'\n')
    assert hashlib.sha256(note.read_bytes()).hexdigest()==EXPECTED
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
