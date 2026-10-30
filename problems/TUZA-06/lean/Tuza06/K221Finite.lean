import Tuza06.FiniteCliques
namespace Tuza06.K221Finite
open Finset Tuza
set_option linter.unusedSectionVars false
set_option linter.unnecessarySeqFocus false
set_option maxRecDepth 10000
set_option maxHeartbeats 2000000
-- Labels0 hub; missing rim edges12 and34.
def R : Finset (Finset (Fin 6)) := {{1,3},{1,4},{1,5},{2,3},{2,4},{2,5},{3,5},{4,5}}
def BEdges : Finset (Finset (Fin 6)) := {{0,1},{0,2},{0,3},{0,4},{0,5},{1,3},{1,4},{1,5},{2,3},{2,4},{2,5},{3,5},{4,5}}
def badPairs : Finset (Finset (Finset (Fin 6))) := {{{1,3},{2,4}},{{1,4},{2,3}},{{1,5},{2,5}},{{3,5},{4,5}}}
def Bad (f g : Finset (Fin 6)) : Prop := {f,g} ∈ badPairs
def family : Finset (Finset (Fin 6)) := univ.powersetCard 3 |>.filter (fun t => edges t ⊆ BEdges)
def P4 : Finset (Finset (Fin 6)) := {{0,1,3},{0,2,4},{1,4,5},{2,3,5}}
def C4 : Finset (Finset (Fin 6)) := {{0,1},{0,2},{3,5},{4,5}}

theorem family_valid : Triangles family := fun _ ht => (mem_powersetCard.mp (mem_filter.mp ht).1).2
theorem R_card : R.card = 8 := by decide
theorem rim_edge_size : ∀ f ∈ R, f.card = 2 := by decide
private theorem packing_of_subtype {P : Finset (Finset (Fin 6))}
    (hsub : ∀ t : ↥P, t.val.card = 3 ∧ edges t.val ⊆ BEdges)
    (hi : ∀ s t : ↥P, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) : Packing family P := by
  constructor
  · intro t ht
    obtain ⟨hc,he⟩ := hsub ⟨t,ht⟩
    exact mem_filter.mpr ⟨mem_powersetCard.mpr ⟨subset_univ _,hc⟩,he⟩
  · intro s hs t ht hst
    exact hi ⟨s,hs⟩ ⟨t,ht⟩ hst
theorem packing_four : Packing family P4 ∧ P4.card = 4 := by
  exact ⟨packing_of_subtype (by decide) (by decide),by decide⟩
private theorem cover_of_subtype {C : Finset (Finset (Fin 6))}
    (h : ∀ t : ↥((univ : Finset (Fin 6)).powersetCard 3), edges t.val ⊆ BEdges → ∃ e : ↥C, e.val ∈ edges t.val) : Covers family C := by
  intro t ht
  obtain ⟨e,he⟩ := h ⟨t,(mem_filter.mp ht).1⟩ (mem_filter.mp ht).2
  exact ⟨e.val,e.property,he⟩
theorem rim_cover : Covers family R := cover_of_subtype (by decide)
theorem core_cover_four : Covers family C4 ∧ C4.card = 4 := ⟨cover_of_subtype (by decide),by decide⟩

private theorem partner_check : ∀ f g h : ↥R, Bad f.val g.val → Bad f.val h.val → g.val = h.val := by
  unfold Bad
  decide
theorem bad_partner_unique : ∀ f ∈ R, ∀ g ∈ R, ∀ h ∈ R, Bad f g → Bad f h → g = h :=
  fun f hf g hg h hh => partner_check ⟨f,hf⟩ ⟨g,hg⟩ ⟨h,hh⟩
theorem bad_symm {f g : Finset (Fin 6)} : Bad f g ↔ Bad g f := by
  simp only [Bad,pair_comm]
theorem bad_irrefl : ∀ f ∈ R, ¬ Bad f f := by
  intro f hf
  exact (by unfold Bad; decide : ∀ f : ↥R, ¬ Bad f.val f.val) ⟨f,hf⟩
private theorem terminal_check : ∀ f g k : ↥R, Bad f.val g.val → Disjoint f.val g.val →
    (k.val = f.val ∨ k.val = g.val ∨ (¬ Disjoint k.val f.val ∧ ¬ Disjoint k.val g.val)) →
    ¬ Disjoint k.val ({1,2} : Finset (Fin 6)) := by
  unfold Bad
  decide
