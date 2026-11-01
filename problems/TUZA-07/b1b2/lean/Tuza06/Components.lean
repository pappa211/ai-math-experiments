import Tuza06.BlockAggregation

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem vertices_subset_of_edges_subset {s k : Finset V} (hs : 2 ≤ s.card)
    (h : edges s ⊆ edges k) : s ⊆ k := by
  intro a ha
  obtain ⟨b, hb, hba⟩ := exists_mem_ne (by omega : 1 < s.card) a
  have he : ({a,b} : Finset V) ∈ edges s :=
    mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, Finset.mem_coe] using And.intro ha hb, by simp [Ne.symm hba]⟩
  exact (mem_edges.mp (h he)).1 (by simp)

theorem support_cliqueFamily {k : Finset V} (hk : 3 ≤ k.card) :
    support (cliqueFamily k) = edges k := by
  classical
  apply subset_antisymm
  · intro e he
    obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
    exact edges_mono (mem_powersetCard.mp ht).1 het
  · intro e he
    obtain ⟨t, het, htk, hct⟩ := exists_subsuperset_card_eq (mem_edges.mp he).1
      (by rw [(mem_edges.mp he).2]; omega : e.card ≤ 3) hk
    exact mem_biUnion.mpr ⟨t, mem_powersetCard.mpr ⟨htk,hct⟩,
      mem_edges.mpr ⟨het,(mem_edges.mp he).2⟩⟩

theorem triangleConnected_symm {G : SimpleGraph V} {s t : Finset V}
    (h : TriangleConnected G s t) : TriangleConnected G t s := by
  induction h with
  | refl => exact .refl
  | tail _ hab ih =>
    exact (Relation.ReflTransGen.single ⟨hab.2.1,hab.1,
      fun hd => hab.2.2 hd.symm⟩).trans ih

theorem triangleComponent_eq_of_connected {G : SimpleGraph V} {s t : Finset V}
    (h : TriangleConnected G s t) : triangleComponent G s = triangleComponent G t := by
  classical
  ext q
  simp only [triangleComponent, mem_filter]
  constructor
  · rintro ⟨hq,hsq⟩
    exact ⟨hq,(triangleConnected_symm h).trans hsq⟩
  · rintro ⟨hq,htq⟩
    exact ⟨hq,h.trans htq⟩

theorem clique_of_component_support {G : SimpleGraph V} {t k : Finset V}
    (h : support (triangleComponent G t) = edges k) : G.IsClique (k : Set V) := by
  classical
  intro a ha b hb hab
  have he : ({a,b} : Finset V) ∈ edges k :=
    mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, Finset.mem_coe] using And.intro ha hb,by simp [hab]⟩
  rw [← h] at he
  obtain ⟨q,hq,heq⟩ := mem_biUnion.mp he
  have hqG : q ∈ triangles G := (mem_filter.mp hq).1
  have haQ : a ∈ q := (mem_edges.mp heq).1 (by simp)
  have hbQ : b ∈ q := (mem_edges.mp heq).1 (by simp)
  exact (mem_triangles.mp hqG).isClique haQ hbQ hab

/-- Full graph triangles are forced by an exact clique edge support. -/
theorem component_eq_cliqueFamily_of_support {G : SimpleGraph V} {t k : Finset V}
    (h : support (triangleComponent G t) = edges k) :
    triangleComponent G t = cliqueFamily k := by
  classical
  have hk := clique_of_component_support h
  apply subset_antisymm
  · intro q hq
    have hqG := (mem_filter.mp hq).1
    refine mem_powersetCard.mpr ⟨?_,(mem_triangles.mp hqG).card_eq⟩
    apply vertices_subset_of_edges_subset (by rw [(mem_triangles.mp hqG).card_eq]; omega)
    intro e he
    rw [← h]
    exact mem_biUnion.mpr ⟨q,hq,he⟩
  · intro q hq
    have hqG := cliqueFamily_subset_triangles hk hq
    obtain ⟨e,heq⟩ := edges_nonempty (s := q) (by rw [(mem_powersetCard.mp hq).2]; omega)
    have hek := edges_mono (mem_powersetCard.mp hq).1 heq
    rw [← h] at hek
    obtain ⟨r,hr,her⟩ := mem_biUnion.mp hek
    have hrG := (mem_filter.mp hr).1
    have htr := (mem_filter.mp hr).2
    have hrq : TriangleAdjacent G r q := ⟨hrG,hqG,by
      intro hd; exact disjoint_left.mp hd her heq⟩
    exact mem_filter.mpr ⟨hqG,htr.tail hrq⟩

