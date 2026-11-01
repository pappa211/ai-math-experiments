import Tuza06.Transport
import Mathlib.Algebra.Order.BigOperators.Group.Finset

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option linter.unnecessarySeqFocus false
set_option maxRecDepth 6000
set_option maxHeartbeats 2400000

/-- All vertex triples of a clique, not a selected triangle subfamily. -/
def cliqueFamily {V : Type*} (k : Finset V) : Finset (Finset V) := k.powersetCard 3

theorem cliqueFamily_valid {V : Type*} (k : Finset V) : Triangles (cliqueFamily k) :=
  fun _ ht => (mem_powersetCard.mp ht).2

private theorem packing_bound_one {V : Type*} [DecidableEq V] {F : Finset (Finset V)}
    (hi : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t)) : nu F ≤ 1 := by
  apply nu_le_of_packings
  intro P hP hp
  apply card_le_one.mpr
  intro s hs t ht
  by_contra hne
  exact hi s (mem_powerset.mp hP hs) t (mem_powerset.mp hP ht) (hp s hs t ht hne)

private theorem packing_bound_two {V : Type*} [DecidableEq V] {F : Finset (Finset V)}
    (hi : ∀ a ∈ F, ∀ b ∈ F, ∀ c ∈ F, a ≠ b → a ≠ c → b ≠ c →
      ¬ (Disjoint (edges a) (edges b) ∧ Disjoint (edges a) (edges c) ∧
        Disjoint (edges b) (edges c))) : nu F ≤ 2 := by
  apply nu_le_of_packings
  intro P hP hp
  by_contra hn
  obtain ⟨Q, hQP, hQ⟩ := exists_subset_card_eq (show 3 ≤ P.card by omega)
  obtain ⟨a, b, c, hab, hac, hbc, rfl⟩ := card_eq_three.mp hQ
  have ha : a ∈ P := hQP (by simp)
  have hb : b ∈ P := hQP (by simp)
  have hc : c ∈ P := hQP (by simp)
  exact hi a (mem_powerset.mp hP ha) b (mem_powerset.mp hP hb)
    c (mem_powerset.mp hP hc) hab hac hbc
    ⟨hp a ha b hb hab, hp a ha c hc hac, hp b hb c hc hbc⟩

private theorem covering_incidence_bound {V : Type*} [DecidableEq V]
    {F : Finset (Finset V)} {k : ℕ} (hf : Triangles F)
    (hd : ∀ e ∈ support F, (F.filter (fun t => e ∈ edges t)).card ≤ k) :
    F.card ≤ tau F * k := by
  classical
  obtain ⟨C, hc, hC, hs⟩ := exists_min_cover_supported hf
  have hsub : F ⊆ C.biUnion (fun e => F.filter (fun t => e ∈ edges t)) := by
    intro t ht
    obtain ⟨e, he, het⟩ := hc t ht
    exact mem_biUnion.mpr ⟨e, he, mem_filter.mpr ⟨ht, het⟩⟩
  calc
    F.card ≤ (C.biUnion (fun e => F.filter (fun t => e ∈ edges t))).card := card_le_card hsub
    _ ≤ ∑ e ∈ C, (F.filter (fun t => e ∈ edges t)).card := card_biUnion_le
    _ ≤ ∑ _e ∈ C, k := sum_le_sum (fun e he => hd e (hs he))
    _ = tau F * k := by simp [hC]

private theorem k4_parameters_finite :
    nu (cliqueFamily (univ : Finset (Fin 4))) = 1 ∧
    tau (cliqueFamily (univ : Finset (Fin 4))) = 2 := by
  let F := cliqueFamily (univ : Finset (Fin 4))
  have hf : Triangles F := cliqueFamily_valid _
  have hnlo : 1 ≤ nu F := nu_pos (by decide)
  have hnhi : nu F ≤ 1 := packing_bound_one (by decide)
  have hcount := covering_incidence_bound (k := 2) hf (by unfold support; decide)
  have htlo : 2 ≤ tau F := by
    have hcard : F.card = 4 := by decide
    rw [hcard] at hcount
    omega
  have hc : Covers F {{0, 1}, {2, 3}} := by unfold Covers; decide
  have hthi : tau F ≤ 2 := (tau_le_card hc).trans (by decide)
  change nu F = 1 ∧ tau F = 2
  omega

