import Tuza06.UniqueEdge
import Tuza06.GraphPeeling

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def triangleVertices (G : SimpleGraph V) : Finset V := by
  classical
  exact (triangles G).biUnion id

theorem pair_graph_edge {G : SimpleGraph V} {a b : V} (h : G.Adj a b) :
    G.IsNClique 2 ({a,b} : Finset V) := by
  classical
  have hab := G.ne_of_adj h
  constructor
  · intro x hx y hy hxy
    simp only [Finset.mem_coe, mem_insert, mem_singleton] at hx hy
    rcases hx with rfl | rfl <;> rcases hy with rfl | rfl
    · exact (hxy rfl).elim
    · exact h
    · exact h.symm
    · exact (hxy rfl).elim
  · simp [hab]

theorem minimal_support_nonempty {G : SimpleGraph V} (hG : MinimalObstruction G) :
    (triangleVertices G).Nonempty := by
  classical
  have hT : (triangles G).Nonempty := by
    by_contra hn
    have he := not_nonempty_iff_eq_empty.mp hn
    exact hG.1 (triangle_free_good he)
  obtain ⟨t, ht⟩ := hT
  obtain ⟨v, hv⟩ := card_pos.mp (show 0 < t.card by rw [(mem_triangles.mp ht).card_eq]; decide)
  exact ⟨v, mem_biUnion.mpr ⟨t, ht, hv⟩⟩

/-- Every endpoint of every actual edge is in triangle support; isolated ambient
vertices are retained and never create a false minimum-degree assumption. -/
theorem minimal_adj_vertices_supported {G : SimpleGraph V} (hG : MinimalObstruction G)
    {a b : V} (hab : G.Adj a b) : a ∈ triangleVertices G ∧ b ∈ triangleVertices G := by
  classical
  obtain ⟨t, ht, hAt⟩ := minimal_every_edge_in_triangle hG (pair_graph_edge hab)
  have ha : a ∈ t := (mem_edges.mp hAt).1 (by simp)
  have hb : b ∈ t := (mem_edges.mp hAt).1 (by simp)
  exact ⟨mem_biUnion.mpr ⟨t, ht, ha⟩, mem_biUnion.mpr ⟨t, ht, hb⟩⟩

theorem minimal_neighbors_supported {G : SimpleGraph V} (hG : MinimalObstruction G) (v : V) :
    peelNeighbors G (triangleVertices G) v = peelNeighbors G univ v := by
  classical
  ext x
  simp only [peelNeighbors, mem_filter, mem_univ, true_and]
  constructor
  · exact And.right
  · intro hvx
    exact ⟨(minimal_adj_vertices_supported hG hvx).2, hvx⟩

theorem minimal_support_degree_eq {G : SimpleGraph V} (hG : MinimalObstruction G) (v : V) :
    degreeWithin G (triangleVertices G) v = degreeWithin G univ v := by
  change (peelNeighbors G (triangleVertices G) v).card = (peelNeighbors G univ v).card
  rw [minimal_neighbors_supported hG v]

/-- Even with arbitrary isolated ambient vertices, every supported vertex already
has at least three neighbors, using the proved triangle-codegree restriction. -/
theorem minimal_support_degree_ge_three {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hv : v ∈ triangleVertices G) : 3 ≤ degreeWithin G (triangleVertices G) v := by
  classical
  obtain ⟨t, ht, hvt⟩ := mem_biUnion.mp hv
  obtain ⟨a, hat, hav⟩ := exists_mem_ne (by rw [(mem_triangles.mp ht).card_eq]; decide : 1 < t.card) v
  have hva : G.Adj v a := (mem_triangles.mp ht).isClique hvt hat hav.symm
  let A : Finset V := {v,a}
  have hA : G.IsNClique 2 A := pair_graph_edge hva
  obtain ⟨s, hs, r, hr, hAs, hAr, hsr⟩ := minimal_edge_two_triangles hG hA
  obtain ⟨x, hxA, hsx⟩ := third_vertex (mem_triangles.mp hs).card_eq hAs
  obtain ⟨y, hyA, hry⟩ := third_vertex (mem_triangles.mp hr).card_eq hAr
  have hxy : x ≠ y := by intro h; apply hsr; rw [hsx, hry, h]
  have hxa : x ≠ a := by intro h; apply hxA; rw [h]; simp [A]
  have hya : y ≠ a := by intro h; apply hyA; rw [h]; simp [A]
  have hxv : x ≠ v := by intro h; apply hxA; rw [h]; simp [A]
  have hyv : y ≠ v := by intro h; apply hyA; rw [h]; simp [A]
  have hvx : G.Adj v x := (mem_triangles.mp hs).isClique
    (by rw [hsx]; simp [A]) (by rw [hsx]; simp) hxv.symm
  have hvy : G.Adj v y := (mem_triangles.mp hr).isClique
    (by rw [hry]; simp [A]) (by rw [hry]; simp) hyv.symm
  have hsub : ({a,x,y} : Finset V) ⊆ peelNeighbors G univ v := by
    intro z hz
    simp only [mem_insert, mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact mem_filter.mpr ⟨mem_univ _, hva⟩
    · exact mem_filter.mpr ⟨mem_univ _, hvx⟩
    · exact mem_filter.mpr ⟨mem_univ _, hvy⟩
  have hle := card_le_card hsub
  have hc : ({a,x,y} : Finset V).card = 3 := by simp [hxa.symm, hya.symm, hxy]
  rw [hc] at hle
  rw [minimal_support_degree_eq hG v]
  exact hle

end Tuza06
