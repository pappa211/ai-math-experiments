import A113010.SuffixFinite2000
import A113010.DigitSumBound

/-! All-size necessary bounds obtained from the bounded suffix certificates. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000

theorem pow_605_below_digit_lower {k : ℕ} (hk : 2001 ≤ k) :
    k ^ 605 < 10 ^ (k - 1) := by
  exact power_exclusion_above (K := 2001) (s := 605)
    (by decide) (by decide) (by decide) hk

theorem fixed_of_digitSum_le_605 {n : ℕ} (hn : a n = n)
    (hs : digitSum n ≤ 605) : n = 1 ∨ n = 32 := by
  by_cases hk : digitCount n ≤ 2000
  · exact fixed_of_digitCount_le_2000 hn hk
  · have hlarge := pow_605_below_digit_lower (show 2001 ≤ digitCount n by omega)
    have hlow := (digit_bounds (fixed_pos hn)).1
    have hp : n ≤ digitCount n ^ 605 := by
      calc
        n = digitCount n ^ digitSum n := fixed_eq_pow hn
        _ ≤ digitCount n ^ 605 := Nat.pow_le_pow_right (digitCount_pos (fixed_pos hn)) hs
    omega

theorem additional_fixedPoint_digitSum_ge_606 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 606 ≤ digitSum n := by
  by_contra hs
  rcases fixed_of_digitSum_le_605 hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

theorem additional_fixedPoint_nonzeroDigits_ge_68 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 68 ≤ nonzeroDigitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_606 hn h1 h32
  have hc := digitSum_le_nine_mul_nonzeroDigitCount n
  omega

#print axioms pow_605_below_digit_lower
#print axioms fixed_of_digitSum_le_605
#print axioms additional_fixedPoint_digitSum_ge_606
#print axioms additional_fixedPoint_nonzeroDigits_ge_68
end OeisA113010