/-- Literal triangle-component clique supports yield an exhaustive edge-disjoint
clique decomposition. Vertex intersections between different blocks are permitted. -/
theorem componentCliques_decomposition {G : SimpleGraph V} (h : ComponentCliques G) :
    ∃ K : Finset (Finset V), CliqueDecomposition G K := by
  classical
  have hex : ∀ t : Finset V, ∃ k : Finset V, t ∈ triangles G →
      (k.card = 4 ∨ k.card = 5) ∧ support (triangleComponent G t) = edges k := by
    intro t
    by_cases ht : t ∈ triangles G
    · obtain ⟨k,hk⟩ := h t ht
      exact ⟨k,fun _ => hk⟩
    · exact ⟨∅,fun he => (ht he).elim⟩
  choose f hf using hex
  let K := (triangles G).image f
  refine ⟨K,?_,?_,?_,?_⟩
  · intro k hk
    obtain ⟨t,ht,rfl⟩ := mem_image.mp hk
    exact clique_of_component_support (hf t ht).2
  · intro k hk
    obtain ⟨t,ht,rfl⟩ := mem_image.mp hk
    exact (hf t ht).1
  · intro k hk l hl hkl
    obtain ⟨s,hs,rfl⟩ := mem_image.mp hk
    obtain ⟨t,ht,rfl⟩ := mem_image.mp hl
    apply disjoint_left.mpr
    intro e hes het
    rw [← (hf s hs).2] at hes
    rw [← (hf t ht).2] at het
    obtain ⟨a,ha,hea⟩ := mem_biUnion.mp hes
    obtain ⟨b,hb,heb⟩ := mem_biUnion.mp het
    have hab : TriangleAdjacent G a b :=
      ⟨(mem_filter.mp ha).1,(mem_filter.mp hb).1,by
        intro hd; exact disjoint_left.mp hd hea heb⟩
    have hst : TriangleConnected G s t :=
      ((mem_filter.mp ha).2.tail hab).trans (triangleConnected_symm (mem_filter.mp hb).2)
    have hcomp := triangleComponent_eq_of_connected hst
    have heq : edges (f s) = edges (f t) := by
      rw [← (hf s hs).2,← (hf t ht).2,hcomp]
    have hsCard : 2 ≤ (f s).card := by rcases (hf s hs).1 with h4|h5 <;> omega
    have htCard : 2 ≤ (f t).card := by rcases (hf t ht).1 with h4|h5 <;> omega
    exact hkl (subset_antisymm
      (vertices_subset_of_edges_subset hsCard heq.subset)
      (vertices_subset_of_edges_subset htCard heq.symm.subset))
  · intro t ht
    refine ⟨f t,mem_image.mpr ⟨t,ht,rfl⟩,?_⟩
    have hmem : t ∈ triangleComponent G t := mem_filter.mpr ⟨ht,.refl⟩
    rw [component_eq_cliqueFamily_of_support (hf t ht).2] at hmem
    exact (mem_powersetCard.mp hmem).1

/-- The complete equality converse for arbitrary finite simple graphs.
No degeneracy assumption, forbidden subgraph condition, or order bound is used. -/
theorem componentCliques_equality {G : SimpleGraph V} (h : ComponentCliques G) :
    tau (triangles G) = 2 * nu (triangles G) := by
  obtain ⟨K,hK⟩ := componentCliques_decomposition h
  exact blocks_equality hK

theorem triangleConnected_of_shared_vertices {G : SimpleGraph V} {s t : Finset V}
    (hs : s ∈ triangles G) (ht : t ∈ triangles G) {a b : V}
    (haS : a ∈ s) (hbS : b ∈ s) (haT : a ∈ t) (hbT : b ∈ t) (hab : a ≠ b) :
    TriangleConnected G s t := by
  apply Relation.ReflTransGen.single
  refine ⟨hs,ht,?_⟩
  have heS : ({a,b} : Finset V) ∈ edges s := mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro haS hbS,
      by simp [hab]⟩
  have heT : ({a,b} : Finset V) ∈ edges t := mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro haT hbT,
      by simp [hab]⟩
  intro hd
  exact disjoint_left.mp hd heS heT

