import Tuza24.ResidualMatching
import Tuza24.ForestMatchingDeficiency

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Active vertices, rather than the ambient type, measure forest deficiency. -/
theorem minimal_nonperfect_deficiency_two {G : SimpleGraph V} (hG : MinimalCS G)
    {v w : V} (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card) :
    2*M.card+2 ≤ ((peelNeighbors G univ v).erase w).card := by
  classical
  have hsize : 4≤((peelNeighbors G univ v).erase w).card := by
    have hn := minimal_full_link_size hG hvw
    have hwN : w∈peelNeighbors G univ v := mem_filter.mpr ⟨mem_univ _,hvw⟩
    rw [card_erase_of_mem hwN]
    omega
  apply forest_nonperfect_deficiency_two hF (fun _ he => forest_link_edge_active he)
    (fun _ ha => minimal_forest_link_active hG ha) hsize hM hdef
  intro K hK
  apply minimal_nonperfect_disjoint_peer hG hF hK
  simpa [maximum_matching_card_eq hK hM] using hdef

/-- A maximum forest matching plus a spoke to an exposed leaf always has a
residual full-link cover of at most the enlarged matching size. -/
theorem apex_leaf_matching_reduction {G : SimpleGraph V} {v w x : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hx : x∉matchingVertices M) (hwx : (linkGraph G v).Adj w x) :
    ∃ Q,LinkMatching G v (insert ({w,x}:Finset V) M) Q ∧ Q.card≤(insert ({w,x}:Finset V) M).card := by
  obtain ⟨N,Q,hN,_,hQ,hcard⟩ := forest_residual_matching_cover hF M
  have hle := hM.2 N hN
  have hnew := isolate_insert_spoke_matching hM.1 hx hwx
  refine ⟨insert w Q,full_link_matching_of_residual hnew.1 ?_,?_⟩
  · intro e he heP
    exact isolate_residual_insert_vertex hQ e he (fun h => heP (mem_insert_of_mem h))
  · have hc := card_insert_le w Q
    rw [hnew.2]
    omega

/-- A triangular forest edge allowed in a maximum matching is impossible in the
nonperfect branch. Fact A selects the initial leaf; Fact B selects the avoiding leaf. -/
theorem minimal_nonperfect_allowed_triangle {G : SimpleGraph V} (hG : MinimalCS G)
    {v w a b : V} (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card)
    (he : ({a,b}:Finset V)∈M) (ht : ({a,b,w}:Finset V)∈triangles G) : False := by
  classical
  let F := isolate (linkGraph G v) {w}
  have heF : F.IsNClique 2 ({a,b}:Finset V) := hM.1.1 _ he
  have hab : a≠b := by intro h; have hc:=heF.card_eq; simp [h] at hc
  have habF : F.Adj a b := heF.isClique (by simp) (by simp) hab
  have hS := fun u hu => minimal_forest_link_active hG (v:=v) (a:=u) (w:=w) hu
  obtain ⟨N,x,hN,hbase,hx,⟨y,hxy,hxl⟩⟩ := forest_retain_edge_expose_leaf hF hM he hS hdef
  have hwx := minimal_forest_leaf_apex hG hxy hxl
  obtain ⟨Q,hm,hQ⟩ := apex_leaf_matching_reduction hF hN hx hwx
  have hdef2 := minimal_nonperfect_deficiency_two hG hvw hF hM hdef
  have hpeer : ∀ K,MaximumMatching F K → ∃ N,EdgeMatching F N ∧ Disjoint K N ∧ N.card=K.card := by
    intro K hK
    apply minimal_nonperfect_disjoint_peer hG hF hK
    simpa [maximum_matching_card_eq hK hM] using hdef
  obtain ⟨K,hK,hnot⟩ := maximum_edge_avoidable_of_peer hM hpeer ({a,b}:Finset V)
  have hdefK : 2*K.card+2≤((peelNeighbors G univ v).erase w).card := by
    simpa [maximum_matching_card_eq hK hM] using hdef2
  obtain ⟨R,t,hR,havoid,htR,htab,⟨s,hts,htleaf⟩⟩ :=
    forest_avoid_edge_expose_leaf hF hK habF hnot hS hdefK
  have hwt := minimal_forest_leaf_apex hG hts htleaf
  have hZ := isolate_insert_spoke_matching hR.1 htR hwt
  have hP := isolate_insert_spoke_matching hN.1 hx hwx
  have hcard : (insert ({w,x}:Finset V) N).card≤(insert ({w,t}:Finset V) R).card := by
    rw [hP.2,hZ.2,maximum_matching_card_eq hN hR]
  have hdisj := insert_spoke_disjoint_apex_triangle
    (isolate_matching_vertices_avoids hR.1 (v:=w) (by simp)) havoid htab hwt.ne
  have hNpage : ({a,b,w}:Finset V)⊆peelNeighbors G univ v := by
    simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨mem_filter.mpr ⟨mem_univ _,habF.1.2.1⟩,
      mem_filter.mpr ⟨mem_univ _,habF.1.2.2⟩,mem_filter.mpr ⟨mem_univ _,hvw⟩⟩
  exact minimal_internal_page_augmentation hG hF hm hQ (mem_insert_of_mem hbase)
    ht hNpage hZ.1 hcard hdisj

