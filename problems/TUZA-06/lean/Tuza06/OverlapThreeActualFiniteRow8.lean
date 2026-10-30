import Tuza06.OverlapThreeActualCase2_8
import Tuza06.OverlapThreeActualCase3_8
import Tuza06.OverlapThreeActualCase5_8
import Tuza06.OverlapThreeActualCase6_8
import Tuza06.OverlapThreeActualCase7_8
import Tuza06.OverlapThreeActualCase8_8
import Tuza06.OverlapThreeActualCase9_8
import Tuza06.OverlapThreeActualCase10_8
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem row8 : ∀ g : Fin 11, admissible g 8 → certificate g 8 := by
  intro g
  fin_cases g
  · decide
  · decide
  · exact fun _ => case_2_8
  · exact fun _ => case_3_8
  · decide
  · exact fun _ => case_5_8
  · exact fun _ => case_6_8
  · exact fun _ => case_7_8
  · exact fun _ => case_8_8
  · exact fun _ => case_9_8
  · exact fun _ => case_10_8
end Tuza06.OverlapThreeOrientation
