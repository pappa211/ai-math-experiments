import Tuza06.FiniteAugmentation
namespace Tuza06.DenseLinkThree
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
-- Exact ordinary manuscript Section 5.1 local certificate; hub label 0.
def N : Finset (Fin 6) := {1,2,3,4,5}
def M : Finset (Finset (Fin 6)) := {{1,3},{2,4}}
def Q : Finset (Fin 6) := {1,5}
def BadG : Finset (Finset (Fin 6)) := {{1,2},{2,3},{3,4},{4,5}}
def Aug : Finset (Finset (Fin 6)) := {{1,3,5},{0,1,4},{0,2,5}}
def D : Finset (Finset (Fin 6)) := {{1,5},{3,5},{1,4},{2,5}}
def BadH : Finset (Finset (Fin 6)) := BadG ∪ M
private theorem aug_independent : Independent Aug := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥Aug, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem old : ∀ p : ↥Aug, ∀ e : ↥(edges p.val),
    (0 : Fin 6) ∉ e.val → e.val ∉ M → e.val ∈ D := by decide
private theorem footprint_check : ∀ J : ↥((univ : Finset (Fin 6)).powerset),
    (∀ a b : ↥J.val, a.val ≠ b.val → ({a.val,b.val} : Finset (Fin 6)) ∉ BadH) →
    (D ∩ edges J.val).card ≤ 2 ∧ ∃ a : Fin 6, ∀ e : ↥(D ∩ edges J.val), a ∈ e.val := by
  decide

def witness : FiniteAugmentation (Fin 6) where
  hub := 0
  N := N
  M := M
  Q := Q
  BadG := BadG
  Aug := Aug
  D := D
  BadH := BadH
  rim_neighbors := fun e he => (by decide : ∀ e : ↥M, e.val ⊆ N) ⟨e,he⟩
  matching := fun e he f hf hef => (by decide : ∀ e f : ↥M, e.val ≠ f.val → Disjoint e.val f.val) ⟨e,he⟩ ⟨f,hf⟩ hef
  link_cover := by decide
  m_nonempty := by decide
  cover_size := by decide
  independent := aug_independent
  gain := by decide
  old_edges := fun p hp e he => old ⟨p,hp⟩ ⟨e,he⟩
  residual_missing := by
    intro a b he
    rcases mem_union.mp he with hg | hm
    · exact Or.inr (Or.inr (Or.inr hg))
    · exact Or.inl hm
  footprints := by
    intro J hJ
    obtain ⟨hc,a,ha⟩ := footprint_check J (fun a b hab => hJ a.val a.property b.val b.property hab)
    exact ⟨hc,a,fun e he => ha ⟨e,he⟩⟩

/-- This concrete dense-link pattern is excluded in any actual minimal combined
obstruction; RealizesAugmentation spells out only local graph adjacency facts. -/
theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 6 ↪ V) (hr : RealizesAugmentation witness G i) : False :=
  minimal_no_finite_augmentation witness hG i hr
end Tuza06.DenseLinkThree
