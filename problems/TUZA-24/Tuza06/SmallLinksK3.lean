import Tuza06.SmallLinksOperations

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem linkClosed_not_hub {G : SimpleGraph V} {v : V} {C : Finset V}
    (hC : LinkClosed G v C) : v ∉ C := fun hv => G.irrefl (hC.1 v hv)

theorem linkClosed_hub_clique {G : SimpleGraph V} {v : V} {C : Finset V}
    (hC : LinkClosed G v C) (hclique : G.IsClique (C : Set V)) :
    G.IsClique ((insert v C : Finset V) : Set V) := by
  intro a ha b hb hab
  change a ∈ insert v C at ha
  change b ∈ insert v C at hb
  rcases mem_insert.mp ha with hav|haC
  · subst a
    rcases mem_insert.mp hb with hbv|hbC
    · exact (hab hbv.symm).elim
    · exact hC.1 b hbC
  · rcases mem_insert.mp hb with hbv|hbC
    · subst b
      exact (hC.1 a haC).symm
    · exact hclique haC hbC hab

/-- Every local-core edge is a spoke or a rim edge, with no lost third kind. -/
theorem hub_edges_split (v : V) (C : Finset V) :
    edges (insert v C) ⊆ spokeEdges v C ∪ edges C := by
  intro e he
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp he).2
  have ha : a ∈ insert v C := (mem_edges.mp he).1 (by rw [heq]; simp)
  have hb : b ∈ insert v C := (mem_edges.mp he).1 (by rw [heq]; simp)
  rcases mem_insert.mp ha with hav|haC
  · subst a
    have hbC : b ∈ C := (mem_insert.mp hb).resolve_left hab.symm
    exact mem_union_left _ (mem_image.mpr ⟨b,hbC,heq.symm⟩)
  · rcases mem_insert.mp hb with hbv|hbC
    · subst b
      exact mem_union_left _ (mem_image.mpr ⟨a,haC,by simpa only [pair_comm] using heq.symm⟩)
    · exact mem_union_right _ (mem_edges.mpr
        ⟨by rw [heq]; simpa only [insert_subset_iff,singleton_subset_iff] using And.intro haC hbC,
          (mem_edges.mp he).2⟩)

