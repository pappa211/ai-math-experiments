import Tuza07.RigidityPair

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

theorem clique_of_family {G : SimpleGraph V} {k : Finset V} (hc : 3 ≤ k.card)
    (hF : cliqueFamily k ⊆ triangles G) : G.IsClique (k : Set V) := by
  intro a ha b hb hab
  have he : ({a,b}:Finset V) ∈ edges k := mem_edges.mpr
    ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨ha,hb⟩,by simp [hab]⟩
  rw [← support_cliqueFamily hc] at he
  have hG := supported_edge_is_graph_edge (support_mono hF he)
  exact hG.isClique (by simp) (by simp) hab

theorem newK4_decomposition {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {U : Finset V}
    (hU : U.card = 4) (hfamily : newTriangles H G = cliqueFamily U)
    (hd : Disjoint (edges U) (support (triangles H))) :
    CliqueDecomposition G (insert U K) := by
  classical
  have hUF : cliqueFamily U ⊆ triangles G := by rw [← hfamily]; exact sdiff_subset
  have hclique := clique_of_family (by omega : 3 ≤ U.card) hUF
  have hcross : ∀ k ∈ K, Disjoint (edges U) (edges k) :=
    fun k hk => hd.mono_right (block_edges_supported hK hk)
  refine ⟨?_,?_,?_,?_⟩
  · intro k hk
    rcases mem_insert.mp hk with hk|hk
    · exact hk ▸ hclique
    · intro a ha b hb hab
      exact hHG ((hK.clique k hk) ha hb hab)
  · intro k hk
    rcases mem_insert.mp hk with hk|hk
    · exact Or.inl (hk ▸ hU)
    · exact hK.size k hk
  · intro k hk l hl hkl
    rcases mem_insert.mp hk with hk|hk <;> rcases mem_insert.mp hl with hl|hl
    · exact (hkl (hk.trans hl.symm)).elim
    · exact hk.symm ▸ hcross l hl
    · exact hl.symm ▸ (hcross k hk).symm
    · exact hK.independent k hk l hl hkl
  · intro t ht
    by_cases htH : t ∈ triangles H
    · obtain ⟨k,hk,htk⟩ := hK.exhaustive t htH
      exact ⟨k,mem_insert_of_mem hk,htk⟩
    · have htN := mem_newTriangles.mpr ⟨ht,htH⟩
      rw [hfamily] at htN
      exact ⟨U,mem_insert_self _ _,(mem_powersetCard.mp htN).1⟩

theorem newK4_component_identities {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) {U : Finset V} (hU : U.card = 4)
    (hfamily : newTriangles H G = cliqueFamily U)
    (hd : Disjoint (edges U) (support (triangles H))) :
    (∀ t ∈ triangles H, triangleComponent G t = triangleComponent H t) ∧
    (∀ t ∈ cliqueFamily U, triangleComponent G t = cliqueFamily U) := by
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  have hKG := newK4_decomposition hHG hK hU hfamily hd
  refine ⟨?_,fun t ht => decomposition_component_eq hKG (mem_insert_self _ _) ht⟩
  intro t ht
  obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
  have htF := mem_powersetCard.mpr ⟨htk,(mem_triangles.mp ht).card_eq⟩
  rw [decomposition_component_eq hK hk htF,
    decomposition_component_eq hKG (mem_insert_of_mem hk) htF]

theorem newK4_consequences {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnew : NewK4 H G) :
    ComponentCliques G ∧ nu (triangles G) = nu (triangles H) + 1 ∧
      tau (triangles G) = 2 * nu (triangles H) + 2 := by
  obtain ⟨U,hU,hfamily,hd⟩ := hnew
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  have hKG := newK4_decomposition hHG hK hU hfamily hd
  have hdisj : Disjoint (support (triangles H)) (support (cliqueFamily U)) := by
    rw [support_cliqueFamily (by omega : 3 ≤ U.card)]
    exact hd.symm
  have hnu : nu (triangles G) = nu (triangles H) + 1 := by
    rw [triangles_eq_union_new hHG,hfamily,nu_union_eq (triangles_valid H) hdisj,(k4_parameters hU).1]
  exact ⟨decomposition_componentCliques hKG,hnu,by
    rw [componentCliques_equality (decomposition_componentCliques hKG),hnu]; omega⟩

theorem component_block_mem {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {t B : Finset V} (ht : t ∈ triangles H)
    (hB : B.card = 4) (hs : support (triangleComponent H t) = edges B) : B ∈ K := by
  obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
  have htF := mem_powersetCard.mpr ⟨htk,(mem_triangles.mp ht).card_eq⟩
  have hkc : 3 ≤ k.card := by rcases hK.size k hk with h4|h5 <;> omega
  rw [decomposition_component_eq hK hk htF,support_cliqueFamily hkc] at hs
  have hkB : k = B := subset_antisymm (vertices_subset_of_edges_subset (by omega) hs.subset)
    (vertices_subset_of_edges_subset (by omega) hs.symm.subset)
  exact hkB ▸ hk

theorem promoted_clique_subset {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {B : Finset V} {z : V}
    (hB : B ∈ K)
    (hfamily : newTriangles H G = cliqueFamily (insert z B) \ cliqueFamily B) :
    cliqueFamily (insert z B) ⊆ triangles G := by
  classical
  intro t ht
  by_cases htB : t ∈ cliqueFamily B
  · exact triangles_mono_graph hHG (cliqueFamily_subset_triangles (hK.clique B hB) htB)
  · have htN : t ∈ newTriangles H G := hfamily.symm ▸ mem_sdiff.mpr ⟨ht,htB⟩
    exact (mem_newTriangles.mp htN).1

theorem promoted_cross_disjoint {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {B : Finset V} {z : V} (hB : B ∈ K)
    (hd : Disjoint (edges (insert z B) \ edges B) (support (triangles H))) :
    ∀ k ∈ K.erase B, Disjoint (edges (insert z B)) (edges k) := by
  classical
  intro k hk
  apply disjoint_left.mpr
  intro e he heK
  by_cases heB : e ∈ edges B
  · exact disjoint_left.mp (hK.independent B hB k (mem_erase.mp hk).2
      (Ne.symm (mem_erase.mp hk).1)) heB heK
  · exact disjoint_left.mp hd (mem_sdiff.mpr ⟨he,heB⟩)
      (block_edges_supported hK (mem_erase.mp hk).2 heK)

theorem promoted_decomposition {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {B : Finset V} {z : V}
    (hB : B ∈ K) (hB4 : B.card = 4) (hz : z ∉ B)
    (hfamily : newTriangles H G = cliqueFamily (insert z B) \ cliqueFamily B)
    (hd : Disjoint (edges (insert z B) \ edges B) (support (triangles H))) :
    CliqueDecomposition G (insert (insert z B) (K.erase B)) := by
  classical
  have hnew5 : (insert z B).card = 5 := by simp [hz,hB4]
  have hclique := clique_of_family (by omega : 3 ≤ (insert z B).card)
    (promoted_clique_subset hHG hK hB hfamily)
  have hcross := promoted_cross_disjoint hK hB hd
  refine ⟨?_,?_,?_,?_⟩
  · intro k hk
    rcases mem_insert.mp hk with hk|hk
    · exact hk ▸ hclique
    · intro a ha b hb hab
      exact hHG ((hK.clique k (mem_erase.mp hk).2) ha hb hab)
  · intro k hk
    rcases mem_insert.mp hk with hk|hk
    · exact Or.inr (hk ▸ hnew5)
    · exact hK.size k (mem_erase.mp hk).2
  · intro k hk l hl hkl
    rcases mem_insert.mp hk with hk|hk <;> rcases mem_insert.mp hl with hl|hl
    · exact (hkl (hk.trans hl.symm)).elim
    · exact hk.symm ▸ hcross l hl
    · exact hl.symm ▸ (hcross k hk).symm
    · exact hK.independent k (mem_erase.mp hk).2 l (mem_erase.mp hl).2 hkl
  · intro t ht
    by_cases htH : t ∈ triangles H
    · obtain ⟨k,hk,htk⟩ := hK.exhaustive t htH
      by_cases hkB : k = B
      · exact ⟨insert z B,mem_insert_self _ _,htk.trans (hkB.symm ▸ subset_insert z B)⟩
      · exact ⟨k,mem_insert_of_mem (mem_erase.mpr ⟨hkB,hk⟩),htk⟩
    · have htN := mem_newTriangles.mpr ⟨ht,htH⟩
      rw [hfamily] at htN
      exact ⟨insert z B,mem_insert_self _ _,(mem_powersetCard.mp (mem_sdiff.mp htN).1).1⟩

theorem promoted_component_identities {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) {t B : Finset V} {z : V} (ht : t ∈ triangles H)
    (hB4 : B.card = 4) (hs : support (triangleComponent H t) = edges B) (hz : z ∉ B)
    (hfamily : newTriangles H G = cliqueFamily (insert z B) \ cliqueFamily B)
    (hd : Disjoint (edges (insert z B) \ edges B) (support (triangles H))) :
    (∀ r ∈ triangles H, r ∉ triangleComponent H t →
      triangleComponent G r = triangleComponent H r) ∧
    (∀ r ∈ cliqueFamily (insert z B), triangleComponent G r = cliqueFamily (insert z B)) := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  have hB := component_block_mem hK ht hB4 hs
  have hKG := promoted_decomposition hHG hK hB hB4 hz hfamily hd
  refine ⟨?_,fun r hr => decomposition_component_eq hKG (mem_insert_self _ _) hr⟩
  intro r hr hrnot
  obtain ⟨k,hk,hrk⟩ := hK.exhaustive r hr
  have hrF := mem_powersetCard.mpr ⟨hrk,(mem_triangles.mp hr).card_eq⟩
  have hkB : k ≠ B := by
    intro hh
    apply hrnot
    rw [component_eq_cliqueFamily_of_support hs]
    exact hh ▸ hrF
  rw [decomposition_component_eq hK hk hrF,
    decomposition_component_eq hKG (mem_insert_of_mem (mem_erase.mpr ⟨hkB,hk⟩)) hrF]

theorem promotedK4_consequences {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnew : PromotedK4 H G) :
    ComponentCliques G ∧ nu (triangles G) = nu (triangles H) + 1 ∧
      tau (triangles G) = 2 * nu (triangles H) + 2 := by
  classical
  obtain ⟨t,ht,B,z,hB4,hs,hz,hfamily,hd⟩ := hnew
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  have hB := component_block_mem hK ht hB4 hs
  have hKG := promoted_decomposition hHG hK hB hB4 hz hfamily hd
  have hnew5 : (insert z B).card = 5 := by simp [hz,hB4]
  have hnmem : insert z B ∉ K.erase B := by
    intro hmem
    have he := disjoint_self.mp (promoted_cross_disjoint hK hB hd _ hmem)
    exact (edges_nonempty (s:=insert z B) (by omega)).ne_empty he
  have hnu : nu (triangles G) = nu (triangles H) + 1 := by
    have hsumeq := sum_erase_add K (fun k => nu (cliqueFamily k)) hB
    rw [(k4_parameters hB4).1] at hsumeq
    rw [blocks_nu hKG,sum_insert hnmem,(k5_parameters hnew5).1,blocks_nu hK]
    omega
  exact ⟨decomposition_componentCliques hKG,hnu,by
    rw [componentCliques_equality (decomposition_componentCliques hKG),hnu]; omega⟩
end Tuza07
