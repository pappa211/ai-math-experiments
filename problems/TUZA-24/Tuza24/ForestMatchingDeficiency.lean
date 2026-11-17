import Tuza24.ForestMatchingLeafAvoidance

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Two edges of one matching incident with the same vertex have the same
other endpoint. -/
theorem matching_partner_unique {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) {x a b : V} (hxa : G.Adj x a)
    (ha : ({x,a}:Finset V)∈M) (hb : ({x,b}:Finset V)∈M) : a=b := by
  classical
  have heq : ({x,a}:Finset V)=({x,b}:Finset V) := by
    by_contra hne
    exact disjoint_left.mp (hM.2 _ ha _ hb hne)
      (show x∈({x,a}:Finset V) by simp) (by simp)
  have hamem : a∈({x,b}:Finset V) := heq ▸ (show a∈({x,a}:Finset V) by simp)
  rcases mem_insert.mp hamem with hax|hab
  · exact (hxa.ne hax.symm).elim
  · exact mem_singleton.mp hab

/-- A disjoint matching of the same size as a maximum one is itself maximum. -/
theorem maximumMatching_of_card_eq {G : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : MaximumMatching G M) (hN : EdgeMatching G N) (hc : N.card=M.card) :
    MaximumMatching G N := by
  refine ⟨hN,?_⟩
  intro P hP
  rw [hc]
  exact hM.2 P hP

/-- The equal-sized disjoint-peer condition makes every edge avoidable by a
maximum matching. -/
theorem maximum_disjoint_peers_edges_avoidable {G : SimpleGraph V}
    (hG : G.IsAcyclic)
    (hpeer : ∀ M, MaximumMatching G M →
      ∃ N, EdgeMatching G N ∧ Disjoint M N ∧ N.card=M.card) :
    ∀ e, G.IsNClique 2 e → ∃ N, MaximumMatching G N ∧ e∉N := by
  classical
  obtain ⟨M,Q,hM,hQ,hcard⟩ := forest_maximum_matching_cover hG
  intro e _
  by_cases he : e∈M
  · obtain ⟨N,hN,hd,hc⟩ := hpeer M hM
    exact ⟨N,maximumMatching_of_card_eq hM hN hc,fun heN => disjoint_left.mp hd he heN⟩
  · exact ⟨M,hM,he⟩

/-- Under deficit one, an equal disjoint peer exhausts every residual edge. -/
theorem forest_deficit_one_residual_peer {G : SimpleGraph V} (hG : G.IsAcyclic)
    {S : Finset V} (hS : ∀ e, G.IsNClique 2 e → e⊆S)
    {M N : Finset (Finset V)} (hM : MaximumMatching G M) (hN : EdgeMatching G N)
    (hd : Disjoint M N) (hc : N.card=M.card) (hsize : S.card=2*M.card+1) :
    ∀ e, G.IsNClique 2 e → e∉M → e∈N := by
  classical
  have hSn : S.Nonempty := card_pos.mp (by omega)
  have hbound := forest_edgeCount_lt_support hG hSn hS
  have hsub : M ∪ N ⊆ graphEdges G := by
    intro e he
    rcases mem_union.mp he with he|he
    · exact mem_graphEdges.mpr (hM.1.1 e he)
    · exact mem_graphEdges.mpr (hN.1 e he)
  have hunion : (M ∪ N).card=2*M.card := by rw [card_union_of_disjoint hd,hc]; omega
  have heq : M ∪ N=graphEdges G := eq_of_subset_of_card_le hsub (by
    change edgeCount G ≤ (M ∪ N).card
    omega)
  intro e he heM
  have heU := heq.symm ▸ mem_graphEdges.mpr he
  exact (mem_union.mp heU).resolve_left heM

/-- With deficit one and disjoint peers for all maxima, every exposable vertex
has degree at most one. No path ordering or component enumeration is used. -/
theorem forest_deficit_one_exposable_neighbors_unique {G : SimpleGraph V}
    (hG : G.IsAcyclic) {S : Finset V} (hS : ∀ e, G.IsNClique 2 e → e⊆S)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) (hsize : S.card=2*M.card+1)
    (hpeer : ∀ K, MaximumMatching G K →
      ∃ N, EdgeMatching G N ∧ Disjoint K N ∧ N.card=K.card)
    {u a b : V} (hu : Exposable G u) (hua : G.Adj u a) (hub : G.Adj u b) : a=b := by
  classical
  obtain ⟨K,hK,huK⟩ := hu
  obtain ⟨N,hN,hd,hc⟩ := hpeer K hK
  have hsizeK : S.card=2*K.card+1 := by rw [← maximum_matching_card_eq hM hK]; exact hsize
  have hres := forest_deficit_one_residual_peer hG hS hK hN hd hc hsizeK
  have hactuala : G.IsNClique 2 ({u,a}:Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hua.ne] using hua,by simp [hua.ne]⟩
  have hactualb : G.IsNClique 2 ({u,b}:Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hub.ne] using hub,by simp [hub.ne]⟩
  have hnot : ∀ e∈K, u∉e := fun e he hue => huK (mem_biUnion.mpr ⟨e,he,hue⟩)
  exact matching_partner_unique hN hua
    (hres _ hactuala (fun h => hnot _ h (by simp)))
    (hres _ hactualb (fun h => hnot _ h (by simp)))

