import Tuza06.FiveCoverage.Basic
namespace Tuza06.FiveCoverage.Chunk59
open Finset Tuza
set_option maxRecDepth 12000
set_option maxHeartbeats 2000000

def join (b : Fin 4 → Bool) : Fin 10 → Bool := ![b 0, b 1, b 2, b 3, true, true, false, true, true, true]
def witness (b : Fin 4 → Bool) : Fin 11 × Fin 120 :=
  (if b 3 then (if b 2 then (if b 1 then (if b 0 then (9,116) else (8,112)) else (if b 0 then (7,116) else (1,104))) else (if b 1 then (if b 0 then (7,96) else (1,93)) else (if b 0 then (0,36) else (0,0)))) else (if b 2 then (if b 1 then (if b 0 then (8,32) else (3,112)) else (if b 0 then (1,116) else (0,0))) else (if b 1 then (if b 0 then (1,56) else (0,0)) else (if b 0 then (0,0) else (0,0)))))

/-- All 16 low-bit choices checked by Lean's kernel, using explicit relabelings. -/
theorem checked : ∀ b : Fin 4 → Bool, Eligible (join b) →
    Relabel (join b) (witness b).1 (witness b).2 := by
  unfold Eligible Relabel
  decide
end Tuza06.FiveCoverage.Chunk59
