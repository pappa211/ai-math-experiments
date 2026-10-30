import Tuza06.FiveCoverage.Chunk48
import Tuza06.FiveCoverage.Chunk49
import Tuza06.FiveCoverage.Chunk50
import Tuza06.FiveCoverage.Chunk51
import Tuza06.FiveCoverage.Chunk52
import Tuza06.FiveCoverage.Chunk53
import Tuza06.FiveCoverage.Chunk54
import Tuza06.FiveCoverage.Chunk55
namespace Tuza06.FiveCoverage.Group6
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = false) (h8 : f 8 = true)
    (h9 : f 9 = true) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk48.join b := by
      funext j
      fin_cases j <;> simp [Chunk48.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk48.witness b).1, (Chunk48.witness b).2, ?_⟩
    rw [hf]
    exact Chunk48.checked b (hf ▸ h)
  · have hf : f = Chunk52.join b := by
      funext j
      fin_cases j <;> simp [Chunk52.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk52.witness b).1, (Chunk52.witness b).2, ?_⟩
    rw [hf]
    exact Chunk52.checked b (hf ▸ h)
  · have hf : f = Chunk50.join b := by
      funext j
      fin_cases j <;> simp [Chunk50.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk50.witness b).1, (Chunk50.witness b).2, ?_⟩
    rw [hf]
    exact Chunk50.checked b (hf ▸ h)
  · have hf : f = Chunk54.join b := by
      funext j
      fin_cases j <;> simp [Chunk54.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk54.witness b).1, (Chunk54.witness b).2, ?_⟩
    rw [hf]
    exact Chunk54.checked b (hf ▸ h)
  · have hf : f = Chunk49.join b := by
      funext j
      fin_cases j <;> simp [Chunk49.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk49.witness b).1, (Chunk49.witness b).2, ?_⟩
    rw [hf]
    exact Chunk49.checked b (hf ▸ h)
  · have hf : f = Chunk53.join b := by
      funext j
      fin_cases j <;> simp [Chunk53.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk53.witness b).1, (Chunk53.witness b).2, ?_⟩
    rw [hf]
    exact Chunk53.checked b (hf ▸ h)
  · have hf : f = Chunk51.join b := by
      funext j
      fin_cases j <;> simp [Chunk51.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk51.witness b).1, (Chunk51.witness b).2, ?_⟩
    rw [hf]
    exact Chunk51.checked b (hf ▸ h)
  · have hf : f = Chunk55.join b := by
      funext j
      fin_cases j <;> simp [Chunk55.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk55.witness b).1, (Chunk55.witness b).2, ?_⟩
    rw [hf]
    exact Chunk55.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group6
