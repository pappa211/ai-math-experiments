import Tuza06.Reduction
import Tuza06.Pages

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Delete every edge incident with U and every edge inside A, retaining the
ambient vertex type so arbitrary outside attachments remain in the graph. -/
def prune (G : SimpleGraph V) (U A : Finset V) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ a ∉ U ∧ b ∉ U ∧ ¬ (a ∈ A ∧ b ∈ A)
  symm := ⟨fun _ _ h => ⟨h.1.symm, h.2.2.1, h.2.1, fun hh => h.2.2.2 ⟨hh.2, hh.1⟩⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem prune_le (G : SimpleGraph V) (U A : Finset V) : prune G U A ≤ G := fun _ _ h => h.1

theorem prune_independent (G : SimpleGraph V) (U A : Finset V) :
    IndependentVertices (prune G U A) A := fun _ ha _ hb h => h.2.2.2 ⟨ha, hb⟩

theorem prune_triangle_disjoint {G : SimpleGraph V} {U A t : Finset V}
    (ht : t ∈ triangles (prune G U A)) : Disjoint t U := by
  apply disjoint_left.mpr
  intro a ha hU
  obtain ⟨b, hb, hba⟩ := exists_mem_ne (by rw [(mem_triangles.mp ht).card_eq]; decide : 1 < t.card) a
  exact ((mem_triangles.mp ht).isClique ha hb hba.symm).2.1 hU

theorem prune_triangle_avoids_A {G : SimpleGraph V} {U A t : Finset V}
    (ht : t ∈ triangles (prune G U A)) : Disjoint (edges t) (edges A) := by
  apply disjoint_left.mpr
  intro e het heA
  obtain ⟨a, b, hab, heq⟩ := card_eq_two.mp (mem_edges.mp het).2
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  exact ((mem_triangles.mp ht).isClique ((mem_edges.mp het).1 ha)
    ((mem_edges.mp het).1 hb) hab).2.2.2 ⟨(mem_edges.mp heA).1 ha, (mem_edges.mp heA).1 hb⟩

/-- Exhaustive symbolic loss classification for the deletion. -/
theorem prune_lost_triangle {G : SimpleGraph V} {U A t : Finset V}
    (ht : t ∈ triangles G) (hlost : t ∉ triangles (prune G U A)) :
    (∃ v ∈ U, v ∈ t) ∨ HasBase A t := by
  by_contra hn
  apply hlost
  refine mem_triangles.mpr ⟨?_, (mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp ht).isClique ha hb hab, ?_, ?_, ?_⟩
  · intro haU
    exact hn (Or.inl ⟨a, haU, ha⟩)
  · intro hbU
    exact hn (Or.inl ⟨b, hbU, hb⟩)
  · intro hA
    apply hn
    exact Or.inr ⟨{a, b}, mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, Finset.mem_coe] using hA, by simp [hab]⟩,
      mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, Finset.mem_coe] using And.intro ha hb, by simp [hab]⟩⟩

/-- Every edge of a local triangle is removed if the local vertices lie in U∪A.
This accounts for compatibility with ALL residual packings. -/
theorem prune_local_cross {G : SimpleGraph V} {U A B s t : Finset V}
    (hB : B ⊆ U ∪ A) (hs : s ⊆ B) (ht : t ∈ triangles (prune G U A)) :
    Disjoint (edges s) (edges t) := by
  apply disjoint_left.mpr
  intro e hes het
  obtain ⟨a, b, hab, heq⟩ := card_eq_two.mp (mem_edges.mp hes).2
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have haT := (mem_edges.mp het).1 ha
  have hbT := (mem_edges.mp het).1 hb
  have hAdj := (mem_triangles.mp ht).isClique haT hbT hab
  have haA : a ∈ A := (mem_union.mp (hB (hs ((mem_edges.mp hes).1 ha)))).resolve_left hAdj.2.1
  have hbA : b ∈ A := (mem_union.mp (hB (hs ((mem_edges.mp hes).1 hb)))).resolve_left hAdj.2.2.1
  exact hAdj.2.2.2 ⟨haA, hbA⟩

end Tuza06