/-- The arbitrary-outside-page augmentation for a closed K3 link component.
Only spokes into C are deleted; other link components at v remain intact. -/
theorem minimal_k3_link_no_external_page {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} {C : Finset V} (hC : LinkClosed G v C) (hC3 : C.card = 3)
    (hclique : G.IsClique (C : Set V)) {A t : Finset V}
    (hAC : A ∈ edges C) (ht : t ∈ triangles G) (hAt : A ∈ edges t)
    (hout : ¬ t ⊆ insert v C) : False := by
  classical
  have hvC := linkClosed_not_hub hC
  have hAsub := (mem_edges.mp hAC).1
  have hA2 := (mem_edges.mp hAC).2
  have hvA : v ∉ A := fun hv => hvC (hAsub hv)
  let B := insert v C
  let T := insert v A
  let D : Finset (Finset V) := spokeEdges v C ∪ {A}
  let X : Finset (Finset V) := {A,B \ A}
  let H := removeEdgeFamily G D
  have hBclique : G.IsClique (B : Set V) := linkClosed_hub_clique hC hclique
  have hB4 : B.card = 4 := by simp [B,hvC,hC3]
  have hTB : T ⊆ B := insert_subset_insert v hAsub
  have hT3 : T.card = 3 := by simp [T,hvA,hA2]
  have hTG : T ∈ triangles G := cliqueFamily_subset_triangles hBclique
    (mem_powersetCard.mpr ⟨hTB,hT3⟩)
  have hAG : G.IsNClique 2 A :=
    ⟨fun a ha b hb hab => hclique (hAsub ha) (hAsub hb) hab,hA2⟩
  have hAD : A ∈ D := mem_union_right _ (mem_singleton_self _)
  have hTD : edges T ⊆ D := by
    intro e he
    rcases mem_union.mp (hub_edges_split v A he) with hspoke|hrim
    · obtain ⟨a,ha,rfl⟩ := mem_image.mp hspoke
      exact mem_union_left _ (mem_image.mpr ⟨a,hAsub ha,rfl⟩)
    · rw [two_vertex_edges hA2] at hrim
      exact (mem_singleton.mp hrim) ▸ hAD
  have hcoverB : Covers (cliqueFamily B) X := k4_opposite_cover hB4 (cliqueFamily_valid B)
    (fun q hq => (mem_powersetCard.mp hq).1) (edges_mono (subset_insert v C) hAC)
  have hlost : ∀ q ∈ triangles G, q ∈ triangles H ∨ ∃ e ∈ X, e ∈ edges q := by
    intro q hq
    by_cases hqH : q ∈ triangles H
    · exact Or.inl hqH
    · obtain ⟨e,heD,heq⟩ := removeEdgeFamily_lost hq hqH
      rcases mem_union.mp heD with hspoke|heA
      · obtain ⟨a,ha,rfl⟩ := mem_image.mp hspoke
        have hqB : q ⊆ B := linkClosed_spoke_triangle hC ha hq heq
        exact Or.inr (hcoverB q (mem_powersetCard.mpr ⟨hqB,(mem_triangles.mp hq).card_eq⟩))
      · have heqA : e = A := mem_singleton.mp heA
        exact Or.inr ⟨A,mem_insert_self _ _,heqA ▸ heq⟩
  have hbal := minimal_balanced_removeEdges hG hAG hAD (packing_singleton hTG)
    (show support {T} ⊆ D by simpa [support] using hTD)
    (show X.card ≤ 2 * ({T} : Finset (Finset V)).card by
      simpa only [card_singleton] using (card_insert_le A {B \ A}).trans (by simp)) hlost
  have hnu : nu (triangles G) = nu (triangles H) + 1 := by
    simpa only [card_singleton] using hbal.2.1
  have hblocks : ComponentCliques H := hbal.2.2.2
  have hTind : IndependentVertices H T := removeEdgeFamily_independent hTD
  obtain ⟨a,b,hab,hAeq⟩ := card_eq_two.mp hA2
  have haA : a ∈ A := by rw [hAeq]; simp
  have hbA : b ∈ A := by rw [hAeq]; simp
  have haC := hAsub haA
  have hbC := hAsub hbA
  let L := insert v (C.erase a)
  have hvErase : v ∉ C.erase a := fun h => hvC (mem_erase.mp h).2
  have hL3 : L.card = 3 := by simp [L,hvErase,card_erase_of_mem haC,hC3]
  have hLB : L ⊆ B := insert_subset_insert v (erase_subset a C)
  have hLG : L ∈ triangles G := cliqueFamily_subset_triangles hBclique
    (mem_powersetCard.mpr ⟨hLB,hL3⟩)
  have hav : a ≠ v := by intro h; exact hvC (h ▸ haC)
  have haL : a ∉ L := by simp [L,hav]
  have hAL : A ∉ edges L := fun he => haL ((mem_edges.mp he).1 haA)
  have hdisj : Disjoint (edges t) (edges L) :=
    (external_page_local_cross (mem_triangles.mp ht).card_eq hAt
      (hAsub.trans (subset_insert v C)) hout hLB hAL).symm
  have hbt : HasBase T t := ⟨A,mem_edges.mpr ⟨subset_insert _ _,hA2⟩,hAt⟩
  have hbT : ({v,b} : Finset V) ∈ edges T := mem_edges.mpr
    ⟨by simp [T,hbA],by simp [show v ≠ b from fun h => hvC (h.symm ▸ hbC)]⟩
  have hbL : ({v,b} : Finset V) ∈ edges L := mem_edges.mpr
    ⟨by simp [L,hab.symm,hbC],by simp [show v ≠ b from fun h => hvC (h.symm ▸ hbC)]⟩
  have hbLbase : HasBase T L := ⟨{v,b},hbT,hbL⟩
  have haug := two_triangle_augmentation (removeEdgeFamily_le G D) hblocks hTind ht hLG hbt hbLbase hdisj
  change nu (triangles H) + 2 ≤ nu (triangles G) at haug
  omega

/-- Complete K3 link-component exclusion with arbitrary outside attachments. -/
theorem minimal_no_k3_link {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} {C : Finset V} (hC : LinkClosed G v C) (hC3 : C.card = 3)
    (hclique : G.IsClique (C : Set V)) : False := by
  classical
  let B := insert v C
  have hBclique : G.IsClique (B : Set V) := linkClosed_hub_clique hC hclique
  have hB4 : B.card = 4 := by simp [B,linkClosed_not_hub hC,hC3]
  apply minimal_no_isolated_clique hG hBclique (Or.inl hB4)
  intro t ht hnd
  obtain ⟨e,het,heB⟩ := not_disjoint_iff.mp hnd
  rcases mem_union.mp (hub_edges_split v C heB) with hspoke|hrim
  · obtain ⟨a,ha,rfl⟩ := mem_image.mp hspoke
    exact linkClosed_spoke_triangle hC ha ht het
  · by_contra hout
    exact minimal_k3_link_no_external_page hG hC hC3 hclique hrim ht het hout

end Tuza06
