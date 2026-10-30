import Tuza06.LowNeighborEndpointUniversal
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem minimal_degree_five_neighbor_not_six {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v u : V} (hv : degreeWithin G univ v = 5)
    (hu : degreeWithin G univ u = 6) (hadj : G.Adj v u) : False := by
  classical
  obtain ⟨i,hi,hnear|hfull⟩ := minimal_degree_five_configuration hG hv
  all_goals
    have huN : u ∈ peelNeighbors G univ (i 0) :=
      mem_filter.mpr ⟨mem_univ _,by simpa only [hi] using hadj⟩
  · rw [hnear.neighborhood] at huN
    obtain ⟨a,ha,hai⟩ := mem_map.mp huN
    have hdeg : degreeWithin G univ (i a) = 6 := by simpa only [hai] using hu
    fin_cases a
    · simp [fiveLinkNeighbors] at ha
    · exact minimal_no_near_endpoint_degree_six hG hnear hdeg
    · exact minimal_no_near_second_endpoint_degree_six hG hnear hdeg
    · exact minimal_no_near_dominating_degree_six hG hnear 0 hdeg
    · exact minimal_no_near_dominating_degree_six hG hnear 1 hdeg
    · exact minimal_no_near_dominating_degree_six hG hnear 2 hdeg
  · rw [hfull.neighborhood] at huN
    obtain ⟨a,ha,hai⟩ := mem_map.mp huN
    have hdeg : degreeWithin G univ (i a) = 6 := by simpa only [hai] using hu
    fin_cases a
    · simp [fiveLinkNeighbors] at ha
    · exact minimal_no_clique_degree_six_neighbor hG hfull 1 (by decide) hdeg
    · exact minimal_no_clique_degree_six_neighbor hG hfull 2 (by decide) hdeg
    · exact minimal_no_clique_degree_six_neighbor hG hfull 3 (by decide) hdeg
    · exact minimal_no_clique_degree_six_neighbor hG hfull 4 (by decide) hdeg
    · exact minimal_no_clique_degree_six_neighbor hG hfull 5 (by decide) hdeg

/-- Every actual neighbor of a degree-five vertex has degree at least seven in
a minimal obstruction to the combined inequality and equality theorem. -/
theorem minimal_degree_five_neighbors_high {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v u : V} (hv : degreeWithin G univ v = 5) (hadj : G.Adj v u) :
    7 ≤ degreeWithin G univ u := by
  have huSupport := (minimal_adj_vertices_supported hG hadj).2
  have h5 := minimal_support_degree_ge_five hG huSupport
  rw [minimal_support_degree_eq hG u] at h5
  have hn5 : degreeWithin G univ u ≠ 5 := fun hu =>
    minimal_degree_five_independent hG hv hu hadj
  have hn6 : degreeWithin G univ u ≠ 6 := fun hu =>
    minimal_degree_five_neighbor_not_six hG hv hu hadj
  omega

end Tuza06
#check @Tuza06.minimal_degree_five_independent
#check @Tuza06.minimal_degree_five_neighbors_high
#print axioms Tuza06.minimal_degree_five_neighbors_high
