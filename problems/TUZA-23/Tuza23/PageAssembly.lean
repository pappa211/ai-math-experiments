import Tuza23.WholeFootprint
import Tuza23.BlockChoice

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A triangle containing a prescribed pair has exactly one other vertex. -/
theorem triple_eq_pair_insert {t : Finset V} (ht : t.card = 3) {a b : V}
    (hab : a ≠ b) (ha : a ∈ t) (hb : b ∈ t) :
    ∃ x, x ≠ a ∧ x ≠ b ∧ t = {a,b,x} := by
  have hsub : ({a,b} : Finset V) ⊆ t := by
    simpa only [insert_subset_iff,singleton_subset_iff] using And.intro ha hb
  have hc : (t \ {a,b}).card = 1 := by
    rw [card_sdiff_of_subset hsub,ht]
    simp [hab]
  obtain ⟨x,hx⟩ := card_eq_one.mp hc
  have hxt : x ∈ t \ {a,b} := by rw [hx]; simp
  refine ⟨x,?_,?_,?_⟩
  · intro h; exact (mem_sdiff.mp hxt).2 (by simp [h])
  · intro h; exact (mem_sdiff.mp hxt).2 (by simp [h])
  · calc
      t = {a,b} ∪ (t \ {a,b}) := (union_sdiff_of_subset hsub).symm
      _ = {a,b,x} := by rw [hx]; ext v; simp

/-- All other actual edges of a single-edge insertion were already present. -/
theorem old_edge_of_single_insertion {H : SimpleGraph V} {e f : Finset V}
    (hf : (addEdges H {e}).IsNClique 2 f) (hne : f ≠ e) : H.IsNClique 2 f := by
  refine ⟨?_,hf.card_eq⟩
  intro x hx y hy hxy
  rcases hf.isClique hx hy hxy with h | h
  · exact h
  · have hpair : ({x,y} : Finset V) = f := by
      apply eq_of_subset_of_card_le
      · simpa only [insert_subset_iff,singleton_subset_iff,mem_coe] using And.intro hx hy
      · rw [hf.card_eq]; simp [hxy]
    exact (hne (hpair.symm.trans (mem_singleton.mp h.2))).elim

theorem edge_of_triangle {G : SimpleGraph V} {t e : Finset V}
    (ht : t ∈ triangles G) (he : e ∈ edges t) : G.IsNClique 2 e := by
  refine ⟨?_,(mem_edges.mp he).2⟩
  intro a ha b hb hab
  exact (mem_triangles.mp ht).isClique ((mem_edges.mp he).1 ha)
    ((mem_edges.mp he).1 hb) hab

theorem single_new_triangle_is_page {H : SimpleGraph V} {a b : V}
    (hab : a ≠ b) {t : Finset V}
    (ht : t ∈ triangles (addEdges H {{a,b}})) (hold : t ∉ triangles H) :
    ∃ x, H.Adj a x ∧ H.Adj b x ∧ t = {a,b,x} := by
  obtain ⟨e,he,het⟩ := new_triangle_has_added_edge ht hold
  have heq : e = {a,b} := mem_singleton.mp he
  have habt : ({a,b} : Finset V) ⊆ t := (mem_edges.mp (heq ▸ het)).1
  obtain ⟨x,hxa,hxb,rfl⟩ := triple_eq_pair_insert (mem_triangles.mp ht).card_eq hab
    (habt (by simp)) (habt (by simp))
  have hax : H.IsNClique 2 ({a,x} : Finset V) := old_edge_of_single_insertion
    (edge_of_triangle ht (mem_edges.mpr ⟨by simp,by simp [hxa.symm]⟩)) (by
      intro h; have : x ∈ ({a,b} : Finset V) := h ▸ (by simp : x ∈ ({a,x} : Finset V))
      simp [hxa,hxb] at this)
  have hbx : H.IsNClique 2 ({b,x} : Finset V) := old_edge_of_single_insertion
    (edge_of_triangle ht (mem_edges.mpr ⟨by simp,by simp [hxb.symm]⟩)) (by
      intro h; have : x ∈ ({a,b} : Finset V) := h ▸ (by simp : x ∈ ({b,x} : Finset V))
      simp [hxa,hxb] at this)
  exact ⟨x,hax.isClique (by simp) (by simp) hxa.symm,
    hbx.isClique (by simp) (by simp) hxb.symm,rfl⟩

theorem edges_triple (a b c : V) :
    edges ({a,b,c} : Finset V) ⊆ {{a,b},{a,c},{b,c}} := by
  intro e he
  obtain ⟨x,y,hxy,rfl⟩ := card_eq_two.mp (mem_edges.mp he).2
  have hx := (mem_edges.mp he).1 (show x ∈ ({x,y} : Finset V) by simp)
  have hy := (mem_edges.mp he).1 (show y ∈ ({x,y} : Finset V) by simp)
  simp only [mem_insert,mem_singleton] at hx hy
  rcases hx with rfl|rfl|rfl <;> rcases hy with rfl|rfl|rfl <;>
    simp_all [pair_comm]

/-- One simultaneous old minimum cover meets every new page with a supported
spoke. The disjoint alternative is precisely a bare page. -/
theorem min_cover_all_nonbare_pages {H : SimpleGraph V} (hB : B H)
    {a b : V} (hab : a ≠ b) (hne : ¬ H.Adj a b) :
    ∃ C, Covers (triangles H) C ∧ C.card = tau (triangles H) ∧
      C ⊆ support (triangles H) ∧
      ∀ t ∈ triangles (addEdges H {{a,b}}),
        (∃ e ∈ C, e ∈ edges t) ∨ Disjoint (edges t) (support (triangles H)) := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hB
  obtain ⟨C,hc,hcard,hsub,hD⟩ := blocks_min_cover_footprint hK
    (fun k hk => whole_page_footprint hK hab hne hk)
  refine ⟨C,hc,hcard,hsub,?_⟩
  intro t ht
  by_cases hold : t ∈ triangles H
  · exact Or.inl (hc t hold)
  · by_cases hd : Disjoint (edges t) (support (triangles H))
    · exact Or.inr hd
    · left
      obtain ⟨e,het,hes⟩ := not_disjoint_iff.mp hd
      obtain ⟨x,hax,hbx,rfl⟩ := single_new_triangle_is_page hab ht hold
      have hecases := edges_triple a b x het
      have heD : e ∈ pageSpokes H a b := by
        apply mem_pageSpokes.mpr
        refine ⟨x,hax,hbx,?_⟩
        simp only [mem_insert,mem_singleton] at hecases
        rcases hecases with rfl | he | he
        · have hactual := supported_edge_is_graph_edge hes
          exact (hne (hactual.isClique (by simp) (by simp) hab)).elim
        · exact Or.inl he
        · exact Or.inr he
      exact ⟨e,hD (mem_inter.mpr ⟨heD,hes⟩),het⟩

end Tuza23
