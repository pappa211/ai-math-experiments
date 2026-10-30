import Tuza06.MultiReduction
namespace Tuza06.OverlapThreeOutsidePair
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000
-- Exact ordinary Section7 local pattern. No restriction on noncentral attachments.
def U : Finset (Fin 9) := {0,1}
def X : Finset (Finset (Fin 9)) := {{0,5},{0,6},{2,3},{2,4},{2,7},{2,8},{3,4},{3,5},{3,7},{3,8},{4,7},{4,8}}
def P : Finset (Finset (Fin 9)) := {{7,2,1},{7,4,3},{8,2,3},{8,4,1},{0,2,4},{0,5,3}}
def Upper : Finset (Finset (Fin 9)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{1,2},{1,3},{1,4},{1,7},{1,8},{2,3},{2,4},{2,5},{2,6},{2,7},{2,8},{3,4},{3,5},{3,6},{3,7},{3,8},{4,5},{4,6},{4,7},{4,8},{5,6},{5,7},{5,8},{6,7},{6,8}}
private theorem ind : Independent P := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥P, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem cover_0_0 : ∀ b : Fin 9, ({0,0,b} : Finset (Fin 9)).card = 3 →
    edges ({0,0,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,0,b} : Finset (Fin 9)) := by decide
private theorem cover_0_1 : ∀ b : Fin 9, ({0,1,b} : Finset (Fin 9)).card = 3 →
    edges ({0,1,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,1,b} : Finset (Fin 9)) := by decide
private theorem cover_0_2 : ∀ b : Fin 9, ({0,2,b} : Finset (Fin 9)).card = 3 →
    edges ({0,2,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,2,b} : Finset (Fin 9)) := by decide
private theorem cover_0_3 : ∀ b : Fin 9, ({0,3,b} : Finset (Fin 9)).card = 3 →
    edges ({0,3,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,3,b} : Finset (Fin 9)) := by decide
private theorem cover_0_4 : ∀ b : Fin 9, ({0,4,b} : Finset (Fin 9)).card = 3 →
    edges ({0,4,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,4,b} : Finset (Fin 9)) := by decide
private theorem cover_0_5 : ∀ b : Fin 9, ({0,5,b} : Finset (Fin 9)).card = 3 →
    edges ({0,5,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,5,b} : Finset (Fin 9)) := by decide
private theorem cover_0_6 : ∀ b : Fin 9, ({0,6,b} : Finset (Fin 9)).card = 3 →
    edges ({0,6,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,6,b} : Finset (Fin 9)) := by decide
private theorem cover_0_7 : ∀ b : Fin 9, ({0,7,b} : Finset (Fin 9)).card = 3 →
    edges ({0,7,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,7,b} : Finset (Fin 9)) := by decide
private theorem cover_0_8 : ∀ b : Fin 9, ({0,8,b} : Finset (Fin 9)).card = 3 →
    edges ({0,8,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,8,b} : Finset (Fin 9)) := by decide
