import Tuza06.OverlapThreeActualCase1_1
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row1 : ∀ g : Fin 11, admissible g 1 → certificate g 1 := by
  intro g
  fin_cases g
  · decide
  · exact fun _ => case_1_1
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
