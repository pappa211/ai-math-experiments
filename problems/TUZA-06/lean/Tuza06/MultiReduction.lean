import Tuza06.PatternTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I] [DecidableEq I]

/-- A specified finite packing/cover reduction with any number of deleted centers. -/
structure FiniteReduction (I : Type*) [Fintype I] [DecidableEq I] where
  U : Finset I
  X : Finset (Finset I)
  P : Finset (Finset I)
  Upper : Finset (Finset I)
  independent : Independent P
  nonempty : P.Nonempty
  cover : ∀ t : ↥((univ : Finset I).powersetCard 3), edges t.val ⊆ Upper →
    ¬ Disjoint t.val U → ∃ e ∈ X, e ∈ edges t.val
  old_edges : ∀ p ∈ P, ∀ e ∈ edges p, Disjoint e U → e ∈ X

structure RealizesReduction (W : FiniteReduction I) (G : SimpleGraph V) (i : I ↪ V) : Prop where
  upper : ∀ a b : I, G.Adj (i a) (i b) → ({a,b} : Finset I) ∈ W.Upper
  center_neighbors : ∀ a ∈ W.U, ∀ z, G.Adj (i a) z → z ∈ (univ : Finset I).map i
  triangles : liftFamily i W.P ⊆ Tuza.triangles G

/-- Complete lost-triangle coverage is proved from actual neighborhoods, not
inferred from checking attachments up to a bounded order. -/
theorem realizes_reduction_witness (W : FiniteReduction I) {G : SimpleGraph V}
    (i : I ↪ V) (hr : RealizesReduction W G i) :
    ReductionWitness G (W.U.map i) (liftFamily i W.X) (liftFamily i W.P) := by
  classical
  constructor
  · exact ⟨hr.triangles,(independent_liftFamily i W.P).mpr W.independent⟩
  · intro t ht hU
    obtain ⟨v, hv, hvt⟩ := hU
    obtain ⟨a, ha, rfl⟩ := mem_map.mp hv
    have hsub : t ⊆ (univ : Finset I).map i := by
      intro z hz
      by_cases haz : i a = z
      · exact haz ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
      · exact hr.center_neighbors a ha z ((mem_triangles.mp ht).isClique hvt hz haz)
    let s := (univ : Finset I).filter (fun j => i j ∈ t)
    have heq : s.map i = t := by
      ext v
      simp only [s,mem_map,mem_filter,mem_univ,true_and]
      constructor
      · rintro ⟨j,hj,rfl⟩;exact hj
      · intro hv
        obtain ⟨j,_,rfl⟩ := mem_map.mp (hsub hv)
        exact ⟨j,hv,rfl⟩
    have hsc : s.card = 3 := by have hc := (mem_triangles.mp ht).card_eq; rw [← heq,card_map] at hc;exact hc
    have hsU : ¬ Disjoint s W.U := by
      intro hd
      exact disjoint_left.mp hd (mem_filter.mpr ⟨mem_univ _,hvt⟩) ha
    have hsUpper : edges s ⊆ W.Upper := by
      intro e he
      obtain ⟨b,c,hbc,rfl⟩ := card_eq_two.mp (mem_edges.mp he).2
      apply hr.upper b c
      exact (mem_triangles.mp ht).isClique
        (mem_filter.mp ((mem_edges.mp he).1 (by simp))).2
        (mem_filter.mp ((mem_edges.mp he).1 (by simp))).2
        (fun h => hbc (i.injective h))
    obtain ⟨e, heX, hes⟩ := W.cover ⟨s,mem_powersetCard.mpr ⟨subset_univ _,hsc⟩⟩ hsUpper hsU
    refine ⟨e.map i,mem_liftFamily.mpr ⟨e,heX,rfl⟩,?_⟩
    rw [← heq,edges_map]
    exact mem_liftFamily.mpr ⟨e,hes,rfl⟩
  · intro p hp e hep heU
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp hp
    rw [edges_map] at hep
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp hep
    exact mem_liftFamily.mpr ⟨f,W.old_edges s hs f hf ((Finset.disjoint_map i).mp heU),rfl⟩

theorem minimal_no_finite_strict_reduction (W : FiniteReduction I) {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : I ↪ V) (hr : RealizesReduction W G i)
    (hsize : W.X.card < 2 * W.P.card) : False := by
  have hw := realizes_reduction_witness W i hr
  have hn : (liftFamily i W.P).Nonempty := by
    obtain ⟨p,hp⟩ := W.nonempty
    exact ⟨p.map i,mem_liftFamily.mpr ⟨p,hp,rfl⟩⟩
  exact minimal_no_strict_reduction hG hw hn (by simpa only [card_liftFamily] using hsize)

