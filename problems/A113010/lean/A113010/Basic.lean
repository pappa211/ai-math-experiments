import A113010.Definition
import Mathlib.Data.Nat.Digits.Lemmas
import Lean.Elab.Tactic.Omega
import Mathlib.Tactic.NormNum

/-!
Elementary reductions for the unchanged A113010 definition.
These are intermediate results, not a proof of either frozen target.
-/
namespace OeisA113010

def digitCount (n : ℕ) : ℕ := (Nat.digits 10 n).length

def digitSum (n : ℕ) : ℕ := (Nat.digits 10 n).sum

theorem fixed_eq_pow {n : ℕ} (h : a n = n) :
    n = digitCount n ^ digitSum n := h.symm

theorem fixed_pos {n : ℕ} (h : a n = n) : 0 < n := by
  by_contra hn
  have hn0 : n = 0 := by omega
  subst n
  have hz : a 0 = 1 := by decide
  omega

theorem digitCount_pos {n : ℕ} (hn : 0 < n) : 0 < digitCount n := by
  simp [digitCount, Nat.length_digits 10 n (by decide) (by omega)]

theorem digit_bounds {n : ℕ} (hn : 0 < n) :
    10 ^ (digitCount n - 1) ≤ n ∧ n < 10 ^ digitCount n := by
  constructor
  · apply (Nat.lt_digits_length_iff (by decide : 1 < 10) n).mp
    change digitCount n - 1 < digitCount n
    have := digitCount_pos hn
    omega
  · exact Nat.lt_base_pow_length_digits (by decide)

theorem digitCount_eq_iff {n k : ℕ} (hk : 0 < k) :
    digitCount n = k ↔ 10 ^ (k - 1) ≤ n ∧ n < 10 ^ k := by
  rw [← Nat.lt_digits_length_iff (by decide : 1 < 10) n,
    ← Nat.digits_length_le_iff (by decide : 1 < 10) n]
  change digitCount n = k ↔ k - 1 < digitCount n ∧ digitCount n ≤ k
  omega

theorem fixed_digitSum_pos {n : ℕ} (h : a n = n) : 0 < digitSum n := by
  by_contra hs
  have hs0 : digitSum n = 0 := by omega
  have hn1 : n = 1 := by simpa [hs0] using fixed_eq_pow h
  subst n
  have : digitSum 1 = 1 := by decide
  omega

theorem digitSum_le_nine_mul_digitCount (n : ℕ) :
    digitSum n ≤ 9 * digitCount n := by
  have aux : ∀ L : List ℕ, (∀ x ∈ L, x ≤ 9) → L.sum ≤ 9 * L.length := by
    intro L
    induction L with
    | nil => simp
    | cons x xs ih =>
      intro h
      have hx : x ≤ 9 := h x (by simp)
      have hxs : xs.sum ≤ 9 * xs.length := ih (fun y hy => h y (by simp [hy]))
      simp only [List.sum_cons, List.length_cons]
      omega
  exact aux _ (fun x hx => by have := Nat.digits_lt_base (by decide : 1 < 10) hx; omega)

theorem digitSum_mod_nine (n : ℕ) : n % 9 = digitSum n % 9 :=
  Nat.modEq_digits_sum 9 10 (by decide) n

theorem fixed_reduction {n : ℕ} (h : a n = n) :
    0 < n ∧ 0 < digitCount n ∧ 0 < digitSum n ∧
    n = digitCount n ^ digitSum n ∧
    10 ^ (digitCount n - 1) ≤ digitCount n ^ digitSum n ∧
    digitCount n ^ digitSum n < 10 ^ digitCount n ∧
    digitSum n ≤ 9 * digitCount n ∧
    (digitCount n ^ digitSum n) % 9 = digitSum n % 9 := by
  have hn := fixed_pos h
  have he := fixed_eq_pow h
  have hb := digit_bounds hn
  refine ⟨hn, digitCount_pos hn, fixed_digitSum_pos h, he, ?_, ?_,
    digitSum_le_nine_mul_digitCount n, ?_⟩
  · simpa [← he] using hb.1
  · simpa [← he] using hb.2
  · simpa [← he] using digitSum_mod_nine n

