import Tuza06.OverlapThreeActualCase2_2
import Tuza06.OverlapThreeActualCase3_2
import Tuza06.OverlapThreeActualCase5_2
import Tuza06.OverlapThreeActualCase6_2
import Tuza06.OverlapThreeActualCase7_2
import Tuza06.OverlapThreeActualCase8_2
import Tuza06.OverlapThreeActualCase9_2
import Tuza06.OverlapThreeActualCase10_2
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row2 : ∀ g : Fin 11, admissible g 2 → certificate g 2 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_2
  · exact fun _ => case_3_2
  · decide
  · exact fun _ => case_5_2
  · exact fun _ => case_6_2
  · exact fun _ => case_7_2
  · exact fun _ => case_8_2
  · exact fun _ => case_9_2
  · exact fun _ => case_10_2
end Tuza06.OverlapThreeOrientation
