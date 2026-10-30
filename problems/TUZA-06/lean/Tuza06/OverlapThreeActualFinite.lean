import Tuza06.OverlapThreeActualFiniteRow0
import Tuza06.OverlapThreeActualFiniteRow1
import Tuza06.OverlapThreeActualFiniteRow2
import Tuza06.OverlapThreeActualFiniteRow3
import Tuza06.OverlapThreeActualFiniteRow4
import Tuza06.OverlapThreeActualFiniteRow5
import Tuza06.OverlapThreeActualFiniteRow6
import Tuza06.OverlapThreeActualFiniteRow7
import Tuza06.OverlapThreeActualFiniteRow8
import Tuza06.OverlapThreeActualFiniteRow9
namespace Tuza06.OverlapThreeOrientation
theorem certified (g : Fin 11) (f : Fin 10) : admissible g f → certificate g f := by
  fin_cases f
  · exact row0 g
  · exact row1 g
  · exact row2 g
  · exact row3 g
  · exact row4 g
  · exact row5 g
  · exact row6 g
  · exact row7 g
  · exact row8 g
  · exact row9 g
end Tuza06.OverlapThreeOrientation
#print axioms Tuza06.OverlapThreeOrientation.certified
