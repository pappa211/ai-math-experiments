import Tuza06.OverlapThreeActualCase0_0
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row0 : ∀ g : Fin 11, admissible g 0 → certificate g 0 := by
  intro g
  fin_cases g
  · exact fun _ => case_0_0
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
end Tuza06.OverlapThreeOrientation
