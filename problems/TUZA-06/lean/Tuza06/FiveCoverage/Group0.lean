import Tuza06.FiveCoverage.Chunk00
import Tuza06.FiveCoverage.Chunk01
import Tuza06.FiveCoverage.Chunk02
import Tuza06.FiveCoverage.Chunk03
import Tuza06.FiveCoverage.Chunk04
import Tuza06.FiveCoverage.Chunk05
import Tuza06.FiveCoverage.Chunk06
import Tuza06.FiveCoverage.Chunk07
namespace Tuza06.FiveCoverage.Group0
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = false) (h8 : f 8 = false)
    (h9 : f 9 = false) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk00.join b := by
      funext j
      fin_cases j <;> simp [Chunk00.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk00.witness b).1, (Chunk00.witness b).2, ?_⟩
    rw [hf]
    exact Chunk00.checked b (hf ▸ h)
  · have hf : f = Chunk04.join b := by
      funext j
      fin_cases j <;> simp [Chunk04.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk04.witness b).1, (Chunk04.witness b).2, ?_⟩
    rw [hf]
    exact Chunk04.checked b (hf ▸ h)
  · have hf : f = Chunk02.join b := by
      funext j
      fin_cases j <;> simp [Chunk02.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk02.witness b).1, (Chunk02.witness b).2, ?_⟩
    rw [hf]
    exact Chunk02.checked b (hf ▸ h)
  · have hf : f = Chunk06.join b := by
      funext j
      fin_cases j <;> simp [Chunk06.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk06.witness b).1, (Chunk06.witness b).2, ?_⟩
    rw [hf]
    exact Chunk06.checked b (hf ▸ h)
  · have hf : f = Chunk01.join b := by
      funext j
      fin_cases j <;> simp [Chunk01.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk01.witness b).1, (Chunk01.witness b).2, ?_⟩
    rw [hf]
    exact Chunk01.checked b (hf ▸ h)
  · have hf : f = Chunk05.join b := by
      funext j
      fin_cases j <;> simp [Chunk05.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk05.witness b).1, (Chunk05.witness b).2, ?_⟩
    rw [hf]
    exact Chunk05.checked b (hf ▸ h)
  · have hf : f = Chunk03.join b := by
      funext j
      fin_cases j <;> simp [Chunk03.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk03.witness b).1, (Chunk03.witness b).2, ?_⟩
    rw [hf]
    exact Chunk03.checked b (hf ▸ h)
  · have hf : f = Chunk07.join b := by
      funext j
      fin_cases j <;> simp [Chunk07.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk07.witness b).1, (Chunk07.witness b).2, ?_⟩
    rw [hf]
    exact Chunk07.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group0
