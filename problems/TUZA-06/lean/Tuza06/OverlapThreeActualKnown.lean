import Tuza06.OverlapThreeActualFiniteBasic
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 8000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- NearClique supplies every other link edge once an actual missing pair is known. -/
theorem near_link_other_edges {G : SimpleGraph V} (i : Fin 9 ↪ V) (N m : Finset (Fin 9))
    (hNear : NearClique G (N.map i)) (hm : m ∈ edges N)
    (hMissing : ¬ G.IsNClique 2 (m.map i)) :
    ∀ e ∈ edges N, e ≠ m → G.IsNClique 2 (e.map i) := by
  classical
  obtain ⟨a,b,hab,hmEq⟩ := card_eq_two.mp (mem_edges.mp hm).2
  have ha : a ∈ N := (mem_edges.mp hm).1 (by rw [hmEq];simp)
  have hb : b ∈ N := (mem_edges.mp hm).1 (by rw [hmEq];simp)
  have hnab : ¬ G.Adj (i a) (i b) := by
    intro h
    apply hMissing
    rw [hmEq,map_insert,map_singleton]
    exact sparse_pair_edge h
  intro e he hem
  obtain ⟨c,d,hcd,heEq⟩ := card_eq_two.mp (mem_edges.mp he).2
  have hc : c ∈ N := (mem_edges.mp he).1 (by rw [heEq];simp)
  have hd : d ∈ N := (mem_edges.mp he).1 (by rw [heEq];simp)
  have hpne : ({i c,i d} : Finset V) ≠ {i a,i b} := by
    intro h
    apply hem
    rw [heEq,hmEq]
    exact map_inj.mp (by simpa only [map_insert,map_singleton] using h : ({c,d} : Finset (Fin 9)).map i = ({a,b} : Finset (Fin 9)).map i)
  have hAdj := nearClique_adj_of_missing hNear
    (mem_map.mpr ⟨a,ha,rfl⟩) (mem_map.mpr ⟨b,hb,rfl⟩)
    (fun h => hab (i.injective h)) hnab
    (mem_map.mpr ⟨c,hc,rfl⟩) (mem_map.mpr ⟨d,hd,rfl⟩)
    (fun h => hcd (i.injective h)) hpne
  rw [heEq,map_insert,map_singleton]
  exact sparse_pair_edge hAdj

theorem link_edges_of_clique {G : SimpleGraph V} (i : Fin 9 ↪ V) (N : Finset (Fin 9))
    (hClique : G.IsClique (N.map i : Set V)) :
    ∀ e ∈ edges N, G.IsNClique 2 (e.map i) := by
  intro e he
  refine ⟨?_,by rw [card_map]; exact (mem_edges.mp he).2⟩
  intro a ha b hb hab
  exact hClique (map_subset_map.mpr (mem_edges.mp he).1 ha)
    (map_subset_map.mpr (mem_edges.mp he).1 hb) hab

theorem exists_missing_labeled_edge {G : SimpleGraph V} (i : Fin 9 ↪ V) (N : Finset (Fin 9))
    (hNon : ¬ G.IsClique (N.map i : Set V)) :
    ∃ m ∈ edges N, ¬ G.IsNClique 2 (m.map i) := by
  classical
  have hmissing : ∃ a ∈ N.map i, ∃ b ∈ N.map i, a ≠ b ∧ ¬ G.Adj a b := by
    by_contra hn
    apply hNon
    intro a ha b hb hab
    by_contra hnab
    exact hn ⟨a,ha,b,hb,hab,hnab⟩
  obtain ⟨a,ha,b,hb,hab,hnab⟩ := hmissing
  obtain ⟨c,hc,rfl⟩ := mem_map.mp ha
  obtain ⟨d,hd,rfl⟩ := mem_map.mp hb
  have hcd : c ≠ d := fun h => hab (congrArg i h)
  refine ⟨{c,d},mem_edges.mpr ⟨by simp [insert_subset_iff,hc,hd],by simp [hcd]⟩,?_⟩
  intro he
  apply hnab
  exact he.isClique (by simp) (by simp) hab

