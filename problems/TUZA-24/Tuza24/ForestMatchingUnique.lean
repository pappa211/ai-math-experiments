import Tuza24.AlternatingForestDecomposition
import Tuza24.ForestAPI

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Equal-support matchings have no leaf in their symmetric difference: an edge
belonging only to the first forces a distinct second-only partner edge. -/
theorem matching_difference_partner {G : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : EdgeMatching G M) (hN : EdgeMatching G N)
    (hsupport : matchingVertices M = matchingVertices N) {x y : V}
    (hxyM : ({x,y} : Finset V) ∈ M) (hxyN : ({x,y} : Finset V) ∉ N) :
    ∃ z, z ≠ y ∧ G.Adj x z ∧ ({x,z} : Finset V) ∈ N \ M := by
  classical
  have hxM : x ∈ matchingVertices M := mem_biUnion.mpr ⟨{x,y},hxyM,by simp⟩
  rw [hsupport] at hxM
  obtain ⟨z,hxz,hxzN⟩ := matching_partner hN hxM
  have hzy : z ≠ y := by intro h; exact hxyN (h ▸ hxzN)
  have hpne : ({x,z} : Finset V) ≠ {x,y} := by intro h; exact hxyN (h ▸ hxzN)
  have hxzM : ({x,z} : Finset V) ∉ M := by
    intro h
    exact disjoint_left.mp (hM.2 {x,z} h {x,y} hxyM hpne)
      (show x ∈ ({x,z} : Finset V) by simp) (by simp)
  exact ⟨z,hzy,hxz,mem_sdiff.mpr ⟨hxzN,hxzM⟩⟩

/-- A forest has at most one matching on any prescribed incident vertex set.
In particular its perfect matching, when present, is unique. This formulation
allows arbitrary isolated ambient vertices and disconnected supports. -/
theorem forest_matching_eq_of_vertices_eq {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M N : Finset (Finset V)} (hM : EdgeMatching G M) (hN : EdgeMatching G N)
    (hsupport : matchingVertices M = matchingVertices N) : M=N := by
  classical
  let E := (M \ N) ∪ (N \ M)
  let H := selectedGraph E
  have hEactual : E ⊆ graphEdges G := by
    intro e he
    rcases mem_union.mp he with he|he
    · exact mem_graphEdges.mpr (hM.1 e (mem_sdiff.mp he).1)
    · exact mem_graphEdges.mpr (hN.1 e (mem_sdiff.mp he).1)
  have hHle : H ≤ G := selectedGraph_le_of_actual hEactual
  have hHacy : H.IsAcyclic := hG.anti hHle
  by_contra hne
  have hEn : E.Nonempty := by
    by_contra hn
    have hEmpty : E=∅ := not_nonempty_iff_eq_empty.mp hn
    apply hne
    ext e
    constructor
    · intro he
      by_contra heN
      have heE : e∈E := mem_union_left _ (mem_sdiff.mpr ⟨he,heN⟩)
      simpa [hEmpty] using heE
    · intro he
      by_contra heM
      have heE : e∈E := mem_union_right _ (mem_sdiff.mpr ⟨he,heM⟩)
      simpa [hEmpty] using heE
  obtain ⟨e,he⟩ := hEn
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (mem_graphEdges.mp (hEactual he)).card_eq
  have hHab : H.Adj a b := selectedGraph_adj.mpr ⟨hab,he⟩
  obtain ⟨x,y,hxy,hleaf⟩ := forest_leaf hHacy ⟨a,b,hHab⟩
  have hxyE := (selectedGraph_adj.mp hxy).2
  rcases mem_union.mp hxyE with hxyMN|hxyNM
  · obtain ⟨hxyM,hxyN⟩ := mem_sdiff.mp hxyMN
    obtain ⟨z,hzy,hxz,hxzNM⟩ := matching_difference_partner hM hN hsupport hxyM hxyN
    exact hzy (hleaf z (selectedGraph_adj.mpr ⟨hxz.ne,mem_union_right _ hxzNM⟩))
  · obtain ⟨hxyN,hxyM⟩ := mem_sdiff.mp hxyNM
    obtain ⟨z,hzy,hxz,hxzMN⟩ := matching_difference_partner hN hM hsupport.symm hxyN hxyM
    exact hzy (hleaf z (selectedGraph_adj.mpr ⟨hxz.ne,mem_union_left _ hxzMN⟩))

/-- When all maximum matchings are perfect on the same set, every edge of one
is forced in all the others. -/
theorem forest_perfect_matching_edge_forced {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M N : Finset (Finset V)} (hM : EdgeMatching G M) (hN : EdgeMatching G N)
    (hsupport : matchingVertices M = matchingVertices N) {e : Finset V}
    (he : e ∈ M) : e ∈ N := (forest_matching_eq_of_vertices_eq hG hM hN hsupport) ▸ he

/-- All maximum forest matchings have the identical perfect remainder. -/
theorem forest_exposureMatchingZ_eq {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M N : Finset (Finset V)} (hM : MaximumMatching G M) (hN : MaximumMatching G N) :
    exposureMatchingZ G M = exposureMatchingZ G N := by
  apply forest_matching_eq_of_vertices_eq
    (isolate_acyclic hG (exposureSet G ∪ exposureNeighbors G))
    (exposureMatchingZ_isMatching hM.1) (exposureMatchingZ_isMatching hN.1)
  rw [exposureMatchingZ_vertices hG hM,exposureMatchingZ_vertices hG hN]

/-- A forest in which every edge can be avoided by a maximum matching has no
nonempty perfect remainder. The ambient isolated vertices remain in D. -/
theorem forest_exposureRemainder_empty_of_avoidable {G : SimpleGraph V}
    (hG : G.IsAcyclic)
    (havoid : ∀ e, G.IsNClique 2 e → ∃ N, MaximumMatching G N ∧ e ∉ N) :
    exposureRemainder G = ∅ := by
  classical
  obtain ⟨M,Q,hM,hQ,hcard⟩ := forest_maximum_matching_cover hG
  have hZempty : exposureMatchingZ G M = ∅ := by
    apply eq_empty_iff_forall_notMem.mpr
    intro e he
    obtain ⟨N,hN,heN⟩ := havoid e (hM.1.1 e (exposureMatchingZ_subset G M he))
    rw [forest_exposureMatchingZ_eq hG hM hN] at he
    exact heN (exposureMatchingZ_subset G N he)
  rw [← exposureMatchingZ_vertices hG hM,hZempty]
  simp [matchingVertices]

end Tuza24
