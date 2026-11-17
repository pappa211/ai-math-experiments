import Tuza24.ForestMatchingLeafRetention

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Cutting an edge leaves every edge at another vertex unchanged. -/
theorem deleteEdge_adj_of_not_endpoint {G : SimpleGraph V} {a b x y : V}
    (hxy : G.Adj x y) (hx : x ∉ ({a,b} : Finset V)) :
    (G.deleteEdges {s(a,b)}).Adj x y := by
  apply SimpleGraph.deleteEdges_adj.mpr
  refine ⟨hxy,?_⟩
  simp only [Set.mem_singleton_iff,Sym2.eq_iff]
  rintro (⟨hxa,_⟩|⟨hxb,_⟩)
  · exact hx (by simp [hxa])
  · exact hx (by simp [hxb])

/-- A matching omitting an edge is still a matching after that edge is cut. -/
theorem matching_deleteEdge {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) {a b : V} (he : ({a,b} : Finset V) ∉ M) :
    EdgeMatching (G.deleteEdges {s(a,b)}) M := by
  classical
  refine ⟨?_,hM.2⟩
  intro e heM
  have heG := hM.1 e heM
  refine ⟨?_,heG.card_eq⟩
  intro x hx y hy hxy
  apply SimpleGraph.deleteEdges_adj.mpr
  refine ⟨heG.isClique hx hy hxy,?_⟩
  simp only [Set.mem_singleton_iff]
  intro hp
  have hpe : ({x,y} : Finset V)=e := eq_of_subset_of_card_le
    (by intro z hz; rcases mem_insert.mp hz with rfl|hz; exact hx; exact (mem_singleton.mp hz).symm ▸ hy)
    (by rw [heG.card_eq]; simp [hxy])
  have hpair : ({x,y} : Finset V)={a,b} := by
    rcases Sym2.eq_iff.mp hp with ⟨hxa,hyb⟩|⟨hxb,hya⟩
    · simp [hxa,hyb]
    · simp [hxb,hya,pair_comm]
  exact he ((hpe.symm.trans hpair) ▸ heM)

/-- An avoiding maximum matching remains maximum after cutting the avoided edge. -/
theorem maximumMatching_deleteEdge {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : MaximumMatching G M) {a b : V} (he : ({a,b} : Finset V) ∉ M) :
    MaximumMatching (G.deleteEdges {s(a,b)}) M := by
  refine ⟨matching_deleteEdge hM.1 he,?_⟩
  intro N hN
  exact hM.2 N (matching_mono (SimpleGraph.deleteEdges_le _) hN)

/-- Any maximum matching after a cardinality-preserving edge cut is maximum
in the original graph as well. -/
theorem maximumMatching_lift_deleteEdge {G : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : MaximumMatching G M) {a b : V} (he : ({a,b} : Finset V) ∉ M)
    (hN : MaximumMatching (G.deleteEdges {s(a,b)}) N) : MaximumMatching G N := by
  have hc := maximum_matching_card_eq (maximumMatching_deleteEdge hM he) hN
  refine ⟨matching_mono (SimpleGraph.deleteEdges_le _) hN.1,?_⟩
  intro P hP
  rw [← hc]
  exact hM.2 P hP

