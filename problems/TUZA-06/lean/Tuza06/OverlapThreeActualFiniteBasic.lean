import Tuza06.OverlapThreeActualLabeling
import Tuza06.OverlapThreeInside
import Tuza06.OverlapThreeOutsideArm
import Tuza06.OverlapThreeOutsidePair
namespace Tuza06.OverlapThreeOrientation
open Finset Tuza
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
def xEdges : Finset (Finset (Fin 9)) := {{2,3},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{5,6}}
def yEdges : Finset (Finset (Fin 9)) := {{2,3},{2,4},{2,7},{2,8},{3,4},{3,7},{3,8},{4,7},{4,8},{7,8}}
def stars : Finset (Finset (Fin 9)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{1,2},{1,3},{1,4},{1,7},{1,8}}
def xMissing : Fin 11 → Finset (Fin 9) := ![{2,3},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{5,6},∅]
def yMissing : Fin 10 → Finset (Fin 9) := ![{2,3},{2,4},{2,7},{2,8},{3,4},{3,7},{3,8},{4,7},{4,8},{7,8}]
def known (g : Fin 11) (f : Fin 10) := stars ∪ (xEdges.erase (xMissing g)) ∪ (yEdges.erase (yMissing f))
def admissible (g : Fin 11) (f : Fin 10) : Prop := xMissing g ∉ known g f ∧ yMissing f ∉ known g f
instance (g : Fin 11) (f : Fin 10) : Decidable (admissible g f) := inferInstanceAs (Decidable (_ ∧ _))
def orderFn : Fin 24 → Fin 9 → Fin 9 := ![![0,1,2,3,4,5,6,7,8],![0,1,2,3,4,5,6,8,7],![0,1,2,3,4,6,5,7,8],![0,1,2,3,4,6,5,8,7],![0,1,2,4,3,5,6,7,8],![0,1,2,4,3,5,6,8,7],![0,1,2,4,3,6,5,7,8],![0,1,2,4,3,6,5,8,7],![0,1,3,2,4,5,6,7,8],![0,1,3,2,4,5,6,8,7],![0,1,3,2,4,6,5,7,8],![0,1,3,2,4,6,5,8,7],![0,1,3,4,2,5,6,7,8],![0,1,3,4,2,5,6,8,7],![0,1,3,4,2,6,5,7,8],![0,1,3,4,2,6,5,8,7],![0,1,4,2,3,5,6,7,8],![0,1,4,2,3,5,6,8,7],![0,1,4,2,3,6,5,7,8],![0,1,4,2,3,6,5,8,7],![0,1,4,3,2,5,6,7,8],![0,1,4,3,2,5,6,8,7],![0,1,4,3,2,6,5,7,8],![0,1,4,3,2,6,5,8,7]]
private theorem order_inj : ∀ q : Fin 24, Function.Injective (orderFn q) := by decide
def reorder (q : Fin 24) : Fin 9 ↪ Fin 9 := ⟨orderFn q,order_inj q⟩
def kind : Fin 10 → Fin 3 := ![0,0,1,1,0,1,1,1,1,2]
def pattern : Fin 3 → FiniteReduction (Fin 9) := ![OverlapThreeInside.witness,OverlapThreeOutsideArm.witness,OverlapThreeOutsidePair.witness]
def aug : Fin 3 → Finset (Finset (Fin 9)) := ![OverlapThreeInside.Aug,OverlapThreeOutsideArm.Aug,OverlapThreeOutsidePair.Aug]
def target : Fin 3 → Finset (Fin 9) := ![{2,4},{3,7},{7,8}]
def choice : Fin 11 → Fin 10 → Fin 24 := ![![4,0,0,0,0,0,0,0,0,0],![0,0,0,0,0,0,0,0,0,0],![0,0,10,11,0,22,23,14,15,10],![0,0,8,9,0,20,21,12,13,8],![0,0,0,0,8,0,0,0,0,0],![0,0,18,19,0,2,3,6,7,2],![0,0,16,17,0,0,1,4,5,0],![0,0,10,11,0,2,3,6,7,2],![0,0,8,9,0,0,1,4,5,0],![0,0,8,9,0,0,1,4,5,0],![0,0,8,9,0,0,1,4,5,0]]
def certificate (g : Fin 11) (f : Fin 10) : Prop :=
  (target (kind f)).map (reorder (choice g f)) = yMissing f ∧
  ∀ t : ↥((pattern (kind f)).P ∪ aug (kind f)),
    (t.val.map (reorder (choice g f))).card = 3 ∧
    edges (t.val.map (reorder (choice g f))) ⊆ known g f
instance (g : Fin 11) (f : Fin 10) : Decidable (certificate g f) := inferInstanceAs (Decidable (_ ∧ _))
theorem reorder_zero (q : Fin 24) : reorder q 0 = 0 := by fin_cases q <;> decide
theorem reorder_one (q : Fin 24) : reorder q 1 = 1 := by fin_cases q <;> decide
theorem reorder_nx (q : Fin 24) : threeNx.map (reorder q) = threeNx := by fin_cases q <;> decide
theorem reorder_ny (q : Fin 24) : threeNy.map (reorder q) = threeNy := by fin_cases q <;> decide
end Tuza06.OverlapThreeOrientation
