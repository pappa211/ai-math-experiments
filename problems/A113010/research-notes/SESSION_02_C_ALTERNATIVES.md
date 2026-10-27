> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Session 02 — C: alternative formulations and descent audit

2026-10-27, bounded pass 15:33–15:44 UTC. Research stopped at delivery. No proof of the global classification and no new fixed point was found. **Surviving global routes: zero.** The useful output is a small set of exact diagnostics against proposed descent and monotonicity mechanisms. No Lean files, production searches, or persistent processes were started.

Write S for decimal digit sum and d for positive decimal digit length. The target is n=k^s with d(n)=k and S(n)=s. Session 01's finite bounds and normalization were taken as established context.

## 1. Monotonicity fails even after all elementary survivor conditions

**Exact bounded counterexample.** Both pairs

- (s,k)=(52,106), with d(106^52)=106 and S(106^52)=493;
- (s,k)=(54,111), with d(111^54)=111 and S(111^54)=486,

satisfy k^s≡s (mod 9), and neither base is divisible by ten. Nevertheless the actual digit sum decreases as the exponent and the length-compatible base increase. The excess S(k^s)−s also decreases, from 441 to 432. Thus an induction that only needs increasing digit sum or increasing excess on the surviving inverse length curve already fails at these small pairs.

The modulo-nine checks follow directly from 493−52=441 and 486−54=432. Exact integer powering and decimal conversion verified the displayed lengths and sums; this is ordinary computation, not a Lean certificate. A much smaller counterexample to unrestricted inverse-curve monotonicity is (s,k)=(13,16) and (14,18), with respective sums 79 and 72, but those do not both pass the modulo-nine filter.

**Novelty and scope:** the prior notes expressly left monotonicity unassumed; these are explicit falsifying examples after its principal filters. This rules out the stated monotone induction, not a different invariant or a lower envelope that need not be monotone. No asymptotic conclusion follows.

**Smallest test used:** exact evaluation of the four displayed powers suffices to verify the claims. A tiny discovery loop over s≤100 found the stronger pair; no minimality is asserted.

## 2. Why the two natural minimal-counterexample descents do not close

**Power-root operation.** If q divides s, taking a q-th root of n=k^s produces m=k^(s/q). Its decimal length is

    d(m)=floor(s log10(k)/q)+1,

which is approximately k/q, rather than k. There is also no identity S(m)=s/q. The actual fixed point 32=2^5 already falsifies unconditional preservation: taking the fifth root gives 2, whose length is 1 and sum is 2, so d(2)^S(2)=1≠2.

**Trailing-zero operation.** Write k=10^t u. Removing the trailing zeros from n preserves precisely

    S(u^s)=s,

but changes its length to d(u^s)=k−ts. It produces another fixed point only if k−ts=u, an additional condition. This is exactly the condition a descent proof must establish, rather than an automatic consequence of taking out powers of ten.

For comparison, all N_t=32·10^(5t)=(2·10^t)^5 have digit sum 5 and satisfy the exponent/digit-sum equation. Their lengths are 5t+2; a full fixed point requires 5t+2=2·10^t. Equality holds at t=0 and fails for every t≥1: the difference is positive at t=1 and its successive increment is 18·10^t−5>0. This gives an explicit infinite family showing why the digital equation alone cannot be lifted freely to the length equation.

**Status:** these are exact preservation failures, not proofs that every conceivable descent is impossible. They supply necessary checks for any future descent: exhibit an operation preserving both equations and a strictly decreasing well-founded measure. No such operation was found. The normalization formula itself is prior work, not claimed as a new reduction.

## 3. A sparse-relation formulation exposes the genuinely missing estimate

If n=k^s has S(n)=s, split each nonzero digit into units. Then

    k^s=10^a1+...+10^as,
    0≤ai≤k−1,   max ai=k−1,

with each position repeated at most nine times. Thus its digit polynomial P has nonnegative coefficients at most nine, degree k−1, P(1)=s, and P(10)=k^s.

A tempting mechanism is a positive-weight or coding bound for the relation P(10)≡0 modulo k^s. Unlike a fixed-modulus sieve, that modulus contains the entire perfect-power information. The target estimate would have to exclude a weight-s relation of degree k−1 at modulus k^s, in the range k≈s log10 k.

**Necessary versus sufficient:** every fixed point supplies this relation. Excluding all such relations is sufficient and stronger than excluding the target power itself, because a nonzero multiple c·k^s in the k-digit interval can also give a relation. Recovering the exact multiple c=1 is an additional requirement if the method only studies congruences.

**Assessment:** this is an exact algebraic encoding, but not a surviving research route. No distance, valuation, or positivity bound of the needed strength was obtained. The dimensionality and modulus grow together. Counting sparse words gives a heuristic about rarity, but does not prove that a specified arithmetic progression contains none. Ordinary pigeonhole arguments give no exclusion. This section is deliberately not presented as progress by renaming a digit inequality.

## 4. Perfect-power degree does not remove the digital difficulty

Let E(n) be the gcd of the prime-factor exponents of n>1, and write n=a^E with primitive a (not a proper power). Every fixed point necessarily has S(n) dividing E(n), and then

    d(n)=a^(E(n)/S(n)).

Conversely these two conditions imply the fixed-point equation. This formulation separates an arithmetic divisibility test from the length test, but its apparent descent through E(n) is not justified: a divisor of E(n) need not remain the digit sum of the corresponding root.

The family N_t above has E(N_t)=5 for every t, because its prime exponents are 5(t+1) and 5t, with gcd 5. Hence S(N_t)=E(N_t) holds at arbitrarily large lengths while all t≥1 fail the length equation. Even equality between digit weight and maximal perfect-power exponent provides no cutoff by itself.

**Novelty and scope:** the E(n) wording is an alternative exact test, not a new sufficient estimate. It is not easier to control uniformly, and no attempt to disguise it as a new inequality is retained.

## Sources and limits

The exact arguments and counterexamples above are self-contained. The local Session 01 notes consulted were APPROACHES.md, REDIRECT_RESEARCH_MEMO.md, and LATE_CONCEPTUAL_REVIEW.md. Several brief literature searches returned general fixed-base digit-sum and digit-sum-map material; no external theorem from those results is invoked here. No claim of exhaustive literature coverage is made.

**Recommendation:** retain the filtered monotonicity counterexample and the preservation checklist. Do not promote any of these encodings to a new global route without a genuinely new estimate or a descent map preserving both equations.
