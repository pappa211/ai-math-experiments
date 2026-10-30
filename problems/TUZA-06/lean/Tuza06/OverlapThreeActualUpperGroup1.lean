import Tuza06.OverlapThreeActualUpper1_0
import Tuza06.OverlapThreeActualUpper1_1
import Tuza06.OverlapThreeActualUpper1_2
import Tuza06.OverlapThreeActualUpper1_3
import Tuza06.OverlapThreeActualUpper1_4
import Tuza06.OverlapThreeActualUpper1_5
import Tuza06.OverlapThreeActualUpper1_6
import Tuza06.OverlapThreeActualUpper1_7
import Tuza06.OverlapThreeActualUpper1_8
namespace Tuza06.OverlapThreeOrientation
theorem upper_group1 (a : Fin 9) : ∀ b : Fin 9, upperCheck 1 a b := by
  fin_cases a
  · exact upper_1_0
  · exact upper_1_1
  · exact upper_1_2
  · exact upper_1_3
  · exact upper_1_4
  · exact upper_1_5
  · exact upper_1_6
  · exact upper_1_7
  · exact upper_1_8
end Tuza06.OverlapThreeOrientation