/-- For each decimal length at least ten, at most one exponent has that length. -/
theorem candidate_exponent_unique {k s t : ℕ} (hk : 10 ≤ k)
    (hs : 10 ^ (k - 1) ≤ k ^ s ∧ k ^ s < 10 ^ k)
    (ht : 10 ^ (k - 1) ≤ k ^ t ∧ k ^ t < 10 ^ k) : s = t := by
  have step : ∀ u v : ℕ, u < v → 10 ^ (k - 1) ≤ k ^ u → 10 ^ k ≤ k ^ v := by
    intro u v huv hu
    calc
      10 ^ k = 10 ^ (k - 1) * 10 := by
        rw [← pow_succ, Nat.sub_add_cancel (by omega : 1 ≤ k)]
      _ ≤ k ^ u * k := Nat.mul_le_mul hu hk
      _ = k ^ (u + 1) := (pow_succ k u).symm
      _ ≤ k ^ v := Nat.pow_le_pow_right (by omega) (by omega)
  rcases lt_trichotomy s t with hst | hst | hts
  · have := step s t hst hs.1
    omega
  · exact hst
  · have := step t s hts ht.1
    omega

/-- A candidate exponent is smaller than its base once the base is at least ten. -/
theorem candidate_exponent_lt_base {k s : ℕ} (hk : 10 ≤ k)
    (hs : k ^ s < 10 ^ k) : s < k := by
  by_contra hsk
  have hks : k ≤ s := by omega
  have h1 : 10 ^ k ≤ k ^ k := Nat.pow_le_pow_left hk k
  have h2 : k ^ k ≤ k ^ s := Nat.pow_le_pow_right (by omega) hks
  omega

theorem fixed_digitSum_lt_digitCount {n : ℕ} (h : a n = n)
    (hk : 10 ≤ digitCount n) : digitSum n < digitCount n := by
  apply candidate_exponent_lt_base hk
  simpa [← fixed_eq_pow h] using (digit_bounds (fixed_pos h)).2

/-- The known fixed points exhaust the one- and two-digit cases. -/
theorem fixed_of_digitCount_le_two {n : ℕ} (h : a n = n)
    (hk : digitCount n ≤ 2) : n = 1 ∨ n = 32 := by
  have hkpos := digitCount_pos (fixed_pos h)
  have he := fixed_eq_pow h
  rcases (show digitCount n = 1 ∨ digitCount n = 2 by omega) with hk1 | hk2
  · left
    simpa [hk1] using he
  · have hb := digit_bounds (fixed_pos h)
    rw [hk2] at hb he
    norm_num at hb
    have hslo : 4 ≤ digitSum n := by
      by_contra hh
      have hp := Nat.pow_le_pow_right (by decide : 0 < 2)
        (show digitSum n ≤ 3 by omega)
      norm_num at hp
      omega
    have hshi : digitSum n ≤ 6 := by
      by_contra hh
      have hp := Nat.pow_le_pow_right (by decide : 0 < 2)
        (show 7 ≤ digitSum n by omega)
      norm_num at hp
      omega
    rcases (show digitSum n = 4 ∨ digitSum n = 5 ∨ digitSum n = 6 by omega) with hs | hs | hs
    · have hn : n = 16 := by simpa [hs] using he
      subst n
      have hh : a 16 ≠ 16 := by decide
      exact (hh h).elim
    · right
      simpa [hs] using he
    · have hn : n = 64 := by simpa [hs] using he
      subst n
      have hh : a 64 ≠ 64 := by decide
      exact (hh h).elim

theorem fixed_below_hundred {n : ℕ} (h : a n = n) (hn : n < 100) :
    n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_two h
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hn

#print axioms fixed_reduction
#print axioms candidate_exponent_unique
#print axioms fixed_of_digitCount_le_two

end OeisA113010
