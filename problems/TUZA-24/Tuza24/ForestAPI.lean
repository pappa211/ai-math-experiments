import Tuza23.M0
import Mathlib.Combinatorics.SimpleGraph.Acyclic

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

def selectedGraph (C : Finset (Finset V)) : SimpleGraph V := addEdges ⊥ C

@[simp] theorem selectedGraph_adj {C : Finset (Finset V)} {a b : V} :
    (selectedGraph C).Adj a b ↔ a≠b ∧ ({a,b} : Finset V)∈C := by
  simp [selectedGraph,addEdges]

def ForestCover (G : SimpleGraph V) (C : Finset (Finset V)) : Prop :=
  GraphCover G C ∧ (selectedGraph C).IsAcyclic

def HasForestCover (G : SimpleGraph V) : Prop := ∃ C, ForestCover G C

def AnchoredPackingCover (G : SimpleGraph V) (C I D : Finset (Finset V)) : Prop :=
  Packing (triangles G) I ∧ GraphCover G D ∧ C ∩ support I ⊆ D ∧ D.card ≤ 2*I.card

theorem selectedGraph_mono {C D : Finset (Finset V)} (h : C ⊆ D) :
    selectedGraph C ≤ selectedGraph D := by
  intro a b hab
  exact selectedGraph_adj.mpr ⟨(selectedGraph_adj.mp hab).1,h (selectedGraph_adj.mp hab).2⟩

theorem selectedGraph_le_of_actual {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : C ⊆ graphEdges G) : selectedGraph C ≤ G := by
  intro a b hab
  obtain ⟨hne,hpair⟩ := selectedGraph_adj.mp hab
  exact (mem_graphEdges.mp (hC hpair)).isClique (by simp) (by simp) hne

theorem selectedGraph_edges_eq {C : Finset (Finset V)}
    (hC : ∀ e∈C,e.card=2) : graphEdges (selectedGraph C) = C := by
  classical
  ext e
  rw [mem_graphEdges]
  constructor
  · intro he
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he.card_eq
    exact (selectedGraph_adj.mp (he.isClique (by simp) (by simp) hab)).2
  · intro he
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (hC e he)
    refine ⟨?_,by simp [hab]⟩
    intro x hx y hy hxy
    simp only [mem_coe,mem_insert,mem_singleton] at hx hy
    rcases hx with rfl|rfl <;> rcases hy with rfl|rfl
    · exact (hxy rfl).elim
    · exact selectedGraph_adj.mpr ⟨hab,he⟩
    · exact selectedGraph_adj.mpr ⟨hab.symm,by simpa [pair_comm] using he⟩
    · exact (hxy rfl).elim

theorem triangle_edge_actual {G : SimpleGraph V} {t e : Finset V}
    (ht : t∈triangles G) (he : e∈edges t) : e∈graphEdges G :=
  mem_graphEdges.mpr (supported_edge_is_graph_edge (mem_biUnion.mpr ⟨t,ht,he⟩))

theorem graphCover_restrict {G H : SimpleGraph V} (hHG : H≤G)
    {C : Finset (Finset V)} (hC : GraphCover G C) : GraphCover H (C∩graphEdges H) := by
  refine ⟨inter_subset_right,?_⟩
  intro t ht
  obtain ⟨e,he,het⟩ := hC.2 t (triangles_mono_graph hHG ht)
  exact ⟨e,mem_inter.mpr ⟨he,triangle_edge_actual ht het⟩,het⟩

theorem forestCover_restrict {G H : SimpleGraph V} (hHG : H≤G)
    {C : Finset (Finset V)} (hC : ForestCover G C) : ForestCover H (C∩graphEdges H) :=
  ⟨graphCover_restrict hHG hC.1, hC.2.anti (selectedGraph_mono inter_subset_left)⟩

theorem hasForestCover_mono {G H : SimpleGraph V} (hHG : H≤G)
    (hG : HasForestCover G) : HasForestCover H := by
  obtain ⟨C,hC⟩ := hG
  exact ⟨C∩graphEdges H,forestCover_restrict hHG hC⟩

theorem exists_minimal_forest_failure {G : SimpleGraph V}
    (hG : HasForestCover G) (hbad : ¬ CS G) :
    ∃ H : SimpleGraph V, H≤G ∧ HasForestCover H ∧ MinimalCS H :=
  exists_minimal_cs_in_class HasForestCover (fun _ _ h hF => hasForestCover_mono h hF) hG hbad

theorem actualize_cover {G : SimpleGraph V} {D : Finset (Finset V)}
    (hD : Covers (triangles G) D) : GraphCover G (D∩graphEdges G) := by
  refine ⟨inter_subset_right,?_⟩
  intro t ht
  obtain ⟨e,he,het⟩ := hD t ht
  exact ⟨e,mem_inter.mpr ⟨he,triangle_edge_actual ht het⟩,het⟩

/-- Redundant nonedges in an internal cover construction may be removed without
losing an anchor made of actual supplied-cover edges. -/
theorem anchored_actualize {G : SimpleGraph V} {C I D : Finset (Finset V)}
    (hC : C⊆graphEdges G) (hI : Packing (triangles G) I)
    (hD : Covers (triangles G) D) (hanchor : C∩support I⊆D) (hcard : D.card≤2*I.card) :
    AnchoredPackingCover G C I (D∩graphEdges G) := by
  refine ⟨hI,actualize_cover hD,?_,(card_le_card inter_subset_left).trans hcard⟩
  intro e he
  exact mem_inter.mpr ⟨hanchor he,hC (mem_inter.mp he).1⟩

theorem anchored_implies_inequality {G : SimpleGraph V} {C I D : Finset (Finset V)}
    (h : AnchoredPackingCover G C I D) : tau (triangles G) ≤ 2*nu (triangles G) := by
  have ht := tau_le_card h.2.1.2
  have hn := packing_card_le h.1
  have hc := h.2.2.2
  omega

theorem empty_cover_triangles {G : SimpleGraph V} (h : GraphCover G ∅) : triangles G=∅ := by
  apply eq_empty_iff_forall_notMem.mpr
  intro t ht
  obtain ⟨e,he,_⟩ := h.2 t ht
  simp at he

theorem empty_cover_anchor {G : SimpleGraph V} (h : GraphCover G ∅) :
    AnchoredPackingCover G ∅ ∅ ∅ := by
  refine ⟨packing_empty _,h,?_,by simp⟩
  simp

end Tuza24
