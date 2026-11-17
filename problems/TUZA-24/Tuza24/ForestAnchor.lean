import Tuza24.AnchorLift
import Tuza24.PointedForest

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Any supplied actual forest cover admits an existential anchored packing/cover.
The packing is not prescribed, and the new cover may use any actual graph edges. -/
theorem forest_cover_anchor {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : ForestCover G C) : ∃ I D, AnchoredPackingCover G C I D := by
  classical
  generalize hn : C.card=n
  induction n using Nat.strong_induction_on generalizing G C with
  | h n ih =>
    by_cases hne : C.Nonempty
    · obtain ⟨v,w,hleaf⟩ := forestCover_leaf hC hne
      obtain ⟨M,Q,hp⟩ := pointed_apex_forest w (selectedLeaf_link_forest hC hleaf)
      let X := M∪spokes v Q
      let H := remove G {v} X
      have hCH : ForestCover H (C∩graphEdges H) := forestCover_restrict (remove_le G {v} X) hC
      have hlt : (C∩graphEdges H).card < n := by
        rw [← hn]
        exact selectedLeaf_restriction_card_lt hleaf
      obtain ⟨I,D,hres⟩ := ih (C∩graphEdges H).card hlt hCH rfl
      exact pointed_anchor_lift hC.1.1 hleaf hp hres
    · have he : C=∅ := not_nonempty_iff_eq_empty.mp hne
      subst C
      exact ⟨∅,∅,empty_cover_anchor hC.1⟩

/-- Standalone all-size forest-cover inequality, derived from the existential anchor. -/
theorem forest_cover_inequality {G : SimpleGraph V} (hG : HasForestCover G) :
    tau (triangles G) ≤ 2*nu (triangles G) := by
  obtain ⟨C,hC⟩ := hG
  obtain ⟨I,D,h⟩ := forest_cover_anchor hC
  exact anchored_implies_inequality h

end Tuza24
