import Tuza.Lifting

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Deleting two vertex triples commutes, even if they intersect. -/
theorem deleteTriangle_comm (G : SimpleGraph V) (U W : Finset V) :
    deleteTriangle (deleteTriangle G U) W = deleteTriangle (deleteTriangle G W) U := by
  ext a b
  change ((G.Adj a b ∧ _) ∧ _) ↔ ((G.Adj a b ∧ _) ∧ _)
  tauto

theorem triangle_survives_delete {G : SimpleGraph V} {U W : Finset V}
    (hU : G.IsNClique 3 U) (hd : Disjoint (edges U) (edges W)) :
    (deleteTriangle G W).IsNClique 3 U := by
  refine ⟨?_, hU.card_eq⟩
  intro a ha b hb hab
  refine ⟨hU.isClique ha hb hab, ?_⟩
  intro hw
  have heU : ({a,b} : Finset V) ∈ edges U := mem_edges.mpr ⟨by
    intro x hx
    rcases mem_insert.mp hx with rfl | hx
    · exact ha
    · exact (mem_singleton.mp hx) ▸ hb, by simp [hab]⟩
  have heW : ({a,b} : Finset V) ∈ edges W := mem_edges.mpr ⟨by
    intro x hx
    rcases mem_insert.mp hx with rfl | hx
    · exact hw.1
    · exact (mem_singleton.mp hx) ▸ hw.2, by simp [hab]⟩
  exact disjoint_left.mp hd heU heW

theorem one_restoration_packing_gain {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U) :
    nu (triangles (deleteTriangle G U)) + 1 ≤ nu (triangles G) := by
  classical
  let F := triangles (deleteTriangle G U)
  have hF : Triangles F := triangles_valid _
  obtain ⟨P,hp,hP⟩ := exists_max_packing F
  have hcross : ∀ p ∈ P, ∀ q ∈ ({U} : Finset (Finset V)),
      Disjoint (edges p) (edges q) := by
    intro p hpp q hq
    have hqU := mem_singleton.mp hq
    subst q
    exact deleted_edges_disjoint (hp.1 hpp)
  have hl := nu_union_lower hF hp hcross
  have hs : 1 ≤ nu ({U} : Finset (Finset V)) := nu_pos (singleton_nonempty _)
  have hm : nu (F ∪ {U}) ≤ nu (triangles G) := nu_mono (by
    apply union_subset (triangles_mono_graph (delete_le G U))
    simpa using mem_triangles.mpr hU)
  rw [hP] at hl
  change nu F + 1 ≤ nu (triangles G)
  omega

theorem restoration_new_cover_three {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U) :
    tau (triangles G \ triangles (deleteTriangle G U)) ≤ 3 := by
  have hc : Covers (triangles G \ triangles (deleteTriangle G U)) (edges U) := by
    intro q hq
    exact new_triangle_removed_edge (mem_sdiff.mp hq).1 (mem_sdiff.mp hq).2
  have hn : (edges U).card = 3 := by simp [edges,hU.card_eq]
  exact hn ▸ tau_le_card hc

theorem one_restoration_cover_bound {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U) :
    tau (triangles G) ≤ tau (triangles (deleteTriangle G U)) + 3 := by
  have hsub := triangles_mono_graph (delete_le G U)
  have hu := tau_union_le (K := triangles G \ triangles (deleteTriangle G U)) (triangles_valid (deleteTriangle G U))
    (triangles_mono sdiff_subset (triangles_valid G))
  rw [union_sdiff_of_subset hsub] at hu
  have hc := restoration_new_cover_three hU
  omega

