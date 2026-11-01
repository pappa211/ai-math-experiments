import Tuza08.Geometry

namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

@[simp] theorem mem_oriented {G : SimpleGraph V} {avoid S : EdgeSet V} {p c : V} {e : Edge V} :
    e ∈ oriented G avoid S p c ↔ e ∈ S ∧ ∃ T, Witness G avoid p c e T := by
  classical
  simp [oriented]

theorem oriented_subset (G : SimpleGraph V) (avoid S : EdgeSet V) (p c : V) :
    oriented G avoid S p c ⊆ S := fun _ he => (mem_oriented.mp he).1

theorem actual_edge_remove {G : SimpleGraph V} {S : EdgeSet V} {e : Edge V}
    (he : G.IsNClique 2 e) (hn : e ∉ S) : (removeEdgeFamily G S).IsNClique 2 e := by
  refine ⟨?_,he.card_eq⟩
  intro a ha b hb hab
  refine ⟨he.isClique ha hb hab,?_⟩
  have hp : ({a,b} : Finset V) = e := eq_of_subset_of_card_le
    (by simpa only [insert_subset_iff,singleton_subset_iff,mem_coe] using And.intro ha hb)
    (by simp [hab,he.card_eq])
  simpa [hp] using hn

theorem graphCover_lift {G : SimpleGraph V} {D C : EdgeSet V}
    (hd : ∀ e ∈ D, G.IsNClique 2 e) (hc : GraphCover (removeEdgeFamily G D) C) :
    GraphCover G (D ∪ C) := by
  refine ⟨?_,?_⟩
  · intro T ht
    by_cases hr : T ∈ triangles (removeEdgeFamily G D)
    · obtain ⟨e,he,het⟩ := hc.1 T hr
      exact ⟨e,mem_union_right _ he,het⟩
    · obtain ⟨e,he,het⟩ := removeEdgeFamily_lost ht hr
      exact ⟨e,mem_union_left _ he,het⟩
  · intro e he
    rcases mem_union.mp he with he|he
    · exact hd e he
    · exact (hc.2 e he).mono (removeEdgeFamily_le G D)

theorem partition_of_disjoint {S U W : EdgeSet V} (hu : U ⊆ S) (hw : W ⊆ S)
    (hd : Disjoint U W) : Data.Partition S U W (S \ (U ∪ W)) := by
  have hsub : U ∪ W ⊆ S := union_subset hu hw
  have heq : U ∪ W ∪ (S \ (U ∪ W)) = S := union_sdiff_of_subset hsub
  have hdn : Disjoint (U ∪ W) (S \ (U ∪ W)) := disjoint_sdiff_self_right
  have huc : Disjoint U (S \ (U ∪ W)) := hdn.mono_left subset_union_left
  have hwc : Disjoint W (S \ (U ∪ W)) := hdn.mono_left subset_union_right
  refine ⟨heq,hd,huc,hwc,?_⟩
  rw [← card_union_of_disjoint hd,← card_union_of_disjoint hdn,heq]

namespace Data
variable (d : Data V)

def swapUV : Data V := {d with u := d.v, v := d.u}
def swapAB : Data V := {d with a := d.b, b := d.a, CA := d.CB, CB := d.CA}

@[simp] theorem swapUV_H : d.swapUV.H = d.H := rfl
@[simp] theorem swapUV_u : d.swapUV.u = d.v := rfl
@[simp] theorem swapUV_v : d.swapUV.v = d.u := rfl
@[simp] theorem swapUV_a : d.swapUV.a = d.a := rfl
@[simp] theorem swapUV_b : d.swapUV.b = d.b := rfl
@[simp] theorem swapUV_CA : d.swapUV.CA = d.CA := rfl
@[simp] theorem swapUV_CB : d.swapUV.CB = d.CB := rfl
@[simp] theorem swapUV_t : d.swapUV.t = d.t := rfl
@[simp] theorem swapAB_H : d.swapAB.H = d.H := rfl
@[simp] theorem swapAB_u : d.swapAB.u = d.u := rfl
@[simp] theorem swapAB_v : d.swapAB.v = d.v := rfl
@[simp] theorem swapAB_a : d.swapAB.a = d.b := rfl
@[simp] theorem swapAB_b : d.swapAB.b = d.a := rfl
@[simp] theorem swapAB_CA : d.swapAB.CA = d.CB := rfl
@[simp] theorem swapAB_CB : d.swapAB.CB = d.CA := rfl
@[simp] theorem swapAB_t : d.swapAB.t = d.t := rfl

