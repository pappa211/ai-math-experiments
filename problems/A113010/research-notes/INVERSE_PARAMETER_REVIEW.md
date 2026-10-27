> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent review of inverse parameterization

2026-10-27, Session 01. Bounded light review of `notes/INVERSE_PARAMETERIZATION.md`. This note checks the informal mathematics and existing theorem statements; no Lean build or new formal proof was performed. The only computations were tiny exact integer powers and a finite residue-table cross-check.

## Verdict and scope

The existence argument, two-base theorem in the region `k >= 2s`, and adjacent modulo-9 classification are correct. State the exponent as a positive integer (or natural number with the relevant lower bound), rather than an unrestricted integer. Together with the existing formal classification, the argument implies that every prescribed digit sum admits at most two fixed points. In fact there is at most one unless `s = 4 (mod 18)`.

The regional qualification is essential for length compatibility alone: for `s=6`, the four bases `k=2,3,4,5` give powers `64,729,4096,15625`, respectively, each having exactly `k` digits. These all lie below `2s`. The existence theorem does not itself assert that its least crossing lies in the two-base region.

## Existence for every s >= 4

Fix a positive integer `s >= 4`, and set `g(k)=d_10(k^s)` for positive integers `k`. This is nondecreasing. Since `2^s >= 16`, `g(2) >= 2`. For `K=10^s`, one has exactly `g(K)=s^2+1`, and

    s^2+1 < (s+1)^2 <= 4^s < 10^s = K.

Here `s+1 <= 2^s` holds for every positive integer `s`. Therefore the set of integers `k >= 2` with `g(k) <= k` is nonempty and has a least member `k0`.

If `k0=2`, the two inequalities give equality. Otherwise minimality gives `g(k0-1)>k0-1`; integrality and monotonicity imply `g(k0)>=g(k0-1)>=k0`, again giving equality. Both endpoints of the decimal-length condition are consequently correct: `10^(k0-1) <= k0^s < 10^k0`.

The threshold is sharp for positive exponents if the base must be at least two: for `1 <= s <= 3`, no such base exists. Indeed `2^3<10`, and the ratio between successive cubes is at most `(3/2)^3<10`; induction gives `k^3<10^(k-1)` for every `k>=2`, and then `k^s<=k^3`.

## At most two consecutive candidates in the specified region

For every positive integer `a >= 2s`, Bernoulli's inequality gives

    (a/(a+1))^s >= 1-s/(a+1) > 1/2,

so `(a+1)^s < 2a^s`. The strict endpoint is justified even at `a=2s`, because the denominator is `a+1`.

Suppose `k>=2s` and `d_10(k^s)=k`. Applying this twice yields

    (k+2)^s < 4k^s < 4*10^k < 10^(k+1).

Thus `k+2` falls strictly below the lower endpoint required for length compatibility. Moreover, whenever `h>=k+2` and `h^s<10^(h-1)`, the same inequality gives

    (h+1)^s < 2h^s < 2*10^(h-1) < 10^h.

Induction excludes every larger base. Taking the least compatible base in the region (when there is one) proves that the entire regional candidate set is contained in two consecutive integers. No assumption about lower-region candidates is being made.

## Passage from candidates to fixed points

The source statements inspected were:

- `proof/A113010/SuffixDigitSum10000.lean`: `fixed_of_digitSum_le_2500` and `additional_fixedPoint_digitCount_ge_10005`.
- `proof/A113010/Sparsity.lean`: `fixed_scaled_digitSum_lt_count`.

The first says that any fixed point with digit sum at most 2500 is 1 or 32. Their digit sums are respectively 1 and 5, so a prescribed sum in that range permits at most one fixed point.

For `s>2500`, every fixed point is additional. It has `k>=10005`, and applying the scale inequality with `r=4` gives `4s<k`, hence `2s<=k`. The two-base theorem therefore applies to all fixed points with that prescribed sum. Finally, each base determines only the single integer `n=k^s`; there is no extra multiplicity when passing from bases to fixed points. This proves the stated total bound of two, conditional only on the cited existing formal classification and the new informal argument. It does not bound the number of sums that might occur.

## Complete adjacent modulo-9 classification

For positive `s`, the simultaneous conditions

    k^s = s (mod 9),   (k+1)^s = s (mod 9)

hold if and only if

    s = 4 (mod 18),   k = 4 (mod 9).

For odd `s`, raising to the `s`th power is the identity modulo 3, so adjacent bases cannot have equal residues after exponentiation.

For even `s`, one of two adjacent bases divisible by 3 would have power 0 modulo 3 and the other power 1. Thus both bases must be nonzero modulo 3, forcing the smaller base to be 1 modulo 3. Its residue modulo 9 is then 1, 4, or 7.

For smaller residue 1 or 7, equality of the two even powers forces `s=0 (mod 6)`, and their common value is 1 modulo 9. That contradicts compatibility with `s`, which is then divisible by 3.

For smaller residue 4, the bases 4 and 5 are negatives modulo 9, so their even powers agree. According as `s` is 0, 2, or 4 modulo 6, the common value is 1, 7, or 4 modulo 9. The first two alternatives contradict `s` modulo 3. The third requires `s=4 (mod 9)` as well as even parity, which is exactly `s=4 (mod 18)`. Conversely, these two residue conditions directly give the required simultaneous congruences.

Consequently a prescribed digit sum outside the residue class 4 modulo 18 permits at most one fixed point, using the preceding regional reduction and the existing small-sum classification. The congruence does not establish that two fixed points can actually exist in the exceptional class.

## Independent tiny checks

Exact Python integer arithmetic verified:

| s | k | d_10(k^s) | S_10(k^s) | k^s mod 9 |
|---|---|---|---|---|
| 58 | 121 | 121 | 472 | 4 |
| 58 | 122 | 122 | 526 | 4 |

Both exact inequalities `10^(k-1) <= k^58 < 10^k` were checked. Thus these are genuine adjacent length/congruence candidates, but neither is a fixed point. A residue cross-check for `1<=s<=72` and `0<=k<9` found exactly `(s,k)=(4,4),(22,4),(40,4),(58,4)`, agreeing with the proof above. No broader numerical search was run.

No processes were left running by this review.
