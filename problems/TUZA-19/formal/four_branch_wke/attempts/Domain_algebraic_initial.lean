import Core
set_option maxRecDepth 10000
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
    | cons x xs => simp [vectors, ih, and_left_comm, and_assoc, and_comm]
#print axioms mem_vectors_iff
theorem vectors_add (a b : Nat) :
    vectors (a+b) = (vectors a).flatMap (fun p => (vectors b).map (p ++ ·)) := by
  induction a with
  | zero => simp [vectors]
  | succ a ih =>
    simp [Nat.succ_add, vectors, ih, List.flatMap_assoc,
      List.map_flatMap, List.flatMap_map, List.map_map]

theorem vectors_length (k : Nat) : (vectors k).length = 5^k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    simp [vectors, List.range_succ, ih, Nat.pow_succ]
    omega
#print axioms vectors_add
#print axioms vectors_length
end FourBranch
