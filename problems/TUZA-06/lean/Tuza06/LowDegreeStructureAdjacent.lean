import Tuza06.LowDegreeStructureDominatingFive

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A degree-five missing-edge endpoint has exactly one neighbor outside the
six-vertex near-clique core, obtained from its actual degree count. -/
theorem near_endpoint_private_neighbor {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 1) = 5) :
    ∃ p ∉ (univ : Finset (Fin 6)).map i,
      peelNeighbors G univ (i 1) = insert p (({0,3,4,5} : Finset (Fin 6)).map i) := by
  classical
  let K : Finset (Fin 6) := {0,3,4,5}
  let N := peelNeighbors G univ (i 1)
  have hK : K.map i ⊆ N := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    have he := (by decide : ∀ a ∈ ({0,3,4,5} : Finset (Fin 6)), ({1,a} : Finset (Fin 6)) ∈ fiveNearCore) a ha
    exact mem_filter.mpr ⟨mem_univ _,(hr.core_edges 1 a).mpr he⟩
  have hKcard : (K.map i).card = 4 := by rw [card_map]; decide
  have hNcard : N.card = 5 := hdeg
  have hRest : (N \ K.map i).card = 1 := by rw [card_sdiff_of_subset hK,hNcard,hKcard]
  obtain ⟨p,hpEq⟩ := card_eq_one.mp hRest
  have hpRest : p ∈ N \ K.map i := by rw [hpEq]; simp
  have hpN := (mem_sdiff.mp hpRest).1
  have hpK := (mem_sdiff.mp hpRest).2
  have hpOut : p ∉ (univ : Finset (Fin 6)).map i := by
    intro hp
    obtain ⟨a,ha,hap⟩ := mem_map.mp hp
    have hadj : G.Adj (i 1) (i a) := by simpa only [hap] using (mem_filter.mp hpN).2
    have he := (hr.core_edges 1 a).mp hadj
    have haK := (by decide : ∀ a : Fin 6, ({1,a} : Finset (Fin 6)) ∈ fiveNearCore → a ∈ ({0,3,4,5} : Finset (Fin 6))) a he
    exact hpK (mem_map.mpr ⟨a,haK,hap⟩)
  have hNeq : N = insert p (K.map i) := by
    calc
      N = (N \ K.map i) ∪ K.map i := (sdiff_union_of_subset hK).symm
      _ = insert p (K.map i) := by rw [hpEq,singleton_union]
  exact ⟨p,hpOut,hNeq⟩

theorem near_endpoint_private_spokes {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 1) = 5) {p : V}
    (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i 1) = insert p (({0,3,4,5} : Finset (Fin 6)).map i)) :
    ∀ a ∈ ({1,3,4,5} : Finset (Fin 6)), G.Adj (i a) p := by
  classical
  have hpN : p ∈ peelNeighbors G univ (i 1) := by rw [hN]; simp
  have hNear := minimal_degree_five_near hG hdeg
  have h0N : i 0 ∈ peelNeighbors G univ (i 1) := by rw [hN]; exact mem_insert_of_mem (mem_map.mpr ⟨0,by simp,rfl⟩)
  have hp0 : p ≠ i 0 := fun h => hpOut (mem_map.mpr ⟨0,mem_univ _,h.symm⟩)
  have hNo0 : ¬ G.Adj (i 0) p := by
    intro h
    have hp : p ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hr.neighborhood] at hp
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hp
    exact hpOut (mem_map.mpr ⟨a,mem_univ _,rfl⟩)
  intro a ha
  by_cases ha1 : a = 1
  · simpa only [ha1] using (mem_filter.mp hpN).2
  · have haW : a ∈ ({3,4,5} : Finset (Fin 6)) := (mem_insert.mp ha).resolve_left ha1
    have ha0 : a ≠ 0 := by intro h; subst a; simp at haW
    have hap : i a ≠ p := fun h => hpOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
    have hpa := hap.symm
    have haN : i a ∈ peelNeighbors G univ (i 1) := by
      rw [hN]
      exact mem_insert_of_mem (mem_map.mpr ⟨a,by simp only [mem_insert,mem_singleton] at haW ⊢; tauto,rfl⟩)
    have hneq : ({p,i a} : Finset V) ≠ {i 0,p} := by
      intro h
      have haPair : i a ∈ ({i 0,p} : Finset V) := h ▸ (by simp)
      rcases mem_insert.mp haPair with haZero|haP
      · exact ha0 (i.injective haZero)
      · exact hap (mem_singleton.mp haP)
    exact (nearClique_adj_of_missing hNear h0N hpN hp0.symm hNo0 hpN haN hpa hneq).symm

