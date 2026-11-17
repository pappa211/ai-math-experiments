import Tuza06.Footprints

/-! Minimum clique covers with a prescribed edge, transported to arbitrary labels.
Finite checks below use the standard kernel's `decide`; no native evaluation. -/
namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 2400000

private theorem k4_cover_choice :
    ∀ e : ↥(edges (univ : Finset (Fin 4))),
      Covers (cliqueFamily univ) (insert e.val (edges (univ \ e.val))) ∧
      (insert e.val (edges (univ \ e.val))).card = 2 ∧
      insert e.val (edges (univ \ e.val)) ⊆ edges univ := by
  unfold Covers
  decide

private theorem k5_cover_choice :
    ∀ e : ↥(edges (univ : Finset (Fin 5))),
      Covers (cliqueFamily univ) (insert e.val (edges (univ \ e.val))) ∧
      (insert e.val (edges (univ \ e.val))).card = 4 ∧
      insert e.val (edges (univ \ e.val)) ⊆ edges univ := by
  unfold Covers
  decide

variable {V : Type*} [DecidableEq V]

/-- Lift an edge-choice cover theorem on a finite labelled clique to any embedding. -/
theorem clique_cover_choice_transport {n : ℕ} {k : Finset V}
    (hk : k.card = n)
    (hfinite : ∀ e ∈ edges (univ : Finset (Fin n)),
      ∃ C, Covers (cliqueFamily univ) C ∧
        C.card = tau (cliqueFamily (univ : Finset (Fin n))) ∧
        C ⊆ edges univ ∧ e ∈ C)
    {e : Finset V} (he : e ∈ edges k) :
    ∃ C, Covers (cliqueFamily k) C ∧ C.card = tau (cliqueFamily k) ∧
      C ⊆ edges k ∧ e ∈ C := by
  classical
  obtain ⟨f, hf⟩ := exists_fin_embedding k hk
  have hE : edges k = liftFamily f (edges univ) := by
    rw [← hf, edges_map]
  have hF : cliqueFamily k = liftFamily f (cliqueFamily univ) := by
    rw [← hf]
    exact powersetCard_map f 3 univ
  rw [hE] at he
  obtain ⟨a, ha, rfl⟩ := mem_liftFamily.mp he
  obtain ⟨C, hC, hc, hsub, haC⟩ := hfinite a ha
  refine ⟨liftFamily f C, ?_, ?_, ?_, mem_liftFamily.mpr ⟨a, haC, rfl⟩⟩
  · rw [hF]
    exact (covers_liftFamily f _ _).mpr hC
  · rw [card_liftFamily, hF, tau_liftFamily f (cliqueFamily_valid _)]
    exact hc
  · rw [hE]
    exact (liftFamily_subset f _ _).mpr hsub

/-- Every edge of a literal K4 or K5 belongs to a minimum cover made of clique edges. -/
theorem clique_min_cover_containing {k e : Finset V}
    (hsize : k.card = 4 ∨ k.card = 5) (he : e ∈ edges k) :
    ∃ C, Covers (cliqueFamily k) C ∧ C.card = tau (cliqueFamily k) ∧
      C ⊆ edges k ∧ e ∈ C := by
  rcases hsize with h4 | h5
  · apply clique_cover_choice_transport h4 _ he
    intro a ha
    obtain ⟨hc, hcard, hsub⟩ := k4_cover_choice ⟨a, ha⟩
    refine ⟨insert a (edges (univ \ a)), hc, ?_, hsub, mem_insert_self _ _⟩
    exact hcard.trans (k4_parameters (k := univ) (by decide)).2.symm
  · apply clique_cover_choice_transport h5 _ he
    intro a ha
    obtain ⟨hc, hcard, hsub⟩ := k5_cover_choice ⟨a, ha⟩
    refine ⟨insert a (edges (univ \ a)), hc, ?_, hsub, mem_insert_self _ _⟩
    exact hcard.trans (k5_parameters (k := univ) (by decide)).2.symm

/-- A maximum clique packing avoiding one prescribed actual clique edge. -/
theorem clique_max_packing_avoiding [Fintype V] {H : SimpleGraph V} {k e : Finset V}
    (hk : H.IsClique (k : Set V)) (hsize : k.card = 4 ∨ k.card = 5)
    (he : e ∈ edges k) :
    ∃ P, Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧
      e ∉ support P := by
  classical
  have hcard : ({e} ∩ edges k).card ≤ 2 := by
    have h := card_le_card (inter_subset_left : {e} ∩ edges k ⊆ {e})
    simp only [card_singleton] at h
    omega
  obtain ⟨a, ha⟩ := card_pos.mp (show 0 < e.card by rw [(mem_edges.mp he).2]; decide)
  have hstar : ∃ a : V, ∀ f ∈ ({e} ∩ edges k), a ∈ f := by
    refine ⟨a, ?_⟩
    intro f hf
    have hfe : f = e := mem_singleton.mp (mem_inter.mp hf).1
    simpa [hfe] using ha
  obtain ⟨P, hp, hc, hd⟩ := clique_avoid_edges hk hsize hcard hstar
  refine ⟨P, hp, hc, ?_⟩
  intro heP
  exact disjoint_left.mp hd heP (mem_singleton_self e)

end Tuza23
