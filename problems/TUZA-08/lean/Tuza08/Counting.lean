import Tuza08.Covers

namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

theorem switch_union_card {P S R U W N M : EdgeSet V}
    (hP : P.card = 2) (hPS : Disjoint P S) (hPR : Disjoint P R)
    (hSR : Disjoint S R) (hU : U ⊆ S) (hN : N ⊆ S) (hW : W ⊆ R) (hM : M ⊆ R)
    (hUN : Disjoint U N) (hWM : Disjoint W M) :
    (P ∪ U ∪ W ∪ N ∪ M).card = 2 + U.card + W.card + N.card + M.card := by
  have heq : P ∪ U ∪ W ∪ N ∪ M = P ∪ ((U ∪ N) ∪ (W ∪ M)) := by
    simp only [union_assoc,union_left_comm,union_comm]
  have hUNs := union_subset hU hN
  have hWMs := union_subset hW hM
  rw [heq,card_union_of_disjoint (disjoint_union_right.mpr
    ⟨hPS.mono_right hUNs,hPR.mono_right hWMs⟩),
    card_union_of_disjoint (hSR.mono hUNs hWMs),
    card_union_of_disjoint hUN,card_union_of_disjoint hWM,hP]
  omega

theorem actual_removed_not_mem {G : SimpleGraph V} {D : EdgeSet V} {e : Edge V}
    (he : (removeEdgeFamily G D).IsNClique 2 e) : e ∉ D := by
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp he.card_eq
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have hn := (he.isClique ha hb hab).2
  simpa [heq] using hn

namespace Data
variable {d : Data V}

theorem diagonal_uv_card (h : d.Hypotheses) :
    ({{d.u,d.a},{d.v,d.b}} : EdgeSet V).card = 2 := by
  have hne : ({d.u,d.a} : Edge V) ≠ {d.v,d.b} := by
    intro heq
    have hu : d.u ∈ ({d.v,d.b} : Edge V) := heq ▸ (by simp : d.u ∈ ({d.u,d.a} : Edge V))
    simp only [mem_insert,mem_singleton] at hu
    exact hu.elim h.geometry.uv h.geometry.ub
  simp [hne]

theorem diagonal_uv_subset : ({{d.u,d.a},{d.v,d.b}} : EdgeSet V) ⊆ d.A ∪ d.B := by
  intro e he
  simp only [mem_insert,mem_singleton] at he
  rcases he with rfl|rfl <;> simp [A,B,spokes]

theorem cost_Quv (h : d.Hypotheses) :
    d.Quv.card = 2 + d.Xu.card + d.Yv.card + d.X0.card + d.Y0.card := by
  exact switch_union_card (diagonal_uv_card h)
    (((outside_X h).mono_right diagonal_uv_subset).symm)
    (((outside_Y h).mono_right diagonal_uv_subset).symm)
    disjoint_XY (oriented_subset _ _ _ _ _) sdiff_subset (oriented_subset _ _ _ _ _) sdiff_subset
    (partitions h).1.2.2.1 (partitions h).2.2.2.2.1

theorem cost_Qvu (h : d.Hypotheses) :
    d.Qvu.card = 2 + d.Xv.card + d.Yu.card + d.X0.card + d.Y0.card := by
  simpa using cost_Quv h.swapUV

theorem cost_sum (h : d.Hypotheses) : d.Quv.card + d.Qvu.card = 4 + 2*d.r + d.q := by
  have hx := (partitions h).1.2.2.2.2
  have hy := (partitions h).2.2.2.2.2
  have hc := (outside_card_accounting h).1
  rw [cost_Quv h,cost_Qvu h]
  dsimp only [q,r] at *
  omega

theorem lifted_card {C : EdgeSet V} (hc : GraphCover d.J C) :
    (d.D ∪ C).card = d.D.card + C.card := by
  apply card_union_of_disjoint
  apply disjoint_left.mpr
  exact fun e he hc' => actual_removed_not_mem (hc.2 e hc') he

theorem one_constructed_bound (h : d.Hypotheses) :
    (d.D ∪ d.Quv).card ≤ d.t + d.q/2 ∨ (d.D ∪ d.Qvu).card ≤ d.t + d.q/2 := by
  have hs := cost_sum h
  have hc := (outside_card_accounting h).2
  rw [lifted_card (Quv_graphCover h),lifted_card (Qvu_graphCover h)]
  omega

theorem precise_bound (h : d.Hypotheses) :
    ∃ C, d.MixedCover C ∧ C.card = d.D.card + min d.Quv.card d.Qvu.card := by
  by_cases hle : d.Quv.card ≤ d.Qvu.card
  · exact ⟨d.D ∪ d.Quv,lifted_Quv h,by rw [min_eq_left hle]; exact lifted_card (Quv_graphCover h)⟩
  · exact ⟨d.D ∪ d.Qvu,lifted_Qvu h,by rw [min_eq_right (by omega)]; exact lifted_card (Qvu_graphCover h)⟩

theorem floor_bound (h : d.Hypotheses) :
    ∃ C, d.MixedCover C ∧ C.card ≤ d.t + d.q/2 := by
  rcases one_constructed_bound h with hu|hv
  · exact ⟨_,lifted_Quv h,hu⟩
  · exact ⟨_,lifted_Qvu h,hv⟩

