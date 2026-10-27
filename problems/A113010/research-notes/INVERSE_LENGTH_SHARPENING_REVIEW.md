> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Review of the inverse-length sharpening

2026-10-27, Session 01. This is a rigorous informal refinement, checked with only tiny exact arithmetic tables. It is not present in the completed Lean modules, whose verified sources were not edited or rebuilt. It does not resolve either frozen target.

## Verdict

The proposed replacement of `2s<=k` by `s<=k` is correct. The supplied small-exponent lists are also correct. Combining those lists with the argument yields the slightly stronger conclusion:

> Every integer exponent `s>=7` has exactly one or two consecutive nontrivial length-compatible bases. For all natural exponents, more than two such bases occur only at `s=5` and `s=6`.

Here “nontrivial” always means `k>=2`. The base `k=1` is length-compatible for every exponent and is deliberately outside these lists; it produces an actual fixed point only with digit sum one. No digit-sum equality is implied by length compatibility.

## Uniform successor bound

Let `s>=1` and `x>=s` be integers with `x>0`. By the binomial theorem,

    (1+1/x)^s
      = sum(j=0..s) binom(s,j)/x^j
      <= sum(j=0..s) 1/j!.

The coefficient bound follows from `binom(s,j)<=s^j/j!` and `s/x<=1`. For `j>=1`, `j!>=2^(j-1)`, and hence the finite geometric sum gives

    sum(j=0..s) 1/j!
      <= 1 + sum(j=1..s) 2^(1-j)
       = 3 - 2^(1-s) < 3.

Thus `(x+1)^s<3x^s`, including the boundary `x=s`. For `s=0` the same conclusion is immediate from `1<3`; it still requires `x>0` when written as a ratio.

Suppose `k>=2`, `s<=k`, and `d(k^s)=k`. The bound applies at both k and k+1, so

    (k+2)^s < 9k^s < 9*10^k < 10^(k+1).

This is strictly below the required lower endpoint at base k+2. If `h>=k+2` already satisfies `h^s<10^(h-1)`, the successor bound gives

    (h+1)^s < 3h^s < 3*10^(h-1) < 10^h.

Induction excludes every base at least k+2. Therefore every compatible base at or above such k is k or k+1. As before, this is containment, not an assertion that the successor is always compatible.

The same propagation proves that any positive seed `K>=s` with `K^s<10^(K-1)` excludes all larger bases. No numerical approximation to logarithms is needed.

## Why every large exponent is in the required range

For each `k=2,...,9`, exact small arithmetic gives `k^10>=10^k`; the values of `k^10` are

    1024, 59049, 1048576, 9765625,
    60466176, 282475249, 1073741824, 3486784401.

For `s>=10`, none of these bases can satisfy the strict upper length inequality. Every nontrivial compatible base therefore has `k>=10`. Then

    10^s <= k^s < 10^k

implies `s<k`, so the new range hypothesis is automatic. Existence for every s>=4 was already proved by the first-crossing argument. For s>=10 the compatible set is consequently nonempty and contained in two consecutive bases. It contains either one or both of them.

## Complete small-exponent lists

The following table was checked using exact integer powers. Every listed tail seed K satisfies `K>=max(2,s)` and the displayed strict inequality. All bases from 2 through K-1 were checked, and propagation proves completeness above K.

| s | All compatible k>=2 | Tail seed and exact inequality |
|---|---|---|
| 0 | none | `2^0=1<10` |
| 1 | none | `2^1=2<10` |
| 2 | none | `2^2=4<10` |
| 3 | none | `3^3=27<100` |
| 4 | 2 | `4^4=256<1000` |
| 5 | 2,3,4 | `5^5=3125<10000` |
| 6 | 2,3,4,5 | `6^6=46656<100000` |
| 7 | 5,6 | `7^7=823543<1000000` |
| 8 | 7,8 | `9^8=43046721<100000000` |
| 9 | 9,10 | `11^9=2357947691<10000000000` |

In particular `4^5=1024` supplies the third base at s=5. The endpoint `10^9=10^(10-1)` is included at s=9 because the lower length inequality is non-strict. Its digit sum is only one, so this length candidate is not a fixed point.

Combining the s=7,8,9 rows with the preceding argument proves the claimed range s>=7. Globally, the nontrivial compatible bases always form a consecutive block of size at most four, with size three only at s=5 and size four only at s=6; exponents 0..3 have an empty block.

## Immediate fixed-point consequence, still informal

The exceptional small-length multiplicities do not obstruct the actual fixed-point bound. For s=5 only k=2 among its three bases passes modulo nine. For s=6, no base residue at all can satisfy `k^6=6 (mod 9)`: sixth powers are 0 modulo nine for multiples of three and 1 modulo nine for units. Thus the two exceptional multi-base exponents collapse under modulo nine alone. The exact digit sums of the listed candidates at s=4..9, in their displayed order, are

    s=4: 7;
    s=5: 5,9,7;
    s=6: 10,18,19,19;
    s=7: 23,36;
    s=8: 31,37;
    s=9: 45,1.

Thus the only nontrivial fixed point with exponent at most nine is 32. Including base one gives known fixed point 1. For s>=10 there are already at most two nontrivial length candidates; when there are two they are adjacent, so the established adjacent modulo-nine classification permits both only for `s=4 (mod 18)` and smaller base `k=4 (mod 9)`.

This gives an alternative informal derivation of “at most two fixed points per prescribed digit sum, at most one outside the exceptional class” using only the uniform length argument and tiny small cases. In principle it removes reliance on the large finite fixed-point classification for those multiplicity conclusions. The existing Lean proofs still use their original hypotheses and dependencies; no replacement proof has been formalized or audited here.

No Lean build, large arithmetic computation, numerical range expansion, or source edit was performed. No owned processes remain running.

## Principal follow-up at14:24UTC

After this informal review, the factor-three bound, sharper propagation, and gap-two/pair-containment consequences were completed in proof/A113010/InverseLengthSharpening.lean. Its warning-free build, six public allowed-axiom audits, and module-only replay passed. The global small-exponent table/wrapper remains informal. No previous verified proof file was changed; the completed source inventory grew to110 modules, with final integrated verification pending. See LEAN_INVERSE_LENGTH_SHARPENING_HANDOFF.md for exact declarations.
