import Tuza06.LowDegreeStructureTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1200000
variable {V : Type*} [Fintype V] [DecidableEq V]

private def domOrder : Fin 5 → Fin 6 → Fin 6 :=
  ![![1,0,2,3,4,5],![2,0,1,3,4,5],![3,0,1,2,4,5],![4,0,1,2,3,5],![5,0,1,2,3,4]]
private theorem domOrder_inj : ∀ k : Fin 5, Function.Injective (domOrder k) := by decide
private def domReorder (k : Fin 5) : Fin 6 ↪ Fin 6 := ⟨domOrder k,domOrder_inj k⟩
private theorem dom_first : ∀ k : Fin 5, domReorder k 0 = k.succ := by decide
private theorem dom_second : ∀ k : Fin 5, domReorder k 1 = 0 := by decide
private theorem dom_full_triangles : ∀ k : Fin 5, ∀ p : ↥DominatingFive.P,
    p.val.map (domReorder k) ∈ coreFamily fiveCliqueCore := by decide
private theorem dom_near_triangles : ∀ k : Fin 5, 2 ≤ k.val → ∀ p : ↥DominatingFive.P,
    p.val.map (domReorder k) ∈ coreFamily fiveNearCore := by decide
private theorem dom_full_star : ∀ k : Fin 5, ∀ a : Fin 6, a ≠ k.succ →
    ({k.succ,a} : Finset (Fin 6)) ∈ fiveCliqueCore := by decide
private theorem dom_near_star : ∀ k : Fin 5, 2 ≤ k.val → ∀ a : Fin 6, a ≠ k.succ →
    ({k.succ,a} : Finset (Fin 6)) ∈ fiveNearCore := by decide

/-- Actual degree-five dominating neighbor exclusion after canonical core
labeling; all center neighborhoods are derived from the two degree counts. -/
theorem minimal_no_dominating_five_configuration {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    (k : Fin 5) (hdeg : degreeWithin G univ (i k.succ) = 5)
    (hstar : ∀ a : Fin 6, a ≠ k.succ → ({k.succ,a} : Finset (Fin 6)) ∈ E)
    (hP : ∀ p : ↥DominatingFive.P, p.val.map (domReorder k) ∈ coreFamily E) : False := by
  classical
  let r := domReorder k
  let j := r.trans i
  have hj0 : j 0 = i k.succ := congrArg i (dom_first k)
  have hj1 : j 1 = i 0 := congrArg i (dom_second k)
  have hRange : (univ : Finset (Fin 6)).map j = (univ : Finset (Fin 6)).map i := by
    change (univ : Finset (Fin 6)).map (r.trans i) = _
    rw [← map_map,finite_embedding_range_eq r]
  have hUpper : DominatingFive.Upper = edges (univ : Finset (Fin 6)) := by decide
  have hreal : RealizesReduction DominatingFive.witness G j := by
    constructor
    · intro a b hadj
      rw [show DominatingFive.witness.Upper = edges (univ : Finset (Fin 6)) from hUpper]
      have hab : a ≠ b := fun h => G.irrefl (congrArg j h ▸ hadj)
      exact mem_edges.mpr ⟨subset_univ _,by simp [hab]⟩
    · intro a ha z hadj
      rw [hRange]
      have ha' : a = 0 ∨ a = 1 := by simpa only [DominatingFive.witness,DominatingFive.U,mem_insert,mem_singleton] using ha
      rcases ha' with h0|h1
      · subst a
        rw [hj0] at hadj
        exact core_neighbor_range hr hdeg hstar z hadj
      · subst a
        rw [hj1] at hadj
        have hz : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
        rw [hr.neighborhood] at hz
        obtain ⟨b,hb,rfl⟩ := mem_map.mp hz
        exact mem_map.mpr ⟨b,mem_univ _,rfl⟩
    · apply configuration_subpattern_triangles hr r
      intro t ht
      obtain ⟨p,hp,rfl⟩ := mem_liftFamily.mp ht
      exact hP ⟨p,hp⟩
  exact DominatingFive.excluded hG j hreal

theorem minimal_no_clique_degree_five_neighbor {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveCliqueCore) (k : Fin 5)
    (hdeg : degreeWithin G univ (i k.succ) = 5) : False :=
  minimal_no_dominating_five_configuration hG hr k hdeg (dom_full_star k) (dom_full_triangles k)

theorem minimal_no_near_dominating_degree_five_neighbor {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore) (k : Fin 5) (hk : 2 ≤ k.val)
    (hdeg : degreeWithin G univ (i k.succ) = 5) : False :=
  minimal_no_dominating_five_configuration hG hr k hdeg (dom_near_star k hk) (dom_near_triangles k hk)

end Tuza06
