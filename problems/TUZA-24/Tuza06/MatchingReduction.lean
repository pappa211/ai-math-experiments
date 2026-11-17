import Tuza06.Reducible
import Tuza06.GraphPeeling

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def spokes (u : V) (Q : Finset V) : Finset (Finset V) := by
  classical
  exact Q.image (fun q => {u,q})

/-- The singleton matching reduction, with actual link edges and no hidden
assumption that Q and the matching are disjoint. -/
structure LinkMatching (G : SimpleGraph V) (u : V) (M : Finset (Finset V)) (Q : Finset V) : Prop where
  edge : ∀ e ∈ M, G.IsNClique 2 e
  neighbors : ∀ e ∈ M, e ⊆ peelNeighbors G univ u
  matching : ∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f
  cover : ∀ e ∈ edges (peelNeighbors G univ u), G.IsNClique 2 e → e ∈ M ∨ ¬ Disjoint e Q

noncomputable def hubPacking (u : V) (M : Finset (Finset V)) : Finset (Finset V) := by
  classical
  exact M.image (insert u)

theorem hub_matching_packing {G : SimpleGraph V} {u : V}
    {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G u M Q) :
    Packing (triangles G) (hubPacking u M) ∧ (hubPacking u M).card = M.card := by
  classical
  have huNot : ∀ e ∈ M, u ∉ e := by
    intro e he hu
    exact G.irrefl (mem_filter.mp (hm.neighbors e he hu)).2
  have hinj : Set.InjOn (insert u) (M : Set (Finset V)) := by
    intro e he f hf hef
    have h := congrArg (fun s : Finset V => s.erase u) hef
    simpa only [erase_insert (huNot e he), erase_insert (huNot f hf)] using h
  constructor
  · constructor
    · intro t ht
      obtain ⟨e, he, rfl⟩ := mem_image.mp ht
      refine mem_triangles.mpr ⟨?_, ?_⟩
      · intro a ha b hb hab
        simp only [Finset.mem_coe, mem_insert] at ha hb
        rcases ha with rfl | ha <;> rcases hb with rfl | hb
        · exact (hab rfl).elim
        · exact (mem_filter.mp (hm.neighbors e he hb)).2
        · exact ((mem_filter.mp (hm.neighbors e he ha)).2).symm
        · exact (hm.edge e he).isClique ha hb hab
      · rw [card_insert_of_notMem (huNot e he), (hm.edge e he).card_eq]
    · intro s hs t ht hst
      obtain ⟨e, he, rfl⟩ := mem_image.mp hs
      obtain ⟨f, hf, rfl⟩ := mem_image.mp ht
      have hef : e ≠ f := fun h => hst (congrArg (insert u) h)
      have hd := hm.matching e he f hf hef
      apply disjoint_left.mpr
      intro g hge hgf
      have hgsub : g ⊆ ({u} : Finset V) := by
        intro x hx
        by_cases hxu : x = u
        · exact mem_singleton.mpr hxu
        · have hxe : x ∈ e := (mem_insert.mp ((mem_edges.mp hge).1 hx)).resolve_left hxu
          have hxf : x ∈ f := (mem_insert.mp ((mem_edges.mp hgf).1 hx)).resolve_left hxu
          exact (disjoint_left.mp hd hxe hxf).elim
      have hle := card_le_card hgsub
      rw [(mem_edges.mp hge).2, card_singleton] at hle
      omega
  · exact card_image_iff.mpr hinj

theorem matching_reduction_witness {G : SimpleGraph V} {u : V}
    {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G u M Q) :
    ReductionWitness G {u} (M ∪ spokes u Q) (hubPacking u M) := by
  classical
  constructor
  · exact (hub_matching_packing hm).1
  · intro t ht hU
    obtain ⟨v, hv, hvt⟩ := hU
    have hvu : v = u := mem_singleton.mp hv
    subst v
    let e := t.erase u
    have hecard : e.card = 2 := by dsimp [e]; rw [card_erase_of_mem hvt, (mem_triangles.mp ht).card_eq]
    have heN : e ⊆ peelNeighbors G univ u := by
      intro a ha
      exact mem_filter.mpr ⟨mem_univ _, (mem_triangles.mp ht).isClique hvt
        (mem_of_mem_erase ha) (mem_erase.mp ha).1.symm⟩
    have heG : G.IsNClique 2 e := ⟨fun _ ha _ hb hab =>
      (mem_triangles.mp ht).isClique (mem_of_mem_erase ha) (mem_of_mem_erase hb) hab, hecard⟩
    rcases hm.cover e (mem_edges.mpr ⟨heN, hecard⟩) heG with heM | heQ
    · exact ⟨e, mem_union_left _ heM, mem_edges.mpr ⟨erase_subset _ _, hecard⟩⟩
    · obtain ⟨a, hae, haQ⟩ := not_disjoint_iff.mp heQ
      have hau : a ≠ u := (mem_erase.mp hae).1
      refine ⟨{u,a}, mem_union_right _ (mem_image.mpr ⟨a, haQ, rfl⟩), mem_edges.mpr ⟨?_, ?_⟩⟩
      · simpa only [insert_subset_iff, singleton_subset_iff] using And.intro hvt (mem_of_mem_erase hae)
      · simp [hau.symm]
  · intro p hp f hfp hfU
    obtain ⟨e, he, rfl⟩ := mem_image.mp hp
    have hfu : u ∉ f := fun hu => disjoint_left.mp hfU hu (mem_singleton_self _)
    have hfe : f ⊆ e := by
      intro a ha
      exact (mem_insert.mp ((mem_edges.mp hfp).1 ha)).resolve_left (fun h => hfu (h ▸ ha))
    have hfeq : f = e := eq_of_subset_of_card_le hfe (by rw [(hm.edge e he).card_eq, (mem_edges.mp hfp).2])
    exact mem_union_left _ (hfeq.symm ▸ he)

theorem matching_cover_card (u : V) (M : Finset (Finset V)) (Q : Finset V) :
    (M ∪ spokes u Q).card ≤ M.card + Q.card := by
  classical
  exact (card_union_le _ _).trans (Nat.add_le_add_left (card_image_le) _)

/-- Balanced singleton reduction from actual minimality; Q may overlap matching endpoints. -/
theorem minimal_link_matching {G : SimpleGraph V} (hG : MinimalObstruction G) {u : V}
    {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G u M Q)
    (hM : M.Nonempty) (hQ : Q.card ≤ M.card) :
    nu (triangles G) = nu (triangles (remove G {u} (M ∪ spokes u Q))) + M.card ∧
    tau (triangles (remove G {u} (M ∪ spokes u Q))) =
      2 * nu (triangles (remove G {u} (M ∪ spokes u Q))) ∧
    ComponentCliques (remove G {u} (M ∪ spokes u Q)) := by
  have hw := matching_reduction_witness hm
  have hc := (hub_matching_packing hm).2
  have hp : (hubPacking u M).Nonempty := by
    apply card_pos.mp
    rw [hc]
    exact card_pos.mpr hM
  have hGood := hG.2 _ (remove_le _ _ _) (reduction_witness_proper hw hp)
  have hx := matching_cover_card u M Q
  have hpack := reduction_witness_packing hw
  rw [hc] at hpack
  have hcover := reduction_witness_cover hw
  have ha := balanced_accounting (failure_lower_bound hG.1) hGood.1 hpack
    (show tau (triangles G) ≤ tau (triangles (remove G {u} (M ∪ spokes u Q))) + 2 * M.card by omega)
  exact ⟨ha.2.1, ha.2.2, hGood.2 ha.2.2⟩

end Tuza06
