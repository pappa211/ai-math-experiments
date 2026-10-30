import Tuza06.SupportPeeling
import Tuza06.TwoArmLabels
import Tuza06.FinalReconstructionFrame
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Every actual five-degenerate minimal combined obstruction contains the exact
saturated two-arm frame. No local configuration is assumed. -/
theorem minimal_final_arm_data {G : SimpleGraph V} (hG : MinimalObstruction G)
    (hdeg : Degenerate G 5) : ∃ j : Fin 8 ↪ V, FinalArmData G j := by
  classical
  obtain ⟨u,hu,v,w,hvw,hR,hu7,hA,hX,hY,hXY⟩ := minimal_two_arm_peeling hG hdeg
  let S := triangleVertices G
  let L := peelLow G S
  let A := peelNeighbors G (S \ L) u
  let X := peelNeighbors G A v
  let Y := peelNeighbors G A w
  have hAm : A.card = 5 := hA
  have hXm : X.card = 3 := hX
  have hYm : Y.card = 3 := hY
  have hXYm : (X ∩ Y).card = 1 := hXY
  obtain ⟨i,hiA,hiX,hiY⟩ := two_arm_labeling hAm (filter_subset _ _) (filter_subset _ _) hXm hYm hXYm
  have hvR : v ∈ peelNeighbors G L u := by rw [hR];simp
  have hwR : w ∈ peelNeighbors G L u := by rw [hR];simp
  have hvL : v ∈ L := (mem_filter.mp hvR).1
  have hwL : w ∈ L := (mem_filter.mp hwR).1
  have huv : u ≠ v := G.ne_of_adj (mem_filter.mp hvR).2
  have huw : u ≠ w := G.ne_of_adj (mem_filter.mp hwR).2
  have hOutsideU : ∀ a, i a ≠ u := by
    intro a he
    have ha : i a ∈ A := hiA ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
    exact G.irrefl (he ▸ (mem_filter.mp ha).2)
  have hOutsideV : ∀ a, i a ≠ v := by
    intro a he
    have ha : i a ∈ A := hiA ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
    exact (mem_sdiff.mp (mem_filter.mp ha).1).2 (he.symm ▸ hvL)
  have hOutsideW : ∀ a, i a ≠ w := by
    intro a he
    have ha : i a ∈ A := hiA ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
    exact (mem_sdiff.mp (mem_filter.mp ha).1).2 (he.symm ▸ hwL)
  obtain ⟨j,h0,h1,h2,h3,h4,h5,h6,h7⟩ := extend_two_arm_labels i u v w hOutsideU hOutsideV hOutsideW huv huw hvw
  have hAll5 : (univ : Finset (Fin 5)) = {0,1,2,3,4} := by decide
  have hAj : Core.A.map j = A := by
    rw [← hiA,hAll5]
    simp only [Core.A,map_insert,map_singleton,h3,h4,h5,h6,h7]
  change ({0,1,2} : Finset (Fin 5)).map i = X at hiX
  change ({0,3,4} : Finset (Fin 5)).map i = Y at hiY
  have hXj : frameX.map j = X := by
    rw [← hiX]
    simp only [frameX,map_insert,map_singleton,h3,h4,h5]
  have hYj : frameY.map j = Y := by
    rw [← hiY]
    simp only [frameY,map_insert,map_singleton,h3,h6,h7]
  have hNu : peelNeighbors G univ u = {v,w} ∪ A := by
    rw [← minimal_neighbors_supported hG u]
    ext z
    constructor
    · intro hz
      by_cases hzL : z ∈ L
      · have hm : z ∈ peelNeighbors G L u := mem_filter.mpr ⟨hzL,(mem_filter.mp hz).2⟩
        exact mem_union_left _ (hR ▸ hm)
      · exact mem_union_right _ (mem_filter.mpr ⟨mem_sdiff.mpr ⟨(mem_filter.mp hz).1,hzL⟩,(mem_filter.mp hz).2⟩)
    · intro hz
      rcases mem_union.mp hz with hz | hz
      · have hm : z ∈ peelNeighbors G L u := hR.symm ▸ hz
        have hzL := (mem_filter.mp hm).1
        exact mem_filter.mpr ⟨(mem_filter.mp hzL).1,(mem_filter.mp hm).2⟩
      · exact mem_filter.mpr ⟨(mem_sdiff.mp (mem_filter.mp hz).1).1,(mem_filter.mp hz).2⟩
  have hFrameNu : frameNu.map j = {v,w} ∪ A := by
    rw [← hAj]
    simp only [frameNu,Core.A,map_insert,map_singleton,h1,h2,h3,h4,h5,h6,h7]
    ext z
    simp only [mem_insert,mem_singleton,mem_union]
    tauto
  have hdv := minimal_low_support_degree hG hvL
  have hdw := minimal_low_support_degree hG hwL
  refine ⟨j,?_,?_,?_,?_,?_,?_⟩
  · rw [h0,hNu,hFrameNu]
  · rw [hAj,h1,hXj]
  · rw [hAj,h2,hYj]
  · rw [h1];exact hdv
  · rw [h2];exact hdw
  · rw [h1,h2]
    exact fun h => minimal_degree_five_independent hG hdv hdw h
end Tuza06
#check @Tuza06.minimal_final_arm_data
#print axioms Tuza06.minimal_final_arm_data
