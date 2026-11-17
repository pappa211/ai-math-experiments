import Tuza06.UniqueEdge

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A shared graph edge forces two triangles into one actual residual clique block. -/
theorem clique_components_triangle_cross_adj {H : SimpleGraph V}
    (hH : ComponentCliques H) {s t : Finset V} (hs : s ∈ triangles H) (ht : t ∈ triangles H)
    (hst : ¬ Disjoint (edges s) (edges t)) {a b : V}
    (ha : a ∈ s) (hb : b ∈ t) (hab : a ≠ b) : H.Adj a b := by
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  obtain ⟨k,hk,hsk⟩ := hK.exhaustive s hs
  have htk : t ⊆ k := connected_subset_block hK hk hsk
    (Relation.ReflTransGen.single ⟨hs,ht,hst⟩)
  exact hK.clique k hk (hsk ha) (htk hb) hab

/-- A missing cross edge of two overlapping triangles cannot be repaired by
outside vertices when the full graph has clique triangle components. -/
theorem clique_components_no_missing_cross_edge {H : SimpleGraph V}
    (hH : ComponentCliques H) {s t : Finset V} (hs : s ∈ triangles H) (ht : t ∈ triangles H)
    (hst : ¬ Disjoint (edges s) (edges t)) {a b : V}
    (ha : a ∈ s) (hb : b ∈ t) (hab : a ≠ b) (hn : ¬ H.Adj a b) : False :=
  hn (clique_components_triangle_cross_adj hH hs ht hst ha hb hab)

theorem support_mono_finset {F K : Finset (Finset V)} (h : F ⊆ K) : support F ⊆ support K := by
  classical
  intro e he
  obtain ⟨t,ht,het⟩ := mem_biUnion.mp he
  exact mem_biUnion.mpr ⟨t,h ht,het⟩

theorem blocks_edges_subset_graph_support {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k : Finset V} (hk : k ∈ K) :
    edges k ⊆ support (triangles H) := by
  have hcard : 3 ≤ k.card := by rcases hK.size k hk with h4|h5 <;> omega
  rw [← support_cliqueFamily hcard]
  exact support_mono_finset (cliqueFamily_subset_triangles (hK.clique k hk))

/-- Reattaching a separated K4/K5 block preserves the complete combined conclusion.
The separation concerns graph edges and all graph triangles, not shared vertices. -/
theorem good_add_isolated_clique {G H : SimpleGraph V} (hHG : H ≤ G)
    {B : Finset V} (hB : G.IsClique (B : Set V)) (hsize : B.card = 4 ∨ B.card = 5)
    (htri : triangles G = triangles H ∪ cliqueFamily B)
    (hd : Disjoint (support (triangles H)) (edges B)) (hGoodH : Good H) : Good G := by
  classical
  have hd' := hd.mono_right (blocks_support_subset B)
  have hnu : nu (triangles G) = nu (triangles H) + nu (cliqueFamily B) := by
    rw [htri]
    exact nu_union_eq (triangles_valid H) hd'
  have htau : tau (triangles G) = tau (triangles H) + tau (cliqueFamily B) := by
    rw [htri]
    exact tau_union_eq (triangles_valid H) (cliqueFamily_valid B) hd'
  have hBparams : tau (cliqueFamily B) = 2 * nu (cliqueFamily B) := by
    rcases hsize with h4|h5
    · rw [(k4_parameters h4).1,(k4_parameters h4).2]
    · rw [(k5_parameters h5).1,(k5_parameters h5).2]
  constructor
  · have hi := hGoodH.1
    omega
  · intro heq
    have hHeq : tau (triangles H) = 2 * nu (triangles H) := by omega
    obtain ⟨K,hK⟩ := componentCliques_decomposition (hGoodH.2 hHeq)
    apply decomposition_componentCliques (K := insert B K)
    constructor
    · intro k hk
      rcases mem_insert.mp hk with rfl|hk
      · exact hB
      · intro a ha b hb hab
        exact hHG (hK.clique k hk ha hb hab)
    · intro k hk
      rcases mem_insert.mp hk with rfl|hk
      · exact hsize
      · exact hK.size k hk
    · intro k hk l hl hkl
      rcases mem_insert.mp hk with hkB|hkK
      · subst k
        rcases mem_insert.mp hl with hlB|hlK
        · exact (hkl hlB.symm).elim
        · exact (hd.mono_left (blocks_edges_subset_graph_support hK hlK)).symm
      · rcases mem_insert.mp hl with hlB|hlK
        · subst l
          exact hd.mono_left (blocks_edges_subset_graph_support hK hkK)
        · exact hK.independent k hkK l hlK hkl
    · intro t ht
      rw [htri] at ht
      rcases mem_union.mp ht with ht|ht
      · obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
        exact ⟨k,mem_insert_of_mem hk,htk⟩
      · exact ⟨B,mem_insert_self _ _,(mem_powersetCard.mp ht).1⟩

/-- A minimal combined obstruction has no isolated K4/K5 triangle-support block.
Triangle-free background edges and vertex-sharing attachments are allowed. -/
theorem minimal_no_isolated_clique {G : SimpleGraph V} (hG : MinimalObstruction G)
    {B : Finset V} (hB : G.IsClique (B : Set V)) (hsize : B.card = 4 ∨ B.card = 5)
    (hisolated : ∀ t ∈ triangles G, ¬ Disjoint (edges t) (edges B) → t ⊆ B) : False := by
  classical
  let H := deleteTriangle G B
  have hcard : 2 ≤ B.card := by rcases hsize with h4|h5 <;> omega
  obtain ⟨e,he⟩ := edges_nonempty hcard
  have heG : G.IsNClique 2 e := ⟨fun a ha b hb hab =>
    hB ((mem_edges.mp he).1 ha) ((mem_edges.mp he).1 hb) hab,(mem_edges.mp he).2⟩
  have hHstrict : edgeCount H < edgeCount G := by
    apply edgeCount_strict (delete_le G B) heG
    intro heH
    obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp he).2
    have ha : a ∈ e := by rw [heq]; simp
    have hb : b ∈ e := by rw [heq]; simp
    exact (heH.isClique ha hb hab).2 ⟨(mem_edges.mp he).1 ha,(mem_edges.mp he).1 hb⟩
  have hGoodH := hG.2 H (delete_le G B) hHstrict
  have htri : triangles G = triangles H ∪ cliqueFamily B := by
    apply subset_antisymm
    · intro t ht
      by_cases htH : t ∈ triangles H
      · exact mem_union_left _ htH
      · obtain ⟨f,hfB,hft⟩ := new_triangle_removed_edge ht htH
        have hnd : ¬ Disjoint (edges t) (edges B) := by
          intro hd; exact disjoint_left.mp hd hft hfB
        exact mem_union_right _ (mem_powersetCard.mpr
          ⟨hisolated t ht hnd,(mem_triangles.mp ht).card_eq⟩)
    · exact union_subset (triangles_mono_graph (delete_le G B)) (cliqueFamily_subset_triangles hB)
  have hd : Disjoint (support (triangles H)) (edges B) := by
    apply disjoint_left.mpr
    intro f hf hfb
    obtain ⟨t,ht,hft⟩ := mem_biUnion.mp hf
    exact disjoint_left.mp (deleted_edges_disjoint ht) hft hfb
  exact hG.1 (good_add_isolated_clique (delete_le G B) hB hsize htri hd hGoodH)

end Tuza06