@[simp] theorem swapUV_A : d.swapUV.A = d.A := by simp [A,spokes,pair_comm]
@[simp] theorem swapUV_B : d.swapUV.B = d.B := by simp [B,spokes,pair_comm]
@[simp] theorem swapUV_DA : d.swapUV.DA = d.DA := by simp [DA]
@[simp] theorem swapUV_DB : d.swapUV.DB = d.DB := by simp [DB]
@[simp] theorem swapUV_D : d.swapUV.D = d.D := by simp [D]
@[simp] theorem swapUV_X : d.swapUV.X = d.X := by simp [X]
@[simp] theorem swapUV_Y : d.swapUV.Y = d.Y := by simp [Y]
@[simp] theorem swapUV_J : d.swapUV.J = d.J := by simp [J]
@[simp] theorem swapUV_Xu : d.swapUV.Xu = d.Xv := by simp [Xu,Xv]
@[simp] theorem swapUV_Xv : d.swapUV.Xv = d.Xu := by simp [Xu,Xv]
@[simp] theorem swapUV_Yu : d.swapUV.Yu = d.Yv := by simp [Yu,Yv]
@[simp] theorem swapUV_Yv : d.swapUV.Yv = d.Yu := by simp [Yu,Yv]
@[simp] theorem swapUV_X0 : d.swapUV.X0 = d.X0 := by simp [X0,union_comm]
@[simp] theorem swapUV_Y0 : d.swapUV.Y0 = d.Y0 := by simp [Y0,union_comm]
@[simp] theorem swapUV_Quv : d.swapUV.Quv = d.Qvu := by simp [Quv,Qvu]
@[simp] theorem swapUV_Qvu : d.swapUV.Qvu = d.Quv := by simp [Quv,Qvu]
@[simp] theorem swapUV_Mixed (C : EdgeSet V) : d.swapUV.Mixed C ↔ d.Mixed C := by simp [Mixed]

@[simp] theorem swapAB_A : d.swapAB.A = d.B := rfl
@[simp] theorem swapAB_B : d.swapAB.B = d.A := rfl
@[simp] theorem swapAB_DA : d.swapAB.DA = d.DB := rfl
@[simp] theorem swapAB_DB : d.swapAB.DB = d.DA := rfl
@[simp] theorem swapAB_D : d.swapAB.D = d.D := by simp [D,inter_comm]
@[simp] theorem swapAB_X : d.swapAB.X = d.Y := rfl
@[simp] theorem swapAB_Y : d.swapAB.Y = d.X := rfl
@[simp] theorem swapAB_J : d.swapAB.J = d.J := by simp [J]
@[simp] theorem swapAB_Xu : d.swapAB.Xu = d.Yu := by simp [Xu,Yu]
@[simp] theorem swapAB_Xv : d.swapAB.Xv = d.Yv := by simp [Xv,Yv]
@[simp] theorem swapAB_Yu : d.swapAB.Yu = d.Xu := by simp [Xu,Yu]
@[simp] theorem swapAB_Yv : d.swapAB.Yv = d.Xv := by simp [Xv,Yv]
@[simp] theorem swapAB_X0 : d.swapAB.X0 = d.Y0 := by simp [X0,Y0]
@[simp] theorem swapAB_Y0 : d.swapAB.Y0 = d.X0 := by simp [X0,Y0]

