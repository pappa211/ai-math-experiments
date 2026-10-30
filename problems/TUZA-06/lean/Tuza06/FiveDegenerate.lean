import Tuza06.PeelingConfiguration
import Tuza06.FinalReconstruction
import Tuza06.MinimalFinalCore
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The actual minimal combined obstruction is impossible. Every local structure
and every outside-attachment argument is discharged in the imported closure. -/
theorem minimal_five_degenerate_impossible {G : SimpleGraph V}
    (hG : MinimalObstruction G) (hdeg : Degenerate G 5) : False := by
  obtain ⟨i,hd⟩ := minimal_final_arm_data hG hdeg
  obtain ⟨p,q,hc⟩ := final_configuration_of_arm_data hG hd
  exact minimal_no_final_configuration hG i p q hc

theorem five_degenerate_good {G : SimpleGraph V} (hdeg : Degenerate G 5) : Good G := by
  by_contra hbad
  obtain ⟨H,hHG,hmin⟩ := exists_minimal_obstruction hbad
  exact minimal_five_degenerate_impossible hmin (degenerate_mono hHG hdeg)

/-- Complete Tuza inequality and literal shared-edge triangle-component equality
characterization for every finite simple five-degenerate graph. Maximum degree,
order, coloring, planarity and outside attachments are unrestricted. -/
theorem five_degenerate_combined {G : SimpleGraph V} (hdeg : Degenerate G 5) :
    tau (triangles G) ≤ 2 * nu (triangles G) ∧
      (tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G) :=
  (good_iff_combined_conclusion G).mp (five_degenerate_good hdeg)

theorem five_degenerate_inequality {G : SimpleGraph V} (hdeg : Degenerate G 5) :
    tau (triangles G) ≤ 2 * nu (triangles G) := (five_degenerate_combined hdeg).1

theorem five_degenerate_equality {G : SimpleGraph V} (hdeg : Degenerate G 5) :
    tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G :=
  (five_degenerate_combined hdeg).2

theorem five_degenerate_equality_decomposition {G : SimpleGraph V} (hdeg : Degenerate G 5) :
    tau (triangles G) = 2 * nu (triangles G) ↔
      ∃ K : Finset (Finset V), CliqueDecomposition G K :=
  (five_degenerate_equality hdeg).trans componentCliques_iff_decomposition

/-- The frozen target proposition is proved without additional mathematical inputs. -/
theorem five_degenerate_statement (G : SimpleGraph V) : CombinedStatement G :=
  fun hdeg => five_degenerate_combined hdeg
end Tuza06
#check @Tuza06.five_degenerate_combined
#check @Tuza06.five_degenerate_equality_decomposition
#check @Tuza06.five_degenerate_statement
#print axioms Tuza06.five_degenerate_combined
#print axioms Tuza06.five_degenerate_statement
