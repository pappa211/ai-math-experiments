import Tuza06.BlockAggregation

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem clique_avoid_edges {H : SimpleGraph V} {k : Finset V}
    (hk : H.IsClique (k : Set V)) (hsize : k.card = 4 ∨ k.card = 5)
    {D : Finset (Finset V)} (hcard : (D ∩ edges k).card ≤ 2)
    (hstar : ∃ a : V, ∀ e ∈ D ∩ edges k, a ∈ e) :
    ∃ P, Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧ Disjoint (support P) D := by
  classical
  rcases hsize with h4 | h5
  · obtain ⟨a, ha⟩ := hstar
    have hA : IndependentVertices H {a} := by
      intro x hx y hy hxy
      have hx' := mem_singleton.mp hx
      have hy' := mem_singleton.mp hy
      subst x; subst y
      exact H.irrefl hxy
    obtain ⟨t, htk, htH, htA⟩ := k4_face_avoiding hA ⟨hk, h4⟩
    have ht : t ∈ cliqueFamily k := mem_powersetCard.mpr ⟨htk, (mem_triangles.mp htH).card_eq⟩
    refine ⟨{t}, packing_singleton ht, by simp [(k4_parameters h4).1], ?_⟩
    apply disjoint_left.mpr
    intro e heP heD
    obtain ⟨s, hs, hes⟩ := mem_biUnion.mp heP
    have het : e ∈ edges t := (mem_singleton.mp hs) ▸ hes
    have hae := ha e (mem_inter.mpr ⟨heD, edges_mono htk het⟩)
    exact disjoint_left.mp htA ((mem_edges.mp het).1 hae) (mem_singleton_self a)
  · obtain ⟨P, hp, hpc, hpd⟩ := k5_avoid_two h5 (D := D ∩ edges k) inter_subset_right hcard
    refine ⟨P, hp, hpc.trans (k5_parameters h5).1.symm, ?_⟩
    apply disjoint_left.mpr
    intro e heP heD
    obtain ⟨t, ht, het⟩ := mem_biUnion.mp heP
    have hek := edges_mono (mem_powersetCard.mp (hp.1 ht)).1 het
    exact disjoint_left.mp hpd heP (mem_inter.mpr ⟨heD, hek⟩)

/-- The compatibility interface used by arbitrary local augmentations. -/
theorem blocks_avoid_edges {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {D : Finset (Finset V)}
    (hfoot : ∀ k ∈ K, (D ∩ edges k).card ≤ 2 ∧ ∃ a : V, ∀ e ∈ D ∩ edges k, a ∈ e) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧ Disjoint (support P) D := by
  classical
  have hex : ∀ k : Finset V, ∃ P : Finset (Finset V), k ∈ K →
      Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧ Disjoint (support P) D := by
    intro k
    by_cases hk : k ∈ K
    · obtain ⟨P, hp⟩ := clique_avoid_edges (hK.clique k hk) (hK.size k hk)
        (hfoot k hk).1 (hfoot k hk).2
      exact ⟨P, fun _ => hp⟩
    · exact ⟨∅, fun h => (hk h).elim⟩
  choose f hf using hex
  have hpack := fun k hk => (hf k hk).1
  refine ⟨K.biUnion f, blocks_combine_packings hK f hpack, ?_, ?_⟩
  · rw [blocks_packing_card hK f hpack, blocks_nu hK]
    exact sum_congr rfl (fun k hk => (hf k hk).2.1)
  · apply disjoint_left.mpr
    intro e he heD
    obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
    obtain ⟨k, hk, htk⟩ := mem_biUnion.mp ht
    exact disjoint_left.mp (hf k hk).2.2 (mem_biUnion.mpr ⟨t, htk, het⟩) heD

/-- A general symbolic footprint certificate: every forbidden edge has a terminal
in an independent set, and at most two forbidden edges are incident to any terminal. -/
theorem independent_star_footprint {H : SimpleGraph V} {A k : Finset V}
    (hA : IndependentVertices H A) (hk : H.IsClique (k : Set V)) (hkne : k.Nonempty)
    {D : Finset (Finset V)}
    (hterm : ∀ e ∈ D, ∃ a ∈ A, a ∈ e)
    (hdeg : ∀ a ∈ A, (D.filter (fun e => a ∈ e)).card ≤ 2) :
    (D ∩ edges k).card ≤ 2 ∧ ∃ a : V, ∀ e ∈ D ∩ edges k, a ∈ e := by
  classical
  by_cases hn : (D ∩ edges k).Nonempty
  · obtain ⟨e, he⟩ := hn
    obtain ⟨a, haA, hae⟩ := hterm e (mem_inter.mp he).1
    have hak : a ∈ k := (mem_edges.mp (mem_inter.mp he).2).1 hae
    have hcenter : ∀ f ∈ D ∩ edges k, a ∈ f := by
      intro f hf
      obtain ⟨b, hbA, hbf⟩ := hterm f (mem_inter.mp hf).1
      have hbk : b ∈ k := (mem_edges.mp (mem_inter.mp hf).2).1 hbf
      have hab : a = b := by
        by_contra hab
        exact hA a haA b hbA (hk hak hbk hab)
      exact hab ▸ hbf
    refine ⟨le_trans (card_le_card ?_) (hdeg a haA), a, hcenter⟩
    intro f hf
    exact mem_filter.mpr ⟨(mem_inter.mp hf).1, hcenter f hf⟩
  · have he : D ∩ edges k = ∅ := not_nonempty_iff_eq_empty.mp hn
    obtain ⟨a, _⟩ := hkne
    exact ⟨by simp [he], a, by simp [he]⟩

theorem blocks_avoid_terminal_edges {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {A : Finset V} (hA : IndependentVertices H A)
    {D : Finset (Finset V)} (hterm : ∀ e ∈ D, ∃ a ∈ A, a ∈ e)
    (hdeg : ∀ a ∈ A, (D.filter (fun e => a ∈ e)).card ≤ 2) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧ Disjoint (support P) D := by
  apply blocks_avoid_edges hK
  intro k hk
  have hkne : k.Nonempty := by
    apply card_pos.mp
    rcases hK.size k hk with h4 | h5 <;> omega
  exact independent_star_footprint hA (hK.clique k hk) hkne hterm hdeg

end Tuza06
