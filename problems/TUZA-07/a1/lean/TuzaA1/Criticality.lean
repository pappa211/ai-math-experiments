import TuzaA1.Elementary

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem proper_deletion_tuza {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {S : Finset (Finset V)} (hne : S.Nonempty) (hs : ∀ e ∈ S, G.IsNClique 2 e) :
    tau (triangles (removeEdgeFamily G S)) ≤ 2 * nu (triangles (removeEdgeFamily G S)) := by
  obtain ⟨e,he⟩ := hne
  exact hG.2 _ (remove_strict (hs e he) he)

theorem edge_criticality {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {e : Finset V} (he : G.IsNClique 2 e) :
    nu (triangles (removeEdgeFamily G {e})) = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily G {e})) = 2 * nu (triangles G) ∧
    tau (triangles G) = 2 * nu (triangles G) + 1 := by
  have hmin := hG.2 _ (remove_strict he (mem_singleton_self e))
  have hcov := tau_le_remove_add G {e}
  have hmono := nu_remove_le G {e}
  have hbad := hG.1
  simp only [card_singleton] at hcov
  omega

theorem edge_in_triangle {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {e : Finset V} (he : G.IsNClique 2 e) : ∃ T ∈ triangles G, e ∈ edges T := by
  classical
  by_contra hn
  have ht : triangles (removeEdgeFamily G {e}) = triangles G := by
    apply Subset.antisymm (triangles_mono_graph (removeEdgeFamily_le G {e}))
    intro t ht
    apply mem_triangles_remove.mpr
    exact ⟨ht, disjoint_left.mpr (fun f hf hfe => hn ⟨t,ht,(mem_singleton.mp hfe) ▸ hf⟩)⟩
  have hc := edge_criticality hG he
  rw [ht] at hc
  omega

theorem minimal_has_triangle {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G) :
    (triangles G).Nonempty := by
  classical
  by_contra hn
  have he : triangles G = ∅ := not_nonempty_iff_eq_empty.mp hn
  have hb := hG.1
  simp [he] at hb

theorem minimal_tau {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G) :
    tau (triangles G) = 2 * nu (triangles G) + 1 := by
  obtain ⟨T,hT⟩ := minimal_has_triangle hG
  obtain ⟨e,he⟩ := edges_nonempty (s := T) (by rw [triangles_valid G T hT]; decide)
  exact (edge_criticality hG (actual_edge_of_triangle hT he)).2.2

/-- Equivalent to the printed floor bound, with the exact natural side conditions. -/
theorem resilience_arithmetic_iff {k r s : ℕ} (hr : r ≤ k) (hs : 0 < s) :
    k - r ≤ (s - 1) / 2 ↔ 2 * k + 1 ≤ 2 * r + s := by omega

theorem deletion_resilience_linear {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {S : Finset (Finset V)} (hne : S.Nonempty) (hs : ∀ e ∈ S, G.IsNClique 2 e) :
    2 * nu (triangles G) + 1 ≤
      2 * nu (triangles (removeEdgeFamily G S)) + S.card := by
  have hb := hG.1
  have hc := tau_le_remove_add G S
  have hm := proper_deletion_tuza hG hne hs
  omega

theorem deletion_resilience {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {S : Finset (Finset V)} (hne : S.Nonempty) (hs : ∀ e ∈ S, G.IsNClique 2 e) :
    nu (triangles G) - nu (triangles (removeEdgeFamily G S)) ≤ (S.card - 1) / 2 :=
  (resilience_arithmetic_iff (nu_remove_le G S) (card_pos.mpr hne)).mpr
    (deletion_resilience_linear hG hne hs)

theorem small_deletion_nu {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {S : Finset (Finset V)} (hcard : S.card ≤ 2) (hs : ∀ e ∈ S, G.IsNClique 2 e) :
    nu (triangles (removeEdgeFamily G S)) = nu (triangles G) := by
  classical
  by_cases hn : S.Nonempty
  · have hl := deletion_resilience_linear hG hn hs
    have hm := nu_remove_le G S
    omega
  · rw [not_nonempty_iff_eq_empty.mp hn, remove_empty]
end TuzaA1
