import TuzaA1.Wedge

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem edge_codegree_two {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {e : Finset V} (he : G.IsNClique 2 e) :
    ∃ T ∈ triangles G, ∃ U ∈ triangles G, T ≠ U ∧ e ∈ edges T ∧ e ∈ edges U := by
  classical
  obtain ⟨T,ht,heT⟩ := edge_in_triangle hG he
  by_contra hn
  have huniq : ∀ U ∈ triangles G, e ∈ edges U → U = T := by
    intro U hu heU
    by_contra hne
    exact hn ⟨T,ht,U,hu,(fun h => hne h.symm),heT,heU⟩
  let F := (edges T).erase e
  have hcard : F.card = 2 := by
    dsimp [F]
    rw [card_erase_of_mem heT,edges_triangle_card (triangles_valid G T ht)]
  have hnu := small_deletion_nu hG hcard.le (fun f hf =>
    actual_edge_of_triangle ht (mem_of_mem_erase hf))
  have hsub : triangles (removeEdgeFamily G F) ⊆
      triangles (removeEdgeFamily G (edges T)) := by
    intro U hu
    have huG := triangles_mono_graph (removeEdgeFamily_le G F) hu
    refine mem_triangles_remove.mpr ⟨huG,disjoint_left.mpr ?_⟩
    intro f hfU hfT
    by_cases hfe : f = e
    · have huT : U = T := huniq U huG (hfe ▸ hfU)
      obtain ⟨g,hg⟩ := card_pos.mp (show 0 < F.card by omega)
      exact removeEdgeFamily_surviving hu (huT ▸ mem_of_mem_erase hg) hg
    · exact removeEdgeFamily_surviving hu hfU (mem_erase.mpr ⟨hfe,hfT⟩)
  have hmono := nu_mono hsub
  have hr := (one_triangle_residual hG ht).1
  omega
end TuzaA1
