import Tuza06.OverlapThreeActualUpperBasic
namespace Tuza06.OverlapThreeOrientation
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
theorem upper_0_1 : ∀ b : Fin 9, upperCheck 0 1 b := by decide
end Tuza06.OverlapThreeOrientation
