import Tuza24.ForestCS
import Tuza24.ForestK5Exclusion

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Optional sharp equality classification inside the forest-cover class:
every nonempty actual triangle component has literal K4 support. The empty
triangle family is included, and the general definition B remains K4/K5. -/
theorem forest_cover_equality_k4 {G : SimpleGraph V} (hG : HasForestCover G) :
    tau (triangles G)=2*nu (triangles G) ↔ ComponentK4 G :=
  (forest_cover_equality hG).trans (hasForestCover_B_iff_K4 hG)

end Tuza24
