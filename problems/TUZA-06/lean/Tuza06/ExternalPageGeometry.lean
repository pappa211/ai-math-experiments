import Tuza.Intersecting

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

/-- Triangles on disjoint bases and the same apex share no graph edge. -/
theorem common_apex_disjoint_bases (x : V) {f g : Finset V} (hd : Disjoint f g) :
    Disjoint (edges (insert x f)) (edges (insert x g)) := by
  apply disjoint_left.mpr
  intro e hef heg
  have hsub : e ⊆ ({x} : Finset V) := by
    intro a ha
    by_cases hax : a = x
    · exact mem_singleton.mpr hax
    · have haf := (mem_insert.mp ((mem_edges.mp hef).1 ha)).resolve_left hax
      have hag := (mem_insert.mp ((mem_edges.mp heg).1 ha)).resolve_left hax
      exact (disjoint_left.mp hd haf hag).elim
  have hc := card_le_card hsub
  rw [(mem_edges.mp hef).2, card_singleton] at hc
  omega

/-- Exact shared-edge geometry for arbitrary outside pages. Distinct bases can
intersect only at a common external apex and a shared base vertex. -/
theorem external_pages_intersect_iff {W f g : Finset V} {x y : V}
    (hf : f.card = 2) (hg : g.card = 2) (hfW : f ⊆ W) (hgW : g ⊆ W)
    (hx : x ∉ W) (hy : y ∉ W) :
    (¬ Disjoint (edges (insert x f)) (edges (insert y g))) ↔
      f = g ∨ (x = y ∧ ¬ Disjoint f g) := by
  constructor
  · intro hi
    by_cases hfg : f = g
    · exact Or.inl hfg
    · have havoid : f ∉ edges (insert y g) := by
        intro he
        have hsub : f ⊆ g := by
          intro a ha
          rcases mem_insert.mp ((mem_edges.mp he).1 ha) with rfl | hag
          · exact (hy (hfW ha)).elim
          · exact hag
        exact hfg (eq_of_subset_of_card_le hsub (by rw [hf,hg]))
      have hxyMem := outside_common_edge (s := insert x f) rfl hf hi havoid
      have hxy : x = y := by
        rcases mem_insert.mp hxyMem with h | h
        · exact h
        · exact (hx (hgW h)).elim
      refine Or.inr ⟨hxy,?_⟩
      intro hdisj
      subst y
      exact hi (common_apex_disjoint_bases x hdisj)
  · rintro (hfg | ⟨hxy,hfg⟩)
    · subst g
      intro hd
      have h1 : f ∈ edges (insert x f) := mem_edges.mpr ⟨subset_insert _ _,hf⟩
      have h2 : f ∈ edges (insert y f) := mem_edges.mpr ⟨subset_insert _ _,hf⟩
      exact disjoint_left.mp hd h1 h2
    · subst y
      obtain ⟨a,haf,hag⟩ := not_disjoint_iff.mp hfg
      have hxa : x ≠ a := by intro h; exact hx (h ▸ hfW haf)
      have h1 : ({x,a} : Finset V) ∈ edges (insert x f) := mem_edges.mpr
        ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨mem_insert_self _ _,mem_insert_of_mem haf⟩,
          by simp [hxa]⟩
      have h2 : ({x,a} : Finset V) ∈ edges (insert x g) := mem_edges.mpr
        ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨mem_insert_self _ _,mem_insert_of_mem hag⟩,
          by simp [hxa]⟩
      exact fun hd => disjoint_left.mp hd h1 h2

end Tuza06
