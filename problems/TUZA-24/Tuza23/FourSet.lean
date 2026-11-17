import Tuza23.PageAssembly

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A triple inside four vertices either contains a prescribed pair or its opposite pair. -/
theorem four_set_opposite_subset {S s t : Finset V}
    (hS : S.card = 4) (hs : s ⊆ S) (_hs2 : s.card = 2)
    (ht : t ⊆ S) (ht3 : t.card = 3) (hnot : ¬ s ⊆ t) : S \ s ⊆ t := by
  classical
  obtain ⟨a, has, hat⟩ := not_subset.mp hnot
  have hmissing : (S \ t).card ≤ 1 := by
    rw [card_sdiff_of_subset ht, hS, ht3]
  intro b hb
  by_contra hbt
  have ha : a ∈ S \ t := mem_sdiff.mpr ⟨hs has, hat⟩
  have hb' : b ∈ S \ t := mem_sdiff.mpr ⟨(mem_sdiff.mp hb).1, hbt⟩
  have hab : a = b := card_le_one.mp hmissing a ha b hb'
  exact (mem_sdiff.mp hb).2 (hab ▸ has)

/-- An opposite pair of graph edges meets every actual triple of a four-set. -/
theorem opposite_pair_covers_four_set {S s : Finset V}
    (hS : S.card = 4) (hs : s ∈ edges S) :
    Covers (cliqueFamily S) {s, S \ s} := by
  classical
  intro t ht
  have htS := (mem_powersetCard.mp ht).1
  have ht3 := (mem_powersetCard.mp ht).2
  by_cases hst : s ⊆ t
  · exact ⟨s, by simp, mem_edges.mpr ⟨hst, (mem_edges.mp hs).2⟩⟩
  · refine ⟨S \ s, by simp, mem_edges.mpr ⟨?_, ?_⟩⟩
    · exact four_set_opposite_subset hS (mem_edges.mp hs).1 (mem_edges.mp hs).2 htS ht3 hst
    · rw [card_sdiff_of_subset (mem_edges.mp hs).1, hS, (mem_edges.mp hs).2]

/-- A missing edge inside four vertices forces the opposite pair into every actual triangle. -/
theorem four_set_triangle_contains_opposite_of_missing {G : SimpleGraph V}
    {S s t : Finset V} (hS : S.card = 4) (hs : s ∈ edges S)
    (hmissing : ¬ G.IsNClique 2 s) (ht : t ∈ triangles G) (htS : t ⊆ S) :
    S \ s ∈ edges t := by
  have hnot : ¬ s ⊆ t := by
    intro hst
    apply hmissing
    exact edge_of_triangle ht (mem_edges.mpr ⟨hst, (mem_edges.mp hs).2⟩)
  apply mem_edges.mpr
  refine ⟨four_set_opposite_subset hS (mem_edges.mp hs).1 (mem_edges.mp hs).2
    htS (mem_triangles.mp ht).card_eq hnot, ?_⟩
  rw [card_sdiff_of_subset (mem_edges.mp hs).1, hS, (mem_edges.mp hs).2]

/-- Every edge of every block in an exhaustive clique decomposition is supported. -/
theorem block_edges_supported {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k : Finset V} (hk : k ∈ K) :
    edges k ⊆ support (triangles H) := by
  classical
  have hk3 : 3 ≤ k.card := by rcases hK.size k hk with h4 | h5 <;> omega
  intro e he
  rw [← support_cliqueFamily hk3] at he
  obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
  exact mem_biUnion.mpr ⟨t, cliqueFamily_subset_triangles (hK.clique k hk) ht, het⟩

/-- Add one literal K4 triangle component with disjoint edge support; arbitrary
vertex overlap and triangle-free background remain allowed. Exhaustiveness is
assumed for the entire new actual triangle family, not a selected list. -/
theorem componentCliques_add_disjoint_K4 {H G : SimpleGraph V}
    (hHG : H ≤ G) (hB : B H) {S : Finset V} (hS : S.card = 4)
    (hclique : G.IsClique (S : Set V))
    (hdisj : Disjoint (edges S) (support (triangles H)))
    (hnew : ∀ t ∈ triangles G, t ∉ triangles H → t ⊆ S) : B G := by
  classical
  obtain ⟨K, hK⟩ := componentCliques_decomposition hB
  apply decomposition_componentCliques (K := insert S K)
  constructor
  · intro k hk
    rcases mem_insert.mp hk with rfl | hk
    · exact hclique
    · intro a ha b hb hab
      exact hHG ((hK.clique k hk) ha hb hab)
  · intro k hk
    rcases mem_insert.mp hk with rfl | hk
    · exact Or.inl hS
    · exact hK.size k hk
  · intro k hk l hl hkl
    rcases mem_insert.mp hk with hkS | hkK
    · subst k
      rcases mem_insert.mp hl with hlS | hlK
      · exact (hkl hlS.symm).elim
      · exact hdisj.mono_right (block_edges_supported hK hlK)
    · rcases mem_insert.mp hl with hlS | hlK
      · subst l
        exact (hdisj.mono_right (block_edges_supported hK hkK)).symm
      · exact hK.independent k hkK l hlK hkl
  · intro t ht
    by_cases hold : t ∈ triangles H
    · obtain ⟨k, hk, htk⟩ := hK.exhaustive t hold
      exact ⟨k, mem_insert_of_mem hk, htk⟩
    · exact ⟨S, mem_insert_self _ _, hnew t ht hold⟩

end Tuza23