/-- The equality-face construction separates one complete new family from an old maximum packing. -/
theorem equality_restoration_packing_separation
    (hns : HNSInput (V := V)) (G : SimpleGraph V) (U : Finset V)
    (htrip : TriangleTripartite (deleteTriangle G U))
    (heq : tau (triangles (deleteTriangle G U)) = 2 * nu (triangles (deleteTriangle G U))) :
    nu (triangles (deleteTriangle G U)) +
      nu (triangles G \ triangles (deleteTriangle G U)) ≤ nu (triangles G) := by
  classical
  let H := deleteTriangle G U
  let F := triangles H
  let N := triangles G \ F
  have hsub : F ⊆ triangles G := triangles_mono_graph (delete_le G U)
  have hwhole : F ∪ N = triangles G := union_sdiff_of_subset hsub
  have hF : Triangles F := triangles_valid H
  have hN : Triangles N := triangles_mono sdiff_subset (triangles_valid G)
  obtain ⟨K,hk,hi,hK⟩ := hns H htrip heq
  obtain ⟨P,hp,hP,havoid⟩ := k4_packing_faces (delete_independent G U) hk hi
  have hcross : ∀ p ∈ P, ∀ q ∈ N, Disjoint (edges p) (edges q) := by
    intro p hpp q hq
    exact avoid_new_triangle (havoid p hpp) (hN q hq)
      (new_triangle_removed_edge (mem_sdiff.mp hq).1 (mem_sdiff.mp hq).2)
  have hl := nu_union_lower hF hp hcross
  rw [hP,hK,hwhole] at hl
  exact hl

theorem restored_triangle_in_new_family {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U) : U ∈ triangles G \ triangles (deleteTriangle G U) := by
  refine mem_sdiff.mpr ⟨mem_triangles.mpr hU,?_⟩
  intro ht
  have hd := deleted_edges_disjoint ht
  have he := disjoint_self.mp hd
  exact (edges_nonempty (s := U) (by rw [hU.card_eq]; decide)).ne_empty he

/-- If the two restorations gain only two packed triangles, each individual new family is intersecting. -/
theorem equality_individual_family_nu_one
    (hns : HNSInput (V := V)) (G : SimpleGraph V) (U W : Finset V)
    (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W))
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G W) U))
    (heq : tau (triangles (deleteTriangle (deleteTriangle G W) U)) =
      2 * nu (triangles (deleteTriangle (deleteTriangle G W) U)))
    (hsmall : nu (triangles G) < nu (triangles (deleteTriangle (deleteTriangle G W) U)) + 3) :
    nu (triangles (deleteTriangle G W) \
      triangles (deleteTriangle (deleteTriangle G W) U)) = 1 := by
  have hTU := triangle_survives_delete hU hd
  have hpos := nu_pos ⟨U, restored_triangle_in_new_family hTU⟩
  have hsep := equality_restoration_packing_separation hns (deleteTriangle G W) U htrip heq
  have hgain := one_restoration_packing_gain hW
  omega

/-- Disjoint vertex sets cannot contribute two edges to a three-vertex clique. -/
theorem triangles_union_of_vertex_disjoint {G : SimpleGraph V} {U W : Finset V}
    (hd : Disjoint U W) :
    triangles G = triangles (deleteTriangle G W) ∪ triangles (deleteTriangle G U) := by
  classical
  apply Subset.antisymm
  · intro t ht
    by_cases htw : t ∈ triangles (deleteTriangle G W)
    · exact mem_union_left _ htw
    · apply mem_union_right
      by_contra htu
      obtain ⟨e,heU,het⟩ := new_triangle_removed_edge ht htu
      obtain ⟨f,hfW,hft⟩ := new_triangle_removed_edge ht htw
      have hef : Disjoint e f := by
        apply disjoint_left.mpr
        intro x he hf
        exact disjoint_left.mp hd ((mem_edges.mp heU).1 he) ((mem_edges.mp hfW).1 hf)
      have hc := card_le_card (union_subset (mem_edges.mp het).1 (mem_edges.mp hft).1)
      rw [card_union_of_disjoint hef,(mem_edges.mp het).2,(mem_edges.mp hft).2,
        (mem_triangles.mp ht).card_eq] at hc
      omega
  · exact union_subset (triangles_mono_graph (delete_le G W))
      (triangles_mono_graph (delete_le G U))

