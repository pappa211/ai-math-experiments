import Tuza.Basic
import Mathlib.Tactic.Push

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

theorem third_vertex {s e : Finset V} (hs : s.card = 3)
    (he : e ∈ edges s) : ∃ x, x ∉ e ∧ s = insert x e := by
  have hc : (s \ e).card = 1 := by
    rw [card_sdiff_of_subset (mem_edges.mp he).1, hs, (mem_edges.mp he).2]
  obtain ⟨x, hx⟩ := card_eq_one.mp hc
  have hxmem : x ∈ s \ e := by rw [hx]; exact mem_singleton_self _
  refine ⟨x, (mem_sdiff.mp hxmem).2, ?_⟩
  calc
    s = (s \ e) ∪ e := (sdiff_union_of_subset (mem_edges.mp he).1).symm
    _ = insert x e := by rw [hx, singleton_union]

theorem outside_common_edge {s e q : Finset V} {x : V}
    (hs : s = insert x e) (he : e.card = 2)
    (hinter : ¬ Disjoint (edges s) (edges q)) (havoid : e ∉ edges q) : x ∈ q := by
  obtain ⟨f, hfs, hfq⟩ := not_disjoint_iff.mp hinter
  by_contra hx
  have hfe : f ⊆ e := by
    intro v hv
    have hvs := (mem_edges.mp hfs).1 hv
    rw [hs] at hvs
    rcases mem_insert.mp hvs with rfl | hve
    · exact (hx ((mem_edges.mp hfq).1 hv)).elim
    · exact hve
  have hfeq : f = e := eq_of_subset_of_card_le hfe (by
    rw [(mem_edges.mp hfs).2, he])
  exact havoid (hfeq ▸ hfq)

/-- Any pairwise edge-intersecting family of vertex triples has a cover of size at most two.
The family need not contain all triangles of any ambient graph. -/
theorem intersecting_cover {F : Finset (Finset V)} (hf : Triangles F)
    (hi : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t)) : tau F ≤ 2 := by
  by_cases hn : F.Nonempty
  · obtain ⟨s, hs⟩ := hn
    by_cases hall : ∀ t ∈ F, t = s
    · obtain ⟨e, he⟩ := edges_nonempty (s := s) (by rw [hf s hs]; decide)
      have hc : Covers F {e} := by
        intro t ht
        exact ⟨e, mem_singleton_self _, (hall t ht).symm ▸ he⟩
      exact (tau_le_card hc).trans (by simp)
    · push Not at hall
      obtain ⟨t, ht, hts⟩ := hall
      obtain ⟨e, hes, het⟩ := not_disjoint_iff.mp (hi s hs t ht)
      obtain ⟨x, hxe, hsx⟩ := third_vertex (hf s hs) hes
      obtain ⟨y, hye, hty⟩ := third_vertex (hf t ht) het
      have hxy : x ≠ y := by
        intro h
        apply hts
        rw [hty, ← h, ← hsx]
      have hc : Covers F {e, {x, y}} := by
        intro q hq
        by_cases heq : e ∈ edges q
        · exact ⟨e, by simp, heq⟩
        · have hxq := outside_common_edge hsx (mem_edges.mp hes).2 (hi s hs q hq) heq
          have hyq := outside_common_edge hty (mem_edges.mp het).2 (hi t ht q hq) heq
          refine ⟨{x, y}, by simp, mem_edges.mpr ⟨?_, ?_⟩⟩
          · intro v hv
            rcases mem_insert.mp hv with rfl | hv
            · exact hxq
            · exact (mem_singleton.mp hv) ▸ hyq
          · simp [hxy]
      exact (tau_le_card hc).trans ((card_insert_le _ _).trans (by simp))
  · have he : F = ∅ := not_nonempty_iff_eq_empty.mp hn
    have hc : Covers F ∅ := by simp [he, Covers]
    exact (tau_le_card hc).trans (by simp)

theorem nu_one_intersecting {F : Finset (Finset V)} (hf : Triangles F)
    (hn : nu F = 1) : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t) := by
  intro s hs t ht hd
  have hst : s ≠ t := by
    intro heq
    subst t
    have he : edges s = ∅ := disjoint_self.mp hd
    exact (edges_nonempty (s := s) (by rw [hf s hs]; decide)).ne_empty he
  have hp : Packing F {s, t} := by
    constructor
    · simp [insert_subset_iff, hs, ht]
    · intro a ha b hb hab
      simp only [mem_insert, mem_singleton] at ha hb
      rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
      · exact (hab rfl).elim
      · exact hd
      · exact hd.symm
      · exact (hab rfl).elim
  have h := packing_card_le hp
  simp [hst, hn] at h

theorem tau_le_two_of_nu_one {F : Finset (Finset V)} (hf : Triangles F)
    (hn : nu F = 1) : tau F ≤ 2 :=
  intersecting_cover hf (nu_one_intersecting hf hn)

end Tuza
