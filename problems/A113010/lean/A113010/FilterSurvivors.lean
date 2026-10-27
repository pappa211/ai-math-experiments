import A113010.TrailingZeros

/-!
An unbounded family passing the exact decimal-length and mod-nine filters.
These are necessary-condition survivors, not claimed fixed points.
-/
namespace OeisA113010

/-- A denominator-cleared Bernoulli inequality, proved in natural numbers. -/
theorem reciprocal_bernoulli_nat (x s : ℕ) :
    (x + 1) ^ s * (x + 1 - s) ≤ (x + 1) * x ^ s := by
  induction s with
  | zero => simp
  | succ s ih =>
    by_cases hs : s + 1 ≤ x + 1
    · have hsub : x + 1 - s = (x + 1 - (s + 1)) + 1 := by omega
      have hle : x + 1 - (s + 1) ≤ x := by omega
      have hprod : (x + 1) * (x + 1 - (s + 1)) ≤ x * (x + 1 - s) := by
        rw [hsub]
        nlinarith
      calc
        (x + 1) ^ (s + 1) * (x + 1 - (s + 1)) =
            (x + 1) ^ s * ((x + 1) * (x + 1 - (s + 1))) := by rw [pow_succ]; ring
        _ ≤ (x + 1) ^ s * (x * (x + 1 - s)) := Nat.mul_le_mul_left _ hprod
        _ = ((x + 1) ^ s * (x + 1 - s)) * x := by ring
        _ ≤ ((x + 1) * x ^ s) * x := Nat.mul_le_mul_right x ih
        _ = (x + 1) * x ^ (s + 1) := by rw [pow_succ]; ring
    · have hz : x + 1 - (s + 1) = 0 := by omega
      simp [hz]

/-- In the sparse-exponent range, increasing the base by one multiplies the
power by less than two. -/
theorem succ_pow_lt_two_mul_pow {x s : ℕ} (hx : 0 < x) (hs : 2 * s ≤ x) :
    (x + 1) ^ s < 2 * x ^ s := by
  have hq : x + 1 < 2 * (x + 1 - s) := by omega
  have hb := reciprocal_bernoulli_nat x s
  have hm := Nat.mul_lt_mul_of_pos_right hq (Nat.pow_pos hx : 0 < x ^ s)
  by_contra hbad
  have hge : 2 * x ^ s ≤ (x + 1) ^ s := by omega
  have hp := Nat.mul_le_mul_right (x + 1 - s) hge
  nlinarith

/-- Parameterized exact-length survivor lemma. No real logarithms or
asymptotic assumptions are used. -/
theorem digitCount_succ_power_eq {t x s : ℕ} (ht : 2 ≤ t)
    (hx : x = 10 ^ t) (hprod : t * s = x) :
    digitCount ((x + 1) ^ s) = x + 1 := by
  have hxpos : 0 < x := by rw [hx]; exact Nat.pow_pos (by decide)
  have hsbound : 2 * s ≤ x := by nlinarith
  have hp : x ^ s = 10 ^ x := by
    calc
      x ^ s = (10 ^ t) ^ s := congrArg (fun z : ℕ => z ^ s) hx
      _ = 10 ^ (t * s) := (pow_mul 10 t s).symm
      _ = 10 ^ x := congrArg (fun z : ℕ => 10 ^ z) hprod
  apply (digitCount_eq_iff (by omega : 0 < x + 1)).mpr
  constructor
  · simpa [← hp] using (Nat.pow_le_pow_left (Nat.le_succ x) s)
  · calc
      (x + 1) ^ s < 2 * x ^ s := succ_pow_lt_two_mul_pow hxpos hsbound
      _ = 2 * 10 ^ x := by rw [hp]
      _ ≤ 10 ^ x * 10 := by omega
      _ = 10 ^ (x + 1) := (pow_succ 10 x).symm

def survivorT (j : ℕ) : ℕ := 4 * 10 ^ j

def survivorX (j : ℕ) : ℕ := 10 ^ survivorT j

def survivorK (j : ℕ) : ℕ := survivorX j + 1

def survivorS (j : ℕ) : ℕ := 25 * 10 ^ (survivorT j - j - 2)

theorem survivorT_lower (j : ℕ) : j + 4 ≤ survivorT j := by
  have hp : j < 10 ^ j := Nat.lt_pow_self (by decide)
  dsimp [survivorT]
  omega

theorem survivor_exponent_identity (j : ℕ) : survivorT j * survivorS j = survivorX j := by
  have ht := survivorT_lower j
  have he : j + (survivorT j - j - 2) + 2 = survivorT j := by omega
  calc
    survivorT j * survivorS j =
        10 ^ j * 10 ^ (survivorT j - j - 2) * 10 ^ 2 := by
      dsimp [survivorT, survivorS]
      ring
    _ = 10 ^ (j + (survivorT j - j - 2) + 2) := by rw [pow_add, pow_add]
    _ = survivorX j := by rw [he]; rfl

theorem survivor_length (j : ℕ) :
    digitCount (survivorK j ^ survivorS j) = survivorK j := by
  apply digitCount_succ_power_eq (t := survivorT j)
  · have := survivorT_lower j
    omega
  · rfl
  · exact survivor_exponent_identity j

