import A113010.DigitSumBound

/-! Necessary sparsity conditions only. Neither frozen target is proved. -/
namespace OeisA113010

/-- A fixed point whose decimal length is at least 10^r must have digit sum
strictly less than its length divided by r (expressed without division). -/
theorem fixed_scaled_digitSum_lt_count {n r : ℕ} (hn : a n = n)
    (hr : 10 ^ r ≤ digitCount n) : r * digitSum n < digitCount n := by
  apply (Nat.pow_lt_pow_iff_right (by decide : 1 < 10)).mp
  calc
    10 ^ (r * digitSum n) = (10 ^ r) ^ digitSum n := pow_mul 10 r (digitSum n)
    _ ≤ digitCount n ^ digitSum n := Nat.pow_le_pow_left hr _
    _ = n := (fixed_eq_pow hn).symm
    _ < 10 ^ digitCount n := (digit_bounds (fixed_pos hn)).2

theorem nonzeroDigitCount_le_digitSum (n : ℕ) : nonzeroDigitCount n ≤ digitSum n := by
  have aux : ∀ L : List ℕ, L.countP (fun d => decide (d ≠ 0)) ≤ L.sum := by
    intro L
    induction L with
    | nil => simp
    | cons x xs ih =>
      by_cases hx : x = 0
      · simpa [hx] using ih
      · have ht : decide (x ≠ 0) = true := decide_eq_true hx
        simp only [List.countP_cons, List.sum_cons, ht, ite_true]
        omega
  exact aux _

def zeroDigitCount (n : ℕ) : ℕ :=
  (Nat.digits 10 n).countP (fun d => decide (d = 0))

theorem digitCount_partition (n : ℕ) :
    nonzeroDigitCount n + zeroDigitCount n = digitCount n := by
  simpa [nonzeroDigitCount, zeroDigitCount, digitCount] using
    (List.length_eq_countP_add_countP (fun d : ℕ => decide (d ≠ 0))
      (l := Nat.digits 10 n)).symm

theorem additional_fixedPoint_digitCount_ge_1001 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 1001 ≤ digitCount n := by
  by_contra hk
  rcases fixed_of_digitCount_le_1000 hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

/-- More than two thirds of all decimal positions of an additional fixed point
would have to be zero. This is necessary, not a contradiction. -/
theorem additional_fixedPoint_zero_majority {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 2 * digitCount n < 3 * zeroDigitCount n := by
  have hk := additional_fixedPoint_digitCount_ge_1001 hn h1 h32
  have hs := fixed_scaled_digitSum_lt_count (r := 3) hn (by norm_num; omega)
  have hc := nonzeroDigitCount_le_digitSum n
  have hp := digitCount_partition n
  omega

#print axioms fixed_scaled_digitSum_lt_count
#print axioms additional_fixedPoint_zero_majority
end OeisA113010
