import Tuza06.Components
import Tuza06.Reduction

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Reinsert one triangle across an independent terminal set, preserving a maximum
residual packing by proven block compatibility. -/
theorem one_triangle_augmentation {G H : SimpleGraph V} (hHG : H ≤ G)
    (hblocks : ComponentCliques H) {A t : Finset V}
    (hA : IndependentVertices H A) (ht : t ∈ triangles G) (hb : HasBase A t) :
    nu (triangles H) + 1 ≤ nu (triangles G) := by
  classical
  obtain ⟨K, hK⟩ := componentCliques_decomposition hblocks
  obtain ⟨P, hp, hc, hd⟩ := blocks_avoid_two_pages hK hA
    (mem_triangles.mp ht).card_eq (mem_triangles.mp ht).card_eq hb hb
  have hd' : ∀ p ∈ P, ∀ q ∈ ({t} : Finset (Finset V)), Disjoint (edges p) (edges q) := by
    intro p hp' q hq
    have hqt : q = t := mem_singleton.mp hq
    subst q
    apply disjoint_left.mpr
    intro e hep het
    exact disjoint_left.mp hd (mem_biUnion.mpr ⟨p, hp', hep⟩) (mem_union_left _ het)
  have hpG := packing_mono (triangles_mono_graph hHG) hp
  have hpack := packing_mono (show triangles G ∪ triangles G ⊆ triangles G by simp)
    (packing_union hpG (packing_singleton ht) hd')
  have hdisj := cross_disjoint (triangles_mono hpG.1 (triangles_valid G)) hd'
  have hle := packing_card_le hpack
  rw [card_union_of_disjoint hdisj, hc, card_singleton] at hle
  exact hle

theorem two_vertex_edges {A : Finset V} (hA : A.card = 2) : edges A = {A} := by
  unfold edges
  rw [← hA]
  exact powersetCard_self A

/-- Deleting one actual graph edge loses at most one packed triangle. -/
theorem single_edge_packing_loss {G : SimpleGraph V} {A : Finset V} (hA : A.card = 2) :
    nu (triangles G) ≤ nu (triangles (deleteTriangle G A)) + 1 := by
  classical
  let H := deleteTriangle G A
  obtain ⟨P, hp, hcP⟩ := exists_max_packing (triangles G)
  have hPL : (P \ triangles H).card ≤ 1 := by
    apply card_le_one.mpr
    intro s hs t ht
    by_contra hst
    obtain ⟨e, heA, hes⟩ := new_triangle_removed_edge (hp.1 (mem_sdiff.mp hs).1) (mem_sdiff.mp hs).2
    obtain ⟨f, hfA, hft⟩ := new_triangle_removed_edge (hp.1 (mem_sdiff.mp ht).1) (mem_sdiff.mp ht).2
    rw [two_vertex_edges hA] at heA hfA
    have heq : e = A := mem_singleton.mp heA
    have hfq : f = A := mem_singleton.mp hfA
    exact disjoint_left.mp (hp.2 s (mem_sdiff.mp hs).1 t (mem_sdiff.mp ht).1 hst)
      (heq ▸ hes) (hfq ▸ hft)
  have hpH : Packing (triangles H) (P ∩ triangles H) :=
    ⟨inter_subset_right, independent_mono inter_subset_left hp.2⟩
  have hle := packing_card_le hpH
  have hcard := card_sdiff_add_card_inter P (triangles H)
  change nu (triangles G) ≤ nu (triangles H) + 1
  omega

/-- Deleting one edge permits a one-edge cover increment, including all pages. -/
theorem single_edge_cover_extension {G : SimpleGraph V} {A : Finset V} (hA : A.card = 2) :
    tau (triangles G) ≤ tau (triangles (deleteTriangle G A)) + 1 := by
  classical
  have h := cover_extension (triangles_valid (deleteTriangle G A)) (F := triangles G) (X := {A}) (by
    intro t ht
    by_cases hr : t ∈ triangles (deleteTriangle G A)
    · exact Or.inl hr
    · obtain ⟨e, heA, het⟩ := new_triangle_removed_edge ht hr
      rw [two_vertex_edges hA] at heA
      have heq : e = A := mem_singleton.mp heA
      exact Or.inr ⟨A, mem_singleton_self _, heq ▸ het⟩)
  simpa only [card_singleton] using h

/-- The tight-critical accounting for a single edge in a minimal combined
obstruction. The residual induction hypotheses and an incident triangle are
explicit; neither global Tuza nor equality classification is an external axiom. -/
theorem tight_critical_edge {G : SimpleGraph V} {A t : Finset V}
    (hA : A.card = 2) (ht : t ∈ triangles G) (hAt : A ∈ edges t)
    (hfailure : 2 * nu (triangles G) ≤ tau (triangles G))
    (hind : tau (triangles (deleteTriangle G A)) ≤ 2 * nu (triangles (deleteTriangle G A)))
    (heq : tau (triangles (deleteTriangle G A)) = 2 * nu (triangles (deleteTriangle G A)) →
      ComponentCliques (deleteTriangle G A)) :
    tau (triangles G) = 2 * nu (triangles G) ∧
    nu (triangles (deleteTriangle G A)) = nu (triangles G) ∧
    tau (triangles (deleteTriangle G A)) + 1 = tau (triangles G) := by
  have hnuMono := nu_mono (triangles_mono_graph (delete_le G A))
  have hnuLoss := single_edge_packing_loss (G := G) hA
  have hcover := single_edge_cover_extension (G := G) hA
  have hnu : nu (triangles (deleteTriangle G A)) = nu (triangles G) := by omega
  have htauStrict : tau (triangles (deleteTriangle G A)) < 2 * nu (triangles G) := by
    by_contra hn
    have htauEq : tau (triangles (deleteTriangle G A)) = 2 * nu (triangles (deleteTriangle G A)) := by omega
    have haug := one_triangle_augmentation (delete_le G A) (heq htauEq)
      (delete_independent G A) ht ⟨A, by rw [two_vertex_edges hA]; simp, hAt⟩
    omega
  omega

end Tuza06
