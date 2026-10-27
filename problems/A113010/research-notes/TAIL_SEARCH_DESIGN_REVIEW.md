> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Tail-search design review

2026-10-27, Session01. Independent mathematical/design review only; no implementation, heavy computation, benchmark or Lean build performed. The original14:45:56UTC checkpoint remains binding.

## Verdict and interval proof

The proposed finite-search design is sound provided integer inputs are represented exactly (or separately enclosed), all indicated MPFR operations use the stated directed rounding, and no unresolved suffix case is counted as excluded.

Let alpha=log10(k)>0, L=(k-1)/alpha and U=k/alpha. The exact length condition is L<=s<U. Given loglo<=alpha<=loghi with loglo>0,

    Llo=RNDD((k-1)/loghi) <= L,
    Uhi=RNDU(k/loglo) >= U.

Hence every true candidate integer belongs to

    ceil(Llo) <= s <= ceil(Uhi)-1.

The minus one is correct even when Uhi is an integer, because the upper condition is strict. An empty resulting integer interval safely excludes that k. The true interval has width1/log10(k)<1 for k>=1001, but rounding can introduce additional integers; enumerate all of them rather than assuming the outer interval contains at most one.

Use mpfr_log10 directly with RNDD/RNDU. A nearest-rounded logarithm with an informal tolerance would not establish this argument. At128-bit precision every unsigned64-bit k and k-1 is exact; explicitly bound the implementation's integer range. For arbitrary larger k, setting the input at128 bits with nearest rounding is not automatically safe: increase precision enough to represent it, or carry outward input bounds into the logarithms and numerators. Perform ceilings by exact integer conversion, for example mpfr_get_z with RNDU, and subtract one in the integer domain; avoid a double conversion. Reject NaN, infinity, nonpositive loglo or integer overflow rather than treating them as an empty candidate interval.

MPFR documents directed rounding, correctly rounded logarithms and integer conversion in its official manual: https://www.mpfr.org/mpfr-current/mpfr.html#Rounding , https://www.mpfr.org/mpfr-current/mpfr.html#Transcendental-Functions , https://www.mpfr.org/mpfr-current/mpfr.html#Conversion-Functions . The proof above uses those guarantees, not an assumption that128 bits resolves every near-integer boundary.

Useful endpoint checks for an interval helper are k=10^9, whose lower endpoint111111111 is included, and k=10000, whose integer upper endpoint2500 is excluded. Pure powers of ten are separately eliminated by the proved theorem, but these remain useful arithmetic boundary checks.

## Exact modular and suffix filters

The congruence k^s==s mod9 is necessary. Strip complete factors of10, k=10^t*u with10 not dividing u; then k==u mod9 and S(k^s)=S(u^s). The u=1 case is covered by the existing pure-ten-power result, including the separately handled n=1 case outside this k-range.

For any m>=1, let X=u^s and R=X mod10^m. Writing X=Q*10^m+R gives

    S(X)=S(Q)+S(R)>=S(R).

Therefore S(R)>s is an exact exclusion, even when the exponent was only an outer-interval candidate. The choice m=ceil(s/4)+32 affects speed only; it is not a theorem that the suffix will cross s. Compute this ceiling using integer arithmetic with overflow-safe bounds.

If a suffix fails to exclude, enlarge m or compute the full core. Suffix digit sums are nondecreasing as m grows. Replace the old total with the new suffix total, or add only a disjoint newly exposed block; adding two nested whole-suffix sums double-counts digits. Early exit while counting digits is safe once the partial sum exceeds s.

A residue with fewer than m canonical digits does NOT establish that it equals the full core: a true m-digit suffix may begin with zeros. Likewise S(R)=s does not establish a full equality. If it is separately certified that X>=10^m, then Q>0 and S(R)>=s already excludes; the stricter proposed >s test is always safe without that extra certificate.

## Full checks and completeness requirements

For every case not eliminated by an exact filter, obtain the full core X=u^s or a separately verified equivalent certificate. Before reporting a fixed point, check both

    S(X)=s,
    d(X)+t*s=k.

These checks are exactly equivalent to the full digit sum and k-digit inequalities for n=X*10^(t*s); appending the zeros explicitly is unnecessary. Check t*s and all conversions for overflow. If k-t*s<=0, the length condition is impossible because X is positive.

When converting the full core for its digit sum, the actual decimal-string length gives d(X). GMP mpz_sizeinbase(X,10) alone is insufficient as an exact digit length: it may be one too large. Alternatively compare X exactly with10^(k-t*s-1) and10^(k-t*s), after verifying k-t*s>=1. The GMP guarantee is documented at https://gmplib.org/manual/Miscellaneous-Integer-Functions .

Full digit sum different from s excludes the pair; a suffix sum below s does not. A failure of exact length excludes an over-enumerated pair even if its full digit sum happens to equal s. Successful numerical checks identify a candidate for the frozen target, not a completed Lean proof.

A finite-range no-hit claim requires a completed record covering every k in the declared inclusive range and every outer-interval exponent, with each pair exactly excluded or fully checked. Timeouts, memory failures and unevaluated fallbacks remain unresolved; record the last completed k and pending pairs. Benchmark runtime before selecting the final range and retain the original session checkpoint. The method plausibly saves work by examining short suffixes, but its throughput and fallback rate require measurement; neither follows from the soundness proof.
