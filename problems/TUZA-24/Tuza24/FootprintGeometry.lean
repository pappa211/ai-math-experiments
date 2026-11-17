import Tuza24.LinkAPI
import Tuza06.Footprints

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem forest_clique_card_le_two {F : SimpleGraph V} (hF : F.IsAcyclic)
    {S : Finset V} (hS : F.IsClique (S : Set V)) : S.card≤2 := by
  by_contra hn
  exact (hF.cliqueFree (show 3≤S.card by omega)) S ⟨hS,rfl⟩

/-- An apex-forest has no clique on four vertices, even with ambient isolates. -/
theorem apexForest_clique_card_le_three {L : SimpleGraph V} {w : V}
    (hF : (isolate L {w}).IsAcyclic) {S : Finset V}
    (hS : L.IsClique (S : Set V)) : S.card≤3 := by
  have hcl : (isolate L {w}).IsClique (S.erase w : Set V) := by
    intro a ha b hb hab
    exact ⟨hS (mem_of_mem_erase ha) (mem_of_mem_erase hb) hab,
      by simpa using (mem_erase.mp ha).1,by simpa using (mem_erase.mp hb).1⟩
  have hc := forest_clique_card_le_two hF hcl
  by_cases hw : w∈S
  · rw [card_erase_of_mem hw] at hc
    omega
  · simpa [erase_eq_of_notMem hw] using (show (S.erase w).card≤3 by omega)

/-- The whole link intersection of every residual clique has at most three vertices. -/
theorem link_clique_inter_card {G H : SimpleGraph V} (hHG : H≤G) {v w : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic) {k : Finset V}
    (hk : H.IsClique (k : Set V)) : (k∩peelNeighbors G univ v).card≤3 := by
  classical
  apply apexForest_clique_card_le_three hF
  intro a ha b hb hab
  exact ⟨hHG (hk (mem_inter.mp ha).1 (mem_inter.mp hb).1 hab),
    (mem_filter.mp (mem_inter.mp ha).2).2,(mem_filter.mp (mem_inter.mp hb).2).2⟩

/-- Two disjoint actual edges need four available vertices. -/
theorem disjoint_edges_card_four {e f S : Finset V} (he : e.card=2) (hf : f.card=2)
    (hd : Disjoint e f) (heS : e⊆S) (hfS : f⊆S) : 4≤S.card := by
  have h := card_le_card (union_subset heS hfS)
  rw [card_union_of_disjoint hd,he,hf] at h
  exact h

/-- An entire edge matching contributes at most one edge to any three-vertex set. -/
theorem matching_footprint_card_le_one {L : SimpleGraph V}
    {M : Finset (Finset V)} (hM : EdgeMatching L M) {S : Finset V} (hS : S.card≤3) :
    (M∩edges S).card≤1 := by
  apply card_le_one.mpr
  intro e he f hf
  by_contra hef
  have hc := disjoint_edges_card_four (hM.1 e (mem_inter.mp he).1).card_eq
    (hM.1 f (mem_inter.mp hf).1).card_eq
    (hM.2 e (mem_inter.mp he).1 f (mem_inter.mp hf).1 hef)
    (mem_edges.mp (mem_inter.mp he).2).1 (mem_edges.mp (mem_inter.mp hf).2).1
  omega

theorem link_matching_clique_footprint {G H : SimpleGraph V} (hHG : H≤G) {v w : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : EdgeMatching (linkGraph G v) M)
    {k : Finset V} (hk : H.IsClique (k : Set V)) : (M∩edges k).card≤1 := by
  have hsub : M∩edges k ⊆ M∩edges (k∩peelNeighbors G univ v) := by
    intro e he
    refine mem_inter.mpr ⟨(mem_inter.mp he).1,mem_edges.mpr ⟨?_,(mem_edges.mp (mem_inter.mp he).2).2⟩⟩
    exact subset_inter (mem_edges.mp (mem_inter.mp he).2).1
      (linkGraph_edge_neighbors (hM.1 e (mem_inter.mp he).1))
  exact (card_le_card hsub).trans
    (matching_footprint_card_le_one hM (link_clique_inter_card hHG hF hk))

