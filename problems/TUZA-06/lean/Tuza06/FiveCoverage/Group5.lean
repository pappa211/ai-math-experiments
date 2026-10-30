import Tuza06.FiveCoverage.Chunk40
import Tuza06.FiveCoverage.Chunk41
import Tuza06.FiveCoverage.Chunk42
import Tuza06.FiveCoverage.Chunk43
import Tuza06.FiveCoverage.Chunk44
import Tuza06.FiveCoverage.Chunk45
import Tuza06.FiveCoverage.Chunk46
import Tuza06.FiveCoverage.Chunk47
namespace Tuza06.FiveCoverage.Group5
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = true) (h8 : f 8 = false)
    (h9 : f 9 = true) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk40.join b := by
      funext j
      fin_cases j <;> simp [Chunk40.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk40.witness b).1, (Chunk40.witness b).2, ?_⟩
    rw [hf]
    exact Chunk40.checked b (hf ▸ h)
  · have hf : f = Chunk44.join b := by
      funext j
      fin_cases j <;> simp [Chunk44.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk44.witness b).1, (Chunk44.witness b).2, ?_⟩
    rw [hf]
    exact Chunk44.checked b (hf ▸ h)
  · have hf : f = Chunk42.join b := by
      funext j
      fin_cases j <;> simp [Chunk42.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk42.witness b).1, (Chunk42.witness b).2, ?_⟩
    rw [hf]
    exact Chunk42.checked b (hf ▸ h)
  · have hf : f = Chunk46.join b := by
      funext j
      fin_cases j <;> simp [Chunk46.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk46.witness b).1, (Chunk46.witness b).2, ?_⟩
    rw [hf]
    exact Chunk46.checked b (hf ▸ h)
  · have hf : f = Chunk41.join b := by
      funext j
      fin_cases j <;> simp [Chunk41.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk41.witness b).1, (Chunk41.witness b).2, ?_⟩
    rw [hf]
    exact Chunk41.checked b (hf ▸ h)
  · have hf : f = Chunk45.join b := by
      funext j
      fin_cases j <;> simp [Chunk45.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk45.witness b).1, (Chunk45.witness b).2, ?_⟩
    rw [hf]
    exact Chunk45.checked b (hf ▸ h)
  · have hf : f = Chunk43.join b := by
      funext j
      fin_cases j <;> simp [Chunk43.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk43.witness b).1, (Chunk43.witness b).2, ?_⟩
    rw [hf]
    exact Chunk43.checked b (hf ▸ h)
  · have hf : f = Chunk47.join b := by
      funext j
      fin_cases j <;> simp [Chunk47.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk47.witness b).1, (Chunk47.witness b).2, ?_⟩
    rw [hf]
    exact Chunk47.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group5