private def K5family : Finset (Finset (Fin 5)) :=
  {{0, 1, 2}, {0, 1, 3}, {0, 1, 4}, {0, 2, 3}, {0, 2, 4},
   {0, 3, 4}, {1, 2, 3}, {1, 2, 4}, {1, 3, 4}, {2, 3, 4}}

private theorem K5family_eq : cliqueFamily (univ : Finset (Fin 5)) = K5family := by decide

private theorem k5_no_three_finite :
    ∀ a b c : ↥K5family, a.val ≠ b.val → a.val ≠ c.val → b.val ≠ c.val →
      ¬ (Disjoint (edges a.val) (edges b.val) ∧
        Disjoint (edges a.val) (edges c.val) ∧ Disjoint (edges b.val) (edges c.val)) := by
  decide

private theorem k5_parameters_finite :
    nu (cliqueFamily (univ : Finset (Fin 5))) = 2 ∧
    tau (cliqueFamily (univ : Finset (Fin 5))) = 4 := by
  rw [K5family_eq]
  let F := K5family
  have hf : Triangles F := by unfold Triangles; decide
  have hp : Packing F {{0, 1, 2}, {0, 3, 4}} := by unfold Packing Independent; decide
  have hnlo : 2 ≤ nu F := by
    have h := packing_card_le hp
    have hc : ({{0, 1, 2}, {0, 3, 4}} : Finset (Finset (Fin 5))).card = 2 := by decide
    rwa [hc] at h
  have hnhi : nu F ≤ 2 := packing_bound_two (by
    intro a ha b hb c hc
    exact k5_no_three_finite ⟨a, ha⟩ ⟨b, hb⟩ ⟨c, hc⟩)
  have hcount := covering_incidence_bound (k := 3) hf (by unfold support; decide)
  have htlo : 4 ≤ tau F := by
    have hcard : F.card = 10 := by decide
    rw [hcard] at hcount
    omega
  have hc : Covers F {{0, 1}, {2, 3}, {2, 4}, {3, 4}} := by unfold Covers; decide
  have hthi : tau F ≤ 4 := (tau_le_card hc).trans (by decide)
  change nu F = 2 ∧ tau F = 4
  omega

