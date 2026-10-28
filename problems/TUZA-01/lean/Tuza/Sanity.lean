import Tuza.Lifting
import Tuza.Coloring
import Mathlib.Algebra.Order.BigOperators.Group.Finset

namespace Tuza.Sanity
open Finset
set_option maxRecDepth 4000
set_option maxHeartbeats 800000

private theorem packing_bound_one {V : Type*} [DecidableEq V]
    {F : Finset (Finset V)}
    (hi : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t)) : nu F ≤ 1 := by
  apply nu_le_of_packings
  intro P hP hp
  apply card_le_one.mpr
  intro s hs t ht
  by_contra hne
  exact hi s (mem_powerset.mp hP hs) t (mem_powerset.mp hP ht) (hp s hs t ht hne)

private theorem packing_bound_two {V : Type*} [DecidableEq V]
    {F : Finset (Finset V)}
    (hi : ∀ a ∈ F, ∀ b ∈ F, ∀ c ∈ F, a ≠ b → a ≠ c → b ≠ c →
      ¬ (Disjoint (edges a) (edges b) ∧ Disjoint (edges a) (edges c) ∧
        Disjoint (edges b) (edges c))) : nu F ≤ 2 := by
  apply nu_le_of_packings
  intro P hP hp
  by_contra hn
  have hthree : 3 ≤ P.card := by omega
  obtain ⟨Q, hQP, hQ⟩ := exists_subset_card_eq hthree
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

def K4family : Finset (Finset (Fin 4)) :=
  {{0, 1, 2}, {0, 1, 3}, {0, 2, 3}, {1, 2, 3}}

def K5family : Finset (Finset (Fin 5)) :=
  {{0, 1, 2}, {0, 1, 3}, {0, 1, 4}, {0, 2, 3}, {0, 2, 4},
   {0, 3, 4}, {1, 2, 3}, {1, 2, 4}, {1, 3, 4}, {2, 3, 4}}

theorem triangles_K4 : triangles (⊤ : SimpleGraph (Fin 4)) = K4family := by
  ext t
  rw [mem_triangles]
  exact (by decide : ∀ t, (⊤ : SimpleGraph (Fin 4)).IsNClique 3 t ↔ t ∈ K4family) t

theorem triangles_K5 : triangles (⊤ : SimpleGraph (Fin 5)) = K5family := by
  ext t
  rw [mem_triangles]
  exact (by decide : ∀ t, (⊤ : SimpleGraph (Fin 5)).IsNClique 3 t ↔ t ∈ K5family) t

theorem K4_parameters : nu (triangles (⊤ : SimpleGraph (Fin 4))) = 1 ∧
    tau (triangles (⊤ : SimpleGraph (Fin 4))) = 2 := by
  rw [triangles_K4]
  have hf : Triangles K4family := by unfold Triangles; decide
  have hnlo : 1 ≤ nu K4family := nu_pos (by decide)
  have hnhi : nu K4family ≤ 1 := packing_bound_one (by decide)
  have hcount := covering_incidence_bound (k := 2) hf (by unfold support; decide)
  have htlo : 2 ≤ tau K4family := by
    have hcard : K4family.card = 4 := by decide
    rw [hcard] at hcount
    omega
  have hc : Covers K4family {{0, 1}, {2, 3}} := by unfold Covers; decide
  have hthi : tau K4family ≤ 2 := (tau_le_card hc).trans (by decide)
  omega

theorem K5_parameters : nu (triangles (⊤ : SimpleGraph (Fin 5))) = 2 ∧
    tau (triangles (⊤ : SimpleGraph (Fin 5))) = 4 := by
  rw [triangles_K5]
  have hf : Triangles K5family := by unfold Triangles; decide
  have hp : Packing K5family {{0, 1, 2}, {0, 3, 4}} := by
    unfold Packing Independent
    decide
  have hnlo : 2 ≤ nu K5family := by
    have h := packing_card_le hp
    have hc : ({{0, 1, 2}, {0, 3, 4}} : Finset (Finset (Fin 5))).card = 2 := by decide
    rwa [hc] at h
  have hnhi : nu K5family ≤ 2 := packing_bound_two (by decide)
  have hcount := covering_incidence_bound (k := 3) hf (by unfold support; decide)
  have htlo : 4 ≤ tau K5family := by
    have hcard : K5family.card = 10 := by decide
    rw [hcard] at hcount
    omega
  have hc : Covers K5family {{0, 1}, {2, 3}, {2, 4}, {3, 4}} := by unfold Covers; decide
  have hthi : tau K5family ≤ 4 := (tau_le_card hc).trans (by decide)
  omega

def C5 : SimpleGraph (Fin 5) := SimpleGraph.fromRel (fun a b => b = a + 1)

instance : DecidableRel C5.Adj := by
  intro a b
  change Decidable (a ≠ b ∧ (b = a + 1 ∨ a = b + 1))
  infer_instance

theorem triangles_C5 : triangles C5 = ∅ := by
  ext t
  rw [mem_triangles]
  exact (by decide : ∀ t : Finset (Fin 5), C5.IsNClique 3 t ↔ t ∈ (∅ : Finset (Finset (Fin 5)))) t

theorem C5_parameters : nu (triangles C5) = 0 ∧ tau (triangles C5) = 0 := by
  simp [triangles_C5]

theorem K5_not_four_colorable : ¬ ∃ c : Fin 5 → Fin 4,
    ProperColor (⊤ : SimpleGraph (Fin 5)) c := by
  rintro ⟨c, hc⟩
  have hi : Function.Injective c := by
    intro a b heq
    by_contra hne
    exact hc a b (by simpa using hne) heq
  have h := Fintype.card_le_of_injective c hi
  norm_num at h

theorem K5_deletion_tripartite :
    TriangleTripartite (deleteTriangle (⊤ : SimpleGraph (Fin 5)) {0, 1, 2}) := by
  apply four_color_tripartite (c := ![0, 0, 0, 1, 2])
  unfold ProperColor deleteTriangle
  decide

#print axioms K4_parameters
#print axioms K5_parameters
#print axioms C5_parameters
#print axioms K5_not_four_colorable
#print axioms K5_deletion_tripartite

end Tuza.Sanity
