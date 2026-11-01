import Tuza08.Basic

namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

namespace Data
variable {d : Data V}

theorem diagonal_disjoint (h : d.Hypotheses) :
    Disjoint ({d.v,d.a} : Edge V) {d.u,d.b} := by
  have g := h.geometry
  simp only [disjoint_left,mem_insert,mem_singleton]
  intro z hz hw
  rcases hz with rfl|rfl <;> rcases hw with heq|heq
  · exact g.uv heq.symm
  · exact g.vb heq
  · exact g.ua heq.symm
  · exact g.ab heq

theorem mixed_mono {C E : EdgeSet V} (hsub : C ⊆ E) (hm : d.Mixed C) : d.Mixed E := by
  obtain ⟨⟨e,he⟩,⟨f,hf⟩⟩ := hm
  exact ⟨⟨e,mem_inter.mpr ⟨hsub (mem_inter.mp he).1,(mem_inter.mp he).2⟩⟩,
    ⟨f,mem_inter.mpr ⟨hsub (mem_inter.mp hf).1,(mem_inter.mp hf).2⟩⟩⟩

theorem diagonal_mixed_uv (S : EdgeSet V) : d.Mixed ({{d.u,d.a},{d.v,d.b}} ∪ S) := by
  constructor
  · refine ⟨{d.u,d.a},?_⟩
    simp [A,spokes]
  · refine ⟨{d.v,d.b},?_⟩
    simp [B,spokes]

theorem diagonal_mixed_vu (S : EdgeSet V) : d.Mixed ({{d.v,d.a},{d.u,d.b}} ∪ S) := by
  simpa using (diagonal_mixed_uv (d := d.swapUV) S)

theorem Quv_mixed (d : Data V) : d.Mixed d.Quv := by
  constructor
  · refine ⟨{d.u,d.a},mem_inter.mpr ⟨?_,?_⟩⟩
    · simp [Quv]
    · simp [A,spokes]
  · refine ⟨{d.v,d.b},mem_inter.mpr ⟨?_,?_⟩⟩
    · simp [Quv]
    · simp [B,spokes]

theorem Qvu_mixed (d : Data V) : d.Mixed d.Qvu := by
  simpa using Quv_mixed d.swapUV

theorem Quv_actual (h : d.Hypotheses) : ∀ e ∈ d.Quv, d.J.IsNClique 2 e := by
  intro e he
  simp only [Quv,mem_union,mem_insert,mem_singleton] at he
  rcases he with ((((he|he)|he)|he)|he)|he
  · exact he ▸ pair_actual (residual_geometry h).adj_ua
  · exact he ▸ pair_actual (residual_geometry h).adj_vb
  · exact (residual_cover_A h).2 e (mem_union_right _ (mem_oriented.mp he).1)
  · exact (residual_cover_B h).2 e (mem_union_right _ (mem_oriented.mp he).1)
  · exact (residual_cover_A h).2 e (mem_union_right _ (mem_sdiff.mp he).1)
  · exact (residual_cover_B h).2 e (mem_union_right _ (mem_sdiff.mp he).1)

theorem Quv_covers (h : d.Hypotheses) : Covers (triangles d.J) d.Quv := by
  classical
  intro T ht
  by_contra hn
  have avoid : ∀ e ∈ d.Quv, e ∉ edges T := fun e he het => hn ⟨e,he,het⟩
  have hua : ({d.u,d.a} : Edge V) ∉ edges T := avoid _ (by simp [Quv])
  have hvb : ({d.v,d.b} : Edge V) ∉ edges T := avoid _ (by simp [Quv])
  have hXu : ∀ e ∈ d.Xu, e ∉ edges T := fun e he => avoid e (by simp [Quv,he])
  have hYv : ∀ e ∈ d.Yv, e ∉ edges T := fun e he => avoid e (by simp [Quv,he])
  have hX0 : ∀ e ∈ d.X0, e ∉ edges T := fun e he => avoid e (by simp [Quv,he])
  have hY0 : ∀ e ∈ d.Y0, e ∉ edges T := fun e he => avoid e (by simp [Quv,he])
  have left : ({d.v,d.a} : Edge V) ∈ edges T ∨ ∃ x ∈ d.Xv, x ∈ edges T := by
    obtain ⟨e,he,het⟩ := (residual_cover_A h).1 T ht
    rcases mem_union.mp he with he|he
    · rcases mem_spokes.mp he with rfl|rfl
      · exact (hua het).elim
      · exact Or.inl het
    · apply Or.inr
      refine ⟨e,?_,het⟩
      by_contra hxv
      have hxu : e ∉ d.Xu := fun hm => hXu e hm het
      exact hX0 e (mem_sdiff.mpr ⟨he,by simp [hxu,hxv]⟩) het
  have right : ({d.u,d.b} : Edge V) ∈ edges T ∨ ∃ y ∈ d.Yu, y ∈ edges T := by
    obtain ⟨e,he,het⟩ := (residual_cover_B h).1 T ht
    rcases mem_union.mp he with he|he
    · rcases mem_spokes.mp he with rfl|rfl
      · exact Or.inl het
      · exact (hvb het).elim
    · apply Or.inr
      refine ⟨e,?_,het⟩
      by_contra hyu
      have hyv : e ∉ d.Yv := fun hm => hYv e hm het
      exact hY0 e (mem_sdiff.mpr ⟨he,by simp [hyu,hyv]⟩) het
  rcases left with hva|⟨x,hx,hxt⟩ <;> rcases right with hub|⟨y,hy,hyt⟩
  · exact disjoint_edges_not_triangle ht hva hub (diagonal_disjoint h)
  · have hdB : Disjoint (edges T) d.B := by
      apply disjoint_right.mpr
      intro e he het
      rcases mem_spokes.mp he with rfl|rfl
      · exact disjoint_edges_not_triangle ht hva het (diagonal_disjoint h)
      · exact hvb het
    have hyv : y ∈ d.Yv := mem_oriented.mpr ⟨(mem_oriented.mp hy).1,T,ht,hyt,hva,hdB⟩
    exact disjoint_left.mp (partitions h).2.2.1 hy hyv
  · have hdA : Disjoint (edges T) d.A := by
      apply disjoint_right.mpr
      intro e he het
      rcases mem_spokes.mp he with rfl|rfl
      · exact hua het
      · exact disjoint_edges_not_triangle ht het hub (diagonal_disjoint h)
    have hxu : x ∈ d.Xu := mem_oriented.mpr ⟨(mem_oriented.mp hx).1,T,ht,hxt,hub,hdA⟩
    exact disjoint_left.mp (partitions h).1.2.1 hxu hx
  · exact disjoint_edges_not_triangle ht hxt hyt (opposite_vu h x hx y hy)