private def adjacentOrder : Fin 7 → Fin 7 := ![1,0,3,4,5,6,2]
private theorem adjacentOrder_inj : Function.Injective adjacentOrder := by decide
private def adjacentReorder : Fin 7 ↪ Fin 7 := ⟨adjacentOrder,adjacentOrder_inj⟩
private def extraTerm : Finset (Fin 6) := {1,3,4,5}
private def extraEdges : Finset (Finset (Fin 7)) := {{1,6},{3,6},{4,6},{5,6}}
private def adjacentKnown : Finset (Finset (Fin 7)) := liftFamily sixIntoSeven fiveNearCore ∪ extraEdges
private theorem extra_repr : ∀ f : ↥extraEdges, ∃ a : ↥extraTerm, f.val = {a.val.castSucc,6} := by decide
private theorem adjacent_P : ∀ p : ↥AdjacentLow.P,
    (p.val.map adjacentReorder).card = 3 ∧ edges (p.val.map adjacentReorder) ⊆ adjacentKnown := by decide
private theorem adjacent_Aug : ∀ p : ↥AdjacentLow.Aug,
    (p.val.map adjacentReorder).card = 3 ∧ edges (p.val.map adjacentReorder) ⊆ adjacentKnown := by decide
private theorem adjacent_upper_cases : ∀ a b : Fin 7, ({a,b} : Finset (Fin 7)) ∉ AdjacentLow.Upper →
    a = b ∨ (a = 0 ∧ b = 6) ∨ (a = 6 ∧ b = 0) ∨ (a = 1 ∧ b = 5) ∨ (a = 5 ∧ b = 1) := by decide

