import Tuza06.MinimalObstruction
import Tuza06.PageAugmentation
import Tuza.IntersectingStructure

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Two graph triangles across an independent terminal set can be appended to
suitably chosen maximum residual block packings, with arbitrary outside vertices. -/
theorem two_triangle_augmentation {G H : SimpleGraph V} (hHG : H ≤ G)
    (hblocks : ComponentCliques H) {A s t : Finset V}
    (hA : IndependentVertices H A) (hs : s ∈ triangles G) (ht : t ∈ triangles G)
    (hbs : HasBase A s) (hbt : HasBase A t) (hdst : Disjoint (edges s) (edges t)) :
    nu (triangles H) + 2 ≤ nu (triangles G) := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hblocks
  obtain ⟨P,hP,hcP,hdP⟩ := blocks_avoid_two_pages hK hA
    (mem_triangles.mp hs).card_eq (mem_triangles.mp ht).card_eq hbs hbt
  have hst : s ≠ t := by
    intro h
    have he : edges s = ∅ := disjoint_self.mp (h ▸ hdst)
    exact (edges_nonempty (s := s) (by rw [(mem_triangles.mp hs).card_eq]; omega)).ne_empty he
  have hpair := packing_pair hs ht hst hdst
  have hPG := packing_mono (triangles_mono_graph hHG) hP
  have hcross : ∀ p ∈ P, ∀ q ∈ ({s,t} : Finset (Finset V)),
      Disjoint (edges p) (edges q) := by
    intro p hp q hq
    apply disjoint_left.mpr
    intro e hep heq
    have hepage : e ∈ edges s ∪ edges t := by
      rcases mem_insert.mp hq with rfl | hq
      · exact mem_union_left _ heq
      · exact mem_union_right _ ((mem_singleton.mp hq) ▸ heq)
    exact disjoint_left.mp hdP (mem_biUnion.mpr ⟨p,hp,hep⟩) hepage
  have hpack := packing_mono (show triangles G ∪ triangles G ⊆ triangles G by simp)
    (packing_union hPG hpair hcross)
  have hd := cross_disjoint (triangles_mono hPG.1 (triangles_valid G)) hcross
  have hle := packing_card_le hpack
  rw [card_union_of_disjoint hd,hcP,card_pair hst] at hle
  exact hle

/-- An actual K4 containing T provides a second full graph triangle on every
edge of T. This uses actual graph adjacency, not only an intersecting subfamily. -/
theorem k4_second_triangle {G : SimpleGraph V} {k T A : Finset V}
    (hk : G.IsNClique 4 k) (hT : T.card = 3) (hTk : T ⊆ k) (hAT : A ∈ edges T) :
    ∃ S ∈ triangles G, A ∈ edges S ∧ S ≠ T := by
  classical
  have hdiff : (k \ T).Nonempty := by
    apply card_pos.mp
    rw [card_sdiff_of_subset hTk,hk.card_eq,hT]
    decide
  obtain ⟨x,hx⟩ := hdiff
  let S := insert x A
  have hxA : x ∉ A := fun ha => (mem_sdiff.mp hx).2 ((mem_edges.mp hAT).1 ha)
  have hS3 : S.card = 3 := by simp [S,hxA,(mem_edges.mp hAT).2]
  have hSk : S ⊆ k := by
    intro y hy
    rcases mem_insert.mp hy with rfl | hy
    · exact (mem_sdiff.mp hx).1
    · exact hTk ((mem_edges.mp hAT).1 hy)
  refine ⟨S,mem_triangles.mpr ⟨?_,hS3⟩,mem_edges.mpr ⟨subset_insert _ _,(mem_edges.mp hAT).2⟩,?_⟩
  · intro a ha b hb hab
    exact hk.isClique (hSk ha) (hSk hb) hab
  · intro heq
    have hxS : x ∈ S := mem_insert_self _ _
    exact (mem_sdiff.mp hx).2 (heq ▸ hxS)

