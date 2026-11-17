import Tuza24.LinkAPI

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A reducible witness is edge-disjoint from every surviving triangle. -/
theorem reduction_cross_disjoint {G : SimpleGraph V} {U : Finset V}
    {X P : Finset (Finset V)} (hw : ReductionWitness G U X P) :
    ∀ p ∈ P, ∀ t ∈ triangles (remove G U X), Disjoint (edges p) (edges t) := by
  intro p hp t ht
  apply disjoint_left.mpr
  intro e hep het
  have he := remove_triangle_edge_status ht het
  exact he.2 (hw.old_edges p hp e hep he.1)

/-- All lost triangles are covered, including outside pages on removed rim edges. -/
theorem reduction_lift_cover {G : SimpleGraph V} {U : Finset V}
    {X P D : Finset (Finset V)} (hw : ReductionWitness G U X P)
    (hD : Covers (triangles (remove G U X)) D) : Covers (triangles G) (X∪D) := by
  intro t ht
  by_cases hs : t ∈ triangles (remove G U X)
  · obtain ⟨e,he,het⟩ := hD t hs
    exact ⟨e,mem_union_right _ he,het⟩
  · rcases remove_lost_triangle ht hs with hu|hx
    · obtain ⟨e,he,het⟩ := hw.cover_incident t ht hu
      exact ⟨e,mem_union_left _ he,het⟩
    · obtain ⟨e,he,het⟩ := hx
      exact ⟨e,mem_union_left _ he,het⟩

/-- The pointed condition covers the only selected hub spoke used by the new packing. -/
theorem selectedLeaf_hub_anchor {G : SimpleGraph V} {C M : Finset (Finset V)}
    {v w : V} {Q : Finset V} (hleaf : SelectedLeaf C v w)
    (hp : PointedWitness (linkGraph G v) w M Q) :
    C∩support (hubPacking v M) ⊆ M∪spokes v Q := by
  classical
  intro e he
  obtain ⟨heC,heP⟩ := mem_inter.mp he
  obtain ⟨t,ht,het⟩ := mem_biUnion.mp heP
  obtain ⟨f,hf,rfl⟩ := mem_image.mp ht
  by_cases hv : v∈e
  · obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp het).2
    have hvab : v=a ∨ v=b := by simpa [heq] using hv
    have hpair : ∃ x, v≠x ∧ e=({v,x}:Finset V) := by
      rcases hvab with rfl|rfl
      · exact ⟨b,hab,heq⟩
      · exact ⟨a,hab.symm,by simpa [pair_comm] using heq⟩
    obtain ⟨x,hvx,rfl⟩ := hpair
    have hxw : x=w := hleaf.2 x (selectedGraph_adj.mpr ⟨hvx,heC⟩)
    have hxf : x∈f := (mem_insert.mp ((mem_edges.mp het).1 (by simp))).resolve_left hvx.symm
    have hwQ : w∈Q := hp.2.2.2 (hxw ▸ mem_biUnion.mpr ⟨f,hf,hxf⟩)
    exact mem_union_right _ (mem_image.mpr ⟨x,hxw.symm ▸ hwQ,rfl⟩)
  · have hef : e⊆f := by
      intro x hx
      exact (mem_insert.mp ((mem_edges.mp het).1 hx)).resolve_left (fun h => hv (h ▸ hx))
    have heq : e=f := eq_of_subset_of_card_le hef (by rw [(hp.1.1 f hf).card_eq,(mem_edges.mp het).2])
    exact mem_union_left _ (heq.symm ▸ hf)

/-- Actual selected edge count strictly drops even when the pointed matching is empty. -/
theorem selectedLeaf_restriction_card_lt {G : SimpleGraph V} {C X : Finset (Finset V)}
    {v w : V} (hleaf : SelectedLeaf C v w) :
    (C∩graphEdges (remove G {v} X)).card < C.card := by
  classical
  have heC := (selectedGraph_adj.mp hleaf.1).2
  have hne : ({v,w}:Finset V) ∉ graphEdges (remove G {v} X) := by
    intro he
    have hd := (remove_edge_status (mem_graphEdges.mp he)).1
    exact disjoint_left.mp hd (show v∈({v,w}:Finset V) by simp) (by simp)
  apply card_lt_card
  apply ssubset_iff_exists_subset_erase.mpr
  refine ⟨{v,w},heC,?_⟩
  intro e he
  apply mem_erase.mpr
  refine ⟨?_,(mem_inter.mp he).1⟩
  intro heq
  exact hne (heq ▸ (mem_inter.mp he).2)

/-- Lift an anchored residual packing/cover through the pointed hub reduction. -/
theorem pointed_anchor_lift {G : SimpleGraph V} {C M I D : Finset (Finset V)}
    {v w : V} {Q : Finset V} (hC : C⊆graphEdges G) (hleaf : SelectedLeaf C v w)
    (hp : PointedWitness (linkGraph G v) w M Q)
    (hres : AnchoredPackingCover (remove G {v} (M∪spokes v Q))
      (C∩graphEdges (remove G {v} (M∪spokes v Q))) I D) :
    ∃ J E, AnchoredPackingCover G C J E := by
  classical
  let X := M∪spokes v Q
  let P := hubPacking v M
  let H := remove G {v} X
  have hm := pointed_to_linkMatching hp
  have hw := matching_reduction_witness hm
  have hcross : ∀ p∈P,∀ t∈I,Disjoint (edges p) (edges t) :=
    fun p hP t ht => reduction_cross_disjoint hw p hP t (hres.1.1 ht)
  have hpack : Packing (triangles G) (P∪I) := packing_mono
    (union_subset (Subset.refl _) (triangles_mono_graph (remove_le G {v} X)))
    (packing_union hw.packing hres.1 hcross)
  have hdisj : Disjoint P I := cross_disjoint (triangles_mono hw.packing.1 (triangles_valid G)) hcross
  have hcover : Covers (triangles G) (X∪D) := reduction_lift_cover hw hres.2.1.2
  have hanchor : C∩support (P∪I) ⊆ X∪D := by
    intro e he
    obtain ⟨heC,heS⟩ := mem_inter.mp he
    obtain ⟨t,ht,het⟩ := mem_biUnion.mp heS
    rcases mem_union.mp ht with ht|ht
    · exact mem_union_left _ (selectedLeaf_hub_anchor hleaf hp
        (mem_inter.mpr ⟨heC,mem_biUnion.mpr ⟨t,ht,het⟩⟩))
    · have heH : e∈graphEdges H := triangle_edge_actual (hres.1.1 ht) het
      exact mem_union_right _ (hres.2.2.1 (mem_inter.mpr
        ⟨mem_inter.mpr ⟨heC,heH⟩,mem_biUnion.mpr ⟨t,ht,het⟩⟩))
  have hcard : (X∪D).card ≤ 2*(P∪I).card := by
    have hX : X.card≤M.card+Q.card := matching_cover_card v M Q
    have hQ := hp.2.2.1
    have hD := hres.2.2.2
    have hP : P.card=M.card := (hub_matching_packing hm).2
    have hu : (X∪D).card≤X.card+D.card := card_union_le _ _
    rw [card_union_of_disjoint hdisj]
    omega
  exact ⟨P∪I,(X∪D)∩graphEdges G,anchored_actualize hC hpack hcover hanchor hcard⟩

end Tuza24
