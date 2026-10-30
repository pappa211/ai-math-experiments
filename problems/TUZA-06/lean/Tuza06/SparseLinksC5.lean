import Tuza06.SparseLinksPage

namespace Tuza06.SparseLinksC5
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000

def E : Finset (Finset (Fin 6)) := {{0,1},{0,2},{0,3},{0,4},{0,5},{1,2},{2,3},{3,4},{4,5},{1,5}}
private def base : Finset (Fin 6) := {1,2}
private def oldM : Finset (Finset (Fin 6)) := {{1,2},{3,4}}
private def oldBad : Finset (Finset (Fin 6)) := {{1,3},{1,4},{2,4},{2,5},{3,5}}
private def oldAug : Finset (Finset (Fin 6)) := {{0,2,3},{0,4,5}}

def pattern : SparsePagePattern where
  augmentation := SparseLinksC5Page.witness
  E := E
  base := base
  oldM := oldM
  oldBad := oldBad
  oldAug := oldAug
  hub_eq := by decide
  N_eq := by decide
  M_eq := by decide
  Bad_eq := by decide
  Aug_eq := by decide
  base_two := by decide
  base_edge := by decide
  M_edges := fun e he => (by decide : ∀ e : ↥oldM, e.val.card = 2 ∧ e.val ∈ E) ⟨e,he⟩
  bad_edges := fun e he => (by decide : ∀ e : ↥oldBad, e.val.card = 2 ∧ e.val ∉ E) ⟨e,he⟩
  aug_triangles := fun t ht => (by decide : ∀ t : ↥oldAug, t.val ∈ coreFamily E) ⟨t,ht⟩
  hub_triangle := by decide
  internal_unique := by decide

/-- This entire five-vertex link is excluded in arbitrary finite ambient graphs,
with no restriction on outside attachments beyond the exact hub neighborhood. -/
theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 6 ↪ V) (hr : FiveLinkConfiguration G i E) : False :=
  SparsePagePattern.excluded pattern hG i hr

end Tuza06.SparseLinksC5

#check @Tuza06.SparseLinksC5.excluded
#print axioms Tuza06.SparseLinksC5.excluded
