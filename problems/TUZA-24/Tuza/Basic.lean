import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Data.Finset.Powerset
import Mathlib.Order.Lattice.Nat
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-! Finite triangle families, with edges represented by two-element vertex sets.
The parameters are actual extremal cardinalities, not abstract functions with assumed laws. -/
namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

def edges (s : Finset V) : Finset (Finset V) := s.powersetCard 2

@[simp] theorem mem_edges {e s : Finset V} : e ∈ edges s ↔ e ⊆ s ∧ e.card = 2 :=
  mem_powersetCard

theorem edges_mono {s t : Finset V} (h : s ⊆ t) : edges s ⊆ edges t := by
  intro e he
  exact mem_edges.mpr ⟨(mem_edges.mp he).1.trans h, (mem_edges.mp he).2⟩

theorem edges_nonempty {s : Finset V} (h : 2 ≤ s.card) : (edges s).Nonempty := by
  obtain ⟨e, hes, he⟩ := exists_subset_card_eq h
  exact ⟨e, mem_edges.mpr ⟨hes, he⟩⟩

def Independent (P : Finset (Finset V)) : Prop :=
  ∀ s ∈ P, ∀ t ∈ P, s ≠ t → Disjoint (edges s) (edges t)

def Packing (F P : Finset (Finset V)) : Prop := P ⊆ F ∧ Independent P

noncomputable def nu (F : Finset (Finset V)) : ℕ := by
  classical
  exact (F.powerset.filter Independent).sup Finset.card

def Covers (F : Finset (Finset V)) (C : Finset (Finset V)) : Prop :=
  ∀ t ∈ F, ∃ e ∈ C, e ∈ edges t

noncomputable def tau (F : Finset (Finset V)) : ℕ :=
  sInf {n : ℕ | ∃ C : Finset (Finset V), Covers F C ∧ C.card = n}

def Triangles (F : Finset (Finset V)) : Prop := ∀ t ∈ F, t.card = 3

theorem packing_empty (F : Finset (Finset V)) : Packing F ∅ := by
  simp [Packing, Independent]

theorem packing_card_le {F P : Finset (Finset V)} (h : Packing F P) : P.card ≤ nu F := by
  classical
  exact le_sup (mem_filter.mpr ⟨mem_powerset.mpr h.1, h.2⟩)

theorem exists_max_packing (F : Finset (Finset V)) :
    ∃ P, Packing F P ∧ P.card = nu F := by
  classical
  have hn : (F.powerset.filter Independent).Nonempty := by
    refine ⟨∅, mem_filter.mpr ⟨mem_powerset.mpr (empty_subset _), ?_⟩⟩
    simp [Independent]
  obtain ⟨P, hP, hc⟩ := exists_mem_eq_sup _ hn Finset.card
  exact ⟨P, ⟨mem_powerset.mp (mem_filter.mp hP).1, (mem_filter.mp hP).2⟩, hc.symm⟩

theorem packing_mono {F K P : Finset (Finset V)} (h : F ⊆ K) (hp : Packing F P) :
    Packing K P := ⟨hp.1.trans h, hp.2⟩

theorem nu_mono {F K : Finset (Finset V)} (h : F ⊆ K) : nu F ≤ nu K := by
  obtain ⟨P, hp, hc⟩ := exists_max_packing F
  rw [← hc]
  exact packing_card_le (packing_mono h hp)

theorem covers_mono {F K C : Finset (Finset V)} (h : F ⊆ K) (hc : Covers K C) :
    Covers F C := fun t ht => hc t (h ht)

theorem tau_le_card {F C : Finset (Finset V)} (hc : Covers F C) : tau F ≤ C.card :=
  Nat.sInf_le ⟨C, hc, rfl⟩

theorem exists_cover {F : Finset (Finset V)} (hf : Triangles F) :
    ∃ C, Covers F C := by
  classical
  refine ⟨F.biUnion edges, ?_⟩
  intro t ht
  obtain ⟨e, he⟩ := edges_nonempty (by rw [hf t ht]; decide)
  exact ⟨e, mem_biUnion.mpr ⟨t, ht, he⟩, he⟩

theorem exists_min_cover {F : Finset (Finset V)} (hf : Triangles F) :
    ∃ C, Covers F C ∧ C.card = tau F := by
  obtain ⟨C, hc⟩ := exists_cover hf
  have hn : {n : ℕ | ∃ D : Finset (Finset V), Covers F D ∧ D.card = n}.Nonempty :=
    ⟨C.card, C, hc, rfl⟩
  exact Nat.sInf_mem hn

theorem triangles_mono {F K : Finset (Finset V)} (h : F ⊆ K) (hk : Triangles K) :
    Triangles F := fun t ht => hk t (h ht)

theorem tau_mono {F K : Finset (Finset V)} (h : F ⊆ K) (hk : Triangles K) :
    tau F ≤ tau K := by
  obtain ⟨C, hc, he⟩ := exists_min_cover hk
  rw [← he]
  exact tau_le_card (covers_mono h hc)

theorem covers_union {F K C D : Finset (Finset V)}
    (hc : Covers F C) (hd : Covers K D) : Covers (F ∪ K) (C ∪ D) := by
  intro t ht
  rcases mem_union.mp ht with ht | ht
  · obtain ⟨e, he, het⟩ := hc t ht
    exact ⟨e, mem_union_left _ he, het⟩
  · obtain ⟨e, he, het⟩ := hd t ht
    exact ⟨e, mem_union_right _ he, het⟩

