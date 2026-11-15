#!/usr/bin/env python3
"""Literal fixed controls for exact local star-polytope obstruction. No producer imports."""
from itertools import combinations
from fractions import Fraction
from math import comb
from pathlib import Path
import json,hashlib,platform,sys
W=Path(__file__).resolve().parents[1]
OUT=W/'evidence/fresh_global_star_polytope';OUT.mkdir(parents=True,exist_ok=True)
def edges(t):return set(combinations(sorted(t),2))
def packing_edges(p):
    ee=[e for t in p for e in edges(t)]
    assert len(ee)==len(set(ee))
    return set(ee)
def double(n,p):
    # New labels: n is infinity; n+1+j is residue j in Z_n.
    q=list(p)
    for j in range(n):
        q.append(tuple(sorted((j,n,n+1+j))))
        for t in range(1,(n-1)//2+1):
            q.append(tuple(sorted((j,n+1+(j+t)%n,n+1+(j-t)%n))))
    return 2*n+1,q
n=5;p=[(0,1,2),(0,3,4)]
controls=[]
for target_k in (4,5):
    n,p=double(n,p)
    assert n in (11,23)
    E=set(combinations(range(n),2));T=list(combinations(range(n),3))
    used=packing_edges(p);leave=E-used
    assert leave=={(1,3),(1,4),(2,3),(2,4)}
    nu=(n*(n-1)-8)//6
    assert len(p)==nu and 3*nu==len(E)-4
    assert (len(E)-1)%3==0 and len(E)%3==1
    B=[v for v in range(n) if v not in {1,2,3,4}]
    fully_inside=[t for t in p if set(t)<=set(B)]
    assert fully_inside
    assert len(fully_inside)>=nu-2*(n-3)>0
    local=[]
    for s in range(1,target_k+1):
        S=set(range(s));N=n-s
        if s<3:
            choices=[(tuple(B[:s]),Fraction(1))]
        else:
            assert comb(s,3)<n-6
            candidate=[(u,sum(set(t)<=set(u) for t in p)) for u in combinations(B,s)]
            u0=next(u for u,r in candidate if r==0)
            u1,r1=next((u,r) for u,r in candidate if r>0)
            alpha=Fraction(comb(s,3),n-2)
            lam=alpha/r1
            assert 0<lam<1
            choices=[(u0,1-lam),(u1,lam)]
        witnesses=[];expected=[Fraction(0) for _ in range(4)]
        for u,weight in choices:
            rest=[v for v in range(n) if v not in u]
            image=list(range(s))+list(range(s,n))
            mapping=dict(zip(list(u)+rest,image))
            q=[tuple(sorted(mapping[v] for v in t)) for t in p]
            qe=packing_edges(q)
            assert len(q)==nu
            assert all(e in qe for e in E if set(e)&S)
            qlocal=[t for t in q if set(t)&S]
            counts=[sum(len(set(t)&S)==i for t in q) for i in range(4)]
            for i in range(4):expected[i]+=weight*counts[i]
            witnesses.append({'source_subset':u,'weight':str(weight),'full_maximum_packing':q,
                'local_restriction':qlocal,'triangle_type_counts':counts})
        marginals={}
        for i in range(1,4):
            if i<=s and 3-i<=N:
                den=comb(s,i)*comb(N,3-i)
                marginal=expected[i]/den
                assert marginal==Fraction(1,n-2)
                marginals[i]=str(marginal)
        local.append({'s':s,'S':sorted(S),'witnesses':witnesses,
                      'symmetrization_group':'Sym(S) times Sym(V minus S)',
                      'expected_triangle_type_counts':list(map(str,expected)),
                      'exact_orbit_marginals':marginals})
    # K11's literal two-deletion controls: all pairs are mapped into the leave.
    deletion_count=0
    if n==11:
        for e,f in combinations(sorted(E),2):
            union=set(e)|set(f)
            if len(union)==3:
                x=next(iter(set(e)&set(f)))
                y=next(iter(set(e)-{x}));z=next(iter(set(f)-{x}))
                w=next(v for v in range(n) if v not in union)
                # Source cycle 1-3-2-4-1; target x-y-w-z-x.
                m={1:x,3:y,2:w,4:z}
            else:
                x,y=e;w,z=f
                # Two opposite cycle edges are x-y and w-z.
                m={1:x,3:y,2:w,4:z}
            source_rest=[v for v in range(n) if v not in m]
            target_rest=[v for v in range(n) if v not in m.values()]
            m.update(zip(source_rest,target_rest))
            q=[tuple(sorted(m[v] for v in t)) for t in p]
            qu=packing_edges(q)
            assert len(q)==nu and e not in qu and f not in qu
            deletion_count+=1
        assert deletion_count==1485
        # Explicit TF certificate for every actual triangle; each is a balanced-cut complement.
        for t in T:
            side=set(t)
            for v in range(n):
                if len(side)==n//2:break
                side.add(v)
            assert len(side)==n//2 and set(t)<=side
            C={e for e in E if ((e[0] in side)==(e[1] in side))}
            assert len(C)==(n-1)**2//4 and edges(t)<=C
            assert all(edges(q)&C for q in T)
    rho=Fraction(len(E),3)
    assert rho==nu+Fraction(4,3) and rho.numerator//rho.denominator==nu+1
    # A zero-internal-triple orbit alone cannot supply the requested s=3 marginal.
    three=next(x for x in local if x['s']==3)
    assert three['witnesses'][0]['triangle_type_counts'][3]==0
    assert Fraction(three['exact_orbit_marginals'][3])>0
    controls.append({'n':n,'tested_k':target_k,'edges':sorted(E),'all_actual_triangles':T,
       'maximum_packing':p,'leave':sorted(leave),'nu_by_even_leave_argument':nu,
       'tau_by_balanced_cut':(n-1)**2//4,'rho_k':str(rho),'floor_rho_minus_nu':1,
       'nonleave_packed_triangles':fully_inside,'local_orbit_certificates':local,
       'verified_two_edge_deletions':deletion_count,
       'negative_control_zero_inside_orbit_alone_rejected':True})
record={'status':'PASS_FIXED_LOCAL_POLYTOPE_CERTIFICATES','host':platform.platform(),'python':sys.version,
        'controls':controls,'scope':'No global joint distribution asserted; the local convex-hull witnesses are separate for each S. No solver or Lean.'}
f=OUT/'literal_receipt.json';f.write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'status':record['status'],'controls':[{'n':c['n'],'k':c['tested_k'],'nu':c['nu_by_even_leave_argument'],'rho':c['rho_k']} for c in controls],
 'sha256':hashlib.sha256(f.read_bytes()).hexdigest()},sort_keys=True))
