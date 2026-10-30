import Tuza06.SmallLinksK3
import Tuza06.Footprints

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem edges_hub_pair {v : V} {A : Finset V} (hv : v ∉ A) (hA : A.card = 2) :
    edges (insert v A) = {A} ∪ spokeEdges v A := by
  unfold edges
  rw [powersetCard_succ_insert hv 1]
  have hA' : A.powersetCard 2 = {A} := two_vertex_edges hA
  rw [hA',powersetCard_one]
  ext e
  simp [spokeEdges]

theorem edges_disjoint_of_inter_card {s t : Finset V} (h : (s ∩ t).card ≤ 1) :
    Disjoint (edges s) (edges t) := by
  apply disjoint_left.mpr
  intro e hes het
  have hsub : e ⊆ s ∩ t := subset_inter (mem_edges.mp hes).1 (mem_edges.mp het).1
  have hle := card_le_card hsub
  rw [(mem_edges.mp hes).2] at hle
  omega

theorem triangles_ne_of_edges_disjoint {s t : Finset V} (hs : s.card = 3)
    (hd : Disjoint (edges s) (edges t)) : s ≠ t := by
  intro h
  have he : edges s = ∅ := disjoint_self.mp (h ▸ hd)
  exact (edges_nonempty (s := s) (by omega)).ne_empty he

/-- Within-part graph edges of any vertex bipartition cover every triangle.
The vertex parts need not be disjoint for this cover upper bound. -/
theorem triangle_partition_cover {F : Finset (Finset V)} (hf : Triangles F)
    {A B : Finset V} (hsub : ∀ t ∈ F, t ⊆ A ∪ B) : Covers F (edges A ∪ edges B) := by
  classical
  intro t ht
  by_cases hA : 2 ≤ (t ∩ A).card
  · obtain ⟨e,he⟩ := edges_nonempty hA
    exact ⟨e,mem_union_left _ (edges_mono inter_subset_right he),edges_mono inter_subset_left he⟩
  · by_cases hB : 2 ≤ (t ∩ B).card
    · obtain ⟨e,he⟩ := edges_nonempty hB
      exact ⟨e,mem_union_right _ (edges_mono inter_subset_right he),edges_mono inter_subset_left he⟩
    · have htAB : t ⊆ (t ∩ A) ∪ (t ∩ B) := by
        intro x hx
        rcases mem_union.mp (hsub t ht hx) with hxA|hxB
        · exact mem_union_left _ (mem_inter.mpr ⟨hx,hxA⟩)
        · exact mem_union_right _ (mem_inter.mpr ⟨hx,hxB⟩)
      have hle := (card_le_card htAB).trans (card_union_le _ _)
      rw [hf t ht] at hle
      omega

/-- Append a displayed local packing after selecting a maximum residual packing
which avoids its surviving footprint. Every other selected edge was deleted. -/
theorem removeEdges_augment_avoiding {G : SimpleGraph V} {D E Q R : Finset (Finset V)}
    (hQ : Packing (triangles G) Q) (hR : Packing (triangles (removeEdgeFamily G D)) R)
    (hcR : R.card = nu (triangles (removeEdgeFamily G D)))
    (hdR : Disjoint (support R) E) (hQE : support Q ⊆ D ∪ E) :
    Q.card + nu (triangles (removeEdgeFamily G D)) ≤ nu (triangles G) := by
  classical
  have hRG := packing_mono (triangles_mono_graph (removeEdgeFamily_le G D)) hR
  have hcross : ∀ q ∈ Q, ∀ r ∈ R, Disjoint (edges q) (edges r) := by
    intro q hq r hr
    apply disjoint_left.mpr
    intro e heq her
    rcases mem_union.mp (hQE (mem_biUnion.mpr ⟨q,hq,heq⟩)) with heD|heE
    · exact removeEdgeFamily_surviving (hR.1 hr) her heD
    · exact disjoint_left.mp hdR (mem_biUnion.mpr ⟨r,hr,her⟩) heE
  have hpack := packing_mono (show triangles G ∪ triangles G ⊆ triangles G by simp)
    (packing_union hQ hRG hcross)
  have hdisj := cross_disjoint (triangles_mono hQ.1 (triangles_valid G)) hcross
  have hcard := packing_card_le hpack
  simpa [card_union_of_disjoint hdisj,hcR] using hcard

end Tuza06