/-- In a clique missing a page's base, the entire page contributes at most one edge. -/
theorem deleted_base_page_footprint {H : SimpleGraph V} {a b z : V}
    (hab : a≠b) (hbase : ¬ H.Adj a b) {k : Finset V}
    (hk : H.IsClique (k : Set V)) : (edges ({a,b,z}:Finset V)∩edges k).card≤1 := by
  apply card_le_one.mpr
  intro e he f hf
  have hecases := edges_triple a b z (mem_inter.mp he).1
  have hfcases := edges_triple a b z (mem_inter.mp hf).1
  have hek := (mem_edges.mp (mem_inter.mp he).2).1
  have hfk := (mem_edges.mp (mem_inter.mp hf).2).1
  simp only [mem_insert,mem_singleton] at hecases hfcases
  rcases hecases with rfl|rfl|rfl <;> rcases hfcases with rfl|rfl|rfl
  · rfl
  · exact (hbase (hk (hek (by simp)) (hek (by simp)) hab)).elim
  · exact (hbase (hk (hek (by simp)) (hek (by simp)) hab)).elim
  · exact (hbase (hk (hfk (by simp)) (hfk (by simp)) hab)).elim
  · rfl
  · exact (hbase (hk (hek (by simp)) (hfk (by simp)) hab)).elim
  · exact (hbase (hk (hfk (by simp)) (hfk (by simp)) hab)).elim
  · exact (hbase (hk (hfk (by simp)) (hek (by simp)) hab)).elim
  · rfl

/-- Two at-most-singleton edge families with intersecting cross edges form one
star of at most two edges. This certifies their union simultaneously. -/
theorem two_singleton_edge_families_star {A B : Finset (Finset V)}
    (hA : A.card≤1) (hB : B.card≤1) (hcard : ∀ e∈A∪B,e.card=2)
    (hcross : ∀ e∈A,∀ f∈B,¬ Disjoint e f) (hn : Nonempty V) :
    (A∪B).card≤2 ∧ ∃ x : V,∀ e∈A∪B,x∈e := by
  have hc : (A∪B).card≤2 := (card_union_le _ _).trans (by omega)
  refine ⟨hc,?_⟩
  by_cases hAn : A.Nonempty
  · obtain ⟨e,he⟩ := hAn
    by_cases hBn : B.Nonempty
    · obtain ⟨f,hf⟩ := hBn
      obtain ⟨x,hxe,hxf⟩ := not_disjoint_iff.mp (hcross e he f hf)
      refine ⟨x,?_⟩
      intro g hg
      rcases mem_union.mp hg with hg|hg
      · exact (card_le_one.mp hA g hg e he).symm ▸ hxe
      · exact (card_le_one.mp hB g hg f hf).symm ▸ hxf
    · obtain ⟨x,hx⟩ := card_pos.mp (show 0<e.card by rw [hcard e (mem_union_left _ he)]; decide)
      refine ⟨x,?_⟩
      intro g hg
      have hgA : g∈A := (mem_union.mp hg).resolve_right (fun h => hBn ⟨g,h⟩)
      exact (card_le_one.mp hA g hgA e he).symm ▸ hx
  · by_cases hBn : B.Nonempty
    · obtain ⟨f,hf⟩ := hBn
      obtain ⟨x,hx⟩ := card_pos.mp (show 0<f.card by rw [hcard f (mem_union_right _ hf)]; decide)
      refine ⟨x,?_⟩
      intro g hg
      have hgB : g∈B := (mem_union.mp hg).resolve_left (fun h => hAn ⟨g,h⟩)
      exact (card_le_one.mp hB g hgB f hf).symm ▸ hx
    · obtain ⟨x⟩ := hn
      exact ⟨x,fun e he => ((mem_union.mp he).elim (fun h => hAn ⟨e,h⟩) (fun h => hBn ⟨e,h⟩)).elim⟩

/-- Only a matching's rim edges can survive after all hub spokes are deleted. -/
theorem hub_surviving_footprint {G : SimpleGraph V} {v : V}
    {M X : Finset (Finset V)} (hM : EdgeMatching (linkGraph G v) M) {k : Finset V}
    (hk : (remove G {v} X).IsClique (k : Set V)) :
    support (hubPacking v M)∩edges k ⊆ M∩edges k := by
  classical
  intro e he
  obtain ⟨t,ht,het⟩ := mem_biUnion.mp (mem_inter.mp he).1
  obtain ⟨f,hf,rfl⟩ := mem_image.mp ht
  have heH : (remove G {v} X).IsNClique 2 e :=
    ⟨fun _ ha _ hb hab => hk ((mem_edges.mp (mem_inter.mp he).2).1 ha)
      ((mem_edges.mp (mem_inter.mp he).2).1 hb) hab,(mem_edges.mp het).2⟩
  have hv : v∉e := fun h => disjoint_left.mp (remove_edge_status heH).1 h (by simp)
  have hef : e⊆f := by
    intro x hx
    exact (mem_insert.mp ((mem_edges.mp het).1 hx)).resolve_left (fun h => hv (h ▸ hx))
  have heq : e=f := eq_of_subset_of_card_le hef (by rw [(hM.1 f hf).card_eq,(mem_edges.mp het).2])
  exact mem_inter.mpr ⟨heq.symm ▸ hf,(mem_inter.mp he).2⟩

end Tuza24
