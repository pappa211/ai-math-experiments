import Tuza06.FiveLinkLabeling
import Tuza06.DenseLinkOne
import Tuza06.DenseLinkTwo
import Tuza06.DenseLinkThree
import Tuza06.DenseLinkFour
import Tuza06.DenseExtraLink
import Tuza06.BowtieLink
import Tuza06.SparseLinksK23
import Tuza06.SparseLinksC5
import Tuza06.SparseLinksK221

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- All local finite certificates are checked against the actual full core edge
set, then realized symbolically in arbitrary ambient graphs. -/
theorem configuration_realizes_augmentation (W : FiniteAugmentation (Fin 6))
    {G : SimpleGraph V} {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))}
    (hr : FiveLinkConfiguration G i E) (hhub : W.hub = 0) (hN : W.N = fiveLinkNeighbors)
    (hM : ∀ e ∈ W.M, e.card = 2 ∧ e ∈ E)
    (hBad : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ W.BadG → ({a,b} : Finset (Fin 6)) ∉ E)
    (hAug : ∀ t ∈ W.Aug, t ∈ coreFamily E) : RealizesAugmentation W G i := by
  constructor
  · rw [hhub,hN]
    exact hr.neighborhood
  · intro e he
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp he
    exact core_mapped_edge hr (hM f hf).1 (hM f hf).2
  · intro a b hab hadj
    exact hBad a b hab ((hr.core_edges a b).mp hadj)
  · intro t ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact (core_triangle_iff hr s).mpr (hAug s hs)

private theorem exclude_rep_0 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 0))) : False := by
  apply DenseLinkOne.excluded hG i
  apply configuration_realizes_augmentation DenseLinkOne.witness hr (by decide) (by decide)
  · intro e he
    exact (by decide : ∀ e : ↥DenseLinkOne.M, e.val.card = 2 ∧ e.val ∈ (fiveCoreEdges (FiveCoverage.representative 0))) ⟨e,he⟩
  · decide
  · intro t ht
    exact (by decide : ∀ t : ↥DenseLinkOne.Aug, t.val ∈ coreFamily (fiveCoreEdges (FiveCoverage.representative 0))) ⟨t,ht⟩

private theorem exclude_rep_1 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 1))) : False := by
  apply DenseLinkTwo.excluded hG i
  apply configuration_realizes_augmentation DenseLinkTwo.witness hr (by decide) (by decide)
  · intro e he
    exact (by decide : ∀ e : ↥DenseLinkTwo.M, e.val.card = 2 ∧ e.val ∈ (fiveCoreEdges (FiveCoverage.representative 1))) ⟨e,he⟩
  · decide
  · intro t ht
    exact (by decide : ∀ t : ↥DenseLinkTwo.Aug, t.val ∈ coreFamily (fiveCoreEdges (FiveCoverage.representative 1))) ⟨t,ht⟩

private theorem exclude_rep_2 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 2))) : False := by
  apply DenseLinkThree.excluded hG i
  apply configuration_realizes_augmentation DenseLinkThree.witness hr (by decide) (by decide)
  · intro e he
    exact (by decide : ∀ e : ↥DenseLinkThree.M, e.val.card = 2 ∧ e.val ∈ (fiveCoreEdges (FiveCoverage.representative 2))) ⟨e,he⟩
  · decide
  · intro t ht
    exact (by decide : ∀ t : ↥DenseLinkThree.Aug, t.val ∈ coreFamily (fiveCoreEdges (FiveCoverage.representative 2))) ⟨t,ht⟩

private theorem exclude_rep_3 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 3))) : False := by
  apply DenseLinkFour.excluded hG i
  apply configuration_realizes_augmentation DenseLinkFour.witness hr (by decide) (by decide)
  · intro e he
    exact (by decide : ∀ e : ↥DenseLinkFour.M, e.val.card = 2 ∧ e.val ∈ (fiveCoreEdges (FiveCoverage.representative 3))) ⟨e,he⟩
  · decide
  · intro t ht
    exact (by decide : ∀ t : ↥DenseLinkFour.Aug, t.val ∈ coreFamily (fiveCoreEdges (FiveCoverage.representative 3))) ⟨t,ht⟩