theorem trivial_bound (h : d.Hypotheses) : ∃ C, d.MixedCover C ∧ C.card ≤ d.t + 1 := by
  let C := insert ({d.u,d.b} : Edge V) d.CA
  have hcover : GraphCover d.H C := by
    refine ⟨?_,?_⟩
    · intro T ht
      obtain ⟨e,he,het⟩ := h.coverA.1 T ht
      exact ⟨e,mem_insert_of_mem he,het⟩
    · intro e he
      rcases mem_insert.mp he with rfl|he
      · exact pair_actual h.geometry.adj_ub
      · exact h.coverA.2 e he
  have hmixed : d.Mixed C := by
    constructor
    · refine ⟨{d.u,d.a},mem_inter.mpr ⟨mem_insert_of_mem (h.containsA ?_),?_⟩⟩ <;> simp [A,spokes]
    · refine ⟨{d.u,d.b},mem_inter.mpr ⟨mem_insert_self _ _,?_⟩⟩
      simp [B,spokes]
  exact ⟨C,⟨hcover,hmixed⟩,by simpa only [h.cardA] using card_insert_le ({d.u,d.b} : Edge V) d.CA⟩

theorem combined_bound (h : d.Hypotheses) :
    ∃ C, d.MixedCover C ∧ C.card ≤ d.t + min 1 (d.q/2) := by
  by_cases hle : d.q/2 ≤ 1
  · simpa only [min_eq_right hle] using floor_bound h
  · simpa only [min_eq_left (show 1 ≤ d.q/2 by omega)] using trivial_bound h

/-- Exact costs of the direct empty-orientation switches, even before emptiness is assumed. -/
theorem diagonal_union_X_card (h : d.Hypotheses) :
    ({{d.u,d.a},{d.v,d.b}} ∪ d.X).card = d.r + 2 := by
  rw [card_union_of_disjoint (((outside_X h).mono_right diagonal_uv_subset).symm),diagonal_uv_card h]
  simp [r,Nat.add_comm]

theorem diagonal_union_Y_card (h : d.Hypotheses) :
    ({{d.u,d.a},{d.v,d.b}} ∪ d.Y).card = d.r + 2 := by
  rw [card_union_of_disjoint (((outside_Y h).mono_right diagonal_uv_subset).symm),
    diagonal_uv_card h,(outside_card_accounting h).1]
  omega

theorem antidiagonal_union_X_card (h : d.Hypotheses) :
    ({{d.v,d.a},{d.u,d.b}} ∪ d.X).card = d.r + 2 := by
  simpa only [swapUV_u,swapUV_v,swapUV_a,swapUV_b,swapUV_X,r] using diagonal_union_X_card h.swapUV

theorem antidiagonal_union_Y_card (h : d.Hypotheses) :
    ({{d.v,d.a},{d.u,d.b}} ∪ d.Y).card = d.r + 2 := by
  simpa only [swapUV_u,swapUV_v,swapUV_a,swapUV_b,swapUV_Y,r,swapUV_X] using diagonal_union_Y_card h.swapUV

theorem lift_empty_switch (h : d.Hypotheses) {C : EdgeSet V}
    (hc : GraphCover d.J C) (hm : d.Mixed C) (hcard : C.card = d.r + 2) :
    ∃ E, d.MixedCover E ∧ E.card ≤ d.t := by
  refine ⟨d.D ∪ C,⟨graphCover_lift (actual_D h) hc,mixed_mono subset_union_right hm⟩,?_⟩
  rw [lifted_card hc,hcard]
  have heq := (outside_card_accounting h).2
  omega

theorem empty_mixed_bound (h : d.Hypotheses)
    (he : d.Xu = ∅ ∨ d.Xv = ∅ ∨ d.Yu = ∅ ∨ d.Yv = ∅) :
    ∃ C, d.MixedCover C ∧ C.card ≤ d.t := by
  rcases he with he|he|he|he
  · exact lift_empty_switch h (empty_Xu_cover h he) (diagonal_mixed_uv _) (diagonal_union_Y_card h)
  · exact lift_empty_switch h (empty_Xv_cover h he) (diagonal_mixed_vu _) (antidiagonal_union_Y_card h)
  · exact lift_empty_switch h (empty_Yu_cover h he) (diagonal_mixed_vu _) (antidiagonal_union_X_card h)
  · exact lift_empty_switch h (empty_Yv_cover h he) (diagonal_mixed_uv _) (diagonal_union_X_card h)
end Data

theorem cs3_verified (d : Data V) (h : d.Hypotheses) : d.CS3 :=
  ⟨Data.cost_Quv h,Data.cost_Qvu h,Data.cost_sum h,
    Data.lifted_card (Data.Quv_graphCover h),Data.lifted_card (Data.Qvu_graphCover h),
    Data.one_constructed_bound h,Data.precise_bound h,Data.trivial_bound h,Data.combined_bound h,
    Data.empty_Yv_cover h,Data.empty_Yu_cover h,Data.empty_Xv_cover h,Data.empty_Xu_cover h,
    Data.empty_mixed_bound h⟩
end Tuza08
