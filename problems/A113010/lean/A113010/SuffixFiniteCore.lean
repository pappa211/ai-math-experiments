import A113010.Finite
import A113010.SuffixCertificate

/-! Reuse the original interval exclusion with suffix digit-sum evidence. -/
namespace OeisA113010

theorem exponentCertificate_of_suffix {k s m : ℕ}
    (hlo : k ^ (s - 1) < 10 ^ (k - 1))
    (hhi : 10 ^ k ≤ k ^ (s + 1))
    (hs : s < digitSum (k ^ s % 10 ^ m)) : ExponentCertificate k s s := by
  refine ⟨hlo, hhi, ?_⟩
  intro j
  have hj : j.val = 0 := by have := j.isLt; omega
  simp only [hj, Nat.add_zero]
  exact Or.inr (digitSum_ne_of_suffix_excess hs)

#print axioms exponentCertificate_of_suffix
end OeisA113010