private theorem exclude_rep_4 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 4))) : False := by
  apply Bowtie.excluded hG i
  constructor
  · simpa only [Bowtie.N,fiveLinkNeighbors] using hr.neighborhood
  · intro e he
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp he
    have hc := (by decide : ∀ f : ↥Bowtie.M, f.val.card = 2 ∧ f.val ∈ fiveCoreEdges (FiveCoverage.representative 4)) ⟨f,hf⟩
    exact core_mapped_edge hr hc.1 hc.2
  · intro a b hab hadj
    have hn := (by decide : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ Bowtie.Bad →
      ({a,b} : Finset (Fin 6)) ∉ fiveCoreEdges (FiveCoverage.representative 4)) a b hab
    exact hn ((hr.core_edges a b).mp hadj)

private theorem exclude_rep_5 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 5))) : False := by
  have heq : fiveCoreEdges (FiveCoverage.representative 5) = SparseLinksK23.E := by decide
  exact SparseLinksK23.excluded hG i (heq ▸ hr)

private theorem exclude_rep_6 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 6))) : False := by
  have heq : fiveCoreEdges (FiveCoverage.representative 6) = SparseLinksC5.E := by decide
  exact SparseLinksC5.excluded hG i (heq ▸ hr)

private theorem exclude_rep_7 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 7))) : False := by
  have heq : fiveCoreEdges (FiveCoverage.representative 7) = K221Finite.BEdges := by decide
  exact SparseLinksK221.excluded hG i (heq ▸ hr)

private theorem exclude_rep_8 {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative 8))) : False := by
  apply DenseExtra.minimal_no_dense_extra_link hG
  constructor
  · simpa only [DenseExtra.N,fiveLinkNeighbors] using hr.neighborhood
  · intro e he
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp he
    have hc := (by decide : ∀ f : ↥DenseExtra.M, f.val.card = 2 ∧ f.val ∈ fiveCoreEdges (FiveCoverage.representative 8)) ⟨f,hf⟩
    exact core_mapped_edge hr hc.1 hc.2
  · intro a b hab hadj
    have hn := (by decide : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ DenseExtra.Bad →
      ({a,b} : Finset (Fin 6)) ∉ fiveCoreEdges (FiveCoverage.representative 8)) a b hab
    exact hn ((hr.core_edges a b).mp hadj)
  · intro t ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact (core_triangle_iff hr s).mpr ((by decide : ∀ s : ↥DenseExtra.Aug,
      s.val ∈ coreFamily (fiveCoreEdges (FiveCoverage.representative 8))) ⟨s,hs⟩)

/-- Complete K6 core and K6 minus one rim edge, respectively. -/
def fiveCliqueCore : Finset (Finset (Fin 6)) := edges univ
def fiveNearCore : Finset (Finset (Fin 6)) := edges univ \ {{1,2}}

/-- Exact degree-five link classification from actual minimality: only K5 or
K5 minus one edge remain. Every finite type case and arbitrary-page case is proved. -/
theorem minimal_degree_five_configuration {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hdeg : degreeWithin G univ v = 5) :
    ∃ i : Fin 6 ↪ V, i 0 = v ∧
      (FiveLinkConfiguration G i fiveNearCore ∨ FiveLinkConfiguration G i fiveCliqueCore) := by
  obtain ⟨r,i,hiv,hr⟩ := minimal_degree_five_representative hG hdeg
  fin_cases r
  · exact (exclude_rep_0 hG i hr).elim
  · exact (exclude_rep_1 hG i hr).elim
  · exact (exclude_rep_2 hG i hr).elim
  · exact (exclude_rep_3 hG i hr).elim
  · exact (exclude_rep_4 hG i hr).elim
  · exact (exclude_rep_5 hG i hr).elim
  · exact (exclude_rep_6 hG i hr).elim
  · exact (exclude_rep_7 hG i hr).elim
  · exact (exclude_rep_8 hG i hr).elim
  · have heq : fiveCoreEdges (FiveCoverage.representative 9) = fiveNearCore := by decide
    exact ⟨i,hiv,Or.inl (heq ▸ hr)⟩
  · have heq : fiveCoreEdges (FiveCoverage.representative 10) = fiveCliqueCore := by decide
    exact ⟨i,hiv,Or.inr (heq ▸ hr)⟩

end Tuza06

#check @Tuza06.minimal_degree_five_configuration
#print axioms Tuza06.minimal_degree_five_configuration
