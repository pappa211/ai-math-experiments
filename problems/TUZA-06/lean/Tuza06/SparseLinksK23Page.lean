import Tuza06.FiniteAugmentation
namespace Tuza06.SparseLinksK23Page
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
-- Exact sparse-link external-page certificate. Hub0, link1..5, arbitrary apex6.
def N : Finset (Fin 7) := {1,2,3,4,5}
def M : Finset (Finset (Fin 7)) := {{1,3},{2,4}}
def Q : Finset (Fin 7) := {1,2}
def BadG : Finset (Finset (Fin 7)) := {{1,2},{3,4},{3,5},{4,5},{0,6}}
def Aug : Finset (Finset (Fin 7)) := {{1,3,6},{0,1,4},{0,2,5}}
def D : Finset (Finset (Fin 7)) := {{1,4},{2,5},{1,6},{3,6}}
def BadH : Finset (Finset (Fin 7)) := BadG ∪ M
private theorem aug_independent : Independent Aug := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥Aug, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem old : ∀ p : ↥Aug, ∀ e : ↥(edges p.val),
    (0 : Fin 7) ∉ e.val → e.val ∉ M → e.val ∈ D := by decide
private def Dsmall : Finset (Finset (Fin 6)) := {{0,3},{1,4},{0,5},{2,5}}
private def BadSmall : Finset (Finset (Fin 6)) := {{0,1},{2,3},{2,4},{3,4},{0,2},{1,3}}
private def shift : Fin 6 ↪ Fin 7 := ⟨Fin.succ,Fin.succ_injective 6⟩
private def patternGraph : SimpleGraph (Fin 7) where
  Adj a b := a ≠ b ∧ ({a,b} : Finset (Fin 7)) ∉ BadH
  symm := ⟨fun _ _ h => ⟨h.1.symm,by simpa only [pair_comm] using h.2⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩
private theorem footprint_small : ∀ J : ↥((univ : Finset (Fin 6)).powerset),
    (∀ a b : ↥J.val, a.val ≠ b.val → ({a.val,b.val} : Finset (Fin 6)) ∉ BadSmall) →
    (Dsmall ∩ edges J.val).card ≤ 2 ∧ ∃ a : Fin 6, ∀ e : ↥(Dsmall ∩ edges J.val), a ∈ e.val := by decide
private theorem shift_D : liftFamily shift Dsmall = D := by decide
private theorem shift_bad : ∀ a b : Fin 6,
    ({a,b} : Finset (Fin 6)) ∈ BadSmall → ({shift a,shift b} : Finset (Fin 7)) ∈ BadH := by decide
private theorem footprint_check : ∀ J : ↥((univ : Finset (Fin 7)).powerset),
    (∀ a b : ↥J.val, a.val ≠ b.val → ({a.val,b.val} : Finset (Fin 7)) ∉ BadH) →
    (D ∩ edges J.val).card ≤ 2 ∧ ∃ a : Fin 7, ∀ e : ↥(D ∩ edges J.val), a ∈ e.val := by
  intro J hJ
  have hk : patternGraph.IsClique (J.val : Set (Fin 7)) := by
    intro a ha b hb hab
    exact ⟨hab,hJ ⟨a,ha⟩ ⟨b,hb⟩ hab⟩
  have hBad : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ BadSmall → ¬ patternGraph.Adj (shift a) (shift b) := by
    intro a b he hadj
    exact hadj.2 (shift_bad a b he)
  have hcert : ∀ L : ↥((univ : Finset (Fin 6)).powerset),
      (∀ a ∈ L.val, ∀ b ∈ L.val, a ≠ b → ({a,b} : Finset (Fin 6)) ∉ BadSmall) →
      (Dsmall ∩ edges L.val).card ≤ 2 ∧ ∃ a : Fin 6, ∀ e ∈ Dsmall ∩ edges L.val, a ∈ e := by
    intro L hL
    obtain ⟨hc,a,ha⟩ := footprint_small L (fun a b hab => hL a.val a.property b.val b.property hab)
    exact ⟨hc,a,fun e he => ha ⟨e,he⟩⟩
  have hfoot := footprint_of_pattern shift Dsmall BadSmall hBad hcert hk
  rw [shift_D] at hfoot
  obtain ⟨hc,a,ha⟩ := hfoot
  exact ⟨hc,a,fun e => ha e.val e.property⟩

def witness : FiniteAugmentation (Fin 7) where
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

/-- This concrete sparse-link external page is excluded in any actual minimal combined
obstruction; RealizesAugmentation spells out only local graph adjacency facts. -/
theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 7 ↪ V) (hr : RealizesAugmentation witness G i) : False :=
  minimal_no_finite_augmentation witness hG i hr
end Tuza06.SparseLinksK23Page
