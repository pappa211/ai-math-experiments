import Tuza24.ForestAPI
import Tuza24.ForestMatching
import Tuza23.PageAssembly
import Tuza06.MatchingReduction
import Tuza06.SmallLinks

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Full link on the original vertex type; vertices outside the neighborhood are isolated. -/
def linkGraph (G : SimpleGraph V) (v : V) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ G.Adj v a ∧ G.Adj v b
  symm := ⟨fun _ _ h => ⟨h.1.symm,h.2.2,h.2.1⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

def SelectedLeaf (C : Finset (Finset V)) (v w : V) : Prop :=
  (selectedGraph C).Adj v w ∧ ∀ x, (selectedGraph C).Adj v x → x=w

theorem forestCover_leaf {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : ForestCover G C) (hne : C.Nonempty) : ∃ v w, SelectedLeaf C v w := by
  obtain ⟨e,he⟩ := hne
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (mem_graphEdges.mp (hC.1.1 he)).card_eq
  exact forest_leaf hC.2 ⟨a,b,selectedGraph_adj.mpr ⟨hab,he⟩⟩

theorem linkGraph_le (G : SimpleGraph V) (v : V) : linkGraph G v ≤ G := fun _ _ h => h.1

theorem linkGraph_edge_neighbors {G : SimpleGraph V} {v : V} {e : Finset V}
    (he : (linkGraph G v).IsNClique 2 e) : e ⊆ peelNeighbors G univ v := by
  classical
  intro a ha
  obtain ⟨b,hb,hba⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1<e.card) a
  exact mem_filter.mpr ⟨mem_univ _,(he.isClique ha hb hba.symm).2.1⟩

theorem linkGraph_edge_iff {G : SimpleGraph V} {v : V} {e : Finset V} :
    (linkGraph G v).IsNClique 2 e ↔ G.IsNClique 2 e ∧ e ⊆ peelNeighbors G univ v := by
  classical
  constructor
  · intro he
    exact ⟨he.mono (linkGraph_le G v),linkGraph_edge_neighbors he⟩
  · rintro ⟨he,hn⟩
    refine ⟨?_,he.card_eq⟩
    intro a ha b hb hab
    exact ⟨he.isClique ha hb hab,(mem_filter.mp (hn ha)).2,(mem_filter.mp (hn hb)).2⟩

/-- Covering the hub triangle forces its rim edge into C away from the selected neighbor. -/
theorem selectedLeaf_link_edge {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : GraphCover G C) {v w a b : V} (hleaf : SelectedLeaf C v w)
    (hab : (linkGraph G v).Adj a b) (haw : a≠w) (hbw : b≠w) : ({a,b}:Finset V)∈C := by
  have ht : ({v,a,b}:Finset V) ∈ triangles G := triangle_of_adj hab.2.1 hab.2.2 hab.1
  obtain ⟨e,he,het⟩ := hC.2 _ ht
  have hcases := edges_triple v a b het
  simp only [mem_insert,mem_singleton] at hcases
  rcases hcases with rfl|rfl|rfl
  · exact (haw (hleaf.2 a (selectedGraph_adj.mpr ⟨hab.2.1.ne,he⟩))).elim
  · exact (hbw (hleaf.2 b (selectedGraph_adj.mpr ⟨hab.2.2.ne,he⟩))).elim
  · exact he

theorem selectedLeaf_link_isolate_le {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : GraphCover G C) {v w : V} (hleaf : SelectedLeaf C v w) :
    isolate (linkGraph G v) {w} ≤ selectedGraph C := by
  intro a b hab
  exact selectedGraph_adj.mpr ⟨hab.1.1.ne, selectedLeaf_link_edge hC hleaf hab.1
    (fun h => hab.2.1 (mem_singleton.mpr h)) (fun h => hab.2.2 (mem_singleton.mpr h))⟩

theorem selectedLeaf_link_forest {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : ForestCover G C) {v w : V} (hleaf : SelectedLeaf C v w) :
    (isolate (linkGraph G v) {w}).IsAcyclic :=
  hC.2.anti (selectedLeaf_link_isolate_le hC.1 hleaf)

theorem pointed_to_linkMatching {G : SimpleGraph V} {v w : V}
    {M : Finset (Finset V)} {Q : Finset V} (hp : PointedWitness (linkGraph G v) w M Q) :
    LinkMatching G v M Q := by
  refine ⟨fun e he => (hp.1.1 e he).mono (linkGraph_le G v),
    fun e he => linkGraph_edge_neighbors (hp.1.1 e he),hp.1.2,?_⟩
  intro e he heG
  by_cases heM : e∈M
  · exact Or.inl heM
  · exact Or.inr (hp.2.1 e (linkGraph_edge_iff.mpr ⟨heG,(mem_edges.mp he).1⟩) heM)

theorem full_link_closed (G : SimpleGraph V) (v : V) : LinkClosed G v (peelNeighbors G univ v) := by
  classical
  exact ⟨fun _ h => (mem_filter.mp h).2,fun _ _ b hb _ => mem_filter.mpr ⟨mem_univ b,hb⟩⟩

theorem minimal_full_link_two_neighbors {G : SimpleGraph V} (hG : MinimalCS G)
    {v a : V} (ha : G.Adj v a) : ∃ b c, b≠c ∧ (linkGraph G v).Adj a b ∧ (linkGraph G v).Adj a c := by
  classical
  obtain ⟨b,hb,c,hc,hbc,hab,hac⟩ := minimal_link_two_neighbors
    ((minimalCS_iff_minimalObstruction G).mp hG) (full_link_closed G v) (mem_filter.mpr ⟨mem_univ a,ha⟩)
  exact ⟨b,c,hbc,⟨hab,ha,(mem_filter.mp hb).2⟩,⟨hac,ha,(mem_filter.mp hc).2⟩⟩

theorem minimal_full_link_size {G : SimpleGraph V} (hG : MinimalCS G)
    {v w : V} (hvw : G.Adj v w) : 5 ≤ (peelNeighbors G univ v).card := by
  classical
  exact minimal_closed_link_size ((minimalCS_iff_minimalObstruction G).mp hG)
    (full_link_closed G v) ⟨w,mem_filter.mpr ⟨mem_univ w,hvw⟩⟩

end Tuza24
