import Tuza06.LowDegreeStructure
import Tuza06.DominatingNearSix
import Tuza06.DominatingCliqueSix

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem core_dominating_six_private_neighbor {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E) (k : Fin 6)
    (hstar : ∀ a : Fin 6, a ≠ k → ({k,a} : Finset (Fin 6)) ∈ E)
    (hdeg : degreeWithin G univ (i k) = 6) :
    ∃ p ∉ (univ : Finset (Fin 6)).map i,
      peelNeighbors G univ (i k) = insert p (((univ : Finset (Fin 6)).erase k).map i) := by
  classical
  let K := (univ : Finset (Fin 6)).erase k
  let N := peelNeighbors G univ (i k)
  have hK : K.map i ⊆ N := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    exact mem_filter.mpr ⟨mem_univ _,(hr.core_edges k a).mpr (hstar a (mem_erase.mp ha).1)⟩
  have hKcard : (K.map i).card = 5 := by simp [K]
  have hNcard : N.card = 6 := hdeg
  have hRest : (N \ K.map i).card = 1 := by rw [card_sdiff_of_subset hK,hNcard,hKcard]
  obtain ⟨p,hpEq⟩ := card_eq_one.mp hRest
  have hpRest : p ∈ N \ K.map i := by rw [hpEq]; simp
  have hpN := (mem_sdiff.mp hpRest).1
  have hpK := (mem_sdiff.mp hpRest).2
  have hpOut : p ∉ (univ : Finset (Fin 6)).map i := by
    intro hp
    obtain ⟨a,ha,hap⟩ := mem_map.mp hp
    have hadj : G.Adj (i k) (i a) := by simpa only [hap] using (mem_filter.mp hpN).2
    exact hpK (mem_map.mpr ⟨a,mem_erase.mpr ⟨fun h => G.irrefl (congrArg i h ▸ hadj),mem_univ _⟩,hap⟩)
  refine ⟨p,hpOut,?_⟩
  calc
    N = (N \ K.map i) ∪ K.map i := (sdiff_union_of_subset hK).symm
    _ = insert p (K.map i) := by rw [hpEq,singleton_union]

theorem core_hub_not_outside {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E) {p : V}
    (hpOut : p ∉ (univ : Finset (Fin 6)).map i) : ¬ G.Adj (i 0) p := by
  classical
  intro h
  have hpN : p ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
  rw [hr.neighborhood] at hpN
  obtain ⟨a,ha,rfl⟩ := mem_map.mp hpN
  exact hpOut (mem_map.mpr ⟨a,mem_univ _,rfl⟩)

theorem core_outside_triangle_apex {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    (k : Fin 6) (hk : k ≠ 0) {p : V}
    (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i k) = insert p (((univ : Finset (Fin 6)).erase k).map i)) :
    ∃ w : Fin 6, w ≠ 0 ∧ w ≠ k ∧ G.Adj (i w) p := by
  classical
  have hkp : G.Adj (i k) p := (mem_filter.mp (by rw [hN]; simp : p ∈ peelNeighbors G univ (i k))).2
  obtain ⟨t,ht,htedge⟩ := minimal_every_edge_in_triangle hG (sparse_pair_edge hkp)
  obtain ⟨x,hxOut,hTeq⟩ := third_vertex (mem_triangles.mp ht).card_eq htedge
  have hxk : x ≠ i k := fun h => hxOut (by simp [h])
  have hxp : x ≠ p := fun h => hxOut (by simp [h])
  have hkx : G.Adj (i k) x := (mem_triangles.mp ht).isClique (by rw [hTeq]; simp) (by rw [hTeq]; simp) hxk.symm
  have hpx : G.Adj p x := (mem_triangles.mp ht).isClique (by rw [hTeq]; simp) (by rw [hTeq]; simp) hxp.symm
  have hxN : x ∈ peelNeighbors G univ (i k) := mem_filter.mpr ⟨mem_univ _,hkx⟩
  rw [hN] at hxN
  obtain ⟨w,hw,hwx⟩ := mem_map.mp ((mem_insert.mp hxN).resolve_left hxp)
  have hw0 : w ≠ 0 := by
    intro h
    have hnot := core_hub_not_outside hr hpOut
    apply hnot
    simpa only [← hwx,h] using hpx.symm
  refine ⟨w,hw0,(mem_erase.mp hw).1,?_⟩
  simpa only [hwx] using hpx.symm

