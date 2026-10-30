import Tuza06.LowDegreeStructureTools
import Tuza06.MultiReduction

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I] [DecidableEq I]

theorem neighbors_eq_of_five_common {G : SimpleGraph V} {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 5) :
    peelNeighbors G univ x = peelNeighbors G univ y := by
  have hxN : (peelNeighbors G univ x).card = 5 := hx
  have hyN : (peelNeighbors G univ y).card = 5 := hy
  have h1 : peelNeighbors G univ x ∩ peelNeighbors G univ y = peelNeighbors G univ x :=
    eq_of_subset_of_card_le inter_subset_left (by omega)
  have h2 : peelNeighbors G univ x ∩ peelNeighbors G univ y = peelNeighbors G univ y :=
    eq_of_subset_of_card_le inter_subset_right (by omega)
  exact h1.symm.trans h2

theorem nonadjacent_outside_five_core {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hc : FiveLinkConfiguration G i E)
    {y : V} (hne : i 0 ≠ y) (hxy : ¬ G.Adj (i 0) y) : ∀ a : Fin 6, i a ≠ y := by
  classical
  intro a heq
  by_cases ha : a = 0
  · exact hne (ha ▸ heq)
  · have haN : a ∈ fiveLinkNeighbors := by fin_cases a <;> simp_all [fiveLinkNeighbors]
    have hNy : y ∈ peelNeighbors G univ (i 0) := by
      rw [hc.neighborhood]
      exact mem_map.mpr ⟨a,haN,heq⟩
    exact hxy (mem_filter.mp hNy).2

/-- Exact finite core adjacency and genuine center-neighborhood bounds discharge
all realization fields of a specified reduction. -/
theorem reduction_of_exact_core (W : FiniteReduction I) {G : SimpleGraph V}
    (i : I ↪ V)
    (hE : ∀ a b : I, G.Adj (i a) (i b) ↔ ({a,b} : Finset I) ∈ W.Upper)
    (hN : ∀ a ∈ W.U, ∀ z, G.Adj (i a) z → z ∈ (univ : Finset I).map i)
    (hEdges : ∀ e ∈ W.Upper, e.card = 2)
    (hP : ∀ p ∈ W.P, p.card = 3 ∧ edges p ⊆ W.Upper) : RealizesReduction W G i := by
  constructor
  · exact fun a b => (hE a b).mp
  · exact hN
  · apply mapped_triangles_of_edges i (E := W.Upper) _ hP
    intro e he
    have he2 : e.card = 2 := hEdges e he
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he2
    have hadj := (hE a b).mpr he
    refine ⟨?_,by simp [hab]⟩
    simpa only [map_insert,map_singleton,Finset.coe_pair] using
      (SimpleGraph.isClique_pair (G := G) (a := i a) (b := i b)).mpr (fun _ => hadj)
end Tuza06