/-- The remaining adjacent degree-five pattern is derived from an actual
near-clique endpoint and its unique private neighbor. -/
theorem minimal_no_near_endpoint_degree_five {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 1) = 5) : False := by
  classical
  obtain ⟨p,hpOut,hN⟩ := near_endpoint_private_neighbor hr hdeg
  have hExtra := near_endpoint_private_spokes hG hr hdeg hpOut hN
  have hx : ∀ a : Fin 6, i a ≠ p := fun a h => hpOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let e := extendFiniteEmbedding i p hx
  let j := adjacentReorder.trans e
  have heOld : sixIntoSeven.trans e = i := extended_six_composition i p hx
  have he6 : e 6 = p := extendFiniteEmbedding_last i p hx
  have hj0 : j 0 = i 1 := by rfl
  have hj1 : j 1 = i 0 := by rfl
  have hj5 : j 5 = p := by rfl
  have hj6 : j 6 = i 2 := by rfl
  have hRange : (univ : Finset (Fin 7)).map j = (univ : Finset (Fin 7)).map e := by
    change (univ : Finset (Fin 7)).map (adjacentReorder.trans e) = _
    rw [← map_map,finite_embedding_range_eq adjacentReorder]
  have hOldRange : (univ : Finset (Fin 6)).map i ⊆ (univ : Finset (Fin 7)).map e := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    exact mem_map.mpr ⟨a.castSucc,mem_univ _,extendFiniteEmbedding_old i p hx a⟩
  have hKnown : ∀ f ∈ adjacentKnown, G.IsNClique 2 (f.map e) := by
    intro f hf
    rcases mem_union.mp hf with hold|hextra
    · obtain ⟨g,hg,rfl⟩ := mem_liftFamily.mp hold
      have hg2 := (mem_edges.mp (show g ∈ edges (univ : Finset (Fin 6)) from sdiff_subset hg)).2
      have hmap : (g.map sixIntoSeven).map e = g.map i := by rw [map_map]; change g.map (sixIntoSeven.trans e) = _; rw [heOld]
      simpa only [hmap] using core_mapped_edge hr hg2 hg
    · obtain ⟨a,ha⟩ := extra_repr ⟨f,hextra⟩
      change f = {(a.val).castSucc, 6} at ha
      rw [ha,map_insert,map_singleton]
      have hea : e a.val.castSucc = i a.val := extendFiniteEmbedding_old i p hx a.val
      rw [hea,he6]
      exact sparse_pair_edge (hExtra a.val a.property)
  have hP : liftFamily j AdjacentLow.P ⊆ triangles G := by
    rw [← liftFamily_comp]
    apply mapped_triangles_of_edges e hKnown
    intro t ht
    obtain ⟨q,hq,rfl⟩ := mem_liftFamily.mp ht
    exact adjacent_P ⟨q,hq⟩
  have hAug : liftFamily j AdjacentLow.Aug ⊆ triangles G := by
    rw [← liftFamily_comp]
    apply mapped_triangles_of_edges e hKnown
    intro t ht
    obtain ⟨q,hq,rfl⟩ := mem_liftFamily.mp ht
    exact adjacent_Aug ⟨q,hq⟩
  have hMissing06 : ¬ G.Adj (j 0) (j 6) := by
    rw [hj0,hj6]
    exact fun h => (by decide : ({1,2} : Finset (Fin 6)) ∉ fiveNearCore) ((hr.core_edges 1 2).mp h)
  have hMissing15 : ¬ G.Adj (j 1) (j 5) := by
    rw [hj1,hj5]
    intro h
    have hpN : p ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hr.neighborhood] at hpN
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hpN
    exact hpOut (mem_map.mpr ⟨a,mem_univ _,rfl⟩)
  have hreal : RealizesReduction AdjacentLow.witness G j := by
    constructor
    · intro a b hadj
      by_contra hn
      rcases adjacent_upper_cases a b hn with heq|h06|h60|h15|h51
      · exact G.irrefl (congrArg j heq ▸ hadj)
      · exact hMissing06 (by simpa only [h06.1,h06.2] using hadj)
      · exact hMissing06 (by simpa only [h60.1,h60.2] using hadj.symm)
      · exact hMissing15 (by simpa only [h15.1,h15.2] using hadj)
      · exact hMissing15 (by simpa only [h51.1,h51.2] using hadj.symm)
    · intro a ha z hadj
      rw [hRange]
      have ha' : a = 0 ∨ a = 1 := by simpa only [AdjacentLow.witness,AdjacentLow.U,mem_insert,mem_singleton] using ha
      rcases ha' with h0|h1
      · subst a
        rw [hj0] at hadj
        have hzN : z ∈ peelNeighbors G univ (i 1) := mem_filter.mpr ⟨mem_univ _,hadj⟩
        rw [hN] at hzN
        rcases mem_insert.mp hzN with hzp|hzK
        · exact mem_map.mpr ⟨6,mem_univ _,by simpa only [he6] using hzp.symm⟩
        · obtain ⟨b,hb,rfl⟩ := mem_map.mp hzK
          exact hOldRange (mem_map.mpr ⟨b,mem_univ _,rfl⟩)
      · subst a
        rw [hj1] at hadj
        have hzN : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
        rw [hr.neighborhood] at hzN
        obtain ⟨b,hb,rfl⟩ := mem_map.mp hzN
        exact hOldRange (mem_map.mpr ⟨b,mem_univ _,rfl⟩)
    · exact hP
  exact AdjacentLow.excluded hG j hreal hAug

end Tuza06
