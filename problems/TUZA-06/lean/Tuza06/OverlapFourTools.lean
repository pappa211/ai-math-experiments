import Tuza06.OverlapReorder
import Tuza06.OverlapFourNear
import Tuza06.OverlapFourClique
import Tuza06.Support

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 12000

def fourOldIntoNew : Fin 6 ↪ Fin 8 := ⟨![0,2,3,4,5,6],by decide⟩
def fourFirst : Finset (Fin 6) := {1,2,3,4}
def fourYNeighbors : Finset (Fin 8) := {2,3,4,5,7}
def fourYSpokes : Finset (Finset (Fin 8)) := {{1,2},{1,3},{1,4},{1,5},{1,7}}
def fourLower (E : Finset (Finset (Fin 6))) : Finset (Finset (Fin 8)) :=
  liftFamily fourOldIntoNew E ∪ fourYSpokes
private def fourNewFn : Fin 8 → Fin 8 := ![0,6,1,2,3,4,5,7]
private def fourNewInv : Fin 8 → Fin 8 := ![0,2,3,4,5,6,1,7]
private theorem fourNew_left : Function.LeftInverse fourNewInv fourNewFn := by decide
def fourNewOrder : Fin 8 ↪ Fin 8 := ⟨fourNewFn,fourNew_left.injective⟩

variable {V : Type*} [Fintype V] [DecidableEq V]

structure SharedFourData (G : SimpleGraph V) (i : Fin 6 ↪ V)
    (E : Finset (Finset (Fin 6))) (y q : V) : Prop where
  core : FiveLinkConfiguration G i E
  y_neighbors : peelNeighbors G univ y = fourFirst.map i ∪ {q}
  y_outside : ∀ a : Fin 6, i a ≠ y
  q_outside : ∀ a : Fin 6, i a ≠ q
  y_ne_q : y ≠ q

theorem shared_four_embedding {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} {y q : V} (hd : SharedFourData G i E y q) :
    ∃ j : Fin 8 ↪ V, fourOldIntoNew.trans j = i ∧ j 1 = y ∧ j 7 = q := by
  let i7 := extendFiniteEmbedding i y hd.y_outside
  have hq : ∀ a : Fin 7, i7 a ≠ q := by
    intro a
    by_cases ha : a.val < 6
    · change (if h : a.val < 6 then i ⟨a.val,h⟩ else y) ≠ q
      rw [dif_pos ha]
      exact hd.q_outside _
    · change (if h : a.val < 6 then i ⟨a.val,h⟩ else y) ≠ q
      rw [dif_neg ha]
      exact hd.y_ne_q
  let j := fourNewOrder.trans (extendFiniteEmbedding i7 q hq)
  refine ⟨j,?_,rfl,rfl⟩
  ext a
  fin_cases a <;> rfl

/-- Genuine adjacency of a labeled unordered pair is invariant under equality
of the label pair. -/
theorem adj_of_labeled_pair_eq {I : Type*} [DecidableEq I] {G : SimpleGraph V}
    (j : I ↪ V) {a b c d : I} (hab : G.Adj (j a) (j b))
    (heq : ({a,b} : Finset I) = {c,d}) (hcd : c ≠ d) : G.Adj (j c) (j d) := by
  classical
  have hmap : ({j a,j b} : Finset V) = {j c,j d} := by
    simpa only [map_insert,map_singleton] using congrArg (Finset.map j) heq
  have hg : G.IsNClique 2 ({j c,j d} : Finset V) := hmap ▸ pair_graph_edge hab
  exact hg.isClique (by simp) (by simp) (fun h => hcd (j.injective h))

theorem shared_four_lower_edges {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} {y q : V} (hd : SharedFourData G i E y q)
    (j : Fin 8 ↪ V) (hComp : fourOldIntoNew.trans j = i) (h1 : j 1 = y) (h7 : j 7 = q)
    (hE2 : ∀ e ∈ E, e.card = 2) :
    ∀ e ∈ fourLower E, G.IsNClique 2 (e.map j) := by
  classical
  have hJ : ∀ a : Fin 6, j (fourOldIntoNew a) = i a := fun a => congrArg (fun f : Fin 6 ↪ V => f a) hComp
  have hY : ∀ a ∈ fourFirst, G.Adj y (i a) := by
    intro a ha
    have hm : i a ∈ peelNeighbors G univ y := by rw [hd.y_neighbors];exact mem_union_left _ (mem_map.mpr ⟨a,ha,rfl⟩)
    exact (mem_filter.mp hm).2
  have hQ : G.Adj y q := by
    have hm : q ∈ peelNeighbors G univ y := by rw [hd.y_neighbors];simp
    exact (mem_filter.mp hm).2
  intro e he
  rcases mem_union.mp he with he | he
  · obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp he
    have hg := core_mapped_edge hd.core (hE2 s hs) hs
    simpa only [Finset.map_map,hComp] using hg
  · have hsp : ∀ e ∈ fourYSpokes, ∃ a ∈ fourYNeighbors, e = {1,a} := by decide
    obtain ⟨a,ha,rfl⟩ := hsp e he
    have hay : G.Adj y (j a) := by
      simp only [fourYNeighbors,mem_insert,mem_singleton] at ha
      rcases ha with rfl | rfl | rfl | rfl | rfl
      · exact (hJ 1).symm ▸ hY 1 (by decide)
      · exact (hJ 2).symm ▸ hY 2 (by decide)
      · exact (hJ 3).symm ▸ hY 3 (by decide)
      · exact (hJ 4).symm ▸ hY 4 (by decide)
      · exact h7.symm ▸ hQ
    simpa only [map_insert,map_singleton,h1] using pair_graph_edge hay

