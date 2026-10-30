import Tuza06.OverlapThreeActualUpperBasic
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem upper_1_3 : ∀ b : Fin 9, upperCheck 1 3 b := by decide
end Tuza06.OverlapThreeOrientation
