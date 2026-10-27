import A113010.SuffixDigitSum10000

/-! Direct consequences of the checked finite exclusion and scale inequality.
These strengthen necessary conditions; neither frozen target is proved. -/
namespace OeisA113010

theorem additional_fixedPoint_zero_three_quarters {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 3 * digitCount n < 4 * zeroDigitCount n := by
  have hk := additional_fixedPoint_digitCount_ge_10005 hn h1 h32
  have hs := fixed_scaled_digitSum_lt_count (r := 4) hn (by norm_num; omega)
  have hc := nonzeroDigitCount_le_digitSum n
  have hp := digitCount_partition n
  omega

theorem fixed_of_digitCount_le_10004 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 10004) : n = 1 ∨ n = 32 := by
  by_cases h1 : n = 1
  · exact Or.inl h1
  by_cases h32 : n = 32
  · exact Or.inr h32
  have h := additional_fixedPoint_digitCount_ge_10005 hn h1 h32
  omega

theorem fixed_below_ten_pow_10004 {n : ℕ} (hn : a n = n)
    (hbound : n < 10 ^ 10004) : n = 1 ∨ n = 32 := by
  by_cases h1 : n = 1
  · exact Or.inl h1
  by_cases h32 : n = 32
  · exact Or.inr h32
  exact (not_lt_of_ge (additional_fixedPoint_ge_ten_pow_10004 hn h1 h32) hbound).elim

#print axioms additional_fixedPoint_zero_three_quarters
#print axioms fixed_of_digitCount_le_10004
#print axioms fixed_below_ten_pow_10004
end OeisA113010
