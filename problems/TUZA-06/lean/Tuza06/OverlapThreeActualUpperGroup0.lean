import Tuza06.OverlapThreeActualUpper0_0
import Tuza06.OverlapThreeActualUpper0_1
import Tuza06.OverlapThreeActualUpper0_2
import Tuza06.OverlapThreeActualUpper0_3
import Tuza06.OverlapThreeActualUpper0_4
import Tuza06.OverlapThreeActualUpper0_5
import Tuza06.OverlapThreeActualUpper0_6
import Tuza06.OverlapThreeActualUpper0_7
import Tuza06.OverlapThreeActualUpper0_8
namespace Tuza06.OverlapThreeOrientation
theorem upper_group0 (a : Fin 9) : ∀ b : Fin 9, upperCheck 0 a b := by
  fin_cases a
  · exact upper_0_0
  · exact upper_0_1
  · exact upper_0_2
  · exact upper_0_3
  · exact upper_0_4
  · exact upper_0_5
  · exact upper_0_6
  · exact upper_0_7
  · exact upper_0_8
end Tuza06.OverlapThreeOrientation
