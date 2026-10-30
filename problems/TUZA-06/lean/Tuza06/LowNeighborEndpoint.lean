import Tuza06.LowNeighborEndpointPatterns

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

private theorem endpoint_N_shape : EndpointSix.N =
    ({6,7} : Finset (Fin 8)) ∪ (({0,3,4,5} : Finset (Fin 6)).map sixIntoEight) := by decide
private theorem endpoint_present_bad : ∀ a b : Fin 8, ({a,b} : Finset (Fin 8)) ∈ EndpointSix.presentBad →
    (a=0 ∧ b=6) ∨ (a=6 ∧ b=0) ∨ (a=0 ∧ b=7) ∨ (a=7 ∧ b=0) := by decide
private theorem endpoint_absent_bad : ∀ a b : Fin 8, ({a,b} : Finset (Fin 8)) ∈ EndpointSix.absentBad →
    (a=0 ∧ b=6) ∨ (a=6 ∧ b=0) ∨ (a=0 ∧ b=7) ∨ (a=7 ∧ b=0) ∨
    (a=6 ∧ b=7) ∨ (a=7 ∧ b=6) := by decide

theorem endpoint_six_pattern_realization {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hr : FiveLinkConfiguration G i fiveNearCore) {p q : V}
    (hpq : p ≠ q) (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hqOut : q ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map i)) :
    ∃ e : Fin 8 ↪ V, e 0 = i 0 ∧ e 1 = i 1 ∧ e 3 = i 3 ∧ e 4 = i 4 ∧
      e 6 = p ∧ e 7 = q ∧
      peelNeighbors G univ (e 1) = EndpointSix.N.map e ∧
      (∀ f ∈ EndpointSix.baseKnown, G.IsNClique 2 (f.map e)) := by
  classical
  have hp : ∀ a : Fin 6, i a ≠ p := fun a h => hpOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
  have hq : ∀ a : Fin 6, i a ≠ q := fun a h => hqOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let e := extendTwoFiniteEmbedding i p q hp hq hpq
  have hold : ∀ a : Fin 6, e (sixIntoEight a) = i a := extendTwo_old i p q hp hq hpq
  have hcomp : sixIntoEight.trans e = i := by ext a; exact hold a
  have he6 : e 6 = p := extendTwo_six i p q hp hq hpq
  have he7 : e 7 = q := extendTwo_seven i p q hp hq hpq
  refine ⟨e,hold 0,hold 1,hold 3,hold 4,he6,he7,?_,?_⟩
  · have he1 : e 1 = i 1 := hold 1
    rw [he1,hN,endpoint_N_shape,map_union,map_map]
    change _ = ({6,7} : Finset (Fin 8)).map e ∪ ({0,3,4,5} : Finset (Fin 6)).map (sixIntoEight.trans e)
    simp only [hcomp,map_insert,map_singleton,he6,he7]
  · intro f hf
    obtain ⟨g,hg,rfl⟩ := mem_liftFamily.mp hf
    have hm : (g.map sixIntoEight).map e = g.map i := by
      rw [map_map]; change g.map (sixIntoEight.trans e) = _; rw [hcomp]
    rw [hm]
    exact core_mapped_edge hr (mem_edges.mp (sdiff_subset hg)).2 hg

theorem minimal_no_endpoint_six_private_edge {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore) {p q : V}
    (hpq : p ≠ q) (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hqOut : q ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map i))
    (hPQ : G.Adj p q) : False := by
  classical
  obtain ⟨e,he0,he1,he3,he4,he6,he7,hNe,hBase⟩ :=
    endpoint_six_pattern_realization hr hpq hpOut hqOut hN
  have hn06 : ¬ G.Adj (e 0) (e 6) := by rw [he0,he6]; exact core_hub_not_outside hr hpOut
  have hn07 : ¬ G.Adj (e 0) (e 7) := by rw [he0,he7]; exact core_hub_not_outside hr hqOut
  apply EndpointSix.present.excluded hG e hNe
  · intro f hf
    rcases mem_union.mp hf with hold|hnew
    · exact hBase f hold
    · have hfEq := mem_singleton.mp hnew
      rw [hfEq,map_insert,map_singleton,he6,he7]
      exact sparse_pair_edge hPQ
  · intro a b hab hadj
    rcases endpoint_present_bad a b hab with h06|h60|h07|h70
    · exact hn06 (by simpa only [h06.1,h06.2] using hadj)
    · exact hn06 (by simpa only [h60.1,h60.2] using hadj.symm)
    · exact hn07 (by simpa only [h07.1,h07.2] using hadj)
    · exact hn07 (by simpa only [h70.1,h70.2] using hadj.symm)

theorem minimal_no_endpoint_six_private_nonedge_canonical {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore) {p q : V}
    (hpq : p ≠ q) (hpOut : p ∉ (univ : Finset (Fin 6)).map i)
    (hqOut : q ∉ (univ : Finset (Fin 6)).map i)
    (hN : peelNeighbors G univ (i 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map i))
    (hPQ : ¬ G.Adj p q) (hp3 : G.Adj p (i 3)) (hq4 : G.Adj q (i 4)) : False := by
  classical
  obtain ⟨e,he0,he1,he3,he4,he6,he7,hNe,hBase⟩ :=
    endpoint_six_pattern_realization hr hpq hpOut hqOut hN
  have hn06 : ¬ G.Adj (e 0) (e 6) := by rw [he0,he6]; exact core_hub_not_outside hr hpOut
  have hn07 : ¬ G.Adj (e 0) (e 7) := by rw [he0,he7]; exact core_hub_not_outside hr hqOut
  have hn67 : ¬ G.Adj (e 6) (e 7) := by rw [he6,he7]; exact hPQ
  apply EndpointSix.absent.excluded hG e hNe
  · intro f hf
    rcases mem_union.mp hf with hold|hnew
    · exact hBase f hold
    · rcases mem_insert.mp hnew with rfl|hnew
      · rw [map_insert,map_singleton,he6,he3]
        exact sparse_pair_edge hp3
      · have hfEq := mem_singleton.mp hnew
        rw [hfEq,map_insert,map_singleton,he7,he4]
        exact sparse_pair_edge hq4
  · intro a b hab hadj
    rcases endpoint_absent_bad a b hab with h06|h60|h07|h70|h67|h76
    · exact hn06 (by simpa only [h06.1,h06.2] using hadj)
    · exact hn06 (by simpa only [h60.1,h60.2] using hadj.symm)
    · exact hn07 (by simpa only [h07.1,h07.2] using hadj)
    · exact hn07 (by simpa only [h70.1,h70.2] using hadj.symm)
    · exact hn67 (by simpa only [h67.1,h67.2] using hadj)
    · exact hn67 (by simpa only [h76.1,h76.2] using hadj.symm)

end Tuza06