theorem extended_core_known_edges {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    (hE : E ⊆ edges (univ : Finset (Fin 6))) (p : V) (hx : ∀ a, i a ≠ p)
    (k w : Fin 6) (hk : G.Adj (i k) p) (hw : G.Adj (i w) p) :
    ∀ f ∈ liftFamily sixIntoSeven E ∪ ({{k.castSucc,6},{w.castSucc,6}} : Finset (Finset (Fin 7))),
      G.IsNClique 2 (f.map (extendFiniteEmbedding i p hx)) := by
  intro f hf
  rcases mem_union.mp hf with hold|hnew
  · obtain ⟨g,hg,rfl⟩ := mem_liftFamily.mp hold
    have hm : (g.map sixIntoSeven).map (extendFiniteEmbedding i p hx) = g.map i := by
      rw [map_map]
      change g.map (sixIntoSeven.trans (extendFiniteEmbedding i p hx)) = _
      rw [extended_six_composition]
    rw [hm]
    exact core_mapped_edge hr (mem_edges.mp (hE hg)).2 hg
  · rcases mem_insert.mp hnew with rfl|hf
    · simp only [map_insert,map_singleton,extendFiniteEmbedding_old]
      exact sparse_pair_edge hk
    · have hfEq := mem_singleton.mp hf
      rw [hfEq]
      simp only [map_insert,map_singleton,extendFiniteEmbedding_old]
      exact sparse_pair_edge hw

theorem dominating_six_realizes {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    (W : FiniteReduction (Fin 7)) (hU : W.U = {0,1})
    (p : V) (hx : ∀ a, i a ≠ p) (k : Fin 6)
    (hN : peelNeighbors G univ (i k) = insert p (((univ : Finset (Fin 6)).erase k).map i))
    (r : Fin 7 ↪ Fin 7) (h0 : r 0 = k.castSucc) (h1 : r 1 = 0)
    (hupper : ∀ a b : Fin 7, G.Adj (extendFiniteEmbedding i p hx (r a))
      (extendFiniteEmbedding i p hx (r b)) → ({a,b} : Finset (Fin 7)) ∈ W.Upper)
    (hP : liftFamily (r.trans (extendFiniteEmbedding i p hx)) W.P ⊆ triangles G) :
    RealizesReduction W G (r.trans (extendFiniteEmbedding i p hx)) := by
  classical
  let e := extendFiniteEmbedding i p hx
  let j := r.trans e
  have hRange : (univ : Finset (Fin 7)).map j = (univ : Finset (Fin 7)).map e := by
    change (univ : Finset (Fin 7)).map (r.trans e) = _
    rw [← map_map,finite_embedding_range_eq r]
  have hOld : (univ : Finset (Fin 6)).map i ⊆ (univ : Finset (Fin 7)).map e := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    exact mem_map.mpr ⟨a.castSucc,mem_univ _,extendFiniteEmbedding_old i p hx a⟩
  have hj0 : j 0 = i k := by change e (r 0) = _; rw [h0]; exact extendFiniteEmbedding_old i p hx k
  have hj1 : j 1 = i 0 := by change e (r 1) = _; rw [h1]; rfl
  constructor
  · exact hupper
  · intro a ha z hadj
    rw [hRange]
    rw [hU] at ha
    rcases mem_insert.mp ha with rfl|ha
    · rw [hj0] at hadj
      have hz : z ∈ peelNeighbors G univ (i k) := mem_filter.mpr ⟨mem_univ _,hadj⟩
      rw [hN] at hz
      rcases mem_insert.mp hz with hzp|hcore
      · exact mem_map.mpr ⟨6,mem_univ _,by change extendFiniteEmbedding i p hx (Fin.last 6) = z; simpa only [extendFiniteEmbedding_last] using hzp.symm⟩
      · exact hOld (map_subset_map.mpr (erase_subset _ _) hcore)
    · have ha1 : a = 1 := mem_singleton.mp ha
      subst a
      rw [hj1] at hadj
      have hz : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
      rw [hr.neighborhood] at hz
      obtain ⟨b,hb,rfl⟩ := mem_map.mp hz
      exact hOld (mem_map.mpr ⟨b,mem_univ _,rfl⟩)
  · exact hP

end Tuza06
