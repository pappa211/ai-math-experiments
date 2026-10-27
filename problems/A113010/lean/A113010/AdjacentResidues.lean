import A113010.InverseLength

/-! A residue refinement of the two-base restriction. Neither frozen target is proved.
-/
namespace OeisA113010

set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

private theorem pow_twenty_mod_nine_table :
    ∀ k : Fin 9, k.val ^ 20 % 9 = k.val ^ 2 % 9 := by decide

private theorem pow_twenty_mod_nine (k : ℕ) : k ^ 20 % 9 = k ^ 2 % 9 := by
  calc
    k ^ 20 % 9 = (k % 9) ^ 20 % 9 := Nat.pow_mod k 20 9
    _ = (k % 9) ^ 2 % 9 := pow_twenty_mod_nine_table ⟨k % 9, Nat.mod_lt k (by decide)⟩
    _ = k ^ 2 % 9 := (Nat.pow_mod k 2 9).symm

private theorem pow_mod_nine_period_shift (k t : ℕ) :
    k ^ (t + 2 + 18) % 9 = k ^ (t + 2) % 9 := by
  calc
    k ^ (t + 2 + 18) % 9 = (k ^ t * k ^ 20) % 9 := by
      rw [show t + 2 + 18 = t + 20 by omega, pow_add]
    _ = (k ^ t % 9 * (k ^ 20 % 9)) % 9 := Nat.mul_mod _ _ _
    _ = (k ^ t % 9 * (k ^ 2 % 9)) % 9 := by rw [pow_twenty_mod_nine]
    _ = (k ^ t * k ^ 2) % 9 := (Nat.mul_mod _ _ _).symm
    _ = k ^ (t + 2) % 9 := by rw [pow_add]

private theorem pow_mod_nine_reduce (k t : ℕ) :
    k ^ (t + 2) % 9 = k ^ (t % 18 + 2) % 9 := by
  induction t using Nat.strong_induction_on with
  | h t ih =>
    by_cases ht : t < 18
    · rw [Nat.mod_eq_of_lt ht]
    · have h18 : 18 ≤ t := by omega
      have hlt : t - 18 < t := by omega
      have hp := pow_mod_nine_period_shift k (t - 18)
      rw [show t - 18 + 2 + 18 = t + 2 by omega] at hp
      rw [hp, ih (t - 18) hlt]
      have hm : (t - 18) % 18 = t % 18 := by omega
      rw [hm]

private theorem adjacent_residue_table :
    ∀ r : Fin 9, ∀ e : Fin 18,
      (r.val ^ (e.val + 2) % 9 = (e.val + 2) % 9 ∧
        (r.val + 1) ^ (e.val + 2) % 9 = (e.val + 2) % 9) ↔
      (e.val = 2 ∧ r.val = 4) := by decide

/-- Exact classification of two consecutive bases passing the same positive
exponent's modulo-nine condition. -/
theorem adjacent_power_mod_nine_iff {k s : ℕ} (hs : 0 < s) :
    (k ^ s % 9 = s % 9 ∧ (k + 1) ^ s % 9 = s % 9) ↔
      (s % 18 = 4 ∧ k % 9 = 4) := by
  by_cases hs1 : s = 1
  · subst s
    norm_num
    omega
  · have hs2 : 2 ≤ s := by omega
    let e := (s - 2) % 18
    let r := k % 9
    have he : e < 18 := Nat.mod_lt _ (by decide)
    have hr : r < 9 := Nat.mod_lt _ (by decide)
    have hsum : (e + 2) % 9 = s % 9 := by dsimp [e]; omega
    have hkpow : k ^ s % 9 = r ^ (e + 2) % 9 := by
      have h := pow_mod_nine_reduce k (s - 2)
      rw [show s - 2 + 2 = s by omega] at h
      exact h.trans (Nat.pow_mod k (e + 2) 9)
    have hnext : (k + 1) ^ s % 9 = (r + 1) ^ (e + 2) % 9 := by
      have h := pow_mod_nine_reduce (k + 1) (s - 2)
      rw [show s - 2 + 2 = s by omega] at h
      have hb : (k + 1) % 9 = (r + 1) % 9 := by dsimp [r]; omega
      calc
        (k + 1) ^ s % 9 = (k + 1) ^ (e + 2) % 9 := h
        _ = ((k + 1) % 9) ^ (e + 2) % 9 := Nat.pow_mod _ _ _
        _ = ((r + 1) % 9) ^ (e + 2) % 9 := by rw [hb]
        _ = (r + 1) ^ (e + 2) % 9 := (Nat.pow_mod _ _ _).symm
    have ht : (r ^ (e + 2) % 9 = (e + 2) % 9 ∧
        (r + 1) ^ (e + 2) % 9 = (e + 2) % 9) ↔ (e = 2 ∧ r = 4) :=
      adjacent_residue_table ⟨r, hr⟩ ⟨e, he⟩
    rw [hkpow, hnext, ← hsum, ht]
    dsimp [e, r]
    omega

