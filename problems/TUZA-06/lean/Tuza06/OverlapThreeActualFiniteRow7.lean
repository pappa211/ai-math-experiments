import Tuza06.OverlapThreeActualCase2_7
import Tuza06.OverlapThreeActualCase3_7
import Tuza06.OverlapThreeActualCase5_7
import Tuza06.OverlapThreeActualCase6_7
import Tuza06.OverlapThreeActualCase7_7
import Tuza06.OverlapThreeActualCase8_7
import Tuza06.OverlapThreeActualCase9_7
import Tuza06.OverlapThreeActualCase10_7
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row7 : ∀ g : Fin 11, admissible g 7 → certificate g 7 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_7
  · exact fun _ => case_3_7
  · decide
  · exact fun _ => case_5_7
  · exact fun _ => case_6_7
  · exact fun _ => case_7_7
  · exact fun _ => case_8_7
  · exact fun _ => case_9_7
  · exact fun _ => case_10_7
end Tuza06.OverlapThreeOrientation
