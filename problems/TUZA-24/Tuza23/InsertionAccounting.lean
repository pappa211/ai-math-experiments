import Tuza23.PageAssembly

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem independent_nonedge {H : SimpleGraph V} {e : Finset V}
    (he : e.card = 2) (hne : ¬ H.IsNClique 2 e) : IndependentVertices H e := by
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he
  have hn : ¬ H.Adj a b := by
    intro h
    apply hne
    exact ⟨by simpa [SimpleGraph.isClique_pair,hab] using h,by simp [hab]⟩
  intro x hx y hy hxy
  simp only [mem_insert,mem_singleton] at hx hy
  rcases hx with rfl|rfl <;> rcases hy with rfl|rfl
  · exact H.irrefl hxy
  · exact hn hxy
  · exact hn hxy.symm
  · exact H.irrefl hxy

theorem insertion_packing_gain {H : SimpleGraph V} {F : Finset (Finset V)}
    (hB : B H) (hF : Nonedges H F)
    (hnew : ∃ t ∈ triangles (addEdges H F), t ∉ triangles H) :
    nu (triangles H) + 1 ≤ nu (triangles (addEdges H F)) := by
  obtain ⟨t,ht,hold⟩ := hnew
  obtain ⟨e,he,het⟩ := new_triangle_has_added_edge ht hold
  exact one_triangle_augmentation (le_addEdges H F) hB
    (independent_nonedge (hF e he).1 (hF e he).2) ht
    ⟨e,by rw [two_vertex_edges (hF e he).1]; simp,het⟩

theorem tight_two_insertion_increment {H : SimpleGraph V} {F : Finset (Finset V)}
    (hB : B H) (hF : Nonedges H F) (hcard : F.card ≤ 2)
    (hnew : ∃ t ∈ triangles (addEdges H F), t ∉ triangles H)
    (htight : tau (triangles (addEdges H F)) = 2 * nu (triangles (addEdges H F))) :
    F.card = 2 ∧ nu (triangles (addEdges H F)) = nu (triangles H) + 1 ∧
      tau (triangles (addEdges H F)) = 2 * nu (triangles H) + 2 := by
  have hgain := insertion_packing_gain hB hF hnew
  have hupper := insertion_cover_bound H F
  have hbase := componentCliques_equality hB
  omega

theorem B_of_no_new_triangle {H : SimpleGraph V} {F : Finset (Finset V)}
    (hB : B H) (hno : ∀ t ∈ triangles (addEdges H F), t ∈ triangles H) :
    B (addEdges H F) := by
  have ht : triangles (addEdges H F) = triangles H :=
    subset_antisymm hno (triangles_mono_graph (le_addEdges H F))
  exact (componentCliques_of_triangles_eq ht).mpr hB

theorem r2_at_most_one {H : SimpleGraph V} {F : Finset (Finset V)}
    (hB : B H) (hF : Nonedges H F) (hcard : F.card ≤ 1)
    (htight : tau (triangles (addEdges H F)) = 2 * nu (triangles (addEdges H F))) :
    B (addEdges H F) := by
  apply B_of_no_new_triangle hB
  intro t ht
  by_contra hold
  have hi := tight_two_insertion_increment hB hF (by omega) ⟨t,ht,hold⟩ htight
  omega

end Tuza23
