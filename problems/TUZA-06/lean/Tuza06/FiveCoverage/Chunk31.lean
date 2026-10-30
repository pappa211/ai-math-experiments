import Tuza06.FiveCoverage.Basic
namespace Tuza06.FiveCoverage.Chunk31
open Finset Tuza
set_option maxRecDepth 12000
set_option maxHeartbeats 2000000

def join (b : Fin 4 → Bool) : Fin 10 → Bool := ![b 0, b 1, b 2, b 3, true, true, true, true, true, false]
def witness (b : Fin 4 → Bool) : Fin 11 × Fin 120 :=
  (if b 3 then (if b 2 then (if b 1 then (if b 0 then (9,118) else (7,98)) else (if b 0 then (7,114) else (0,118))) else (if b 1 then (if b 0 then (8,106) else (1,81)) else (if b 0 then (1,114) else (0,0)))) else (if b 2 then (if b 1 then (if b 0 then (8,26) else (1,98)) else (if b 0 then (1,47) else (0,0))) else (if b 1 then (if b 0 then (3,106) else (0,0)) else (if b 0 then (0,0) else (0,0)))))

/-- All 16 low-bit choices checked by Lean's kernel, using explicit relabelings. -/
theorem checked : ∀ b : Fin 4 → Bool, Eligible (join b) →
    Relabel (join b) (witness b).1 (witness b).2 := by
  unfold Eligible Relabel
  decide
end Tuza06.FiveCoverage.Chunk31
