import Tuza06.FiniteCliques

namespace Tuza06.Core
open Finset Tuza
set_option linter.unusedSectionVars false
set_option linter.unnecessarySeqFocus false
set_option maxRecDepth 6000
set_option maxHeartbeats 2400000

/-- Labels 0=u, 1=v, 2=w, 3=a, 4=b, 5=c, 6=d, 7=e. -/
def A : Finset (Fin 8) := {3,4,5,6,7}
def U : Finset (Fin 8) := {0,1,2}

/-- Exactly the 23 graph edges of the fixed final core. -/
def BEdges : Finset (Finset (Fin 8)) := {{3, 4}, {3, 5}, {3, 6}, {3, 7}, {3, 0}, {3, 1}, {3, 2}, {4, 5}, {4, 6}, {4, 7}, {4, 0}, {4, 1}, {5, 6}, {5, 7}, {5, 0}, {5, 1}, {6, 7}, {6, 0}, {6, 2}, {7, 0}, {7, 2}, {0, 1}, {0, 2}}

/-- The full computable triangle family determined by BEdges. -/
def family : Finset (Finset (Fin 8)) :=
  univ.powersetCard 3 |>.filter (fun t => edges t ⊆ BEdges)


def P7 : Finset (Finset (Fin 8)) := {{1, 0, 3}, {1, 4, 5}, {2, 0, 6}, {2, 3, 7}, {0, 5, 7}, {3, 5, 6}, {4, 6, 7}}
def C9 : Finset (Finset (Fin 8)) := {{3, 0}, {4, 0}, {3, 4}, {5, 6}, {5, 7}, {6, 7}, {5, 1}, {6, 2}, {7, 2}}

theorem family_valid : Triangles family := by
  intro t ht
  exact (mem_powersetCard.mp (mem_filter.mp ht).1).2

theorem support_subset_BEdges : support family ⊆ BEdges := by
  intro e he
  obtain ⟨t,ht,het⟩ := mem_biUnion.mp he
  exact (mem_filter.mp ht).2 het


/-- Quantify finite checks over the actual packing, avoiding ambient powersets. -/
private theorem packing_of_subtype {P : Finset (Finset (Fin 8))}
    (hsub : ∀ t : ↥P, t.val.card = 3 ∧ edges t.val ⊆ BEdges)
    (hi : ∀ s t : ↥P, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) :
    Packing family P := by
  refine ⟨?_,?_⟩
  · intro t ht
    obtain ⟨hc,he⟩ := hsub ⟨t,ht⟩
    exact mem_filter.mpr ⟨mem_powersetCard.mpr ⟨subset_univ _,hc⟩,he⟩
  intro s hs t ht hst
  exact hi ⟨s,hs⟩ ⟨t,ht⟩ hst

theorem packing7 : Packing family P7 ∧ P7.card = 7 := by
  constructor
  · exact packing_of_subtype (by decide) (by decide)
  · decide

private theorem cover_of_vertex_test {C : Finset (Finset (Fin 8))}
    (h : ∀ a b c : Fin 8, a ≠ b → a ≠ c → b ≠ c →
      ({a,b} : Finset (Fin 8)) ∈ BEdges → {a,c} ∈ BEdges → {b,c} ∈ BEdges →
        {a,b} ∈ C ∨ {a,c} ∈ C ∨ {b,c} ∈ C) : Covers family C := by
  intro t ht
  obtain ⟨a,b,c,hab,hac,hbc,rfl⟩ := card_eq_three.mp (family_valid t ht)
  have hE := (mem_filter.mp ht).2
  have heab : ({a,b} : Finset (Fin 8)) ∈ edges {a,b,c} :=
    mem_edges.mpr ⟨by simp,by simp [hab]⟩
  have heac : ({a,c} : Finset (Fin 8)) ∈ edges {a,b,c} :=
    mem_edges.mpr ⟨by simp,by simp [hac]⟩
  have hebc : ({b,c} : Finset (Fin 8)) ∈ edges {a,b,c} :=
    mem_edges.mpr ⟨by simp,by simp [hbc]⟩
  rcases h a b c hab hac hbc (hE heab) (hE heac) (hE hebc) with h | h | h
  · exact ⟨{a,b},h,heab⟩
  · exact ⟨{a,c},h,heac⟩
  · exact ⟨{b,c},h,hebc⟩

