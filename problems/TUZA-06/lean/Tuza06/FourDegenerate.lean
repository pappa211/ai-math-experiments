import Tuza06.SmallLinks
import Tuza06.Support

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The full link is closed, even when v also has arbitrary distant attachments. -/
theorem full_link_closed (G : SimpleGraph V) (v : V) :
    LinkClosed G v (peelNeighbors G univ v) := by
  classical
  constructor
  · intro a ha
    exact (mem_filter.mp ha).2
  · intro a ha b hvb _
    exact mem_filter.mpr ⟨mem_univ _, hvb⟩

/-- Every nonisolated supported vertex of an actual minimal combined obstruction
has at least five neighbors. Isolated ambient vertices are treated correctly. -/
theorem minimal_support_degree_ge_five {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hv : v ∈ triangleVertices G) : 5 ≤ degreeWithin G (triangleVertices G) v := by
  have h3 := minimal_support_degree_ge_three hG hv
  have heq := minimal_support_degree_eq hG v
  have hn : (peelNeighbors G univ v).Nonempty := by
    apply card_pos.mp
    change 0 < degreeWithin G univ v
    omega
  have h5 := minimal_closed_link_size hG (full_link_closed G v) hn
  rw [heq]
  exact h5

/-- A complete auxiliary theorem on the four-degenerate subclass.
This does NOT assert completion of the requested five-degenerate target. -/
theorem four_degenerate_combined {G : SimpleGraph V} (hdeg : Degenerate G 4) :
    tau (triangles G) ≤ 2 * nu (triangles G) ∧
      (tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G) := by
  have hGood : Good G := by
    by_contra hbad
    obtain ⟨H, hHG, hH⟩ := exists_minimal_obstruction hbad
    have hdegH := degenerate_mono hHG hdeg
    obtain ⟨v, hv, hle⟩ := hdegH (triangleVertices H) (minimal_support_nonempty hH)
    have h5 := minimal_support_degree_ge_five hH hv
    omega
  exact (good_iff_combined_conclusion G).mp hGood

theorem four_degenerate_inequality {G : SimpleGraph V} (hdeg : Degenerate G 4) :
    tau (triangles G) ≤ 2 * nu (triangles G) := (four_degenerate_combined hdeg).1

theorem four_degenerate_equality {G : SimpleGraph V} (hdeg : Degenerate G 4) :
    tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G := (four_degenerate_combined hdeg).2

end Tuza06
#check @Tuza06.four_degenerate_combined
#print axioms Tuza06.four_degenerate_combined
