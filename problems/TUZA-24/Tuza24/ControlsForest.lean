import Tuza24.ForestCS
import Tuza23.ControlBasic
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Finite
import Mathlib.Combinatorics.SimpleGraph.Star

namespace Tuza24.Controls
open Finset Tuza Tuza06 Tuza23
set_option maxRecDepth 20000
set_option maxHeartbeats 2400000

instance {n : ℕ} (C : Finset (Finset (Fin n))) : DecidableRel (selectedGraph C).Adj :=
  fun a b => decidable_of_iff (a ≠ b ∧ ({a,b} : Finset (Fin n)) ∈ C) selectedGraph_adj.symm

private theorem selected_empty_acyclic {V : Type*} [Fintype V] [DecidableEq V] :
    (selectedGraph (∅ : Finset (Finset V))).IsAcyclic := by
  have h : selectedGraph (∅ : Finset (Finset V)) = ⊥ := by
    ext a b
    simp [selectedGraph_adj]
  rw [h]
  exact SimpleGraph.isAcyclic_bot

theorem cover_of_checks {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} {C : Finset (Finset V)}
    (ha : ∀ e ∈ C, G.IsNClique 2 e)
    (hc : ∀ t, G.IsNClique 3 t → ∃ e ∈ C, e ∈ edges t) : GraphCover G C :=
  ⟨fun e he => mem_graphEdges.mpr (ha e he),fun t ht => hc t (mem_triangles.mp ht)⟩

theorem empty_vertex_forest_cover : ForestCover (⊥ : SimpleGraph (Fin 0)) ∅ := by
  refine ⟨cover_of_checks (by simp) ?_,selected_empty_acyclic⟩
  decide

def cycleFour : SimpleGraph (Fin 4) := Tuza23.Controls.edgeGraph {{0,1},{1,2},{2,3},{0,3}}
instance : DecidableRel cycleFour.Adj := inferInstanceAs (DecidableRel (Tuza23.Controls.edgeGraph _).Adj)

/-- A triangle-free graph can have a cycle and use the empty selected cover. -/
theorem four_cycle_empty_forest_cover : ForestCover cycleFour ∅ := by
  refine ⟨cover_of_checks (by simp) ?_,selected_empty_acyclic⟩
  unfold cycleFour
  decide

def oppositeCover : Finset (Finset (Fin 4)) := {{0,1},{2,3}}

theorem k4_opposite_forest_cover : ForestCover (⊤ : SimpleGraph (Fin 4)) oppositeCover := by
  constructor
  · apply cover_of_checks <;> unfold oppositeCover <;> decide
  · apply SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mpr
    have h : ∀ a b : Fin 4, (selectedGraph oppositeCover).Adj a b →
        ¬ ((selectedGraph oppositeCover).deleteEdges {s(a,b)}).Reachable a b := by
      unfold oppositeCover
      decide
    exact fun _ _ hab => h _ _ hab

/-- The ambient K4 is cyclic although its opposite-edge cover is acyclic. -/
theorem k4_ambient_cyclic : ¬ (⊤ : SimpleGraph (Fin 4)).IsAcyclic := by
  intro h
  have hb := forest_clique_card_le_two h (S := (univ : Finset (Fin 4)))
    (by intro a ha b hb hab; exact hab)
  have hc : (univ : Finset (Fin 4)).card = 4 := by decide
  omega

def nonminimumK3Cover : Finset (Finset (Fin 3)) := {{0,1},{1,2}}

theorem k3_nonminimum_forest_cover : ForestCover (⊤ : SimpleGraph (Fin 3)) nonminimumK3Cover := by
  constructor
  · apply cover_of_checks <;> unfold nonminimumK3Cover <;> decide
  · apply (SimpleGraph.isAcyclic_starGraph (1 : Fin 3)).anti
    have h : selectedGraph nonminimumK3Cover ≤ SimpleGraph.starGraph (1 : Fin 3) := by
      intro a b hab
      have hc : ∀ a b : Fin 3, (selectedGraph nonminimumK3Cover).Adj a b →
          (SimpleGraph.starGraph (1 : Fin 3)).Adj a b := by
        unfold nonminimumK3Cover
        decide
      exact hc a b hab
    exact h

theorem k3_cover_is_nonminimum : nonminimumK3Cover.card = 2 ∧
    GraphCover (⊤ : SimpleGraph (Fin 3)) {{0,1}} ∧
    ({{0,1}} : Finset (Finset (Fin 3))).card = 1 := by
  refine ⟨by decide,?_,by decide⟩
  apply cover_of_checks <;> decide

theorem shared_vertex_packing_control : Packing (triangles Tuza23.Controls.sharedVertexGraph)
    Tuza23.Controls.sharedVertexFamily := Tuza23.Controls.shared_vertex_packing

theorem shared_edge_packing_rejected :
    ¬ Packing (triangles (⊤ : SimpleGraph (Fin 4))) {{0,1,2},{0,1,3}} :=
  Tuza23.Controls.shared_edge_packing_rejected

/-- A triangle-free graph still rejects a proposed cover containing a nonedge. -/
theorem nonactual_cover_rejected : ¬ GraphCover (⊥ : SimpleGraph (Fin 3)) {{0,1}} := by
  intro h
  have he := mem_graphEdges.mp (h.1 (mem_singleton_self _))
  have hn : ¬ (⊥ : SimpleGraph (Fin 3)).IsNClique 2 ({0,1} : Finset (Fin 3)) := by decide
  exact hn he

theorem k4_empty_actual_cover_rejected : ¬ GraphCover (⊤ : SimpleGraph (Fin 4)) ∅ :=
  fun h => Tuza23.Controls.empty_cover_rejected h.2

/-- The anchor theorem is instantiated with the supplied nonminimum cover;
its packing and output cover remain existential. -/
theorem nonminimum_cover_anchor_control : ∃ I D,
    AnchoredPackingCover (⊤ : SimpleGraph (Fin 3)) nonminimumK3Cover I D :=
  forest_cover_anchor k3_nonminimum_forest_cover

end Tuza24.Controls