/-- Section 3 of the ordinary proof: no graph edge of a minimal combined
inequality/equality obstruction belongs to exactly one full graph triangle. -/
theorem minimal_no_unique_triangle_edge {G : SimpleGraph V} (hG : MinimalObstruction G)
    {A : Finset V} (hA : G.IsNClique 2 A)
    (hunique : ∃ T ∈ triangles G, A ∈ edges T ∧
      ∀ S ∈ triangles G, A ∈ edges S → S = T) : False := by
  classical
  obtain ⟨T,hT,hAT,huniq⟩ := hunique
  let H := deleteTriangle G T
  let X := (edges T).erase A
  have hXcard : X.card = 2 := by
    change ((edges T).erase A).card = 2
    rw [card_erase_of_mem hAT,edges,card_powersetCard,(mem_triangles.mp hT).card_eq]
    decide
  have hXnonempty : X.Nonempty := card_pos.mp (by omega)
  have hHstrict : edgeCount H < edgeCount G := by
    apply edgeCount_strict (delete_le G T) hA
    intro hAH
    obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp hA.card_eq
    have haA : a ∈ A := by rw [heq]; simp
    have hbA : b ∈ A := by rw [heq]; simp
    exact (hAH.isClique haA hbA hab).2
      ⟨(mem_edges.mp hAT).1 haA,(mem_edges.mp hAT).1 hbA⟩
  have hGoodH : Good H := hG.2 H (delete_le G T) hHstrict
  have hpack : 1 + nu (triangles H) ≤ nu (triangles G) := by
    have hcross : ∀ p ∈ ({T} : Finset (Finset V)), ∀ q ∈ triangles H,
        Disjoint (edges p) (edges q) := by
      intro p hp q hq
      have hpT := mem_singleton.mp hp
      subst p
      exact (deleted_edges_disjoint hq).symm
    simpa using packing_extension (triangles_valid G) (triangles_mono_graph (delete_le G T))
      (packing_singleton hT) hcross
  have hlost : ∀ S ∈ triangles G, S ∈ triangles H ∨ ∃ e ∈ X, e ∈ edges S := by
    intro S hS
    by_cases hSH : S ∈ triangles H
    · exact Or.inl hSH
    · obtain ⟨e,heT,heS⟩ := new_triangle_removed_edge hS hSH
      by_cases heA : e = A
      · have hST := huniq S hS (heA ▸ heS)
        obtain ⟨f,hf⟩ := hXnonempty
        exact Or.inr ⟨f,hf,hST.symm ▸ (mem_erase.mp hf).2⟩
      · exact Or.inr ⟨e,mem_erase.mpr ⟨heA,heT⟩,heS⟩
  have hcover : tau (triangles G) ≤ tau (triangles H) + 2 := by
    simpa [hXcard] using cover_extension (triangles_valid H) hlost
  have hacct := balanced_accounting (failure_lower_bound hG.1) hGoodH.1 hpack
    (show tau (triangles G) ≤ tau (triangles H) + 2 * 1 by omega)
  have hblocks : ComponentCliques H := hGoodH.2 hacct.2.2
  let F := triangles G \ triangles H
  have hFG : F ⊆ triangles G := sdiff_subset
  have hFvalid : Triangles F := triangles_mono hFG (triangles_valid G)
  have hFbase : ∀ S ∈ F, HasBase T S := by
    intro S hS
    exact new_triangle_removed_edge (mem_sdiff.mp hS).1 (mem_sdiff.mp hS).2
  have hinter : ∀ S ∈ F, ∀ R ∈ F, ¬ Disjoint (edges S) (edges R) := by
    intro S hS R hR hd
    have haug := two_triangle_augmentation (delete_le G T) hblocks (delete_independent G T)
      (hFG hS) (hFG hR) (hFbase S hS) (hFbase R hR) hd
    change nu (triangles H) + 2 ≤ nu (triangles G) at haug
    omega
  have hTF : T ∈ F := by
    apply mem_sdiff.mpr
    refine ⟨hT,?_⟩
    intro hTH
    have he : edges T = ∅ := disjoint_self.mp (deleted_edges_disjoint hTH)
    exact (edges_nonempty (s := T) (by rw [(mem_triangles.mp hT).card_eq]; omega)).ne_empty he
  have hFnu : nu F = 1 := by
    have hlo : 1 ≤ nu F := nu_pos ⟨T,hTF⟩
    have hhi : nu F ≤ 1 := by
      apply nu_le_of_packings
      intro P hPF hP
      apply card_le_one.mpr
      intro S hS R hR
      by_contra hSR
      exact hinter S (mem_powerset.mp hPF hS) R (mem_powerset.mp hPF hR)
        (hP S hS R hR hSR)
    omega
  have hFtau : tau F ≤ 1 := by
    by_contra hn
    obtain ⟨k,hk,hall⟩ := intersecting_k4_structure hFG hFnu (by omega)
    obtain ⟨S,hS,hAS,hST⟩ := k4_second_triangle hk (mem_triangles.mp hT).card_eq (hall T hTF) hAT
    exact hST (huniq S hS hAS)
  obtain ⟨C,hC,hcardC⟩ := exists_min_cover hFvalid
  have hcover1 := cover_extension (triangles_valid H) (F := triangles G) (X := C) (by
    intro S hS
    by_cases hSH : S ∈ triangles H
    · exact Or.inl hSH
    · exact Or.inr (hC S (mem_sdiff.mpr ⟨hS,hSH⟩)))
  omega

