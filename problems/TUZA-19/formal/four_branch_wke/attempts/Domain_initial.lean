import Core
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace FourBranch
-- Completeness of the base-five state-vector enumerator, independent of data.
theorem mem_vectors_iff (k : Nat) (s : List Nat) :
    s ∈ vectors k ↔ s.length = k ∧ ∀ x ∈ s, x < 5 := by
  induction k generalizing s with
  | zero =>
    cases s <;> simp [vectors]
  | succ k ih =>
    cases s with
    | nil => simp [vectors]
    | cons x xs => simp [vectors, ih]
#print axioms mem_vectors_iff
end FourBranch
