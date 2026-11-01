import TuzaA1.Targets
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

@[simp] theorem remove_empty (G : SimpleGraph V) : removeEdgeFamily G ∅ = G := by
  ext a b
  simp [removeEdgeFamily]

theorem remove_union (G : SimpleGraph V) (S D : Finset (Finset V)) :
    removeEdgeFamily (removeEdgeFamily G S) D = removeEdgeFamily G (S ∪ D) := by
  ext a b
  simp [removeEdgeFamily, and_assoc]

theorem remove_edges_eq_deleteTriangle (G : SimpleGraph V) (T : Finset V) :
    removeEdgeFamily G (edges T) = deleteTriangle G T := by
  ext a b
  constructor
  · rintro ⟨hab, hnot⟩
    refine ⟨hab, fun ht => hnot ?_⟩
    exact mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff] using ht,
      by simp [G.ne_of_adj hab]⟩
  · rintro ⟨hab, hnot⟩
    exact ⟨hab, fun he => hnot ⟨(mem_edges.mp he).1 (by simp),
      (mem_edges.mp he).1 (by simp)⟩⟩

theorem mem_triangles_remove {G : SimpleGraph V} {S : Finset (Finset V)} {T : Finset V} :
    T ∈ triangles (removeEdgeFamily G S) ↔ T ∈ triangles G ∧ Disjoint (edges T) S := by
  constructor
  · intro ht
    exact ⟨triangles_mono_graph (removeEdgeFamily_le G S) ht,
      disjoint_left.mpr (fun e he => removeEdgeFamily_surviving ht he)⟩
  · rintro ⟨ht, hd⟩
    by_contra hn
    obtain ⟨e, heS, heT⟩ := removeEdgeFamily_lost ht hn
    exact disjoint_left.mp hd heT heS

theorem actual_edge_of_triangle {G : SimpleGraph V} {T e : Finset V}
    (ht : T ∈ triangles G) (he : e ∈ edges T) : G.IsNClique 2 e :=
  supported_edge_is_graph_edge (mem_biUnion.mpr ⟨T, ht, he⟩)

theorem actual_edge_remove {G : SimpleGraph V} {S : Finset (Finset V)} {e : Finset V}
    (he : G.IsNClique 2 e) (hn : e ∉ S) : (removeEdgeFamily G S).IsNClique 2 e := by
  refine ⟨?_, he.card_eq⟩
  intro a ha b hb hab
  refine ⟨he.isClique ha hb hab, ?_⟩
  have hp : ({a,b} : Finset V) = e := eq_of_subset_of_card_le
    (by simpa only [insert_subset_iff, singleton_subset_iff, Finset.mem_coe] using And.intro ha hb)
    (by simp [hab, he.card_eq])
  simpa [hp] using hn

theorem remove_strict {G : SimpleGraph V} {S : Finset (Finset V)} {e : Finset V}
    (he : G.IsNClique 2 e) (heS : e ∈ S) : removeEdgeFamily G S < G := by
  refine lt_iff_le_not_ge.mpr ⟨removeEdgeFamily_le G S, ?_⟩
  intro hback
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp he.card_eq
  have hg := he.isClique (show a ∈ e by rw [heq]; simp)
    (show b ∈ e by rw [heq]; simp) hab
  exact (hback hg).2 (heq ▸ heS)

/-- A graph-edge cover witness, not a cover paid for with ambient nonedges. -/
theorem graph_cover_extension {G : SimpleGraph V} {S : Finset (Finset V)}
    (hs : ∀ e ∈ S, G.IsNClique 2 e) :
    ∃ C, Covers (triangles G) C ∧ (∀ e ∈ C, G.IsNClique 2 e) ∧
      C.card ≤ tau (triangles (removeEdgeFamily G S)) + S.card := by
  classical
  obtain ⟨C,hc,hcard,hactual⟩ := graph_min_cover (removeEdgeFamily G S)
  refine ⟨C ∪ S, ?_, ?_, ?_⟩
  · intro t ht
    by_cases hr : t ∈ triangles (removeEdgeFamily G S)
    · obtain ⟨e,he,het⟩ := hc t hr
      exact ⟨e,mem_union_left _ he,het⟩
    · obtain ⟨e,he,het⟩ := removeEdgeFamily_lost ht hr
      exact ⟨e,mem_union_right _ he,het⟩
  · intro e he
    rcases mem_union.mp he with he | he
    · exact (hactual e he).mono (removeEdgeFamily_le G S)
    · exact hs e he
  · simpa [hcard] using card_union_le C S