private theorem cover9_at_0 : ∀ b c : Fin 8, 0 ≠ b → 0 ≠ c → b ≠ c →
    ({0,b} : Finset (Fin 8)) ∈ BEdges → {0,c} ∈ BEdges → {b,c} ∈ BEdges →
      {0,b} ∈ C9 ∨ {0,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_1 : ∀ b c : Fin 8, 1 ≠ b → 1 ≠ c → b ≠ c →
    ({1,b} : Finset (Fin 8)) ∈ BEdges → {1,c} ∈ BEdges → {b,c} ∈ BEdges →
      {1,b} ∈ C9 ∨ {1,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_2 : ∀ b c : Fin 8, 2 ≠ b → 2 ≠ c → b ≠ c →
    ({2,b} : Finset (Fin 8)) ∈ BEdges → {2,c} ∈ BEdges → {b,c} ∈ BEdges →
      {2,b} ∈ C9 ∨ {2,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_3 : ∀ b c : Fin 8, 3 ≠ b → 3 ≠ c → b ≠ c →
    ({3,b} : Finset (Fin 8)) ∈ BEdges → {3,c} ∈ BEdges → {b,c} ∈ BEdges →
      {3,b} ∈ C9 ∨ {3,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_4 : ∀ b c : Fin 8, 4 ≠ b → 4 ≠ c → b ≠ c →
    ({4,b} : Finset (Fin 8)) ∈ BEdges → {4,c} ∈ BEdges → {b,c} ∈ BEdges →
      {4,b} ∈ C9 ∨ {4,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_5 : ∀ b c : Fin 8, 5 ≠ b → 5 ≠ c → b ≠ c →
    ({5,b} : Finset (Fin 8)) ∈ BEdges → {5,c} ∈ BEdges → {b,c} ∈ BEdges →
      {5,b} ∈ C9 ∨ {5,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_6 : ∀ b c : Fin 8, 6 ≠ b → 6 ≠ c → b ≠ c →
    ({6,b} : Finset (Fin 8)) ∈ BEdges → {6,c} ∈ BEdges → {b,c} ∈ BEdges →
      {6,b} ∈ C9 ∨ {6,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

private theorem cover9_at_7 : ∀ b c : Fin 8, 7 ≠ b → 7 ≠ c → b ≠ c →
    ({7,b} : Finset (Fin 8)) ∈ BEdges → {7,c} ∈ BEdges → {b,c} ∈ BEdges →
      {7,b} ∈ C9 ∨ {7,c} ∈ C9 ∨ {b,c} ∈ C9 := by decide

theorem cover9 : Covers family C9 ∧ C9.card = 9 := by
  refine ⟨cover_of_vertex_test ?_,by decide⟩
  intro a
  fin_cases a
  · exact cover9_at_0
  · exact cover9_at_1
  · exact cover9_at_2
  · exact cover9_at_3
  · exact cover9_at_4
  · exact cover9_at_5
  · exact cover9_at_6
  · exact cover9_at_7

private theorem avoid_case_0 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {3, 5}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {5, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_1 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {3, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {0, 7, 4}, {3, 7, 5}, {6, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_2 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {3, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {0, 6, 4}, {3, 6, 5}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_3 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {4, 5}} := by
  refine ⟨{{1, 0, 3}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 5, 7}, {4, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_4 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {4, 6}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 5, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_5 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {4, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 5, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_6 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {5, 6}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {3, 5, 7}, {4, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_7 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {5, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {4, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_8 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 4}, {6, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 5, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_9 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {3, 6}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {0, 4, 6}, {3, 4, 7}, {5, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_10 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {3, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_11 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {4, 5}} := by
  refine ⟨{{1, 0, 3}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 4, 7}, {5, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_12 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {4, 6}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {3, 4, 7}, {5, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_13 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {4, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {5, 7, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_14 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {5, 6}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 4, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_15 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {5, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 4, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_16 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 5}, {6, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 4, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_17 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {3, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_18 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {4, 5}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_19 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {4, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_20 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {4, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {3, 7, 5}, {6, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_21 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {5, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_22 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {5, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {6, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_23 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 6}, {6, 7}} := by
  refine ⟨{{2, 0, 3}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 7, 5}, {6, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_24 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {4, 5}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 6, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_25 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {4, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {3, 6, 5}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_26 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {4, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 6, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_27 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {5, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_28 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {5, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 6, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_29 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{3, 7}, {6, 7}} := by
  refine ⟨{{2, 0, 3}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 6, 5}, {7, 5, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_30 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 5}, {4, 6}} := by
  refine ⟨{{1, 0, 4}, {1, 3, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 4, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_31 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 5}, {4, 7}} := by
  refine ⟨{{1, 0, 4}, {1, 3, 5}, {2, 0, 6}, {2, 3, 7}, {0, 5, 7}, {3, 4, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_32 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 5}, {5, 6}} := by
  refine ⟨{{1, 0, 5}, {1, 3, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 5, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_33 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 5}, {5, 7}} := by
  refine ⟨{{1, 0, 5}, {1, 3, 4}, {2, 0, 6}, {2, 3, 7}, {0, 4, 7}, {3, 5, 6}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_34 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 5}, {6, 7}} := by
  refine ⟨{{2, 0, 7}, {2, 3, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_35 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 6}, {4, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 4, 5}, {2, 0, 7}, {2, 3, 6}, {0, 5, 6}, {3, 5, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_36 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 6}, {5, 6}} := by
  refine ⟨{{2, 0, 3}, {2, 6, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_37 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 6}, {5, 7}} := by
  refine ⟨{{2, 0, 7}, {2, 3, 6}, {1, 0, 4}, {1, 3, 5}, {0, 6, 5}, {3, 7, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_38 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 6}, {6, 7}} := by
  refine ⟨{{2, 0, 6}, {2, 3, 7}, {1, 0, 5}, {1, 3, 4}, {0, 7, 4}, {3, 6, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_39 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 7}, {5, 6}} := by
  refine ⟨{{2, 0, 7}, {2, 3, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_40 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 7}, {5, 7}} := by
  refine ⟨{{2, 0, 3}, {2, 7, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 6, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_41 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{4, 7}, {6, 7}} := by
  refine ⟨{{2, 0, 7}, {2, 3, 6}, {1, 0, 5}, {1, 3, 4}, {0, 6, 4}, {3, 7, 5}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_42 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{5, 6}, {5, 7}} := by
  refine ⟨{{1, 0, 3}, {1, 5, 4}, {2, 0, 7}, {2, 3, 6}, {0, 4, 6}, {3, 4, 7}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_43 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{5, 6}, {6, 7}} := by
  refine ⟨{{2, 0, 6}, {2, 3, 7}, {1, 0, 4}, {1, 3, 5}, {0, 7, 5}, {3, 6, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

private theorem avoid_case_44 :
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {{5, 7}, {6, 7}} := by
  refine ⟨{{2, 0, 7}, {2, 3, 6}, {1, 0, 4}, {1, 3, 5}, {0, 6, 5}, {3, 7, 4}}, ?_, by decide, ?_⟩
  · exact packing_of_subtype (by decide) (by decide)
  · unfold support; decide

#check packing7
#check cover9
#check avoid_case_44

private theorem pair_six_set :
    ∀ D : ↥((edges A).powersetCard 2),
      ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) D.val := by
  intro D
  fin_cases D
  · convert avoid_case_0 using 5 <;> decide
  · convert avoid_case_1 using 5 <;> decide
  · convert avoid_case_9 using 5 <;> decide
  · convert avoid_case_2 using 5 <;> decide
  · convert avoid_case_10 using 5 <;> decide
  · convert avoid_case_17 using 5 <;> decide
  · convert avoid_case_3 using 5 <;> decide
  · convert avoid_case_11 using 5 <;> decide
  · convert avoid_case_18 using 5 <;> decide
  · convert avoid_case_24 using 5 <;> decide
  · convert avoid_case_4 using 5 <;> decide
  · convert avoid_case_12 using 5 <;> decide
  · convert avoid_case_19 using 5 <;> decide
  · convert avoid_case_25 using 5 <;> decide
  · convert avoid_case_30 using 5 <;> decide
  · convert avoid_case_5 using 5 <;> decide
  · convert avoid_case_13 using 5 <;> decide
  · convert avoid_case_20 using 5 <;> decide
  · convert avoid_case_26 using 5 <;> decide
  · convert avoid_case_31 using 5 <;> decide
  · convert avoid_case_35 using 5 <;> decide
  · convert avoid_case_6 using 5 <;> decide
  · convert avoid_case_14 using 5 <;> decide
  · convert avoid_case_21 using 5 <;> decide
  · convert avoid_case_27 using 5 <;> decide
  · convert avoid_case_32 using 5 <;> decide
  · convert avoid_case_36 using 5 <;> decide
  · convert avoid_case_39 using 5 <;> decide
  · convert avoid_case_7 using 5 <;> decide
  · convert avoid_case_15 using 5 <;> decide
  · convert avoid_case_22 using 5 <;> decide
  · convert avoid_case_28 using 5 <;> decide
  · convert avoid_case_33 using 5 <;> decide
  · convert avoid_case_37 using 5 <;> decide
  · convert avoid_case_40 using 5 <;> decide
  · convert avoid_case_42 using 5 <;> decide
  · convert avoid_case_8 using 5 <;> decide
  · convert avoid_case_16 using 5 <;> decide
  · convert avoid_case_23 using 5 <;> decide
  · convert avoid_case_29 using 5 <;> decide
  · convert avoid_case_34 using 5 <;> decide
  · convert avoid_case_38 using 5 <;> decide
  · convert avoid_case_41 using 5 <;> decide
  · convert avoid_case_43 using 5 <;> decide
  · convert avoid_case_44 using 5 <;> decide

/-- Every pair of distinct A-edges can be avoided by a six-packing.
All 45 explicit witnesses are checked by ordinary kernel reduction. -/
theorem pair_six : ∀ f ∈ edges A, ∀ g ∈ edges A, f ≠ g →
    ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {f,g} := by
  intro f hf g hg hfg
  exact pair_six_set ⟨{f,g},mem_powersetCard.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hf hg,
      by simp [hfg]⟩⟩

#check pair_six

/-- The twelve initial core cover edges, separate from the two outside spokes. -/
private theorem cover12_at_0 : ∀ b c : Fin 8, 0 ≠ b → 0 ≠ c → b ≠ c →
    ({0,b} : Finset (Fin 8)) ∈ BEdges → {0,c} ∈ BEdges → {b,c} ∈ BEdges →
      {0,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {0,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_1 : ∀ b c : Fin 8, 1 ≠ b → 1 ≠ c → b ≠ c →
    ({1,b} : Finset (Fin 8)) ∈ BEdges → {1,c} ∈ BEdges → {b,c} ∈ BEdges →
      {1,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {1,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_2 : ∀ b c : Fin 8, 2 ≠ b → 2 ≠ c → b ≠ c →
    ({2,b} : Finset (Fin 8)) ∈ BEdges → {2,c} ∈ BEdges → {b,c} ∈ BEdges →
      {2,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {2,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_3 : ∀ b c : Fin 8, 3 ≠ b → 3 ≠ c → b ≠ c →
    ({3,b} : Finset (Fin 8)) ∈ BEdges → {3,c} ∈ BEdges → {b,c} ∈ BEdges →
      {3,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {3,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_4 : ∀ b c : Fin 8, 4 ≠ b → 4 ≠ c → b ≠ c →
    ({4,b} : Finset (Fin 8)) ∈ BEdges → {4,c} ∈ BEdges → {b,c} ∈ BEdges →
      {4,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {4,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_5 : ∀ b c : Fin 8, 5 ≠ b → 5 ≠ c → b ≠ c →
    ({5,b} : Finset (Fin 8)) ∈ BEdges → {5,c} ∈ BEdges → {b,c} ∈ BEdges →
      {5,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {5,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_6 : ∀ b c : Fin 8, 6 ≠ b → 6 ≠ c → b ≠ c →
    ({6,b} : Finset (Fin 8)) ∈ BEdges → {6,c} ∈ BEdges → {b,c} ∈ BEdges →
      {6,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {6,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

private theorem cover12_at_7 : ∀ b c : Fin 8, 7 ≠ b → 7 ≠ c → b ≠ c →
    ({7,b} : Finset (Fin 8)) ∈ BEdges → {7,c} ∈ BEdges → {b,c} ∈ BEdges →
      {7,b} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {7,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) ∨ {b,c} ∈ (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))) := by decide

theorem cover12_initial : Covers family (edges A ∪ {{0,1},{0,2}}) := by
  apply cover_of_vertex_test
  intro a
  fin_cases a
  · exact cover12_at_0
  · exact cover12_at_1
  · exact cover12_at_2
  · exact cover12_at_3
  · exact cover12_at_4
  · exact cover12_at_5
  · exact cover12_at_6
  · exact cover12_at_7

theorem card_initial_le12 : (edges A ∪ ({{0,1},{0,2}} : Finset (Finset (Fin 8)))).card ≤ 12 := by
  decide

theorem edges_size : ∀ e ∈ BEdges, e.card = 2 := by
  have h : ∀ e : ↥BEdges, e.val.card = 2 := by decide
  exact fun e he => h ⟨e,he⟩

theorem U_union_A : U ∪ A = univ := by decide

theorem A_edges_subset : edges A ⊆ BEdges := by decide

theorem C9_subset : C9 ⊆ BEdges := by decide

end Tuza06.Core
