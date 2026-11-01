import Tuza07.Local

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

theorem block_edges_supported {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k : Finset V} (hk : k ∈ K) :
    edges k ⊆ support (triangles H) := by
  rw [← support_cliqueFamily (show 3 ≤ k.card by rcases hK.size k hk with h4|h5 <;> omega)]
  exact support_mono (cliqueFamily_subset_triangles (hK.clique k hk))

theorem selected_block_cover {H G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {p : Finset V} (hp : p ∈ newTriangles H G) :
    ∃ C, Covers (triangles H) C ∧ C ⊆ support (triangles H) ∧
      C.card ≤ 2 * nu (triangles H) ∧
      (edges p ∩ support (triangles H) ⊆ C) ∧
      ∀ k ∈ K, ∀ e ∈ edges p ∩ edges k, k.card = 4 → k \ e ∈ C := by
  classical
  have hex : ∀ k : Finset V, ∃ C : Finset (Finset V), k ∈ K →
      Covers (cliqueFamily k) C ∧ C ⊆ edges k ∧ C.card ≤ 2 * nu (cliqueFamily k) ∧
      ∀ e ∈ edges p ∩ edges k, e ∈ C ∧ (k.card = 4 → k \ e ∈ C) := by
    intro k
    by_cases hk : k ∈ K
    · by_cases hn : (edges p ∩ edges k).Nonempty
      · obtain ⟨e,he⟩ := hn
        obtain ⟨C,hcov,hsub,hcard,heC,hopp⟩ := block_cover_for_edge (hK.size k hk) (mem_inter.mp he).2
        refine ⟨C,fun _ => ⟨hcov,hsub,hcard,?_⟩⟩
        intro f hf
        have hfe := card_le_one.mp (new_triangle_block_overlap hp (hK.clique k hk)) f hf e he
        subst f
        exact ⟨heC,hopp⟩
      · obtain ⟨C,hcov,hcard,hsub⟩ := exists_min_cover_supported (cliqueFamily_valid k)
        refine ⟨C,fun _ => ⟨hcov,hsub.trans (blocks_support_subset k),?_,?_⟩⟩
        · rcases hK.size k hk with h4|h5
          · rw [hcard,(k4_parameters h4).1,(k4_parameters h4).2]
          · rw [hcard,(k5_parameters h5).1,(k5_parameters h5).2]
        · intro e he; exact (hn ⟨e,he⟩).elim
    · exact ⟨∅,fun h => (hk h).elim⟩
  choose f hf using hex
  let C := K.biUnion f
  have hsub : C ⊆ support (triangles H) := by
    intro e he
    obtain ⟨k,hk,hek⟩ := mem_biUnion.mp he
    exact block_edges_supported hK hk ((hf k hk).2.1 hek)
  refine ⟨C,?_,hsub,?_,?_,?_⟩
  · intro t ht
    obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
    obtain ⟨e,he,het⟩ := (hf k hk).1 t (mem_powersetCard.mpr ⟨htk,(mem_triangles.mp ht).card_eq⟩)
    exact ⟨e,mem_biUnion.mpr ⟨k,hk,he⟩,het⟩
  · calc
      C.card ≤ ∑ k ∈ K, (f k).card := card_biUnion_le
      _ ≤ ∑ k ∈ K, 2 * nu (cliqueFamily k) := sum_le_sum (fun k hk => (hf k hk).2.2.1)
      _ = 2 * nu (triangles H) := by rw [blocks_nu hK,mul_sum]
  · intro e he
    obtain ⟨t,ht,het⟩ := mem_biUnion.mp (mem_inter.mp he).2
    obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
    have hek : e ∈ edges k := edges_mono htk het
    exact mem_biUnion.mpr ⟨k,hk,((hf k hk).2.2.2 e (mem_inter.mpr ⟨(mem_inter.mp he).1,hek⟩)).1⟩
  · intro k hk e he h4
    exact mem_biUnion.mpr ⟨k,hk,((hf k hk).2.2.2 e he).2 h4⟩

/-- All footprint edges outside old triangle supports are charged, including old
triangle-free edges. No optimum of G is consulted in this construction. -/
theorem selected_triangle_completion {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {p : Finset V}
    (hp : p ∈ newTriangles H G) :
    (∃ P, Packing (triangles G) P ∧ P.card = nu (triangles H) + 2) ∨
    (∃ C, GraphCover G C ∧
      C.card ≤ 2 * nu (triangles H) + (edges p \ support (triangles H)).card) := by
  classical
  obtain ⟨C,hCH,hCs,hCc,hpC,hopp⟩ := selected_block_cover hK hp
  let D := edges p \ support (triangles H)
  have hpCD : edges p ⊆ C ∪ D := by
    intro e he
    by_cases hs : e ∈ support (triangles H)
    · exact mem_union_left _ (hpC (mem_inter.mpr ⟨he,hs⟩))
    · exact mem_union_right _ (mem_sdiff.mpr ⟨he,hs⟩)
  by_cases hcover : Covers (triangles G) (C ∪ D)
  · right
    refine ⟨C ∪ D, supported_cover_graph hcover ?_,?_⟩
    · apply union_subset
      · exact hCs.trans (support_mono (triangles_mono_graph hHG))
      · intro e he
        exact mem_biUnion.mpr ⟨p,(mem_newTriangles.mp hp).1,(mem_sdiff.mp he).1⟩
    · exact (card_union_le C D).trans (Nat.add_le_add_right hCc _)
  · left
    simp only [Covers,not_forall] at hcover
    obtain ⟨q,hqG,hq⟩ := hcover
    have havoid : ∀ e ∈ C ∪ D, e ∉ edges q := by
      intro e he het
      exact hq ⟨e,he,het⟩
    have hqH : q ∉ triangles H := by
      intro hqH
      obtain ⟨e,he,het⟩ := hCH q hqH
      exact havoid e (mem_union_left _ he) het
    have hqnew : q ∈ newTriangles H G := mem_newTriangles.mpr ⟨hqG,hqH⟩
    have hd : Disjoint (edges p) (edges q) := disjoint_left.mpr (fun e hep heq => havoid e (hpCD hep) heq)
    apply compatible_pair_packing hHG hK hp hqnew hd
    intro k hk h4 e he f hf hdisj
    have hfe := opposite_eq_complement h4 (mem_inter.mp he).2 (mem_inter.mp hf).2 hdisj
    exact havoid f (mem_union_left _ (hfe.symm ▸ hopp k hk e he h4)) (mem_inter.mp hf).1

theorem unsupported_completion {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K)
    (hu : ∀ t ∈ newTriangles H G, Disjoint (edges t) (support (triangles H))) :
    PackingOrCover H G := by
  classical
  by_cases hpair : ∃ p ∈ newTriangles H G, ∃ q ∈ newTriangles H G, Disjoint (edges p) (edges q)
  · obtain ⟨p,hp,q,hq,hd⟩ := hpair
    left
    apply compatible_pair_packing hHG hK hp hq hd
    intro k hk _ e he
    exact (disjoint_left.mp (hu p hp) (mem_inter.mp he).1
      (block_edges_supported hK hk (mem_inter.mp he).2)).elim
  · have hi : ∀ p ∈ newTriangles H G, ∀ q ∈ newTriangles H G, ¬ Disjoint (edges p) (edges q) := by
      intro p hp q hq hd
      exact hpair ⟨p,hp,q,hq,hd⟩
    obtain ⟨D,hD,hDs,hDc⟩ := supported_intersecting_cover
      (triangles_mono sdiff_subset (triangles_valid G)) hi
    obtain ⟨C,hC,hCc,hCs⟩ := exists_min_cover_supported (triangles_valid H)
    right
    refine ⟨C ∪ D,supported_cover_graph ?_ ?_,?_⟩
    · rw [triangles_eq_union_new hHG]
      exact covers_union hC hD
    · exact union_subset (hCs.trans (support_mono (triangles_mono_graph hHG)))
        (hDs.trans (support_mono sdiff_subset))
    · have hCe : C.card = 2 * nu (triangles H) := hCc.trans (blocks_equality hK)
      exact (card_union_le C D).trans (by omega)

theorem b1_constructive {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (_hn : (newTriangles H G).Nonempty) : PackingOrCover H G := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  by_cases hex : ∃ p ∈ newTriangles H G, ¬ Disjoint (edges p) (support (triangles H))
  · obtain ⟨p,hp,htouch⟩ := hex
    rcases selected_triangle_completion hHG hK hp with hpack|⟨C,hC,hcard⟩
    · exact Or.inl hpack
    · right
      refine ⟨C,hC,hcard.trans (Nat.add_le_add_left ?_ _)⟩
      have hp3 : (edges p).card = 3 := by
        rw [edges,card_powersetCard,(mem_triangles.mp (mem_newTriangles.mp hp).1).card_eq]; decide
      have hpos : 0 < (edges p ∩ support (triangles H)).card := card_pos.mpr (not_disjoint_iff_nonempty_inter.mp htouch)
      have he := card_sdiff_add_card_inter (edges p) (support (triangles H))
      omega
  · apply unsupported_completion hHG hK
    intro p hp
    by_contra hd
    exact hex ⟨p,hp,hd⟩

theorem b1_scalar {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hgain : nu (triangles G) = nu (triangles H) + 1) :
    tau (triangles G) ≤ 2 * nu (triangles H) + 2 := by
  classical
  have hn : (newTriangles H G).Nonempty := by
    by_contra h
    have he := no_new_triangles_optima hHG (not_nonempty_iff_eq_empty.mp h)
    omega
  rcases b1_constructive hH hHG hn with ⟨P,hP,hcard⟩|⟨C,hC,hcard⟩
  · have hle := packing_card_le hP; omega
  · exact (tau_le_card hC.1).trans hcard

theorem b1_strict {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hgain : nu (triangles G) = nu (triangles H) + 1)
    (hs : ∃ p ∈ newTriangles H G, 2 ≤ (edges p ∩ support (triangles H)).card) :
    tau (triangles G) ≤ 2 * nu (triangles H) + 1 := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  obtain ⟨p,hp,hpc⟩ := hs
  rcases selected_triangle_completion hHG hK hp with ⟨P,hP,hcard⟩|⟨C,hC,hcard⟩
  · have hle := packing_card_le hP; omega
  · have hp3 : (edges p).card = 3 := by
      rw [edges,card_powersetCard,(mem_triangles.mp (mem_newTriangles.mp hp).1).card_eq]; decide
    have he := card_sdiff_add_card_inter (edges p) (support (triangles H))
    have htau := tau_le_card hC.1
    omega
end Tuza07
