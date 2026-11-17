import Tuza06.Statement
import Mathlib.Data.Finset.Card

namespace Tuza06
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

/-- Two large arms with intersection at most one exhaust a five-element set. -/
theorem two_arm_saturation {A X Y : Finset V}
    (hA : A.card ≤ 5) (hX : X ⊆ A) (hY : Y ⊆ A)
    (hcX : 3 ≤ X.card) (hcY : 3 ≤ Y.card) (hXY : (X ∩ Y).card ≤ 1) :
    A.card = 5 ∧ X.card = 3 ∧ Y.card = 3 ∧ (X ∩ Y).card = 1 ∧ X ∪ Y = A := by
  have hU := card_le_card (union_subset hX hY)
  have hcount := card_union_add_card_inter X Y
  have hx := card_le_card hX
  have hy := card_le_card hY
  have ha5 : A.card = 5 := by omega
  have hu5 : (X ∪ Y).card = 5 := by omega
  refine ⟨ha5, by omega, by omega, by omega, ?_⟩
  exact eq_of_subset_of_card_le (union_subset hX hY) (by omega)

/-- Three such arms cannot exist, without any graph-order bound. -/
theorem three_arms_impossible {A X Y Z : Finset V}
    (hA : A.card ≤ 5) (hX : X ⊆ A) (hY : Y ⊆ A) (hZ : Z ⊆ A)
    (hcX : 3 ≤ X.card) (hcY : 3 ≤ Y.card) (hcZ : 3 ≤ Z.card)
    (hXY : (X ∩ Y).card ≤ 1) (hXZ : (X ∩ Z).card ≤ 1)
    (hYZ : (Y ∩ Z).card ≤ 1) : False := by
  have hs := two_arm_saturation hA hX hY hcX hcY hXY
  have hZsub : Z ⊆ X ∪ Y := hs.2.2.2.2.symm ▸ hZ
  have hsplit : Z = (X ∩ Z) ∪ (Y ∩ Z) := by
    ext z
    simp only [mem_union, mem_inter]
    constructor
    · intro hz
      rcases mem_union.mp (hZsub hz) with hx | hy
      · exact Or.inl ⟨hx, hz⟩
      · exact Or.inr ⟨hy, hz⟩
    · rintro (⟨_, hz⟩ | ⟨_, hz⟩) <;> exact hz
  have hle := card_union_le (X ∩ Z) (Y ∩ Z)
  rw [← hsplit] at hle
  omega

/-- At most two three-element-or-larger subsets of a set of size at most five
can have pairwise intersections at most one. -/
theorem arm_family_card_le_two {A : Finset V} {F : Finset (Finset V)}
    (hA : A.card ≤ 5) (hF : ∀ X ∈ F, X ⊆ A ∧ 3 ≤ X.card)
    (hpair : ∀ X ∈ F, ∀ Y ∈ F, X ≠ Y → (X ∩ Y).card ≤ 1) : F.card ≤ 2 := by
  by_contra hn
  obtain ⟨Q, hQF, hcQ⟩ := exists_subset_card_eq (show 3 ≤ F.card by omega)
  obtain ⟨X, Y, Z, hXY, hXZ, hYZ, rfl⟩ := card_eq_three.mp hcQ
  have hXF : X ∈ F := hQF (by simp)
  have hYF : Y ∈ F := hQF (by simp)
  have hZF : Z ∈ F := hQF (by simp)
  exact three_arms_impossible hA (hF X hXF).1 (hF Y hYF).1 (hF Z hZF).1
    (hF X hXF).2 (hF Y hYF).2 (hF Z hZF).2
    (hpair X hXF Y hYF hXY) (hpair X hXF Z hZF hXZ) (hpair Y hYF Z hZF hYZ)

end Tuza06
