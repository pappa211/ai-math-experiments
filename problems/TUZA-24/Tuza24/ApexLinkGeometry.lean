import Tuza24.LinkAPI

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem triangle_of_neighbor_triangle {G : SimpleGraph V} {v : V} {t : Finset V}
    (ht : t∈triangles G) (hN : t⊆peelNeighbors G univ v) : t∈triangles (linkGraph G v) := by
  classical
  refine mem_triangles.mpr ⟨?_,(mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  exact ⟨(mem_triangles.mp ht).isClique ha hb hab,(mem_filter.mp (hN ha)).2,(mem_filter.mp (hN hb)).2⟩

/-- Every active forest vertex in a minimal full link has a forest neighbor. -/
theorem minimal_forest_link_active {G : SimpleGraph V} (hG : MinimalCS G) {v w a : V}
    (ha : a∈(peelNeighbors G univ v).erase w) : ∃ b,(isolate (linkGraph G v) {w}).Adj a b := by
  classical
  have haw := (mem_erase.mp ha).1
  have hva := (mem_filter.mp (mem_of_mem_erase ha)).2
  obtain ⟨b,c,hbc,hab,hac⟩ := minimal_full_link_two_neighbors hG hva
  by_cases hbw : b=w
  · refine ⟨c,hac,by simpa using haw,?_⟩
    have hcw : c≠w := fun h => hbc (hbw.trans h.symm)
    simpa using hcw
  · exact ⟨b,hab,by simpa using haw,by simpa using hbw⟩

/-- The actual forest support is the full neighborhood minus the apex. -/
theorem forest_link_edge_active {G : SimpleGraph V} {v w : V} {e : Finset V}
    (he : (isolate (linkGraph G v) {w}).IsNClique 2 e) :
    e⊆(peelNeighbors G univ v).erase w := by
  intro x hx
  refine mem_erase.mpr ⟨?_,linkGraph_edge_neighbors (he.mono (isolate_le _ _)) hx⟩
  intro h
  exact disjoint_left.mp (isolate_edge_avoids he) hx (by simp [h])

/-- Every original forest leaf in a minimal full link is adjacent to its apex. -/
theorem minimal_forest_leaf_apex {G : SimpleGraph V} (hG : MinimalCS G) {v w x y : V}
    (hxy : (isolate (linkGraph G v) {w}).Adj x y)
    (hleaf : ∀ z,(isolate (linkGraph G v) {w}).Adj x z → z=y) : (linkGraph G v).Adj w x := by
  classical
  obtain ⟨b,c,hbc,hxb,hxc⟩ := minimal_full_link_two_neighbors hG hxy.1.2.1
  have hchoice : ∃ z,(linkGraph G v).Adj x z ∧ z≠y := by
    by_cases hby : b=y
    · exact ⟨c,hxc,fun h => hbc (hby.trans h.symm)⟩
    · exact ⟨b,hxb,hby⟩
  obtain ⟨z,hxz,hzy⟩ := hchoice
  have hzw : z=w := by
    by_contra hn
    exact hzy (hleaf z ⟨hxz,hxy.2.1,by simpa using hn⟩)
  exact hzw ▸ hxz.symm

/-- Codegree gives a page other than the hub page; a triangle-free link endpoint
forces its other apex outside the entire full neighborhood. -/
theorem minimal_external_page {G : SimpleGraph V} (hG : MinimalCS G) {v a b : V}
    (hab : (linkGraph G v).Adj a b)
    (hnoa : ∀ t∈triangles (linkGraph G v),a∉t) :
    ∃ z, ({a,b,z}:Finset V)∈triangles G ∧ v∉({a,b,z}:Finset V) ∧ z∉peelNeighbors G univ v := by
  classical
  have he : G.IsNClique 2 ({a,b}:Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hab.1.ne] using hab.1,by simp [hab.1.ne]⟩
  obtain ⟨T,hT,S,hS,hET,hES,hTS⟩ := minimal_edge_two_triangles
    ((minimalCS_iff_minimalObstruction G).mp hG) he
  have hex : ∃ t,t∈triangles G ∧ ({a,b}:Finset V)∈edges t ∧ t≠({v,a,b}:Finset V) := by
    by_cases hTv : T=({v,a,b}:Finset V)
    · exact ⟨S,hS,hES,fun h => hTS (hTv.trans h.symm)⟩
    · exact ⟨T,hT,hET,hTv⟩
  obtain ⟨t,ht,het,hnot⟩ := hex
  obtain ⟨z,hza,hzb,heq⟩ := triple_eq_pair_insert (mem_triangles.mp ht).card_eq hab.1.ne
    ((mem_edges.mp het).1 (by simp)) ((mem_edges.mp het).1 (by simp))
  subst t
  have hzv : z≠v := by
    intro h
    apply hnot
    ext x
    simp [h,or_left_comm,or_comm,or_assoc]
  have hv : v∉({a,b,z}:Finset V) := by simp [hab.2.1.ne,hab.2.2.ne,hzv.symm]
  refine ⟨z,ht,hv,?_⟩
  intro hzN
  have hN : ({a,b,z}:Finset V)⊆peelNeighbors G univ v := by
    simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨mem_filter.mpr ⟨mem_univ _,hab.2.1⟩,mem_filter.mpr ⟨mem_univ _,hab.2.2⟩,hzN⟩
  exact hnoa _ (triangle_of_neighbor_triangle ht hN) (by simp)

/-- For an external page, avoiding its base is enough for any full-link matching. -/
theorem external_page_matching_disjoint {G : SimpleGraph V} {v a b z : V}
    {Z : Finset (Finset V)} (hZ : EdgeMatching (linkGraph G v) Z)
    (hz : z∉peelNeighbors G univ v) (hbase : ({a,b}:Finset V)∉Z) :
    Disjoint Z (edges ({a,b,z}:Finset V)) := by
  apply disjoint_left.mpr
  intro e he het
  have hcases := edges_triple a b z het
  simp only [mem_insert,mem_singleton] at hcases
  rcases hcases with rfl|rfl|rfl
  · exact hbase he
  · exact hz (linkGraph_edge_neighbors (hZ.1 _ he) (by simp))
  · exact hz (linkGraph_edge_neighbors (hZ.1 _ he) (by simp))

end Tuza24
