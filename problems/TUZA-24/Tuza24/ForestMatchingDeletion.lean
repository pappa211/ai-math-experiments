import Tuza24.ForestMatchingUnique

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Erasing a matching edge leaves a matching after its endpoints are isolated. -/
theorem matching_erase_isolate {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) {e : Finset V} (he : e ∈ M) :
    EdgeMatching (isolate G e) (M.erase e) := by
  classical
  constructor
  · intro f hf
    obtain ⟨hfe,hfM⟩ := mem_erase.mp hf
    have hd := hM.2 f hfM e he hfe
    refine ⟨?_,(hM.1 f hfM).card_eq⟩
    intro x hx y hy hxy
    exact ⟨(hM.1 f hfM).isClique hx hy hxy,
      fun hxe => disjoint_left.mp hd hx hxe,fun hye => disjoint_left.mp hd hy hye⟩
  · intro f hf g hg hfg
    exact hM.2 f (mem_erase.mp hf).2 g (mem_erase.mp hg).2 hfg

/-- An actual edge can be appended to any matching avoiding its endpoints. -/
theorem matching_insert_isolate {G : SimpleGraph V} {e : Finset V}
    (he : G.IsNClique 2 e) {N : Finset (Finset V)}
    (hN : EdgeMatching (isolate G e) N) : EdgeMatching G (insert e N) := by
  classical
  constructor
  · intro f hf
    rcases mem_insert.mp hf with rfl|hf
    · exact he
    · exact (hN.1 f hf).mono (isolate_le _ _)
  · intro f hf g hg hfg
    by_cases hfe : f=e
    · subst f
      have hgN : g∈N := (mem_insert.mp hg).resolve_left (Ne.symm hfg)
      exact (isolate_edge_avoids (hN.1 g hgN)).symm
    · have hfN : f∈N := (mem_insert.mp hf).resolve_left hfe
      by_cases hge : g=e
      · subst g
        exact isolate_edge_avoids (hN.1 f hfN)
      · exact hN.2 f hfN g ((mem_insert.mp hg).resolve_left hge) hfg

theorem isolated_edge_not_mem_matching {G : SimpleGraph V} {e : Finset V}
    (he : G.IsNClique 2 e) {N : Finset (Finset V)}
    (hN : EdgeMatching (isolate G e) N) : e ∉ N := by
  intro heN
  have hd := isolate_edge_avoids (hN.1 e heN)
  obtain ⟨x,hx⟩ := card_pos.mp (show 0<e.card by rw [he.card_eq]; decide)
  exact disjoint_left.mp hd hx hx

/-- Removing a used edge from a maximum matching gives a maximum matching in
the graph with its endpoints isolated. -/
theorem maximumMatching_erase_isolate {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : MaximumMatching G M) {e : Finset V} (he : e ∈ M) :
    MaximumMatching (isolate G e) (M.erase e) := by
  classical
  refine ⟨matching_erase_isolate hM.1 he,?_⟩
  intro N hN
  have hinsert := hM.2 (insert e N) (matching_insert_isolate (hM.1.1 e he) hN)
  rw [card_insert_of_notMem (isolated_edge_not_mem_matching (hM.1.1 e he) hN)] at hinsert
  have hcard := card_erase_add_one he
  omega

/-- Retain a prescribed allowed edge while freely changing the remaining
maximum matching on the isolated graph. -/
theorem maximumMatching_restore_edge {G : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : MaximumMatching G M) {e : Finset V} (he : e ∈ M)
    (hN : MaximumMatching (isolate G e) N) : MaximumMatching G (insert e N) := by
  classical
  have hcard := maximum_matching_card_eq (maximumMatching_erase_isolate hM he) hN
  have herase := card_erase_add_one he
  have hinsert : (insert e N).card = M.card := by
    rw [card_insert_of_notMem (isolated_edge_not_mem_matching (hM.1.1 e he) hN.1)]
    omega
  refine ⟨matching_insert_isolate (hM.1.1 e he) hN.1,?_⟩
  intro P hP
  rw [hinsert]
  exact hM.2 P hP

/-- A vertex missed before erasing an edge is still missed afterward. -/
theorem matchingVertices_erase_subset (M : Finset (Finset V)) (e : Finset V) :
    matchingVertices (M.erase e) ⊆ matchingVertices M := by
  classical
  intro x hx
  obtain ⟨f,hf,hxf⟩ := mem_biUnion.mp hx
  exact mem_biUnion.mpr ⟨f,(mem_erase.mp hf).2,hxf⟩

/-- Restoring a matching edge preserves exposure away from that edge. -/
theorem not_mem_matchingVertices_insert {M : Finset (Finset V)} {e : Finset V} {x : V}
    (hx : x ∉ matchingVertices M) (hxe : x ∉ e) : x ∉ matchingVertices (insert e M) := by
  classical
  intro h
  obtain ⟨f,hf,hxf⟩ := mem_biUnion.mp h
  rcases mem_insert.mp hf with rfl|hf
  · exact hxe hxf
  · exact hx (mem_biUnion.mpr ⟨f,hf,hxf⟩)

end Tuza24
