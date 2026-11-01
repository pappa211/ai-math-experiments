import TuzaA1.Criticality

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem support_actual {G : SimpleGraph V} {P : Finset (Finset V)}
    (hp : Packing (triangles G) P) : ∀ e ∈ support P, G.IsNClique 2 e := by
  intro e he
  obtain ⟨t,ht,het⟩ := mem_biUnion.mp he
  exact actual_edge_of_triangle (hp.1 ht) het

theorem small_packing_extension {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {P : Finset (Finset V)} (hp : Packing (triangles G) P) (hcard : P.card = 1 ∨ P.card = 2) :
    nu (triangles (removeEdgeFamily G (support P))) + P.card = nu (triangles G) ∧
    ∃ Q, Packing (triangles G) Q ∧ P ⊆ Q ∧ Q.card = nu (triangles G) := by
  classical
  have hsCard := packing_support_card hp
  have hsNe : (support P).Nonempty := card_pos.mp (by rcases hcard with h|h <;> omega)
  have hlower := deletion_resilience_linear hG hsNe (support_actual hp)
  have hupper := packing_residual_bound hp
  have heq : nu (triangles (removeEdgeFamily G (support P))) + P.card = nu (triangles G) := by
    rcases hcard with h|h <;> omega
  obtain ⟨Q,hq,hQcard⟩ := exists_max_packing (triangles (removeEdgeFamily G (support P)))
  obtain ⟨hPQ,hPQcard⟩ := append_residual hp hq
  refine ⟨heq,P ∪ Q,hPQ,subset_union_left,?_⟩
  omega

theorem one_triangle_residual {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {T : Finset V} (ht : T ∈ triangles G) :
    nu (triangles (removeEdgeFamily G (edges T))) + 1 = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily G (edges T))) + 2 = 2 * nu (triangles G) := by
  have hn := (small_packing_extension hG (packing_singleton ht) (Or.inl (card_singleton T))).1
  have hs : support ({T} : Finset (Finset V)) = edges T := by simp [support]
  rw [hs, card_singleton] at hn
  have hcard := edges_triangle_card (triangles_valid G T ht)
  have hmin := proper_deletion_tuza hG (card_pos.mp (by omega : 0 < (edges T).card))
    (fun e he => actual_edge_of_triangle ht he)
  have hc := tau_le_remove_add G (edges T)
  have hb := hG.1
  exact ⟨hn,by omega⟩

theorem edge_disjoint_triangles_ne {G : SimpleGraph V} {T U : Finset V}
    (ht : T ∈ triangles G) (hd : Disjoint (edges T) (edges U)) : T ≠ U := by
  intro heq
  have hempty : edges T = ∅ := disjoint_self.mp (heq ▸ hd)
  have hc := edges_triangle_card (triangles_valid G T ht)
  rw [hempty, card_empty] at hc
  omega

theorem packing_pair {G : SimpleGraph V} {T U : Finset V}
    (ht : T ∈ triangles G) (hu : U ∈ triangles G) (hd : Disjoint (edges T) (edges U)) :
    Packing (triangles G) {T,U} := by
  refine ⟨?_, ?_⟩
  · intro a ha
    rcases mem_insert.mp ha with rfl|ha
    · exact ht
    · exact mem_singleton.mp ha ▸ hu
  · intro s hs t ht' hst
    simp only [mem_insert,mem_singleton] at hs ht'
    rcases hs with rfl|rfl <;> rcases ht' with rfl|rfl
    · exact (hst rfl).elim
    · exact hd
    · exact hd.symm
    · exact (hst rfl).elim

theorem two_triangles_residual {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {T U : Finset V} (ht : T ∈ triangles G) (hu : U ∈ triangles G)
    (hd : Disjoint (edges T) (edges U)) :
    let R := removeEdgeFamily (removeEdgeFamily G (edges T)) (edges U)
    nu (triangles R) + 2 = nu (triangles G) ∧
    (tau (triangles R) + 5 = 2 * nu (triangles G) ∨
      tau (triangles R) + 4 = 2 * nu (triangles G)) := by
  dsimp only
  rw [remove_union]
  have hne := edge_disjoint_triangles_ne ht hd
  have hp := packing_pair ht hu hd
  have hpc : ({T,U} : Finset (Finset V)).card = 2 := by simp [hne]
  have hs : support ({T,U} : Finset (Finset V)) = edges T ∪ edges U := by simp [support]
  have hn := (small_packing_extension hG hp (Or.inr hpc)).1
  rw [hs,hpc] at hn
  have hcard : (edges T ∪ edges U).card = 6 := by
    rw [card_union_of_disjoint hd, edges_triangle_card (triangles_valid G T ht),
      edges_triangle_card (triangles_valid G U hu)]
  have hactual : ∀ e ∈ edges T ∪ edges U, G.IsNClique 2 e := by
    rw [← hs]
    exact support_actual hp
  have hm := proper_deletion_tuza hG (card_pos.mp (by omega : 0 < (edges T ∪ edges U).card)) hactual
  have hc := tau_le_remove_add G (edges T ∪ edges U)
  have hb := hG.1
  exact ⟨hn,by omega⟩

/-- Exact subtraction forms, derived from the non-underflowing equations. -/
theorem one_triangle_subtraction {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {T : Finset V} (ht : T ∈ triangles G) :
    nu (triangles (removeEdgeFamily G (edges T))) = nu (triangles G) - 1 ∧
    tau (triangles (removeEdgeFamily G (edges T))) = 2 * nu (triangles G) - 2 := by
  have h := one_triangle_residual hG ht
  omega
end TuzaA1
