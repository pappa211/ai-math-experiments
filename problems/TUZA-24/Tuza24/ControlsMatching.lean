import Tuza24.ControlsForest

namespace Tuza24.Controls
open Finset Tuza Tuza06 Tuza23
set_option maxRecDepth 20000
set_option maxHeartbeats 2400000

/-- An isolated apex and empty matching admit the empty pointed witness. -/
theorem pointed_empty_isolated_control :
    PointedWitness (⊥ : SimpleGraph (Fin 1)) 0 ∅ ∅ := by
  refine ⟨by simp [EdgeMatching],?_,by decide,?_⟩
  · unfold ResidualVertexCover
    decide
  · unfold matchingVertices
    decide

/-- Deleting the K3 apex leaves a perfect single-edge matching on its active set. -/
theorem pointed_perfect_control :
    PointedWitness (⊤ : SimpleGraph (Fin 3)) 0 {{1,2}} {0} ∧
    matchingVertices ({{1,2}} : Finset (Finset (Fin 3))) = (univ : Finset (Fin 3)).erase 0 := by
  constructor
  · refine ⟨?_,?_,by decide,?_⟩
    · simp [EdgeMatching] <;> decide
    · unfold ResidualVertexCover
      decide
    · unfold matchingVertices
      decide
  · unfold matchingVertices
    decide

/-- The retained apex is still an ambient vertex, so active perfectness is not
perfectness on all ambient vertices. -/
theorem retained_apex_not_counted_control :
    (0 : Fin 3) ∉ matchingVertices ({{1,2}} : Finset (Finset (Fin 3))) ∧
    matchingVertices ({{1,2}} : Finset (Finset (Fin 3))) ≠ univ := by
  unfold matchingVertices
  decide

/-- In a four-cycle the apex-free path is nonperfect; the pointed witness can
match the apex and includes it in its residual cover. -/
theorem pointed_nonperfect_control :
    PointedWitness cycleFour 0 {{0,1},{2,3}} {0,2} := by
  refine ⟨?_,?_,by decide,?_⟩
  · simp [EdgeMatching] <;> decide
  · unfold ResidualVertexCover cycleFour
    decide
  · unfold matchingVertices
    decide

theorem nonperfect_forest_matching_control :
    MaximumMatching (isolate cycleFour {0}) ({{1,2}} : Finset (Finset (Fin 4))) ∧
    matchingVertices ({{1,2}} : Finset (Finset (Fin 4))) ≠ ({1,2,3} : Finset (Fin 4)) := by
  have hM : EdgeMatching (isolate cycleFour {0}) ({{1,2}} : Finset (Finset (Fin 4))) := by
    unfold cycleFour isolate
    simp [EdgeMatching] <;> decide
  have hQ : VertexCover (isolate cycleFour {0}) ({2} : Finset (Fin 4)) := by
    unfold VertexCover cycleFour isolate
    decide
  refine ⟨⟨hM,?_⟩,?_⟩
  · intro N hN
    have h := matching_card_le_vertexCover hN hQ
    simpa using h
  · unfold matchingVertices
    decide

theorem nonperfect_forest_acyclic_control : (isolate cycleFour {0}).IsAcyclic := by
  apply (SimpleGraph.isAcyclic_starGraph (2 : Fin 4)).anti
  have h : ∀ a b : Fin 4, (isolate cycleFour {0}).Adj a b →
      (SimpleGraph.starGraph (2 : Fin 4)).Adj a b := by
    unfold cycleFour isolate
    decide
  exact fun a b hab => h a b hab

end Tuza24.Controls
