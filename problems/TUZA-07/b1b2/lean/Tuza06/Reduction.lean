import Tuza06.Statement

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

/-- Concrete cover extension; the hypothesis explicitly classifies ALL lost triangles. -/
theorem cover_extension {F K X : Finset (Finset V)} (hK : Triangles K)
    (hlost : ∀ t ∈ F, t ∈ K ∨ ∃ e ∈ X, e ∈ edges t) :
    tau F ≤ tau K + X.card := by
  obtain ⟨C, hc, hC⟩ := exists_min_cover hK
  have hcov : Covers F (C ∪ X) := by
    intro t ht
    rcases hlost t ht with hk | ⟨e, he, het⟩
    · obtain ⟨e, he, het⟩ := hc t hk
      exact ⟨e, mem_union_left _ he, het⟩
    · exact ⟨e, mem_union_right _ he, het⟩
  calc
    tau F ≤ (C ∪ X).card := tau_le_card hcov
    _ ≤ C.card + X.card := card_union_le _ _
    _ = tau K + X.card := by rw [hC]

/-- A displayed local packing appends to every residual packing. -/
theorem packing_extension {F K P : Finset (Finset V)}
    (hf : Triangles F) (hKF : K ⊆ F) (hP : Packing F P)
    (hcross : ∀ p ∈ P, ∀ q ∈ K, Disjoint (edges p) (edges q)) :
    P.card + nu K ≤ nu F := by
  obtain ⟨Q, hQ, hcQ⟩ := exists_max_packing K
  have hcross' := fun p hp q hq => hcross p hp q (hQ.1 hq)
  have hd := cross_disjoint (triangles_mono hP.1 hf) hcross'
  have hpack : Packing F (P ∪ Q) :=
    packing_mono (union_subset (Subset.refl F) hKF) (packing_union hP hQ hcross')
  have hle := packing_card_le hpack
  simpa [card_union_of_disjoint hd, hcQ] using hle

/-- Exact accounting is what licenses equality classification of the remainder. -/
theorem balanced_accounting {F K : Finset (Finset V)} {r : ℕ}
    (hfailure : 2 * nu F ≤ tau F) (hind : tau K ≤ 2 * nu K)
    (hpack : r + nu K ≤ nu F) (hcover : tau F ≤ tau K + 2 * r) :
    tau F = 2 * nu F ∧ nu F = nu K + r ∧ tau K = 2 * nu K := by
  omega

/-- Strict reductions contradict even a combined minimal obstruction. -/
theorem strict_accounting {F K : Finset (Finset V)} {r c : ℕ}
    (hfailure : 2 * nu F ≤ tau F) (hind : tau K ≤ 2 * nu K)
    (hpack : r + nu K ≤ nu F) (hcover : tau F ≤ tau K + c)
    (hstrict : c < 2 * r) : False := by
  omega

/-- A balanced reduction already suffices for the inequality-only induction. -/
theorem balanced_inequality {F K : Finset (Finset V)} {r : ℕ}
    (hind : tau K ≤ 2 * nu K) (hpack : r + nu K ≤ nu F)
    (hcover : tau F ≤ tau K + 2 * r) : tau F ≤ 2 * nu F := by
  omega

end Tuza06
