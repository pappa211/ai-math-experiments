import A113010.StrongSparsity
import Mathlib.Data.Nat.Find

/-!
Inverse parameterization of the decimal-length equation. Existence here means
length compatibility only, not the digit-sum equation or a fixed point.
The two-base conclusion is restricted to the range k ≥ 2s.
-/
namespace OeisA113010

set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

theorem digitCount_mono : Monotone digitCount := by
  intro a b hab
  exact Nat.le_length_digits_le 10 a b hab

private theorem digitCount_ten_pow (t : ℕ) : digitCount (10 ^ t) = t + 1 := by
  have hone : digitCount 1 = 1 := by decide
  simpa only [mul_one, hone] using digitCount_ten_pow_mul t (u := 1) (by decide)

private theorem squared_exponent_lt_ten_pow {s : ℕ} (hs : 0 < s) :
    s * s + 1 < 10 ^ s := by
  have htwo : s + 1 ≤ 2 ^ s := by
    have h := Nat.lt_pow_self (n := s) (a := 2) (by decide)
    omega
  calc
    s * s + 1 < (s + 1) ^ 2 := by nlinarith
    _ ≤ (2 ^ s) ^ 2 := Nat.pow_le_pow_left htwo 2
    _ = 4 ^ s := by
      rw [← pow_mul, Nat.mul_comm s 2, pow_mul]
      norm_num
    _ < 10 ^ s := Nat.pow_lt_pow_left (by decide) (by omega)

/-- Every natural exponent at least four admits a nontrivial base whose power
has as many decimal digits as the base. No digit-sum equality is asserted. -/
theorem exists_length_compatible_base {s : ℕ} (hs : 4 ≤ s) :
    ∃ k : ℕ, 2 ≤ k ∧ digitCount (k ^ s) = k := by
  classical
  have hstart : 2 ≤ digitCount ((2 : ℕ) ^ s) := by
    have hpow : (2 : ℕ) ^ 4 ≤ 2 ^ s := Nat.pow_le_pow_right (by decide) hs
    have hmono := digitCount_mono hpow
    have hsmall : digitCount ((2 : ℕ) ^ 4) = 2 := by decide
    omega
  have hK : 2 ≤ 10 ^ s := by
    have h := Nat.pow_le_pow_right (by decide : 0 < 10) (show 1 ≤ s by omega)
    norm_num at h
    omega
  have hupper : digitCount ((10 ^ s) ^ s) ≤ 10 ^ s := by
    rw [← pow_mul, digitCount_ten_pow]
    exact le_of_lt (squared_exponent_lt_ten_pow (by omega))
  have hex : ∃ k : ℕ, 2 ≤ k ∧ digitCount (k ^ s) ≤ k :=
    ⟨10 ^ s, hK, hupper⟩
  let k := Nat.find hex
  have hk : 2 ≤ k ∧ digitCount (k ^ s) ≤ k := Nat.find_spec hex
  refine ⟨k, hk.1, Nat.le_antisymm hk.2 ?_⟩
  by_cases hk2 : k = 2
  · simpa only [hk2] using hstart
  · have hpred : 2 ≤ k - 1 := by omega
    have hnot : ¬ (2 ≤ k - 1 ∧ digitCount ((k - 1) ^ s) ≤ k - 1) :=
      Nat.find_min hex (show k - 1 < k by omega)
    have hlower : k ≤ digitCount ((k - 1) ^ s) := by omega
    have hmono : digitCount ((k - 1) ^ s) ≤ digitCount (k ^ s) :=
      digitCount_mono (Nat.pow_le_pow_left (Nat.sub_le k 1) s)
    exact le_trans hlower hmono

