import TuzaA1.Deletion

/-! Frozen graph-level definitions and targets, translated from the complete
TUZA-08 ordinary source before substantive proof development. -/
namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

abbrev Edge (V : Type*) := Finset V
abbrev EdgeSet (V : Type*) := Finset (Edge V)

def GraphCover (G : SimpleGraph V) (C : EdgeSet V) : Prop :=
  Covers (triangles G) C ∧ ∀ e ∈ C, G.IsNClique 2 e

def Geometry (G : SimpleGraph V) (u v a b : V) : Prop :=
  u ≠ v ∧ u ≠ a ∧ u ≠ b ∧ v ≠ a ∧ v ≠ b ∧ a ≠ b ∧
  ¬ G.Adj u v ∧ ∀ w, (G.Adj u w ∧ G.Adj v w ↔ w = a ∨ w = b)

def spokes (u v a : V) : EdgeSet V := {{u,a},{v,a}}

def Witness (G : SimpleGraph V) (avoid : EdgeSet V) (p c : V)
    (e T : Edge V) : Prop :=
  T ∈ triangles G ∧ e ∈ edges T ∧ ({p,c} : Edge V) ∈ edges T ∧
  Disjoint (edges T) avoid

noncomputable def oriented (G : SimpleGraph V) (avoid S : EdgeSet V)
    (p c : V) : EdgeSet V := by
  classical
  exact S.filter (fun e => ∃ T, Witness G avoid p c e T)

structure Data (V : Type*) [Fintype V] [DecidableEq V] where
  H : SimpleGraph V
  u : V
  v : V
  a : V
  b : V
  CA : EdgeSet V
  CB : EdgeSet V
  t : ℕ

namespace Data
variable (d : Data V)
def A := spokes d.u d.v d.a
def B := spokes d.u d.v d.b
def DA := d.CA \ d.A
def DB := d.CB \ d.B
def D := d.DA ∩ d.DB
def X := d.DA \ d.DB
def Y := d.DB \ d.DA
def r := d.X.card
def J := removeEdgeFamily d.H d.D
noncomputable def Xu := oriented d.J d.A d.X d.u d.b
noncomputable def Xv := oriented d.J d.A d.X d.v d.b
noncomputable def X0 := d.X \ (d.Xu ∪ d.Xv)
noncomputable def Yu := oriented d.J d.B d.Y d.u d.a
noncomputable def Yv := oriented d.J d.B d.Y d.v d.a
noncomputable def Y0 := d.Y \ (d.Yu ∪ d.Yv)
noncomputable def q := d.X0.card + d.Y0.card
noncomputable def Quv := {{d.u,d.a},{d.v,d.b}} ∪ d.Xu ∪ d.Yv ∪ d.X0 ∪ d.Y0
noncomputable def Qvu := {{d.v,d.a},{d.u,d.b}} ∪ d.Xv ∪ d.Yu ∪ d.X0 ∪ d.Y0

def Mixed (C : EdgeSet V) : Prop := (C ∩ d.A).Nonempty ∧ (C ∩ d.B).Nonempty

def MixedCover (C : EdgeSet V) : Prop := GraphCover d.H C ∧ d.Mixed C

structure Hypotheses : Prop where
  geometry : Geometry d.H d.u d.v d.a d.b
  coverA : GraphCover d.H d.CA
  coverB : GraphCover d.H d.CB
  cardA : d.CA.card = d.t
  cardB : d.CB.card = d.t
  containsA : d.A ⊆ d.CA
  containsB : d.B ⊆ d.CB
  avoidsB : Disjoint d.CA d.B
  avoidsA : Disjoint d.CB d.A

/-- Neutral means absence of the specified residual witnesses only. -/
def Partition (S U W N : EdgeSet V) : Prop :=
  U ∪ W ∪ N = S ∧ Disjoint U W ∧ Disjoint U N ∧ Disjoint W N ∧
  U.card + W.card + N.card = S.card

/-- Strong supporting-triangle uniqueness, not only unique orientation. -/
def IncidenceUnique (G : SimpleGraph V) (P R : EdgeSet V) : Prop :=
  ∀ e, e ∉ P ∪ R → ∀ T ∈ triangles G, ∀ U ∈ triangles G,
    e ∈ edges T → e ∈ edges U →
    (∃ f ∈ P, f ∈ edges T) → (∃ f ∈ P, f ∈ edges U) →
    Disjoint (edges T) R → Disjoint (edges U) R → T = U

