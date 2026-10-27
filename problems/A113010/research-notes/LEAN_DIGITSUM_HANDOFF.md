> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# All-size digit-sum lower bound — Session 01

Completed 2026-10-27 09:42 UTC. Owned source: `proof/A113010/DigitSumBound.lean`.
Existing proof modules and frozen files were unchanged.

## Formally established statements

- `fixed_of_digitSum_le_333`: for every natural n, if `a n=n` and
  `digitSum n≤333`, then n=1 or n=32.
- `additional_fixedPoint_digitSum_ge_334`: if `a n=n`, n≠1, and n≠32,
  then `334≤digitSum n`.
- `additional_fixedPoint_nonzeroDigits_ge_38`: under the same hypotheses,
  `38≤nonzeroDigitCount n`, where nonzeroDigitCount counts nonzero entries
  in `Nat.digits 10 n`.

These apply to all natural n, without an upper-size hypothesis. They are
necessary conditions for hypothetical additional fixed points, not a solution
of either frozen target.

## Proof structure

`power_exclusion_step` proves that if k>0, 2s≤k, and k^s<10^(k−1), then
(k+1)^s<10^k. It uses the previously verified natural-number inequality
(k+1)^s<2*k^s from FilterSurvivors.

`power_exclusion_above` inducts this step from any starting base K satisfying
K>0, 2s≤K, and K^s<10^(K−1), obtaining the inequality for all k≥K.

`pow_333_below_digit_lower` instantiates K=1001 and s=333; the initial exact
inequality `1001^333<10^1000` is checked by ordinary Lean decide. Therefore a
fixed point with digit sum≤333 cannot have digit count≥1001. The existing
1000-digit finite theorem then restricts it to1 or32.

The list-induction theorem `digitSum_le_nine_mul_nonzeroDigitCount` proves
S(n)≤9 times the number of nonzero decimal digits. Since9*37=333, the all-size
digit-sum lower bound gives at least38 nonzero digits.

## Verification

- `scripts/lean.sh --wfail build A113010.DigitSumBound`: PASS (module1.5s).
- `scripts/lean.sh env leanchecker -v A113010.DigitSumBound`: PASS.
- Printed audits for power_exclusion_above, fixed_of_digitSum_le_333,
  additional_fixedPoint_digitSum_ge_334, and
  additional_fixedPoint_nonzeroDigits_ge_38 all report exactly
  `[propext, Classical.choice, Quot.sound]`.
- No native_decide, extra axioms, sorry, frozen edits, dependency changes,
  fresh Mathlib replay, or additional finite-range scaling.
- No outstanding Lean goals or owned active processes. Lean slot relinquished.