theorem minimal_finite_reduction (W : FiniteReduction I) {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : I ↪ V) (hr : RealizesReduction W G i)
    (hsize : W.X.card ≤ 2 * W.P.card) :
    nu (triangles G) = nu (triangles (remove G (W.U.map i) (liftFamily i W.X))) + W.P.card ∧
    ComponentCliques (remove G (W.U.map i) (liftFamily i W.X)) := by
  have hw := realizes_reduction_witness W i hr
  have hn : (liftFamily i W.P).Nonempty := by
    obtain ⟨p,hp⟩ := W.nonempty
    exact ⟨p.map i,mem_liftFamily.mpr ⟨p,hp,rfl⟩⟩
  have hg := hG.2 _ (remove_le _ _ _) (reduction_witness_proper hw hn)
  have hp := reduction_witness_packing hw
  rw [card_liftFamily] at hp
  have hc := reduction_witness_cover hw
  rw [card_liftFamily] at hc
  have ha := balanced_accounting (failure_lower_bound hG.1) hg.1 hp
    (show tau (triangles G) ≤ tau (triangles (remove G (W.U.map i) (liftFamily i W.X))) + 2 * W.P.card by omega)
  exact ⟨ha.2.1,hg.2 ha.2.2⟩

/-- A complete finite terminal-star augmentation after a multi-center reduction. -/
theorem minimal_no_terminal_augmentation (W : FiniteReduction I) {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : I ↪ V) (hr : RealizesReduction W G i)
    (hsize : W.X.card ≤ 2 * W.P.card)
    (Aug D : Finset (Finset I)) (A : Finset I)
    (hInd : Independent Aug) (hAugG : liftFamily i Aug ⊆ triangles G)
    (hGain : W.P.card < Aug.card)
    (hOld : ∀ p ∈ Aug, ∀ e ∈ edges p, Disjoint e W.U → e ∉ W.X → e ∈ D)
    (hA : edges A ⊆ W.X)
    (hTerm : ∀ e ∈ D, ∃ a ∈ A, a ∈ e)
    (hDeg : ∀ a ∈ A, (D.filter (fun e => a ∈ e)).card ≤ 2) : False := by
  classical
  have hb := minimal_finite_reduction W hG i hr hsize
  let H := remove G (W.U.map i) (liftFamily i W.X)
  obtain ⟨K,hK⟩ := componentCliques_decomposition (show ComponentCliques H from hb.2)
  have hAi : IndependentVertices H (A.map i) := by
    intro a ha b hb hadj
    obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
    obtain ⟨y,hy,rfl⟩ := mem_map.mp hb
    have hxy : x ≠ y := fun h => G.irrefl (congrArg i h ▸ hadj.1)
    have heX : ({x,y} : Finset I) ∈ W.X := hA (mem_edges.mpr
      ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hx hy,by simp [hxy]⟩)
    exact hadj.2.2.2 (mem_liftFamily.mpr ⟨{x,y},heX,by simp only [map_insert,map_singleton]⟩)
  have hTermI : ∀ e ∈ liftFamily i D, ∃ a ∈ A.map i, a ∈ e := by
    intro e he
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp he
    obtain ⟨a,ha,hae⟩ := hTerm s hs
    exact ⟨i a,mem_map.mpr ⟨a,ha,rfl⟩,by simpa using hae⟩
  have hDegI : ∀ a ∈ A.map i, ((liftFamily i D).filter (fun e => a ∈ e)).card ≤ 2 := by
    intro a ha
    obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
    rw [lifted_incidence_card]
    exact hDeg x hx
  obtain ⟨P,hP,hcP,hdP⟩ := blocks_avoid_terminal_edges hK hAi hTermI hDegI
  have hOldI : ∀ p ∈ liftFamily i Aug, ∀ e ∈ edges p, H.IsNClique 2 e → e ∈ liftFamily i D := by
    intro p hp e hep heH
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp hp
    rw [edges_map] at hep
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp hep
    have hstatus := remove_edge_status heH
    have hfU : Disjoint f W.U := (Finset.disjoint_map i).mp hstatus.1
    have hfX : f ∉ W.X := fun h => hstatus.2 (mem_liftFamily.mpr ⟨f,h,rfl⟩)
    exact mem_liftFamily.mpr ⟨f,hOld s hs f hf hfU hfX,rfl⟩
  have hAugP : Packing (triangles G) (liftFamily i Aug) :=
    ⟨hAugG,(independent_liftFamily i Aug).mpr hInd⟩
  have hgain := packing_augmentation_avoiding (remove_le G (W.U.map i) _) hP hcP hdP hAugP hOldI
  have hnu : nu (triangles G) = nu (triangles H) + W.P.card := hb.1
  change (liftFamily i Aug).card + nu (triangles H) ≤ nu (triangles G) at hgain
  rw [card_liftFamily] at hgain
  omega
end Tuza06
