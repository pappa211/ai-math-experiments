import Tuza06.OverlapThreeActualCase2_9
import Tuza06.OverlapThreeActualCase3_9
import Tuza06.OverlapThreeActualCase5_9
import Tuza06.OverlapThreeActualCase6_9
import Tuza06.OverlapThreeActualCase7_9
import Tuza06.OverlapThreeActualCase8_9
import Tuza06.OverlapThreeActualCase9_9
import Tuza06.OverlapThreeActualCase10_9
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row9 : ∀ g : Fin 11, admissible g 9 → certificate g 9 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_9
  · exact fun _ => case_3_9
  · decide
  · exact fun _ => case_5_9
  · exact fun _ => case_6_9
  · exact fun _ => case_7_9
  · exact fun _ => case_8_9
  · exact fun _ => case_9_9
  · exact fun _ => case_10_9
end Tuza06.OverlapThreeOrientation
