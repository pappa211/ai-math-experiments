import Tuza06.OverlapTools
import Tuza06.OverlapFiveClique
import Tuza06.OverlapFiveNear

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000

def commonFiveRelabel : Fin 7 ↪ Fin 7 := ⟨![0,6,1,2,3,4,5],by decide⟩
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem extend_common_five (i : Fin 6 ↪ V) (y : V) (hy : ∀ a : Fin 6, i a ≠ y) :
    ∃ j : Fin 7 ↪ V, j 0 = i 0 ∧ j 1 = y ∧ j 2 = i 1 ∧ j 3 = i 2 ∧
      j 4 = i 3 ∧ j 5 = i 4 ∧ j 6 = i 5 := by
  let j := commonFiveRelabel.trans (extendFiniteEmbedding i y hy)
  refine ⟨j,?_,?_,?_,?_,?_,?_,?_⟩ <;> rfl

theorem equal_five_neighbors_adj {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hc : FiveLinkConfiguration G i E) {y : V}
    (hN : peelNeighbors G univ (i 0) = peelNeighbors G univ y) :
    ∀ a : Fin 6, G.Adj y (i a) ↔ a ≠ 0 := by
  classical
  have hidx : ∀ a : Fin 6, a ∈ fiveLinkNeighbors ↔ a ≠ 0 := by decide
  intro a
  constructor
  · intro hadj
    have hm : i a ∈ peelNeighbors G univ y := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [← hN,hc.neighborhood] at hm
    have ha : a ∈ fiveLinkNeighbors := by simpa using hm
    exact (hidx a).mp ha
  · intro ha
    have haN := (hidx a).mpr ha
    have hm : i a ∈ peelNeighbors G univ y := by
      rw [← hN,hc.neighborhood]
      simpa using haN
    exact (mem_filter.mp hm).2

def commonFiveOld : Fin 7 → Fin 6 := ![0,0,1,2,3,4,5]
def commonFiveNew : Fin 6 → Fin 7 := ![0,2,3,4,5,6]

theorem common_five_realizes (W : FiniteReduction (Fin 7)) {G : SimpleGraph V}
    {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))} (hc : FiveLinkConfiguration G i E)
    {y : V} (hne : i 0 ≠ y) (hxy : ¬ G.Adj (i 0) y)
    (hN : peelNeighbors G univ (i 0) = peelNeighbors G univ y)
    (hU : W.U ⊆ {0,1})
    (hEdges : ∀ e ∈ W.Upper, e.card = 2)
    (hP : ∀ p ∈ W.P, p.card = 3 ∧ edges p ⊆ W.Upper)
    (hOld : ∀ a b : Fin 7, a ≠ 1 → b ≠ 1 →
      (({commonFiveOld a,commonFiveOld b} : Finset (Fin 6)) ∈ E ↔ ({a,b} : Finset (Fin 7)) ∈ W.Upper))
    (hY : ∀ a : Fin 7, commonFiveOld a ≠ 0 ↔ ({1,a} : Finset (Fin 7)) ∈ W.Upper) :
    ∃ j : Fin 7 ↪ V, RealizesReduction W G j := by
  classical
  obtain ⟨j,h0,h1,h2,h3,h4,h5,h6⟩ := extend_common_five i y (nonadjacent_outside_five_core hc hne hxy)
  have hj : ∀ a : Fin 7, a ≠ 1 → j a = i (commonFiveOld a) := by
    intro a ha
    fin_cases a <;> simp_all [commonFiveOld]
  have hjNew : ∀ a : Fin 6, j (commonFiveNew a) = i a := by
    intro a
    fin_cases a <;> simp_all [commonFiveNew]
  have hyOld := equal_five_neighbors_adj hc hN
  have hyj : ∀ a : Fin 7, G.Adj y (j a) ↔ ({1,a} : Finset (Fin 7)) ∈ W.Upper := by
    intro a
    by_cases ha : a = 1
    · subst a
      rw [h1]
      have hf : ({1,1} : Finset (Fin 7)) ∉ W.Upper := by
        intro he
        have h2 := hEdges _ he
        simp at h2
      exact ⟨fun h => (G.irrefl h).elim,fun h => (hf h).elim⟩
    · rw [hj a ha,hyOld]
      exact hY a
  have hExact : ∀ a b : Fin 7, G.Adj (j a) (j b) ↔ ({a,b} : Finset (Fin 7)) ∈ W.Upper := by
    intro a b
    by_cases ha : a = 1
    · subst a
      rw [h1]
      exact hyj b
    · by_cases hb : b = 1
      · subst b
        rw [h1,Finset.pair_comm a 1]
        exact (Iff.intro (fun h => h.symm) (fun h => h.symm)).trans (hyj a)
      · rw [hj a ha,hj b hb,hc.core_edges]
        exact hOld a b ha hb
  have hNbound : ∀ a ∈ W.U, ∀ z, G.Adj (j a) z → z ∈ (univ : Finset (Fin 7)).map j := by
    intro a ha z haz
    have hzOld : z ∈ peelNeighbors G univ (i 0) := by
      rcases mem_insert.mp (hU ha) with rfl | ha
      · exact mem_filter.mpr ⟨mem_univ _,h0 ▸ haz⟩
      · have ha1 : a = 1 := mem_singleton.mp ha
        subst a
        rw [h1] at haz
        rw [hN]
        exact mem_filter.mpr ⟨mem_univ _,haz⟩
    rw [hc.neighborhood] at hzOld
    obtain ⟨b,hb,rfl⟩ := mem_map.mp hzOld
    exact mem_map.mpr ⟨commonFiveNew b,mem_univ _,hjNew b⟩
  exact ⟨j,reduction_of_exact_core W j hExact hNbound hEdges hP⟩

