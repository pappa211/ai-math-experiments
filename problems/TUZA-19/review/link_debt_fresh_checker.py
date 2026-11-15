#!/usr/bin/env python3
"""Fresh fixed-certificate checks. Standard library, no producer imports."""
from pathlib import Path
from itertools import combinations,permutations
import hashlib,json,platform
W=Path(__file__).resolve().parents[1]
OUT=W/'evidence/link_debt_fresh';OUT.mkdir(parents=True,exist_ok=True)
def ed(u,v):return tuple(sorted((u,v)))
def es(t):return {ed(u,v) for u,v in combinations(t,2)}
def complete(n):return set(combinations(range(n),2))
def all_triangles(vertices,edges):return [t for t in combinations(vertices,3) if es(t)<=edges]
def packing_ok(P,edges):
    used=set()
    for t in P:
        te=es(t);assert te<=edges and not te&used
        used|=te
    return used

def double(n,P):
    new={i:n+1+i for i in range(n)};infinity=n
    out=list(P)
    factors=[]
    used_new=set()
    for j in range(n):
        F=[ed(infinity,new[j])]+[ed(new[(j+t)%n],new[(j-t)%n]) for t in range(1,(n-1)//2+1)]
        assert len(set(v for e in F for v in e))==n+1
        assert not used_new&set(F);used_new|=set(F)
        out.extend(tuple(sorted((j,x,y))) for x,y in F)
        factors.append(F)
    assert used_new==set(combinations(range(n,2*n+1),2))
    return 2*n+1,out

n=5;P=[(0,1,2),(0,3,4)];families=[]
for level in range(3):
    edges=complete(n);used=packing_ok(P,edges);leave=edges-used
    assert leave=={(1,3),(1,4),(2,3),(2,4)}
    assert len(P)==(n*(n-1)-8)//6
    assert (len(edges)-1)%3==0
    assert all(sum(v in e for e in leave)%2==0 for v in range(n))
    family={'n':n,'packing':[list(t) for t in P],'leave':sorted(leave),'nu':len(P),'tau':(n-1)**2//4}
    # Fixed finite checks of the universal leave-placement argument.
    count=0
    if n<=11:
        old_cycle=[1,3,2,4]
        for e,f in combinations(sorted(edges),2):
            common=set(e)&set(f)
            if common:
                a=next(iter(common));b=next(x for x in e if x!=a);c=next(x for x in f if x!=a)
                d=next(x for x in range(n) if x not in (a,b,c));cycle=[b,a,c,d]
            else:cycle=[e[0],e[1],f[0],f[1]]
            mapping=dict(zip(old_cycle,cycle))
            mapping.update(zip([x for x in range(n) if x not in mapping],[x for x in range(n) if x not in cycle]))
            image=[tuple(sorted(mapping[v] for v in t)) for t in P]
            image_used=packing_ok(image,edges)
            assert not {e,f}&image_used
            count+=1
        family['verified_deleted_edge_pairs']=count
    # All specified triangles can lie inside a larger balanced cover part.
    for t in combinations(range(n),3):
        A=set(t)
        A.update(list(v for v in range(n) if v not in A)[:(n+1)//2-3])
        B=set(range(n))-A
        C={e for e in edges if set(e)<=A or set(e)<=B}
        assert es(t)<=C and len(C)==family['tau']
    if n==11:
        v=0;through=[t for t in P if v in t]
        M={tuple(x for x in t if x!=v) for t in through}
        assert len(M)==5 and len(set(x for e in M for x in e))==10
        H={e for e in edges if v not in e}-M
        rem=[t for t in P if v not in t]
        assert len(rem)==12 and H-packing_ok(rem,H)==leave
        pairs=sorted(M);A=set(x for e in pairs[:2] for x in e);B=set(range(n))-{v}-A
        C={e for e in H if set(e)<=A or set(e)<=B}
        ht=all_triangles(sorted(set(range(n))-{v}),H)
        assert len(C)==16 and all(es(t)&C for t in ht)
        Q=(set(range(n))-{v})-set(pairs[0])
        assert len(Q)==8 and all(set(e)&Q for e in H)
        extended=C|M|{ed(v,x) for x in Q}
        assert len(extended)==29 and all(es(t)&extended for t in combinations(range(n),3))
        family['residual']={'M':sorted(M),'H_edges':len(H),'H_triangles':len(ht),'nu_H':12,'tau_H':16,'sigma':8,'d':3,'g':0,'extension_cover_size':29}
    families.append(family)
    if level<2:n,P=double(n,P)

# All K5 certificate choices exercise S wholly outside U as well as mixed S.
edges=sorted(complete(5));idx={e:i for i,e in enumerate(edges)}
triangles=list(combinations(range(5),3));tm=[sum(1<<idx[e] for e in es(t)) for t in triangles]
packings=[]
for z in range(1<<len(triangles)):
    used=0;chosen=[];ok=True
    for i,t in enumerate(triangles):
        if z>>i&1:
            if used&tm[i]:ok=False;break
            used|=tm[i];chosen.append(t)
    if ok:packings.append(chosen)
assert len(packings)==26
cert_count=0;external_count=0
for U in range(1,1<<5):
    r=U.bit_count();q=5-r
    touching=[tm[i] for i,t in enumerate(triangles) if any(U>>v&1 for v in t)]
    for S in packings:
        compulsory=0;s=[0]*4
        for t in S:
            s[sum(bool(U>>v&1) for v in t)]+=1
            for e in es(t):
                if not any(U>>v&1 for v in e):compulsory|=1<<idx[e]
        for X in range(1<<len(edges)):
            if X&compulsory!=compulsory or not all(X&t for t in touching):continue
            d=sum(bool(X>>i&1) for i,e in enumerate(edges) if not any(U>>v&1 for v in e))
            ii=X.bit_count()-d;b=X.bit_count()-2*len(S)
            assert d>=3*s[0]+s[1]
            assert 2*(s[1]+s[2])<=r*q
            assert s[2]+3*s[3]<=r*(r-1)//2
            assert d+3*ii<=2*r*q+r*(r-1)+3*b
            a=max(sum(not(X>>idx[ed(u,w)]&1) for w in range(5) if not U>>w&1) for u in range(5) if U>>u&1)
            assert d>=a*(a-1)//2 and ii>=r*(q-a)
            assert 10*r<=13*r*r+r+6*b
            if b<=0:assert 10<=13*r+1
            cert_count+=1;external_count+=bool(s[0])

# Literal K5 split enumeration, including the trivial partition.
def partitions(items):
    if not items:yield [];return
    x,*rest=items
    for p in partitions(rest):
        yield [[x]]+[b[:] for b in p]
        for j in range(len(p)):
            q=[b[:] for b in p];q[j].append(x);yield q

def exact_params(vertices,edges):
    el=sorted(edges);ix={e:i for i,e in enumerate(el)}
    ts=all_triangles(vertices,edges);masks=[sum(1<<ix[e] for e in es(t)) for t in ts]
    nu=0
    for z in range(1<<len(masks)):
        used=0;ok=True
        for i,m in enumerate(masks):
            if z>>i&1:
                if used&m:ok=False;break
                used|=m
        if ok:nu=max(nu,z.bit_count())
    tau=min(c.bit_count() for c in range(1<<len(el)) if all(c&m for m in masks))
    return nu,tau,len(ts)
rows=[]
for parts in partitions([1,2,3,4]):
    split=complete(5)-{(0,u) for u in range(1,5)}
    split={e for e in split if 0 not in e}
    for j,part in enumerate(parts):split|={ed(5+j,u) for u in part}
    vertices=list(range(1,5))+list(range(5,5+len(parts)))
    lost=[(0,u,v) for u,v in combinations(range(1,5),2) if not any(u in p and v in p for p in parts)]
    lostm=[sum(1<<idx[e] for e in es(t)) for t in lost]
    h=min(x.bit_count() for x in range(1<<10) if all(x&t for t in lostm))
    nu,tau,nt=exact_params(vertices,split)
    shape=sorted(map(len,parts),reverse=True)
    if len(parts)>1:assert h>2*(2-nu)
    assert h==4-max(map(len,parts))
    rows.append({'parts':parts,'shape':shape,'nu':nu,'tau':tau,'h':h,'triangles':nt})
assert len(rows)==15
expected={(4,):(2,4,0),(3,1):(2,3,1),(2,2):(2,2,2),(2,1,1):(2,2,2),(1,1,1,1):(1,2,3)}
for row in rows:assert (row['nu'],row['tau'],row['h'])==expected[tuple(row['shape'])]
payload={'status':'PASS','host':platform.system(),'frozen_input_sha256':hashlib.sha256((W/'review/link_debt_fresh_inputs/packing_new_link_debt.md').read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'complete_family_controls':families,'K5_certificate_states':cert_count,'K5_states_with_external_S_triangle':external_count,'K5_split_partitions':rows}
(OUT/'results.json').write_text(json.dumps(payload,indent=2)+'\n')
print(json.dumps({'status':'PASS','constructed_orders':[r['n'] for r in families],'deletion_pairs_checked':sum(r.get('verified_deleted_edge_pairs',0) for r in families),'K5_certificate_states':cert_count,'with_external_S_triangle':external_count,'K5_partitions':len(rows)},indent=2))
