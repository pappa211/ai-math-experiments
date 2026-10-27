> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent critic — second conceptual review

Session 01, 2026-10-27. Original authorized window: 08:45:56–14:45:56 UTC.
This is an informal mathematical review, not a Lean proof or a solution candidate.
No frozen files, toolchain pins, or other agents' proof files were modified.

## Question reviewed

Can the size relation between the base and exponent in n = k^s force S10(k^s) > s, where k is the decimal length and s is the digit sum? In particular, is there an accessible general inequality for 2 <= k, 1 <= s <= k, and 10 not dividing k? The k >= 2 qualification is necessary: k = s = 1 contradicts a strict version.

No proof or nontrivial counterexample to this broad inequality was found. The earlier exact check 2 <= k <= 500, 1 <= s <= k, 10 not dividing k found no violation, but cannot establish it.

The conditions matter: S10(2^9) = 8 < 9 and S10(2^10) = 7 < 10 violate versions without s <= k; S10(20^10) = 7 < 10 violates a version allowing factors of 10 even though 10 <= 20. A result for all s <= k would imply S10(2^(r*2^r)) >= 2^r by taking k = s = 2^r, a lower bound of order E/log E along E = r*2^r, far stronger than the general proven logarithmic digit-sum bounds. This is a calibration of difficulty, not a reduction proving that our target is equally hard.

## Rigorous normalization and uniqueness of a decimal-zero lift

Let n > 0 be a fixed point, k = d(n), s = S10(n), and uniquely write k = 10^t u with t >= 0, u >= 1, and 10 not dividing u. Appending decimal zeros gives

    S10(k^s) = S10(u^s),
    d(k^s) = ts + d(u^s).

Thus fixed points are exactly triples satisfying

    S10(u^s) = s,
    u*10^t = ts + d(u^s),

with n = (10^t u)^s. These are exact equivalences, with no probabilistic assumption.

**Uniqueness lemma.** For every fixed u >= 2 and s >= 1, there is at most one integer t >= 0 satisfying u*10^t = ts + D, where D = d(u^s). The digit-sum condition is not needed.

Proof. Suppose t1 and t2 = t1 + h are two such values, h >= 1, and put k1 = u*10^t1. Subtraction gives

    s*h = k1*(10^h - 1) >= 9*k1*h,

using 10^h >= 1 + 9h (by induction or Bernoulli). Hence s >= 9*k1. But the first equality gives D <= k1, whereas

    2^s <= u^s < 10^D < 16^D = 2^(4D),

since D >= 1. Therefore s < 4D <= 4k1, a contradiction. QED.

This does not make E(u) = {s >= 1 : S10(u^s) = s} finite or effectively known. It only says that each solution (u,s) can lift to at most one length k = 10^t u.

For u = 1, the digit-sum condition forces s = 1. Then 10^t = t + 1 has only t = 0 (10^t > t + 1 for t >= 1), recovering n = 1 and excluding every nontrivial power-of-ten length.

Two directly checked normalized examples are (u,s,D) = (2,5,2) and (2,70,22):

    2^5 = 32,
    2^70 = 1180591620717411303424,

whose digit sums are 5 and 70. A tiny check for s <= 100 and u in {2,3,4,5,6,7,8,9,11} found these two and no others; no completeness beyond those ranges is claimed. The first lifts at t = 0, yielding 32. The second does not lift: 2*10^t < 70t + 22 at t = 0,1, and 2*10^t > 70t + 22 at t = 2 and all later t. At t >= 2, the difference increases because its consecutive increment is 18*10^t - 70 > 0.

The principal researcher independently found the same exponent-70 warning and is handling its verification. A 2014 question discussing exponents 5 and 70 was located at https://math.stackexchange.com/questions/868683/find-all-positive-integers-n-such-that-sum-of-digits-of-2n-is-equal-to-n ; this is recorded as a discovery source only, not a theorem or a proof of completeness.

## A rigorous obstruction to standard polynomial counterexample constructions

**Proposition.** Fix s >= 1 and a nonmonomial polynomial P(T) in Z[T] with positive leading coefficient. Then

    S10(P(10^M)^s) > s

