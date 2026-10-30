import Tuza06.FiveCoverage.Chunk56
import Tuza06.FiveCoverage.Chunk57
import Tuza06.FiveCoverage.Chunk58
import Tuza06.FiveCoverage.Chunk59
import Tuza06.FiveCoverage.Chunk60
import Tuza06.FiveCoverage.Chunk61
import Tuza06.FiveCoverage.Chunk62
import Tuza06.FiveCoverage.Chunk63
namespace Tuza06.FiveCoverage.Group7
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = true) (h8 : f 8 = true)
    (h9 : f 9 = true) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk56.join b := by
      funext j
      fin_cases j <;> simp [Chunk56.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk56.witness b).1, (Chunk56.witness b).2, ?_⟩
    rw [hf]
    exact Chunk56.checked b (hf ▸ h)
  · have hf : f = Chunk60.join b := by
      funext j
      fin_cases j <;> simp [Chunk60.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk60.witness b).1, (Chunk60.witness b).2, ?_⟩
    rw [hf]
    exact Chunk60.checked b (hf ▸ h)
  · have hf : f = Chunk58.join b := by
      funext j
      fin_cases j <;> simp [Chunk58.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk58.witness b).1, (Chunk58.witness b).2, ?_⟩
    rw [hf]
    exact Chunk58.checked b (hf ▸ h)
  · have hf : f = Chunk62.join b := by
      funext j
      fin_cases j <;> simp [Chunk62.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk62.witness b).1, (Chunk62.witness b).2, ?_⟩
    rw [hf]
    exact Chunk62.checked b (hf ▸ h)
  · have hf : f = Chunk57.join b := by
      funext j
      fin_cases j <;> simp [Chunk57.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk57.witness b).1, (Chunk57.witness b).2, ?_⟩
    rw [hf]
    exact Chunk57.checked b (hf ▸ h)
  · have hf : f = Chunk61.join b := by
      funext j
      fin_cases j <;> simp [Chunk61.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk61.witness b).1, (Chunk61.witness b).2, ?_⟩
    rw [hf]
    exact Chunk61.checked b (hf ▸ h)
  · have hf : f = Chunk59.join b := by
      funext j
      fin_cases j <;> simp [Chunk59.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk59.witness b).1, (Chunk59.witness b).2, ?_⟩
    rw [hf]
    exact Chunk59.checked b (hf ▸ h)
  · have hf : f = Chunk63.join b := by
      funext j
      fin_cases j <;> simp [Chunk63.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk63.witness b).1, (Chunk63.witness b).2, ?_⟩
    rw [hf]
    exact Chunk63.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group7
