import Tuza06.OverlapThreeActualKnown
import Tuza06.OverlapThreeActualUpperGroup0
import Tuza06.OverlapThreeActualUpperGroup1
import Tuza06.OverlapThreeActualUpperGroup2
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

namespace OverlapThreeOrientation
private theorem pattern_bad (k : Fin 3) (a b : Fin 9) : upperCheck k a b := by
  fin_cases k
  · exact upper_group0 a b
  · exact upper_group1 a b
  · exact upper_group2 a b

theorem realize_choice {G : SimpleGraph V} (i : Fin 9 ↪ V) (g : Fin 11) (f : Fin 10)
    (hNx : peelNeighbors G univ (i 0) = threeNx.map i)
    (hNy : peelNeighbors G univ (i 1) = threeNy.map i)
    (hMissing : ¬ G.IsNClique 2 ((yMissing f).map i))
    (hKnown : ∀ e ∈ known g f, G.IsNClique 2 (e.map i))
    (hc : certificate g f) :
    ∃ j : Fin 9 ↪ V, RealizesReduction (pattern (kind f)) G j ∧
      liftFamily j (aug (kind f)) ⊆ triangles G := by
  classical
  let r := reorder (choice g f)
  let j := r.trans i
  have hj0 : j 0 = i 0 := congrArg i (reorder_zero _)
  have hj1 : j 1 = i 1 := congrArg i (reorder_one _)
  have hN0 : peelNeighbors G univ (j 0) = threeNx.map j := by
    rw [hj0,hNx]
    change threeNx.map i = threeNx.map ((reorder (choice g f)).trans i)
    rw [←map_map,reorder_nx]
  have hN1 : peelNeighbors G univ (j 1) = threeNy.map j := by
    rw [hj1,hNy]
    change threeNy.map i = threeNy.map ((reorder (choice g f)).trans i)
    rw [←map_map,reorder_ny]
  have hTriangles : liftFamily j ((pattern (kind f)).P ∪ aug (kind f)) ⊆ triangles G := by
    rw [←liftFamily_comp]
    apply mapped_triangles_of_edges i hKnown
    intro t ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact hc.2 ⟨s,hs⟩
  have hP : liftFamily j (pattern (kind f)).P ⊆ triangles G := by
    intro t ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact hTriangles (mem_liftFamily.mpr ⟨s,mem_union_left _ hs,rfl⟩)
  have hAug : liftFamily j (aug (kind f)) ⊆ triangles G := by
    intro t ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact hTriangles (mem_liftFamily.mpr ⟨s,mem_union_right _ hs,rfl⟩)
  refine ⟨j,⟨?_,?_,hP⟩,hAug⟩
  · intro a b hadj
    by_contra hn
    rw [pattern_upper] at hn
    rcases pattern_bad (kind f) a b hn with hab|h0|h0r|h1|h1r|hmiss
    · exact G.irrefl (congrArg j hab ▸ hadj)
    · obtain ⟨rfl,hbn⟩ := h0
      have hbN : j b ∈ peelNeighbors G univ (j 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
      rw [hN0] at hbN
      exact hbn ((mem_map.mp hbN).choose_spec.1 |> fun _ => by
        obtain ⟨c,hc,hcj⟩ := mem_map.mp hbN
        exact j.injective hcj ▸ hc)
    · obtain ⟨rfl,han⟩ := h0r
      have haN : j a ∈ peelNeighbors G univ (j 0) := mem_filter.mpr ⟨mem_univ _,hadj.symm⟩
      rw [hN0] at haN
      obtain ⟨c,hc,hcj⟩ := mem_map.mp haN
      exact han (j.injective hcj ▸ hc)
    · obtain ⟨rfl,hbn⟩ := h1
      have hbN : j b ∈ peelNeighbors G univ (j 1) := mem_filter.mpr ⟨mem_univ _,hadj⟩
      rw [hN1] at hbN
      obtain ⟨c,hc,hcj⟩ := mem_map.mp hbN
      exact hbn (j.injective hcj ▸ hc)
    · obtain ⟨rfl,han⟩ := h1r
      have haN : j a ∈ peelNeighbors G univ (j 1) := mem_filter.mpr ⟨mem_univ _,hadj.symm⟩
      rw [hN1] at haN
      obtain ⟨c,hc,hcj⟩ := mem_map.mp haN
      exact han (j.injective hcj ▸ hc)
    · have hEdge : G.IsNClique 2 (({a,b} : Finset (Fin 9)).map j) := by
        rw [map_insert,map_singleton]
        exact sparse_pair_edge hadj
      have hMap : (({a,b} : Finset (Fin 9)).map j) = (yMissing f).map i := by
        rw [hmiss]
        change (target (kind f)).map (r.trans i) = _
        rw [←map_map]
        exact congrArg (Finset.map i) hc.1
      exact hMissing (hMap ▸ hEdge)
  · intro a ha z hadj
    rw [pattern_U] at ha
    have hz : z ∈ threeNx.map j ∨ z ∈ threeNy.map j := by
      rcases mem_insert.mp ha with rfl|ha
      · exact Or.inl (hN0 ▸ (mem_filter.mpr ⟨mem_univ _,hadj⟩))
      · have ha1 : a=1 := mem_singleton.mp ha
        subst a
        exact Or.inr (hN1 ▸ (mem_filter.mpr ⟨mem_univ _,hadj⟩))
    rcases hz with hz|hz
    · obtain ⟨b,hb,rfl⟩ := mem_map.mp hz
      exact mem_map.mpr ⟨b,mem_univ _,rfl⟩
    · obtain ⟨b,hb,rfl⟩ := mem_map.mp hz
      exact mem_map.mpr ⟨b,mem_univ _,rfl⟩
end OverlapThreeOrientation
end Tuza06