theorem ten_pow_succ_mod_six (e : ℕ) : 10 ^ (e + 1) % 6 = 4 := by
  induction e with
  | zero => decide
  | succ e ih =>
    rw [pow_succ, Nat.mul_mod, ih]

theorem survivorS_mod_six (j : ℕ) : survivorS j % 6 = 4 := by
  have ht := survivorT_lower j
  have he : survivorT j - j - 2 = (survivorT j - j - 3) + 1 := by omega
  dsimp [survivorS]
  rw [he, Nat.mul_mod, ten_pow_succ_mod_six]

theorem survivorS_mod_nine (j : ℕ) : survivorS j % 9 = 7 := by
  simp [survivorS, Nat.mul_mod, Nat.pow_mod]

theorem survivorK_mod_nine (j : ℕ) : survivorK j % 9 = 2 := by
  simp [survivorK, survivorX, Nat.add_mod, Nat.pow_mod]

theorem two_pow_mod_nine_of_mod_six {s : ℕ} (hs : s % 6 = 4) : 2 ^ s % 9 = 7 := by
  have he : s = 6 * (s / 6) + 4 := by have := Nat.mod_add_div s 6; omega
  conv_lhs => rw [he]
  simp [pow_add, pow_mul, Nat.mul_mod, Nat.pow_mod]

theorem survivor_mod_nine (j : ℕ) :
    (survivorK j ^ survivorS j) % 9 = survivorS j % 9 := by
  rw [Nat.pow_mod, survivorK_mod_nine, survivorS_mod_nine]
  exact two_pow_mod_nine_of_mod_six (survivorS_mod_six j)

theorem survivorS_pos (j : ℕ) : 0 < survivorS j := by
  exact Nat.mul_pos (by decide) (Nat.pow_pos (by decide))

theorem survivorK_gt_index (j : ℕ) : j < survivorK j := by
  have ht := survivorT_lower j
  have hx : survivorT j < 10 ^ survivorT j := Nat.lt_pow_self (by decide)
  dsimp [survivorK, survivorX]
  omega

/-- Length and mod-nine tests alone have unbounded simultaneous survivors. -/
theorem length_mod_nine_survivors_unbounded (B : ℕ) :
    ∃ k s : ℕ, B < k ∧ 0 < s ∧ digitCount (k ^ s) = k ∧ k ^ s % 9 = s % 9 := by
  exact ⟨survivorK B, survivorS B, survivorK_gt_index B, survivorS_pos B,
    survivor_length B, survivor_mod_nine B⟩

theorem digitSum_ten_pow_add_one {t : ℕ} (ht : 0 < t) :
    digitSum (10 ^ t + 1) = 2 := by
  have hone : Nat.digits 10 1 = [1] := by decide
  have hlength : (Nat.digits 10 1).length + (t - 1) = t := by rw [hone]; simp; omega
  have hd := Nat.digits_append_zeroes_append_digits (b := 10) (k := t - 1)
    (m := 1) (n := 1) (by decide) (by decide)
  have hnum : 1 + 10 ^ ((Nat.digits 10 1).length + (t - 1)) * 1 = 10 ^ t + 1 := by
    rw [hlength]
    omega
  rw [hnum] at hd
  have hs := congrArg List.sum hd
  simpa [digitSum, hone] using hs.symm

theorem survivorK_digitSum (j : ℕ) : digitSum (survivorK j) = 2 := by
  apply digitSum_ten_pow_add_one
  have := survivorT_lower j
  omega

theorem survivorK_mod_ten (j : ℕ) : survivorK j % 10 = 1 := by
  have ht := survivorT_lower j
  have he : (survivorT j - 1) + 1 = survivorT j := by omega
  change (10 ^ survivorT j + 1) % 10 = 1
  rw [← he]
  simp [pow_succ, Nat.add_mod]

theorem survivorK_gcd_ten (j : ℕ) : Nat.gcd (survivorK j) 10 = 1 := by
  rw [Nat.gcd_comm (survivorK j) 10, Nat.gcd_rec 10 (survivorK j), survivorK_mod_ten]
  decide

/-- Even after restricting to digit-count bases coprime to ten and of digit sum
two, exact length and mod-nine compatibility have unbounded survivors. -/
theorem sparse_coprime_filter_survivors_unbounded (B : ℕ) :
    ∃ k s : ℕ, B < k ∧ 0 < s ∧ digitCount (k ^ s) = k ∧
      k ^ s % 9 = s % 9 ∧ digitSum k = 2 ∧ Nat.gcd k 10 = 1 := by
  exact ⟨survivorK B, survivorS B, survivorK_gt_index B, survivorS_pos B,
    survivor_length B, survivor_mod_nine B, survivorK_digitSum B, survivorK_gcd_ten B⟩

#print axioms digitCount_succ_power_eq
#print axioms survivor_length
#print axioms survivor_mod_nine
#print axioms length_mod_nine_survivors_unbounded
#print axioms sparse_coprime_filter_survivors_unbounded

end OeisA113010