private theorem ordered_fixed_eq_of_sum_mod_ne_four {n m : ℕ}
    (hn : a n = n) (h1 : n ≠ 1) (h32 : n ≠ 32) (hm : a m = m)
    (hs : digitSum m = digitSum n) (horder : digitCount n ≤ digitCount m)
    (hres : digitSum n % 18 ≠ 4) : m = n := by
  rcases additional_fixedPoint_count_eq_or_succ hn h1 h32 hm hs horder with h | h
  · calc
      m = digitCount m ^ digitSum m := fixed_eq_pow hm
      _ = digitCount n ^ digitSum n := by rw [h, hs]
      _ = n := (fixed_eq_pow hn).symm
  · have hp : digitCount n ^ digitSum n % 9 = digitSum n % 9 := by
      rw [← fixed_eq_pow hn]
      exact digitSum_mod_nine n
    have hq : digitCount m ^ digitSum m % 9 = digitSum m % 9 := by
      rw [← fixed_eq_pow hm]
      exact digitSum_mod_nine m
    rw [h, hs] at hq
    have hc := (adjacent_power_mod_nine_iff (fixed_digitSum_pos hn)).mp ⟨hp, hq⟩
    exact (hres hc.1).elim

/-- Except for sums congruent to four modulo eighteen, a prescribed digit sum
can occur at only one fixed point. This does not assert any new fixed point. -/
theorem fixed_eq_of_same_digitSum_mod_ne_four {n m : ℕ}
    (hn : a n = n) (hm : a m = m) (hs : digitSum m = digitSum n)
    (hres : digitSum n % 18 ≠ 4) : n = m := by
  have hsum1 : digitSum 1 = 1 := by decide
  have hsum32 : digitSum 32 = 5 := by decide
  by_cases hsmall : digitSum n ≤ 2500
  · have hsmallm : digitSum m ≤ 2500 := by omega
    rcases fixed_of_digitSum_le_2500 hn hsmall with hn1 | hn32
    · rcases fixed_of_digitSum_le_2500 hm hsmallm with hm1 | hm32
      · omega
      · rw [hn1, hm32, hsum1, hsum32] at hs
        omega
    · rcases fixed_of_digitSum_le_2500 hm hsmallm with hm1 | hm32
      · rw [hn32, hm1, hsum1, hsum32] at hs
        omega
      · omega
  · have hn1 : n ≠ 1 := by intro h; rw [h, hsum1] at hsmall; omega
    have hn32 : n ≠ 32 := by intro h; rw [h, hsum32] at hsmall; omega
    have hm1 : m ≠ 1 := by intro h; rw [h, hsum1] at hs; omega
    have hm32 : m ≠ 32 := by intro h; rw [h, hsum32] at hs; omega
    rcases le_total (digitCount n) (digitCount m) with horder | horder
    · exact (ordered_fixed_eq_of_sum_mod_ne_four hn hn1 hn32 hm hs horder hres).symm
    · have hresm : digitSum m % 18 ≠ 4 := by simpa only [hs] using hres
      exact ordered_fixed_eq_of_sum_mod_ne_four hm hm1 hm32 hn hs.symm horder hresm

/-- Two distinct fixed points with equal digit sums would force the unique
exceptional exponent residue class. -/
theorem distinct_fixed_same_digitSum_mod_eighteen {n m : ℕ}
    (hn : a n = n) (hm : a m = m) (hs : digitSum m = digitSum n) (hne : n ≠ m) :
    digitSum n % 18 = 4 := by
  by_contra hres
  exact hne (fixed_eq_of_same_digitSum_mod_ne_four hn hm hs hres)

#print axioms adjacent_power_mod_nine_iff
#print axioms fixed_eq_of_same_digitSum_mod_ne_four
#print axioms distinct_fixed_same_digitSum_mod_eighteen
end OeisA113010
