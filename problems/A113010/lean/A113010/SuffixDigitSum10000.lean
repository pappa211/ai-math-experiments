import A113010.SuffixFinite10000
import A113010.Sparsity

/-! The separate 10001-digit suffix exclusion strengthens the all-size bound. -/
namespace OeisA113010
set_option exponentiation.threshold 10005
set_option maxRecDepth 20000

/-- Length uniqueness reduces the entire 10001-digit case to the already
suffix-excluded representative power. -/
theorem no_fixed_digitCount_10001 {n : ℕ} (hn : a n = n)
    (hk : digitCount n = 10001) : False := by
  have hp := fixed_eq_pow hn
  rw [hk] at hp
  have hb := digit_bounds (fixed_pos hn)
  rw [hk, hp] at hb
  have hc := (digitCount_eq_iff (n := (10001 : ℕ) ^ 2500) (k := 10001)
    (by decide)).mp representative_power_digitCount
  have hs := candidate_exponent_unique (by decide : 10 ≤ 10001) hb hc
  rw [hs] at hp
  exact representative_power_not_fixed (by simpa only [hp] using hn)

theorem fixed_of_digitCount_le_10001 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 10001) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 10000
  · exact fixed_of_digitCount_le_10000 hn hsmall
  · exact (no_fixed_digitCount_10001 hn (by omega)).elim

theorem additional_fixedPoint_ge_ten_pow_10001 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10001 ≤ n := by
  by_contra hbound
  have hk : digitCount n ≤ 10001 :=
    (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr (by omega)
  rcases fixed_of_digitCount_le_10001 hn hk with h | h
  · exact h1 h
  · exact h32 h

theorem pow_2500_below_digit_lower {k : ℕ} (hk : 10002 ≤ k) :
    k ^ 2500 < 10 ^ (k - 1) := by
  exact power_exclusion_above (K := 10002) (s := 2500)
    (by decide) (by decide) (by decide) hk

theorem fixed_of_digitSum_le_2500 {n : ℕ} (hn : a n = n)
    (hs : digitSum n ≤ 2500) : n = 1 ∨ n = 32 := by
  by_cases hk : digitCount n ≤ 10001
  · exact fixed_of_digitCount_le_10001 hn hk
  · have hlarge := pow_2500_below_digit_lower (show 10002 ≤ digitCount n by omega)
    have hlow := (digit_bounds (fixed_pos hn)).1
    have hp : n ≤ digitCount n ^ 2500 := by
      calc
        n = digitCount n ^ digitSum n := fixed_eq_pow hn
        _ ≤ digitCount n ^ 2500 := Nat.pow_le_pow_right (digitCount_pos (fixed_pos hn)) hs
    omega

theorem additional_fixedPoint_digitSum_ge_2501 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 2501 ≤ digitSum n := by
  by_contra hs
  rcases fixed_of_digitSum_le_2500 hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

theorem additional_fixedPoint_nonzeroDigits_ge_278 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 278 ≤ nonzeroDigitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_2501 hn h1 h32
  have hc := digitSum_le_nine_mul_nonzeroDigitCount n
  omega

/-- A consequence of the digit-sum bound and the existing r=4 sparsity
inequality; the extra lengths are not separately enumerated. -/
theorem additional_fixedPoint_digitCount_ge_10005 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10005 ≤ digitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_2501 hn h1 h32
  have hk : 10002 ≤ digitCount n := by
    by_contra h
    rcases fixed_of_digitCount_le_10001 hn (by omega) with h | h
    · exact h1 h
    · exact h32 h
  have hscale := fixed_scaled_digitSum_lt_count (r := 4) hn (by norm_num; omega)
  omega

/-- The corresponding value bound is a consequence of sparsity, not a larger
enumeration of decimal lengths. -/
theorem additional_fixedPoint_ge_ten_pow_10004 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10004 ≤ n := by
  have hk := additional_fixedPoint_digitCount_ge_10005 hn h1 h32
  have hb := (digit_bounds (fixed_pos hn)).1
  exact (Nat.pow_le_pow_right (by decide : 0 < 10)
    (show 10004 ≤ digitCount n - 1 by omega)).trans hb

#print axioms additional_fixedPoint_digitCount_ge_10005
#print axioms additional_fixedPoint_ge_ten_pow_10004
#print axioms no_fixed_digitCount_10001
#print axioms fixed_of_digitCount_le_10001
#print axioms additional_fixedPoint_ge_ten_pow_10001
#print axioms pow_2500_below_digit_lower
#print axioms fixed_of_digitSum_le_2500
#print axioms additional_fixedPoint_digitSum_ge_2501
#print axioms additional_fixedPoint_nonzeroDigits_ge_278
end OeisA113010