/-- Two successor steps put the power below its decimal-length interval, after
which the existing propagation theorem excludes every larger base. -/
theorem power_below_digit_lower_of_gap_two {k s h : ℕ} (hk : 0 < k)
    (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    h ^ s < 10 ^ (h - 1) := by
  have hupper : k ^ s < 10 ^ k := ((digitCount_eq_iff hk).mp hcount).2
  have hstep1 := succ_pow_lt_two_mul_pow (x := k) (s := s) hk hs
  have hstep2 := succ_pow_lt_two_mul_pow (x := k + 1) (s := s)
    (by omega) (by omega)
  have headd : k + 1 + 1 = k + 2 := by omega
  rw [headd] at hstep2
  have hbase : (k + 2) ^ s < 10 ^ ((k + 2) - 1) := by
    calc
      (k + 2) ^ s < 4 * k ^ s := by omega
      _ < 4 * 10 ^ k := Nat.mul_lt_mul_of_pos_left hupper (by decide)
      _ ≤ 10 ^ k * 10 := by omega
      _ = 10 ^ ((k + 2) - 1) := by
        rw [show (k + 2) - 1 = k + 1 by omega, pow_succ]
  exact power_exclusion_above (K := k + 2) (s := s)
    (by omega) (by omega) hbase hh

/-- A length-compatible base in the k≥2s range excludes a gap of two or more. -/
theorem not_length_compatible_of_gap_two {k s h : ℕ} (hk : 0 < k)
    (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    digitCount (h ^ s) ≠ h := by
  intro hcompatible
  have hlow := ((digitCount_eq_iff (by omega : 0 < h)).mp hcompatible).1
  have hhigh := power_below_digit_lower_of_gap_two hk hs hcount hh
  omega

/-- Every length-compatible base at or above such a k is k or its successor.
This conclusion does not apply without the 2s≤k hypothesis. -/
theorem length_compatible_eq_or_succ {k s h : ℕ} (hk : 0 < k)
    (hs : 2 * s ≤ k) (hcount : digitCount (k ^ s) = k)
    (hkh : k ≤ h) (hcompatible : digitCount (h ^ s) = h) :
    h = k ∨ h = k + 1 := by
  have hle : h ≤ k + 1 := by
    by_contra hh
    exact not_length_compatible_of_gap_two hk hs hcount (by omega) hcompatible
  omega

/-- Once an additional fixed point is chosen, an ordered fixed point of the
same digit sum can have only its digit count or the next digit count. -/
theorem additional_fixedPoint_count_eq_or_succ {n m : ℕ}
    (hn : a n = n) (h1 : n ≠ 1) (h32 : n ≠ 32) (hm : a m = m)
    (hs : digitSum m = digitSum n) (hcount : digitCount n ≤ digitCount m) :
    digitCount m = digitCount n ∨ digitCount m = digitCount n + 1 := by
  have hk := additional_fixedPoint_digitCount_ge_10005 hn h1 h32
  have hscale := fixed_scaled_digitSum_lt_count (r := 4) hn (by norm_num; omega)
  have hnlength : digitCount (digitCount n ^ digitSum n) = digitCount n := by
    rw [← fixed_eq_pow hn]
  have hmlength : digitCount (digitCount m ^ digitSum n) = digitCount m := by
    rw [← hs, ← fixed_eq_pow hm]
  exact length_compatible_eq_or_succ (by omega) (by omega) hnlength hcount hmlength

/-- At each fixed digit sum, the digit-count bases of all hypothetical
additional fixed points lie in one pair of consecutive natural numbers.
The quantified set may be empty; this does not assert an additional point. -/
theorem additional_fixedPoint_digitCounts_two_consecutive (s : ℕ) :
    ∃ K : ℕ, ∀ n : ℕ, a n = n → n ≠ 1 → n ≠ 32 → digitSum n = s →
      digitCount n = K ∨ digitCount n = K + 1 := by
  classical
  let P := fun k : ℕ => ∃ n : ℕ,
    a n = n ∧ n ≠ 1 ∧ n ≠ 32 ∧ digitSum n = s ∧ digitCount n = k
  by_cases hex : ∃ k, P k
  · let K := Nat.find hex
    obtain ⟨m, hm, hm1, hm32, hms, hmK⟩ := Nat.find_spec hex
    refine ⟨K, ?_⟩
    intro n hn hn1 hn32 hns
    have hKn : K ≤ digitCount n :=
      Nat.find_min' hex (show P (digitCount n) from ⟨n, hn, hn1, hn32, hns, rfl⟩)
    have hmn : digitCount m ≤ digitCount n := by change digitCount m = K at hmK; omega
    have hp := additional_fixedPoint_count_eq_or_succ hm hm1 hm32 hn
      (hns.trans hms.symm) hmn
    change digitCount m = K at hmK
    simpa only [hmK] using hp
  · refine ⟨0, ?_⟩
    intro n hn hn1 hn32 hns
    exact (hex ⟨digitCount n, n, hn, hn1, hn32, hns, rfl⟩).elim

/-- At each fixed digit sum, all fixed points lie in a set containing at most
two natural numbers. The witnesses need not themselves be fixed points. -/
theorem fixedPoints_per_digitSum_at_most_two (s : ℕ) :
    ∃ u v : ℕ, ∀ n : ℕ, a n = n → digitSum n = s → n = u ∨ n = v := by
  by_cases hs : s ≤ 2500
  · refine ⟨1, 32, ?_⟩
    intro n hn hns
    exact fixed_of_digitSum_le_2500 hn (by omega)
  · obtain ⟨K, hK⟩ := additional_fixedPoint_digitCounts_two_consecutive s
    refine ⟨K ^ s, (K + 1) ^ s, ?_⟩
    intro n hn hns
    have hsum1 : digitSum 1 = 1 := by decide
    have hsum32 : digitSum 32 = 5 := by decide
    have hn1 : n ≠ 1 := by
      intro h
      rw [h, hsum1] at hns
      omega
    have hn32 : n ≠ 32 := by
      intro h
      rw [h, hsum32] at hns
      omega
    rcases hK n hn hn1 hn32 hns with hc | hc
    · left
      simpa only [hc, hns] using fixed_eq_pow hn
    · right
      simpa only [hc, hns] using fixed_eq_pow hn

#print axioms fixedPoints_per_digitSum_at_most_two
#print axioms digitCount_mono
#print axioms digitCount_ten_pow
#print axioms squared_exponent_lt_ten_pow
#print axioms exists_length_compatible_base
#print axioms power_below_digit_lower_of_gap_two
#print axioms not_length_compatible_of_gap_two
#print axioms length_compatible_eq_or_succ
#print axioms additional_fixedPoint_count_eq_or_succ
#print axioms additional_fixedPoint_digitCounts_two_consecutive
end OeisA113010
