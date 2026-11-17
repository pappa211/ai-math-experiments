import Tuza24.ForestMatchingUnique

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Isolating either endpoint deletes the corresponding unordered edge. -/
theorem isolate_le_deleteEdge {G : SimpleGraph V} {U : Finset V} {a b : V}
    (ha : a ∈ U) : isolate G U ≤ G.deleteEdges {s(a,b)} := by
  intro x y hxy
  apply SimpleGraph.deleteEdges_adj.mpr
  refine ⟨hxy.1,?_⟩
  simp only [Set.mem_singleton_iff]
  intro hpair
  have hamem : a ∈ s(x,y) := hpair.symm ▸ Sym2.mem_mk_left a b
  rcases Sym2.mem_iff.mp hamem with rfl|rfl
  · exact hxy.2.1 ha
  · exact hxy.2.2 ha

/-- Two different neighbors of a forest vertex lie in different components
when that vertex is isolated. -/
theorem forest_neighbors_separated {G : SimpleGraph V} (hG : G.IsAcyclic)
    {a x y : V} (hax : G.Adj a x) (hay : G.Adj a y) (hxy : x ≠ y) :
    ¬ (isolate G {a}).Reachable x y := by
  intro hr
  have hb := SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hG hax
  apply SimpleGraph.isBridge_iff.mp hb
  have hay' : (G.deleteEdges {s(a,x)}).Adj a y := by
    apply SimpleGraph.deleteEdges_adj.mpr
    refine ⟨hay,?_⟩
    simp [Sym2.eq_iff,hxy.symm,hax.ne]
  exact hay'.reachable.trans (hr.mono (isolate_le_deleteEdge (by simp))).symm

/-- A component left after deleting the endpoints of a forest edge cannot
attach to both deleted endpoints. -/
theorem forest_adjacent_pair_no_cross_attachment {G : SimpleGraph V}
    (hG : G.IsAcyclic) {a b x y : V} (hab : G.Adj a b)
    (hx : x ∉ ({a,b} : Finset V)) (hy : y ∉ ({a,b} : Finset V))
    (hax : G.Adj a x) (hby : G.Adj b y)
    (hr : (isolate G {a,b}).Reachable x y) : False := by
  have hb := SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hG hab
  apply SimpleGraph.isBridge_iff.mp hb
  have hax' : (G.deleteEdges {s(a,b)}).Adj a x := by
    apply SimpleGraph.deleteEdges_adj.mpr
    refine ⟨hax,?_⟩
    have hxb : x ≠ b := fun h => hx (by simp [h])
    simp [Sym2.eq_iff,hxb,hab.ne]
  have hby' : (G.deleteEdges {s(a,b)}).Adj b y := by
    apply SimpleGraph.deleteEdges_adj.mpr
    refine ⟨hby,?_⟩
    have hya : y ≠ a := fun h => hy (by simp [h])
    simp [Sym2.eq_iff,hya,hab.ne.symm]
  exact (hax'.reachable.trans (hr.mono (isolate_le_deleteEdge (by simp)))).trans
    hby'.reachable.symm

/-- At most one vertex of a remaining component can have lost neighbors when
an adjacent pair is deleted. This is the original-leaf preservation fact used
when retaining a prescribed allowed matching edge. -/
theorem forest_adjacent_pair_boundary_unique {G : SimpleGraph V}
    (hG : G.IsAcyclic) {a b x y : V} (hab : G.Adj a b)
    (hx : x ∉ ({a,b} : Finset V)) (hy : y ∉ ({a,b} : Finset V))
    (hreach : (isolate G {a,b}).Reachable x y)
    (hxB : G.Adj a x ∨ G.Adj b x) (hyB : G.Adj a y ∨ G.Adj b y) : x=y := by
  by_contra hxy
  have hmonoA : isolate G {a,b} ≤ isolate G {a} := by
    intro p q hpq
    refine ⟨hpq.1,?_,?_⟩ <;> simp only [mem_singleton]
    · intro h; exact hpq.2.1 (by simp [h])
    · intro h; exact hpq.2.2 (by simp [h])
  have hmonoB : isolate G {a,b} ≤ isolate G {b} := by
    intro p q hpq
    refine ⟨hpq.1,?_,?_⟩ <;> simp only [mem_singleton]
    · intro h; exact hpq.2.1 (by simp [h])
    · intro h; exact hpq.2.2 (by simp [h])
  rcases hxB with hax|hbx <;> rcases hyB with hay|hby
  · exact forest_neighbors_separated hG hax hay hxy (hreach.mono hmonoA)
  · exact forest_adjacent_pair_no_cross_attachment hG hab hx hy hax hby hreach
  · exact forest_adjacent_pair_no_cross_attachment hG hab hy hx hay hbx hreach.symm
  · exact forest_neighbors_separated hG hbx hby hxy (hreach.mono hmonoB)

/-- Cutting an edge separates its endpoints in a forest; consequently each
remaining component contains at most one of the two potentially new leaves. -/
theorem forest_cut_edge_endpoints_separated {G : SimpleGraph V} (hG : G.IsAcyclic)
    {a b : V} (hab : G.Adj a b) : ¬ (G.deleteEdges {s(a,b)}).Reachable a b :=
  SimpleGraph.isBridge_iff.mp (SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hG hab)

end Tuza24