/-- Realize any of the checked four-common-neighbor patterns from the actual
shared-four neighborhood data; unknown q-spokes and all further attachments remain unrestricted. -/
theorem shared_four_realizes (W : FiniteReduction (Fin 8)) {G : SimpleGraph V}
    {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))} {y q : V} (hd : SharedFourData G i E y q)
    (hE2 : ∀ e ∈ E, e.card = 2) (hU : W.U ⊆ {0,1})
    (hP : ∀ p ∈ W.P, p.card = 3 ∧ edges p ⊆ fourLower E)
    (hRule : ∀ a b : Fin 8, ({a,b} : Finset (Fin 8)) ∉ W.Upper →
      a = b ∨ ({a,b} : Finset (Fin 8)) = {0,1} ∨ ({a,b} : Finset (Fin 8)) = {0,7} ∨
      ({a,b} : Finset (Fin 8)) = {1,6} ∨
      (({a,b} : Finset (Fin 8)) = {2,3} ∧ ({1,2} : Finset (Fin 6)) ∉ E)) :
    ∃ j : Fin 8 ↪ V, RealizesReduction W G j ∧
      fourOldIntoNew.trans j = i ∧ j 1 = y ∧ j 7 = q := by
  classical
  obtain ⟨j,hComp,h1,h7⟩ := shared_four_embedding hd
  have hJ : ∀ a : Fin 6, j (fourOldIntoNew a) = i a := fun a => congrArg (fun f : Fin 6 ↪ V => f a) hComp
  have h0 : j 0 = i 0 := hJ 0
  have h6 : j 6 = i 5 := hJ 5
  have h2 : j 2 = i 1 := hJ 1
  have h3 : j 3 = i 2 := hJ 2
  have hXY : ¬ G.Adj (i 0) y := by
    intro h
    have hyN : y ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hd.core.neighborhood] at hyN
    obtain ⟨a,ha,heq⟩ := mem_map.mp hyN
    exact hd.y_outside a heq
  have hXQ : ¬ G.Adj (i 0) q := by
    intro h
    have hqN : q ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hd.core.neighborhood] at hqN
    obtain ⟨a,ha,heq⟩ := mem_map.mp hqN
    exact hd.q_outside a heq
  have hYP : ¬ G.Adj y (i 5) := by
    intro h
    have hm : i 5 ∈ peelNeighbors G univ y := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hd.y_neighbors] at hm
    rcases mem_union.mp hm with hm | hm
    · have h5 : (5 : Fin 6) ∈ fourFirst := by simpa using hm
      exact (by decide : (5 : Fin 6) ∉ fourFirst) h5
    · exact hd.q_outside 5 (mem_singleton.mp hm)
  have hUpper : ∀ a b : Fin 8, G.Adj (j a) (j b) → ({a,b} : Finset (Fin 8)) ∈ W.Upper := by
    intro a b hab
    by_contra hn
    rcases hRule a b hn with heq | heq | heq | heq | ⟨heq,he⟩
    · exact G.irrefl (heq ▸ hab)
    · have hadj := adj_of_labeled_pair_eq j hab heq (by decide : (0 : Fin 8) ≠ 1)
      exact hXY (by simpa only [h0,h1] using hadj)
    · have hadj := adj_of_labeled_pair_eq j hab heq (by decide : (0 : Fin 8) ≠ 7)
      exact hXQ (by simpa only [h0,h7] using hadj)
    · have hadj := adj_of_labeled_pair_eq j hab heq (by decide : (1 : Fin 8) ≠ 6)
      exact hYP (by simpa only [h1,h6] using hadj)
    · have hadj := adj_of_labeled_pair_eq j hab heq (by decide : (2 : Fin 8) ≠ 3)
      apply he
      exact (hd.core.core_edges 1 2).mp (by simpa only [h2,h3] using hadj)
  have hN : ∀ a ∈ W.U, ∀ z, G.Adj (j a) z → z ∈ (univ : Finset (Fin 8)).map j := by
    intro a ha z haz
    have hOldRange : ∀ b : Fin 6, i b ∈ (univ : Finset (Fin 8)).map j :=
      fun b => mem_map.mpr ⟨fourOldIntoNew b,mem_univ _,hJ b⟩
    rcases mem_insert.mp (hU ha) with rfl | ha
    · have hm : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h0 ▸ haz⟩
      rw [hd.core.neighborhood] at hm
      obtain ⟨b,hb,rfl⟩ := mem_map.mp hm
      exact hOldRange b
    · have ha1 : a = 1 := mem_singleton.mp ha
      subst a
      have hm : z ∈ peelNeighbors G univ y := mem_filter.mpr ⟨mem_univ _,h1 ▸ haz⟩
      rw [hd.y_neighbors] at hm
      rcases mem_union.mp hm with hm | hm
      · obtain ⟨b,hb,rfl⟩ := mem_map.mp hm
        exact hOldRange b
      · have hzq : z = q := mem_singleton.mp hm
        exact mem_map.mpr ⟨7,mem_univ _,h7.trans hzq.symm⟩
  have hpG := mapped_triangles_of_edges j (shared_four_lower_edges hd j hComp h1 h7 hE2) hP
  exact ⟨j,⟨hUpper,hN,hpG⟩,hComp,h1,h7⟩
end Tuza06
