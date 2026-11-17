import Tuza24.ForestMatchingSlack
import Tuza24.ForestMatchingBoundary
import Tuza24.ForestMatchingDeletion
import Tuza24.AlternatingForestLeaves

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- An explicit active-set deficit supplies an exposed active vertex. -/
theorem matching_exposed_active_vertex {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) {S : Finset V} (hdef : 2*M.card < S.card) :
    ∃ u ∈ S, u ∉ matchingVertices M := by
  classical
  by_contra h
  push Not at h
  have hc := card_le_card h
  rw [matchingVertices_card hM] at hc
  omega

/-- A leaf surviving isolation is an original leaf if it has no neighbor among
the deleted pair. -/
theorem isolate_pair_leaf_lift {G : SimpleGraph V} {a b x z : V}
    (hxz : (isolate G {a,b}).Adj x z)
    (hleaf : ∀ t, (isolate G {a,b}).Adj x t → t=z)
    (hboundary : ¬(G.Adj a x ∨ G.Adj b x)) :
    G.Adj x z ∧ ∀ t, G.Adj x t → t=z := by
  refine ⟨hxz.1,?_⟩
  intro t hxt
  apply hleaf t
  refine ⟨hxt,hxz.2.1,?_⟩
  intro ht
  rcases mem_insert.mp ht with rfl|ht
  · exact hboundary (Or.inl hxt.symm)
  · exact hboundary (Or.inr ((mem_singleton.mp ht) ▸ hxt.symm))

/-- A nonisolated vertex that becomes isolated after deleting an adjacent pair
was an original leaf, provided it is outside the pair. -/
theorem forest_isolated_after_pair_leaf {G : SimpleGraph V} (hG : G.IsAcyclic)
    {a b u : V} (hab : G.Adj a b) (hu : u ∉ ({a,b} : Finset V))
    (hne : ∃ z, G.Adj u z) (hiso : ¬∃ z, (isolate G {a,b}).Adj u z) :
    ∃ z, G.Adj u z ∧ ∀ t, G.Adj u t → t=z := by
  classical
  have hbound : ∀ t, G.Adj u t → t∈({a,b} : Finset V) := by
    intro t hut
    by_contra ht
    exact hiso ⟨t,hut,hu,ht⟩
  have hnotboth : ¬(G.Adj a u ∧ G.Adj b u) := by
    rintro ⟨hau,hbu⟩
    exact forest_adjacent_pair_no_cross_attachment hG hab hu hu hau hbu SimpleGraph.Reachable.rfl
  obtain ⟨z,huz⟩ := hne
  refine ⟨z,huz,?_⟩
  intro t hut
  have hz := hbound z huz
  have ht := hbound t hut
  simp only [mem_insert,mem_singleton] at hz ht
  rcases hz with hza|hzb <;> rcases ht with hta|htb
  · exact hta.trans hza.symm
  · exact (hnotboth ⟨hza ▸ huz.symm,htb ▸ hut.symm⟩).elim
  · exact (hnotboth ⟨hta ▸ hut.symm,hzb ▸ huz.symm⟩).elim
  · exact htb.trans hzb.symm

/-- Retain an edge already in a maximum forest matching while exposing an
original leaf. A nonisolated unmatched vertex is the precise deficit witness. -/
theorem forest_retain_edge_expose_leaf_of_unmatched {G : SimpleGraph V}
    (hG : G.IsAcyclic) {M : Finset (Finset V)} (hM : MaximumMatching G M)
    {a b : V} (he : ({a,b} : Finset V) ∈ M) {u : V}
    (hu : u ∉ matchingVertices M) (hune : ∃ z, G.Adj u z) :
    ∃ N x, MaximumMatching G N ∧ ({a,b} : Finset V) ∈ N ∧
      x ∉ matchingVertices N ∧ (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t=z) := by
  classical
  have hab : G.Adj a b := by
    have heG := hM.1.1 _ he
    have habne : a≠b := by intro h; have hc := heG.card_eq; simp [h] at hc
    exact heG.isClique (by simp) (by simp) habne
  have huPair : u ∉ ({a,b} : Finset V) := by
    intro h
    exact hu (mem_biUnion.mpr ⟨{a,b},he,h⟩)
  let H := isolate G {a,b}
  have hH : H.IsAcyclic := isolate_acyclic hG {a,b}
  have hMH := maximumMatching_erase_isolate hM he
  have huH : Exposable H u :=
    ⟨M.erase {a,b},hMH,fun h => hu (matchingVertices_erase_subset M {a,b} h)⟩
  by_cases huneH : ∃ z, H.Adj u z
  · obtain ⟨x,y,hxy,hx,hy,hux,huy,hxl,hyl⟩ := forest_exposable_two_leaves hH huH huneH
    have hchoice : ∃ x, Exposable H x ∧
        (∃ z, H.Adj x z ∧ ∀ t, H.Adj x t → t=z) ∧ ¬(G.Adj a x ∨ G.Adj b x) := by
      by_cases hxB : G.Adj a x ∨ G.Adj b x
      · have hyB : ¬(G.Adj a y ∨ G.Adj b y) := by
          intro hyB
          obtain ⟨xz,hxz,hxleaf⟩ := hxl
          obtain ⟨yz,hyz,hyleaf⟩ := hyl
          exact hxy (forest_adjacent_pair_boundary_unique hG hab hxz.2.1 hyz.2.1
            (hux.symm.trans huy) hxB hyB)
        exact ⟨y,hy,hyl,hyB⟩
      · exact ⟨x,hx,hxl,hxB⟩
    obtain ⟨x,⟨N,hN,hxN⟩,⟨z,hxz,hxleaf⟩,hxB⟩ := hchoice
    exact ⟨insert {a,b} N,x,maximumMatching_restore_edge hM he hN,by simp,
      not_mem_matchingVertices_insert hxN hxz.2.1,
      z,isolate_pair_leaf_lift hxz hxleaf hxB⟩
  · exact ⟨M,u,hM,he,hu,forest_isolated_after_pair_leaf hG hab huPair hune huneH⟩

/-- Fact A with an explicit active set: a maximum matching containing a given
edge can be chosen to miss an original leaf whenever active deficiency is positive. -/
theorem forest_retain_edge_expose_leaf {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {a b : V}
    (he : ({a,b} : Finset V) ∈ M) {S : Finset V}
    (hS : ∀ u∈S, ∃ z, G.Adj u z) (hdef : 2*M.card < S.card) :
    ∃ N x, MaximumMatching G N ∧ ({a,b} : Finset V) ∈ N ∧
      x ∉ matchingVertices N ∧ (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t=z) := by
  obtain ⟨u,huS,hu⟩ := matching_exposed_active_vertex hM.1 hdef
  exact forest_retain_edge_expose_leaf_of_unmatched hG hM he hu (hS u huS)

end Tuza24
