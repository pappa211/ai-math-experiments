import Tuza06.LowNeighborEndpoint
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

private def rimOrder : Fin 6 → Fin 6 → Fin 6 :=
  ![![0,1,2,3,4,5],![0,1,2,3,5,4],![0,1,2,4,3,5],
    ![0,1,2,4,5,3],![0,1,2,5,3,4],![0,1,2,5,4,3]]
private theorem rimOrder_inj : ∀ q : Fin 6, Function.Injective (rimOrder q) := by decide
private def rimReorder (q : Fin 6) : Fin 6 ↪ Fin 6 := ⟨rimOrder q,rimOrder_inj q⟩
private theorem rim_choices : ∀ a b : Fin 6, a ∈ ({3,4,5} : Finset (Fin 6)) →
    b ∈ ({3,4,5} : Finset (Fin 6)) → a ≠ b →
    ∃ q : Fin 6, rimReorder q 3 = a ∧ rimReorder q 4 = b := by decide
private theorem rim_hub : ∀ q : Fin 6, rimReorder q 0 = 0 := by decide
private theorem rim_endpoint : ∀ q : Fin 6, rimReorder q 1 = 1 := by decide
private theorem rim_neighbors : ∀ q : Fin 6, fiveLinkNeighbors.map (rimReorder q) = fiveLinkNeighbors := by decide
private theorem rim_common : ∀ q : Fin 6,
    ({0,3,4,5} : Finset (Fin 6)).map (rimReorder q) = {0,3,4,5} := by decide
private theorem rim_edges : ∀ q : Fin 6, ∀ a b : Fin 6,
    ({rimReorder q a,rimReorder q b} : Finset (Fin 6)) ∈ fiveNearCore ↔
      ({a,b} : Finset (Fin 6)) ∈ fiveNearCore := by
  intro q a b
  simp only [fiveNearCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
  by_cases hab : a = b
  · subst b
    simp
  · have hrab : rimReorder q a ≠ rimReorder q b := fun h => hab ((rimReorder q).injective h)
    simp only [card_pair hab,card_pair hrab,eq_self_iff_true,true_and]
    exact (by decide : ∀ q : Fin 6, ∀ a b : Fin 6,
      ({rimReorder q a,rimReorder q b} : Finset (Fin 6)) ≠ {1,2} ↔
      ({a,b} : Finset (Fin 6)) ≠ {1,2}) q a b

theorem minimal_no_near_endpoint_degree_six {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 1) = 6) : False := by
  classical
  obtain ⟨p,q,hpq,hpOut,hqOut,hN⟩ := near_endpoint_two_private_neighbors hr hdeg
  by_cases hPQ : G.Adj p q
  · exact minimal_no_endpoint_six_private_edge hG hr hpq hpOut hqOut hN hPQ
  · obtain ⟨a,ha,b,hb,hab,hpa,hpb⟩ := near_endpoint_private_two_rim_neighbors hG hr hpOut hN hPQ
    have hNswap : peelNeighbors G univ (i 1) = {q,p} ∪ (({0,3,4,5} : Finset (Fin 6)).map i) := by
      simpa only [pair_comm p q] using hN
    obtain ⟨c,hc,d,hd,hcd,hqc,hqd⟩ :=
      near_endpoint_private_two_rim_neighbors hG hr hqOut hNswap (fun h => hPQ h.symm)
    have hchoose : ∃ a ∈ ({3,4,5} : Finset (Fin 6)), ∃ b ∈ ({3,4,5} : Finset (Fin 6)),
        a ≠ b ∧ G.Adj p (i a) ∧ G.Adj q (i b) := by
      by_cases hac : a = c
      · exact ⟨b,hb,c,hc,by simpa only [hac] using hab.symm,hpb,hqc⟩
      · exact ⟨a,ha,c,hc,hac,hpa,hqc⟩
    obtain ⟨a,ha,b,hb,hab,hpa,hqb⟩ := hchoose
    obtain ⟨ridx,hr3,hr4⟩ := rim_choices a b ha hb hab
    let r := rimReorder ridx
    let j := r.trans i
    have hcfg : FiveLinkConfiguration G j fiveNearCore := by
      constructor
      · change peelNeighbors G univ (i (rimReorder ridx 0)) = _
        rw [rim_hub,hr.neighborhood,← map_map,rim_neighbors]
      · intro x y
        exact (hr.core_edges (r x) (r y)).trans (rim_edges ridx x y)
    have hRange : (univ : Finset (Fin 6)).map j = (univ : Finset (Fin 6)).map i := by
      change (univ : Finset (Fin 6)).map (r.trans i) = _
      rw [←map_map,finite_embedding_range_eq r]
    have hpOutj : p ∉ (univ : Finset (Fin 6)).map j := by rw [hRange]; exact hpOut
    have hqOutj : q ∉ (univ : Finset (Fin 6)).map j := by rw [hRange]; exact hqOut
    have hK : ({0,3,4,5} : Finset (Fin 6)).map j = ({0,3,4,5} : Finset (Fin 6)).map i := by
      change ({0,3,4,5} : Finset (Fin 6)).map ((rimReorder ridx).trans i) = _
      rw [←map_map,rim_common]
    have hj1 : j 1 = i 1 := congrArg i (rim_endpoint ridx)
    have hNj : peelNeighbors G univ (j 1) = {p,q} ∪ (({0,3,4,5} : Finset (Fin 6)).map j) := by
      rw [hj1,hK]; exact hN
    have hp3 : G.Adj p (j 3) := by change G.Adj p (i (rimReorder ridx 3)); rw [hr3]; exact hpa
    have hq4 : G.Adj q (j 4) := by change G.Adj q (i (rimReorder ridx 4)); rw [hr4]; exact hqb
    exact minimal_no_endpoint_six_private_nonedge_canonical hG hcfg hpq hpOutj hqOutj hNj hPQ hp3 hq4

theorem minimal_no_near_second_endpoint_degree_six {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveNearCore)
    (hdeg : degreeWithin G univ (i 2) = 6) : False :=
  minimal_no_near_endpoint_degree_six hG (near_configuration_swap hr) hdeg

end Tuza06
#print axioms Tuza06.minimal_no_near_endpoint_degree_six
