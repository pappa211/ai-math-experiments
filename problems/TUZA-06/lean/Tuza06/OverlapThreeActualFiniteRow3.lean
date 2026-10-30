import Tuza06.OverlapThreeActualCase2_3
import Tuza06.OverlapThreeActualCase3_3
import Tuza06.OverlapThreeActualCase5_3
import Tuza06.OverlapThreeActualCase6_3
import Tuza06.OverlapThreeActualCase7_3
import Tuza06.OverlapThreeActualCase8_3
import Tuza06.OverlapThreeActualCase9_3
import Tuza06.OverlapThreeActualCase10_3
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row3 : ∀ g : Fin 11, admissible g 3 → certificate g 3 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_3
  · exact fun _ => case_3_3
  · decide
  · exact fun _ => case_5_3
  · exact fun _ => case_6_3
  · exact fun _ => case_7_3
  · exact fun _ => case_8_3
  · exact fun _ => case_9_3
  · exact fun _ => case_10_3
end Tuza06.OverlapThreeOrientation
