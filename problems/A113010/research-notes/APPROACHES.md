> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Mathematical approaches — Session 01

No complete solution is known. Last substantive update: 2026-10-27 14:24 UTC. Earlier range milestones below are historical; the current formal bound is10004 digits, numerical coverage is5000000 digits, and the exact current summary is in SESSION_01_REPORT.md.

## Exact length/exponent reduction — formally proved, no upper cutoff

A fixed point has n=k^s, k=d(n), s=S(n), and10^(k-1)≤k^s<10^k.
For k≥10 the interval admits at most one exponent and s<k. Basic.lean proves
these facts. Sparsity.lean strengthens this to r*s<k whenever10^r≤k.
The reduction makes each finite range searchable but does not bound k globally.

## Finite exclusion and necessary sparsity — formally proved

Finite.lean proves that d(n)≤1000 leaves only1 and32, using kernel-checked
ordinary `decide` certificates (no native_decide). This formalizes the older
OEIS numerical range. DigitSumBound.lean extends the consequence to all sizes:
S(n)≤333 leaves only1 and32. An additional point therefore has S(n)≥334 and
at least38 nonzero digits. Sparsity.lean proves more than two thirds of all its
digits are zero. These are compatible conditions, not a contradiction.

The exact Python search through100000 digit lengths found only1 and32 among
22184 length candidates (2483 modulo9 survivors). It finished in461seconds.
This range was subsequently extended computationally through one million digit counts
by the reviewed MPFR-enclosure/GMP-suffix method; all17616 mod9 survivors in
100001..1000000 were excluded by exact suffix sums. The formal range was subsequently extended to2000 via kernel-checked suffix certificates; an additional point must now have S≥606 and at least68 nonzero digits.

## Digital-root sieve and infinite survivors — formally proved barrier

Every fixed point has k^s≡s mod9. Every base residue remains possible.
FilterSurvivors.lean proves arbitrarily large pairs passing exact length,
modulo9, coprimality to10, and even S(k)=2. Explicitly, for j≥0:
 t=4*10^j, x=10^t, k=x+1, s=25*10^(t-j-2), ts=x.
Then d(k^s)=k and k^s≡s mod9. This says nothing about S(k^s)=s.
Consequently those filters alone cannot imply a finite cutoff.

## Trailing-zero normalization — formally proved equivalence

For k=10^t*u, a fixed point requires
 S(u^s)=s,   t*s+d(u^s)=10^t*u.
TrailingZeros.lean proves the forward equations and converse construction.
It rules out k=10^t for t>0 and proves at most one scaling t for each pair(u,s)
with u≥2. The equivalent parameterization permits t=0; maximal removal of zeros
is not built into that equivalence.

An exact rational-log screen of2≤u≤9,0≤t≤100 leaves known32 and two unresolved
length/mod9 pairs: (u,t,s)=(6,9,613612926) and
(4,35,11235304926103517236760601181978660).
Their length inequalities were independently certified by rational intervals.
The u6,t9 pair was subsequently excluded numerically: a140million-position
suffix of6^s has digit sum630014399>s. The u4,t35 digit sum remains unknown;
it is not a counterexample or evidence of a fixed point. Expanding it is infeasible. A residue modulo
10^m−1 has digit sum≤9m, so excluding the smaller pair by such a bound alone
requires m≥68179215 before the bound can even exceed s.

## Quantitative modular barrier — formally proved; prefix extension informal

CRITIC_THIRD_REVIEW.md proves an elementary construction jointly developed by
critic and principal. For M>0, any ℓ-digit prefix A, and
 s≥S(A)+90*d(M), k≥s+ℓ,
every residue r compatible with s modulo gcd(M,9) is represented by a k-digit
integer N with that prefix and S(N)=s. It packs residueR, fewer than9 copies
of M, and a block M(10^h−1) of digit sum9h. Thus the obstruction absorbs
moduli of up to roughly s/90 decimal digits, not only fixed moduli.

BlockWeights.lean formally proves the key identity and carry-free concatenation.
ModularBarrier.lean proves the full residue theorem for a leading1 witness,
its compatibility biconditional, and the corollary that every fixed positive
modulus has arbitrarily large survivors. The arbitrary-prefix extension remains
a rigorous informal theorem. The exact Python construction passed1000
bounded checks and a10001-digit example matching the actual power's prefix,
ten suffix digits, and another prime modulus. The fake number differs from the
power. This limits residue/prefix necessary-condition methods only; it does not
exclude stronger perfect-power information or sufficiently much digit information.

## Strong moving-base digit inequality — unproved, not a solution route yet

Hypothesis H: k≥s≥1, k≥2,10∤k ⇒S(k^s)>s. Small exact tests through k500
found no counterexample. Without k≥s it fails: S(2^9)=8,S(2^10)=7.
The general H would imply S(2^(r*2^r))>2^r, of order E/log E on that exponent
subsequence, far beyond the reviewed logarithmic lower bounds. It is unproved.
Even H would leave normalized cores u<s, including the small-core survivors.
DIAGONAL_INEQUALITY_REVIEW.md finds no proof or counterexample to H. It shows
that fixed rational polynomial families also fail eventually at fixed exponent;
the Stolarsky ratio construction has at least4s+1 stable output weight.

## Fixed polynomial constructions — rigorous informal obstruction, nonuniform

For fixed exponent s and a fixed nonmonomial polynomial P with integer
coefficients and positive leading coefficient, S(P(10^m)^s)>s eventually as
m grows. A nonzero root of multiplicity s forces at least s+1 nonzero terms in
P^s. Positive separated coefficients then contribute at least s+1 units;
a negative coefficient yields a growing complement block of nines.
CRITIC_SECOND_REVIEW.md gives the argument. It does not cover P or s varying
with m, which is precisely relevant to arbitrary remaining candidates.

