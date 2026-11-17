import Tuza24.LinkAugmentation

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The two-edge full-footprint certificate for an internal rim triangle. -/
theorem internal_page_whole_footprint {G : SimpleGraph V} {v w a b z : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {Z X : Finset (Finset V)} (hZ : EdgeMatching (linkGraph G v) Z)
    (hab : a≠b) (hbase : ({a,b}:Finset V)∈X)
    (htN : ({a,b,z}:Finset V)⊆peelNeighbors G univ v)
    {k : Finset V} (hk : (remove G {v} X).IsClique (k : Set V)) (hkne : k.Nonempty) :
    (support (hubPacking v Z∪{{a,b,z}})∩edges k).card≤2 ∧
      ∃ x : V,∀ e∈support (hubPacking v Z∪{{a,b,z}})∩edges k,x∈e := by
  classical
  let A := Z∩edges k
  let B := edges ({a,b,z}:Finset V)∩edges k
  have hA : A.card≤1 := link_matching_clique_footprint (remove_le G {v} X) hF hZ hk
  have hB : B.card≤1 := deleted_base_page_footprint (H:=remove G {v} X) hab
    (fun h => h.2.2.2 hbase) hk
  have hcard : ∀ e∈A∪B,e.card=2 := by
    intro e he
    rcases mem_union.mp he with he|he
    · exact (mem_edges.mp (mem_inter.mp he).2).2
    · exact (mem_edges.mp (mem_inter.mp he).2).2
  have hcross : ∀ e∈A,∀ f∈B,¬ Disjoint e f := by
    intro e he f hf hd
    have heN := linkGraph_edge_neighbors (hZ.1 e (mem_inter.mp he).1)
    have hfN := (mem_edges.mp (mem_inter.mp hf).1).1.trans htN
    have h4 := disjoint_edges_card_four (hcard e (mem_union_left _ he))
      (hcard f (mem_union_right _ hf)) hd
      (subset_inter (mem_edges.mp (mem_inter.mp he).2).1 heN)
      (subset_inter (mem_edges.mp (mem_inter.mp hf).2).1 hfN)
    have h3 := link_clique_inter_card (remove_le G {v} X) hF hk
    omega
  have hn : Nonempty V := by obtain ⟨x,_⟩:=hkne; exact ⟨x⟩
  obtain ⟨hc,x,hx⟩ := two_singleton_edge_families_star hA hB hcard hcross hn
  have hsub := hub_page_surviving_footprint hZ (t:={a,b,z}) hk
  exact ⟨(card_le_card hsub).trans hc,x,fun e he => hx e (hsub he)⟩

/-- Internal triangle augmentation, with the complete matching-plus-page union
checked against every residual block. The new matching need not be maximum. -/
theorem minimal_internal_page_augmentation {G : SimpleGraph V} (hG : MinimalCS G)
    {v w a b z : V} (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M Z : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G v M Q)
    (hQ : Q.card≤M.card) (hbase : ({a,b}:Finset V)∈M)
    (ht : ({a,b,z}:Finset V)∈triangles G)
    (htN : ({a,b,z}:Finset V)⊆peelNeighbors G univ v)
    (hZ : EdgeMatching (linkGraph G v) Z) (hcard : M.card≤Z.card)
    (havoid : Disjoint Z (edges ({a,b,z}:Finset V))) : False := by
  classical
  have hab : a≠b := by
    have hc := (hm.edge _ hbase).card_eq
    intro heq
    simp [heq] at hc
  have hvt : v∉({a,b,z}:Finset V) := fun hv => G.irrefl (mem_filter.mp (htN hv)).2
  have hp := hub_page_packing hZ ht hvt havoid
  apply minimal_link_augmentation hG hm ⟨{a,b},hbase⟩ hQ hp.1 (by rw [hp.2]; omega)
  intro k hk hkcard
  have hkn : k.Nonempty := card_pos.mp (by rcases hkcard with h|h <;> omega)
  exact internal_page_whole_footprint hF hZ hab (mem_union_left _ hbase) htN hk hkn

end Tuza24
