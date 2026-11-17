import Tuza24.PerfectForestExclusionBase
import Tuza24.ApexLinkGeometry
import Tuza24.ForestMatchingLeafRetention
import Tuza24.ForestMatchingLeafAvoidance

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem remove_family_edge_iff {F : SimpleGraph V} {M : Finset (Finset V)} {e : Finset V} :
    (removeEdgeFamily F M).IsNClique 2 e ↔ F.IsNClique 2 e ∧ e∉M := by
  constructor
  · intro he
    refine ⟨he.mono (removeEdgeFamily_le F M),?_⟩
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he.card_eq
    exact (he.isClique (by simp) (by simp) hab).2
  · rintro ⟨he,heM⟩
    refine ⟨?_,he.card_eq⟩
    intro a ha b hb hab
    refine ⟨he.isClique ha hb hab,?_⟩
    have heq : ({a,b}:Finset V)=e := eq_of_subset_of_card_le
      (by simpa only [insert_subset_iff,singleton_subset_iff,Finset.mem_coe] using And.intro ha hb)
      (by rw [he.card_eq]; simp [hab])
    simpa only [heq] using heM

/-- Forest minmax applied to the actual graph obtained by deleting a matching
(or any supplied edge family); no residual matching premise is assumed. -/
theorem forest_residual_matching_cover {F : SimpleGraph V} (hF : F.IsAcyclic)
    (M : Finset (Finset V)) :
    ∃ N Q,EdgeMatching F N ∧ Disjoint M N ∧ ResidualVertexCover F M Q ∧ Q.card=N.card := by
  obtain ⟨N,Q,hN,hQ,hcard⟩ := forest_maximum_matching_cover (hF.anti (removeEdgeFamily_le F M))
  refine ⟨N,Q,matching_mono (removeEdgeFamily_le F M) hN.1,?_,?_,hcard⟩
  · apply disjoint_right.mpr
    intro e he heM
    exact (remove_family_edge_iff.mp (hN.1.1 e he)).2 heM
  · intro e he heM
    exact hQ e (remove_family_edge_iff.mpr ⟨he,heM⟩)

/-- A matching of maximum cardinality is maximum, retaining the explicit witness. -/
theorem maximum_matching_of_card_eq {F : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : MaximumMatching F M) (hN : EdgeMatching F N) (hcard : N.card=M.card) : MaximumMatching F N :=
  ⟨hN,fun P hP => hcard.symm ▸ hM.2 P hP⟩

theorem maximum_matching_nonempty_of_adj {F : SimpleGraph V} {M : Finset (Finset V)}
    (hM : MaximumMatching F M) {a b : V} (hab : F.Adj a b) : M.Nonempty := by
  classical
  have he : F.IsNClique 2 ({a,b}:Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hab.ne] using hab,by simp [hab.ne]⟩
  have hp : EdgeMatching F {{a,b}} := by
    constructor
    · intro e heM; exact (mem_singleton.mp heM).symm ▸ he
    · intro e heM f hfM hef
      exact (hef ((mem_singleton.mp heM).trans (mem_singleton.mp hfM).symm)).elim
  have hc := hM.2 {{a,b}} hp
  exact card_pos.mp (by simpa using hc)

/-- A nonperfect active forest in a minimal full link admits one extra apex edge. -/
theorem minimal_nonperfect_link_larger_matching {G : SimpleGraph V} (hG : MinimalCS G)
    {v w : V} (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card) :
    ∃ Z,EdgeMatching (linkGraph G v) Z ∧ Z.card=M.card+1 := by
  obtain ⟨u,huS,huM⟩ := matching_exposed_active_vertex hM.1 hdef
  obtain ⟨x,y,hxy,⟨N,hN,hxN⟩,hy,_,_,⟨z,hxz,hxleaf⟩,_⟩ :=
    forest_exposable_two_leaves hF ⟨M,hM,huM⟩ (minimal_forest_link_active hG huS)
  have hspoke := minimal_forest_leaf_apex hG hxz hxleaf
  have hnew := isolate_insert_spoke_matching hN.1 hxN hspoke
  refine ⟨insert {w,x} N,hnew.1,?_⟩
  rw [hnew.2,maximum_matching_card_eq hN hM]

/-- If some maximum forest matching had a smaller residual matching number,
its apex-cover reduction would be beaten by a larger hub matching. -/
theorem minimal_nonperfect_disjoint_peer {G : SimpleGraph V} (hG : MinimalCS G)
    {v w : V} (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card) :
    ∃ N,EdgeMatching (isolate (linkGraph G v) {w}) N ∧ Disjoint M N ∧ N.card=M.card := by
  obtain ⟨N,Q,hN,hd,hQ,hcard⟩ := forest_residual_matching_cover hF M
  have hle := hM.2 N hN
  have heq : N.card=M.card := by
    by_contra hneq
    have hlt : N.card<M.card := by omega
    have hQC : (insert w Q).card≤M.card := (card_insert_le _ _).trans (by omega)
    have hm := full_link_matching_of_residual (matching_mono (isolate_le _ _) hM.1)
      (isolate_residual_insert_vertex hQ)
    obtain ⟨Z,hZ,hZcard⟩ := minimal_nonperfect_link_larger_matching hG hF hM hdef
    exact minimal_link_no_larger_matching hG hF hm (card_pos.mp (by omega)) hQC hZ (by omega)
  exact ⟨N,hN,hd,heq⟩

/-- Every actual forest edge can be avoided by a maximum matching once every
maximum matching has an equally large disjoint peer. -/
theorem maximum_edge_avoidable_of_peer {F : SimpleGraph V} {M : Finset (Finset V)}
    (hM : MaximumMatching F M)
    (hpeer : ∀ K,MaximumMatching F K → ∃ N,EdgeMatching F N ∧ Disjoint K N ∧ N.card=K.card)
    (e : Finset V) : ∃ N,MaximumMatching F N ∧ e∉N := by
  by_cases he : e∈M
  · obtain ⟨N,hN,hd,hcard⟩ := hpeer M hM
    exact ⟨N,maximum_matching_of_card_eq hM hN hcard,fun h => disjoint_left.mp hd he h⟩
  · exact ⟨M,hM,he⟩

end Tuza24
