import Tuza06.OverlapThreeActualCase2_5
import Tuza06.OverlapThreeActualCase3_5
import Tuza06.OverlapThreeActualCase5_5
import Tuza06.OverlapThreeActualCase6_5
import Tuza06.OverlapThreeActualCase7_5
import Tuza06.OverlapThreeActualCase8_5
import Tuza06.OverlapThreeActualCase9_5
import Tuza06.OverlapThreeActualCase10_5
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row5 : ∀ g : Fin 11, admissible g 5 → certificate g 5 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_5
  · exact fun _ => case_3_5
  · decide
  · exact fun _ => case_5_5
  · exact fun _ => case_6_5
  · exact fun _ => case_7_5
  · exact fun _ => case_8_5
  · exact fun _ => case_9_5
  · exact fun _ => case_10_5
end Tuza06.OverlapThreeOrientation
