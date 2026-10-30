import Tuza06.LowNeighborStructure
import Tuza06.OverlapFour
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem minimal_low_support_degree {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hv : v ∈ peelLow G (triangleVertices G)) : degreeWithin G univ v = 5 := by
  have h := (mem_filter.mp hv).2
  rwa [minimal_support_degree_eq hG v] at h

theorem minimal_low_support_independent {G : SimpleGraph V} (hG : MinimalObstruction G) :
    IndependentVertices G (peelLow G (triangleVertices G)) := by
  intro v hv w hw hadj
  exact minimal_degree_five_independent hG (minimal_low_support_degree hG hv)
    (minimal_low_support_degree hG hw) hadj

theorem minimal_low_support_high {G : SimpleGraph V} (hG : MinimalObstruction G) :
    ∀ v ∈ peelLow G (triangleVertices G), ∀ u ∈ triangleVertices G,
      G.Adj v u → 7 ≤ degreeWithin G (triangleVertices G) u := by
  intro v hv u _ hadj
  rw [minimal_support_degree_eq hG u]
  exact minimal_degree_five_neighbors_high hG (minimal_low_support_degree hG hv) hadj

theorem minimal_low_support_near {G : SimpleGraph V} (hG : MinimalObstruction G) :
    ∀ v ∈ peelLow G (triangleVertices G), NearClique G (peelNeighbors G (triangleVertices G) v) := by
  intro v hv
  rw [minimal_neighbors_supported hG v]
  exact minimal_degree_five_near hG (minimal_low_support_degree hG hv)

theorem minimal_low_support_link_bound {G : SimpleGraph V} (hG : MinimalObstruction G) :
    LowLinkBound G (triangleVertices G) := lowLinkBound_of_near (minimal_low_support_near hG)

theorem minimal_degree_five_common_le_three {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v w : V} (hv : degreeWithin G univ v = 5) (hw : degreeWithin G univ w = 5)
    (hne : v ≠ w) : (peelNeighbors G univ v ∩ peelNeighbors G univ w).card ≤ 3 := by
  have hxy : ¬ G.Adj v w := fun h => minimal_degree_five_independent hG hv hw h
  have hbound : (peelNeighbors G univ v ∩ peelNeighbors G univ w).card ≤ 5 := by
    have h := card_le_card (inter_subset_left (s₁ := peelNeighbors G univ v) (s₂ := peelNeighbors G univ w))
    change (peelNeighbors G univ v).card = 5 at hv
    omega
  have hn5 : (peelNeighbors G univ v ∩ peelNeighbors G univ w).card ≠ 5 :=
    fun h => minimal_no_five_common hG hv hw hne hxy h
  have hn4 : (peelNeighbors G univ v ∩ peelNeighbors G univ w).card ≠ 4 :=
    fun h => minimal_no_four_common hG hv hw hne hxy h
  omega
end Tuza06
#print axioms Tuza06.minimal_degree_five_common_le_three
