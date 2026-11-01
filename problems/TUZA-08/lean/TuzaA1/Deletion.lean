import Tuza.Graph

namespace Tuza06
open Finset Tuza
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Deletion of a finite graph-edge family on the same arbitrary vertex type. -/
def removeEdgeFamily (G : SimpleGraph V) (D : Finset (Finset V)) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ ({a,b} : Finset V) ∉ D
  symm := ⟨fun _ _ h => ⟨h.1.symm,by simpa only [pair_comm] using h.2⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem removeEdgeFamily_le (G : SimpleGraph V) (D : Finset (Finset V)) :
    removeEdgeFamily G D ≤ G := fun _ _ h => h.1

theorem removeEdgeFamily_lost {G : SimpleGraph V} {D : Finset (Finset V)} {t : Finset V}
    (ht : t ∈ triangles G) (hnot : t ∉ triangles (removeEdgeFamily G D)) :
    ∃ e ∈ D, e ∈ edges t := by
  by_contra hn
  apply hnot
  refine mem_triangles.mpr ⟨?_,(mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp ht).isClique ha hb hab,?_⟩
  intro heD
  exact hn ⟨{a,b},heD,mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff,Finset.mem_coe] using And.intro ha hb,by simp [hab]⟩⟩

theorem removeEdgeFamily_surviving {G : SimpleGraph V} {D : Finset (Finset V)} {t e : Finset V}
    (ht : t ∈ triangles (removeEdgeFamily G D)) (he : e ∈ edges t) : e ∉ D := by
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp he).2
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have h := ((mem_triangles.mp ht).isClique ((mem_edges.mp he).1 ha)
    ((mem_edges.mp he).1 hb) hab).2
  simpa [heq] using h


end Tuza06
