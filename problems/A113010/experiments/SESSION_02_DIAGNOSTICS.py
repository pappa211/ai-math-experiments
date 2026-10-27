"""Small exact falsification/identity checks. No A113010 range extension."""
import json

def digits(n, b=10):
    out=[]
    while n:
        out.append(n % b)
        n //= b
    return out

def remainder(coeff, T):
    r=[0]*T
    for j,c in enumerate(coeff):
        r[j % T] += c * (-1 if (j//T)%2 else 1)
    return r

out={}
lift_checks=0
for T in range(1,5):
    k=10**T+1
    for multiplier in range(1,1001):
        ds=digits(k*multiplier)
        if sum(ds)<=10:
            assert not any(remainder(ds,T))
            lift_checks+=1
out["low_weight_lifting_checks"]=lift_checks
out["sharp_witnesses"]=[]
for T in range(1,7):
    B=10**T
    N=(B+1)*(B+9)
    ds=digits(N)
    assert sum(ds)==11 and any(remainder(ds,T))
    out["sharp_witnesses"].append({"T":T,"N":str(N),"weight":sum(ds),"remainder":remainder(ds,T)})
out["weight_two_order_checks"]=[]
for T in range(1,4):
    k=10**T+1
    for s in range(1,4):
        modulus=k**s
        E=T*k**(s-1)
        assert pow(10,E,modulus)==modulus-1
        assert pow(10,2*E,modulus)==1
        out["weight_two_order_checks"].append({"T":T,"s":s,"E":E,"minus_one":True})
# These modular checks confirm the constructed exponent, not its minimality;
# minimality is proved separately with multiplicative order and LTE.
out["block_counterexamples"]=[]
for B,s in [(35,7),(100,41),(100,63)]:
    ds=digits((B+1)**s,B)
    out["block_counterexamples"].append({"B":B,"s":s,"positions":len(ds),"nonzero":sum(x!=0 for x in ds),"zero_positions":[i for i,x in enumerate(ds) if not x]})
assert out["block_counterexamples"][1]["nonzero"]<41
out["radix_five_example"]={"n":4**4,"digits_low_first":digits(4**4,5),"digit_sum":sum(digits(4**4,5))}
out["inverse_monotonicity_counterexample"]=[]
for exponent,base in [(52,106),(54,111)]:
    n=base**exponent
    d=digits(n)
    assert len(d)==base and n%9==exponent%9 and base%10
    out["inverse_monotonicity_counterexample"].append({"s":exponent,"k":base,"length":len(d),"digit_sum":sum(d),"excess":sum(d)-exponent})
assert out["inverse_monotonicity_counterexample"][0]["digit_sum"]==493
assert out["inverse_monotonicity_counterexample"][1]["digit_sum"]==486
print(json.dumps(out,indent=2))