variable {d}
theorem Hypotheses.swapUV (h : d.Hypotheses) : d.swapUV.Hypotheses where
  geometry := h.geometry.swapUV
  coverA := h.coverA
  coverB := h.coverB
  cardA := h.cardA
  cardB := h.cardB
  containsA := by simpa using h.containsA
  containsB := by simpa using h.containsB
  avoidsB := by simpa using h.avoidsB
  avoidsA := by simpa using h.avoidsA

theorem Hypotheses.swapAB (h : d.Hypotheses) : d.swapAB.Hypotheses where
  geometry := h.geometry.swapAB
  coverA := h.coverB
  coverB := h.coverA
  cardA := h.cardB
  cardB := h.cardA
  containsA := h.containsB
  containsB := h.containsA
  avoidsB := h.avoidsA
  avoidsA := h.avoidsB

theorem outside_X (h : d.Hypotheses) : Disjoint d.X (d.A ∪ d.B) := by
  apply disjoint_left.mpr
  intro e he hs
  have hx := mem_sdiff.mp he
  have ha := mem_sdiff.mp hx.1
  rcases mem_union.mp hs with hs|hs
  · exact ha.2 hs
  · exact disjoint_left.mp h.avoidsB ha.1 hs

theorem outside_Y (h : d.Hypotheses) : Disjoint d.Y (d.A ∪ d.B) := by
  simpa only [swapAB_X,swapAB_A,swapAB_B,union_comm] using outside_X h.swapAB

theorem outside_D (h : d.Hypotheses) : Disjoint d.D (d.A ∪ d.B) := by
  apply disjoint_left.mpr
  intro e he hs
  have hd := mem_inter.mp he
  rcases mem_union.mp hs with hs|hs
  · exact (mem_sdiff.mp hd.1).2 hs
  · exact (mem_sdiff.mp hd.2).2 hs

theorem disjoint_DX : Disjoint d.D d.X := by
  apply disjoint_left.mpr
  intro e he hx
  exact (mem_sdiff.mp hx).2 (mem_inter.mp he).2

theorem disjoint_DY : Disjoint d.D d.Y := by
  apply disjoint_left.mpr
  intro e he hy
  exact (mem_sdiff.mp hy).2 (mem_inter.mp he).1

theorem disjoint_XY : Disjoint d.X d.Y := by
  apply disjoint_left.mpr
  intro e hx hy
  exact (mem_sdiff.mp hx).2 (mem_sdiff.mp hy).1

theorem decompose_A (h : d.Hypotheses) : d.CA = d.A ∪ d.D ∪ d.X := by
  ext e
  have ha : e ∈ d.A → e ∈ d.CA := fun he => h.containsA he
  simp only [D,X,DA,DB,mem_union,mem_inter,mem_sdiff]
  by_cases hA : e ∈ d.A <;> by_cases hCA : e ∈ d.CA <;>
    by_cases hCB : e ∈ d.CB <;> by_cases hB : e ∈ d.B <;> simp_all

theorem decompose_B (h : d.Hypotheses) : d.CB = d.B ∪ d.D ∪ d.Y := by
  simpa only [swapAB_CA,swapAB_A,swapAB_D,swapAB_X] using decompose_A h.swapAB

theorem actual_D (h : d.Hypotheses) : ∀ e ∈ d.D, d.H.IsNClique 2 e :=
  fun e he => h.coverA.2 e (mem_sdiff.mp (mem_inter.mp he).1).1

theorem actual_X (h : d.Hypotheses) : ∀ e ∈ d.X, d.H.IsNClique 2 e :=
  fun e he => h.coverA.2 e (mem_sdiff.mp (mem_sdiff.mp he).1).1

theorem actual_Y (h : d.Hypotheses) : ∀ e ∈ d.Y, d.H.IsNClique 2 e :=
  fun e he => h.coverB.2 e (mem_sdiff.mp (mem_sdiff.mp he).1).1

