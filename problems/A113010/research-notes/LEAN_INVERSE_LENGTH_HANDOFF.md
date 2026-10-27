> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Inverse length formalization — completed

Final source `proof/A113010/InverseLength.lean` passed warning-free build, all
axiom audits, and module-only kernel replay by 2026-10-27 13:08:44 UTC. The build
slot was released to the principal immediately. No owned process or open proof
goal remains. Only this new source and this handoff were changed; root owns
ResearchAudit/verifier integration.

Drafting and Mathlib inspection occurred while the numerical search held the
heavy slot. No Lean invocation occurred before the principal's explicit release
at approximately 13:06 UTC. Validation finished well inside the 30-minute budget,
2.5 GiB cap, 13:40 task cutoff, and original 14:45:56 mission checkpoint.

## Exact completed public statements

All names are in namespace OeisA113010; all exponents and bases are natural.

```lean
digitCount_mono : Monotone digitCount

exists_length_compatible_base {s : ℕ} (hs : 4 ≤ s) :
  ∃ k : ℕ, 2 ≤ k ∧ digitCount (k ^ s) = k

power_below_digit_lower_of_gap_two {k s h : ℕ} (hk : 0 < k)
  (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
  h ^ s < 10 ^ (h - 1)

not_length_compatible_of_gap_two {k s h : ℕ} (hk : 0 < k)
  (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
  digitCount (h ^ s) ≠ h

length_compatible_eq_or_succ {k s h : ℕ} (hk : 0 < k)
  (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k)
  (hkh : k ≤ h) (hcompatible : digitCount (h ^ s) = h) :
  h = k ∨ h = k + 1

additional_fixedPoint_count_eq_or_succ {n m : ℕ}
  (hn : a n = n) (h1 : n ≠ 1) (h32 : n ≠ 32) (hm : a m = m)
  (hs : digitSum m = digitSum n) (hcount : digitCount n ≤ digitCount m) :
  digitCount m = digitCount n ∨ digitCount m = digitCount n + 1

additional_fixedPoint_digitCounts_two_consecutive (s : ℕ) :
  ∃ K : ℕ, ∀ n : ℕ, a n = n → n ≠ 1 → n ≠ 32 → digitSum n = s →
    digitCount n = K ∨ digitCount n = K + 1

fixedPoints_per_digitSum_at_most_two (s : ℕ) :
  ∃ u v : ℕ, ∀ n : ℕ, a n = n → digitSum n = s → n = u ∨ n = v
```

Two private helpers also passed their explicit axiom audits:

- `digitCount_ten_pow (t : ℕ) : digitCount (10 ^ t) = t + 1`.
- `squared_exponent_lt_ten_pow {s : ℕ} (hs : 0 < s) : s*s+1 < 10^s`.

## Hypothesis scope and interpretation

The first existence theorem is only about the decimal-length equation. It does
not supply a digit-sum equality, modulo-nine condition, or additional fixed point.
The length-candidate two-base conclusion requires positive k and 2s≤k. These
hypotheses were retained exactly; unrestricted length uniqueness is not claimed.

For the ordered fixed-point corollary, n is explicitly additional, while m need
only be fixed with the same digit sum and an ordered digit count. No unnecessary
exclusion hypotheses on m are introduced. Existing r=4 sparsity places n in the
required 2s≤k range.

The global consecutive-count theorem includes an empty-set case. The final
at-most-two theorem chooses u=1,v=32 for s≤2500 using the existing all-size
classification. For s>2500, the sums of 1 and 32 exclude those values, and the
consecutive bases supply u=K^s and v=(K+1)^s. The witnesses need not themselves
be fixed points and need not be distinct. This is an upper bound on the number
of fixed points at each digit sum, not an existence assertion, not a bound on s,
and not a resolution of either frozen target.

No modulo-nine refinement or cardinality infrastructure was added. That separate
work remains with the principal.

## Proof route

Mathlib's `Nat.le_length_digits_le` gives digit-count monotonicity. At exponent
s≥4, d(2^s)≥2. At K=10^s, the length of K^s is s²+1<K, using
s+1≤2^s and s²+1<(s+1)²≤4^s<10^s. Nat.find selects the first k≥2 with d(k^s)≤k.
If k>2, minimality and monotonicity give d(k^s)≥d((k−1)^s)≥k, proving equality.

For the tail exclusion, two applications of succ_pow_lt_two_mul_pow give
(k+2)^s<4*k^s<10^(k+1). The previously checked power_exclusion_above excludes
all h≥k+2. The fixed-point consequences use existing fixed_eq_pow and sparsity;
Nat.find selects the least digit-count base if the relevant additional-point set
is nonempty. The empty case is treated explicitly.

## Verification and exact resources

All ten declarations, including the two private helpers, report exactly
`[propext, Classical.choice, Quot.sound]`. These actual lists were inspected and
programmatically checked against the expected ten names. There is no sorry,
native_decide, custom axiom, changed dependency, or frozen-source edit.

| Phase | Command | Seconds | Peak KiB | Result |
|---|---|---:|---:|---|
| Initial draft validation | scripts/lean.sh --wfail build A113010.InverseLength | 2.94 | 1834540 | PASS |
| Final saved source, stale draft label removed | scripts/lean.sh --wfail build A113010.InverseLength | 2.97 | 1831732 | PASS |
| Final module kernel replay | scripts/lean.sh env leanchecker -v A113010.InverseLength | 4.57 | 1557676 | PASS |

The first draft compiled without proof repairs. Only its stale draft-status
comment was removed before the final build. Total measured command time was
10.48 seconds, including Lake overhead. Overall peak was 1,834,540 KiB (about
1.75 GiB), below the 2.5 GiB cap. Every command had a 120-second timeout and
returned exit 0. No --fresh replay was used.

Root may now import the completed module in AdjacentResidues and add the desired
public results to the consolidated audit. This handoff does not claim that the
root's expanded consolidated verifier has already run.
