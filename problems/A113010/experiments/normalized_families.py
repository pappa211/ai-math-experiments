"""Rigorous rational-log screening of k=u*10^t (computational, not Lean).

For log(a/b), a>=b>0 and a/b<=2, use the atanh expansion with
z=(a-b)/(a+b): log(a/b)=2 sum z^(2j+1)/(2j+1). Each term is rounded
DOWN on an integer grid. The positive tail after N terms is at most
2*z^(2N+1)/((2N+1)*(1-z^2)). Upper endpoints add one grid unit
per rounded term plus one unit bounding the tail. All arithmetic is integer
or Fraction; no floating-point logs enter an exclusion.
"""
from fractions import Fraction
from pathlib import Path
import argparse, json, sys, time
sys.set_int_max_str_digits(0)

def log_ratio_bounds(a,b,scale):
    assert b>0 and b<=a<=2*b
    if a==b: return (0,0,0)
    p,q=a-b,a+b
    p2,q2=p*p,q*q
    pn,qn=p,q
    total=0
    j=0
    while True:
        total += (2*pn*scale)//(qn*(2*j+1))
        j += 1
        pn *= p2; qn *= q2
        # Remaining series <= 2*z^(2j+1)/((2j+1)*(1-z^2)).
        if 2*pn*q2*scale < qn*(2*j+1)*(q2-p2):
            return total,total+j+1,j

def log_bounds(n,scale,ln2):
    assert n>=1
    m=n.bit_length()-1
    l,h,count=log_ratio_bounds(n,2**m,scale)
    return m*ln2[0]+l,m*ln2[1]+h,count

def ceil_fraction(x):
    return -((-x.numerator)//x.denominator)

def screen(u,max_t,precision,exact_exp_limit):
    assert u>=2 and u%10!=0
    scale=10**precision
    l2=log_ratio_bounds(2,1,scale)
    l10=log_bounds(10,scale,l2)
    lu=log_bounds(u,scale,l2)
    alpha_lo=Fraction(lu[0],l10[1])
    alpha_hi=Fraction(lu[1],l10[0])
    counts={"empty_exponent_interval":0,"mod9_excluded":0,"exact_checked":0,"unresolved":0}
    survivors=[]; fixed=[]
    for t in range(max_t+1):
        k=u*10**t
        # Lower length bound gives s >= (k-1)/log10(k).
        # Upper length bound gives s < k/log10(k).
        lo=ceil_fraction(Fraction(k-1,1)/(t+alpha_hi))
        hi=ceil_fraction(Fraction(k,1)/(t+alpha_lo))-1
        if hi<lo:
            counts["empty_exponent_interval"]+=1; continue
        if hi-lo>3:
            raise ValueError("Insufficient interval precision")
        cand=[s for s in range(max(1,lo),hi+1) if pow(k,s,9)==s%9]
        if not cand:
            counts["mod9_excluded"]+=1; continue
        unknown=[]
        for s in cand:
            if s<=exact_exp_limit:
                core=u**s
                digits=str(core)
                if t*s+len(digits)==k and sum(map(int,digits))==s:
                    fixed.append({"u":u,"t":t,"s":s,"k":k,"core":digits})
            else:
                unknown.append(s)
        if unknown:
            counts["unresolved"]+=1
            survivors.append({"u":u,"t":t,"k":str(k),"candidate_exponents":[str(s) for s in unknown]})
        else:
            counts["exact_checked"]+=1
    return {"u":u,"max_t":max_t,"precision":precision,"counts":counts,
            "fixed_points":fixed,"unresolved_length_and_mod9_survivors":survivors,
            "log_grid_certificates":{"scale_digits":precision,"ln2_bounds":l2[:2],"ln10_bounds":l10[:2],"lnu_bounds":lu[:2]}}

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--bases",type=int,nargs="+",default=[2,3,4,5,6,7,8,9])
    p.add_argument("--max-t",type=int,default=100)
    p.add_argument("--exact-exponent-limit",type=int,default=200000)
    p.add_argument("--output",type=Path)
    a=p.parse_args(); begin=time.monotonic()
    result={"evidence_level":"integer/rational computation, not a Lean proof",
            "families":[screen(u,a.max_t,a.max_t+40,a.exact_exponent_limit) for u in a.bases]}
    result["elapsed_seconds"]=time.monotonic()-begin
    out=json.dumps(result,indent=2)+"\n"
    if a.output: a.output.write_text(out)
    print(json.dumps({"families":[{k:v for k,v in f.items() if k!="log_grid_certificates"} for f in result["families"]],"elapsed_seconds":result["elapsed_seconds"]},indent=2))
