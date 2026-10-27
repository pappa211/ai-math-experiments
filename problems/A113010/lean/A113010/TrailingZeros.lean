import A113010.Basic
import Mathlib.Tactic.Linarith

/-! Exact normalization by powers of ten. Intermediate results only. -/
namespace OeisA113010

/-- Multiplication by a power of ten preserves the decimal digit sum. -/
theorem digitSum_ten_pow_mul (t u : ℕ) :
    digitSum (10 ^ t * u) = digitSum u := by
  by_cases hu : u = 0
  · simp [hu]
  · simp [digitSum, Nat.digits_base_pow_mul (by decide : 1 < 10) (by omega : 0 < u)]

/-- The decimal length gains exactly t for a positive input. -/
theorem digitCount_ten_pow_mul (t : ℕ) {u : ℕ} (hu : 0 < u) :
    digitCount (10 ^ t * u) = t + digitCount u := by
  simp [digitCount, Nat.digits_base_pow_mul (by decide : 1 < 10) hu]

theorem digitSum_power_ten_factor (t u s : ℕ) :
    digitSum ((10 ^ t * u) ^ s) = digitSum (u ^ s) := by
  rw [mul_pow, ← pow_mul, digitSum_ten_pow_mul]

theorem digitCount_power_ten_factor (t s : ℕ) {u : ℕ} (hu : 0 < u) :
    digitCount ((10 ^ t * u) ^ s) = t * s + digitCount (u ^ s) := by
  rw [mul_pow, ← pow_mul, digitCount_ten_pow_mul (t * s) (Nat.pow_pos hu)]

/-- Any power-of-ten factorization of a fixed point's digit count gives these
exact equations; no assertion about the remaining factor is assumed. -/
theorem fixed_normalized_equations {n t u : ℕ} (hn : a n = n) (hu : 0 < u)
    (hk : digitCount n = 10 ^ t * u) :
    10 ^ t * u = t * digitSum n + digitCount (u ^ digitSum n) ∧
    digitSum (u ^ digitSum n) = digitSum n := by
  have hp : n = (10 ^ t * u) ^ digitSum n := by simpa [hk] using fixed_eq_pow hn
  have hc := (congrArg digitCount hp).trans (digitCount_power_ten_factor t (digitSum n) hu)
  have hs := (congrArg digitSum hp).trans (digitSum_power_ten_factor t u (digitSum n))
  exact ⟨hk.symm.trans hc, hs.symm⟩

/-- Sufficient normalized equations construct a fixed point of the original
unchanged definition. -/
theorem fixed_of_normalized_parameters {t u s : ℕ} (hu : 0 < u)
    (hc : t * s + digitCount (u ^ s) = 10 ^ t * u)
    (hs : digitSum (u ^ s) = s) : a ((10 ^ t * u) ^ s) = (10 ^ t * u) ^ s := by
  change digitCount ((10 ^ t * u) ^ s) ^ digitSum ((10 ^ t * u) ^ s) = _
  rw [digitCount_power_ten_factor t s hu, digitSum_power_ten_factor, hc, hs]

/-- Exact parameterization; t need not be the maximal power-of-ten factor. -/
theorem fixed_iff_normalized_parameters (n : ℕ) :
    a n = n ↔ ∃ t u s : ℕ, 0 < u ∧ 0 < s ∧
      n = (10 ^ t * u) ^ s ∧
      t * s + digitCount (u ^ s) = 10 ^ t * u ∧ digitSum (u ^ s) = s := by
  constructor
  · intro hn
    refine ⟨0, digitCount n, digitSum n, digitCount_pos (fixed_pos hn),
      fixed_digitSum_pos hn, ?_, ?_, ?_⟩
    · simpa using fixed_eq_pow hn
    · simp [← fixed_eq_pow hn]
    · simp [← fixed_eq_pow hn]
  · rintro ⟨t, u, s, hu, _, hp, hc, hs⟩
    rw [hp]
    exact fixed_of_normalized_parameters hu hc hs

/-- Elementary strict growth used to exclude pure powers of ten as digit counts. -/
theorem succ_lt_ten_pow {t : ℕ} (ht : 0 < t) : t + 1 < 10 ^ t := by
  have hlow : t + 1 ≤ 2 ^ t := Nat.succ_le_of_lt (Nat.lt_pow_self (by decide))
  exact lt_of_le_of_lt hlow (Nat.pow_lt_pow_left (by decide : 2 < 10) (by omega))

