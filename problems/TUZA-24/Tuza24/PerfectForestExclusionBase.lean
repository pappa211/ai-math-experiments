import Tuza24.PerfectForestStructure
import Tuza24.PointedAssembly
import Tuza24.InternalPageAugmentation
import Tuza24.ExternalPageAugmentation

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Convert actual full-link matching and residual vertex cover data to the
checked hub reduction interface. -/
theorem full_link_matching_of_residual {G : SimpleGraph V} {v : V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : EdgeMatching (linkGraph G v) M)
    (hQ : ResidualVertexCover (linkGraph G v) M Q) : LinkMatching G v M Q := by
  refine ⟨fun e he => (hM.1 e he).mono (linkGraph_le G v),
    fun e he => linkGraph_edge_neighbors (hM.1 e he),hM.2,?_⟩
  intro e he heG
  by_cases heM : e ∈ M
  · exact Or.inl heM
  · exact Or.inr (hQ e (linkGraph_edge_iff.mpr ⟨heG,(mem_edges.mp he).1⟩) heM)

/-- A strict residual vertex-cover saving is incompatible with minimal CS failure. -/
theorem minimal_link_strict_cover_false {G : SimpleGraph V} (hG : MinimalCS G) {v : V}
    {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G v M Q)
    (hQ : Q.card < M.card) : False := by
  have hMn : M.Nonempty := card_pos.mp (by omega)
  have hGm := (minimalCS_iff_minimalObstruction G).mp hG
  have hbal := minimal_link_matching hGm hm hMn (Nat.le_of_lt hQ)
  have hcover := reduction_witness_cover (matching_reduction_witness hm)
  have hcost := matching_cover_card v M Q
  have hfailure := failure_lower_bound hGm.1
  omega

/-- Adding the isolated apex to a residual forest cover covers every restored edge. -/
theorem isolate_residual_insert_vertex {L : SimpleGraph V} {w : V}
    {M : Finset (Finset V)} {Q : Finset V}
    (hQ : ResidualVertexCover (isolate L {w}) M Q) :
    ResidualVertexCover L M (insert w Q) := by
  classical
  intro e he heM
  by_cases hw : w ∈ e
  · exact fun hd => disjoint_left.mp hd hw (mem_insert_self _ _)
  · exact fun hd => hQ e (isolate_singleton_edge he hw) heM
      (hd.mono_right (subset_insert _ _))

/-- An apex spoke to an unmatched forest vertex increases matching cardinality by one. -/
theorem isolate_insert_spoke_matching {L : SimpleGraph V} {w t : V}
    {N : Finset (Finset V)} (hN : EdgeMatching (isolate L {w}) N)
    (ht : t ∉ matchingVertices N) (hwt : L.Adj w t) :
    EdgeMatching L (insert ({w,t} : Finset V) N) ∧
      (insert ({w,t} : Finset V) N).card = N.card + 1 := by
  classical
  have hw : w ∉ matchingVertices N := isolate_matching_vertices_avoids hN (by simp)
  have hd : ∀ e ∈ N, Disjoint ({w,t} : Finset V) e := by
    intro e he
    apply disjoint_left.mpr
    intro x hx hxe
    have hxN : x ∈ matchingVertices N := mem_biUnion.mpr ⟨e,he,hxe⟩
    rcases mem_insert.mp hx with h|h
    · exact hw (h ▸ hxN)
    · exact ht ((mem_singleton.mp h) ▸ hxN)
  have hnew : ({w,t} : Finset V) ∉ N := by
    intro he
    exact hw (mem_biUnion.mpr ⟨{w,t},he,by simp⟩)
  have hwe : L.IsNClique 2 ({w,t} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hwt.ne] using hwt,by simp [hwt.ne]⟩
  refine ⟨?_,card_insert_of_notMem hnew⟩
  constructor
  · intro e he
    rcases mem_insert.mp he with rfl|he
    · exact hwe
    · exact (hN.1 e he).mono (isolate_le L {w})
  · intro e he f hf hef
    rcases mem_insert.mp he with rfl|he <;> rcases mem_insert.mp hf with rfl|hf
    · exact (hef rfl).elim
    · exact hd f hf
    · exact (hd e he).symm
    · exact hN.2 e he f hf hef

/-- A matching missing the apex and a specified base avoids all three edges
of the corresponding apex triangle. -/
theorem matching_disjoint_apex_triangle {M : Finset (Finset V)} {w a b : V}
    (hw : w ∉ matchingVertices M) (hf : ({a,b} : Finset V) ∉ M) :
    Disjoint M (edges ({a,b,w} : Finset V)) := by
  classical
  apply disjoint_left.mpr
  intro e he het
  have hc := edges_triple a b w het
  simp only [mem_insert,mem_singleton] at hc
  rcases hc with rfl|rfl|rfl
  · exact hf he
  · exact hw (mem_biUnion.mpr ⟨{a,w},he,by simp⟩)
  · exact hw (mem_biUnion.mpr ⟨{b,w},he,by simp⟩)

/-- The additional spoke is disjoint from an apex triangle when its leaf lies
outside that triangle's base. -/
theorem insert_spoke_disjoint_apex_triangle {M : Finset (Finset V)} {w t a b : V}
    (hw : w ∉ matchingVertices M) (hf : ({a,b} : Finset V) ∉ M)
    (ht : t ∉ ({a,b} : Finset V)) (hwt : w ≠ t) :
    Disjoint (insert ({w,t} : Finset V) M) (edges ({a,b,w} : Finset V)) := by
  classical
  have hbase := matching_disjoint_apex_triangle hw hf
  have htpage : t ∉ ({a,b,w} : Finset V) := by
    simp only [mem_insert,mem_singleton,not_or] at ht ⊢
    exact ⟨ht.1,ht.2,hwt.symm⟩
  apply disjoint_left.mpr
  intro e he het
  rcases mem_insert.mp he with rfl|he
  · exact htpage ((mem_edges.mp het).1 (by simp))
  · exact disjoint_left.mp hbase he het

/-- Adding a spoke cannot introduce a base edge that avoids the apex. -/
theorem insert_spoke_avoids_base {M : Finset (Finset V)} {f : Finset V} {w t : V}
    (hwf : w ∉ f) (hf : f ∉ M) : f ∉ insert ({w,t} : Finset V) M := by
  intro h
  rcases mem_insert.mp h with h|h
  · exact hwf (h.symm ▸ (by simp : w ∈ ({w,t} : Finset V)))
  · exact hf h

end Tuza24
