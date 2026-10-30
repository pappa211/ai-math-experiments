import Tuza06.OverlapThreeActualFinite
import Tuza06.OverlapThreeActualRealization
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

private theorem no_nonclique_three_right {G : SimpleGraph V} (hG : MinimalObstruction G)
    (i : Fin 9 ↪ V)
    (hNx : peelNeighbors G univ (i 0) = threeNx.map i)
    (hNy : peelNeighbors G univ (i 1) = threeNy.map i)
    (hNearX : NearClique G (threeNx.map i)) (hNearY : NearClique G (threeNy.map i))
    (hNonY : ¬ G.IsClique (threeNy.map i : Set V)) : False := by
  obtain ⟨g,f,hAdm,hMissing,hKnown⟩ :=
    OverlapThreeOrientation.actual_known_certificate i hNx hNy hNearX hNearY hNonY
  have hc := OverlapThreeOrientation.certified g f hAdm
  obtain ⟨j,hreal,hAug⟩ :=
    OverlapThreeOrientation.realize_choice i g f hNx hNy hMissing hKnown hc
  generalize hk : OverlapThreeOrientation.kind f = k at hreal hAug
  fin_cases k
  · exact OverlapThreeInside.excluded hG j hreal hAug
  · exact OverlapThreeOutsideArm.excluded hG j hreal hAug
  · exact OverlapThreeOutsidePair.excluded hG j hreal hAug

theorem minimal_three_common_right_clique {G : SimpleGraph V} (hG : MinimalObstruction G) {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hne : x ≠ y) (hxy : ¬ G.Adj x y)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 3) :
    G.IsClique (peelNeighbors G univ y : Set V) := by
  classical
  obtain ⟨i,hi0,hi1,hNx,hNy⟩ := three_common_actual_labeling hx hy hne hxy hC
  have hNx0 : peelNeighbors G univ (i 0) = threeNx.map i := by rw [hi0];exact hNx
  have hNy1 : peelNeighbors G univ (i 1) = threeNy.map i := by rw [hi1];exact hNy
  have hNearX : NearClique G (threeNx.map i) := by
    rw [←hNx]
    exact minimal_degree_five_near hG hx
  have hNearY : NearClique G (threeNy.map i) := by
    rw [←hNy]
    exact minimal_degree_five_near hG hy
  by_contra hNon
  have hNonY : ¬ G.IsClique (threeNy.map i : Set V) := by rw [←hNy];exact hNon
  exact no_nonclique_three_right hG i hNx0 hNy1 hNearX hNearY hNonY

/-- Actual universal three-common-neighbor part of Proposition O: in a genuine
minimal combined obstruction, both degree-five links must be complete. -/
theorem minimal_three_common_cliques {G : SimpleGraph V} (hG : MinimalObstruction G) {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hne : x ≠ y) (hxy : ¬ G.Adj x y)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 3) :
    G.IsClique (peelNeighbors G univ x : Set V) ∧
      G.IsClique (peelNeighbors G univ y : Set V) := by
  constructor
  · apply minimal_three_common_right_clique hG hy hx hne.symm (fun h => hxy h.symm)
    simpa only [inter_comm (peelNeighbors G univ y)] using hC
  · exact minimal_three_common_right_clique hG hx hy hne hxy hC

end Tuza06
#check @Tuza06.minimal_three_common_cliques
#print axioms Tuza06.minimal_three_common_cliques
