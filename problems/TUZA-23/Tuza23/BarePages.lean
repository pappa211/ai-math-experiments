import Tuza23.InsertionAccounting

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem triangle_pair_insertion_cases {H : SimpleGraph V} {e f t : Finset V}
    (ht : t ∈ triangles (addEdges H {e,f})) :
    t ∈ triangles (addEdges H {e}) ∨ f ∈ edges t := by
  by_cases hf : f ∈ edges t
  · exact Or.inr hf
  · left
    refine mem_triangles.mpr ⟨?_,(mem_triangles.mp ht).card_eq⟩
    intro a ha b hb hab
    rcases (mem_triangles.mp ht).isClique ha hb hab with hold | ⟨hne,hnew⟩
    · exact Or.inl hold
    · simp only [mem_insert,mem_singleton] at hnew
      rcases hnew with he | he
      · exact Or.inr ⟨hne,by simp [he]⟩
      · apply False.elim
        apply hf
        rw [← he]
        exact mem_edges.mpr ⟨by simpa only [insert_subset_iff,singleton_subset_iff,mem_coe] using And.intro ha hb,by simp [hab]⟩

theorem triangle_not_bare {H : SimpleGraph V} {t : Finset V}
    (ht : t ∈ triangles H) : ¬ Disjoint (edges t) (support (triangles H)) := by
  intro hd
  obtain ⟨e,he⟩ := edges_nonempty (s := t) (by rw [(mem_triangles.mp ht).card_eq]; decide)
  exact disjoint_left.mp hd he (mem_biUnion.mpr ⟨t,ht,he⟩)

/-- Under the exact tight increment, each inserted edge has a bare ordinary
page. This does not restrict the number of supported or bare pages. -/
theorem tight_pair_bare_page {H : SimpleGraph V} (hB : B H)
    {a b : V} (hab : a ≠ b) (hne : ¬ H.Adj a b) {f : Finset V}
    (htau : tau (triangles (addEdges H {{a,b},f})) = 2 * nu (triangles H) + 2) :
    ∃ x, H.Adj a x ∧ H.Adj b x ∧
      Disjoint (edges ({a,b,x} : Finset V)) (support (triangles H)) := by
  classical
  obtain ⟨C,hc,hcard,hsub,hpages⟩ := min_cover_all_nonbare_pages hB hab hne
  by_contra hn
  have hcover : Covers (triangles (addEdges H {{a,b},f})) (insert f C) := by
    intro t ht
    rcases triangle_pair_insertion_cases ht with hone | hf
    · rcases hpages t hone with ⟨e,he,het⟩ | hbare
      · exact ⟨e,mem_insert_of_mem he,het⟩
      · have hold : t ∉ triangles H := fun h => triangle_not_bare h hbare
        obtain ⟨x,hax,hbx,htx⟩ := single_new_triangle_is_page hab hone hold
        exact (hn ⟨x,hax,hbx,htx ▸ hbare⟩).elim
    · exact ⟨f,mem_insert_self _ _,hf⟩
  have hup := tau_le_card hcover
  have hsize := card_insert_le f C
  have hbase := componentCliques_equality hB
  omega

/-- A maximum old packing avoiding the entire edges of one new page. -/
theorem max_packing_avoids_single_page {H : SimpleGraph V} (hB : B H)
    {e t : Finset V} (he : e.card = 2) (hne : ¬ H.IsNClique 2 e)
    (ht : t.card = 3) (het : e ∈ edges t) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧
      Disjoint (support P) (edges t) := by
  obtain ⟨K,hK⟩ := componentCliques_decomposition hB
  obtain ⟨P,hp,hcard,hd⟩ := blocks_avoid_two_pages hK (independent_nonedge he hne)
    ht ht ⟨e,by rw [two_vertex_edges he]; simp,het⟩
    ⟨e,by rw [two_vertex_edges he]; simp,het⟩
  exact ⟨P,hp,hcard,by simpa only [union_self] using hd⟩

/-- Any ordinary page for one new edge must share an edge with every bare
page of the other; otherwise both extend a suitable old maximum packing. -/
theorem page_intersects_bare {H G : SimpleGraph V} (hHG : H ≤ G) (hB : B H)
    (hnu : nu (triangles G) = nu (triangles H) + 1)
    {e s t : Finset V} (he : e.card = 2) (hne : ¬ H.IsNClique 2 e)
    (hs : s ∈ triangles G) (hes : e ∈ edges s) (ht : t ∈ triangles G)
    (hbare : Disjoint (edges t) (support (triangles H))) :
    ¬ Disjoint (edges s) (edges t) := by
  intro hst
  obtain ⟨P,hp,hcard,hd⟩ := max_packing_avoids_single_page hB he hne
    (mem_triangles.mp hs).card_eq hes
  have hps : ∀ p ∈ P, ∀ q ∈ ({s} : Finset (Finset V)), Disjoint (edges p) (edges q) := by
    intro p hpp q hq
    have hqs := mem_singleton.mp hq
    subst q
    exact hd.mono_left (fun e hep => mem_biUnion.mpr ⟨p,hpp,hep⟩)
  have hpt : ∀ p ∈ P, Disjoint (edges p) (edges t) := by
    intro p hpp
    exact hbare.symm.mono_left (fun e hep => mem_biUnion.mpr ⟨p,hp.1 hpp,hep⟩)
  have hpG := packing_mono (triangles_mono_graph hHG) hp
  have hpS : Packing (triangles G) (P ∪ {s}) :=
    packing_mono (by simp) (packing_union hpG (packing_singleton hs) hps)
  have hcross : ∀ p ∈ P ∪ {s}, ∀ q ∈ ({t} : Finset (Finset V)),
      Disjoint (edges p) (edges q) := by
    intro p hpp q hq
    have hqt := mem_singleton.mp hq
    subst q
    rcases mem_union.mp hpp with hpp | hpp
    · exact hpt p hpp
    · exact (mem_singleton.mp hpp) ▸ hst
  have hpST : Packing (triangles G) ((P ∪ {s}) ∪ {t}) :=
    packing_mono (by simp) (packing_union hpS (packing_singleton ht) hcross)
  have hdisS := cross_disjoint (triangles_mono hpG.1 (triangles_valid G)) hps
  have hdisT := cross_disjoint (triangles_mono hpS.1 (triangles_valid G)) hcross
  have hl := packing_card_le hpST
  simp only [card_union_of_disjoint hdisT,card_union_of_disjoint hdisS,hcard,card_singleton] at hl
  omega

end Tuza23