## General lower bounds, S-units, and carry totals — no uniform contradiction

The reviewed fixed-base digit bounds grow only logarithmically or
sublogarithmically in the exponent, with constants possibly depending on base.
Fixed-support sparse-power theorems do not apply with digit budget growing as s.
The exact positive S-unit reformulation has dimension/rank growing with s;
solution-count theorems for a specified group do not bound k or s.
The carry identity S(k)^s=S(k^s)+9*C recovers modulo9 if only the total C is
used. A useful argument must control carry locations or another aspect of the
exact power. Nonzero-digit count>s is false even on the length curve:
12^11=743008370688 has12 digits but only9 nonzero digits.

## Current direction

The quantitative modular barrier is complete and checked. Seek a route
using the exact power structure that survives these counterexamples to weaker
methods. A new uniform digit theorem, a constructive fixed point, or another
substantive invariant is needed. More finite enumeration alone cannot resolve
the frozen target. No statistical digit model is being treated as a theorem.

## Completed small-core equality scan

Exact C arithmetic found only(2,5),(2,70) among S(u^s)=s for2≤u≤9,s≤1000000.
Combined with the normalization and existing formal small-s bound, this excludes
extra fixed points in that normalized-core/exponent region for every scale t.
The enumeration itself remains computational. The targeted larger u6,t9 suffix
exclusion is likewise numerical; neither result establishes the general target.

## Current strongest checked bound and effective polynomial threshold

The suffix certificates now formally classify every n<10^10004. Any additional fixed point has S(n)≥2501, at least278 nonzero digits, d(n)≥10005, and more than three quarters zero digits. These are necessary conditions only. The finite enumeration was through10000, followed by a separate10001 exclusion and analytical sparsity consequences.

For fixed nonmonomial integer P with positive leading coefficient, put W=Σ|coeff(P)|. An independently checked informal argument proves S(P(10^M)^s)>s when M≥s*d(W)+floor(s/9)+1. Signed normalization has carries0 or−1; a negative coefficient creates a block10^M−a with weight at least9(M−d(H)), H=height(P^s). Nonnegative coefficients use the formal support bound. Since H≤W^s, the displayed threshold suffices. This makes the fixed-polynomial obstruction effective but not applicable on the length curve: there s grows exponentially in M divided by M.

## Late uniformity review

See LATE_CONCEPTUAL_REVIEW.md for exact endpoint locations and exponential-approximation error estimates on the existing infinite length/mod9 survivor family. BBM Remark2 is uniform in its unit-term count but requires a fixed positive proportional gap, which this family lacks. Growing exponents may remain2,5-smooth, so large-prime-exponent bounds do not cover them. Fixed-support finiteness already follows from length plus bounded digit weight and supplies no uniform cutoff. Replacing the power mantissa by exp(1/t) loses almost all required decimal precision; fixed-order asymptotics is not a digit-sum certificate. None of these barriers proves that a new power-sensitive argument is impossible, and none resolves the target.

## Inverse parameterization and exceptional residue (13:18 UTC)

Completed and Lean-verified: for each s>=4, some k>=2 satisfies d(k^s)=k. Monotonicity plus a first crossing of d(k^s)-k proves existence; the length condition never supplies a cutoff in s. Reciprocal Bernoulli propagation shows that in k>=2s, at most two consecutive bases are compatible. Since every additional fixed point has k>4s, there are at most two fixed points for each prescribed digit sum. The simultaneous adjacent-base modulo9 condition is equivalent to s=4(mod18), k=4(mod9), so all other sums allow at most one point.

The example s58,k121,122 satisfies both exact length and modulo9, with actual digit sums472,526, so the two-candidate length/residue obstruction is real. These structural restrictions provide another exhaustive parameterization, not a bound on the digit sum or a global exclusion. No monotonicity of decimal digit sum in this parameter is known or assumed. See INVERSE_PARAMETERIZATION.md and the two corresponding Lean modules.

## Late length-only sharpening (14:08 UTC)

A binomial estimate gives(x+1)^s<3x^s when x>=s>=1. Two steps cost less than9, so the inverse range can be weakened from k>=2s to k>=s. A tiny table then proves exactly one or two consecutive nontrivial length bases for every s>=7; exponents5,6 are the only larger-multiplicity exceptions, removed for actual fixed points by modulo9. The core successor/propagation/gap-two argument is now completed in InverseLengthSharpening.lean. The complete small-exponent lists and global s>=7 wrapper remain rigorous informal mathematics reviewed in INVERSE_LENGTH_SHARPENING_REVIEW.md. It simplifies the multiplicity argument but leaves the unbounded digit-sum equality unchanged.


## Session 02 mathematical exploration — 2026-10-27

Outcome: PARTIAL_INSIGHT; no credible new global proof route, no new fixed point or solution candidate. Three independent researchers and a fresh critic used explicitly requested gpt-6-astra/ultra configuration; principal runtime identity was not independently exposed. See SESSION_02_ULTRA_REPORT.md and SESSION_02_CRITIC.md.

Retained informal results: for k=10^T+1, exact order modulo k^s and shortest decimal weight-two multiple; numerical-to-polynomial divisibility for weight<=10, with a sharp weight-eleven counterexample and a weight-two obstruction to multiplicity lifting. Neither reaches the growing weight s>=2501. Tiny exact tests reject broad block-support and filtered inverse-curve monotonicity proposals. No eventual-monotonicity or narrow-survivor-family refutation is claimed.

No new Lean theorem or compilation was produced. Session 01's formal bounds and verification evidence remain unchanged. Recommendation: STOP; further research requires explicit authorization and a concrete new mechanism.