/-- The unconditional cover loss inequality even for an arbitrary deletion family. -/
theorem tau_le_remove_add (G : SimpleGraph V) (S : Finset (Finset V)) :
    tau (triangles G) ≤ tau (triangles (removeEdgeFamily G S)) + S.card := by
  classical
  obtain ⟨C,hc,hcard⟩ := exists_min_cover (triangles_valid (removeEdgeFamily G S))
  have hcov : Covers (triangles G) (C ∪ S) := by
    intro t ht
    by_cases hr : t ∈ triangles (removeEdgeFamily G S)
    · obtain ⟨e,he,het⟩ := hc t hr
      exact ⟨e,mem_union_left _ he,het⟩
    · obtain ⟨e,he,het⟩ := removeEdgeFamily_lost ht hr
      exact ⟨e,mem_union_right _ he,het⟩
  exact (tau_le_card hcov).trans (by simpa [hcard] using card_union_le C S)

theorem nu_remove_le (G : SimpleGraph V) (S : Finset (Finset V)) :
    nu (triangles (removeEdgeFamily G S)) ≤ nu (triangles G) :=
  nu_mono (triangles_mono_graph (removeEdgeFamily_le G S))

theorem edges_triangle_card {T : Finset V} (ht : T.card = 3) : (edges T).card = 3 := by
  rw [edges, card_powersetCard, ht]
  decide

theorem packing_support_card {G : SimpleGraph V} {P : Finset (Finset V)}
    (hp : Packing (triangles G) P) : (support P).card = 3 * P.card := by
  classical
  have hd : ∀ t ∈ P, ∀ u ∈ P, t ≠ u → Disjoint (edges t) (edges u) := hp.2
  unfold support
  rw [card_biUnion hd]
  calc
    ∑ t ∈ P, (edges t).card = ∑ _t ∈ P, 3 := sum_congr rfl (fun t ht =>
      edges_triangle_card ((mem_triangles.mp (hp.1 ht)).card_eq))
    _ = 3 * P.card := by simp [Nat.mul_comm]

theorem append_residual {G : SimpleGraph V} {P Q : Finset (Finset V)}
    (hp : Packing (triangles G) P)
    (hq : Packing (triangles (removeEdgeFamily G (support P))) Q) :
    Packing (triangles G) (P ∪ Q) ∧ (P ∪ Q).card = P.card + Q.card := by
  classical
  have hqG := packing_mono (triangles_mono_graph (removeEdgeFamily_le G (support P))) hq
  have hc : ∀ p ∈ P, ∀ q ∈ Q, Disjoint (edges p) (edges q) := by
    intro p hpm q hqm
    apply disjoint_left.mpr
    intro e hep heq
    exact removeEdgeFamily_surviving (hq.1 hqm) heq (mem_biUnion.mpr ⟨p,hpm,hep⟩)
  exact ⟨packing_mono (by simp) (packing_union hp hqG hc),
    card_union_of_disjoint (cross_disjoint (triangles_mono hp.1 (triangles_valid G)) hc)⟩

theorem packing_residual_bound {G : SimpleGraph V} {P : Finset (Finset V)}
    (hp : Packing (triangles G) P) :
    nu (triangles (removeEdgeFamily G (support P))) + P.card ≤ nu (triangles G) := by
  obtain ⟨Q,hq,hcard⟩ := exists_max_packing (triangles (removeEdgeFamily G (support P)))
  obtain ⟨hPQ,hPQcard⟩ := append_residual hp hq
  have hb := packing_card_le hPQ
  rw [hPQcard,hcard] at hb
  omega
end TuzaA1