theorem terminal_hit : ∀ f ∈ R, ∀ g ∈ R, ∀ k ∈ R, Bad f g → Disjoint f g →
    (k = f ∨ k = g ∨ (¬ Disjoint k f ∧ ¬ Disjoint k g)) → ¬ Disjoint k ({1,2} : Finset (Fin 6)) :=
  fun f hf g hg k hk => terminal_check ⟨f,hf⟩ ⟨g,hg⟩ ⟨k,hk⟩

private theorem avoid_case_0 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{1,4}} := by
  refine ⟨{{0,1,5},{0,2,3},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_1 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{1,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_2 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{2,3}} := by
  refine ⟨{{0,1,4},{0,3,5},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_4 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{2,5}} := by
  refine ⟨{{0,2,4},{0,3,5},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_5 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{3,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_6 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,3},{4,5}} := by
  refine ⟨{{0,1,5},{0,2,4},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_7 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,4},{1,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_9 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,4},{2,4}} := by
  refine ⟨{{0,1,3},{0,4,5},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_10 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,4},{2,5}} := by
  refine ⟨{{0,2,3},{0,4,5},{1,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_11 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,4},{3,5}} := by
  refine ⟨{{0,1,5},{0,2,3},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_12 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,4},{4,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_13 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,5},{2,3}} := by
  refine ⟨{{0,1,4},{0,3,5},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_14 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,5},{2,4}} := by
  refine ⟨{{0,1,3},{0,4,5},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_16 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,5},{3,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{2,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_17 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{1,5},{4,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{2,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_18 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,3},{2,4}} := by
  refine ⟨{{0,1,3},{0,2,5},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_19 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,3},{2,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_20 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,3},{3,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_21 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,3},{4,5}} := by
  refine ⟨{{0,1,4},{0,2,5},{1,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_22 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,4},{2,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{1,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_23 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,4},{3,5}} := by
  refine ⟨{{0,1,3},{0,2,5},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_24 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,4},{4,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{1,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_25 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,5},{3,5}} := by
  refine ⟨{{0,1,3},{0,2,4},{1,4,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem avoid_case_26 : ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {{2,5},{4,5}} := by
  refine ⟨{{0,1,4},{0,2,3},{1,3,5}},packing_of_subtype (by decide) (by decide),by decide,?_⟩
  unfold support
  decide

private theorem good_set : ∀ D : ↥(R.powersetCard 2), D.val ∉ badPairs →
    ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) D.val := by
  intro D
  fin_cases D
  · intro hn
    exact (hn (by decide)).elim
  · intro _
    convert avoid_case_26 using 5 <;> decide
  · intro _
    convert avoid_case_25 using 5 <;> decide
  · intro _
    convert avoid_case_24 using 5 <;> decide
  · intro _
    convert avoid_case_23 using 5 <;> decide
  · intro _
    convert avoid_case_22 using 5 <;> decide
  · intro _
    convert avoid_case_21 using 5 <;> decide
  · intro _
    convert avoid_case_20 using 5 <;> decide
  · intro _
    convert avoid_case_19 using 5 <;> decide
  · intro _
    convert avoid_case_18 using 5 <;> decide
  · intro _
    convert avoid_case_17 using 5 <;> decide
  · intro _
    convert avoid_case_16 using 5 <;> decide
  · intro hn
    exact (hn (by decide)).elim
  · intro _
    convert avoid_case_14 using 5 <;> decide
  · intro _
    convert avoid_case_13 using 5 <;> decide
  · intro _
    convert avoid_case_12 using 5 <;> decide
  · intro _
    convert avoid_case_11 using 5 <;> decide
  · intro _
    convert avoid_case_10 using 5 <;> decide
  · intro _
    convert avoid_case_9 using 5 <;> decide
  · intro hn
    exact (hn (by decide)).elim
  · intro _
    convert avoid_case_7 using 5 <;> decide
  · intro _
    convert avoid_case_6 using 5 <;> decide
  · intro _
    convert avoid_case_5 using 5 <;> decide
  · intro _
    convert avoid_case_4 using 5 <;> decide
  · intro hn
    exact (hn (by decide)).elim
  · intro _
    convert avoid_case_2 using 5 <;> decide
  · intro _
    convert avoid_case_1 using 5 <;> decide
  · intro _
    convert avoid_case_0 using 5 <;> decide

theorem good_pair_three : ∀ f ∈ R, ∀ g ∈ R, f ≠ g → ¬ Bad f g →
    ∃ P, Packing family P ∧ P.card = 3 ∧ Disjoint (support P) {f,g} := by
  intro f hf g hg hfg hgood
  exact good_set ⟨{f,g},mem_powersetCard.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hf hg,by simp [hfg]⟩⟩ hgood
end Tuza06.K221Finite
