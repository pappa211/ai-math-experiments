import Tuza06.OverlapThreeActualUpper2_0
import Tuza06.OverlapThreeActualUpper2_1
import Tuza06.OverlapThreeActualUpper2_2
import Tuza06.OverlapThreeActualUpper2_3
import Tuza06.OverlapThreeActualUpper2_4
import Tuza06.OverlapThreeActualUpper2_5
import Tuza06.OverlapThreeActualUpper2_6
import Tuza06.OverlapThreeActualUpper2_7
import Tuza06.OverlapThreeActualUpper2_8
namespace Tuza06.OverlapThreeOrientation
theorem upper_group2 (a : Fin 9) : ∀ b : Fin 9, upperCheck 2 a b := by
  fin_cases a
  · exact upper_2_0
  · exact upper_2_1
  · exact upper_2_2
  · exact upper_2_3
  · exact upper_2_4
  · exact upper_2_5
  · exact upper_2_6
  · exact upper_2_7
  · exact upper_2_8
end Tuza06.OverlapThreeOrientation
