import A113010.InverseLength
import Mathlib.Analysis.Complex.ExponentialBounds

/-! A sharper successor bound and its inverse-length consequences.
These are intermediate results and do not assert a new fixed point. -/
namespace OeisA113010

set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

/-- The sharp-enough uniform constant three is valid already when s≤x. -/
theorem succ_pow_lt_three_mul_pow {x s : ℕ} (hx : 0 < x) (hs : s ≤ x) :
    (x + 1) ^ s < 3 * x ^ s := by
  have hxR : (0 : ℝ) < x := by exact_mod_cast hx
  have hbase : (1 : ℝ) ≤ 1 + (x : ℝ)⁻¹ :=
    le_add_of_nonneg_right (inv_nonneg.mpr (le_of_lt hxR))
  have hratio : (1 + (x : ℝ)⁻¹) ^ s < 3 := by
    calc
      (1 + (x : ℝ)⁻¹) ^ s ≤ (1 + (x : ℝ)⁻¹) ^ x := pow_le_pow_right₀ hbase hs
      _ ≤ Real.exp 1 := Real.one_add_inv_pow_le_exp
      _ < 3 := Real.exp_one_lt_three
  have hmul := mul_lt_mul_of_pos_right hratio (pow_pos hxR s)
  have he : (1 + (x : ℝ)⁻¹) * (x : ℝ) = (x : ℝ) + 1 := by
    field_simp
  rw [← mul_pow, he] at hmul
  exact_mod_cast hmul

theorem power_exclusion_step_of_exponent_le_base {k s : ℕ} (hk : 0 < k)
    (hs : s ≤ k) (hp : k ^ s < 10 ^ (k - 1)) : (k + 1) ^ s < 10 ^ k := by
  calc
    (k + 1) ^ s < 3 * k ^ s := succ_pow_lt_three_mul_pow hk hs
    _ ≤ 10 * k ^ s := by omega
    _ < 10 * 10 ^ (k - 1) := Nat.mul_lt_mul_of_pos_left hp (by decide)
    _ = 10 ^ k := by rw [← pow_succ', Nat.sub_add_cancel (by omega : 1 ≤ k)]

theorem power_exclusion_above_of_exponent_le_base {K s : ℕ} (hK : 0 < K)
    (hs : s ≤ K) (hp : K ^ s < 10 ^ (K - 1)) {h : ℕ} (hh : K ≤ h) :
    h ^ s < 10 ^ (h - 1) := by
  induction h, hh using Nat.le_induction with
  | base => exact hp
  | succ h hKh ih =>
    simpa using power_exclusion_step_of_exponent_le_base
      (lt_of_lt_of_le hK hKh) (le_trans hs hKh) ih

theorem power_below_digit_lower_of_gap_two_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    h ^ s < 10 ^ (h - 1) := by
  have hupper := ((digitCount_eq_iff hk).mp hc).2
  have hstep1 := succ_pow_lt_three_mul_pow hk hs
  have hstep2 := succ_pow_lt_three_mul_pow (x := k + 1) (s := s) (by omega) (by omega)
  rw [show k + 1 + 1 = k + 2 by omega] at hstep2
  have hbase : (k + 2) ^ s < 10 ^ ((k + 2) - 1) := by
    calc
      (k + 2) ^ s < 9 * k ^ s := by omega
      _ < 9 * 10 ^ k := Nat.mul_lt_mul_of_pos_left hupper (by decide)
      _ ≤ 10 ^ k * 10 := by omega
      _ = 10 ^ ((k + 2) - 1) := by
        rw [show (k + 2) - 1 = k + 1 by omega, pow_succ]
  exact power_exclusion_above_of_exponent_le_base (K := k + 2) (s := s)
    (by omega) (by omega) hbase hh

theorem not_length_compatible_of_gap_two_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    digitCount (h ^ s) ≠ h := by
  intro hcompatible
  have hlow := ((digitCount_eq_iff (by omega : 0 < h)).mp hcompatible).1
  have hhigh := power_below_digit_lower_of_gap_two_of_exponent_le_base hk hs hc hh
  omega

theorem length_compatible_eq_or_succ_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k)
    (hkh : k ≤ h) (hh : digitCount (h ^ s) = h) : h = k ∨ h = k + 1 := by
  have hle : h ≤ k + 1 := by
    by_contra h
    exact not_length_compatible_of_gap_two_of_exponent_le_base hk hs hc (by omega) hh
  omega

#print axioms succ_pow_lt_three_mul_pow
#print axioms power_exclusion_step_of_exponent_le_base
#print axioms power_exclusion_above_of_exponent_le_base
#print axioms power_below_digit_lower_of_gap_two_of_exponent_le_base
#print axioms not_length_compatible_of_gap_two_of_exponent_le_base
#print axioms length_compatible_eq_or_succ_of_exponent_le_base
end OeisA113010
