import Tuza06.Pages
import Tuza06.Additivity
import Mathlib.Algebra.BigOperators.Ring.Finset

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem blocks_support_subset (k : Finset V) : support (cliqueFamily k) ⊆ edges k := by
  classical
  intro e he
  obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
  exact edges_mono (mem_powersetCard.mp ht).1 het

theorem blocks_support_disjoint {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k l : Finset V}
    (hk : k ∈ K) (hl : l ∈ K) (hkl : k ≠ l) :
    Disjoint (support (cliqueFamily k)) (support (cliqueFamily l)) :=
  (hK.independent k hk l hl hkl).mono (blocks_support_subset k) (blocks_support_subset l)

theorem blocks_triangles_eq {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) : triangles H = K.biUnion cliqueFamily := by
  classical
  ext t
  constructor
  · intro ht
    obtain ⟨k, hk, htk⟩ := hK.exhaustive t ht
    exact mem_biUnion.mpr ⟨k, hk, mem_powersetCard.mpr ⟨htk, (mem_triangles.mp ht).card_eq⟩⟩
  · intro ht
    obtain ⟨k, hk, htk⟩ := mem_biUnion.mp ht
    exact cliqueFamily_subset_triangles (hK.clique k hk) htk

theorem blocks_nu {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) : nu (triangles H) = ∑ k ∈ K, nu (cliqueFamily k) := by
  rw [blocks_triangles_eq hK]
  exact nu_biUnion_eq K cliqueFamily (fun k _ => cliqueFamily_valid k)
    (fun _ hk _ hl hkl => blocks_support_disjoint hK hk hl hkl)

theorem blocks_tau {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) : tau (triangles H) = ∑ k ∈ K, tau (cliqueFamily k) := by
  rw [blocks_triangles_eq hK]
  exact tau_biUnion_eq K cliqueFamily (fun k _ => cliqueFamily_valid k)
    (fun _ hk _ hl hkl => blocks_support_disjoint hK hk hl hkl)

theorem blocks_equality {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) : tau (triangles H) = 2 * nu (triangles H) := by
  rw [blocks_tau hK, blocks_nu hK, mul_sum]
  apply sum_congr rfl
  intro k hk
  rcases hK.size k hk with h4 | h5
  · rw [(k4_parameters h4).1, (k4_parameters h4).2]; decide
  · rw [(k5_parameters h5).1, (k5_parameters h5).2]; decide

/-- Combine actual local packings over edge-disjoint blocks, even if the blocks
share vertices. -/
theorem blocks_combine_packings {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) (f : Finset V → Finset (Finset V))
    (hf : ∀ k ∈ K, Packing (cliqueFamily k) (f k)) :
    Packing (triangles H) (K.biUnion f) := by
  classical
  constructor
  · intro t ht
    obtain ⟨k, hk, htk⟩ := mem_biUnion.mp ht
    exact cliqueFamily_subset_triangles (hK.clique k hk) ((hf k hk).1 htk)
  · intro s hs t ht hst
    obtain ⟨k, hk, hsk⟩ := mem_biUnion.mp hs
    obtain ⟨l, hl, htl⟩ := mem_biUnion.mp ht
    by_cases hkl : k = l
    · subst l
      exact (hf k hk).2 s hsk t htl hst
    · exact (hK.independent k hk l hl hkl).mono
        (edges_mono (mem_powersetCard.mp ((hf k hk).1 hsk)).1)
        (edges_mono (mem_powersetCard.mp ((hf l hl).1 htl)).1)

theorem blocks_packing_card {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) (f : Finset V → Finset (Finset V))
    (hf : ∀ k ∈ K, Packing (cliqueFamily k) (f k)) :
    (K.biUnion f).card = ∑ k ∈ K, (f k).card := by
  classical
  apply card_biUnion
  intro k hk l hl hkl
  apply cross_disjoint (triangles_mono (hf k hk).1 (cliqueFamily_valid k))
  intro s hs t ht
  exact (hK.independent k hk l hl hkl).mono
    (edges_mono (mem_powersetCard.mp ((hf k hk).1 hs)).1)
    (edges_mono (mem_powersetCard.mp ((hf l hl).1 ht)).1)

/-- A maximum residual packing avoiding two arbitrary external pages.
All finite simple residual graphs and all page apices are quantified over here. -/
theorem blocks_avoid_two_pages {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {A s t : Finset V}
    (hA : IndependentVertices H A) (hs : s.card = 3) (ht : t.card = 3)
    (hbs : HasBase A s) (hbt : HasBase A t) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧
      Disjoint (support P) (edges s ∪ edges t) := by
  classical
  have hex : ∀ k : Finset V, ∃ P : Finset (Finset V), k ∈ K →
      Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧
      Disjoint (support P) (edges s ∪ edges t) := by
    intro k
    by_cases hk : k ∈ K
    · obtain ⟨P, hp, hc, hd⟩ := clique_avoid_two_pages hA (hK.clique k hk)
        (hK.size k hk) hs ht hbs hbt
      exact ⟨P, fun _ => ⟨hp, hc, hd⟩⟩
    · exact ⟨∅, fun h => (hk h).elim⟩
  choose f hf using hex
  have hpack := fun k hk => (hf k hk).1
  refine ⟨K.biUnion f, blocks_combine_packings hK f hpack, ?_, ?_⟩
  · rw [blocks_packing_card hK f hpack, blocks_nu hK]
    exact sum_congr rfl (fun k hk => (hf k hk).2.1)
  · apply disjoint_left.mpr
    intro e he hepage
    obtain ⟨p, hp, hep⟩ := mem_biUnion.mp he
    obtain ⟨k, hk, hpk⟩ := mem_biUnion.mp hp
    exact disjoint_left.mp (hf k hk).2.2 (mem_biUnion.mpr ⟨p, hpk, hep⟩) hepage

end Tuza06
