> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Session 02 — Researcher A: independent reconstruction and block-support falsification

Research stopped at approximately 15:45 UTC on 2026-10-27. This note contains no proof of global uniqueness and no additional fixed point. The only retained new output is a narrow falsification of a proposed block-support mechanism.

## Independence and initial hypotheses

Until the parent supplied the Session 01 history, I used only the equation and its conventions. I did not inspect repository research. Initial hypotheses were sent to the parent before 15:36 UTC.

Write k=d(n), s=S(n). For positive n the exact candidate conditions are

    10^(k-1) <= k^s < 10^k,     S(k^s)=s.

The interval of eligible real exponents has width 1/log10(k), hence at most one integer exponent for k>=10. Conversely, on the relevant decreasing branch, a fixed exponent gives a very short interval of bases. My initial message deliberately qualified this by “decreasing branch”; a blanket statement of at most two bases for every positive exponent and every k would be false: s=5 allows length bases k=2,3,4. The parent supplied the stronger existing precise result for s>=7.

I also independently normalized k=10^a b, 10 not dividing b. This gives the exact simultaneous system

    a*s + d(b^s) = 10^a*b,     S(b^s)=s.

For b=1 the second equation forces s=1 and the first then leaves only a=0. For general b, declaring that this system has only the known solutions is a restatement of the desired theorem, not an independent route. The parent identified this as the existing prior lemma L. Likewise, the modulo-9 necessity k^s=s mod 9 and the sparse length window were already established in Session 01. No novelty is claimed for them.

## A concrete hypothesis and why it would help

After history disclosure, I tested a possible repair to the already known base-B digit-sum bound for (B+1)^s. Let

    supp_B(N) = number of nonzero digits of N in base B.

For B=10^T every nonzero base-B digit contains at least one nonzero decimal digit. Consequently

    S_10(N) >= supp_B(N).

Thus the assertion

    supp_B((B+1)^s) >= s+1

would suffice to rule out equality S_10((B+1)^s)=s, whenever it held. This is a genuine implication, unlike transferring the numerical base-B digit sum directly to decimal digit sum. It seemed testable because, for B>=3 and 1<=s<=B, (B+1)^s has exactly s+1 base-B positions: (1+1/B)^s < e < B. The proposed support bound would require every one of these positions to be nonzero.

This stronger all-positions claim fails very early. Moreover, its weaker fallback supp_B>=s is also false for decimal-compatible block bases.

## Exact falsifications

1. B=10, s=5:

       11^5 = 161051.

   This has six positions but only five nonzero digits. It refutes supp_B>=s+1 under 1<=s<B.

2. B=10, s=10:

       11^10 = 25937424601.

   Its decimal length is exactly k=11, so this lies on the required length curve. Its support is 10=s, not s+1. Its decimal digit sum is 43. It fails the modulo-9 requirement for a solution, so it does not refute a hypothesis restricted to all prior necessary conditions.

3. B=100, s=41:

       101^41 = 15037523709241030837209772843975567916498076935616961198000922100147892117668204101.

   There are 42 base-100 positions, but positions 9 and 12, counted from zero at the least significant end, are zero. Therefore supp_100=40<41=s. The decimal digit sum is 347 and decimal length is 83. This is not a counterexample to the target equation.

   For an easily independently checked block certificate, its base-100 digits from most to least significant are:

       [1,50,37,52,37,9,24,10,30,83,72,9,77,28,43,97,55,67,91,64,98,7,69,35,61,69,61,19,80,0,92,21,0,14,78,92,11,76,68,20,41,1].

4. B=100, s=63 has 64 positions but only 61 nonzero blocks; zero indices are 14,25,46. This confirms that the support deficit can exceed one. It is supplementary, not needed for the rejection.

All these are exact integer calculations, using repeated divmod(N,B). A focused scan of B=10,100 and exponents 1<=s<B located no supp_B<s case for B=10 and the first such case s=41 for B=100. No minimality claim over other block bases is made. An initial scan over arbitrary integer B had also found B=11,s=8 with support 7, but the B=100 example is preferable because decimal block transfer is valid there.

The already known survivor (B,s)=(10000,2500) has all 2501 base-B positions nonzero. This single exact calculation does not justify a uniform assertion for T=4*10^j; the broad support mechanism has been falsified, while the restriction to that family remains unproved.

## Novelty comparison and conclusion

After initial hypothesis delivery and history disclosure, I searched the disclosed REDIRECT_RESEARCH_MEMO.md and LATE_CONCEPTUAL_REVIEW.md for block, support, polynomial, prime, valuation and carry discussions. Their existing discussion already addresses moving support, small prime factors of s, valuation scales and the failure of fixed-order exponential approximations. I found no independent way around those obstructions. I did not inspect external literature or use external sources in this session.

The parent also reported Researcher B's independent nondecimal block counterexample B=35,s=7. My decimal-compatible support<s example sharpens the falsification but is closely related work, not a separate proof strategy.

No promising new route survived. The first-principles reconstruction reproduced prior reductions. The new exact examples close a tempting block-support repair, but neither prove uniqueness nor rule out the explicit infinite necessary-condition family.
