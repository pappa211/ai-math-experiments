import Tuza06.OverlapThreeActualCase2_6
import Tuza06.OverlapThreeActualCase3_6
import Tuza06.OverlapThreeActualCase5_6
import Tuza06.OverlapThreeActualCase6_6
import Tuza06.OverlapThreeActualCase7_6
import Tuza06.OverlapThreeActualCase8_6
import Tuza06.OverlapThreeActualCase9_6
import Tuza06.OverlapThreeActualCase10_6
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row6 : ∀ g : Fin 11, admissible g 6 → certificate g 6 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_6
  · exact fun _ => case_3_6
  · decide
  · exact fun _ => case_5_6
  · exact fun _ => case_6_6
  · exact fun _ => case_7_6
  · exact fun _ => case_8_6
  · exact fun _ => case_9_6
  · exact fun _ => case_10_6
end Tuza06.OverlapThreeOrientation
