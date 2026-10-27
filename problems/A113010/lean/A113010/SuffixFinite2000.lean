import A113010.SuffixFinite1001_1100
import A113010.SuffixFinite1101_1200
import A113010.SuffixFinite1201_1300
import A113010.SuffixFinite1301_1400
import A113010.SuffixFinite1401_1500
import A113010.SuffixFinite1501_1600
import A113010.SuffixFinite1601_1700
import A113010.SuffixFinite1701_1800
import A113010.SuffixFinite1801_1900
import A113010.SuffixFinite1901_2000

namespace OeisA113010
theorem fixed_of_digitCount_le_2000 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 2000) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 1000
  · exact fixed_of_digitCount_le_1000 hn hsmall
  by_cases h1100 : digitCount n ≤ 1100
  · exact (no_fixed_digitCount_1001_1100 hn (by omega) h1100).elim
  by_cases h1200 : digitCount n ≤ 1200
  · exact (no_fixed_digitCount_1101_1200 hn (by omega) h1200).elim
  by_cases h1300 : digitCount n ≤ 1300
  · exact (no_fixed_digitCount_1201_1300 hn (by omega) h1300).elim
  by_cases h1400 : digitCount n ≤ 1400
  · exact (no_fixed_digitCount_1301_1400 hn (by omega) h1400).elim
  by_cases h1500 : digitCount n ≤ 1500
  · exact (no_fixed_digitCount_1401_1500 hn (by omega) h1500).elim
  by_cases h1600 : digitCount n ≤ 1600
  · exact (no_fixed_digitCount_1501_1600 hn (by omega) h1600).elim
  by_cases h1700 : digitCount n ≤ 1700
  · exact (no_fixed_digitCount_1601_1700 hn (by omega) h1700).elim
  by_cases h1800 : digitCount n ≤ 1800
  · exact (no_fixed_digitCount_1701_1800 hn (by omega) h1800).elim
  by_cases h1900 : digitCount n ≤ 1900
  · exact (no_fixed_digitCount_1801_1900 hn (by omega) h1900).elim
  exact (no_fixed_digitCount_1901_2000 hn (by omega) hk).elim

theorem fixed_below_ten_pow_2000 {n : ℕ} (hn : a n = n)
    (hbound : n < 10 ^ 2000) : n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_2000 hn
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hbound

theorem additional_fixedPoint_ge_ten_pow_2000 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 2000 ≤ n := by
  by_contra hbound
  rcases fixed_below_ten_pow_2000 hn (by omega) with hh | hh
  · exact h1 hh
  · exact h32 hh

#print axioms fixed_of_digitCount_le_2000
#print axioms additional_fixedPoint_ge_ten_pow_2000
end OeisA113010
