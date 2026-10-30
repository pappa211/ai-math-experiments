import Tuza06.FiveCoverage.Chunk24
import Tuza06.FiveCoverage.Chunk25
import Tuza06.FiveCoverage.Chunk26
import Tuza06.FiveCoverage.Chunk27
import Tuza06.FiveCoverage.Chunk28
import Tuza06.FiveCoverage.Chunk29
import Tuza06.FiveCoverage.Chunk30
import Tuza06.FiveCoverage.Chunk31
namespace Tuza06.FiveCoverage.Group3
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = true) (h8 : f 8 = true)
    (h9 : f 9 = false) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk24.join b := by
      funext j
      fin_cases j <;> simp [Chunk24.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk24.witness b).1, (Chunk24.witness b).2, ?_⟩
    rw [hf]
    exact Chunk24.checked b (hf ▸ h)
  · have hf : f = Chunk28.join b := by
      funext j
      fin_cases j <;> simp [Chunk28.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk28.witness b).1, (Chunk28.witness b).2, ?_⟩
    rw [hf]
    exact Chunk28.checked b (hf ▸ h)
  · have hf : f = Chunk26.join b := by
      funext j
      fin_cases j <;> simp [Chunk26.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk26.witness b).1, (Chunk26.witness b).2, ?_⟩
    rw [hf]
    exact Chunk26.checked b (hf ▸ h)
  · have hf : f = Chunk30.join b := by
      funext j
      fin_cases j <;> simp [Chunk30.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk30.witness b).1, (Chunk30.witness b).2, ?_⟩
    rw [hf]
    exact Chunk30.checked b (hf ▸ h)
  · have hf : f = Chunk25.join b := by
      funext j
      fin_cases j <;> simp [Chunk25.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk25.witness b).1, (Chunk25.witness b).2, ?_⟩
    rw [hf]
    exact Chunk25.checked b (hf ▸ h)
  · have hf : f = Chunk29.join b := by
      funext j
      fin_cases j <;> simp [Chunk29.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk29.witness b).1, (Chunk29.witness b).2, ?_⟩
    rw [hf]
    exact Chunk29.checked b (hf ▸ h)
  · have hf : f = Chunk27.join b := by
      funext j
      fin_cases j <;> simp [Chunk27.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk27.witness b).1, (Chunk27.witness b).2, ?_⟩
    rw [hf]
    exact Chunk27.checked b (hf ▸ h)
  · have hf : f = Chunk31.join b := by
      funext j
      fin_cases j <;> simp [Chunk31.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk31.witness b).1, (Chunk31.witness b).2, ?_⟩
    rw [hf]
    exact Chunk31.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group3