/-- No fixed point has decimal length 10, 100, 1000, ... . -/
theorem fixed_digitCount_ne_ten_pow {n t : ℕ} (hn : a n = n) (ht : 0 < t) :
    digitCount n ≠ 10 ^ t := by
  intro hk
  have hh := fixed_normalized_equations (t := t) (u := 1) hn (by decide)
    (by simpa using hk)
  have hsum1 : digitSum 1 = 1 := by decide
  have hcount1 : digitCount 1 = 1 := by decide
  have hs : digitSum n = 1 := by simpa [hsum1] using hh.2.symm
  have hc : 10 ^ t = t + 1 := by simpa [hs, hcount1] using hh.1
  have hg := succ_lt_ten_pow ht
  omega

/-- A weak but uniform lower bound on the decimal length of u^s for u ≥ 2. -/
theorem exponent_lt_four_digitCount_power {u s : ℕ} (hu : 2 ≤ u) :
    s < 4 * digitCount (u ^ s) := by
  have hp : 2 ^ s < 2 ^ (4 * digitCount (u ^ s)) := by
    calc
      2 ^ s ≤ u ^ s := Nat.pow_le_pow_left hu s
      _ < 10 ^ digitCount (u ^ s) := Nat.lt_base_pow_length_digits (by decide)
      _ ≤ (2 ^ 4) ^ digitCount (u ^ s) := Nat.pow_le_pow_left (by decide) _
      _ = 2 ^ (4 * digitCount (u ^ s)) := (pow_mul 2 4 _).symm
  exact (Nat.pow_lt_pow_iff_right (by decide : 1 < 2)).mp hp

theorem linear_lower_bound_ten_pow (h : ℕ) : 1 + 9 * h ≤ 10 ^ h := by
  induction h with
  | zero => decide
  | succ h ih =>
    rw [pow_succ]
    nlinarith

/-- For a fixed remaining factor and exponent, at most one number of appended
zeroes can satisfy the normalized length equation. The digit-sum equation is
not needed for this uniqueness statement. -/
theorem normalized_scale_unique {u s t₁ t₂ : ℕ} (hu : 2 ≤ u)
    (h₁ : 10 ^ t₁ * u = t₁ * s + digitCount (u ^ s))
    (h₂ : 10 ^ t₂ * u = t₂ * s + digitCount (u ^ s)) : t₁ = t₂ := by
  have hsmall := exponent_lt_four_digitCount_power (s := s) hu
  have no_pair : ∀ t h : ℕ, 0 < h →
      10 ^ t * u = t * s + digitCount (u ^ s) →
      10 ^ (t + h) * u = (t + h) * s + digitCount (u ^ s) → False := by
    intro t h hh heq₁ heq₂
    let k := 10 ^ t * u
    have hk : k = t * s + digitCount (u ^ s) := heq₁
    have hkh : k * 10 ^ h = (t + h) * s + digitCount (u ^ s) := by
      calc
        k * 10 ^ h = 10 ^ (t + h) * u := by dsimp [k]; rw [pow_add]; ring
        _ = _ := heq₂
    have hlow := Nat.mul_le_mul_left k (linear_lower_bound_ten_pow h)
    have hcancel : h * (9 * k) ≤ h * s := by nlinarith
    have hs9 : 9 * k ≤ s := Nat.le_of_mul_le_mul_left hcancel hh
    have hD : digitCount (u ^ s) ≤ k := by omega
    omega
  rcases lt_trichotomy t₁ t₂ with hlt | heq | hgt
  · have he : t₁ + (t₂ - t₁) = t₂ := by omega
    exact (no_pair t₁ (t₂ - t₁) (by omega) h₁ (by simpa only [he] using h₂)).elim
  · exact heq
  · have he : t₂ + (t₁ - t₂) = t₁ := by omega
    exact (no_pair t₂ (t₁ - t₂) (by omega) h₂ (by simpa only [he] using h₁)).elim

#print axioms digitSum_ten_pow_mul
#print axioms digitCount_power_ten_factor
#print axioms fixed_normalized_equations
#print axioms fixed_iff_normalized_parameters
#print axioms normalized_scale_unique
#print axioms fixed_digitCount_ne_ten_pow

end OeisA113010