private theorem cover_0 : ∀ a b : Fin 9, ({0,a,b} : Finset (Fin 9)).card = 3 →
    edges ({0,a,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({0,a,b} : Finset (Fin 9)) := by
  intro a
  fin_cases a
  · exact cover_0_0
  · exact cover_0_1
  · exact cover_0_2
  · exact cover_0_3
  · exact cover_0_4
  · exact cover_0_5
  · exact cover_0_6
  · exact cover_0_7
  · exact cover_0_8
private theorem cover_1_0 : ∀ b : Fin 9, ({1,0,b} : Finset (Fin 9)).card = 3 →
    edges ({1,0,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,0,b} : Finset (Fin 9)) := by decide
private theorem cover_1_1 : ∀ b : Fin 9, ({1,1,b} : Finset (Fin 9)).card = 3 →
    edges ({1,1,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,1,b} : Finset (Fin 9)) := by decide
private theorem cover_1_2 : ∀ b : Fin 9, ({1,2,b} : Finset (Fin 9)).card = 3 →
    edges ({1,2,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,2,b} : Finset (Fin 9)) := by decide
private theorem cover_1_3 : ∀ b : Fin 9, ({1,3,b} : Finset (Fin 9)).card = 3 →
    edges ({1,3,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,3,b} : Finset (Fin 9)) := by decide
private theorem cover_1_4 : ∀ b : Fin 9, ({1,4,b} : Finset (Fin 9)).card = 3 →
    edges ({1,4,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,4,b} : Finset (Fin 9)) := by decide
private theorem cover_1_5 : ∀ b : Fin 9, ({1,5,b} : Finset (Fin 9)).card = 3 →
    edges ({1,5,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,5,b} : Finset (Fin 9)) := by decide
private theorem cover_1_6 : ∀ b : Fin 9, ({1,6,b} : Finset (Fin 9)).card = 3 →
    edges ({1,6,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,6,b} : Finset (Fin 9)) := by decide
private theorem cover_1_7 : ∀ b : Fin 9, ({1,7,b} : Finset (Fin 9)).card = 3 →
    edges ({1,7,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,7,b} : Finset (Fin 9)) := by decide
private theorem cover_1_8 : ∀ b : Fin 9, ({1,8,b} : Finset (Fin 9)).card = 3 →
    edges ({1,8,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,8,b} : Finset (Fin 9)) := by decide
private theorem cover_1 : ∀ a b : Fin 9, ({1,a,b} : Finset (Fin 9)).card = 3 →
    edges ({1,a,b} : Finset (Fin 9)) ⊆ Upper → ∃ e : ↥X, e.val ∈ edges ({1,a,b} : Finset (Fin 9)) := by
  intro a
  fin_cases a
  · exact cover_1_0
  · exact cover_1_1
  · exact cover_1_2
  · exact cover_1_3
  · exact cover_1_4
  · exact cover_1_5
  · exact cover_1_6
  · exact cover_1_7
  · exact cover_1_8
private theorem cover_check : ∀ t : ↥((univ : Finset (Fin 9)).powersetCard 3),
    edges t.val ⊆ Upper → ¬ Disjoint t.val U → ∃ e : ↥X, e.val ∈ edges t.val := by
  intro t ht hu
  obtain ⟨v,hvt,hvU⟩ := not_disjoint_iff.mp hu
  have hec : (t.val.erase v).card = 2 := by
    rw [card_erase_of_mem hvt,(mem_powersetCard.mp t.property).2]
  obtain ⟨a,b,hab,hrest⟩ := card_eq_two.mp hec
  have hteq : t.val = {v,a,b} := by
    calc
      t.val = insert v (t.val.erase v) := (insert_erase hvt).symm
      _ = {v,a,b} := by rw [hrest]
  have h3 : ({v,a,b} : Finset (Fin 9)).card = 3 := by rw [← hteq];exact (mem_powersetCard.mp t.property).2
  have hUpper : edges ({v,a,b} : Finset (Fin 9)) ⊆ Upper := hteq ▸ ht
  simp only [U,mem_insert,mem_singleton] at hvU
  rcases hvU with rfl | rfl
  · simpa only [hteq] using cover_0 a b h3 hUpper
  · simpa only [hteq] using cover_1 a b h3 hUpper
private theorem old_check : ∀ p : ↥P, ∀ e : ↥(edges p.val), Disjoint e.val U → e.val ∈ X := by decide

def witness : FiniteReduction (Fin 9) where
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

def Aug : Finset (Finset (Fin 9)) := {{7,2,1},{7,4,3},{8,2,3},{8,4,1},{5,2,4},{0,5,3},{0,6,2}}
def D : Finset (Finset (Fin 9)) := {{2,5},{2,6},{4,5}}
def A : Finset (Fin 9) := {2,4}
private theorem aug_ind : Independent Aug := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥Aug, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem old_aug : ∀ p : ↥Aug, ∀ e : ↥(edges p.val), Disjoint e.val U → e.val ∉ X → e.val ∈ D := by decide
private theorem terminal_check : ∀ e : ↥D, ∃ a : ↥A, a.val ∈ e.val := by decide
private theorem degree_check : ∀ a : ↥A, (D.filter (fun e => a.val ∈ e)).card ≤ 2 := by decide

theorem excluded {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 9 ↪ V) (hr : RealizesReduction witness G i)
    (hAug : liftFamily i Aug ⊆ triangles G) : False := by
  apply minimal_no_terminal_augmentation witness hG i hr (by decide) Aug D A aug_ind hAug (by decide)
  · exact fun p hp e he => old_aug ⟨p,hp⟩ ⟨e,he⟩
  · decide
  · intro e he
    obtain ⟨a,ha⟩ := terminal_check ⟨e,he⟩
    exact ⟨a.val,a.property,ha⟩
  · exact fun a ha => degree_check ⟨a,ha⟩
end Tuza06.OverlapThreeOutsidePair
