import Tuza23.ControlBasic
import Tuza23.R2

namespace Tuza23.Controls
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
variable {V : Type*} [Fintype V] [DecidableEq V]

def cycle4 : SimpleGraph (Fin 4) := edgeGraph {{0,1}, {1,2}, {2,3}, {0,3}}
def diagonals : Finset (Finset (Fin 4)) := {{0,2}, {1,3}}

theorem cycle4_triangle_free : triangles cycle4 = ∅ := by
  ext t
  rw [mem_triangles]
  have h : ∀ t : Finset (Fin 4), ¬ cycle4.IsNClique 3 t := by unfold cycle4; decide
  simp [h]

theorem cycle4_B : B cycle4 := by
  intro t ht
  rw [cycle4_triangle_free] at ht
  simp at ht

theorem disjoint_insertion_is_k4 : addEdges cycle4 diagonals = (⊤ : SimpleGraph (Fin 4)) := by
  ext a b
  have h : ∀ a b : Fin 4, (addEdges cycle4 diagonals).Adj a b ↔ a ≠ b := by
    unfold addEdges cycle4 diagonals edgeGraph
    decide
  exact h a b

theorem disjoint_insertion_R2 : B (addEdges cycle4 diagonals) := by
  apply r2 cycle4 diagonals
  · unfold Nonedges cycle4 diagonals
    decide
  · decide
  · exact cycle4_B
  · rw [disjoint_insertion_is_k4]
    obtain ⟨hn, ht⟩ := k4_actual_parameters
    omega

def oldStar : SimpleGraph (Fin 4) := edgeGraph {{0,3}, {1,3}, {2,3}}
def adjacentInsertions : Finset (Finset (Fin 4)) := {{0,1}, {0,2}}
def adjacentFamily : Finset (Finset (Fin 4)) := {{0,1,3}, {0,2,3}}

theorem old_star_triangle_free : triangles oldStar = ∅ := by
  ext t
  rw [mem_triangles]
  have h : ∀ t : Finset (Fin 4), ¬ oldStar.IsNClique 3 t := by unfold oldStar; decide
  simp [h]

theorem adjacent_actual_triangles : triangles (addEdges oldStar adjacentInsertions) = adjacentFamily := by
  ext t
  rw [mem_triangles]
  have h : ∀ t : Finset (Fin 4), (addEdges oldStar adjacentInsertions).IsNClique 3 t ↔
      t ∈ adjacentFamily := by
    unfold addEdges oldStar adjacentInsertions edgeGraph adjacentFamily
    decide
  exact h t

/-- This actual adjacent insertion is strictly below equality, as the R2 proof requires. -/
theorem adjacent_insertion_strict : tau (triangles (addEdges oldStar adjacentInsertions)) <
    2 * nu (triangles (addEdges oldStar adjacentInsertions)) := by
  rw [adjacent_actual_triangles]
  have hc : Covers adjacentFamily {{0,3}} := by unfold Covers adjacentFamily; decide
  have ht : tau adjacentFamily ≤ 1 := (tau_le_card hc).trans (by decide)
  have hn : 1 ≤ nu adjacentFamily := nu_pos (by decide)
  omega

/-- Exact API guard: no minimality or footprint assumption, and old B is mandatory. -/
theorem exact_r2_type (H : SimpleGraph V) (F : Finset (Finset V)) :
    Nonedges H F → F.card ≤ 2 → B H →
    tau (triangles (addEdges H F)) = 2 * nu (triangles (addEdges H F)) →
    B (addEdges H F) := r2 H F

end Tuza23.Controls