/-- Exact-equality restoration for vertex-disjoint triangles, with full graph triangle families.
This is a completed strict subcase of the target edge-disjoint theorem. -/
theorem two_triangle_equality_vertex_disjoint
    (hns : HNSInput (V := V)) (G : SimpleGraph V) (U W : Finset V)
    (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W) (hdv : Disjoint U W)
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G W) U))
    (heq : tau (triangles (deleteTriangle (deleteTriangle G W) U)) =
      2 * nu (triangles (deleteTriangle (deleteTriangle G W) U))) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  classical
  let H := deleteTriangle (deleteTriangle G W) U
  let F := triangles H
  let F1 := triangles (deleteTriangle G W) \ F
  let F2 := triangles (deleteTriangle G U) \ F
  have hd : Disjoint (edges U) (edges W) := by
    apply disjoint_left.mpr
    intro e heU heW
    obtain ⟨x,hx⟩ := card_pos.mp (by rw [(mem_edges.mp heU).2]; decide)
    exact disjoint_left.mp hdv ((mem_edges.mp heU).1 hx) ((mem_edges.mp heW).1 hx)
  have hTU := triangle_survives_delete hU hd
  have hTW := triangle_survives_delete hW hd.symm
  have hgain1 := one_restoration_packing_gain hTU
  have hgain2 := one_restoration_packing_gain hW
  have hcov1 := one_restoration_cover_bound hTU
  have hcov2 := one_restoration_cover_bound hW
  by_cases hbig : nu F + 3 ≤ nu (triangles G)
  · change tau F = 2 * nu F at heq
    change tau (triangles (deleteTriangle G W)) ≤ tau F + 3 at hcov1
    omega
  · have hsmall : nu (triangles G) < nu F + 3 := by omega
    have hn1 : nu F1 = 1 := equality_individual_family_nu_one hns G U W hU hW hd htrip heq hsmall
    have hcomm := deleteTriangle_comm G U W
    have hn2 : nu F2 = 1 := by
      have ht2 : TriangleTripartite (deleteTriangle (deleteTriangle G U) W) := by
        rw [hcomm]; exact htrip
      have he2 : tau (triangles (deleteTriangle (deleteTriangle G U) W)) =
          2 * nu (triangles (deleteTriangle (deleteTriangle G U) W)) := by
        rw [hcomm]; exact heq
      have hs2 : nu (triangles G) < nu (triangles (deleteTriangle (deleteTriangle G U) W)) + 3 := by
        rw [hcomm]; exact hsmall
      have hn := equality_individual_family_nu_one hns G W U hW hU hd.symm ht2 he2 hs2
      rw [hcomm] at hn
      exact hn
    have hf1 : Triangles F1 := triangles_mono sdiff_subset (triangles_valid _)
    have hf2 : Triangles F2 := triangles_mono sdiff_subset (triangles_valid _)
    have ht1 := tau_le_two_of_nu_one hf1 hn1
    have ht2 := tau_le_two_of_nu_one hf2 hn2
    have hFsub1 : F ⊆ triangles (deleteTriangle G W) := triangles_mono_graph (delete_le _ _)
    have hFsub2 : F ⊆ triangles (deleteTriangle G U) := by
      change triangles (deleteTriangle (deleteTriangle G W) U) ⊆ _
      rw [← hcomm]
      exact triangles_mono_graph (delete_le _ _)
    have hwhole : F ∪ (F1 ∪ F2) = triangles G := by
      rw [triangles_union_of_vertex_disjoint hdv]
      dsimp [F1,F2]
      ext t
      simp only [mem_union,mem_sdiff]
      constructor
      · intro ht
        rcases ht with ht | ht
        · exact Or.inl (hFsub1 ht)
        · exact ht.elim (fun h => Or.inl h.1) (fun h => Or.inr h.1)
      · intro ht
        by_cases htf : t ∈ F
        · exact Or.inl htf
        · exact Or.inr (ht.elim (fun h => Or.inl ⟨h,htf⟩) (fun h => Or.inr ⟨h,htf⟩))
    have hcover := tau_union_le (triangles_valid H) (triangles_mono (subset_refl _) (by
      intro t ht
      rcases mem_union.mp ht with ht | ht
      · exact hf1 t ht
      · exact hf2 t ht))
    change tau (F ∪ (F1 ∪ F2)) ≤ tau F + tau (F1 ∪ F2) at hcover
    rw [hwhole] at hcover
    have hnew := tau_union_le hf1 hf2
    change tau F = 2 * nu F at heq
    change nu F + 1 ≤ nu (triangles (deleteTriangle G W)) at hgain1
    omega

#print axioms equality_restoration_packing_separation
#print axioms equality_individual_family_nu_one
#print axioms two_triangle_equality_vertex_disjoint

end Tuza