/-- If every D vertex is a leaf or isolate, every A vertex has an unmatched
D neighbor in any maximum matching. -/
theorem exposureNeighbors_unmatched_leaf_neighbor {G : SimpleGraph V}
    (hG : G.IsAcyclic) {M : Finset (Finset V)} (hM : MaximumMatching G M)
    (hleaf : ∀ {d x y}, Exposable G d → G.Adj d x → G.Adj d y → x=y)
    {a : V} (ha : a∈exposureNeighbors G) :
    ∃ d, Exposable G d ∧ G.Adj a d ∧ d∉matchingVertices M := by
  classical
  obtain ⟨d₀,hd₀,had₀,he₀⟩ := exposureNeighbors_partner hG hM ha
  obtain ⟨d₁,d₂,hdne,hd₁,hd₂,had₁,had₂⟩ := exposureNeighbors_two_exposable_neighbors hG ha
  have hex : ∃ d, Exposable G d ∧ G.Adj a d ∧ d≠d₀ := by
    by_cases hd : d₁=d₀
    · exact ⟨d₂,hd₂,had₂,by intro h; exact hdne (hd.trans h.symm)⟩
    · exact ⟨d₁,hd₁,had₁,hd⟩
  obtain ⟨d,hd,had,hdd₀⟩ := hex
  refine ⟨d,hd,had,?_⟩
  intro hdM
  obtain ⟨z,hdz,hedz⟩ := matching_partner hM.1 hdM
  have hza : z=a := hleaf hd hdz had.symm
  have hed : ({a,d}:Finset V)∈M := by simpa [hza,pair_comm] using hedz
  exact hdd₀ (matching_partner_unique hM.1 had hed he₀)

/-- The nonperfect no-slack branch has active deficiency at least two. The set
S is explicit and consists of nonisolated active vertices; retained ambient
isolates, such as the apex, never enter the count. -/
theorem forest_nonperfect_deficiency_two {G : SimpleGraph V} (hG : G.IsAcyclic)
    {S : Finset V} (hSactual : ∀ e, G.IsNClique 2 e → e⊆S)
    (hSnoniso : ∀ u∈S, ∃ z, G.Adj u z) (hSlarge : 4≤S.card)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) (hdef : 2*M.card<S.card)
    (hpeer : ∀ K, MaximumMatching G K →
      ∃ N, EdgeMatching G N ∧ Disjoint K N ∧ N.card=K.card) :
    2*M.card+2≤S.card := by
  classical
  by_contra hn
  have hsize : S.card=2*M.card+1 := by omega
  have hleaf : ∀ {d x y}, Exposable G d → G.Adj d x → G.Adj d y → x=y :=
    fun hd hdx hdy => forest_deficit_one_exposable_neighbors_unique hG hSactual hM hsize hpeer hd hdx hdy
  have hZ : exposureRemainder G=∅ := forest_exposureRemainder_empty_of_avoidable hG
    (maximum_disjoint_peers_edges_avoidable hG hpeer)
  have hNZ : exposureMatchingZ G M=∅ := by
    apply eq_empty_iff_forall_notMem.mpr
    intro e he
    have heG := hM.1.1 e (exposureMatchingZ_subset G M he)
    obtain ⟨x,hx⟩ := card_pos.mp (show 0<e.card by rw [heG.card_eq]; decide)
    have hxZ : x∈matchingVertices (exposureMatchingZ G M) := mem_biUnion.mpr ⟨e,he,hx⟩
    rw [exposureMatchingZ_vertices hG hM,hZ] at hxZ
    simpa using hxZ
  have hMcard : M.card=(exposureNeighbors G).card := by
    have hc := forest_matching_exposure_card hG hM
    simpa [hNZ] using hc
  have hsupport : matchingVertices M⊆S := by
    intro x hx
    obtain ⟨e,he,hxe⟩ := mem_biUnion.mp hx
    exact hSactual e (hM.1.1 e he) hxe
  have hmisscard : (S \ matchingVertices M).card=1 := by
    rw [card_sdiff_of_subset hsupport,matchingVertices_card hM.1,hsize]
    omega
  obtain ⟨u,hu⟩ := card_eq_one.mp hmisscard
  have huS : u∈S := (mem_sdiff.mp (hu.symm ▸ (mem_singleton_self u))).1
  have huM : u∉matchingVertices M := (mem_sdiff.mp (hu.symm ▸ (mem_singleton_self u))).2
  obtain ⟨a,hua⟩ := hSnoniso u huS
  have hA : exposureNeighbors G ⊆ {a} := by
    intro b hb
    obtain ⟨d,hd,hbd,hdM⟩ := exposureNeighbors_unmatched_leaf_neighbor hG hM hleaf hb
    have hactual : G.IsNClique 2 ({b,d}:Finset V) :=
      ⟨by simpa [SimpleGraph.isClique_pair,hbd.ne] using hbd,by simp [hbd.ne]⟩
    have hdS : d∈S := hSactual _ hactual (by simp)
    have hdu : d=u := mem_singleton.mp (hu ▸ mem_sdiff.mpr ⟨hdS,hdM⟩)
    have hbu : G.Adj u b := hdu ▸ hbd.symm
    exact mem_singleton.mpr (hleaf ⟨M,hM,huM⟩ hbu hua)
  have hAcard := card_le_card hA
  have hr : M.card≤1 := by simpa [← hMcard] using hAcard
  omega

end Tuza24
