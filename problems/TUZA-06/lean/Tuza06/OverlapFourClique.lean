import Tuza06.MultiReduction
namespace Tuza06.OverlapFourClique
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
-- Exact ordinary Section7 local pattern. No restriction on noncentral attachments.
def U : Finset (Fin 8) := {0,1}
def X : Finset (Finset (Fin 8)) := {{0,6},{1,7},{2,3},{2,4},{2,5},{3,4},{3,5},{4,5}}
def P : Finset (Finset (Fin 8)) := {{0,2,4},{0,3,5},{1,2,5},{1,3,4}}
def Upper : Finset (Finset (Fin 8)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{1,2},{1,3},{1,4},{1,5},{1,7},{2,3},{2,4},{2,5},{2,6},{2,7},{3,4},{3,5},{3,6},{3,7},{4,5},{4,6},{4,7},{5,6},{5,7},{6,7}}
private theorem ind : Independent P := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥P, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem cover_check : ∀ t : ↥((univ : Finset (Fin 8)).powersetCard 3),
    edges t.val ⊆ Upper → ¬ Disjoint t.val U → ∃ e : ↥X, e.val ∈ edges t.val := by decide
private theorem old_check : ∀ p : ↥P, ∀ e : ↥(edges p.val), Disjoint e.val U → e.val ∈ X := by decide

def witness : FiniteReduction (Fin 8) where
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

def Aug : Finset (Finset (Fin 8)) := {{0,2,4},{0,3,5},{1,2,5},{1,3,4},{6,2,3}}
def D : Finset (Finset (Fin 8)) := {{2,6},{3,6}}
def A : Finset (Fin 8) := {2,3,4,5}
private theorem aug_ind : Independent Aug := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥Aug, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem old_aug : ∀ p : ↥Aug, ∀ e : ↥(edges p.val), Disjoint e.val U → e.val ∉ X → e.val ∈ D := by decide
private theorem terminal_check : ∀ e : ↥D, ∃ a : ↥A, a.val ∈ e.val := by decide
private theorem degree_check : ∀ a : ↥A, (D.filter (fun e => a.val ∈ e)).card ≤ 2 := by decide

theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 8 ↪ V) (hr : RealizesReduction witness G i)
    (hAug : liftFamily i Aug ⊆ triangles G) : False := by
  apply minimal_no_terminal_augmentation witness hG i hr (by decide) Aug D A aug_ind hAug (by decide)
  · exact fun p hp e he => old_aug ⟨p,hp⟩ ⟨e,he⟩
  · decide
  · intro e he
    obtain ⟨a,ha⟩ := terminal_check ⟨e,he⟩
    exact ⟨a.val,a.property,ha⟩
  · exact fun a ha => degree_check ⟨a,ha⟩
end Tuza06.OverlapFourClique
