import Tuza24.ControlsForest
import Tuza23.ControlSharedBlocks

namespace Tuza24.Controls
open Finset Tuza Tuza06 Tuza23
set_option maxRecDepth 20000
set_option maxHeartbeats 2400000

def sharedBlocksCover : Finset (Finset (Fin 7)) := {{0,1},{2,3},{0,4},{5,6}}

/-- Two literal K4 equality components may share a vertex; the selected forest
has several ordinary connected components. -/
theorem shared_blocks_forest_cover : ForestCover Tuza23.Controls.sharedBlockGraph sharedBlocksCover := by
  constructor
  · apply cover_of_checks
    · unfold Tuza23.Controls.sharedBlockGraph Tuza23.Controls.firstBlock Tuza23.Controls.secondBlock sharedBlocksCover
      decide
    · unfold Tuza23.Controls.sharedBlockGraph Tuza23.Controls.firstBlock Tuza23.Controls.secondBlock sharedBlocksCover
      decide
  · apply SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mpr
    have h : ∀ a b : Fin 7, (selectedGraph sharedBlocksCover).Adj a b →
        ¬ ((selectedGraph sharedBlocksCover).deleteEdges {s(a,b)}).Reachable a b := by
      unfold sharedBlocksCover
      decide
    exact fun _ _ hab => h _ _ hab

theorem shared_blocks_equality_control :
    tau (triangles Tuza23.Controls.sharedBlockGraph) =
      2 * nu (triangles Tuza23.Controls.sharedBlockGraph) :=
  (forest_cover_equality ⟨sharedBlocksCover,shared_blocks_forest_cover⟩).mpr Tuza23.Controls.shared_blocks_B

end Tuza24.Controls
