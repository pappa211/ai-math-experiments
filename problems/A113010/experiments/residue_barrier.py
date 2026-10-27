#!/usr/bin/env python3
"""Exact constructive witnesses for the residue barrier, not fixed points."""
import hashlib, json, math, random, sys
sys.set_int_max_str_digits(0)
def ds(x): return sum(map(int,str(x)))
def construct(M,s,k,A=1):
    assert M>0 and A>0
    d=len(str(M)); ell=len(str(A)); P=ds(A)
    assert s>=P+90*d and k>=s+ell
    # r is supplied separately so this constructor is reusable for all residues.
    def residue(r):
        g=math.gcd(M,9); assert (r-s)%g==0
        R=(r-A*pow(10,k-ell,M))%M
        D=s-P-ds(R); w=ds(M); q=9//g
        a=next(a for a in range(q) if (D-a*w)%9==0)
        h=(D-a*w)//9; assert h>=d
        B=M*(10**h-1); assert ds(B)==9*h and B<10**(h+d)
        lower=R; width=d
        for _ in range(a):
            lower=M*10**width+lower; width+=d
        lower=B*10**width+lower; width+=h+d
        assert width<=k-ell
        N=A*10**(k-ell)+lower
        digits=str(N)
        assert len(digits)==k and ds(N)==s and N%M==r%M
        assert digits.startswith(str(A))
        return N,dict(M=str(M),s=s,k=k,prefix=A,residue=str(r%M),R=str(R),a=a,h=h,
            lower_width=width,sha256=hashlib.sha256(digits.encode()).hexdigest())
    return residue

def main():
    rng=random.Random(113010)
    trials=0
    for M in range(1,201):
        for _ in range(5):
            A=rng.randrange(1,1000); s=ds(A)+90*len(str(M))+rng.randrange(30)
            k=s+len(str(A))+rng.randrange(20); g=math.gcd(M,9)
            r=(s%g)+g*rng.randrange(max(1,M//g))
            construct(M,s,k,A)(r); trials+=1
    k=10001;s=2500;actual=k**s;prefix=int(str(actual)[:3]);M=9*10**10*1000000007
    N,example=construct(M,s,k,prefix)(pow(k,s,M))
    example.update(actual_power_digit_sum=ds(actual),distinct_from_power=(N!=actual),
        matched_suffix_digits=10,matched_additional_modulus=1000000007)
    out=dict(status='all exact arithmetic checks passed',randomized_cases=trials,
        seed=113010,example=example,scope='Constructed N is not asserted equal to k**s.')
    print(json.dumps(out,indent=2))
if __name__=='__main__': main()