/-- A maximum-matching forest edge with safe endpoints gives an external-page
contradiction in the nonperfect branch. -/
theorem minimal_nonperfect_safe_edge {G : SimpleGraph V} (hG : MinimalCS G)
    {v w a b : V} (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card)
    (he : ({a,b}:Finset V)∈M)
    (hnoa : ∀ t∈triangles (linkGraph G v),a∉t)
    (hnob : ∀ t∈triangles (linkGraph G v),b∉t) : False := by
  classical
  let F := isolate (linkGraph G v) {w}
  have heF : F.IsNClique 2 ({a,b}:Finset V) := hM.1.1 _ he
  have hab : a≠b := by intro h; have hc:=heF.card_eq; simp [h] at hc
  have habF : F.Adj a b := heF.isClique (by simp) (by simp) hab
  have hS := fun u hu => minimal_forest_link_active hG (v:=v) (a:=u) (w:=w) hu
  obtain ⟨N,x,hN,hbase,hx,⟨y,hxy,hxl⟩⟩ := forest_retain_edge_expose_leaf hF hM he hS hdef
  have hwx := minimal_forest_leaf_apex hG hxy hxl
  obtain ⟨Q,hm,hQ⟩ := apex_leaf_matching_reduction hF hN hx hwx
  have hdef2 := minimal_nonperfect_deficiency_two hG hvw hF hM hdef
  have hpeer : ∀ K,MaximumMatching F K → ∃ N,EdgeMatching F N ∧ Disjoint K N ∧ N.card=K.card := by
    intro K hK
    apply minimal_nonperfect_disjoint_peer hG hF hK
    simpa [maximum_matching_card_eq hK hM] using hdef
  obtain ⟨K,hK,hnot⟩ := maximum_edge_avoidable_of_peer hM hpeer ({a,b}:Finset V)
  have hdefK : 2*K.card+2≤((peelNeighbors G univ v).erase w).card := by
    simpa [maximum_matching_card_eq hK hM] using hdef2
  obtain ⟨R,t,hR,havoid,htR,_,⟨s,hts,htleaf⟩⟩ :=
    forest_avoid_edge_expose_leaf hF hK habF hnot hS hdefK
  have hwt := minimal_forest_leaf_apex hG hts htleaf
  have hZ := isolate_insert_spoke_matching hR.1 htR hwt
  have hP := isolate_insert_spoke_matching hN.1 hx hwx
  obtain ⟨z,hpage,hvpage,hz⟩ := minimal_external_page hG habF.1 hnoa
  have hbaseZ : ({a,b}:Finset V)∉insert ({w,t}:Finset V) R := insert_spoke_avoids_base
    (fun hw => disjoint_left.mp (isolate_edge_avoids heF) hw (by simp)) havoid
  have hdisj := external_page_matching_disjoint hZ.1 hz hbaseZ
  have hcard : (insert ({w,x}:Finset V) N).card≤(insert ({w,t}:Finset V) R).card := by
    rw [hP.2,hZ.2,maximum_matching_card_eq hN hR]
  exact minimal_safe_external_page_augmentation hG hF hm hQ (mem_insert_of_mem hbase)
    hpage hvpage hnoa hnob hZ.1 hcard hdisj

end Tuza24
