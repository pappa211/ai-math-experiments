import TuzaA1.Codegree

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem a11_verified : EdgeCriticalityTarget (V := V) := by
  intro G hG e he
  have h := edge_criticality hG he
  exact ⟨h.1,h.2.1,h.2.2,edge_in_triangle hG he⟩

theorem a12_verified : ResilienceTarget (V := V) := by
  intro G hG S hn hs
  exact deletion_resilience hG hn hs

theorem a12_small_verified : SmallDeletionTarget (V := V) := by
  intro G hG S hc hs
  exact small_deletion_nu hG hc hs

theorem a13_extension_verified : PackingExtensionTarget (V := V) := by
  intro G hG P hp hc
  exact small_packing_extension hG hp hc

theorem a13_one_verified : OneTriangleTarget (V := V) := by
  intro G hG T ht
  exact one_triangle_residual hG ht

theorem a13_two_verified : TwoTrianglesTarget (V := V) := by
  intro G hG T ht U hu hd
  exact two_triangles_residual hG ht hu hd

theorem a14_verified : WedgeTarget (V := V) := by
  intro G hG T ht e he
  exact wedge hG ht he

theorem a15_verified : CodegreeTarget (V := V) := by
  intro G hG e he
  exact edge_codegree_two hG he
end TuzaA1
