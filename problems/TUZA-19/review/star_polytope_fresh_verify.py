"""Independent fixed-control verification of the stated orbit-mixture proof.
No producer code, optimization, graph census, or global joint measure is used.
"""
from fractions import Fraction
from itertools import combinations
from math import comb
from pathlib import Path
import json
import platform

assert platform.system() == 'Darwin'

def edges(t):
    return set(combinations(sorted(t), 2))

def validate(n, packing):
    used = set()
    for t in packing:
        assert len(set(t)) == 3 and set(t) <= set(range(n))
        e = edges(t)
        assert not (used & e)
        used |= e
    leave = set(combinations(range(n), 2)) - used
    assert leave == {(1,3),(1,4),(2,3),(2,4)}
    assert len(packing) == (comb(n,2)-4)//3
    return used, leave

def doubled(n, packing):
    result = list(packing)
    for j in range(n):
        result.append(tuple(sorted((j, n, n+1+j))))
        for t in range(1, (n-1)//2+1):
            result.append(tuple(sorted((j, n+1+(j+t)%n, n+1+(j-t)%n))))
    return 2*n+1, result

def relabel(n, packing, subset, size):
    subset = sorted(subset)
    source = subset + sorted(set(range(n))-set(subset))
    mapping = dict(zip(source, range(n)))
    result = [tuple(sorted(mapping[v] for v in t)) for t in packing]
    used = set()
    for t in result:
        assert not (used & edges(t))
        used |= edges(t)
    assert all((u,v) in used for u,v in combinations(range(n),2) if u<size or v<size)
    return result

def counts(packing, size):
    return [sum(sum(v<size for v in t)==i for t in packing) for i in range(4)]

records=[]
n, packing = 5, [(0,1,2),(0,3,4)]
validate(n,packing)
for target, maximum_s in [(11,4),(23,5)]:
    n, packing = doubled(n,packing)
    assert n == target
    _, leave = validate(n,packing)
    B = sorted(set(range(n)) - set().union(*(set(e) for e in leave)))
    internal = [set(t) for t in packing if set(t) <= set(B)]
    assert internal
    for s in range(1, maximum_s+1):
        if s<3:
            U0=set(B[:s]); U1=U0; lam=Fraction(0)
        else:
            U0=next(set(u) for u in combinations(B,s) if not any(t<=set(u) for t in internal))
            U1=set(internal[0])
            for v in B:
                if len(U1)==s: break
                U1.add(v)
            r1=sum(t<=U1 for t in internal)
            assert r1>=1
            lam=Fraction(comb(s,3),(n-2)*r1)
            assert 0<lam<1
        P0=relabel(n,packing,U0,s)
        P1=relabel(n,packing,U1,s)
        c0,c1=counts(P0,s),counts(P1,s)
        marginals={}
        for i in range(4):
            orbit=comb(s,i)*comb(n-s,3-i) if i<=s and 3-i<=n-s else 0
            if orbit:
                marginal=((1-lam)*c0[i]+lam*c1[i])/orbit
                marginals[str(i)]=str(marginal)
                if i>=1: assert marginal==Fraction(1,n-2)
                else: assert marginal==Fraction(1,n-2)-Fraction(4,3*orbit)
        assert sum((1-lam)*a+lam*b for a,b in zip(c0,c1))==len(packing)
        records.append({'n':n,'s':s,'U0':sorted(U0),'U1':sorted(U1),
                        'lambda':str(lam),'P0':P0,'P1':P1,
                        'type_counts_0':c0,'type_counts_1':c1,
                        'orbit_marginals':marginals,
                        'zero_internal_unmixed_fails': s>=3 and c0[3]==0})
out=Path('evidence/star_polytope_fresh')
out.mkdir(exist_ok=True)
(out/'local_certificates.json').write_text(json.dumps({'host':platform.system(),'records':records},indent=2)+'\n')
print(json.dumps({'controls':[11,23],'local_orbit_cases':len(records),'status':'PASS','scope':'Literal doubling packings and rational orbit counts, not a joint-moment consistency check'}))
