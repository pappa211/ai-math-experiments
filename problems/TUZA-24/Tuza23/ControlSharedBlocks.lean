import Tuza23.ControlBasic

namespace Tuza23.Controls
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
variable {V : Type*} [Fintype V] [DecidableEq V]

def firstBlock : Finset (Fin 7) := {0,1,2,3}
def secondBlock : Finset (Fin 7) := {0,4,5,6}
def sharedBlockGraph : SimpleGraph (Fin 7) := edgeGraph (edges firstBlock ∪ edges secondBlock)

theorem shared_blocks_actual_triangles : triangles sharedBlockGraph =
    cliqueFamily firstBlock ∪ cliqueFamily secondBlock := by
  ext t
  rw [mem_triangles]
  have h : ∀ t : Finset (Fin 7), sharedBlockGraph.IsNClique 3 t ↔
      t ∈ cliqueFamily firstBlock ∪ cliqueFamily secondBlock := by
    unfold sharedBlockGraph firstBlock secondBlock
    decide
  exact h t

theorem shared_blocks_decomposition :
    CliqueDecomposition sharedBlockGraph {firstBlock, secondBlock} := by
  constructor
  · unfold sharedBlockGraph firstBlock secondBlock
    decide
  · unfold firstBlock secondBlock
    decide
  · unfold Independent firstBlock secondBlock
    decide
  · intro t ht
    rw [shared_blocks_actual_triangles] at ht
    rcases mem_union.mp ht with h | h
    · exact ⟨firstBlock, by simp, (mem_powersetCard.mp h).1⟩
    · exact ⟨secondBlock, by simp, (mem_powersetCard.mp h).1⟩

theorem shared_blocks_B : B sharedBlockGraph :=
  decomposition_componentCliques shared_blocks_decomposition

theorem shared_blocks_vertex_overlap : firstBlock ∩ secondBlock = {0} := by decide


end Tuza23.Controls
