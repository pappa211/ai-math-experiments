> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Trailing-zero Lean normalization — Session 01

Completed 2026-10-27 09:08 UTC. Owned source: `proof/A113010/TrailingZeros.lean`.
Basic, Finite, and frozen sources remained unchanged.

## Exact established claims

In namespace `OeisA113010`:

- `digitSum_ten_pow_mul (t u : ℕ)`:
  `digitSum (10^t*u) = digitSum u`. This also holds when u=0.
- `digitCount_ten_pow_mul (t : ℕ) (hu : 0<u)`:
  `digitCount (10^t*u) = t + digitCount u`.
- `digitSum_power_ten_factor (t u s : ℕ)`:
  `digitSum ((10^t*u)^s) = digitSum (u^s)`.
- `digitCount_power_ten_factor (t s : ℕ) (hu : 0<u)`:
  `digitCount ((10^t*u)^s) = t*s + digitCount (u^s)`.
- `fixed_normalized_equations`, under `a n=n`, `u>0`, and `digitCount n=10^t*u`:
  `10^t*u = t*digitSum n + digitCount (u^digitSum n)` and
  `digitSum (u^digitSum n) = digitSum n`.
- `fixed_of_normalized_parameters`, under `u>0`,
  `t*s+digitCount(u^s)=10^t*u`, and `digitSum(u^s)=s`:
  `a ((10^t*u)^s) = (10^t*u)^s`.
- `fixed_iff_normalized_parameters (n : ℕ)`:
  `a n=n` iff there exist natural t,u,s with u>0, s>0,
  `n=(10^t*u)^s`, `t*s+digitCount(u^s)=10^t*u`, and `digitSum(u^s)=s`.
  The factorization in this theorem need not be maximal; no condition `10 ∤ u`
  is asserted. Forward existence may choose t=0. This is an exact rewriting,
  not an all-length obstruction.
- `succ_lt_ten_pow`: if t>0, then `t+1<10^t`.
- `fixed_digitCount_ne_ten_pow`: if `a n=n` and t>0, then
  `digitCount n ≠ 10^t`. Therefore decimal lengths 10,100,1000,... are excluded.
  Proof: normalization with u=1 forces digitSum n=1 and `10^t=t+1`, contradicting
  strict elementary growth.

No general exclusion for u>1 is claimed.

## Verification

- `scripts/lean.sh --wfail build A113010.TrailingZeros`: PASS, module time1.4s.
- `scripts/lean.sh env leanchecker -v A113010.TrailingZeros`: PASS.
- Printed transitive audits for digitSum_ten_pow_mul, digitCount_power_ten_factor,
  fixed_normalized_equations, fixed_iff_normalized_parameters, and
  fixed_digitCount_ne_ten_pow all equal `[propext, Classical.choice, Quot.sound]`.
- No admitted proof, custom axiom, native_decide, fresh Mathlib replay, or dependency change.
- No outstanding proof goals or owned running subprocesses. Lean slot relinquished.

Neither frozen target has been resolved.

## Critic-requested uniqueness extension — 2026-10-27 09:11 UTC

Added `exponent_lt_four_digitCount_power`: for u≥2, `s < 4*digitCount(u^s)`.
Proof compares `2^s ≤ u^s < 10^D ≤ 16^D = 2^(4D)`.

Added `linear_lower_bound_ten_pow`: `1+9h ≤ 10^h` for every natural h.

Added `normalized_scale_unique`: for u≥2 and any natural s, if both
`10^t1*u = t1*s + digitCount(u^s)` and
`10^t2*u = t2*s + digitCount(u^s)`, then t1=t2.
The theorem needs neither positivity of s nor the digit-sum equation. For t2=t1+h,
subtracting the two equations and using the growth bound forces `9*(10^t1*u) ≤ s`,
whereas the exponent/length comparison and first equation give
`s < 4*digitCount(u^s) ≤ 4*(10^t1*u)`, a contradiction.

Updated module warning-free build PASS (2.5s) and module-only leanchecker replay PASS.
The new uniqueness theorem's transitive axioms are exactly
`[propext, Classical.choice, Quot.sound]`.
No proof goals or active subprocesses remain. Lean slot relinquished again.