namespace OverlapThreeOrientation
theorem xEdges_eq : xEdges = edges threeNx := by decide
theorem yEdges_eq : yEdges = edges threeNy := by decide
private theorem xMissing_repr : ∀ e : ↥xEdges, ∃ g : Fin 11, xMissing g = e.val := by decide
private theorem yMissing_repr : ∀ e : ↥yEdges, ∃ f : Fin 10, yMissing f = e.val := by decide
private theorem stars_repr : ∀ e : ↥stars,
    (∃ a : ↥threeNx, e.val = {0,a.val}) ∨ (∃ a : ↥threeNy, e.val = {1,a.val}) := by decide

theorem actual_known_certificate {G : SimpleGraph V} (i : Fin 9 ↪ V)
    (hNx : peelNeighbors G univ (i 0) = threeNx.map i)
    (hNy : peelNeighbors G univ (i 1) = threeNy.map i)
    (hNearX : NearClique G (threeNx.map i)) (hNearY : NearClique G (threeNy.map i))
    (hNonY : ¬ G.IsClique (threeNy.map i : Set V)) :
    ∃ g : Fin 11, ∃ f : Fin 10, admissible g f ∧
      (¬ G.IsNClique 2 ((yMissing f).map i)) ∧ (∀ e ∈ known g f, G.IsNClique 2 (e.map i)) := by
  classical
  obtain ⟨ym,hym,hymiss⟩ := exists_missing_labeled_edge i threeNy hNonY
  obtain ⟨f,hfEq⟩ := yMissing_repr ⟨ym,by rw [yEdges_eq];exact hym⟩
  have hfmiss : ¬ G.IsNClique 2 ((yMissing f).map i) := hfEq.symm ▸ hymiss
  have hyLower : ∀ e ∈ yEdges.erase (yMissing f), G.IsNClique 2 (e.map i) := by
    intro e he
    exact near_link_other_edges i threeNy ym hNearY hym hymiss e
      (by rw [←yEdges_eq];exact (mem_erase.mp he).2)
      (by simpa only [hfEq] using (mem_erase.mp he).1)
  have hxChoice : ∃ g : Fin 11,
      (¬ G.IsNClique 2 ((xMissing g).map i)) ∧
      (∀ e ∈ xEdges.erase (xMissing g), G.IsNClique 2 (e.map i)) := by
    by_cases hClq : G.IsClique (threeNx.map i : Set V)
    · refine ⟨10,?_,?_⟩
      · intro h
        have hc := h.card_eq
        change (∅ : Finset V).card = 2 at hc
        simp at hc
      · intro e he
        exact link_edges_of_clique i threeNx hClq e (by rw [←xEdges_eq];exact mem_of_mem_erase he)
    · obtain ⟨xm,hxm,hxmiss⟩ := exists_missing_labeled_edge i threeNx hClq
      obtain ⟨g,hgEq⟩ := xMissing_repr ⟨xm,by rw [xEdges_eq];exact hxm⟩
      refine ⟨g,hgEq.symm ▸ hxmiss,?_⟩
      intro e he
      exact near_link_other_edges i threeNx xm hNearX hxm hxmiss e
        (by rw [←xEdges_eq];exact (mem_erase.mp he).2)
        (by simpa only [hgEq] using (mem_erase.mp he).1)
  obtain ⟨g,hgmiss,hxLower⟩ := hxChoice
  have hKnown : ∀ e ∈ known g f, G.IsNClique 2 (e.map i) := by
    intro e he
    rcases mem_union.mp he with he|heY
    · rcases mem_union.mp he with heStar|heX
      · rcases stars_repr ⟨e,heStar⟩ with ⟨a,haEq⟩|⟨a,haEq⟩
        · change e = {0,a.val} at haEq
          rw [haEq,map_insert,map_singleton]
          have haN : i a.val ∈ peelNeighbors G univ (i 0) := by rw [hNx]; exact mem_map.mpr ⟨a.val,a.property,rfl⟩
          exact sparse_pair_edge (mem_filter.mp haN).2
        · change e = {1,a.val} at haEq
          rw [haEq,map_insert,map_singleton]
          have haN : i a.val ∈ peelNeighbors G univ (i 1) := by rw [hNy]; exact mem_map.mpr ⟨a.val,a.property,rfl⟩
          exact sparse_pair_edge (mem_filter.mp haN).2
      · exact hxLower e heX
    · exact hyLower e heY
  refine ⟨g,f,⟨?_,?_⟩,hfmiss,hKnown⟩
  · exact fun h => hgmiss (hKnown _ h)
  · exact fun h => hfmiss (hKnown _ h)
end OverlapThreeOrientation
end Tuza06