theorem tau_union_le {F K : Finset (Finset V)} (hf : Triangles F) (hk : Triangles K) :
    tau (F ∪ K) ≤ tau F + tau K := by
  obtain ⟨C, hc, hC⟩ := exists_min_cover hf
  obtain ⟨D, hd, hD⟩ := exists_min_cover hk
  calc
    tau (F ∪ K) ≤ (C ∪ D).card := tau_le_card (covers_union hc hd)
    _ ≤ C.card + D.card := card_union_le _ _
    _ = tau F + tau K := by rw [hC, hD]

theorem independent_mono {P Q : Finset (Finset V)} (h : P ⊆ Q) (hq : Independent Q) :
    Independent P := fun s hs t ht hne => hq s (h hs) t (h ht) hne

theorem packing_singleton {F : Finset (Finset V)} {t : Finset V} (ht : t ∈ F) :
    Packing F {t} := by
  constructor
  · simpa using ht
  · intro s hs u hu hne
    simp only [mem_singleton] at hs hu
    exact (hne (hs.trans hu.symm)).elim

theorem nu_pos {F : Finset (Finset V)} (hf : F.Nonempty) : 1 ≤ nu F := by
  obtain ⟨t, ht⟩ := hf
  simpa using packing_card_le (packing_singleton ht)

theorem packing_union {F K P Q : Finset (Finset V)}
    (hp : Packing F P) (hq : Packing K Q)
    (hc : ∀ p ∈ P, ∀ q ∈ Q, Disjoint (edges p) (edges q)) :
    Packing (F ∪ K) (P ∪ Q) := by
  constructor
  · exact union_subset_union hp.1 hq.1
  · intro s hs t ht hne
    rcases mem_union.mp hs with hs | hs <;> rcases mem_union.mp ht with ht | ht
    · exact hp.2 s hs t ht hne
    · exact hc s hs t ht
    · exact (hc t ht s hs).symm
    · exact hq.2 s hs t ht hne

theorem cross_disjoint {P Q : Finset (Finset V)} (hp : Triangles P)
    (hc : ∀ p ∈ P, ∀ q ∈ Q, Disjoint (edges p) (edges q)) : Disjoint P Q := by
  apply disjoint_left.mpr
  intro t ht hq
  have hh : edges t = ∅ := disjoint_self.mp (hc t ht t hq)
  have hn := edges_nonempty (s := t) (by rw [hp t ht]; decide)
  exact hn.ne_empty hh

theorem nu_union_lower {F K P : Finset (Finset V)}
    (hf : Triangles F) (hp : Packing F P)
    (hc : ∀ p ∈ P, ∀ q ∈ K, Disjoint (edges p) (edges q)) :
    P.card + nu K ≤ nu (F ∪ K) := by
  obtain ⟨Q, hq, hQ⟩ := exists_max_packing K
  have hc' := fun p hp q hq' => hc p hp q (hq.1 hq')
  have hd := cross_disjoint (triangles_mono hp.1 hf) hc'
  have hu := packing_card_le (packing_union hp hq hc')
  rw [card_union_of_disjoint hd, hQ] at hu
  exact hu

noncomputable def support (F : Finset (Finset V)) : Finset (Finset V) := by
  classical
  exact F.biUnion edges

/-- Unused sets and nongraph edges can always be removed from a cover. -/
theorem covers_trim {F C : Finset (Finset V)} (hc : Covers F C) :
    Covers F (C ∩ support F) := by
  classical
  intro t ht
  obtain ⟨e, heC, het⟩ := hc t ht
  exact ⟨e, mem_inter.mpr ⟨heC, mem_biUnion.mpr ⟨t, ht, het⟩⟩, het⟩

theorem exists_min_cover_supported {F : Finset (Finset V)} (hf : Triangles F) :
    ∃ C, Covers F C ∧ C.card = tau F ∧ C ⊆ support F := by
  classical
  obtain ⟨C, hc, hC⟩ := exists_min_cover hf
  have htrim := covers_trim hc
  have hle := tau_le_card htrim
  have hge := card_le_card (inter_subset_left (s₁ := C) (s₂ := support F))
  refine ⟨C ∩ support F, htrim, ?_, inter_subset_right⟩
  omega

theorem nu_le_of_packings {F : Finset (Finset V)} {n : ℕ}
    (h : ∀ P ∈ F.powerset, Independent P → P.card ≤ n) : nu F ≤ n := by
  obtain ⟨P, hp, hP⟩ := exists_max_packing F
  rw [← hP]
  exact h P (mem_powerset.mpr hp.1) hp.2

theorem le_tau_of_covers {F : Finset (Finset V)} {n : ℕ} (hf : Triangles F)
    (h : ∀ C ∈ (support F).powerset, Covers F C → n ≤ C.card) : n ≤ tau F := by
  obtain ⟨C, hc, hC, hs⟩ := exists_min_cover_supported hf
  rw [← hC]
  exact h C (mem_powerset.mpr hs) hc

@[simp] theorem nu_empty : nu (∅ : Finset (Finset V)) = 0 := by
  obtain ⟨P, hp, hP⟩ := exists_max_packing (∅ : Finset (Finset V))
  have he : P = ∅ := subset_empty.mp hp.1
  simpa [he] using hP.symm

@[simp] theorem tau_empty : tau (∅ : Finset (Finset V)) = 0 := by
  have hc : Covers (∅ : Finset (Finset V)) ∅ := by simp [Covers]
  exact Nat.eq_zero_of_le_zero (tau_le_card hc)

end Tuza
