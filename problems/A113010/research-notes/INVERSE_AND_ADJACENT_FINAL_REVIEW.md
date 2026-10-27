> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Final scope review: inverse length and adjacent residues

2026-10-27, Session 01, mathematical critic. Read-only review of `proof/A113010/InverseLength.lean` and `proof/A113010/AdjacentResidues.lean`. The root reports successful compilation/replay; this review inspected mathematical statements and proofs but did not run Lean or independently replay those builds. No final-target proof is claimed.

## Statements and interpretation

No scope defect was found.

- `exists_length_compatible_base`: every natural exponent `s>=4` admits some `k>=2` with `d(k^s)=k`. This concerns length alone; neither the modulo-9 condition nor `S(k^s)=s` follows.
- `length_compatible_eq_or_succ`: given a compatible positive base `k>=2s`, every compatible base `h>=k` is `k` or `k+1`. The range hypothesis is essential: `s=6` has compatible bases 2,3,4,5 below that range.
- `fixedPoints_per_digitSum_at_most_two`: for each natural sum, all actual fixed points belong to some set `{u,v}`. The witnesses need not be distinct or fixed, and the set of fixed points may be empty. Existing classification for sums at most 2500, together with `4s<k` for every additional fixed point, makes the bound global for actual fixed points.
- `adjacent_power_mod_nine_iff`: for every positive exponent and every natural base, simultaneous congruences for `k` and `k+1` hold exactly when `s mod 18=4` and `k mod 9=4`. The proof handles exponent one separately, then reduces exponents at least two through a valid period-18 table; nonunits modulo nine are included.
- `fixed_eq_of_same_digitSum_mod_ne_four`: two actual fixed points with equal digit sums must coincide unless that sum is 4 modulo 18. The exceptional residue is necessary for multiplicity, not sufficient. `distinct_fixed_same_digitSum_mod_eighteen` is exactly the corresponding necessary condition.

The two-point theorem quantifies separately over every sum. It neither makes the union over sums finite nor produces an additional fixed point. The residue theorem also does not make every length candidate a fixed point.

## Immediate informal corollary: shape of a hypothetical pair

Suppose `n<m` are two distinct actual fixed points with common digit sum `s`. The existing classification excludes the known points from such a pair. Monotonicity of decimal length and the two-base result give, for `k=d(n)`,

    n=k^s,   m=(k+1)^s,
    d(n)=k,  d(m)=k+1,
    s=4 (mod 18),   k=4 (mod 9),   4s<k.

Thus the two integers are coprime squares: their bases are consecutive and the exponent is even. These conclusions are informal deductions from the reviewed statements, not new declarations in the two modules.

Bernoulli's inequality gives

    (k/(k+1))^s >= 1-s/(k+1) > 3/4,

hence `m/n<4/3`. Since their lengths put them on opposite sides of `10^k`,

    (3/4)*10^k < n < 10^k <= m < (4/3)*10^k.

In particular the larger point would start with decimal digit 1; the smaller would start with 7, 8, or 9. This narrows a hypothetical pair but does not exclude one. More generally, whenever `r>=2` and `10^r<=k`, the existing scale inequality gives `rs<k`, and the same argument yields `m/n<r/(r-1)`.

## Immediate informal corollary: positive digit-sum blocks

For positive `s`, the elementary modulo-9 condition `k^s=s (mod 9)` permits the following base residues. The table is valid for every positive exponent, not merely its small representative: units have exponent period six, and bases divisible by three have power zero modulo nine for exponents at least two. The exponent-one case has the same listed compatible base residue.

| s mod 18 | k mod 9 allowed by the congruence |
|---|---|
| 0 | 0,3,6 |
| 1 | 1 |
| 2 | none |
| 3 | none |
| 4 | 4,5 |
| 5 | 2 |
| 6 | none |
| 7 | 7 |
| 8 | none |
| 9 | 0,3,6 |
| 10 | 1,8 |
| 11 | 5 |
| 12 | none |
| 13 | 4 |
| 14 | none |
| 15 | none |
| 16 | 2,7 |
| 17 | 8 |

A tiny exact Python check evaluated this table and cross-checked it for `s=1..72`; no large powers were computed. No fixed point can have a positive digit sum in the seven excluded residue classes `{2,3,6,8,12,14,15}` modulo 18. Among the eleven remaining classes, the uniqueness theorem permits at most one point per prescribed sum except class 4, which permits at most two.

Therefore for every positive integer `A`, there are at most twelve actual fixed points whose digit sums lie in `{A,A+1,...,A+17}`. This is a bound across eighteen positive sum values, not a bound across eighteen consecutive integer values of `n`. It is an informal counting consequence, not a newly formalized theorem. Its linear growth does not settle the remaining uniform digit-sum problem.

Review completed without builds or heavy computations. No owned processes remain running.