/-- Every graph edge in a minimal combined obstruction lies in at least two
DISTINCT full graph triangles. -/
theorem minimal_edge_two_triangles {G : SimpleGraph V} (hG : MinimalObstruction G)
    {A : Finset V} (hA : G.IsNClique 2 A) :
    ∃ T ∈ triangles G, ∃ S ∈ triangles G,
      A ∈ edges T ∧ A ∈ edges S ∧ T ≠ S := by
  classical
  obtain ⟨T,hT,hAT⟩ := minimal_every_edge_in_triangle hG hA
  have hex : ∃ S ∈ triangles G, A ∈ edges S ∧ S ≠ T := by
    by_contra hn
    apply minimal_no_unique_triangle_edge hG hA
    refine ⟨T,hT,hAT,?_⟩
    intro S hS hAS
    by_contra hST
    exact hn ⟨S,hS,hAS,hST⟩
  obtain ⟨S,hS,hAS,hST⟩ := hex
  exact ⟨T,hT,S,hS,hAT,hAS,Ne.symm hST⟩

/-- The finite codegree formulation needed by link-degree arguments. -/
theorem minimal_edge_codegree {G : SimpleGraph V} (hG : MinimalObstruction G)
    {A : Finset V} (hA : G.IsNClique 2 A) :
    2 ≤ ((triangles G).filter (fun T => A ∈ edges T)).card := by
  classical
  obtain ⟨T,hT,S,hS,hAT,hAS,hTS⟩ := minimal_edge_two_triangles hG hA
  have hsub : ({T,S} : Finset (Finset V)) ⊆
      (triangles G).filter (fun R => A ∈ edges R) := by
    simp only [insert_subset_iff,singleton_subset_iff,mem_filter]
    exact ⟨⟨hT,hAT⟩,hS,hAS⟩
  simpa only [card_pair hTS] using card_le_card hsub

end Tuza06

#check @Tuza06.two_triangle_augmentation
#check @Tuza06.k4_second_triangle
#check @Tuza06.minimal_no_unique_triangle_edge
#check @Tuza06.minimal_edge_two_triangles
#check @Tuza06.minimal_edge_codegree
#print axioms Tuza06.minimal_no_unique_triangle_edge
#print axioms Tuza06.minimal_edge_codegree
