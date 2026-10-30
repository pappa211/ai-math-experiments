import Tuza06.MultiReduction
namespace Tuza06.DominatingNearSix
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2000000
-- One specified local neighborhood reduction; no graph census or outside enumeration.
def U : Finset (Fin 7) := {0,1}
def X : Finset (Finset (Fin 7)) := {{0,1},{0,6},{2,4},{2,5},{3,4},{3,5},{4,5}}
def P : Finset (Finset (Fin 7)) := {{2,0,1},{2,4,5},{3,0,5},{3,4,1}}
def Upper : Finset (Finset (Fin 7)) := {{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{1,2},{1,3},{1,4},{1,5},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{5,6}}
private theorem ind : Independent P := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥P, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem cover_check : ∀ t : ↥((univ : Finset (Fin 7)).powersetCard 3),
    edges t.val ⊆ Upper → ¬ Disjoint t.val U → ∃ e : ↥X, e.val ∈ edges t.val := by decide
private theorem old_check : ∀ p : ↥P, ∀ e : ↥(edges p.val), Disjoint e.val U → e.val ∈ X := by decide

def witness : FiniteReduction (Fin 7) where
  U := U
  X := X
  P := P
  Upper := Upper
  independent := ind
  nonempty := by decide
  cover := by
    intro t ht hu
    obtain ⟨e,he⟩ := cover_check t ht hu
    exact ⟨e.val,e.property,he⟩
  old_edges := fun p hp e he => old_check ⟨p,hp⟩ ⟨e,he⟩

/-- Strict local exclusion under actual center-neighborhood and packing facts. -/
theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 7 ↪ V) (hr : RealizesReduction witness G i) : False :=
  minimal_no_finite_strict_reduction witness hG i hr (by decide)
end Tuza06.DominatingNearSix