structure CS1 : Prop where
  residual_geometry : Geometry d.J d.u d.v d.a d.b
  cover_decomposition_A : d.CA = d.A ∪ d.D ∪ d.X
  cover_decomposition_B : d.CB = d.B ∪ d.D ∪ d.Y
  disjoint_XY : Disjoint d.X d.Y
  outside_X : Disjoint d.X (d.A ∪ d.B)
  outside_Y : Disjoint d.Y (d.A ∪ d.B)
  outside_D : Disjoint d.D (d.A ∪ d.B)
  common_X : Disjoint d.D d.X
  common_Y : Disjoint d.D d.Y
  equal_outside_card : d.Y.card = d.r
  original_cost : d.D.card + d.r + 2 = d.t
  residual_cover_A : GraphCover d.J (d.A ∪ d.X)
  residual_cover_B : GraphCover d.J (d.B ∪ d.Y)
  unique_A : IncidenceUnique d.J d.A d.B
  unique_B : IncidenceUnique d.J d.B d.A
  partition_X : Partition d.X d.Xu d.Xv d.X0
  partition_Y : Partition d.Y d.Yu d.Yv d.Y0
  opposite_vu : ∀ x ∈ d.Xv, ∀ y ∈ d.Yu, Disjoint x y
  opposite_uv : ∀ x ∈ d.Xu, ∀ y ∈ d.Yv, Disjoint x y
  difference_A : d.CA \ d.CB = d.A ∪ d.X
  difference_B : d.CB \ d.CA = d.B ∪ d.Y
  difference_card_A : (d.CA \ d.CB).card = d.r + 2
  difference_card_B : (d.CB \ d.CA).card = d.r + 2
  symmetric_difference_card : ((d.CA \ d.CB) ∪ (d.CB \ d.CA)).card = 2*d.r + 4

structure CS2 : Prop where
  residual_uv : GraphCover d.J d.Quv ∧ d.Mixed d.Quv
  residual_vu : GraphCover d.J d.Qvu ∧ d.Mixed d.Qvu
  lifted_uv : d.MixedCover (d.D ∪ d.Quv)
  lifted_vu : d.MixedCover (d.D ∪ d.Qvu)

structure CS3 : Prop where
  cost_uv : d.Quv.card = 2 + d.Xu.card + d.Yv.card + d.X0.card + d.Y0.card
  cost_vu : d.Qvu.card = 2 + d.Xv.card + d.Yu.card + d.X0.card + d.Y0.card
  cost_sum : d.Quv.card + d.Qvu.card = 4 + 2*d.r + d.q
  lifted_cost_uv : (d.D ∪ d.Quv).card = d.D.card + d.Quv.card
  lifted_cost_vu : (d.D ∪ d.Qvu).card = d.D.card + d.Qvu.card
  one_constructed_bound :
    (d.D ∪ d.Quv).card ≤ d.t + d.q/2 ∨ (d.D ∪ d.Qvu).card ≤ d.t + d.q/2
  precise_bound : ∃ C, d.MixedCover C ∧ C.card = d.D.card + min d.Quv.card d.Qvu.card
  trivial_bound : ∃ C, d.MixedCover C ∧ C.card ≤ d.t + 1
  combined_bound : ∃ C, d.MixedCover C ∧ C.card ≤ d.t + min 1 (d.q/2)
  empty_Yv : d.Yv = ∅ → GraphCover d.J ({{d.u,d.a},{d.v,d.b}} ∪ d.X)
  empty_Yu : d.Yu = ∅ → GraphCover d.J ({{d.v,d.a},{d.u,d.b}} ∪ d.X)
  empty_Xv : d.Xv = ∅ → GraphCover d.J ({{d.v,d.a},{d.u,d.b}} ∪ d.Y)
  empty_Xu : d.Xu = ∅ → GraphCover d.J ({{d.u,d.a},{d.v,d.b}} ∪ d.Y)
  empty_mixed_bound : (d.Xu = ∅ ∨ d.Xv = ∅ ∨ d.Yu = ∅ ∨ d.Yv = ∅) →
    ∃ C, d.MixedCover C ∧ C.card ≤ d.t

/-- Quantifies over ALL actual-edge minimum covers of the full graph. -/
def NoMixedMinimum : Prop :=
  ∀ C, GraphCover d.H C → C.card = d.t → ¬ d.Mixed C

structure Obstruction : Prop where
  Xu_nonempty : d.Xu.Nonempty
  Xv_nonempty : d.Xv.Nonempty
  Yu_nonempty : d.Yu.Nonempty
  Yv_nonempty : d.Yv.Nonempty
  neutral_lower : 2 ≤ d.q
  radius_lower : 3 ≤ d.r
  difference_lower_A : 5 ≤ (d.CA \ d.CB).card
  difference_lower_B : 5 ≤ (d.CB \ d.CA).card
  symmetric_difference_lower : 10 ≤ ((d.CA \ d.CB) ∪ (d.CB \ d.CA)).card
  rigid_six : d.r = 3 → d.Xu.card = 1 ∧ d.Xv.card = 1 ∧ d.X0.card = 1 ∧
    d.Yu.card = 1 ∧ d.Yv.card = 1 ∧ d.Y0.card = 1

def CS4 : Prop := d.t = tau (triangles d.H) → d.NoMixedMinimum → d.Obstruction

def CoverSwitchResult : Prop := d.CS1 ∧ d.CS2 ∧ d.CS3 ∧ d.CS4
end Data

def CoverSwitchTarget : Prop := ∀ d : Data V, d.Hypotheses → d.CoverSwitchResult
end Tuza08
