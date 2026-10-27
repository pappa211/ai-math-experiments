> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Lean Basic module handoff — Session 01

Completed 2026-10-27 08:55 UTC by Lean engineering subagent.
Owned source: `proof/A113010/Basic.lean`. No frozen files changed.

## Verification

- `scripts/lean.sh --wfail build A113010.Basic`: PASS.
- `scripts/lean.sh env leanchecker -v A113010.Basic`: PASS; output `replaying A113010.Basic`.
- No fresh/full-Mathlib replay, native_decide, admitted proof, custom axiom, or changed dependency.
- No remaining proof goals or research subprocesses owned by this subagent.
- Sole Lean build slot relinquished to principal researcher.

## Definitions

In namespace `OeisA113010`:

- `digitCount n := (Nat.digits 10 n).length`
- `digitSum n := (Nat.digits 10 n).sum`

## Proved lemmas

- `fixed_eq_pow`: `a n = n → n = digitCount n ^ digitSum n`.
- `fixed_pos`: fixed points are positive.
- `digitCount_pos`: positive inputs have positive digit count.
- `digit_bounds`: for positive n, `10^(digitCount n-1) ≤ n < 10^digitCount n`.
- `digitCount_eq_iff`: for positive k, digit count k iff the two exact power bounds.
- `fixed_digitSum_pos`: fixed points have positive digit sum.
- `digitSum_le_nine_mul_digitCount`: the elementary digit-sum upper bound.
- `digitSum_mod_nine`: `n % 9 = digitSum n % 9`.
- `fixed_reduction`: bundles positivity, power equation, exact length inequalities, digit-sum upper bound, and modular condition.
- `candidate_exponent_unique`: for `k≥10`, two exponents s,t both satisfying `10^(k-1)≤k^s<10^k` and the analogous t bounds must coincide. Entirely natural-number proof: one increment multiplies by k≥10, exceeding the length interval.
- `candidate_exponent_lt_base`: if k≥10 and `k^s<10^k`, then s<k.
- `fixed_digitSum_lt_digitCount`: applies the preceding bound to fixed points with at least ten digits.
- `fixed_of_digitCount_le_two`: any fixed point with at most two digits is 1 or 32.
- `fixed_below_hundred`: any fixed point less than 100 is 1 or 32.

## Transitive axiom output

- `fixed_reduction`: `[propext, Classical.choice, Quot.sound]`.
- `candidate_exponent_unique`: `[propext, Quot.sound]`.
- `fixed_of_digitCount_le_two`: `[propext, Classical.choice, Quot.sound]`.

These are intermediate results only. Neither exact frozen existence/nonexistence target has been proved. No new mathematical bound on all possible digit lengths has been established.
