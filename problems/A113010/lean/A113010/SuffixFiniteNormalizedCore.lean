import A113010.SuffixFiniteCore

/-! Removing trailing zeroes before checking an excessive power suffix. -/
namespace OeisA113010

theorem exponentCertificate_of_normalized_suffix {k s t u m : ℕ}
    (hk : k = 10 ^ t * u)
    (hlo : k ^ (s - 1) < 10 ^ (k - 1))
    (hhi : 10 ^ k ≤ k ^ (s + 1))
    (hs : s < digitSum (u ^ s % 10 ^ m)) : ExponentCertificate k s s := by
  refine ⟨hlo, hhi, ?_⟩
  intro j
  have hj : j.val = 0 := by have := j.isLt; omega
  simp only [hj, Nat.add_zero]
  right
  rw [hk, digitSum_power_ten_factor]
  exact digitSum_ne_of_suffix_excess hs

#print axioms exponentCertificate_of_normalized_suffix
end OeisA113010
