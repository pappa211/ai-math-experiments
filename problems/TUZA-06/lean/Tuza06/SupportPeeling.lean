import Tuza06.SupportStructure
import Tuza06.OverlapThreeActual
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Proposition O on the actual triangle support; every local premise has been
proved for the arbitrary ambient minimal obstruction. -/
theorem minimal_low_support_overlap {G : SimpleGraph V} (hG : MinimalObstruction G) :
    LowOverlap G (triangleVertices G) := by
  intro v hv w hw hne
  have hdv := minimal_low_support_degree hG hv
  have hdw := minimal_low_support_degree hG hw
  have hle := minimal_degree_five_common_le_three hG hdv hdw hne
  rw [minimal_neighbors_supported hG v,minimal_neighbors_supported hG w]
  refine ⟨hle,?_⟩
  intro hge
  have h3 : (peelNeighbors G univ v ∩ peelNeighbors G univ w).card = 3 := by omega
  exact minimal_three_common_cliques hG hdv hdw hne
    (fun h => minimal_degree_five_independent hG hdv hdw h) h3

/-- The universal second-degeneracy conclusion on the genuine triangle support.
The only substantive premises are actual minimality and five-degeneracy. -/
theorem minimal_two_arm_peeling {G : SimpleGraph V} (hG : MinimalObstruction G)
    (hdeg : Degenerate G 5) :
    ∃ u ∈ triangleVertices G \ peelLow G (triangleVertices G), ∃ v w : V,
      v ≠ w ∧ peelNeighbors G (peelLow G (triangleVertices G)) u = {v,w} ∧
      degreeWithin G (triangleVertices G) u = 7 ∧
      (peelNeighbors G (triangleVertices G \ peelLow G (triangleVertices G)) u).card = 5 ∧
      (peelNeighbors G (peelNeighbors G (triangleVertices G \ peelLow G (triangleVertices G)) u) v).card = 3 ∧
      (peelNeighbors G (peelNeighbors G (triangleVertices G \ peelLow G (triangleVertices G)) u) w).card = 3 ∧
      ((peelNeighbors G (peelNeighbors G (triangleVertices G \ peelLow G (triangleVertices G)) u) v) ∩
        (peelNeighbors G (peelNeighbors G (triangleVertices G \ peelLow G (triangleVertices G)) u) w)).card = 1 := by
  exact peeling_from_low_structure hdeg (minimal_support_nonempty hG)
    (fun _ hv => minimal_support_degree_ge_five hG hv)
    (minimal_low_support_independent hG) (minimal_low_support_high hG)
    (minimal_low_support_link_bound hG) (minimal_low_support_overlap hG)
end Tuza06
#check @Tuza06.minimal_two_arm_peeling
#print axioms Tuza06.minimal_two_arm_peeling