/-- Any two triangles in a clique on at most five vertices are connected through
shared edges. A bridging triangle suffices if they share only one vertex. -/
theorem cliqueFamily_connected {G : SimpleGraph V} {k s t : Finset V}
    (hk : G.IsClique (k : Set V)) (hc : k.card ≤ 5)
    (hs : s ∈ cliqueFamily k) (ht : t ∈ cliqueFamily k) : TriangleConnected G s t := by
  classical
  have hsk := (mem_powersetCard.mp hs).1
  have htk := (mem_powersetCard.mp ht).1
  have hs3 := (mem_powersetCard.mp hs).2
  have ht3 := (mem_powersetCard.mp ht).2
  have hsG := cliqueFamily_subset_triangles hk hs
  have htG := cliqueFamily_subset_triangles hk ht
  have hi : 0 < (s ∩ t).card := by
    have he := card_union_add_card_inter s t
    have hle := card_le_card (union_subset hsk htk)
    omega
  obtain ⟨a,ha⟩ := card_pos.mp hi
  have has := (mem_inter.mp ha).1
  have hat := (mem_inter.mp ha).2
  obtain ⟨b,hbs,hba⟩ := exists_mem_ne (by omega : 1 < s.card) a
  obtain ⟨c,hct,hca⟩ := exists_mem_ne (by omega : 1 < t.card) a
  by_cases hbc : b = c
  · exact triangleConnected_of_shared_vertices hsG htG has hbs hat (hbc ▸ hct) (Ne.symm hba)
  · let q : Finset V := {a,b,c}
    have hqk : q ⊆ k := by
      simp only [q,insert_subset_iff,singleton_subset_iff]
      exact ⟨hsk has,hsk hbs,htk hct⟩
    have hq3 : q.card = 3 := by simp [q,Ne.symm hba,Ne.symm hca,hbc]
    have hqG : q ∈ triangles G := cliqueFamily_subset_triangles hk
      (mem_powersetCard.mpr ⟨hqk,hq3⟩)
    have hsq : TriangleConnected G s q := triangleConnected_of_shared_vertices hsG hqG
      has hbs (by simp [q]) (by simp [q]) (Ne.symm hba)
    have hqt : TriangleConnected G q t := triangleConnected_of_shared_vertices hqG htG
      (by simp [q]) (by simp [q]) hat hct (Ne.symm hca)
    exact hsq.trans hqt

/-- A shared-edge path cannot leave its block in an exhaustive edge-disjoint
clique decomposition. Shared vertices alone do not enter this argument. -/
theorem connected_subset_block {G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition G K) {k s t : Finset V} (hk : k ∈ K)
    (hsk : s ⊆ k) (h : TriangleConnected G s t) : t ⊆ k := by
  induction h with
  | refl => exact hsk
  | tail _ hbc ih =>
    obtain ⟨l,hl,hcl⟩ := hK.exhaustive _ hbc.2.1
    by_cases hkl : k = l
    · simpa [hkl] using hcl
    · have hd := hK.independent k hk l hl hkl
      exact (hbc.2.2 (hd.mono (edges_mono ih) (edges_mono hcl))).elim

/-- Every block in a decomposition is precisely the full triangle component
of each of its triangles. -/
theorem decomposition_component_eq {G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition G K) {k s : Finset V} (hk : k ∈ K)
    (hs : s ∈ cliqueFamily k) : triangleComponent G s = cliqueFamily k := by
  classical
  apply subset_antisymm
  · intro t ht
    have htG := (mem_filter.mp ht).1
    exact mem_powersetCard.mpr ⟨connected_subset_block hK hk (mem_powersetCard.mp hs).1
      (mem_filter.mp ht).2,(mem_triangles.mp htG).card_eq⟩
  · intro t ht
    have htG := cliqueFamily_subset_triangles (hK.clique k hk) ht
    have hc : k.card ≤ 5 := by rcases hK.size k hk with h4|h5 <;> omega
    exact mem_filter.mpr ⟨htG,cliqueFamily_connected (hK.clique k hk) hc hs ht⟩

theorem decomposition_componentCliques {G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition G K) : ComponentCliques G := by
  intro t ht
  obtain ⟨k,hk,htk⟩ := hK.exhaustive t ht
  refine ⟨k,hK.size k hk,?_⟩
  have htF : t ∈ cliqueFamily k := mem_powersetCard.mpr ⟨htk,(mem_triangles.mp ht).card_eq⟩
  rw [decomposition_component_eq hK hk htF]
  exact support_cliqueFamily (by rcases hK.size k hk with h4|h5 <;> omega)

/-- Proven equivalence between the literal shared-edge component statement and
the efficient edge-disjoint K4/K5 decomposition representation. -/
theorem componentCliques_iff_decomposition {G : SimpleGraph V} :
    ComponentCliques G ↔ ∃ K : Finset (Finset V), CliqueDecomposition G K :=
  ⟨componentCliques_decomposition,fun ⟨_,hK⟩ => decomposition_componentCliques hK⟩

end Tuza06

-- Exact theorem-type and transitive-axiom audit of the completed milestones.
#check @Tuza06.component_eq_cliqueFamily_of_support
#check @Tuza06.componentCliques_decomposition
#check @Tuza06.decomposition_component_eq
#check @Tuza06.decomposition_componentCliques
#check @Tuza06.componentCliques_iff_decomposition
#check @Tuza06.componentCliques_equality
#print axioms Tuza06.componentCliques_iff_decomposition
#print axioms Tuza06.componentCliques_equality
