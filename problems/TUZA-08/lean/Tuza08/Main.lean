import Tuza08.Counting

namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

namespace Data
variable {d : Data V}

theorem mixed_cost_gt (ht : d.t = tau (triangles d.H)) (hn : d.NoMixedMinimum)
    {C : EdgeSet V} (hc : d.MixedCover C) : d.t < C.card := by
  have hl : d.t ≤ C.card := by rw [ht]; exact tau_le_card hc.1.1
  have hne : C.card ≠ d.t := fun he => hn C hc.1 he hc.2
  omega

theorem minimum_obstruction (h : d.Hypotheses)
    (ht : d.t = tau (triangles d.H)) (hn : d.NoMixedMinimum) : d.Obstruction := by
  classical
  have hne : ¬ (d.Xu = ∅ ∨ d.Xv = ∅ ∨ d.Yu = ∅ ∨ d.Yv = ∅) := by
    intro he
    obtain ⟨C,hc,hcard⟩ := empty_mixed_bound h he
    have hgt := mixed_cost_gt ht hn hc
    omega
  have hxu : d.Xu.Nonempty := nonempty_iff_ne_empty.mpr (fun he => hne (Or.inl he))
  have hxv : d.Xv.Nonempty := nonempty_iff_ne_empty.mpr (fun he => hne (Or.inr (Or.inl he)))
  have hyu : d.Yu.Nonempty := nonempty_iff_ne_empty.mpr (fun he => hne (Or.inr (Or.inr (Or.inl he))))
  have hyv : d.Yv.Nonempty := nonempty_iff_ne_empty.mpr (fun he => hne (Or.inr (Or.inr (Or.inr he))))
  have hq : 2 ≤ d.q := by
    obtain ⟨C,hc,hcard⟩ := floor_bound h
    have hgt := mixed_cost_gt ht hn hc
    omega
  have px := (partitions h).1.2.2.2.2
  have py := (partitions h).2.2.2.2.2
  have hY := (outside_card_accounting h).1
  have nx := card_pos.mpr hxu
  have nv := card_pos.mpr hxv
  have ny := card_pos.mpr hyu
  have nw := card_pos.mpr hyv
  have hr : 3 ≤ d.r := by
    dsimp only [q,r] at *
    omega
  have first := cs1_verified d h
  refine ⟨hxu,hxv,hyu,hyv,hq,hr,?_,?_,?_,?_⟩
  · rw [first.difference_card_A]
    omega
  · rw [first.difference_card_B]
    omega
  · rw [first.symmetric_difference_card]
    omega
  · intro hthree
    dsimp only [q,r] at *
    omega
end Data

theorem cs4_verified (d : Data V) (h : d.Hypotheses) : d.CS4 :=
  Data.minimum_obstruction h

/-- Primary source-facing wrapper: the complete frozen arbitrary-graph target. -/
theorem cover_switch_verified : CoverSwitchTarget (V := V) := by
  intro d h
  exact ⟨cs1_verified d h,cs2_verified d h,cs3_verified d h,cs4_verified d h⟩

/-- Unbundled original input data. No minimality or extremal hypothesis occurs here. -/
theorem arbitrary_graph_cover_switch (H : SimpleGraph V) (u v a b : V)
    (CA CB : EdgeSet V) (t : ℕ) (hg : Geometry H u v a b)
    (hCA : GraphCover H CA) (hCB : GraphCover H CB)
    (hcA : CA.card = t) (hcB : CB.card = t)
    (ha : spokes u v a ⊆ CA) (hb : spokes u v b ⊆ CB)
    (havoidB : Disjoint CA (spokes u v b)) (havoidA : Disjoint CB (spokes u v a)) :
    (Data.mk H u v a b CA CB t).CoverSwitchResult :=
  cover_switch_verified _ ⟨hg,hCA,hCB,hcA,hcB,ha,hb,havoidB,havoidA⟩

/-- Sharp radius and neutral-edge bounds retain the full minimum-cover premise. -/
theorem sharp_bounds (d : Data V) (h : d.Hypotheses)
    (ht : d.t = tau (triangles d.H)) (hn : d.NoMixedMinimum) :
    2 ≤ d.q ∧ 3 ≤ d.r := by
  have ho := Data.minimum_obstruction h ht hn
  exact ⟨ho.neutral_lower,ho.radius_lower⟩

/-- Every one of the six specified classes is a singleton at exact radius three. -/
theorem rigid_six_classes (d : Data V) (h : d.Hypotheses)
    (ht : d.t = tau (triangles d.H)) (hn : d.NoMixedMinimum) (hr : d.r = 3) :
    d.Xu.card = 1 ∧ d.Xv.card = 1 ∧ d.X0.card = 1 ∧
    d.Yu.card = 1 ∧ d.Yv.card = 1 ∧ d.Y0.card = 1 :=
  (Data.minimum_obstruction h ht hn).rigid_six hr
end Tuza08