theorem Quv_graphCover (h : d.Hypotheses) : GraphCover d.J d.Quv :=
  ⟨Quv_covers h,Quv_actual h⟩

theorem Qvu_graphCover (h : d.Hypotheses) : GraphCover d.J d.Qvu := by
  simpa using Quv_graphCover h.swapUV

theorem lifted_Quv (h : d.Hypotheses) : d.MixedCover (d.D ∪ d.Quv) :=
  ⟨graphCover_lift (actual_D h) (Quv_graphCover h),mixed_mono subset_union_right (Quv_mixed d)⟩

theorem lifted_Qvu (h : d.Hypotheses) : d.MixedCover (d.D ∪ d.Qvu) :=
  ⟨graphCover_lift (actual_D h) (Qvu_graphCover h),mixed_mono subset_union_right (Qvu_mixed d)⟩

/-- Direct substitution, independent of the number of neutral edges. -/
theorem empty_Yv_cover (h : d.Hypotheses) (hempty : d.Yv = ∅) :
    GraphCover d.J ({{d.u,d.a},{d.v,d.b}} ∪ d.X) := by
  classical
  refine ⟨?_,?_⟩
  · intro T ht
    by_contra hn
    have avoid : ∀ e ∈ ({{d.u,d.a},{d.v,d.b}} ∪ d.X), e ∉ edges T :=
      fun e he het => hn ⟨e,he,het⟩
    have hua : ({d.u,d.a} : Edge V) ∉ edges T := avoid _ (by simp)
    have hvb : ({d.v,d.b} : Edge V) ∉ edges T := avoid _ (by simp)
    obtain ⟨e,he,het⟩ := (residual_cover_A h).1 T ht
    have hva : ({d.v,d.a} : Edge V) ∈ edges T := by
      rcases mem_union.mp he with he|he
      · rcases mem_spokes.mp he with rfl|rfl
        · exact (hua het).elim
        · exact het
      · exact (avoid e (mem_union_right _ he) het).elim
    have hub : ({d.u,d.b} : Edge V) ∉ edges T := fun hub =>
      disjoint_edges_not_triangle ht hva hub (diagonal_disjoint h)
    obtain ⟨y,hy,hyt⟩ := (residual_cover_B h).1 T ht
    have hyY : y ∈ d.Y := by
      rcases mem_union.mp hy with hy|hy
      · rcases mem_spokes.mp hy with rfl|rfl
        · exact (hub hyt).elim
        · exact (hvb hyt).elim
      · exact hy
    have hdB : Disjoint (edges T) d.B := by
      apply disjoint_right.mpr
      intro f hf hft
      rcases mem_spokes.mp hf with rfl|rfl
      · exact hub hft
      · exact hvb hft
    have hyv : y ∈ d.Yv := mem_oriented.mpr ⟨hyY,T,ht,hyt,hva,hdB⟩
    simpa [hempty] using hyv
  · intro e he
    rcases mem_union.mp he with he|he
    · simp only [mem_insert,mem_singleton] at he
      rcases he with rfl|rfl
      · exact pair_actual (residual_geometry h).adj_ua
      · exact pair_actual (residual_geometry h).adj_vb
    · exact (residual_cover_A h).2 e (mem_union_right _ he)

theorem empty_Yu_cover (h : d.Hypotheses) (hempty : d.Yu = ∅) :
    GraphCover d.J ({{d.v,d.a},{d.u,d.b}} ∪ d.X) := by
  simpa using empty_Yv_cover h.swapUV (by simpa using hempty)

theorem empty_Xv_cover (h : d.Hypotheses) (hempty : d.Xv = ∅) :
    GraphCover d.J ({{d.v,d.a},{d.u,d.b}} ∪ d.Y) := by
  simpa only [swapAB_J,swapAB_X,swapAB_u,swapAB_v,swapAB_a,swapAB_b,pair_comm] using
    empty_Yv_cover h.swapAB (by simpa using hempty)

theorem empty_Xu_cover (h : d.Hypotheses) (hempty : d.Xu = ∅) :
    GraphCover d.J ({{d.u,d.a},{d.v,d.b}} ∪ d.Y) := by
  simpa using empty_Xv_cover h.swapUV (by simpa using hempty)
end Data

theorem cs2_verified (d : Data V) (h : d.Hypotheses) : d.CS2 :=
  ⟨⟨Data.Quv_graphCover h,Data.Quv_mixed d⟩,⟨Data.Qvu_graphCover h,Data.Qvu_mixed d⟩,
    Data.lifted_Quv h,Data.lifted_Qvu h⟩
end Tuza08
