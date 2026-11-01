import Tuza07.Targets
import Tuza06.Footprints
import Tuza.IntersectingStructure

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

@[simp] theorem mem_newTriangles {H G : SimpleGraph V} {t : Finset V} :
    t ∈ newTriangles H G ↔ t ∈ triangles G ∧ t ∉ triangles H := by
  classical
  exact mem_sdiff

theorem triangles_eq_union_new {H G : SimpleGraph V} (hHG : H ≤ G) :
    triangles G = triangles H ∪ newTriangles H G := by
  classical
  exact (union_sdiff_of_subset (triangles_mono_graph hHG)).symm

theorem no_new_triangles_optima {H G : SimpleGraph V} (hHG : H ≤ G)
    (hn : newTriangles H G = ∅) :
    nu (triangles G) = nu (triangles H) ∧ tau (triangles G) = tau (triangles H) := by
  have he := triangles_eq_union_new hHG
  rw [hn, union_empty] at he
  exact ⟨congrArg nu he, congrArg tau he⟩

theorem new_triangle_not_subset_block {H G : SimpleGraph V} {t k : Finset V}
    (ht : t ∈ newTriangles H G) (hk : H.IsClique (k : Set V)) : ¬ t ⊆ k := by
  intro htk
  exact (mem_newTriangles.mp ht).2 (cliqueFamily_subset_triangles hk
    (mem_powersetCard.mpr ⟨htk, (mem_triangles.mp (mem_newTriangles.mp ht).1).card_eq⟩))

theorem new_triangle_block_overlap {H G : SimpleGraph V} {t k : Finset V}
    (ht : t ∈ newTriangles H G) (hk : H.IsClique (k : Set V)) :
    (edges t ∩ edges k).card ≤ 1 :=
  triple_edge_overlap (mem_triangles.mp (mem_newTriangles.mp ht).1).card_eq
    (new_triangle_not_subset_block ht hk)

theorem support_mono {F K : Finset (Finset V)} (h : F ⊆ K) : support F ⊆ support K := by
  classical
  intro e he
  obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
  exact mem_biUnion.mpr ⟨t, h ht, het⟩

theorem supported_cover_graph {G : SimpleGraph V} {C : Finset (Finset V)}
    (hc : Covers (triangles G) C) (hs : C ⊆ support (triangles G)) : GraphCover G C :=
  ⟨hc, fun e he => supported_edge_is_graph_edge (hs he)⟩

theorem supported_intersecting_cover {F : Finset (Finset V)} (hf : Triangles F)
    (hi : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t)) :
    ∃ C, Covers F C ∧ C ⊆ support F ∧ C.card ≤ 2 := by
  obtain ⟨C, hc, hcard, hs⟩ := exists_min_cover_supported hf
  exact ⟨C, hc, hs, hcard.le.trans (intersecting_cover hf hi)⟩

theorem singleton_footprint_star {D : Finset (Finset V)} {k : Finset V}
    (hk : k.Nonempty) (hD : D ⊆ edges k) (hc : D.card ≤ 1) :
    ∃ a : V, ∀ e ∈ D, a ∈ e := by
  classical
  by_cases hn : D.Nonempty
  · obtain ⟨e, he⟩ := hn
    obtain ⟨a, ha⟩ := card_pos.mp (show 0 < e.card by rw [(mem_edges.mp (hD he)).2]; decide)
    refine ⟨a, fun f hf => ?_⟩
    have hfe : f = e := card_le_one.mp hc f hf e he
    exact hfe.symm ▸ ha
  · obtain ⟨a, _⟩ := hk
    exact ⟨a, fun e he => (hn ⟨e,he⟩).elim⟩

theorem blocks_avoid_new_triangle {H G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {t : Finset V} (ht : t ∈ newTriangles H G) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧
      Disjoint (support P) (edges t) := by
  apply blocks_avoid_edges hK
  intro k hk
  have hcard := new_triangle_block_overlap ht (hK.clique k hk)
  have hkne : k.Nonempty := card_pos.mp (by rcases hK.size k hk with h4|h5 <;> omega)
  exact ⟨by omega, singleton_footprint_star hkne inter_subset_right hcard⟩

/-- This is a displayed union of a chosen old packing and a finite new packing. -/
theorem append_packing {H G : SimpleGraph V} (hHG : H ≤ G)
    {P Q : Finset (Finset V)} (hP : Packing (triangles H) P)
    (hQ : Packing (triangles G) Q) (hd : Disjoint (support P) (support Q)) :
    Packing (triangles G) (P ∪ Q) ∧ (P ∪ Q).card = P.card + Q.card := by
  classical
  have hPG := packing_mono (triangles_mono_graph hHG) hP
  have hcross : ∀ p ∈ P, ∀ q ∈ Q, Disjoint (edges p) (edges q) := by
    intro p hp q hq
    exact hd.mono (fun e he => mem_biUnion.mpr ⟨p,hp,he⟩)
      (fun e he => mem_biUnion.mpr ⟨q,hq,he⟩)
  exact ⟨packing_mono (by simp) (packing_union hPG hQ hcross),
    card_union_of_disjoint (cross_disjoint (triangles_mono hPG.1 (triangles_valid G)) hcross)⟩

theorem new_triangle_gain_witness {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hn : (newTriangles H G).Nonempty) :
    ∃ P, Packing (triangles G) P ∧ P.card = nu (triangles H) + 1 := by
  classical
  obtain ⟨t, ht⟩ := hn
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  obtain ⟨P,hP,hcard,hd⟩ := blocks_avoid_new_triangle hK ht
  have ha := append_packing hHG hP (packing_singleton (mem_newTriangles.mp ht).1)
    (by simpa [support] using hd)
  exact ⟨P ∪ {t}, ha.1, by simpa [hcard] using ha.2⟩

theorem new_triangle_gain {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hn : (newTriangles H G).Nonempty) :
    nu (triangles H) + 1 ≤ nu (triangles G) := by
  obtain ⟨P,hP,hc⟩ := new_triangle_gain_witness hH hHG hn
  exact hc ▸ packing_card_le hP
end Tuza07
