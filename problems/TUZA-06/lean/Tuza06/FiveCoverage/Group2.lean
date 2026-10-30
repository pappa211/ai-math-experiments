import Tuza06.FiveCoverage.Chunk16
import Tuza06.FiveCoverage.Chunk17
import Tuza06.FiveCoverage.Chunk18
import Tuza06.FiveCoverage.Chunk19
import Tuza06.FiveCoverage.Chunk20
import Tuza06.FiveCoverage.Chunk21
import Tuza06.FiveCoverage.Chunk22
import Tuza06.FiveCoverage.Chunk23
namespace Tuza06.FiveCoverage.Group2
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = false) (h8 : f 8 = true)
    (h9 : f 9 = false) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk16.join b := by
      funext j
      fin_cases j <;> simp [Chunk16.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk16.witness b).1, (Chunk16.witness b).2, ?_⟩
    rw [hf]
    exact Chunk16.checked b (hf ▸ h)
  · have hf : f = Chunk20.join b := by
      funext j
      fin_cases j <;> simp [Chunk20.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk20.witness b).1, (Chunk20.witness b).2, ?_⟩
    rw [hf]
    exact Chunk20.checked b (hf ▸ h)
  · have hf : f = Chunk18.join b := by
      funext j
      fin_cases j <;> simp [Chunk18.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk18.witness b).1, (Chunk18.witness b).2, ?_⟩
    rw [hf]
    exact Chunk18.checked b (hf ▸ h)
  · have hf : f = Chunk22.join b := by
      funext j
      fin_cases j <;> simp [Chunk22.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk22.witness b).1, (Chunk22.witness b).2, ?_⟩
    rw [hf]
    exact Chunk22.checked b (hf ▸ h)
  · have hf : f = Chunk17.join b := by
      funext j
      fin_cases j <;> simp [Chunk17.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk17.witness b).1, (Chunk17.witness b).2, ?_⟩
    rw [hf]
    exact Chunk17.checked b (hf ▸ h)
  · have hf : f = Chunk21.join b := by
      funext j
      fin_cases j <;> simp [Chunk21.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk21.witness b).1, (Chunk21.witness b).2, ?_⟩
    rw [hf]
    exact Chunk21.checked b (hf ▸ h)
  · have hf : f = Chunk19.join b := by
      funext j
      fin_cases j <;> simp [Chunk19.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk19.witness b).1, (Chunk19.witness b).2, ?_⟩
    rw [hf]
    exact Chunk19.checked b (hf ▸ h)
  · have hf : f = Chunk23.join b := by
      funext j
      fin_cases j <;> simp [Chunk23.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk23.witness b).1, (Chunk23.witness b).2, ?_⟩
    rw [hf]
    exact Chunk23.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group2
