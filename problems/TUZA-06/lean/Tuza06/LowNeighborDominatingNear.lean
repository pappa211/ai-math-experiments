import Tuza06.LowNeighborTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]

private def nearOrder : Fin 3 → Fin 7 → Fin 7 :=
  ![![3,0,1,2,4,5,6],![4,0,1,2,3,5,6],![5,0,1,2,3,4,6]]
private theorem nearOrder_inj : ∀ k : Fin 3, Function.Injective (nearOrder k) := by decide
private def nearReorder (k : Fin 3) : Fin 7 ↪ Fin 7 := ⟨nearOrder k,nearOrder_inj k⟩
private def nearCenter (k : Fin 3) : Fin 6 := ⟨k.val+3,by omega⟩
private def nearKnown (k : Fin 3) := liftFamily sixIntoSeven fiveNearCore ∪
  ({{(nearCenter k).castSucc,6},{(nearCenter k).castSucc,6}} : Finset (Finset (Fin 7)))
private theorem near_first : ∀ k : Fin 3, nearReorder k 0 = (nearCenter k).castSucc := by decide
private theorem near_second : ∀ k : Fin 3, nearReorder k 1 = 0 := by decide
private theorem near_star : ∀ k : Fin 3, ∀ a : Fin 6, a ≠ nearCenter k →
  ({nearCenter k,a} : Finset (Fin 6)) ∈ fiveNearCore := by decide
private theorem near_P : ∀ k : Fin 3, ∀ p : ↥DominatingNearSix.P,
  (p.val.map (nearReorder k)).card = 3 ∧ edges (p.val.map (nearReorder k)) ⊆ nearKnown k := by decide
private theorem near_bad : ∀ k : Fin 3, ∀ a b : Fin 7,
  ({a,b} : Finset (Fin 7)) ∉ DominatingNearSix.Upper →
  a=b ∨ (nearReorder k a=0 ∧ nearReorder k b=6) ∨
  (nearReorder k a=6 ∧ nearReorder k b=0) ∨
  (nearReorder k a=1 ∧ nearReorder k b=2) ∨
  (nearReorder k a=2 ∧ nearReorder k b=1) := by decide

theorem minimal_no_near_dominating_degree_six {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore) (k : Fin 3)
    (hdeg : degreeWithin G univ (i (nearCenter k)) = 6) : False := by
  classical
  obtain ⟨p,hpOut,hN⟩ := core_dominating_six_private_neighbor hr (nearCenter k) (near_star k) hdeg
  have hx : ∀ a : Fin 6, i a ≠ p := fun a h => hpOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let e := extendFiniteEmbedding i p hx
  let r := nearReorder k
  have hkp : G.Adj (i (nearCenter k)) p := (mem_filter.mp (by rw [hN]; simp : p ∈ peelNeighbors G univ (i (nearCenter k)))).2
  have hKnown : ∀ f ∈ nearKnown k, G.IsNClique 2 (f.map e) :=
    extended_core_known_edges hr sdiff_subset p hx (nearCenter k) (nearCenter k) hkp hkp
  have hP : liftFamily (r.trans e) DominatingNearSix.P ⊆ triangles G := by
    rw [← liftFamily_comp]
    apply mapped_triangles_of_edges e hKnown
    intro t ht
    obtain ⟨q,hq,rfl⟩ := mem_liftFamily.mp ht
    exact near_P k ⟨q,hq⟩
  have hn06 : ¬ G.Adj (e 0) (e 6) := core_hub_not_outside hr hpOut
  have hn12 : ¬ G.Adj (e 1) (e 2) := by
    intro h
    exact (by decide : ({1,2} : Finset (Fin 6)) ∉ fiveNearCore) ((hr.core_edges 1 2).mp h)
  have hu : ∀ a b : Fin 7, G.Adj (e (r a)) (e (r b)) →
      ({a,b} : Finset (Fin 7)) ∈ DominatingNearSix.witness.Upper := by
    intro a b hadj
    by_contra hn
    change G.Adj (e (nearReorder k a)) (e (nearReorder k b)) at hadj
    rcases near_bad k a b hn with hab|h06|h60|h12|h21
    · exact G.irrefl (congrArg (fun x => e (r x)) hab ▸ hadj)
    · exact hn06 (by simpa only [h06.1,h06.2] using hadj)
    · exact hn06 (by simpa only [h60.1,h60.2] using hadj.symm)
    · exact hn12 (by simpa only [h12.1,h12.2] using hadj)
    · exact hn12 (by simpa only [h21.1,h21.2] using hadj.symm)
  have hreal := dominating_six_realizes hr DominatingNearSix.witness rfl p hx (nearCenter k) hN r
    (near_first k) (near_second k) hu hP
  exact DominatingNearSix.excluded hG (r.trans e) hreal

end Tuza06
#print axioms Tuza06.minimal_no_near_dominating_degree_six