theorem minimal_no_shared_five_near {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {y : V} (hnear : FiveLinkConfiguration G i fiveNearCore)
    (hne' : i 0 ≠ y) (hxy' : ¬ G.Adj (i 0) y)
    (hN' : peelNeighbors G univ (i 0) = peelNeighbors G univ y) : False := by
  classical
  obtain ⟨j,hr⟩ := common_five_realizes OverlapFiveNear.witness hnear hne' hxy' hN'
    (by decide)
    (fun e he => (by decide : ∀ e : ↥OverlapFiveNear.Upper, e.val.card = 2) ⟨e,he⟩)
    (fun p hp => (by decide : ∀ p : ↥OverlapFiveNear.P, p.val.card = 3 ∧ edges p.val ⊆ OverlapFiveNear.Upper) ⟨p,hp⟩)
    (by
      intro a b
      simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,mem_singleton,subset_univ,true_and]
      fin_cases a <;> fin_cases b <;> decide)
    (by intro a; fin_cases a <;> decide)
  exact OverlapFiveNear.excluded hG j hr

theorem minimal_no_shared_five_clique {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {y : V} (hfull : FiveLinkConfiguration G i fiveCliqueCore)
    (hne' : i 0 ≠ y) (hxy' : ¬ G.Adj (i 0) y)
    (hN' : peelNeighbors G univ (i 0) = peelNeighbors G univ y) : False := by
  classical
  obtain ⟨j,hr⟩ := common_five_realizes OverlapFiveClique.witness hfull hne' hxy' hN'
    (by decide)
    (fun e he => (by decide : ∀ e : ↥OverlapFiveClique.Upper, e.val.card = 2) ⟨e,he⟩)
    (fun p hp => (by decide : ∀ p : ↥OverlapFiveClique.P, p.val.card = 3 ∧ edges p.val ⊆ OverlapFiveClique.Upper) ⟨p,hp⟩)
    (by
      intro a b
      simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,mem_singleton,subset_univ,true_and]
      fin_cases a <;> fin_cases b <;> decide)
    (by intro a; fin_cases a <;> decide)
  exact OverlapFiveClique.excluded hG j hr

/-- Five common neighbors are impossible for two distinct nonadjacent degree-five
vertices of an ACTUAL minimal combined obstruction. -/
theorem minimal_no_five_common {G : SimpleGraph V} (hG : MinimalObstruction G) {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hne : x ≠ y) (hxy : ¬ G.Adj x y)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 5) : False := by
  classical
  have hN := neighbors_eq_of_five_common hx hy hC
  obtain ⟨i,hi,hcfg⟩ := minimal_degree_five_configuration hG hx
  have hne' : i 0 ≠ y := hi.symm ▸ hne
  have hxy' : ¬ G.Adj (i 0) y := hi.symm ▸ hxy
  have hN' : peelNeighbors G univ (i 0) = peelNeighbors G univ y := hi.symm ▸ hN
  rcases hcfg with hnear | hfull
  · exact minimal_no_shared_five_near hG hnear hne' hxy' hN'
  · exact minimal_no_shared_five_clique hG hfull hne' hxy' hN'
end Tuza06
