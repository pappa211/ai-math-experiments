import Tuza07.RigidityCore

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- This is the inherited, fully general book-or-K4 lemma, stated with a literal
common graph edge and no bound on the ambient vertex type. -/
theorem book_or_k4 {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : F ⊆ triangles G) (hn : F.Nonempty)
    (hi : ∀ p ∈ F, ∀ q ∈ F, ¬ Disjoint (edges p) (edges q)) :
    (∃ e, G.IsNClique 2 e ∧ ∀ t ∈ F, e ∈ edges t) ∨
    (∃ U, G.IsNClique 4 U ∧ F ⊆ cliqueFamily U) := by
  classical
  have hf := triangles_mono hF (triangles_valid G)
  have hnu : nu F = 1 := by
    apply le_antisymm
    · apply nu_le_of_packings
      intro P hPF hP
      apply card_le_one.mpr
      intro p hp q hq
      by_contra hpq
      exact hi p (mem_powerset.mp hPF hp) q (mem_powerset.mp hPF hq) (hP p hp q hq hpq)
    · exact nu_pos hn
  by_cases hc : tau F ≤ 1
  · obtain ⟨C,hC,hcard,hsub⟩ := exists_min_cover_supported hf
    obtain ⟨t,ht⟩ := hn
    obtain ⟨e,he,het⟩ := hC t ht
    left
    refine ⟨e,supported_edge_is_graph_edge (support_mono hF (hsub he)),?_⟩
    intro q hq
    obtain ⟨f,hfC,hfq⟩ := hC q hq
    have hfe : f = e := card_le_one.mp (by omega) f hfC e he
    exact hfe ▸ hfq
  · obtain ⟨U,hU,hsub⟩ := intersecting_k4_structure hF hnu (by omega)
    exact Or.inr ⟨U,hU,fun t ht => mem_powersetCard.mpr ⟨hsub t ht,hf t ht⟩⟩

theorem equality_new_tau_gt_one {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (htau : tau (triangles G) = 2 * nu (triangles H) + 2) :
    1 < tau (newTriangles H G) := by
  have hle := tau_union_le (triangles_valid H)
    (triangles_mono (show newTriangles H G ⊆ triangles G from sdiff_subset) (triangles_valid G))
  rw [← triangles_eq_union_new hHG,componentCliques_equality hH] at hle
  omega

theorem equality_intersecting_newK4 {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2)
    (hi : ∀ p ∈ newTriangles H G, ∀ q ∈ newTriangles H G, ¬ Disjoint (edges p) (edges q)) :
    NewK4 H G := by
  classical
  have hntau := equality_new_tau_gt_one hH hHG htau
  have hn : (newTriangles H G).Nonempty := by
    by_contra h
    have hz := not_nonempty_iff_eq_empty.mp h
    simp [hz] at hntau
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  obtain hbook|⟨U,hU,hsub⟩ := book_or_k4 sdiff_subset hn hi
  · obtain ⟨e,_,he⟩ := hbook
    have hc : Covers (newTriangles H G) {e} := fun t ht => ⟨e,mem_singleton_self _,he t ht⟩
    have hh := tau_le_card hc
    simp only [card_singleton] at hh
    omega
  · have hu : ∀ p ∈ newTriangles H G, Disjoint (edges p) (support (triangles H)) := by
      intro p hp
      apply disjoint_left.mpr
      intro e hep heH
      obtain ⟨C,hC,_,hcard,hpC,_⟩ := selected_block_cover hK hp
      have heC := hpC (mem_inter.mpr ⟨hep,heH⟩)
      have heU := edges_mono (mem_powersetCard.mp (hsub hp)).1 hep
      have hncover := k4_opposite_cover hU.card_eq
        (triangles_mono (show newTriangles H G ⊆ triangles G from sdiff_subset) (triangles_valid G))
        (fun t ht => (mem_powersetCard.mp (hsub ht)).1) heU
      have hbound := cover_with_one_more hHG hC heC hncover
      omega
    have hUs : edges U ⊆ support (newTriangles H G) := by
      intro e heU
      by_contra heN
      have hcover := k4_opposite_cover hU.card_eq
        (triangles_mono (show newTriangles H G ⊆ triangles G from sdiff_subset) (triangles_valid G))
        (fun t ht => (mem_powersetCard.mp (hsub ht)).1) heU
      have hc : Covers (newTriangles H G) {U \ e} := by
        intro t ht
        obtain ⟨f,hf,hft⟩ := hcover t ht
        rcases mem_insert.mp hf with hf|hf
        · exact (heN (mem_biUnion.mpr ⟨t,ht,hf ▸ hft⟩)).elim
        · exact ⟨f,hf,hft⟩
      have hb := tau_le_card hc
      simp only [card_singleton] at hb
      omega
    have hdisj : Disjoint (edges U) (support (triangles H)) := by
      apply disjoint_left.mpr
      intro e heU heH
      obtain ⟨p,hp,hep⟩ := mem_biUnion.mp (hUs heU)
      exact disjoint_left.mp (hu p hp) hep heH
    refine ⟨U,hU.card_eq,subset_antisymm hsub ?_,hdisj⟩
    intro t ht
    have htG := cliqueFamily_subset_triangles hU.isClique ht
    apply mem_newTriangles.mpr
    refine ⟨htG,?_⟩
    intro htH
    obtain ⟨e,he⟩ := edges_nonempty (s:=t) (by rw [(mem_powersetCard.mp ht).2]; decide)
    exact disjoint_left.mp hdisj (edges_mono (mem_powersetCard.mp ht).1 he)
      (mem_biUnion.mpr ⟨t,htH,he⟩)
end Tuza07