theorem residual_geometry (h : d.Hypotheses) : Geometry d.J d.u d.v d.a d.b := by
  have g := h.geometry
  refine ⟨g.uv,g.ua,g.ub,g.va,g.vb,g.ab,?_,?_⟩
  · exact fun hadj => g.nonadj hadj.1
  · intro w
    constructor
    · rintro ⟨hu,hv⟩
      exact (g.common w).mp ⟨hu.1,hv.1⟩
    · intro hw
      have hold := (g.common w).mpr hw
      have hua : ({d.u,w} : Edge V) ∈ d.A ∪ d.B := by
        rcases hw with rfl|rfl <;> simp [A,B,spokes]
      have hva : ({d.v,w} : Edge V) ∈ d.A ∪ d.B := by
        rcases hw with rfl|rfl <;> simp [A,B,spokes]
      exact ⟨⟨hold.1,fun he => disjoint_left.mp (outside_D h) he hua⟩,
        ⟨hold.2,fun he => disjoint_left.mp (outside_D h) he hva⟩⟩

theorem residual_cover_A (h : d.Hypotheses) : GraphCover d.J (d.A ∪ d.X) := by
  refine ⟨?_,?_⟩
  · intro T ht
    have htH := triangles_mono_graph (removeEdgeFamily_le d.H d.D) ht
    obtain ⟨e,he,het⟩ := h.coverA.1 T htH
    rw [decompose_A h] at he
    have hn : e ∉ d.D := removeEdgeFamily_surviving ht het
    refine ⟨e,?_,het⟩
    simp only [mem_union] at he ⊢
    exact he.elim (fun he => he.elim Or.inl (fun hd => (hn hd).elim)) Or.inr
  · intro e he
    rcases mem_union.mp he with he|he
    · exact spokes_actual (residual_geometry h) e he
    · exact actual_edge_remove (actual_X h e he) (fun hd => disjoint_left.mp disjoint_DX hd he)

theorem residual_cover_B (h : d.Hypotheses) : GraphCover d.J (d.B ∪ d.Y) := by
  simpa only [swapAB_J,swapAB_A,swapAB_X] using residual_cover_A h.swapAB

theorem outside_card_accounting (h : d.Hypotheses) :
    d.Y.card = d.r ∧ d.D.card + d.r + 2 = d.t := by
  have hdA : Disjoint d.A d.D := ((outside_D h).mono_right subset_union_left).symm
  have hxA : Disjoint d.A d.X := ((outside_X h).mono_right subset_union_left).symm
  have hdB : Disjoint d.B d.D := ((outside_D h).mono_right subset_union_right).symm
  have hyB : Disjoint d.B d.Y := ((outside_Y h).mono_right subset_union_right).symm
  have hca : d.CA.card = 2 + d.D.card + d.X.card := by
    rw [decompose_A h,card_union_of_disjoint (disjoint_union_left.mpr ⟨hxA,disjoint_DX⟩),
      card_union_of_disjoint hdA,(show d.A.card = 2 from spokes_card h.geometry)]
  have hcb : d.CB.card = 2 + d.D.card + d.Y.card := by
    rw [decompose_B h,card_union_of_disjoint (disjoint_union_left.mpr ⟨hyB,disjoint_DY⟩),
      card_union_of_disjoint hdB,(show d.B.card = 2 from spokes_card h.geometry.swapAB)]
  have ha := h.cardA
  have hb := h.cardB
  dsimp only [r]
  omega

theorem difference_A (h : d.Hypotheses) : d.CA \ d.CB = d.A ∪ d.X := by
  ext e
  have hna : e ∈ d.A → e ∉ d.CB := fun he hc => disjoint_left.mp h.avoidsA hc he
  have hnb : e ∈ d.B → e ∉ d.CA := fun he hc => disjoint_left.mp h.avoidsB hc he
  have hca : e ∈ d.A → e ∈ d.CA := fun he => h.containsA he
  have hcb : e ∈ d.B → e ∈ d.CB := fun he => h.containsB he
  simp only [X,DA,DB,mem_sdiff,mem_union]
  by_cases hA : e ∈ d.A <;> by_cases hB : e ∈ d.B <;>
    by_cases hCA : e ∈ d.CA <;> by_cases hCB : e ∈ d.CB <;> simp_all

