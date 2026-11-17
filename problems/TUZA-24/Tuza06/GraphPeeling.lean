import Tuza06.SetPeeling
import Tuza.Graph

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def peelNeighbors (G : SimpleGraph V) (S : Finset V) (u : V) : Finset V := by
  classical
  exact S.filter (G.Adj u)

noncomputable def peelLow (G : SimpleGraph V) (S : Finset V) : Finset V := by
  classical
  exact S.filter (fun v => degreeWithin G S v = 5)

theorem degreeWithin_partition (G : SimpleGraph V) {S L : Finset V} (hLS : L ⊆ S) (u : V) :
    degreeWithin G S u = degreeWithin G (S \ L) u + (peelNeighbors G L u).card := by
  classical
  have he : peelNeighbors G S u = peelNeighbors G (S \ L) u ∪ peelNeighbors G L u := by
    ext x
    simp only [peelNeighbors, mem_filter, mem_union, mem_sdiff]
    constructor
    · intro hx
      by_cases hxl : x ∈ L
      · exact Or.inr ⟨hxl, hx.2⟩
      · exact Or.inl ⟨⟨hx.1, hxl⟩, hx.2⟩
    · rintro (⟨⟨hxs, _⟩, hxu⟩ | ⟨hxl, hxu⟩)
      · exact ⟨hxs, hxu⟩
      · exact ⟨hLS hxl, hxu⟩
  have hd : Disjoint (peelNeighbors G (S \ L) u) (peelNeighbors G L u) := by
    apply disjoint_left.mpr
    intro x hx hy
    exact (mem_sdiff.mp (mem_filter.mp hx).1).2 (mem_filter.mp hy).1
  change (peelNeighbors G S u).card = (peelNeighbors G (S \ L) u).card + _
  rw [he, card_union_of_disjoint hd]

/-- The full global counting/second-degeneracy step. Local structural premises
are explicit: low vertices are independent, their neighbors have degree at least
seven, and the induced arms have size at least three with intersections at most one.
No maximum-degree or ambient-order bound is assumed. -/
theorem degeneracy_two_arm_peeling {G : SimpleGraph V} {S : Finset V}
    (hdeg : Degenerate G 5) (hS : S.Nonempty)
    (hmin : ∀ v ∈ S, 5 ≤ degreeWithin G S v)
    (hindep : IndependentVertices G (peelLow G S))
    (hhigh : ∀ v ∈ peelLow G S, ∀ u ∈ S, G.Adj v u → 7 ≤ degreeWithin G S u)
    (hlarge : ∀ u ∈ S \ peelLow G S, ∀ v ∈ peelNeighbors G (peelLow G S) u,
      3 ≤ (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v).card)
    (hpair : ∀ u ∈ S \ peelLow G S, (peelNeighbors G (S \ peelLow G S) u).card ≤ 5 →
      ∀ v ∈ peelNeighbors G (peelLow G S) u,
      ∀ w ∈ peelNeighbors G (peelLow G S) u, v ≠ w →
      ((peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v) ∩
        (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w)).card ≤ 1) :
    ∃ u ∈ S \ peelLow G S, ∃ v w : V,
      v ≠ w ∧ peelNeighbors G (peelLow G S) u = {v,w} ∧ degreeWithin G S u = 7 ∧
      (peelNeighbors G (S \ peelLow G S) u).card = 5 ∧
      (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v).card = 3 ∧
      (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w).card = 3 ∧
      ((peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) v) ∩
        (peelNeighbors G (peelNeighbors G (S \ peelLow G S) u) w)).card = 1 := by
  classical
  let L := peelLow G S
  have hLS : L ⊆ S := filter_subset _ _
  obtain ⟨v0, hv0S, hv0le⟩ := hdeg S hS
  have hv0eq : degreeWithin G S v0 = 5 := by have := hmin v0 hv0S; omega
  have hv0L : v0 ∈ L := mem_filter.mpr ⟨hv0S, hv0eq⟩
  have hNeighbor : (peelNeighbors G S v0).Nonempty := by
    apply card_pos.mp
    change 0 < degreeWithin G S v0
    omega
  obtain ⟨u0, hu0⟩ := hNeighbor
  have hu0S : u0 ∈ S := (mem_filter.mp hu0).1
  have hu0not : u0 ∉ L := fun hu0L => hindep v0 hv0L u0 hu0L (mem_filter.mp hu0).2
  have hdiff : (S \ L).Nonempty := ⟨u0, mem_sdiff.mpr ⟨hu0S, hu0not⟩⟩
  obtain ⟨u, hu, hrest⟩ := hdeg (S \ L) hdiff
  have huS : u ∈ S := (mem_sdiff.mp hu).1
  have huNe : degreeWithin G S u ≠ 5 := by
    intro heq
    exact (mem_sdiff.mp hu).2 (mem_filter.mpr ⟨huS, heq⟩)
  have hu6 : 6 ≤ degreeWithin G S u := by have := hmin u huS; omega
  let A := peelNeighbors G (S \ L) u
  let R := peelNeighbors G L u
  have hA : A.card ≤ 5 := hrest
  have hpart : degreeWithin G S u = A.card + R.card := degreeWithin_partition G hLS u
  have hRpos : 0 < R.card := by omega
  obtain ⟨v1, hv1⟩ := card_pos.mp hRpos
  have hu7 : 7 ≤ degreeWithin G S u :=
    hhigh v1 (mem_filter.mp hv1).1 u huS ((mem_filter.mp hv1).2.symm)
  have hR2lo : 2 ≤ R.card := by omega
  have hbig : ∀ v ∈ R, 3 ≤ (peelNeighbors G A v).card := hlarge u hu
  have hpairs : ∀ v ∈ R, ∀ w ∈ R, v ≠ w →
      ((peelNeighbors G A v) ∩ (peelNeighbors G A w)).card ≤ 1 := hpair u hu hA
  have hinj : Set.InjOn (peelNeighbors G A) (R : Set V) := by
    intro v hv w hw heq
    by_contra hvw
    have hb := hpairs v hv w hw hvw
    have hl := hbig v hv
    rw [heq, inter_self] at hb
    rw [heq] at hl
    omega
  have hF : (R.image (peelNeighbors G A)).card ≤ 2 := by
    apply arm_family_card_le_two hA
    · intro X hX
      obtain ⟨v, hv, rfl⟩ := mem_image.mp hX
      exact ⟨filter_subset _ _, hbig v hv⟩
    · intro X hX Y hY hXY
      obtain ⟨v, hv, rfl⟩ := mem_image.mp hX
      obtain ⟨w, hw, rfl⟩ := mem_image.mp hY
      exact hpairs v hv w hw (fun h => hXY (congrArg (peelNeighbors G A) h))
  have hcardF : (R.image (peelNeighbors G A)).card = R.card := card_image_iff.mpr hinj
  have hcR : R.card = 2 := by omega
  obtain ⟨v, w, hvw, hR⟩ := card_eq_two.mp hcR
  have hv : v ∈ R := by rw [hR]; simp
  have hw : w ∈ R := by rw [hR]; simp
  have hs := two_arm_saturation hA (filter_subset _ _) (filter_subset _ _)
    (hbig v hv) (hbig w hw) (hpairs v hv w hw hvw)
  have hdu : degreeWithin G S u = 7 := by omega
  exact ⟨u, hu, v, w, hvw, hR, hdu, hs.1, hs.2.1, hs.2.2.1, hs.2.2.2.1⟩

end Tuza06
