import Tuza06.Transport
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fin.VecNotation

namespace Tuza06.FiveCoverage
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000

/-- Ten genuine unordered edges on the five neighbor labels. -/
def slot : Fin 10 → Finset (Fin 5) :=
  ![{0,1},{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,3},{2,4},{3,4}]
def graphEdges (f : Fin 10 → Bool) : Finset (Finset (Fin 5)) :=
  ((univ : Finset (Fin 10)).filter (fun j => f j)).image slot

def Eligible (f : Fin 10 → Bool) : Prop :=
  ∀ a : Fin 5, 2 ≤ ((univ : Finset (Fin 5)).filter (fun b => ({a,b} : Finset (Fin 5)) ∈ graphEdges f)).card

/-- A constructive family of all 120 permutations, composed of four swaps.
Every value is an equivalence by construction, without a finite injectivity oracle. -/
def permutation (p : Fin 120) : Equiv.Perm (Fin 5) :=
  (((Equiv.swap 0 ⟨p.val % 5, by omega⟩).trans
    (Equiv.swap 1 ⟨1 + (p.val / 5) % 4, by omega⟩)).trans
    (Equiv.swap 2 ⟨2 + (p.val / 20) % 3, by omega⟩)).trans
    (Equiv.swap 3 ⟨3 + (p.val / 60) % 2, by omega⟩)

/-- The eleven exact graph types used by the ordinary local classification. -/
def representative : Fin 11 → Finset (Finset (Fin 5)) :=
  ![{{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,3}},
    {{0,2},{0,3},{0,4},{1,3},{1,4},{2,4},{3,4}},
    {{0,2},{0,3},{0,4},{1,3},{1,4},{2,4}},
    {{0,1},{0,2},{0,3},{0,4},{1,2},{1,3},{1,4}},
    {{0,1},{0,2},{0,3},{0,4},{1,2},{3,4}},
    {{0,2},{0,3},{0,4},{1,2},{1,3},{1,4}},
    {{0,1},{0,4},{1,2},{2,3},{3,4}},
    {{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,4},{3,4}},
    {{0,1},{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,3}},
    {{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,3},{2,4},{3,4}},
    {{0,1},{0,2},{0,3},{0,4},{1,2},{1,3},{1,4},{2,3},{2,4},{3,4}}]
def Relabel (f : Fin 10 → Bool) (r : Fin 11) (p : Fin 120) : Prop :=
  liftFamily (permutation p).toEmbedding (graphEdges f) = representative r

private theorem slots_cover : ∀ e : ↥(edges (univ : Finset (Fin 5))), ∃ j : Fin 10, slot j = e.val := by decide

/-- Every genuine five-vertex edge set is represented, with no graph-order or
ambient-attachment condition hidden in the coding. -/
theorem exists_graph_encoding (E : Finset (Finset (Fin 5))) (hE : E ⊆ edges univ) :
    ∃ f : Fin 10 → Bool, graphEdges f = E := by
  classical
  let f : Fin 10 → Bool := fun j => decide (slot j ∈ E)
  refine ⟨f,?_⟩
  ext e
  constructor
  · intro he
    obtain ⟨j,hj,rfl⟩ := mem_image.mp he
    simpa only [f,decide_eq_true_eq] using (mem_filter.mp hj).2
  · intro he
    obtain ⟨j,hj⟩ := slots_cover ⟨e,hE he⟩
    refine mem_image.mpr ⟨j,mem_filter.mpr ⟨mem_univ _,?_⟩,hj⟩
    simpa only [f,decide_eq_true_eq,hj] using he
end Tuza06.FiveCoverage
