import Tuza06.Components
import Tuza06.GraphOperations

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Any old edge of an external page lying entirely in B is its base edge.
This is a statement about arbitrary finite vertex sets, not bounded attachments. -/
theorem external_page_old_edge {B q f e : Finset V}
    (hq : q.card = 3) (hf : f ∈ edges q) (hfB : f ⊆ B) (hqout : ¬ q ⊆ B)
    (he : e ∈ edges q) (heB : e ⊆ B) : e = f := by
  have hne : q ∩ B ≠ q := by intro h; exact hqout (h ▸ inter_subset_right)
  have hlt : (q ∩ B).card < q.card :=
    card_lt_card (Finset.ssubset_iff_subset_ne.mpr ⟨inter_subset_left, hne⟩)
  have hfsub : f ⊆ q ∩ B := subset_inter (mem_edges.mp hf).1 hfB
  have hfeq : f = q ∩ B := eq_of_subset_of_card_le hfsub (by rw [(mem_edges.mp hf).2]; omega)
  have hef : e ⊆ f := by rw [hfeq]; exact subset_inter (mem_edges.mp he).1 heB
  exact eq_of_subset_of_card_le hef (by rw [(mem_edges.mp hf).2, (mem_edges.mp he).2])

theorem external_page_local_cross {B q f p : Finset V}
    (hq : q.card = 3) (hf : f ∈ edges q) (hfB : f ⊆ B) (hqout : ¬ q ⊆ B)
    (hpB : p ⊆ B) (hpf : f ∉ edges p) : Disjoint (edges p) (edges q) := by
  apply disjoint_left.mpr
  intro e hep heq
  have heB : e ⊆ B := (mem_edges.mp hep).1.trans hpB
  exact hpf ((external_page_old_edge hq hf hfB hqout heq heB) ▸ hep)

theorem packing_pair {F : Finset (Finset V)} {s t : Finset V}
    (hs : s ∈ F) (ht : t ∈ F) (hst : s ≠ t)
    (hd : Disjoint (edges s) (edges t)) : Packing F {s, t} := by
  constructor
  · simp only [insert_subset_iff, singleton_subset_iff]
    exact ⟨hs, ht⟩
  · intro a ha b hb hab
    simp only [mem_insert, mem_singleton] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact (hab rfl).elim
    · exact hd
    · exact hd.symm
    · exact (hab rfl).elim

/-- Symbolic augmentation by a local m-packing and two unrestricted external pages.
The residual maximum packing is constructed from its proven clique decomposition. -/
theorem two_page_augmentation {G : SimpleGraph V} {U A B : Finset V}
    (hB : B ⊆ U ∪ A) {K : Finset (Finset V)}
    (hK : CliqueDecomposition (prune G U A) K)
    {s t : Finset V} (hs : s ∈ triangles G) (ht : t ∈ triangles G)
    (hbs : HasBase A s) (hbt : HasBase A t)
    (hdst : Disjoint (edges s) (edges t))
    {Q : Finset (Finset V)} (hQ : Packing (triangles G) Q)
    (hQB : ∀ q ∈ Q, q ⊆ B)
    (hQs : ∀ q ∈ Q, Disjoint (edges q) (edges s))
    (hQt : ∀ q ∈ Q, Disjoint (edges q) (edges t)) :
    Q.card + 2 + nu (triangles (prune G U A)) ≤ nu (triangles G) := by
  classical
  let H := prune G U A
  have hs3 := (mem_triangles.mp hs).card_eq
  have ht3 := (mem_triangles.mp ht).card_eq
  have hst : s ≠ t := by
    intro he
    have hempty : edges s = ∅ := disjoint_self.mp (he ▸ hdst)
    exact (edges_nonempty (s := s) (by omega)).ne_empty hempty
  obtain ⟨R, hR, hcR, hdR⟩ := blocks_avoid_two_pages hK
    (prune_independent G U A) hs3 ht3 hbs hbt
  have hPair : Packing (triangles G) {s, t} := packing_pair hs ht hst hdst
  have hcrossQP : ∀ q ∈ Q, ∀ p ∈ ({s, t} : Finset (Finset V)),
      Disjoint (edges q) (edges p) := by
    intro q hq p hp
    rcases mem_insert.mp hp with rfl | hp
    · exact hQs q hq
    · exact (mem_singleton.mp hp) ▸ hQt q hq
  have hQP : Packing (triangles G) (Q ∪ {s, t}) :=
    packing_mono (by simp) (packing_union hQ hPair hcrossQP)
  have hdQP := cross_disjoint (triangles_mono hQ.1 (triangles_valid G)) hcrossQP
  have hcrossQR : ∀ q ∈ Q ∪ ({s, t} : Finset (Finset V)), ∀ r ∈ R,
      Disjoint (edges q) (edges r) := by
    intro q hq r hr
    rcases mem_union.mp hq with hq | hq
    · exact prune_local_cross hB (hQB q hq) (hR.1 hr)
    · apply disjoint_left.mpr
      intro e heq her
      have hesupp : e ∈ support R := mem_biUnion.mpr ⟨r, hr, her⟩
      have hepage : e ∈ edges s ∪ edges t := by
        rcases mem_insert.mp hq with rfl | hq
        · exact mem_union_left _ heq
        · exact mem_union_right _ ((mem_singleton.mp hq) ▸ heq)
      exact disjoint_left.mp hdR hesupp hepage
  have hRG : Packing (triangles G) R :=
    packing_mono (triangles_mono_graph (prune_le G U A)) hR
  have hAll : Packing (triangles G) ((Q ∪ {s, t}) ∪ R) :=
    packing_mono (by simp) (packing_union hQP hRG hcrossQR)
  have hdAll := cross_disjoint (triangles_mono hQP.1 (triangles_valid G)) hcrossQR
  have hle := packing_card_le hAll
  rw [card_union_of_disjoint hdAll, card_union_of_disjoint hdQP, hcR] at hle
  simpa only [card_pair hst] using hle

end Tuza06
