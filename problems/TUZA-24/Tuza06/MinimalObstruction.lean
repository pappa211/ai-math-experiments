import Tuza06.Critical

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The combined conclusion with the universal converse separated out, since it
has already been proved for all finite graphs. -/
def Good (G : SimpleGraph V) : Prop :=
  tau (triangles G) ≤ 2 * nu (triangles G) ∧
    (tau (triangles G) = 2 * nu (triangles G) → ComponentCliques G)

noncomputable def edgeCount (G : SimpleGraph V) : ℕ := by
  classical
  exact (G.cliqueFinset 2).card

def MinimalObstruction (G : SimpleGraph V) : Prop :=
  ¬ Good G ∧ ∀ H : SimpleGraph V, H ≤ G → edgeCount H < edgeCount G → Good H

theorem good_iff_combined_conclusion (G : SimpleGraph V) :
    Good G ↔ tau (triangles G) ≤ 2 * nu (triangles G) ∧
      (tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G) := by
  constructor
  · rintro ⟨hi, he⟩
    exact ⟨hi, he, componentCliques_equality⟩
  · rintro ⟨hi, he⟩
    exact ⟨hi, he.mp⟩

theorem failure_lower_bound {G : SimpleGraph V} (h : ¬ Good G) :
    2 * nu (triangles G) ≤ tau (triangles G) := by
  by_contra hn
  apply h
  constructor
  · omega
  · intro heq
    omega

/-- Edge-count minimization takes place among actual subgraphs on the same
ambient finite vertex type. Vertex deletion is represented by isolating vertices. -/
theorem exists_minimal_obstruction {G : SimpleGraph V} (hbad : ¬ Good G) :
    ∃ H : SimpleGraph V, H ≤ G ∧ MinimalObstruction H := by
  classical
  let P : ℕ → Prop := fun n => ∃ H : SimpleGraph V, H ≤ G ∧ edgeCount H = n ∧ ¬ Good H
  have hex : ∃ n, P n := ⟨edgeCount G, G, le_rfl, rfl, hbad⟩
  obtain ⟨H, hHG, hcount, hHbad⟩ := Nat.find_spec hex
  refine ⟨H, hHG, hHbad, ?_⟩
  intro J hJH hJcount
  by_contra hJbad
  have hJP : P (edgeCount J) := ⟨J, hJH.trans hHG, rfl, hJbad⟩
  have hmin := Nat.find_min' hex hJP
  omega

theorem minimal_obstruction_degenerate {G : SimpleGraph V}
    (hdeg : Degenerate G 5) (hbad : ¬ Good G) :
    ∃ H : SimpleGraph V, H ≤ G ∧ Degenerate H 5 ∧ MinimalObstruction H := by
  obtain ⟨H, hHG, hH⟩ := exists_minimal_obstruction hbad
  exact ⟨H, hHG, degenerate_mono hHG hdeg, hH⟩

theorem componentCliques_of_triangles_eq {G H : SimpleGraph V}
    (h : triangles G = triangles H) : ComponentCliques G ↔ ComponentCliques H := by
  have hadj : TriangleAdjacent G = TriangleAdjacent H := by
    funext s t
    simp only [TriangleAdjacent, h]
  have hconn : TriangleConnected G = TriangleConnected H := by
    funext s t
    simp only [TriangleConnected, hadj]
  have hcomp : ∀ t, triangleComponent G t = triangleComponent H t := by
    intro t
    simp only [triangleComponent, h]
    rw [congrFun hconn t]
  simp only [ComponentCliques, hcomp, h]

theorem good_of_triangles_eq {G H : SimpleGraph V} (h : triangles G = triangles H) :
    Good G ↔ Good H := by
  have hc := componentCliques_of_triangles_eq h
  simp only [Good, h, hc]

theorem triangle_free_good {G : SimpleGraph V} (h : triangles G = ∅) : Good G := by
  constructor
  · simp [h]
  · intro _ t ht
    simp [h] at ht

theorem edgeCount_strict {G H : SimpleGraph V} (hHG : H ≤ G)
    {e : Finset V} (heG : G.IsNClique 2 e) (heH : ¬ H.IsNClique 2 e) :
    edgeCount H < edgeCount G := by
  classical
  apply card_lt_card
  apply Finset.ssubset_iff_subset_ne.mpr
  refine ⟨?_, ?_⟩
  · intro f hf
    exact SimpleGraph.mem_cliqueFinset_iff.mpr ((SimpleGraph.mem_cliqueFinset_iff.mp hf).mono hHG)
  · intro h
    apply heH
    exact SimpleGraph.mem_cliqueFinset_iff.mp
      (h.symm ▸ SimpleGraph.mem_cliqueFinset_iff.mpr heG)

theorem delete_edgeCount_strict {G : SimpleGraph V} {A : Finset V}
    (hA : G.IsNClique 2 A) : edgeCount (deleteTriangle G A) < edgeCount G := by
  apply edgeCount_strict (delete_le G A) hA
  intro hH
  obtain ⟨a, b, hab, heq⟩ := card_eq_two.mp hA.card_eq
  have ha : a ∈ A := by rw [heq]; simp
  have hb : b ∈ A := by rw [heq]; simp
  exact (hH.isClique ha hb hab).2 ⟨ha, hb⟩

/-- An edge in a minimal combined obstruction cannot be triangle-free. -/
theorem minimal_every_edge_in_triangle {G : SimpleGraph V} (hG : MinimalObstruction G)
    {A : Finset V} (hA : G.IsNClique 2 A) : ∃ t ∈ triangles G, A ∈ edges t := by
  classical
  by_contra hn
  have htri : triangles G = triangles (deleteTriangle G A) := by
    apply subset_antisymm
    · intro t ht
      by_contra htH
      obtain ⟨e, heA, het⟩ := new_triangle_removed_edge ht htH
      rw [two_vertex_edges hA.card_eq] at heA
      exact hn ⟨t, ht, (mem_singleton.mp heA) ▸ het⟩
    · exact triangles_mono_graph (delete_le G A)
  have hGoodH := hG.2 _ (delete_le G A) (delete_edgeCount_strict hA)
  exact hG.1 ((good_of_triangles_eq htri).mpr hGoodH)

/-- The full tight-critical edge conclusion now follows from actual minimality.
The vertex type is arbitrary and the only class hypothesis needed later is
subgraph heredity (five-degeneracy is preserved by degenerate_mono). -/
theorem minimal_tight_critical {G : SimpleGraph V} (hG : MinimalObstruction G)
    {A : Finset V} (hA : G.IsNClique 2 A) :
    tau (triangles G) = 2 * nu (triangles G) ∧
    nu (triangles (deleteTriangle G A)) = nu (triangles G) ∧
    tau (triangles (deleteTriangle G A)) + 1 = tau (triangles G) := by
  obtain ⟨t, ht, hAt⟩ := minimal_every_edge_in_triangle hG hA
  have hGoodH := hG.2 _ (delete_le G A) (delete_edgeCount_strict hA)
  exact tight_critical_edge hA.card_eq ht hAt (failure_lower_bound hG.1) hGoodH.1 hGoodH.2

end Tuza06
