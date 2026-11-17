import Tuza24.AlternatingForestDecomposition

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Exchange a matching edge at a vertex for an edge to an exposed vertex.
This preserves maximum cardinality and exposes the former partner. -/
theorem maximum_matching_swap_exposed {G : SimpleGraph V}
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {a b u : V}
    (he : ({a,b} : Finset V) ∈ M) (hu : u ∉ matchingVertices M) (hau : G.Adj a u) :
    ∃ N, MaximumMatching G N ∧ ({a,u} : Finset V) ∈ N ∧ b ∉ matchingVertices N := by
  classical
  have hnot : ∀ e ∈ M, u ∉ e := by
    intro e he hue
    exact hu (mem_biUnion.mpr ⟨e,he,hue⟩)
  have hab : a ≠ b := by
    intro h
    have hc := (hM.1.1 _ he).card_eq
    simp [h] at hc
  have hbu : b ≠ u := by
    intro h
    exact hnot _ he (by simp [← h])
  have hnew : ({a,u} : Finset V) ∉ M := by
    intro h
    exact hnot _ h (by simp)
  have hnewErase : ({a,u} : Finset V) ∉ M.erase {a,b} :=
    fun h => hnew (mem_erase.mp h).2
  have hnewEdge : G.IsNClique 2 ({a,u} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hau.ne] using hau,by simp [hau.ne]⟩
  have hdisj : ∀ e ∈ M.erase {a,b}, Disjoint ({a,u} : Finset V) e := by
    intro e heErase
    obtain ⟨hne,heM⟩ := mem_erase.mp heErase
    apply disjoint_left.mpr
    intro x hx hxe
    rcases mem_insert.mp hx with rfl|hx
    · exact disjoint_left.mp (hM.1.2 {x,b} he e heM hne.symm) (by simp) hxe
    · exact hnot e heM ((mem_singleton.mp hx) ▸ hxe)
  let N := insert ({a,u} : Finset V) (M.erase {a,b})
  have hN : EdgeMatching G N := by
    constructor
    · intro e heN
      rcases mem_insert.mp heN with rfl|heN
      · exact hnewEdge
      · exact hM.1.1 e (mem_erase.mp heN).2
    · intro e heN f hfN hef
      rcases mem_insert.mp heN with rfl|heN <;> rcases mem_insert.mp hfN with rfl|hfN
      · exact (hef rfl).elim
      · exact hdisj f hfN
      · exact (hdisj e heN).symm
      · exact hM.1.2 e (mem_erase.mp heN).2 f (mem_erase.mp hfN).2 hef
  have hc : N.card = M.card := by
    change (insert ({a,u} : Finset V) (M.erase {a,b})).card = M.card
    rw [card_insert_of_notMem hnewErase]
    exact card_erase_add_one he
  refine ⟨N,⟨hN,?_⟩,mem_insert_self _ _,?_⟩
  · intro P hP
    rw [hc]
    exact hM.2 P hP
  · intro hbN
    obtain ⟨e,heN,hbe⟩ := mem_biUnion.mp hbN
    rcases mem_insert.mp heN with rfl|heN
    · rcases mem_insert.mp hbe with hba|hbu'
      · exact hab hba.symm
      · exact hbu (mem_singleton.mp hbu')
    · exact disjoint_left.mp (hM.1.2 {a,b} he e (mem_erase.mp heN).2
        (mem_erase.mp heN).1.symm) (by simp) hbe

/-- Every forest edge incident with an exposable vertex belongs to some maximum
matching. This is the needed A-D allowed-edge fact. -/
theorem exposable_incident_edge_allowed {G : SimpleGraph V} (hG : G.IsAcyclic)
    {a d : V} (hd : Exposable G d) (had : G.Adj a d) :
    ∃ M, MaximumMatching G M ∧ ({a,d} : Finset V) ∈ M := by
  classical
  obtain ⟨N,hN,hdN⟩ := hd
  have haA : a ∈ exposureNeighbors G := mem_exposureNeighbors.mpr ⟨d,⟨N,hN,hdN⟩,had.symm⟩
  obtain ⟨b,hb,hab,he⟩ := exposureNeighbors_partner hG hN haA
  obtain ⟨P,hP,heP,hbP⟩ := maximum_matching_swap_exposed hN he hdN had
  exact ⟨P,hP,heP⟩

/-- Every A vertex has two distinct neighbors in D. Choosing a maximum matching
that misses one D neighbor supplies the other. -/
theorem exposureNeighbors_two_exposable_neighbors {G : SimpleGraph V}
    (hG : G.IsAcyclic) {a : V} (ha : a ∈ exposureNeighbors G) :
    ∃ d₁ d₂, d₁ ≠ d₂ ∧ Exposable G d₁ ∧ Exposable G d₂ ∧
      G.Adj a d₁ ∧ G.Adj a d₂ := by
  classical
  obtain ⟨d₁,hd₁,hd₁a⟩ := mem_exposureNeighbors.mp ha
  obtain ⟨M,hM,hd₁M⟩ := hd₁
  obtain ⟨d₂,hd₂,had₂,he⟩ := exposureNeighbors_partner hG hM ha
  refine ⟨d₁,d₂,?_,⟨M,hM,hd₁M⟩,hd₂,hd₁a.symm,had₂⟩
  intro h
  exact hd₁M (mem_biUnion.mpr ⟨{a,d₂},he,by simp [h]⟩)

end Tuza24
