import Tuza06.LowNeighborDominatingClique
import Tuza06.FourDegenerate

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A degree-six endpoint of the unique missing rim edge has exactly two
neighbors outside the labeled core. -/
theorem near_endpoint_two_private_neighbors {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 1) = 6) :
    ∃ p q : V, p ≠ q ∧ p ∉ (univ : Finset (Fin 6)).map i ∧
      q ∉ (univ : Finset (Fin 6)).map i ∧
      peelNeighbors G univ (i 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map i) := by
  classical
  let K : Finset (Fin 6) := {0,3,4,5}
  let N := peelNeighbors G univ (i 1)
  have hK : K.map i ⊆ N := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    have he := (by decide : ∀ a ∈ ({0,3,4,5} : Finset (Fin 6)), ({1,a} : Finset (Fin 6)) ∈ fiveNearCore) a ha
    exact mem_filter.mpr ⟨mem_univ _,(hr.core_edges 1 a).mpr he⟩
  have hKcard : (K.map i).card = 4 := by rw [card_map]; decide
  have hNcard : N.card = 6 := hdeg
  have hRest : (N \ K.map i).card = 2 := by rw [card_sdiff_of_subset hK,hNcard,hKcard]
  obtain ⟨p,q,hpq,hEq⟩ := card_eq_two.mp hRest
  have hout : ∀ z ∈ N \ K.map i, z ∉ (univ : Finset (Fin 6)).map i := by
    intro z hz hzin
    obtain ⟨a,ha,haz⟩ := mem_map.mp hzin
    have hadj : G.Adj (i 1) (i a) := by simpa only [haz] using (mem_filter.mp (mem_sdiff.mp hz).1).2
    have he := (hr.core_edges 1 a).mp hadj
    have haK := (by decide : ∀ a : Fin 6, ({1,a} : Finset (Fin 6)) ∈ fiveNearCore → a ∈ ({0,3,4,5} : Finset (Fin 6))) a he
    exact (mem_sdiff.mp hz).2 (mem_map.mpr ⟨a,haK,haz⟩)
  refine ⟨p,q,hpq,hout p (by rw [hEq]; simp),hout q (by rw [hEq]; simp),?_⟩
  calc
    N = (N \ K.map i) ∪ K.map i := (sdiff_union_of_subset hK).symm
    _ = {p,q} ∪ K.map i := by rw [hEq]

/-- Two arbitrary new vertices extend a finite embedding while keeping all old labels. -/
def extendTwoFiniteEmbedding (i : Fin 6 ↪ V) (p q : V)
    (hp : ∀ a, i a ≠ p) (hq : ∀ a, i a ≠ q) (hpq : p ≠ q) : Fin 8 ↪ V :=
  extendFiniteEmbedding (extendFiniteEmbedding i p hp) q (by
    intro a
    by_cases ha : a.val < 6
    · let b : Fin 6 := ⟨a.val,ha⟩
      have heq : b.castSucc = a := Fin.ext rfl
      rw [← heq,extendFiniteEmbedding_old]
      exact hq b
    · have heq : a = Fin.last 6 := Fin.ext (by have := a.isLt; simp only [Fin.val_last]; omega)
      rw [heq,extendFiniteEmbedding_last]
      exact hpq)

@[simp] theorem extendTwo_old (i : Fin 6 ↪ V) (p q : V)
    (hp : ∀ a, i a ≠ p) (hq : ∀ a, i a ≠ q) (hpq : p ≠ q) (a : Fin 6) :
    extendTwoFiniteEmbedding i p q hp hq hpq a.castSucc.castSucc = i a := by
  unfold extendTwoFiniteEmbedding
  rw [extendFiniteEmbedding_old,extendFiniteEmbedding_old]
@[simp] theorem extendTwo_six (i : Fin 6 ↪ V) (p q : V)
    (hp : ∀ a, i a ≠ p) (hq : ∀ a, i a ≠ q) (hpq : p ≠ q) :
    extendTwoFiniteEmbedding i p q hp hq hpq 6 = p := by
  unfold extendTwoFiniteEmbedding
  rw [show (6 : Fin 8) = (Fin.last 6).castSucc from rfl,extendFiniteEmbedding_old,extendFiniteEmbedding_last]
@[simp] theorem extendTwo_seven (i : Fin 6 ↪ V) (p q : V)
    (hp : ∀ a, i a ≠ p) (hq : ∀ a, i a ≠ q) (hpq : p ≠ q) :
    extendTwoFiniteEmbedding i p q hp hq hpq 7 = q := by
  unfold extendTwoFiniteEmbedding
  exact extendFiniteEmbedding_last _ _ _

def sixIntoEight : Fin 6 ↪ Fin 8 := ⟨fun a => a.castSucc.castSucc,by intro a b h; exact Fin.ext (congrArg (fun z : Fin 8 => z.val) h)⟩

/-- With the two private neighbors nonadjacent, each sees two distinct vertices
of the common three-vertex rim. -/
theorem near_endpoint_private_two_rim_neighbors {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore) {p q : V}
    (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map i))
    (hpq : ¬ G.Adj p q) :
    ∃ a ∈ ({3,4,5} : Finset (Fin 6)), ∃ b ∈ ({3,4,5} : Finset (Fin 6)),
      a ≠ b ∧ G.Adj p (i a) ∧ G.Adj p (i b) := by
  classical
  have hpN : p ∈ peelNeighbors G univ (i 1) := by rw [hN]; simp
  obtain ⟨x,hx,y,hy,hxy,hpx,hpy⟩ := minimal_link_two_neighbors hG (full_link_closed G (i 1)) hpN
  have classify : ∀ z ∈ peelNeighbors G univ (i 1), G.Adj p z →
      ∃ a ∈ ({3,4,5} : Finset (Fin 6)), i a = z := by
    intro z hz hpz
    rw [hN] at hz
    rcases mem_union.mp hz with hpqz|hzK
    · rcases mem_insert.mp hpqz with rfl|hzq
      · exact (G.irrefl hpz).elim
      · exact (hpq (mem_singleton.mp hzq ▸ hpz)).elim
    · obtain ⟨a,ha,hai⟩ := mem_map.mp hzK
      have ha0 : a ≠ 0 := by
        intro h
        apply core_hub_not_outside hr hpOut
        simpa only [←hai,h] using hpz.symm
      refine ⟨a,(mem_insert.mp ha).resolve_left ha0,hai⟩
  obtain ⟨a,ha,hai⟩ := classify x hx hpx
  obtain ⟨b,hb,hbi⟩ := classify y hy hpy
  exact ⟨a,ha,b,hb,fun h => hxy (hai.symm.trans ((congrArg i h).trans hbi)),by simpa only [hai] using hpx,by simpa only [hbi] using hpy⟩

end Tuza06
