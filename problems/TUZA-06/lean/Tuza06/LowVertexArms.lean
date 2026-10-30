import Tuza06.GraphPeeling

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A low vertex has five neighbors in S and, from any one of them, at most one
of the other four fails to be adjacent. This follows from K5/K5-minus-edge links;
that structural input is kept visible here. -/
noncomputable def LowLinkBound (G : SimpleGraph V) (S : Finset V) : Prop := by
  classical
  exact ∀ v ∈ peelLow G S, ∀ u ∈ peelNeighbors G S v,
    (((peelNeighbors G S v).erase u).filter (fun x => ¬ G.Adj u x)).card ≤ 1

/-- The overlap conclusion needed from Proposition O, expressed on actual
neighbor sets. -/
def LowOverlap (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ v ∈ peelLow G S, ∀ w ∈ peelLow G S, v ≠ w →
    (peelNeighbors G S v ∩ peelNeighbors G S w).card ≤ 3 ∧
    (3 ≤ (peelNeighbors G S v ∩ peelNeighbors G S w).card →
      G.IsClique ((peelNeighbors G S v) : Set V) ∧
      G.IsClique ((peelNeighbors G S w) : Set V))

theorem low_neighbor_outside_low {G : SimpleGraph V} {S : Finset V}
    (hi : IndependentVertices G (peelLow G S)) {v x : V}
    (hv : v ∈ peelLow G S) (hx : x ∈ peelNeighbors G S v) : x ∉ peelLow G S := by
  classical
  exact fun hxL => hi v hv x hxL (mem_filter.mp hx).2

/-- The three-vertex arm lower bound is derived from actual near-clique links,
not assumed as a finite-set interface. -/
theorem low_arm_card_ge_three {G : SimpleGraph V} {S : Finset V}
    (hi : IndependentVertices G (peelLow G S)) (hl : LowLinkBound G S)
    {u v : V} (hu : u ∈ S \ peelLow G S) (hv : v ∈ peelNeighbors G (peelLow G S) u) :
    3 ≤ (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v).card := by
  classical
  have hvL : v ∈ peelLow G S := (mem_filter.mp hv).1
  have hvS : v ∈ S := (mem_filter.mp hvL).1
  have hvdeg : (peelNeighbors G S v).card = 5 := (mem_filter.mp hvL).2
  have huv : G.Adj u v := (mem_filter.mp hv).2
  have huN : u ∈ peelNeighbors G S v := mem_filter.mpr ⟨(mem_sdiff.mp hu).1, huv.symm⟩
  let T := (peelNeighbors G S v).erase u
  have hcT : T.card = 4 := by dsimp only [T]; rw [card_erase_of_mem huN, hvdeg]
  have hbad : (T.filter (fun x => ¬ G.Adj u x)).card ≤ 1 := hl v hvL u huN
  have hpartition := card_filter_add_card_filter_not (s := T) (p := G.Adj u)
  have hgood : 3 ≤ (T.filter (G.Adj u)).card := by omega
  have hsub : T.filter (G.Adj u) ⊆ peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v := by
    intro x hx
    have hxT := (mem_filter.mp hx).1
    have hxN : x ∈ peelNeighbors G S v := mem_of_mem_erase hxT
    have hxS := (mem_filter.mp hxN).1
    have hxNot := low_neighbor_outside_low hi hvL hxN
    exact mem_filter.mpr ⟨mem_filter.mpr ⟨mem_sdiff.mpr ⟨hxS, hxNot⟩,
      (mem_filter.mp hx).2⟩, (mem_filter.mp hxN).2⟩
  exact hgood.trans (card_le_card hsub)

/-- If a low link is a clique, its arm at u consists of its other four neighbors. -/
theorem low_clique_arm_card {G : SimpleGraph V} {S : Finset V}
    (hi : IndependentVertices G (peelLow G S)) {u v : V}
    (hu : u ∈ S \ peelLow G S) (hv : v ∈ peelNeighbors G (peelLow G S) u)
    (hcl : G.IsClique ((peelNeighbors G S v) : Set V)) :
    (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v).card = 4 := by
  classical
  have hvL : v ∈ peelLow G S := (mem_filter.mp hv).1
  have huv : G.Adj u v := (mem_filter.mp hv).2
  have huN : u ∈ peelNeighbors G S v := mem_filter.mpr ⟨(mem_sdiff.mp hu).1, huv.symm⟩
  have heq : peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v =
      (peelNeighbors G S v).erase u := by
    ext x
    constructor
    · intro hx
      have hxA := (mem_filter.mp hx).1
      have hxS := (mem_sdiff.mp (mem_filter.mp hxA).1).1
      have hxv := (mem_filter.mp hx).2
      have hxu : x ≠ u := by intro he; subst x; exact G.irrefl (mem_filter.mp hxA).2
      exact mem_erase.mpr ⟨hxu, mem_filter.mpr ⟨hxS, hxv⟩⟩
    · intro hx
      have hxN := (mem_erase.mp hx).2
      have hxu := (mem_erase.mp hx).1
      have hxNot := low_neighbor_outside_low hi hvL hxN
      exact mem_filter.mpr ⟨mem_filter.mpr ⟨mem_sdiff.mpr ⟨(mem_filter.mp hxN).1, hxNot⟩,
        hcl huN hxN hxu.symm⟩, (mem_filter.mp hxN).2⟩
  rw [heq, card_erase_of_mem huN]
  have hvdeg : (peelNeighbors G S v).card = 5 := (mem_filter.mp hvL).2
  omega

/-- Pairwise arm intersections of size at most one follow from Proposition O.
The ambient degree is unrestricted. -/
theorem low_arm_inter_le_one {G : SimpleGraph V} {S : Finset V}
    (hi : IndependentVertices G (peelLow G S)) (ho : LowOverlap G S)
    {u v w : V} (hu : u ∈ S \ peelLow G S)
    (hA : (peelNeighbors G (S \ peelLow G S) u).card ≤ 5)
    (hv : v ∈ peelNeighbors G (peelLow G S) u) (hw : w ∈ peelNeighbors G (peelLow G S) u)
    (hvw : v ≠ w) :
    ((peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v) ∩
      (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w)).card ≤ 1 := by
  classical
  let A := peelNeighbors G (S \ peelLow G S) u
  let X := peelNeighbors G A v
  let Y := peelNeighbors G A w
  let C := peelNeighbors G S v ∩ peelNeighbors G S w
  have hvL := (mem_filter.mp hv).1
  have hwL := (mem_filter.mp hw).1
  have hC := ho v hvL w hwL hvw
  have hCbound : C.card ≤ 3 := hC.1
  have huC : u ∈ C := mem_inter.mpr
    ⟨mem_filter.mpr ⟨(mem_sdiff.mp hu).1, (mem_filter.mp hv).2.symm⟩,
     mem_filter.mpr ⟨(mem_sdiff.mp hu).1, (mem_filter.mp hw).2.symm⟩⟩
  have huNot : u ∉ X ∩ Y := by
    intro h
    have huA : u ∈ A := (mem_filter.mp (mem_inter.mp h).1).1
    exact G.irrefl (mem_filter.mp huA).2
  have hsub : insert u (X ∩ Y) ⊆ C := by
    intro z hz
    rcases mem_insert.mp hz with rfl | hz
    · exact huC
    · have hzX := (mem_inter.mp hz).1
      have hzY := (mem_inter.mp hz).2
      have hzS : z ∈ S := (mem_sdiff.mp (mem_filter.mp (mem_filter.mp hzX).1).1).1
      exact mem_inter.mpr ⟨mem_filter.mpr ⟨hzS, (mem_filter.mp hzX).2⟩,
        mem_filter.mpr ⟨hzS, (mem_filter.mp hzY).2⟩⟩
  have hsize := card_le_card hsub
  rw [card_insert_of_notMem huNot] at hsize
  change (X ∩ Y).card ≤ 1
  by_contra hn
  have h3 : 3 ≤ C.card := by omega
  obtain ⟨hclv, hclw⟩ := hC.2 h3
  have hcX : X.card = 4 := low_clique_arm_card hi hu hv hclv
  have hcY : Y.card = 4 := low_clique_arm_card hi hu hw hclw
  have hunion : (X ∪ Y).card ≤ 5 :=
    (card_le_card (union_subset (filter_subset _ _) (filter_subset _ _))).trans hA
  have hcount := card_union_add_card_inter X Y
  omega

/-- Global peeling from the precise local structural inputs. The near-clique and
Proposition O inputs are ordinary graph properties, not assumed extremal inequalities. -/
theorem peeling_from_low_structure {G : SimpleGraph V} {S : Finset V}
    (hdeg : Degenerate G 5) (hS : S.Nonempty)
    (hmin : ∀ v ∈ S, 5 ≤ degreeWithin G S v)
    (hi : IndependentVertices G (peelLow G S))
    (hh : ∀ v ∈ peelLow G S, ∀ u ∈ S, G.Adj v u → 7 ≤ degreeWithin G S u)
    (hl : LowLinkBound G S) (ho : LowOverlap G S) :
    ∃ u ∈ S \ peelLow G S, ∃ v w : V,
      v ≠ w ∧ peelNeighbors G (peelLow G S) u = {v,w} ∧ degreeWithin G S u = 7 ∧
      (peelNeighbors G (S \ peelLow G S) u).card = 5 ∧
      (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v).card = 3 ∧
      (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w).card = 3 ∧
      ((peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v) ∩
        (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w)).card = 1 :=
  degeneracy_two_arm_peeling hdeg hS hmin hi hh
    (fun _ hu _ hv => low_arm_card_ge_three hi hl hu hv)
    (fun _ hu ha _ hv _ hw hvw => low_arm_inter_le_one hi ho hu ha hv hw hvw)

end Tuza06
