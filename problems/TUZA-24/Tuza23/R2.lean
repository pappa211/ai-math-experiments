import Tuza23.AdjacentRestoration
import Tuza23.DisjointRestoration

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem pair_of_card_two_mem {e : Finset V} (he : e.card=2) {a : V} (ha : a∈e) :
    ∃ b, a≠b ∧ e={a,b} := by
  obtain ⟨x,y,hxy,rfl⟩ := card_eq_two.mp he
  simp only [mem_insert,mem_singleton] at ha
  rcases ha with rfl|rfl
  · exact ⟨y,hxy,rfl⟩
  · exact ⟨x,hxy.symm,by rw [pair_comm]⟩

/-- Arbitrary two-edge equality restoration, at all finite graph orders.
F consists of distinct old nonedges. All actual triangles, including crossing
triangles and arbitrary attachments, are included in the exported statement. -/
theorem r2 (H : SimpleGraph V) (F : Finset (Finset V))
    (hF : Nonedges H F) (hcard : F.card ≤ 2) (hB : B H)
    (htight : tau (triangles (addEdges H F)) = 2 * nu (triangles (addEdges H F))) :
    B (addEdges H F) := by
  classical
  by_cases hnew : ∃ t ∈ triangles (addEdges H F), t ∉ triangles H
  · obtain ⟨hsize,hnu,htau⟩ := tight_two_insertion_increment hB hF hcard hnew htight
    obtain ⟨e,f,hef,rfl⟩ := card_eq_two.mp hsize
    have he := hF e (by simp)
    have hf := hF f (by simp)
    by_cases hd : Disjoint e f
    · obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he.1
      obtain ⟨c,d,hcd,rfl⟩ := card_eq_two.mp hf.1
      have hnab : ¬ H.Adj a b := by
        intro h; apply he.2
        exact ⟨by simpa [SimpleGraph.isClique_pair,hab] using h,by simp [hab]⟩
      have hncd : ¬ H.Adj c d := by
        intro h; apply hf.2
        exact ⟨by simpa [SimpleGraph.isClique_pair,hcd] using h,by simp [hcd]⟩
      exact disjoint_tight_restoration hB hab hcd hd hnab hncd hnu htau
    · obtain ⟨a,hae,haf⟩ := not_disjoint_iff.mp hd
      obtain ⟨b,hab,rfl⟩ := pair_of_card_two_mem he.1 hae
      obtain ⟨c,hac,rfl⟩ := pair_of_card_two_mem hf.1 haf
      have hbc : b≠c := by intro h; apply hef; rw [h]
      have hnab : ¬ H.Adj a b := by
        intro h; apply he.2
        exact ⟨by simpa [SimpleGraph.isClique_pair,hab] using h,by simp [hab]⟩
      have hnac : ¬ H.Adj a c := by
        intro h; apply hf.2
        exact ⟨by simpa [SimpleGraph.isClique_pair,hac] using h,by simp [hac]⟩
      exact (adjacent_tight_impossible hB hab hac hbc hnab hnac hnu htau).elim
  · apply B_of_no_new_triangle hB
    intro t ht
    by_contra hold
    exact hnew ⟨t,ht,hold⟩

end Tuza23
