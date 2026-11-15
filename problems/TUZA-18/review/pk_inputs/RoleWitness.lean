import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Union

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Tuza18Role

abbrev Edge := Nat × Nat
abbrev Triangle := Finset Edge

def graphEdges : Finset Edge :=
  {(0,1),(0,4),(0,5),(1,4),(1,5),(2,4),(2,5),(3,4),(3,5),(4,5)}

def tri (a b c : Nat) : Triangle := {(a,b),(a,c),(b,c)}

-- Enumerate every unordered vertex triple, testing all three actual graph edges.
def actualTriangles : Finset Triangle :=
  (Finset.range 6).biUnion fun a =>
  (Finset.range 6).biUnion fun b =>
  (Finset.range 6).biUnion fun c =>
    if a < b ∧ b < c ∧ tri a b c ⊆ graphEdges then {tri a b c} else ∅

def literalTriangles : Finset Triangle :=
  {tri 0 1 4, tri 0 1 5, tri 0 4 5, tri 1 4 5, tri 2 4 5, tri 3 4 5}

def packing (P : Finset Triangle) : Prop :=
  ∀ t ∈ P, ∀ u ∈ P, t ≠ u → t ∩ u = ∅

instance (P : Finset Triangle) : Decidable (packing P) := inferInstanceAs
  (Decidable (∀ t ∈ P, ∀ u ∈ P, t ≠ u → t ∩ u = ∅))

def packings : Finset (Finset Triangle) := actualTriangles.powerset.filter packing

def support (P : Finset Triangle) : Finset Edge := P.biUnion id
def verts (T : Triangle) : Finset Nat := T.biUnion fun e => {e.1,e.2}
def usedVerts (P : Finset Triangle) : Finset Nat := P.biUnion verts

def privateBases (T : Triangle) (P : Finset Triangle) : Finset Edge :=
  T.filter fun e => ∃ Q ∈ actualTriangles, Q ≠ T ∧ Q ∩ support P = {e}

def roleCollision (P : Finset Triangle) : Prop :=
  ∃ T ∈ P, ∃ U ∈ P, T ≠ U ∧
    ∃ e ∈ privateBases T P, ∃ f ∈ privateBases U P,
      ((verts T \ {e.1,e.2}) ∩ {f.1,f.2}).Nonempty

instance (P : Finset Triangle) : Decidable (roleCollision P) := inferInstanceAs
  (Decidable (∃ T ∈ P, ∃ U ∈ P, T ≠ U ∧
    ∃ e ∈ privateBases T P, ∃ f ∈ privateBases U P,
      ((verts T \ {e.1,e.2}) ∩ {f.1,f.2}).Nonempty))

def covers (C : Finset Edge) : Prop :=
  ∀ T ∈ actualTriangles, (T ∩ C).Nonempty

instance (C : Finset Edge) : Decidable (covers C) := inferInstanceAs
  (Decidable (∀ T ∈ actualTriangles, (T ∩ C).Nonempty))

def witnessPacking : Finset Triangle := {tri 0 1 4, tri 2 4 5}
def witnessCover : Finset Edge := {(0,1),(4,5)}

theorem every_actual_triangle : actualTriangles = literalTriangles := by decide

theorem packing_upper_bound : ∀ P ∈ packings, P.card ≤ 2 := by
  simp only [packings, every_actual_triangle]
  decide

theorem packing_attained : witnessPacking ∈ packings ∧ witnessPacking.card = 2 := by
  simp only [packings, every_actual_triangle]
  decide

theorem cover_attained : witnessCover ⊆ graphEdges ∧ covers witnessCover ∧
    witnessCover.card = 2 := by
  simp only [covers, every_actual_triangle]
  decide

def smallCoverCandidates : Finset (Finset Edge) :=
  {∅} ∪ graphEdges.image (fun e => {e})

theorem no_small_cover : ∀ C ∈ smallCoverCandidates, ¬ covers C := by
  simp only [covers, every_actual_triangle]
  decide

theorem cover_lower_bound (C : Finset Edge) (hsub : C ⊆ graphEdges)
    (hcov : covers C) : 2 ≤ C.card := by
  by_contra hn
  have hcard : C.card ≤ 1 := Nat.le_of_lt_succ (Nat.lt_of_not_ge hn)
  have hsmall : C ∈ smallCoverCandidates := by
    rcases C.eq_empty_or_nonempty with he | ⟨e, he⟩
    · rw [he]
      exact Finset.mem_union.mpr (Or.inl (Finset.mem_singleton.mpr rfl))
    · have hs : C = {e} := by
        apply Finset.ext
        intro f
        constructor
        · intro hf
          exact Finset.mem_singleton.mpr ((Finset.card_le_one.mp hcard) f hf e he)
        · intro hf
          have hfe := Finset.mem_singleton.mp hf
          simpa [hfe] using he
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_image.mpr ⟨e, hsub he, hs.symm⟩))
  exact no_small_cover C hsmall hcov

theorem graph_packing_bound (P : Finset Triangle) (hsub : P ⊆ actualTriangles)
    (hdis : packing P) : P.card ≤ 2 :=
  packing_upper_bound P (Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr hsub,hdis⟩)

theorem canonical_simple_edges :
    ∀ e ∈ graphEdges, e.1 < e.2 ∧ e.2 < 6 := by decide

-- Every maximum packing is type1, uses five vertices, and has incompatible roles.
theorem all_maximum_packings_obstruct_roles :
    ∀ P ∈ packings, P.card = 2 →
      (∀ T ∈ P, (privateBases T P).card = 1) ∧
      (usedVerts P).card = 5 ∧ roleCollision P := by
  simp only [packings, privateBases, roleCollision, every_actual_triangle]
  decide

#print axioms every_actual_triangle
#print axioms packing_upper_bound
#print axioms packing_attained
#print axioms cover_attained
#print axioms no_small_cover
#print axioms cover_lower_bound
#print axioms graph_packing_bound
#print axioms canonical_simple_edges
#print axioms all_maximum_packings_obstruct_roles

end Tuza18Role
