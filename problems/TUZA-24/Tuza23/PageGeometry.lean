import Tuza23.BarePages

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem edges_disjoint_of_common_vertex {s t : Finset V} {a : V}
    (hcommon : ∀ x ∈ s, x ∈ t → x=a) : Disjoint (edges s) (edges t) := by
  apply disjoint_left.mpr
  intro e hes het
  have hsub : e ⊆ {a} := by
    intro x hx
    exact mem_singleton.mpr (hcommon x ((mem_edges.mp hes).1 hx) ((mem_edges.mp het).1 hx))
  have hc := card_le_card hsub
  rw [(mem_edges.mp hes).2,card_singleton] at hc
  omega

/-- Adjacent-base ordinary pages can share an edge only at the same apex.
The hypotheses concern actual old adjacencies, so outside vertices remain free. -/
theorem adjacent_pages_same_apex {H : SimpleGraph V} {a b c x y : V}
    (hbc : b ≠ c) (hnab : ¬ H.Adj a b) (hnac : ¬ H.Adj a c)
    (hax : H.Adj a x) (hbx : H.Adj b x)
    (hay : H.Adj a y) (hcy : H.Adj c y)
    (hshare : ¬ Disjoint (edges ({a,b,x} : Finset V)) (edges ({a,c,y} : Finset V))) : x=y := by
  by_contra hxy
  apply hshare
  apply edges_disjoint_of_common_vertex (a := a)
  intro z hz hz'
  simp only [mem_insert,mem_singleton] at hz hz'
  have hby : b ≠ y := by rintro rfl; exact hnab hay
  have hxc : x ≠ c := by rintro rfl; exact hnac hax
  rcases hz with rfl|rfl|rfl <;> rcases hz' with h|h|h <;> simp_all

/-- Disjoint-base pages sharing an edge both have their apex on the opposite
base. This is endpoint geometry, with no assumption on ambient graph order. -/
theorem disjoint_pages_apices {a b c d x y : V}
    (hbase : Disjoint ({a,b} : Finset V) {c,d})
    (hax : x ≠ a) (hbx : x ≠ b) (hcy : y ≠ c) (hdy : y ≠ d)
    (hshare : ¬ Disjoint (edges ({a,b,x} : Finset V)) (edges ({c,d,y} : Finset V))) :
    (x=c ∨ x=d) ∧ (y=a ∨ y=b) := by
  have hx : x=c ∨ x=d := by
    by_contra hn
    simp only [not_or] at hn
    apply hshare
    apply edges_disjoint_of_common_vertex (a := y)
    intro z hz hz'
    simp only [mem_insert,mem_singleton] at hz hz'
    rcases hz' with rfl|rfl|rfl
    · rcases hz with h|h|h
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp [h]) (by simp)).elim
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp [h]) (by simp)).elim
      · exact (hn.1 h.symm).elim
    · rcases hz with h|h|h
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp [h]) (by simp)).elim
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp [h]) (by simp)).elim
      · exact (hn.2 h.symm).elim
    · rfl
  have hy : y=a ∨ y=b := by
    by_contra hn
    simp only [not_or] at hn
    apply hshare
    apply edges_disjoint_of_common_vertex (a := x)
    intro z hz hz'
    simp only [mem_insert,mem_singleton] at hz hz'
    rcases hz with rfl|rfl|rfl
    · rcases hz' with h|h|h
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp) (by simp [h])).elim
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp) (by simp [h])).elim
      · exact (hn.1 h.symm).elim
    · rcases hz' with h|h|h
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp) (by simp [h])).elim
      · exact (disjoint_left.mp hbase (show z ∈ _ from by simp) (by simp [h])).elim
      · exact (hn.2 h.symm).elim
    · rfl
  exact ⟨hx,hy⟩

/-- An actual triangle cannot contain two disjoint two-element edges. -/
theorem no_triangle_two_disjoint_edges {G : SimpleGraph V} {e f t : Finset V}
    (he : e.card=2) (hf : f.card=2) (hef : Disjoint e f)
    (ht : t ∈ triangles G) (het : e ∈ edges t) (hft : f ∈ edges t) : False := by
  have hsub := union_subset (mem_edges.mp het).1 (mem_edges.mp hft).1
  have hc := card_le_card hsub
  rw [card_union_of_disjoint hef,he,hf,(mem_triangles.mp ht).card_eq] at hc
  omega

end Tuza23
