> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Inverting the length parameter

2026-10-27, Session01. Principal derivation, independently reviewed and now formalized in InverseLength.lean and AdjacentResidues.lean. Both modules pass warning-free builds, permitted-axiom audits, and module-only kernel replay. This does not exclude a fixed point.

Write d(n) for positive decimal digit length. Fix a natural-number exponent s.

## Every exponent at least four has a nontrivial length-compatible base

For every s>=4 there exists k>=2 such that d(k^s)=k.

Proof. The integer function g(k)=d(k^s) is nondecreasing for k>=1. At k=2, 2^s>=16, so g(2)>=2. At K=10^s, g(K)=s^2+1<K. To see the strict inequality, s+1<=2^s for s>=1, and s^2+1<(s+1)^2<=4^s<10^s. Choose the least k>=2 such that g(k)<=k. If k=2, equality follows from g(2)>=2. Otherwise minimality gives g(k-1)>k-1, hence g(k)>=g(k-1)>=k. Together with g(k)<=k this proves equality. QED.

Thus the length equation is sparse when parametrized by k, but it never disappears when parametrized by large s. No modulo-nine or digit-sum equality is included in this existence statement.

## At most two consecutive bases in the sparse-exponent range

Suppose k>=1, 2*s<=k and d(k^s)=k. Then every other length-compatible h>=k satisfies h<=k+1.

Indeed the existing reciprocal-Bernoulli lemma gives

    (k+1)^s < 2*k^s,
    (k+2)^s < 2*(k+1)^s < 4*k^s < 10^(k+1).

The final inequality uses k^s<10^k and4<10. This falls below the lower length bound for base k+2. The existing propagation lemma then gives h^s<10^(h-1) for all h>=k+2, excluding that entire ray. Hence all candidates in the region k>=2*s, if any, lie in a set of two consecutive integers. QED.

The current formally established bounds imply k>4*s for every additional fixed point, so they lie in this region. For each fixed digit sum s, therefore, there can be at most two additional fixed points, corresponding to those consecutive bases. If s<=2500, the existing formal classification leaves only1 or32. This conclusion is about each fixed s and does not make the union over all s finite.

## A limit to further uniqueness from modulo nine

The two-candidate conclusion cannot generally be sharpened to one using length and modulo9 alone: s=58, k=121 and k=122 both satisfy d(k^s)=k and k^s==s(mod9). Independent exact integer checks confirm these assertions. Their full decimal digit sums are 472 and 526 respectively, so neither is a fixed point.

For odd s, adjacent integers have different s-th powers modulo3, so at most one adjacent candidate can pass modulo3. For even s, adjacent modulo9 collisions compatible with s occur only when s==4(mod18) and the smaller base is4(mod9); the displayed example has exactly those residues. AdjacentResidues.lean proves this classification for every positive exponent and all natural bases. Consequently, two distinct fixed points with the same digit sum force that sum to be 4 modulo 18.

## Research value and limitation

This gives a different exhaustive search parameterization and a precise description of how length-compatible bases can coexist. It does not bound s, control S(k^s), or resolve either frozen target. An algorithm based on integer monotone iteration could enumerate these bases, but no new production search is authorized by this note or presently implemented.

## Late informal sharpening (14:08 UTC)

INVERSE_LENGTH_SHARPENING_REVIEW.md gives a shorter and stronger length-only argument. The estimate(1+1/x)^s<3 for1<=s<=x follows from the binomial series and sum1/j!<3. Thus two successor steps cost less than9, below the factor10 separating the required intervals, and exclusion propagates once a compatible base k>=s is chosen. For s>=10, the finite inequalities k^10>=10^k for2<=k<=9 exclude those small bases, while any remaining compatible base has s<k. Combining with existence gives exactly one or two consecutive nontrivial bases. Tiny complete tables extend this to every s>=7; the only exponents with more than two nontrivial bases are5 and6. At s5 onlybase2 passes mod9, and at s6 no residue passes. Thus the per-s fixed-point multiplicity bound also has an informal proof independent of the large finite classification.

At14:24UTC the factor-three successor bound, improved propagation, and gap-two consequences were completed in InverseLengthSharpening.lean, with warning-free build, six allowed-axiom audits, and module-only replay. The global small-exponent classification remains informal. The inventory is now110 modules/52 named audits; final integrated verification is in progress. No digit-sum bound or target resolution follows.
