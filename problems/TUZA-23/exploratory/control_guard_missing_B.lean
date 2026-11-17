import Tuza23.R2
open Tuza Tuza23
variable {V : Type*} [Fintype V] [DecidableEq V]
-- EXPECTED TYPE ERROR. This tests the exported API; it is not a mathematical
-- independence proof for the old-B hypothesis and is excluded from accepted builds.
example (H : SimpleGraph V) (F : Finset (Finset V))
    (hF : Nonedges H F) (hcard : F.card ≤ 2)
    (htight : tau (triangles (addEdges H F)) = 2 * nu (triangles (addEdges H F))) :
    B (addEdges H F) := by
  exact r2 H F hF hcard htight
