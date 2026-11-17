import Tuza23.CliqueChoice
import Tuza06.Components

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A footprint with at most one clique edge can be included in a minimum clique cover. -/
theorem clique_min_cover_footprint {k : Finset V} {D : Finset (Finset V)}
    (hsize : k.card = 4 ∨ k.card = 5) (hfoot : (D ∩ edges k).card ≤ 1) :
    ∃ C, Covers (cliqueFamily k) C ∧ C.card = tau (cliqueFamily k) ∧
      C ⊆ edges k ∧ D ∩ edges k ⊆ C := by
  classical
  by_cases hn : (D ∩ edges k).Nonempty
  · obtain ⟨e, he⟩ := hn
    obtain ⟨C, hc, hcard, hsub, heC⟩ :=
      clique_min_cover_containing hsize (mem_inter.mp he).2
    refine ⟨C, hc, hcard, hsub, ?_⟩
    intro f hf
    have hfe : f = e := card_le_one.mp hfoot f hf e he
    simpa [hfe] using heC
  · obtain ⟨C, hc, hcard, hsub⟩ := exists_min_cover_supported (cliqueFamily_valid k)
    refine ⟨C, hc, hcard, hsub.trans (blocks_support_subset k), ?_⟩
    rw [not_nonempty_iff_eq_empty.mp hn]
    exact empty_subset _

/-- Simultaneous minimum-cover choice over all actual clique components.
The prescribed family may include background edges; only supported members are included. -/
theorem blocks_min_cover_footprint {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {D : Finset (Finset V)}
    (hfoot : ∀ k ∈ K, (D ∩ edges k).card ≤ 1) :
    ∃ C, Covers (triangles H) C ∧ C.card = tau (triangles H) ∧
      C ⊆ support (triangles H) ∧ D ∩ support (triangles H) ⊆ C := by
  classical
  have hex : ∀ k : Finset V, ∃ C : Finset (Finset V), k ∈ K →
      Covers (cliqueFamily k) C ∧ C.card = tau (cliqueFamily k) ∧
        C ⊆ edges k ∧ D ∩ edges k ⊆ C := by
    intro k
    by_cases hk : k ∈ K
    · obtain ⟨C, hC⟩ := clique_min_cover_footprint (hK.size k hk) (hfoot k hk)
      exact ⟨C, fun _ => hC⟩
    · exact ⟨∅, fun he => (hk he).elim⟩
  choose f hf using hex
  refine ⟨K.biUnion f, ?_, ?_, ?_, ?_⟩
  · intro t ht
    obtain ⟨k, hk, htk⟩ := hK.exhaustive t ht
    have htF : t ∈ cliqueFamily k :=
      mem_powersetCard.mpr ⟨htk, (mem_triangles.mp ht).card_eq⟩
    obtain ⟨e, heC, het⟩ := (hf k hk).1 t htF
    exact ⟨e, mem_biUnion.mpr ⟨k, hk, heC⟩, het⟩
  · rw [card_biUnion, blocks_tau hK]
    · exact sum_congr rfl (fun k hk => (hf k hk).2.1)
    · intro k hk l hl hkl
      exact (hK.independent k hk l hl hkl).mono (hf k hk).2.2.1 (hf l hl).2.2.1
  · intro e he
    obtain ⟨k, hk, heC⟩ := mem_biUnion.mp he
    have hek := (hf k hk).2.2.1 heC
    have hk3 : 3 ≤ k.card := by rcases hK.size k hk with h4 | h5 <;> omega
    rw [← support_cliqueFamily hk3] at hek
    obtain ⟨t, ht, het⟩ := mem_biUnion.mp hek
    exact mem_biUnion.mpr ⟨t, cliqueFamily_subset_triangles (hK.clique k hk) ht, het⟩
  · intro e he
    obtain ⟨t, ht, het⟩ := mem_biUnion.mp (mem_inter.mp he).2
    obtain ⟨k, hk, htk⟩ := hK.exhaustive t ht
    have hek : e ∈ edges k := edges_mono htk het
    exact mem_biUnion.mpr ⟨k, hk, (hf k hk).2.2.2 (mem_inter.mpr ⟨(mem_inter.mp he).1, hek⟩)⟩

/-- Simultaneous maximum-packing choice avoiding a supported footprint of at most
one edge per actual clique component. Background prescribed edges cause no restriction. -/
theorem blocks_max_packing_footprint {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {D : Finset (Finset V)}
    (hfoot : ∀ k ∈ K, (D ∩ edges k).card ≤ 1) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧
      Disjoint (support P) D := by
  classical
  apply blocks_avoid_edges hK
  intro k hk
  refine ⟨by have h := hfoot k hk; omega, ?_⟩
  by_cases hn : (D ∩ edges k).Nonempty
  · obtain ⟨e, he⟩ := hn
    have he2 : e.card = 2 := (mem_edges.mp (mem_inter.mp he).2).2
    obtain ⟨a, ha⟩ := card_pos.mp (show 0 < e.card by omega)
    refine ⟨a, ?_⟩
    intro f hf
    have hfe : f = e := card_le_one.mp (hfoot k hk) f hf e he
    simpa [hfe] using ha
  · have hkpos : 0 < k.card := by rcases hK.size k hk with h4 | h5 <;> omega
    obtain ⟨a, _⟩ := card_pos.mp hkpos
    refine ⟨a, ?_⟩
    intro f hf
    exact (hn ⟨f, hf⟩).elim

end Tuza23
