"""Exact bounded search for A113010 fixed points (experimental evidence only).

Float log10 supplies only an initial exponent guess. Integer comparisons correct
both endpoints. Every retained power and digit sum is calculated exactly.
No finite run proves the all-natural-number target.
"""
import argparse, json, math, sys, time
from pathlib import Path
sys.set_int_max_str_digits(0)

def candidates(k):
    if k < 2:
        raise ValueError("Use k >= 2; n=1 is handled separately")
    lower = 10 ** (k - 1)
    upper = lower * 10
    s = max(1, int((k - 1) / math.log10(k)))
    n = k ** s
    while n < lower:
        n *= k
        s += 1
    while s > 0 and n // k >= lower:
        n //= k
        s -= 1
    while n < upper:
        assert lower <= n < upper
        yield s, n
        n *= k
        s += 1

def run(limit):
    begin = time.monotonic()
    hits = [{"k": 1, "s": 1, "n": "1"}]
    count = mod9_count = 0
    low_sum = []
    closest = []
    for k in range(2, limit + 1):
        ks = list(candidates(k))
        if k >= 10:
            assert len(ks) <= 1
        for s, n in ks:
            count += 1
            if pow(k, s, 9) == s % 9:
                mod9_count += 1
            digits = str(n)
            assert len(digits) == k
            ds = sum(map(int, digits))
            if ds == s:
                hits.append({"k": k, "s": s, "n": digits})
            if ds <= s:
                low_sum.append({"k": k, "s": s, "digit_sum": ds, "mod9": pow(k,s,9)==s%9})
            closest.append((ds/s, k, s, ds))
        if k % 1000 == 0:
            print(json.dumps({"progress_k": k, "elapsed_seconds": round(time.monotonic()-begin,3)}), flush=True)
    closest.sort()
    return {"max_digits":limit,"power_candidates":count,"mod9_survivors":mod9_count,
            "fixed_points":hits,"digit_sum_at_most_exponent":low_sum,
            "twenty_smallest_digit_sum_ratios":closest[:20],
            "elapsed_seconds":time.monotonic()-begin,
            "evidence_level":"exact integer computation, not Lean formal proof"}

if __name__ == "__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--max-digits",type=int,default=1000)
    p.add_argument("--output",type=Path)
    a=p.parse_args()
    result=run(a.max_digits)
    out=json.dumps(result,indent=2)+"\n"
    if a.output: a.output.write_text(out)
    print(out)