/-- Active deficiency at least two supplies an unmatched vertex outside the
endpoints of an actual edge: those two endpoints cannot both be unmatched. -/
theorem forest_unmatched_active_outside_edge {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {S : Finset V}
    (hdef : 2*M.card+2 ≤ S.card) {a b : V} (hab : G.Adj a b) :
    ∃ u∈S, u ∉ matchingVertices M ∧ u ∉ ({a,b} : Finset V) := by
  classical
  have hc := card_le_card_sdiff_add_card (s := S) (t := matchingVertices M)
  rw [matchingVertices_card hM.1] at hc
  have htwo : 2 ≤ (S \ matchingVertices M).card := by omega
  by_contra hn
  push Not at hn
  have hsub : S \ matchingVertices M ⊆ ({a,b} : Finset V) := by
    intro u hu
    obtain ⟨huS,huM⟩ := mem_sdiff.mp hu
    exact hn u huS huM
  have heq : S \ matchingVertices M = ({a,b} : Finset V) :=
    eq_of_subset_of_card_le hsub (by simpa [hab.ne] using htwo)
  have ha : a ∉ matchingVertices M := (mem_sdiff.mp (heq.symm ▸ (show a∈({a,b}:Finset V) by simp))).2
  have hb : b ∉ matchingVertices M := (mem_sdiff.mp (heq.symm ▸ (show b∈({a,b}:Finset V) by simp))).2
  exact forest_exposable_independent hG ⟨M,hM,ha⟩ ⟨M,hM,hb⟩ hab

/-- A leaf of the edge-cut forest away from both cut endpoints is original. -/
theorem cut_edge_leaf_lift {G : SimpleGraph V} {a b x z : V}
    (hxz : (G.deleteEdges {s(a,b)}).Adj x z)
    (hleaf : ∀ t, (G.deleteEdges {s(a,b)}).Adj x t → t=z)
    (hx : x ∉ ({a,b} : Finset V)) : G.Adj x z ∧ ∀ t, G.Adj x t → t=z := by
  refine ⟨(SimpleGraph.deleteEdges_adj.mp hxz).1,?_⟩
  intro t hxt
  exact hleaf t (deleteEdge_adj_of_not_endpoint hxt hx)

/-- Fact B: if an actual forest edge is avoided by a maximum matching and active
deficiency is at least two, a maximum matching can simultaneously avoid the edge
and expose an ORIGINAL leaf outside both its endpoints. -/
theorem forest_avoid_edge_expose_leaf {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {a b : V}
    (hab : G.Adj a b) (he : ({a,b} : Finset V) ∉ M) {S : Finset V}
    (hS : ∀ u∈S, ∃ z, G.Adj u z) (hdef : 2*M.card+2 ≤ S.card) :
    ∃ N x, MaximumMatching G N ∧ ({a,b} : Finset V) ∉ N ∧
      x ∉ matchingVertices N ∧ x ∉ ({a,b} : Finset V) ∧
      (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t=z) := by
  classical
  let H := G.deleteEdges {s(a,b)}
  have hH : H.IsAcyclic := hG.anti (SimpleGraph.deleteEdges_le _)
  have hMH := maximumMatching_deleteEdge hM he
  obtain ⟨u,huS,huM,huPair⟩ := forest_unmatched_active_outside_edge hG hM hdef hab
  obtain ⟨z,huz⟩ := hS u huS
  have huH : Exposable H u := ⟨M,hMH,huM⟩
  obtain ⟨x,y,hxy,hx,hy,hux,huy,hxl,hyl⟩ := forest_exposable_two_leaves hH huH
    ⟨z,deleteEdge_adj_of_not_endpoint huz huPair⟩
  have hchoice : ∃ x, Exposable H x ∧ x ∉ ({a,b} : Finset V) ∧
      (∃ z, H.Adj x z ∧ ∀ t, H.Adj x t → t=z) := by
    by_cases hxPair : x∈({a,b}:Finset V)
    · have hyPair : y ∉ ({a,b}:Finset V) := by
        intro hyPair
        have hr : H.Reachable x y := hux.symm.trans huy
        simp only [mem_insert,mem_singleton] at hxPair hyPair
        rcases hxPair with hxa|hxb <;> rcases hyPair with hya|hyb
        · exact hxy (hxa.trans hya.symm)
        · apply forest_cut_edge_endpoints_separated hG hab
          simpa [hxa,hyb] using hr
        · apply forest_cut_edge_endpoints_separated hG hab
          simpa [hxb,hya] using hr.symm
        · exact hxy (hxb.trans hyb.symm)
      exact ⟨y,hy,hyPair,hyl⟩
    · exact ⟨x,hx,hxPair,hxl⟩
  obtain ⟨x,⟨N,hN,hxN⟩,hxPair,⟨z,hxz,hxleaf⟩⟩ := hchoice
  have heN : ({a,b}:Finset V) ∉ N := by
    intro heN
    have habH := (hN.1.1 _ heN).isClique (by simp) (by simp) hab.ne
    have hnot := (SimpleGraph.deleteEdges_adj.mp habH).2
    exact hnot (by simp)
  exact ⟨N,x,maximumMatching_lift_deleteEdge hM he hN,heN,hxN,hxPair,
    z,cut_edge_leaf_lift hxz hxleaf hxPair⟩

end Tuza24
