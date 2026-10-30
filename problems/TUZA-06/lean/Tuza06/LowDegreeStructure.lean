import Tuza06.LowDegreeStructureAdjacent

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1200000
variable {V : Type*} [Fintype V] [DecidableEq V]

private def swapEnds : Fin 6 ↪ Fin 6 :=
  ⟨![0,2,1,3,4,5],by decide⟩
private theorem swap_hub : swapEnds 0 = 0 := rfl
private theorem swap_neighbors : fiveLinkNeighbors.map swapEnds = fiveLinkNeighbors := by decide
private theorem swap_edges : ∀ a b : Fin 6,
  ({swapEnds a,swapEnds b} : Finset (Fin 6)) ∈ fiveNearCore ↔ ({a,b} : Finset (Fin 6)) ∈ fiveNearCore := by decide

theorem near_configuration_swap {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hr : FiveLinkConfiguration G i fiveNearCore) :
    FiveLinkConfiguration G (swapEnds.trans i) fiveNearCore := by
  constructor
  · change peelNeighbors G univ (i (swapEnds 0)) = _
    rw [swap_hub,hr.neighborhood,← map_map,swap_neighbors]
  · intro a b
    exact (hr.core_edges (swapEnds a) (swapEnds b)).trans (swap_edges a b)

theorem minimal_no_near_second_endpoint_degree_five {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 2) = 5) : False := by
  exact minimal_no_near_endpoint_degree_five hG (near_configuration_swap hr) hdeg

/-- Degree-five vertices of a genuine minimal combined obstruction are independent. -/
theorem minimal_degree_five_independent {G : SimpleGraph V} (hG : MinimalObstruction G)
    {u v : V} (hu : degreeWithin G univ u = 5) (hv : degreeWithin G univ v = 5)
    (hadj : G.Adj u v) : False := by
  classical
  obtain ⟨i,hi,hnear|hfull⟩ := minimal_degree_five_configuration hG hv
  all_goals
    have huN : u ∈ peelNeighbors G univ (i 0) := by
      exact mem_filter.mpr ⟨mem_univ _,by simpa only [hi] using hadj.symm⟩
  · rw [hnear.neighborhood] at huN
    obtain ⟨a,ha,hai⟩ := mem_map.mp huN
    have hdeg : degreeWithin G univ (i a) = 5 := by simpa only [hai] using hu
    fin_cases a
    · simp [fiveLinkNeighbors] at ha
    · exact minimal_no_near_endpoint_degree_five hG hnear hdeg
    · exact minimal_no_near_second_endpoint_degree_five hG hnear hdeg
    · exact minimal_no_near_dominating_degree_five_neighbor hG hnear 2 (by decide) hdeg
    · exact minimal_no_near_dominating_degree_five_neighbor hG hnear 3 (by decide) hdeg
    · exact minimal_no_near_dominating_degree_five_neighbor hG hnear 4 (by decide) hdeg
  · rw [hfull.neighborhood] at huN
    obtain ⟨a,ha,hai⟩ := mem_map.mp huN
    have hdeg : degreeWithin G univ (i a) = 5 := by simpa only [hai] using hu
    fin_cases a
    · simp [fiveLinkNeighbors] at ha
    · exact minimal_no_clique_degree_five_neighbor hG hfull 0 hdeg
    · exact minimal_no_clique_degree_five_neighbor hG hfull 1 hdeg
    · exact minimal_no_clique_degree_five_neighbor hG hfull 2 hdeg
    · exact minimal_no_clique_degree_five_neighbor hG hfull 3 hdeg
    · exact minimal_no_clique_degree_five_neighbor hG hfull 4 hdeg

end Tuza06
#print axioms Tuza06.minimal_degree_five_independent
