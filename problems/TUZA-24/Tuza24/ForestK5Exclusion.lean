import Tuza24.ForestAPI
import Mathlib.Combinatorics.Pigeonhole

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A forest triangle-edge cover excludes every actual five-vertex clique.
The cover may be nonminimum and may have edges or vertices outside the clique. -/
theorem forestCover_no_five_clique {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : ForestCover G C) {k : Finset V} (hk : G.IsNClique 5 k) : False := by
  classical
  let col := hC.2.coloringTwo
  obtain ⟨c,hc,hfiber⟩ := exists_lt_card_fiber_of_mul_lt_card_of_maps_to
    (s := k) (t := (univ : Finset (Fin 2))) (f := fun x => col x) (n := 2)
    (fun _ _ => mem_univ _) (by simp [hk.card_eq])
  obtain ⟨t,htsub,htcard⟩ := exists_subset_card_eq (show 3≤(k.filter (fun x => col x=c)).card by omega)
  have htG : t∈triangles G := by
    apply mem_triangles.mpr
    refine ⟨?_,htcard⟩
    intro a ha b hb hab
    exact hk.isClique (mem_filter.mp (htsub ha)).1 (mem_filter.mp (htsub hb)).1 hab
  obtain ⟨e,heC,het⟩ := hC.1.2 t htG
  obtain ⟨hesub,hecard⟩ := mem_edges.mp het
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp hecard
  have ha : a∈t := hesub (by simp)
  have hb : b∈t := hesub (by simp)
  have hac := (mem_filter.mp (htsub ha)).2
  have hbc := (mem_filter.mp (htsub hb)).2
  exact col.valid (selectedGraph_adj.mpr ⟨hab,heC⟩) (hac.trans hbc.symm)

/-- Existence of any forest cover rules out a K5 subgraph. -/
theorem hasForestCover_no_five_clique {G : SimpleGraph V} (hG : HasForestCover G)
    {k : Finset V} (hk : G.IsNClique 5 k) : False := by
  obtain ⟨C,hC⟩ := hG
  exact forestCover_no_five_clique hC hk

/-- Optional refinement of B: every nonempty shared-edge-connected actual
triangle component has literal K4 edge support. Background edges and shared
vertices between distinct components remain unrestricted. -/
def ComponentK4 (G : SimpleGraph V) : Prop :=
  ∀ t∈triangles G, ∃ k : Finset V,
    k.card=4 ∧ support (triangleComponent G t)=edges k

/-- K5 exclusion refines the existing K4/K5 predicate only inside the forest
cover class; the original predicate B is unchanged. -/
theorem forestCover_B_iff_K4 {G : SimpleGraph V} {C : Finset (Finset V)}
    (hC : ForestCover G C) : B G ↔ ComponentK4 G := by
  constructor
  · intro hB t ht
    obtain ⟨k,hsize,hsupp⟩ := hB t ht
    refine ⟨k,?_,hsupp⟩
    rcases hsize with h4|h5
    · exact h4
    · exact (forestCover_no_five_clique hC ⟨clique_of_component_support hsupp,h5⟩).elim
  · intro h4 t ht
    obtain ⟨k,hk,hsupp⟩ := h4 t ht
    exact ⟨k,Or.inl hk,hsupp⟩

theorem hasForestCover_B_iff_K4 {G : SimpleGraph V} (hG : HasForestCover G) :
    B G ↔ ComponentK4 G := by
  obtain ⟨C,hC⟩ := hG
  exact forestCover_B_iff_K4 hC

end Tuza24
