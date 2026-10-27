import A113010.Finite
import A113010.FilterSurvivors

/-! All-size necessary lower bounds for hypothetical additional fixed points.
The finite 1000-digit result is combined with a uniform propagation lemma.
Neither frozen target is resolved. -/
namespace OeisA113010

/-- Once k is at least twice the exponent, falling below the k-digit interval
persists at the next base. -/
theorem power_exclusion_step {k s : ℕ} (hk : 0 < k) (hs : 2 * s ≤ k)
    (hp : k ^ s < 10 ^ (k - 1)) : (k + 1) ^ s < 10 ^ k := by
  calc
    (k + 1) ^ s < 2 * k ^ s := succ_pow_lt_two_mul_pow hk hs
    _ ≤ 10 * k ^ s := by omega
    _ < 10 * 10 ^ (k - 1) := Nat.mul_lt_mul_of_pos_left hp (by decide)
    _ = 10 ^ k := by
      rw [← pow_succ', Nat.sub_add_cancel (by omega : 1 ≤ k)]

/-- A single exact starting bound extends to every larger digit-count base. -/
theorem power_exclusion_above {K s : ℕ} (hK : 0 < K) (hs : 2 * s ≤ K)
    (hbase : K ^ s < 10 ^ (K - 1)) {k : ℕ} (hk : K ≤ k) :
    k ^ s < 10 ^ (k - 1) := by
  induction k, hk using Nat.le_induction with
  | base => exact hbase
  | succ k hki ih =>
    simpa using power_exclusion_step (lt_of_lt_of_le hK hki) (le_trans hs hki) ih

set_option exponentiation.threshold 2000
set_option maxRecDepth 20000 in
theorem pow_333_below_digit_lower {k : ℕ} (hk : 1001 ≤ k) :
    k ^ 333 < 10 ^ (k - 1) := by
  exact power_exclusion_above (K := 1001) (s := 333) (by decide) (by decide) (by decide) hk

/-- No additional fixed point, however large, can have digit sum at most 333. -/
theorem fixed_of_digitSum_le_333 {n : ℕ} (hn : a n = n) (hs : digitSum n ≤ 333) :
    n = 1 ∨ n = 32 := by
  by_cases hk : digitCount n ≤ 1000
  · exact fixed_of_digitCount_le_1000 hn hk
  · have hlarge := pow_333_below_digit_lower (show 1001 ≤ digitCount n by omega)
    have hlow := (digit_bounds (fixed_pos hn)).1
    have hp : n ≤ digitCount n ^ 333 := by
      calc
        n = digitCount n ^ digitSum n := fixed_eq_pow hn
        _ ≤ digitCount n ^ 333 := Nat.pow_le_pow_right (digitCount_pos (fixed_pos hn)) hs
    omega

theorem additional_fixedPoint_digitSum_ge_334 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 334 ≤ digitSum n := by
  by_contra hs
  rcases fixed_of_digitSum_le_333 hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

/-- Number of nonzero entries in the canonical decimal digit list. -/
def nonzeroDigitCount (n : ℕ) : ℕ :=
  (Nat.digits 10 n).countP (fun d => decide (d ≠ 0))

theorem digitSum_le_nine_mul_nonzeroDigitCount (n : ℕ) :
    digitSum n ≤ 9 * nonzeroDigitCount n := by
  have aux : ∀ L : List ℕ, (∀ x ∈ L, x ≤ 9) →
      L.sum ≤ 9 * L.countP (fun d => decide (d ≠ 0)) := by
    intro L
    induction L with
    | nil => simp
    | cons x xs ih =>
      intro h
      have hx : x ≤ 9 := h x (by simp)
      have hxs := ih (fun y hy => h y (by simp [hy]))
      by_cases hz : x = 0
      · simpa [hz] using hxs
      · have htrue : decide (x ≠ 0) = true := decide_eq_true hz
        simp only [List.sum_cons, List.countP_cons, htrue, ite_true]
        omega
  exact aux _ (fun x hx => by have := Nat.digits_lt_base (by decide : 1 < 10) hx; omega)

theorem additional_fixedPoint_nonzeroDigits_ge_38 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 38 ≤ nonzeroDigitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_334 hn h1 h32
  have hc := digitSum_le_nine_mul_nonzeroDigitCount n
  omega

#print axioms power_exclusion_above
#print axioms fixed_of_digitSum_le_333
#print axioms additional_fixedPoint_digitSum_ge_334
#print axioms additional_fixedPoint_nonzeroDigits_ge_38

end OeisA113010
