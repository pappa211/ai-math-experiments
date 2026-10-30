import Tuza06.Statement
import Tuza06.FiniteCliques

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A page is any vertex triple with a base edge in A. There is no bound on,
or prescribed list of, outside vertices. -/
def HasBase (A q : Finset V) : Prop := ∃ e ∈ edges A, e ∈ edges q

theorem independent_clique_inter {H : SimpleGraph V} {A k : Finset V}
    (hA : IndependentVertices H A) (hk : H.IsClique (k : Set V)) :
    (k ∩ A).card ≤ 1 := by
  apply card_le_one.mpr
  intro a ha b hb
  by_contra hab
  exact hA a (mem_inter.mp ha).2 b (mem_inter.mp hb).2
    (hk (mem_inter.mp ha).1 (mem_inter.mp hb).1 hab)

theorem page_not_subset_clique {H : SimpleGraph V} {A k q : Finset V}
    (hA : IndependentVertices H A) (hk : H.IsClique (k : Set V))
    (hq : HasBase A q) : ¬ q ⊆ k := by
  intro hqk
  obtain ⟨e, heA, heq⟩ := hq
  have hesub : e ⊆ k ∩ A := subset_inter ((mem_edges.mp heq).1.trans hqk) (mem_edges.mp heA).1
  have hle := card_le_card hesub
  have hb := independent_clique_inter hA hk
  rw [(mem_edges.mp heA).2] at hle
  omega

theorem edges_inter (q k : Finset V) : edges q ∩ edges k = edges (q ∩ k) := by
  ext e
  simp only [mem_inter, mem_edges, subset_inter_iff]
  tauto

/-- A triple not contained in k has at most one edge lying inside k. -/
theorem triple_edge_overlap {q k : Finset V} (hq : q.card = 3) (hnot : ¬ q ⊆ k) :
    (edges q ∩ edges k).card ≤ 1 := by
  have hne : q ∩ k ≠ q := by
    intro h
    exact hnot (h ▸ inter_subset_right)
  have hlt : (q ∩ k).card < q.card := card_lt_card (Finset.ssubset_iff_subset_ne.mpr ⟨inter_subset_left, hne⟩)
  have hcases : (q ∩ k).card = 0 ∨ (q ∩ k).card = 1 ∨ (q ∩ k).card = 2 := by omega
  rw [edges_inter, edges, card_powersetCard]
  rcases hcases with h | h | h <;> simp [h]

theorem two_page_footprint {H : SimpleGraph V} {A k s t : Finset V}
    (hA : IndependentVertices H A) (hk : H.IsClique (k : Set V))
    (hs : s.card = 3) (ht : t.card = 3) (hbs : HasBase A s) (hbt : HasBase A t) :
    ((edges s ∪ edges t) ∩ edges k).card ≤ 2 := by
  have h1 := triple_edge_overlap hs (page_not_subset_clique hA hk hbs)
  have h2 := triple_edge_overlap ht (page_not_subset_clique hA hk hbt)
  have he : (edges s ∪ edges t) ∩ edges k =
      (edges s ∩ edges k) ∪ (edges t ∩ edges k) := union_inter_distrib_right _ _ _
  rw [he]
  exact (card_union_le _ _).trans (by omega)

theorem cliqueFamily_subset_triangles {H : SimpleGraph V} {k : Finset V}
    (hk : H.IsClique (k : Set V)) : cliqueFamily k ⊆ triangles H := by
  intro t ht
  obtain ⟨htk, hc⟩ := mem_powersetCard.mp ht
  exact mem_triangles.mpr ⟨fun _ ha _ hb hab => hk (htk ha) (htk hb) hab, hc⟩

/-- The geometric compatibility step for an arbitrary residual K4 or K5 block.
The two pages need not be graph triangles of H, and their apices are unrestricted. -/
theorem clique_avoid_two_pages {H : SimpleGraph V} {A k s t : Finset V}
    (hA : IndependentVertices H A) (hk : H.IsClique (k : Set V))
    (hsize : k.card = 4 ∨ k.card = 5)
    (hs : s.card = 3) (ht : t.card = 3) (hbs : HasBase A s) (hbt : HasBase A t) :
    ∃ P, Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧
      Disjoint (support P) (edges s ∪ edges t) := by
  classical
  rcases hsize with h4 | h5
  · obtain ⟨p, hpk, hpH, hpA⟩ := k4_face_avoiding hA ⟨hk, h4⟩
    have hp : p ∈ cliqueFamily k := mem_powersetCard.mpr ⟨hpk, (mem_triangles.mp hpH).card_eq⟩
    have hds : Disjoint (edges p) (edges s) := avoid_new_triangle hpA hs hbs
    have hdt : Disjoint (edges p) (edges t) := avoid_new_triangle hpA ht hbt
    refine ⟨{p}, packing_singleton hp, ?_, ?_⟩
    · simp [(k4_parameters h4).1]
    · simpa [support] using disjoint_union_right.mpr ⟨hds, hdt⟩
  · let D := (edges s ∪ edges t) ∩ edges k
    obtain ⟨P, hP, hcP, hdP⟩ := k5_avoid_two h5 (D := D) inter_subset_right
      (two_page_footprint hA hk hs ht hbs hbt)
    refine ⟨P, hP, hcP.trans (k5_parameters h5).1.symm, ?_⟩
    apply disjoint_left.mpr
    intro e heP hepage
    obtain ⟨p, hp, hep⟩ := mem_biUnion.mp heP
    have hpk : p ⊆ k := (mem_powersetCard.mp (hP.1 hp)).1
    have heD : e ∈ D := mem_inter.mpr ⟨hepage, edges_mono hpk hep⟩
    exact disjoint_left.mp hdP heP heD

end Tuza06
