> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent critic — diagonal inequality review

Session 01, 2026-10-27, within the original 08:45:56–14:45:56 UTC authorization.
Evidence: informal proofs and primary-source applicability checks. No Lean build, new brute-force range, large power expansion, proof of the frozen target, or novelty claim is made.

## Status of the proposed inequality

Write S for decimal digit sum. The proposed statement is

    H: for every k >= s >= 1 with k >= 2 and 10 not dividing k,
       S(k^s) > s.

This bounded review found neither a proof nor a counterexample to H. That describes the outcome of this review, not a verified claim about the entire literature. The earlier finite check through k=500 remains only a finite observation.

The restrictions are real: S(2^9)=8<9, S(2^10)=7<10, and S(20^10)=7<10. The first two violate k>=s; the third violates 10 not dividing k. None refutes H.

The main new deduction is a stronger obstruction to standard sparse-power constructions: fixed rational, and even fixed real, polynomial families cannot give an eventual counterexample at a fixed exponent. The proof below extends the integral-polynomial argument in CRITIC_SECOND_REVIEW.md. It does not resolve H for changing polynomials or changing exponents.

## A bounded-digit-sum polynomial lemma

**Lemma.** Let Q be a fixed nonzero polynomial in R[T], and let C be a nonnegative integer. Suppose there are infinitely many nonnegative integers M for which Q(10^M) is a nonnegative integer and

    S(Q(10^M)) <= C.

Then Q has at most C nonzero coefficients. In fact all its nonzero coefficients are positive terminating decimal rationals, with a total decimal unit-digit budget at most C, when fractional decimal positions are allowed.

Here a terminating decimal rational is a finite sum of nonnegative integer multiples of 10^j with j an arbitrary integer. The term-count conclusion alone is used below.

**Proof.** Any infinite set of such M is unbounded. Q is eventually positive on this set, so its leading coefficient a is positive. Put d=deg Q. Passing to an infinite subsequence, the digit sum has a constant value t with 1<=t<=C. Split each decimal digit into unit contributions and sort their positions:

    Q(10^M) = sum_{i=1}^t 10^(e_i(M)),
    e_1(M) >= ... >= e_t(M) >= 0.

Every normalized offset e_i(M)-dM is bounded above, because each term is at most Q(10^M), and Q(10^M)/10^(dM) tends to a. An integer sequence bounded above has a subsequence on which it is constant or tends to minus infinity: either some value occurs infinitely often, or a subsequence can be chosen below each successive negative threshold. Apply this observation successively to the finitely many offsets.

On the resulting common infinite subsequence, let I be the indices with constant offsets z_i. Division by 10^(dM) and passage to the limit gives

    a = sum_{i in I} 10^z_i.

In particular I is nonempty. After discarding finitely many entries, its offsets are exactly constant. Therefore, on the whole remaining subsequence,

    (Q(T)-a*T^d)(10^M) = sum_{i not in I} 10^(e_i(M)).

The right side is a nonnegative integer and has digit sum at most t-|I|. If the residual polynomial is nonzero, apply the same argument to it, whose degree is smaller. Induction on the degree gives at most t-|I| nonzero residual coefficients; including a gives at most 1+t-|I|<=t<=C coefficients. If the residual polynomial is zero, the conclusion is immediate. The same induction represents each nonzero coefficient by a nonempty group of the original t unit contributions, proving the additional coefficient claim. This is an elementary subsequence argument; it assumes no digit-distribution conjecture. QED.

The lemma is a necessary condition for infinitely many bounded-digit-sum values. It is not a uniform numerical bound for arbitrary coefficients, degree, or C.

## Consequence for rational polynomial sparse-power constructions

**Proposition.** Fix an integer s>=1 and a real polynomial P having at least two nonzero coefficients and positive leading coefficient. For all sufficiently large integers M for which P(10^M) is a positive integer,

    S(P(10^M)^s) > s.

If there are only finitely many such M, the assertion is vacuous past their maximum. Otherwise assume it fails infinitely often and apply the preceding lemma to Q=P^s with C=s.

A nonmonomial P has a nonzero complex root alpha. Its multiplicity in Q is at least s. If Q had m<=s nonzero terms, write

    Q(T)=sum_{i=1}^m c_i*T^f_i,

with distinct nonnegative exponents f_i and c_i nonzero. Let D=T*d/dT. Since the multiplicity at alpha is at least m,

    0 = (D^j Q)(alpha) = sum_{i=1}^m f_i^j*c_i*alpha^f_i,
    j=0,...,m-1.

The Vandermonde matrix on the distinct f_i is invertible, forcing every c_i*alpha^f_i to vanish, a contradiction. Thus Q has at least s+1 nonzero coefficients, contradicting the bounded-digit-sum lemma. QED.

The multiplicity argument is also the mechanism behind Proposition 3 of A. Moscariello, *Lacunary Polynomial Compositions*, arXiv:2104.11704v2, https://arxiv.org/pdf/2104.11704 . The new step in this review is the explicit bounded-digit-sum subsequence argument allowing rational or real coefficients; no claim of originality is made.

This proposition covers fixed rational denominators and integrality only on an infinite subsequence of M. It therefore closes a gap left by the earlier integral-polynomial block argument. It still does not cover families with s=s(M), a different P at each M, arbitrary integer k, or even all specializations P(10) with varying P. Monomials are excluded deliberately: a fixed constant base is a monomial family, and decimal-zero factors may preserve digit sum.

