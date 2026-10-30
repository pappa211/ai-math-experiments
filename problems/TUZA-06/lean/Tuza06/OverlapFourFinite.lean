import Tuza06.OverlapFourTools
namespace Tuza06
open Finset Tuza
set_option maxRecDepth 12000
set_option maxHeartbeats 1800000
def four_near_lower : Finset (Finset (Fin 8)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{5,6},{1,2},{1,3},{1,4},{1,5},{1,7}}
theorem four_near_lower_ok : four_near_lower ⊆ fourLower fiveNearCore := by
  intro e he
  simp only [four_near_lower,mem_insert,mem_singleton] at he
  rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,1} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,2} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({4,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
private theorem four_near_P_check : ∀ p : ↥OverlapFourNear.P, p.val.card = 3 ∧ edges p.val ⊆ four_near_lower := by decide
theorem four_near_P : ∀ p ∈ OverlapFourNear.P, p.card = 3 ∧ edges p ⊆ fourLower fiveNearCore := by
  intro p hp;have h := four_near_P_check ⟨p,hp⟩
  exact ⟨h.1,h.2.trans four_near_lower_ok⟩
def four_full_lower : Finset (Finset (Fin 8)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{2,3},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{5,6},{1,2},{1,3},{1,4},{1,5},{1,7}}
theorem four_full_lower_ok : four_full_lower ⊆ fourLower fiveCliqueCore := by
  intro e he
  simp only [four_full_lower,mem_insert,mem_singleton] at he
  rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,1} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,2} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,2} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({4,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
private theorem four_full_P_check : ∀ p : ↥OverlapFourClique.P, p.val.card = 3 ∧ edges p.val ⊆ four_full_lower := by decide
theorem four_full_P : ∀ p ∈ OverlapFourClique.P, p.card = 3 ∧ edges p ⊆ fourLower fiveCliqueCore := by
  intro p hp;have h := four_full_P_check ⟨p,hp⟩
  exact ⟨h.1,h.2.trans four_full_lower_ok⟩
private theorem four_full_Aug_check : ∀ p : ↥OverlapFourClique.Aug, p.val.card = 3 ∧ edges p.val ⊆ four_full_lower := by decide
theorem four_full_Aug : ∀ p ∈ OverlapFourClique.Aug, p.card = 3 ∧ edges p ⊆ fourLower fiveCliqueCore := by
  intro p hp;have h := four_full_Aug_check ⟨p,hp⟩
  exact ⟨h.1,h.2.trans four_full_lower_ok⟩
def four_last_lower : Finset (Finset (Fin 8)) := {{0,2},{0,3},{0,4},{0,5},{0,6},{2,3},{2,4},{2,5},{2,6},{3,4},{3,5},{3,6},{4,5},{4,6},{1,2},{1,3},{1,4},{1,5},{1,7}}
theorem four_last_lower_ok : four_last_lower ⊆ fourLower (edges univ \ {({4,5} : Finset (Fin 6))}) := by
  intro e he
  simp only [four_last_lower,mem_insert,mem_singleton] at he
  rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,1} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,2} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({0,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,2} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({1,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,3} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({2,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,4} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · apply mem_union_left
    apply mem_liftFamily.mpr
    refine ⟨({3,5} : Finset (Fin 6)),?_,by decide⟩
    simp only [fiveNearCore,fiveCliqueCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
    decide
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
  · exact mem_union_right _ (by decide)
private theorem four_last_P_check : ∀ p : ↥OverlapFourClique.P, p.val.card = 3 ∧ edges p.val ⊆ four_last_lower := by decide
theorem four_last_P : ∀ p ∈ OverlapFourClique.P, p.card = 3 ∧ edges p ⊆ fourLower (edges univ \ {({4,5} : Finset (Fin 6))}) := by
  intro p hp;have h := four_last_P_check ⟨p,hp⟩
  exact ⟨h.1,h.2.trans four_last_lower_ok⟩
private theorem four_last_Aug_check : ∀ p : ↥OverlapFourClique.Aug, p.val.card = 3 ∧ edges p.val ⊆ four_last_lower := by decide
theorem four_last_Aug : ∀ p ∈ OverlapFourClique.Aug, p.card = 3 ∧ edges p ⊆ fourLower (edges univ \ {({4,5} : Finset (Fin 6))}) := by
  intro p hp;have h := four_last_Aug_check ⟨p,hp⟩
  exact ⟨h.1,h.2.trans four_last_lower_ok⟩
theorem four_full_rule (a b : Fin 8) (hn : ({a,b} : Finset (Fin 8)) ∉ OverlapFourClique.witness.Upper) :
    a = b ∨ ({a,b} : Finset (Fin 8)) = {0,1} ∨ ({a,b} : Finset (Fin 8)) = {0,7} ∨ ({a,b} : Finset (Fin 8)) = {1,6} := by
  revert hn;fin_cases a <;> fin_cases b <;> decide
theorem four_near_rule (a b : Fin 8) (hn : ({a,b} : Finset (Fin 8)) ∉ OverlapFourNear.witness.Upper) :
    a = b ∨ ({a,b} : Finset (Fin 8)) = {0,1} ∨ ({a,b} : Finset (Fin 8)) = {0,7} ∨
    ({a,b} : Finset (Fin 8)) = {1,6} ∨ (({a,b} : Finset (Fin 8)) = {2,3} ∧ ({1,2} : Finset (Fin 6)) ∉ fiveNearCore) := by
  revert hn
  simp only [fiveNearCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton]
  fin_cases a <;> fin_cases b <;> decide
end Tuza06
