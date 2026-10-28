import Tuza.Intersecting
import Tuza.Graph

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The exact triangle-deletion theorem, conditional only on the two visible published inputs.
All face selection, simultaneous compatibility, family-cover, and arithmetic steps are proved. -/
theorem triangle_deletion
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (G : SimpleGraph V) (U : Finset V) (hT : G.IsNClique 3 U)
    (htrip : TriangleTripartite (deleteTriangle G U)) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  classical
  let H := deleteTriangle G U
  let F := triangles H
  let N := triangles G \ F
  have hsub : F ⊆ triangles G := triangles_mono_graph (delete_le G U)
  have hwhole : F ∪ N = triangles G := union_sdiff_of_subset hsub
  have hF : Triangles F := triangles_valid H
  have hN : Triangles N := triangles_mono sdiff_subset (triangles_valid G)
  have hnot : U ∉ F := by
    intro hu
    have hd := deleted_edges_disjoint hu
    have he := disjoint_self.mp hd
    exact (edges_nonempty (s := U) (by rw [hT.card_eq]; decide)).ne_empty he
  have hUN : U ∈ N := mem_sdiff.mpr ⟨mem_triangles.mpr hT, hnot⟩
  have hpos : 1 ≤ nu N := nu_pos ⟨U, hUN⟩
  have hcoverN : Covers N (edges U) := by
    intro q hq
    exact new_triangle_removed_edge (mem_sdiff.mp hq).1 (mem_sdiff.mp hq).2
  have hthree : tau N ≤ 3 := by
    have hc : (edges U).card = 3 := by simp [edges, hT.card_eq]
    exact hc ▸ tau_le_card hcoverN
  have hcoverG : tau (triangles G) ≤ tau F + tau N := by
    rw [← hwhole]
    exact tau_union_le hF hN
  have hbase : nu F + 1 ≤ nu (triangles G) := by
    obtain ⟨P, hp, hP⟩ := exists_max_packing F
    have hcross : ∀ p ∈ P, ∀ q ∈ ({U} : Finset (Finset V)),
        Disjoint (edges p) (edges q) := by
      intro p hp' q hq
      have hqU := mem_singleton.mp hq
      subst q
      exact deleted_edges_disjoint (hp.1 hp')
    have hlow := nu_union_lower hF hp hcross
    have hsingle : 1 ≤ nu ({U} : Finset (Finset V)) := nu_pos (singleton_nonempty _)
    have hm : nu (F ∪ {U}) ≤ nu (triangles G) := nu_mono (by
      apply union_subset hsub
      simpa using mem_triangles.mpr hT)
    rw [hP] at hlow
    omega
  have hA : tau F ≤ 2 * nu F := aharoni H htrip
  by_cases heq : tau F = 2 * nu F
  · obtain ⟨K, hk, hi, hK⟩ := hns H htrip heq
    obtain ⟨P, hp, hP, havoid⟩ := k4_packing_faces (delete_independent G U) hk hi
    have hcross : ∀ p ∈ P, ∀ q ∈ N, Disjoint (edges p) (edges q) := by
      intro p hp' q hq
      exact avoid_new_triangle (havoid p hp') (hN q hq)
        (new_triangle_removed_edge (mem_sdiff.mp hq).1 (mem_sdiff.mp hq).2)
    have hlow := nu_union_lower hF hp hcross
    rw [hP, hK, hwhole] at hlow
    change nu F + nu N ≤ nu (triangles G) at hlow
    have hnewbound : tau N ≤ 2 * nu N := by
      by_cases hn : nu N = 1
      · have ht := tau_le_two_of_nu_one hN hn
        omega
      · omega
    omega
  · omega

#print axioms triangle_deletion

end Tuza
