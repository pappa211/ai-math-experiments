import Tuza06.FiveCoverage.Chunk08
import Tuza06.FiveCoverage.Chunk09
import Tuza06.FiveCoverage.Chunk10
import Tuza06.FiveCoverage.Chunk11
import Tuza06.FiveCoverage.Chunk12
import Tuza06.FiveCoverage.Chunk13
import Tuza06.FiveCoverage.Chunk14
import Tuza06.FiveCoverage.Chunk15
namespace Tuza06.FiveCoverage.Group1
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000

theorem classify (f : Fin 10 → Bool) (h : Eligible f)
    (h7 : f 7 = true) (h8 : f 8 = false)
    (h9 : f 9 = false) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  let b : Fin 4 → Bool := fun j => f ⟨j.val, by omega⟩
  cases h4 : f 4 <;> cases h5 : f 5 <;> cases h6 : f 6
  · have hf : f = Chunk08.join b := by
      funext j
      fin_cases j <;> simp [Chunk08.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk08.witness b).1, (Chunk08.witness b).2, ?_⟩
    rw [hf]
    exact Chunk08.checked b (hf ▸ h)
  · have hf : f = Chunk12.join b := by
      funext j
      fin_cases j <;> simp [Chunk12.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk12.witness b).1, (Chunk12.witness b).2, ?_⟩
    rw [hf]
    exact Chunk12.checked b (hf ▸ h)
  · have hf : f = Chunk10.join b := by
      funext j
      fin_cases j <;> simp [Chunk10.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk10.witness b).1, (Chunk10.witness b).2, ?_⟩
    rw [hf]
    exact Chunk10.checked b (hf ▸ h)
  · have hf : f = Chunk14.join b := by
      funext j
      fin_cases j <;> simp [Chunk14.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk14.witness b).1, (Chunk14.witness b).2, ?_⟩
    rw [hf]
    exact Chunk14.checked b (hf ▸ h)
  · have hf : f = Chunk09.join b := by
      funext j
      fin_cases j <;> simp [Chunk09.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk09.witness b).1, (Chunk09.witness b).2, ?_⟩
    rw [hf]
    exact Chunk09.checked b (hf ▸ h)
  · have hf : f = Chunk13.join b := by
      funext j
      fin_cases j <;> simp [Chunk13.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk13.witness b).1, (Chunk13.witness b).2, ?_⟩
    rw [hf]
    exact Chunk13.checked b (hf ▸ h)
  · have hf : f = Chunk11.join b := by
      funext j
      fin_cases j <;> simp [Chunk11.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk11.witness b).1, (Chunk11.witness b).2, ?_⟩
    rw [hf]
    exact Chunk11.checked b (hf ▸ h)
  · have hf : f = Chunk15.join b := by
      funext j
      fin_cases j <;> simp [Chunk15.join, b, h4, h5, h6, h7, h8, h9]
    refine ⟨(Chunk15.witness b).1, (Chunk15.witness b).2, ?_⟩
    rw [hf]
    exact Chunk15.checked b (hf ▸ h)
end Tuza06.FiveCoverage.Group1