## Two primary sparse-construction results do not supply a counterexample

Hare–Laishram–Stoll, *Stolarsky's conjecture and the sum of digits of polynomial values*, Theorem 1.3, proves that for each fixed integer polynomial p of degree at least two and positive leading coefficient, and each fixed base q>=2, the liminf of S_q(p(n))/S_q(n) is zero. This is a ratio to the digit sum of the root, not to the exponent. Their proof uses

    t_m(T)=m*T^4+m*T^3-T^2+m*T+m,  m>=3.

Lemma 3.1 gives 4h+1 positive coefficients in t_m(T)^h for each fixed h>=2. For q=10 and sufficiently separated blocks, the output digit sum is therefore at least 4h+1>h, even while the ratio to the root's digit sum tends to zero. Thus this explicit construction does not refute H. Primary text, Theorem 1.3 and Lemma 3.1: https://arxiv.org/pdf/1001.4169 .

Moscariello, *On sparse perfect powers*, Theorem 10, gives infinitely many perfect squares not divisible by a fixed base x with any prescribed number b>=3 of nonzero digits, except (x,b)=(2,4),(3,4). With x=10 these are squares having digit sum at least b>=3>2. The exponent guaranteed by the theorem is two; it does not guarantee an additional higher-power representation whose exponent is at least the digit sum. Sparsity by number of nonzero digits also differs from small digit sum. This result therefore supplies no counterexample to H. Primary text: https://arxiv.org/pdf/2101.10415 .

These applicability checks do not assert that every possible sparse-power construction is covered. They identify why two natural sources, including the ratio-to-root-digit-sum theorem, cannot be used as counterexamples by themselves.

## H versus the actual digit-length curve

A genuinely narrower sufficient inequality would be

    H_L: if k>=10, 10 not dividing k, s>=1, and
         10^(k-1) <= k^s < 10^k,
         then S(k^s)>s.

The weaker conclusion S(k^s)!=s would already exclude fixed points in this range. Strict H_L is stronger than that necessary non-equality: an instance with S(k^s)<s would refute H_L without producing a fixed point.

The upper length inequality gives

    s < k/log10(k) <= k,

so H implies H_L. H_L has no instances k=s>=10, because k^k>=10^k. Hence it avoids the specific diagonal implication of H obtained by choosing k=s=2^r:

    H implies S(2^(r*2^r))>2^r,  r>=1.

Writing E=r*2^r, this is a lower bound of order E/log E on an explicit sequence. Radcliffe's elementary theorem gives only S(2^E)>log_4 E for every E; it is far below this consequence. This comparison is a calibration, not a proof that H is false or unprovable. Primary theorem: D. G. Radcliffe, *The growth of digital sums of powers of two*, https://arxiv.org/pdf/1605.02839 .

There is a remaining but more qualified power-of-two comparison for H_L. For k=2^r its candidate exponents lie in

    (2^r-1)/(r*log10(2)) <= s < 2^r/(r*log10(2)).

If an integer s lies in this interval and E=rs, then H_L would assert S(2^E)>E/r. Since E is approximately 2^r/log10(2), this again has scale E/log E. However the interval's width is 1/(r*log10(2)); the argument does not prove that it contains an integer for infinitely many r. No infinitude or distribution claim about these r is made. In particular H_L does not automatically imply the explicit diagonal bound above.

The infinite length/mod9 survivor family k=10^t+1, s=10^t/t, t=4*10^j lies on H_L's domain. The fixed-polynomial proposition does not cover it: P(T)=T+1 is fixed but its exponent s changes with t. Controlling growing exponents and the resulting carries remains the unresolved distinction.

## Even a proof of H would leave normalized families

For an extra fixed point of length k>=10, write k=10^t*u with 10 not dividing u. The exact reduction is

    S(u^s)=s,
    k=t*s+d(u^s).

The case u=1 was already excluded separately. If H holds and u>=2, then u>=s is impossible. Consequently every extra fixed point would have

    u<s,
    t>=1,
    10^t > log10(k).

For the last claim, s<k/log10(k) gives log10(k)<k/s, whereas u<s gives k/s=10^t*u/s<10^t. The claim t>=1 follows because t=0 would give u=k>s on the length curve.

These are conditional deductions from H, not established restrictions without H. They still allow every fixed small normalized core u>=2 at all sufficiently large t. In particular they do not settle the u=4 and u=6 normalized survivors found by the finite screen. Proving H or H_L for bases not divisible by ten would therefore be a substantial partial result, but would not by itself complete the frozen all-k target.

## Assessment and next falsifiable target

No exact counterexample to H was obtained. A fixed polynomial in a growing decimal block base, including rational-denominator variants, cannot supply one eventually at a fixed exponent. The known ratio-to-root-digit-sum construction is especially tempting but gives output digit sum at least 4s+1 in its stable block range.

The length-curve non-equality S(k^s)!=s is the better scoped sufficient target for 10 not dividing k. It avoids the explicit full diagonal, while retaining genuinely difficult growing-exponent instances such as k=10^t+1. Any proposed next argument should state whether it handles growing s, and whether it also covers normalized cores u<s; otherwise it leaves one of these two gaps. No all-k theorem, final finite bound, or Lean-checked statement follows from this review.
