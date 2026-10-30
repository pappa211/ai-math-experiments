import Tuza06.OverlapThreeActualCase4_4
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row4 : ∀ g : Fin 11, admissible g 4 → certificate g 4 := by
  intro g
  fin_cases g
  · decide
  · decide
  · decide
  · decide
  · exact fun _ => case_4_4
  · decide
  · decide
  · decide
  · decide
  · decide
  · decide
end Tuza06.OverlapThreeOrientation