for every sufficiently large integer M.

This is an informal proof developed in this review. It excludes a common style of fixed-exponent sparse-power construction; it does not apply uniformly when P or s varies with M.

Proof. Put Q(T) = P(T)^s. First, Q has at least s+1 nonzero coefficients. Indeed, a nonmonomial polynomial over C has a nonzero root alpha. This root has multiplicity at least s in Q. A polynomial with m nonzero terms has no nonzero root of multiplicity m or greater: writing Q(T) = sum_i c_i T^(e_i), the equations obtained by applying (T d/dT)^j for j = 0,...,m-1 and evaluating at alpha give a Vandermonde system in c_i alpha^(e_i), with distinct e_i. It is invertible, a contradiction. Hence m >= s+1.

If every coefficient of Q is nonnegative, choose B = 10^M larger than every coefficient. The coefficients occupy disjoint M-digit blocks in Q(B), so S10(Q(B)) is the sum of their decimal digit sums and is at least the number of nonzero coefficients, hence at least s+1.

If Q has a negative coefficient, let r be its least index with a_r < 0, and write a_r = -q, q >= 1. For B larger than every absolute coefficient, lower-index coefficients are nonnegative and fit in their blocks. The r-th block of the nonnegative integer Q(B) is therefore B-q. Its decimal digit sum is

    S10(10^M - q) = 9M - S10(q-1),

which tends to infinity. All other blocks contribute nonnegative digit sums. Thus the total eventually exceeds the fixed s. Q(B) is positive for sufficiently large B because its leading coefficient is positive. QED.

The nonzero-term fact is also Proposition 3 of Moscariello's *Lacunary Polynomial Compositions*, arXiv:2104.11704v2: if a nonconstant polynomial with nonzero constant term has its d-th power represented by k nonzero terms, then d <= k-1. The proof above explains the elementary multiplicity mechanism and does not import any unproved Diophantine statement.

Important limitation: writing each individual integer k as a constant polynomial makes P monomial and evades the proposition; writing k in decimal produces coefficients evaluated at 10, not at arbitrarily large separated block sizes. Thus this proposition cannot be promoted to S10(k^s) > s for arbitrary k. Decimal carries are precisely the missing issue.

## Literature applicability

Primary sources examined on 2026-10-27:

1. A. Moscariello, *Lacunary Polynomial Compositions*, arXiv:2104.11704v2, Proposition 3 and appendix on sparse powers: https://arxiv.org/pdf/2104.11704 . The polynomial term-count bound is useful; its Diophantine applications do not provide the moving-base digit-sum inequality needed here.
2. A. Moscariello, *On sparse perfect powers*, arXiv:2101.10415v2; published Moscow Journal of Combinatorics and Number Theory 10 (2021), 261–270: https://arxiv.org/pdf/2101.10415 . It constructs infinitely many powers with a prescribed fixed number of nonzero digits, generally using squares. This does not give digit sum <= the power exponent: number of nonzero digits and digit sum differ, and the exponent is not the growing digit budget in A113010.
3. P. Corvaja and U. Zannier, *Finiteness of odd perfect powers with four nonzero binary digits*, Ann. Inst. Fourier 63 (2013), 715–731: https://doi.org/10.5802/aif.2774 . Its fixed-small-support hypotheses do not cover a digit budget growing with s.
4. Darsana N, Parvathi S Nair, Sudhansu Sekhar Rout, *Perfect powers with few digits and S-unit coefficients*, arXiv:2610.08310v1, submitted October 6, 2026: https://arxiv.org/abs/2610.08310 . Only the abstract and stated scope were inspected. Its advertised large-prime-exponent restriction concerns five nonzero digits in a fixed base; this does not yield a bound when the allowed number of nonzero digits grows with the exponent. No proof validation or acceptance of the preprint's claims is made here.

The normalization route retains hard power-digit questions even for u = 2. The polynomial proposition limits a promising-looking counterexample mechanism, but supplies no general obstruction or finite bound for the frozen problem. No new complete strategy has emerged from this bounded review.
