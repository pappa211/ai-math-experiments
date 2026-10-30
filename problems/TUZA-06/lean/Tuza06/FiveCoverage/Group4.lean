import Tuza06.FiveCoverage.Chunk32
import Tuza06.FiveCoverage.Chunk33
import Tuza06.FiveCoverage.Chunk34
import Tuza06.FiveCoverage.Chunk35
import Tuza06.FiveCoverage.Chunk36
import Tuza06.FiveCoverage.Chunk37
import Tuza06.FiveCoverage.Chunk38
import Tuza06.FiveCoverage.Chunk39
namespace Tuza06.FiveCoverage.Group4
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = false) (h8 : f 8 = false)
    (h9 : f 9 = true) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk32.join b := by
      funext j
      fin_cases j <;> simp [Chunk32.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk32.witness b).1, (Chunk32.witness b).2, ?_⟩
    rw [hf]
    exact Chunk32.checked b (hf ▸ h)
  · have hf : f = Chunk36.join b := by
      funext j
      fin_cases j <;> simp [Chunk36.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk36.witness b).1, (Chunk36.witness b).2, ?_⟩
    rw [hf]
    exact Chunk36.checked b (hf ▸ h)
  · have hf : f = Chunk34.join b := by
      funext j
      fin_cases j <;> simp [Chunk34.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk34.witness b).1, (Chunk34.witness b).2, ?_⟩
    rw [hf]
    exact Chunk34.checked b (hf ▸ h)
  · have hf : f = Chunk38.join b := by
      funext j
      fin_cases j <;> simp [Chunk38.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk38.witness b).1, (Chunk38.witness b).2, ?_⟩
    rw [hf]
    exact Chunk38.checked b (hf ▸ h)
  · have hf : f = Chunk33.join b := by
      funext j
      fin_cases j <;> simp [Chunk33.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk33.witness b).1, (Chunk33.witness b).2, ?_⟩
    rw [hf]
    exact Chunk33.checked b (hf ▸ h)
  · have hf : f = Chunk37.join b := by
      funext j
      fin_cases j <;> simp [Chunk37.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk37.witness b).1, (Chunk37.witness b).2, ?_⟩
    rw [hf]
    exact Chunk37.checked b (hf ▸ h)
  · have hf : f = Chunk35.join b := by
      funext j
      fin_cases j <;> simp [Chunk35.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk35.witness b).1, (Chunk35.witness b).2, ?_⟩
    rw [hf]
    exact Chunk35.checked b (hf ▸ h)
  · have hf : f = Chunk39.join b := by
      funext j
      fin_cases j <;> simp [Chunk39.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk39.witness b).1, (Chunk39.witness b).2, ?_⟩
    rw [hf]
    exact Chunk39.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group4
