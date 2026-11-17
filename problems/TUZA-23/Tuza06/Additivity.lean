import Tuza06.Reduction
import Mathlib.Algebra.Order.BigOperators.Group.Finset

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

theorem nu_union_le (F K : Finset (Finset V)) : nu (F ∪ K) ≤ nu F + nu K := by
  classical
  obtain ⟨P, hP, hcP⟩ := exists_max_packing (F ∪ K)
  have hpF : Packing F (P ∩ F) :=
    ⟨inter_subset_right, independent_mono inter_subset_left hP.2⟩
  have hpK : Packing K (P \ F) := by
    refine ⟨?_, independent_mono sdiff_subset hP.2⟩
    intro t ht
    rcases mem_union.mp (hP.1 (mem_sdiff.mp ht).1) with hf | hk
    · exact ((mem_sdiff.mp ht).2 hf).elim
    · exact hk
  have hF := packing_card_le hpF
  have hK := packing_card_le hpK
  have hcard := card_sdiff_add_card_inter P F
  omega

theorem support_disjoint_cross {F K : Finset (Finset V)}
    (hd : Disjoint (support F) (support K)) :
    ∀ s ∈ F, ∀ t ∈ K, Disjoint (edges s) (edges t) := by
  classical
  intro s hs t ht
  apply disjoint_left.mpr
  intro e hes het
  exact disjoint_left.mp hd (mem_biUnion.mpr ⟨s, hs, hes⟩) (mem_biUnion.mpr ⟨t, ht, het⟩)

theorem nu_union_eq {F K : Finset (Finset V)} (hf : Triangles F)
    (hd : Disjoint (support F) (support K)) : nu (F ∪ K) = nu F + nu K := by
  apply le_antisymm (nu_union_le _ _)
  obtain ⟨P, hp, hP⟩ := exists_max_packing F
  have h := nu_union_lower hf hp (fun p hp' q hq => support_disjoint_cross hd p (hp.1 hp') q hq)
  simpa [hP] using h

theorem tau_union_eq {F K : Finset (Finset V)} (hf : Triangles F) (hk : Triangles K)
    (hd : Disjoint (support F) (support K)) : tau (F ∪ K) = tau F + tau K := by
  classical
  apply le_antisymm (tau_union_le hf hk)
  obtain ⟨C, hc, hcC⟩ := exists_min_cover (show Triangles (F ∪ K) by
    intro t ht; rcases mem_union.mp ht with ht | ht; exact hf t ht; exact hk t ht)
  have hCF : Covers F (C ∩ support F) := covers_trim (covers_mono subset_union_left hc)
  have hCK : Covers K (C ∩ support K) := covers_trim (covers_mono subset_union_right hc)
  have h1 := tau_le_card hCF
  have h2 := tau_le_card hCK
  have hcd : Disjoint (C ∩ support F) (C ∩ support K) := hd.mono inter_subset_right inter_subset_right
  have hsub : (C ∩ support F) ∪ (C ∩ support K) ⊆ C := union_subset inter_subset_left inter_subset_left
  have hle := card_le_card hsub
  rw [card_union_of_disjoint hcd] at hle
  omega

theorem support_union (F K : Finset (Finset V)) : support (F ∪ K) = support F ∪ support K := by
  classical
  ext e
  simp only [support, mem_biUnion, mem_union]
  constructor
  · rintro ⟨t, ht | ht, he⟩
    · exact Or.inl ⟨t, ht, he⟩
    · exact Or.inr ⟨t, ht, he⟩
  · rintro (⟨t, ht, he⟩ | ⟨t, ht, he⟩)
    · exact ⟨t, Or.inl ht, he⟩
    · exact ⟨t, Or.inr ht, he⟩

theorem nu_biUnion_eq {I : Type*} [DecidableEq I] (K : Finset I)
    (f : I → Finset (Finset V)) (hf : ∀ k ∈ K, Triangles (f k))
    (hd : ∀ k ∈ K, ∀ l ∈ K, k ≠ l → Disjoint (support (f k)) (support (f l))) :
    nu (K.biUnion f) = ∑ k ∈ K, nu (f k) := by
  classical
  induction K using Finset.induction_on with
  | empty => simp
  | @insert k K hk ih =>
    have hK : ∀ a ∈ K, Triangles (f a) := fun a ha => hf a (mem_insert_of_mem ha)
    have hdK := fun a ha b hb hab => hd a (mem_insert_of_mem ha) b (mem_insert_of_mem hb) hab
    have hcross : Disjoint (support (f k)) (support (K.biUnion f)) := by
      apply disjoint_left.mpr
      intro e he hek
      obtain ⟨t, ht, het⟩ := mem_biUnion.mp hek
      obtain ⟨l, hl, htl⟩ := mem_biUnion.mp ht
      exact disjoint_left.mp (hd k (mem_insert_self _ _) l (mem_insert_of_mem hl)
        (by intro h; subst l; exact hk hl)) he (mem_biUnion.mpr ⟨t, htl, het⟩)
    rw [biUnion_insert, nu_union_eq (hf k (mem_insert_self _ _)) hcross, ih hK hdK, sum_insert hk]

theorem tau_biUnion_eq {I : Type*} [DecidableEq I] (K : Finset I)
    (f : I → Finset (Finset V)) (hf : ∀ k ∈ K, Triangles (f k))
    (hd : ∀ k ∈ K, ∀ l ∈ K, k ≠ l → Disjoint (support (f k)) (support (f l))) :
    tau (K.biUnion f) = ∑ k ∈ K, tau (f k) := by
  classical
  induction K using Finset.induction_on with
  | empty => simp
  | @insert k K hk ih =>
    have hK : ∀ a ∈ K, Triangles (f a) := fun a ha => hf a (mem_insert_of_mem ha)
    have hdK := fun a ha b hb hab => hd a (mem_insert_of_mem ha) b (mem_insert_of_mem hb) hab
    have hvalid : Triangles (K.biUnion f) := by
      intro t ht
      obtain ⟨l, hl, htl⟩ := mem_biUnion.mp ht
      exact hK l hl t htl
    have hcross : Disjoint (support (f k)) (support (K.biUnion f)) := by
      apply disjoint_left.mpr
      intro e he hek
      obtain ⟨t, ht, het⟩ := mem_biUnion.mp hek
      obtain ⟨l, hl, htl⟩ := mem_biUnion.mp ht
      exact disjoint_left.mp (hd k (mem_insert_self _ _) l (mem_insert_of_mem hl)
        (by intro h; subst l; exact hk hl)) he (mem_biUnion.mpr ⟨t, htl, het⟩)
    rw [biUnion_insert, tau_union_eq (hf k (mem_insert_self _ _)) hvalid hcross,
      ih hK hdK, sum_insert hk]

end Tuza06