theorem difference_B (h : d.Hypotheses) : d.CB \ d.CA = d.B ∪ d.Y := by
  simpa only [swapAB_CA,swapAB_CB,swapAB_A,swapAB_X] using difference_A h.swapAB

theorem partitions (h : d.Hypotheses) :
    Partition d.X d.Xu d.Xv d.X0 ∧ Partition d.Y d.Yu d.Yv d.Y0 := by
  have hx : Disjoint d.Xu d.Xv := by
    apply disjoint_left.mpr
    intro e he hf
    obtain ⟨hex,T,hT⟩ := mem_oriented.mp he
    obtain ⟨_,U,hU⟩ := mem_oriented.mp hf
    have hout : e ∉ d.B ∪ d.A := by
      simpa only [union_comm] using (fun hm => disjoint_left.mp (outside_X h) hex hm)
    exact witness_not_both (residual_geometry h).swapAB hout hT hU
  have hy : Disjoint d.Yu d.Yv := by
    apply disjoint_left.mpr
    intro e he hf
    obtain ⟨hey,T,hT⟩ := mem_oriented.mp he
    obtain ⟨_,U,hU⟩ := mem_oriented.mp hf
    exact witness_not_both (residual_geometry h)
      (fun hm => disjoint_left.mp (outside_Y h) hey hm) hT hU
  exact ⟨partition_of_disjoint (oriented_subset _ _ _ _ _) (oriented_subset _ _ _ _ _) hx,
    partition_of_disjoint (oriented_subset _ _ _ _ _) (oriented_subset _ _ _ _ _) hy⟩

theorem opposite_vu (h : d.Hypotheses) : ∀ x ∈ d.Xv, ∀ y ∈ d.Yu, Disjoint x y := by
  intro x hx y hy
  obtain ⟨hex,T,hT⟩ := mem_oriented.mp hx
  obtain ⟨hey,U,hU⟩ := mem_oriented.mp hy
  exact opposite_disjoint (residual_geometry h)
    (fun hm => disjoint_left.mp (outside_X h) hex hm)
    (fun hm => disjoint_left.mp (outside_Y h) hey hm) hT hU

theorem opposite_uv (h : d.Hypotheses) : ∀ x ∈ d.Xu, ∀ y ∈ d.Yv, Disjoint x y := by
  simpa only [swapUV_Xv,swapUV_Yu] using opposite_vu h.swapUV

end Data

theorem cs1_verified (d : Data V) (h : d.Hypotheses) : d.CS1 := by
  have hc := Data.outside_card_accounting h
  have ha : (d.CA \ d.CB).card = d.r + 2 := by
    rw [Data.difference_A h,card_union_of_disjoint
      (((Data.outside_X h).mono_right subset_union_left).symm),(show d.A.card = 2 from spokes_card h.geometry)]
    simp [Data.r,Nat.add_comm]
  have hb : (d.CB \ d.CA).card = d.r + 2 := by
    rw [Data.difference_B h,card_union_of_disjoint
      (((Data.outside_Y h).mono_right subset_union_right).symm),(show d.B.card = 2 from spokes_card h.geometry.swapAB),hc.1]
    omega
  refine ⟨Data.residual_geometry h,Data.decompose_A h,Data.decompose_B h,
    Data.disjoint_XY,Data.outside_X h,Data.outside_Y h,Data.outside_D h,
    Data.disjoint_DX,Data.disjoint_DY,hc.1,hc.2,Data.residual_cover_A h,Data.residual_cover_B h,
    incidence_unique (Data.residual_geometry h),incidence_unique (Data.residual_geometry h).swapAB,
    (Data.partitions h).1,(Data.partitions h).2,Data.opposite_vu h,Data.opposite_uv h,
    Data.difference_A h,Data.difference_B h,ha,hb,?_⟩
  have hd : Disjoint (d.CA \ d.CB) (d.CB \ d.CA) := by
    apply disjoint_left.mpr
    intro e he hf
    exact (mem_sdiff.mp he).2 (mem_sdiff.mp hf).1
  rw [card_union_of_disjoint hd,ha,hb]
  omega
end Tuza08