/-- Explicit witnesses for the 45 pairs of forbidden K5 edges.
The witness checks use kernel reduction, with no finite search in Lean. -/
private theorem k5_avoid_case_0 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {0, 2}} := by
  refine ⟨{{0, 3, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_1 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {0, 3}} := by
  refine ⟨{{0, 2, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_2 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {0, 4}} := by
  refine ⟨{{0, 2, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_3 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {1, 2}} := by
  refine ⟨{{0, 2, 3}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_4 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {1, 3}} := by
  refine ⟨{{0, 2, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_5 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {1, 4}} := by
  refine ⟨{{0, 2, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_6 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {2, 3}} := by
  refine ⟨{{0, 2, 4}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_7 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {2, 4}} := by
  refine ⟨{{0, 2, 3}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_8 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 1}, {3, 4}} := by
  refine ⟨{{0, 2, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_9 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {0, 3}} := by
  refine ⟨{{0, 1, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_10 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {0, 4}} := by
  refine ⟨{{0, 1, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_11 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {1, 2}} := by
  refine ⟨{{0, 1, 3}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_12 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {1, 3}} := by
  refine ⟨{{0, 1, 4}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_13 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {1, 4}} := by
  refine ⟨{{0, 1, 3}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_14 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {2, 3}} := by
  refine ⟨{{0, 1, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_15 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {2, 4}} := by
  refine ⟨{{0, 1, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_16 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 2}, {3, 4}} := by
  refine ⟨{{0, 1, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_17 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {0, 4}} := by
  refine ⟨{{0, 1, 2}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_18 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {1, 2}} := by
  refine ⟨{{0, 1, 4}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_19 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {1, 3}} := by
  refine ⟨{{0, 1, 2}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_20 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {1, 4}} := by
  refine ⟨{{0, 1, 2}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_21 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {2, 3}} := by
  refine ⟨{{0, 1, 2}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_22 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {2, 4}} := by
  refine ⟨{{0, 1, 2}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_23 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 3}, {3, 4}} := by
  refine ⟨{{0, 1, 4}, {1, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_24 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {1, 2}} := by
  refine ⟨{{0, 1, 3}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_25 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {1, 3}} := by
  refine ⟨{{0, 1, 2}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_26 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {1, 4}} := by
  refine ⟨{{0, 1, 2}, {2, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_27 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {2, 3}} := by
  refine ⟨{{0, 1, 2}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_28 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {2, 4}} := by
  refine ⟨{{0, 1, 2}, {1, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_29 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{0, 4}, {3, 4}} := by
  refine ⟨{{0, 1, 3}, {1, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_30 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 2}, {1, 3}} := by
  refine ⟨{{0, 1, 4}, {0, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_31 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 2}, {1, 4}} := by
  refine ⟨{{0, 1, 3}, {0, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_32 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 2}, {2, 3}} := by
  refine ⟨{{0, 1, 3}, {0, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_33 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 2}, {2, 4}} := by
  refine ⟨{{0, 1, 4}, {0, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_34 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 2}, {3, 4}} := by
  refine ⟨{{0, 1, 3}, {0, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_35 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 3}, {1, 4}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_36 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 3}, {2, 3}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_37 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 3}, {2, 4}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_38 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 3}, {3, 4}} := by
  refine ⟨{{0, 1, 4}, {0, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_39 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 4}, {2, 3}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_40 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 4}, {2, 4}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_41 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{1, 4}, {3, 4}} := by
  refine ⟨{{0, 1, 3}, {0, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_42 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{2, 3}, {2, 4}} := by
  refine ⟨{{0, 1, 2}, {0, 3, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_43 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{2, 3}, {3, 4}} := by
  refine ⟨{{0, 1, 3}, {0, 2, 4}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_case_44 :
    ∃ P, Packing K5family P ∧ P.card = 2 ∧ Disjoint (support P) {{2, 4}, {3, 4}} := by
  refine ⟨{{0, 1, 4}, {0, 2, 3}}, ?_, by decide, ?_⟩
  · unfold Packing Independent; decide
  · unfold support; decide

private theorem k5_avoid_finite :
    ∀ D : ↥((edges (univ : Finset (Fin 5))).powersetCard 2),
    ∃ P, Packing (cliqueFamily (univ : Finset (Fin 5))) P ∧ P.card = 2 ∧
      Disjoint (support P) D.val := by
  rw [K5family_eq]
  intro D
  fin_cases D
  · convert k5_avoid_case_0 using 5 <;> decide
  · convert k5_avoid_case_1 using 5 <;> decide
  · convert k5_avoid_case_9 using 5 <;> decide
  · convert k5_avoid_case_2 using 5 <;> decide
  · convert k5_avoid_case_10 using 5 <;> decide
  · convert k5_avoid_case_17 using 5 <;> decide
  · convert k5_avoid_case_3 using 5 <;> decide
  · convert k5_avoid_case_11 using 5 <;> decide
  · convert k5_avoid_case_18 using 5 <;> decide
  · convert k5_avoid_case_24 using 5 <;> decide
  · convert k5_avoid_case_4 using 5 <;> decide
  · convert k5_avoid_case_12 using 5 <;> decide
  · convert k5_avoid_case_19 using 5 <;> decide
  · convert k5_avoid_case_25 using 5 <;> decide
  · convert k5_avoid_case_30 using 5 <;> decide
  · convert k5_avoid_case_5 using 5 <;> decide
  · convert k5_avoid_case_13 using 5 <;> decide
  · convert k5_avoid_case_20 using 5 <;> decide
  · convert k5_avoid_case_26 using 5 <;> decide
  · convert k5_avoid_case_31 using 5 <;> decide
  · convert k5_avoid_case_35 using 5 <;> decide
  · convert k5_avoid_case_6 using 5 <;> decide
  · convert k5_avoid_case_14 using 5 <;> decide
  · convert k5_avoid_case_21 using 5 <;> decide
  · convert k5_avoid_case_27 using 5 <;> decide
  · convert k5_avoid_case_32 using 5 <;> decide
  · convert k5_avoid_case_36 using 5 <;> decide
  · convert k5_avoid_case_39 using 5 <;> decide
  · convert k5_avoid_case_7 using 5 <;> decide
  · convert k5_avoid_case_15 using 5 <;> decide
  · convert k5_avoid_case_22 using 5 <;> decide
  · convert k5_avoid_case_28 using 5 <;> decide
  · convert k5_avoid_case_33 using 5 <;> decide
  · convert k5_avoid_case_37 using 5 <;> decide
  · convert k5_avoid_case_40 using 5 <;> decide
  · convert k5_avoid_case_42 using 5 <;> decide
  · convert k5_avoid_case_8 using 5 <;> decide
  · convert k5_avoid_case_16 using 5 <;> decide
  · convert k5_avoid_case_23 using 5 <;> decide
  · convert k5_avoid_case_29 using 5 <;> decide
  · convert k5_avoid_case_34 using 5 <;> decide
  · convert k5_avoid_case_38 using 5 <;> decide
  · convert k5_avoid_case_41 using 5 <;> decide
  · convert k5_avoid_case_43 using 5 <;> decide
  · convert k5_avoid_case_44 using 5 <;> decide

variable {V : Type*} [DecidableEq V]

theorem k4_parameters {k : Finset V} (hk : k.card = 4) :
    nu (cliqueFamily k) = 1 ∧ tau (cliqueFamily k) = 2 := by
  obtain ⟨f, hf⟩ := exists_fin_embedding k hk
  have he : cliqueFamily k = liftFamily f (cliqueFamily univ) := by
    rw [← hf]; exact powersetCard_map f 3 univ
  rw [he, nu_liftFamily, tau_liftFamily f (cliqueFamily_valid _)]
  exact k4_parameters_finite

theorem k5_parameters {k : Finset V} (hk : k.card = 5) :
    nu (cliqueFamily k) = 2 ∧ tau (cliqueFamily k) = 4 := by
  obtain ⟨f, hf⟩ := exists_fin_embedding k hk
  have he : cliqueFamily k = liftFamily f (cliqueFamily univ) := by
    rw [← hf]; exact powersetCard_map f 3 univ
  rw [he, nu_liftFamily, tau_liftFamily f (cliqueFamily_valid _)]
  exact k5_parameters_finite

/-- Every K5 in an arbitrary vertex type has a maximum two-packing avoiding any
at most two specified edges. No statement about a three-edge star is asserted. -/
theorem k5_avoid_two {k : Finset V} (hk : k.card = 5)
    {D : Finset (Finset V)} (hD : D ⊆ edges k) (hcard : D.card ≤ 2) :
    ∃ P, Packing (cliqueFamily k) P ∧ P.card = 2 ∧ Disjoint (support P) D := by
  classical
  obtain ⟨f, hf⟩ := exists_fin_embedding k hk
  have he : edges k = liftFamily f (edges univ) := by rw [← hf, edges_map]
  rw [he] at hD
  obtain ⟨D', hD', rfl⟩ := subfamily_lift hD
  have hcard' : D'.card ≤ 2 := by simpa using hcard
  have hedges : 2 ≤ (edges (univ : Finset (Fin 5))).card := by decide
  obtain ⟨D'', hsub, hD'', hcD''⟩ := exists_subsuperset_card_eq hD' hcard' hedges
  obtain ⟨P, hp, hP, hd⟩ := k5_avoid_finite ⟨D'', mem_powersetCard.mpr ⟨hD'', hcD''⟩⟩
  have hd' : Disjoint (support P) D' := hd.mono_right hsub
  refine ⟨liftFamily f P, ?_, ?_, ?_⟩
  · have h := (packing_liftFamily f _ _).mpr hp
    convert h using 1
    rw [← hf]; exact powersetCard_map f 3 univ
  · simpa using hP
  · simpa using hd'

end Tuza06
