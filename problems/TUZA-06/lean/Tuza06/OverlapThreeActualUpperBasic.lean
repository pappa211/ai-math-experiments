import Tuza06.OverlapThreeActualFiniteBasic
namespace Tuza06.OverlapThreeOrientation
open Finset Tuza
def upper : Fin 3 → Finset (Finset (Fin 9)) :=
  ![OverlapThreeInside.Upper,OverlapThreeOutsideArm.Upper,OverlapThreeOutsidePair.Upper]
theorem pattern_upper (k : Fin 3) : (pattern k).Upper = upper k := by
  fin_cases k <;> rfl
theorem pattern_U (k : Fin 3) : (pattern k).U = {0,1} := by
  fin_cases k <;> rfl
def upperCheck (k : Fin 3) (a b : Fin 9) : Prop :=
  ({a,b} : Finset (Fin 9)) ∉ upper k →
  a=b ∨ (a=0 ∧ b∉threeNx) ∨ (b=0 ∧ a∉threeNx) ∨
  (a=1 ∧ b∉threeNy) ∨ (b=1 ∧ a∉threeNy) ∨
  ({a,b} : Finset (Fin 9)) = target k
instance (k : Fin 3) (a b : Fin 9) : Decidable (upperCheck k a b) :=
  inferInstanceAs (Decidable (_ → _))
end Tuza06.OverlapThreeOrientation
