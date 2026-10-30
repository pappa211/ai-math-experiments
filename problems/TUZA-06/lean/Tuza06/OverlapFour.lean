import Tuza06.OverlapFourFinite
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 12000
set_option maxHeartbeats 2400000
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem shared_four_data_of_private {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} {y q : V} (hc : FiveLinkConfiguration G i E)
    (hne : i 0 ≠ y) (hxy : ¬ G.Adj (i 0) y)
    (hp : peelNeighbors G univ (i 0) \ peelNeighbors G univ y = {i 5})
    (hq : peelNeighbors G univ y \ peelNeighbors G univ (i 0) = {q}) :
    SharedFourData G i E y q := by
  classical
  have hidx : ∀ a : Fin 6, a ∈ fiveLinkNeighbors ↔ a ≠ 0 := by decide
  have hfirst : ∀ a : Fin 6, a ∈ fourFirst ↔ a ∈ fiveLinkNeighbors ∧ a ≠ 5 := by decide
  have hqD : q ∈ peelNeighbors G univ y \ peelNeighbors G univ (i 0) := by rw [hq];simp
  have hpD : i 5 ∈ peelNeighbors G univ (i 0) \ peelNeighbors G univ y := by rw [hp];simp
  have hqo : ∀ a : Fin 6, i a ≠ q := by
    intro a he
    by_cases ha : a = 0
    · subst a
      have hadj : G.Adj y (i 0) := he.symm ▸ (mem_filter.mp (mem_sdiff.mp hqD).1).2
      exact hxy hadj.symm
    · apply (mem_sdiff.mp hqD).2
      rw [hc.neighborhood,← he]
      exact mem_map.mpr ⟨a,(hidx a).mpr ha,rfl⟩
  refine ⟨hc,?_,nonadjacent_outside_five_core hc hne hxy,hqo,?_⟩
  · ext z
    constructor
    · intro hz
      by_cases hzx : z ∈ peelNeighbors G univ (i 0)
      · rw [hc.neighborhood] at hzx
        obtain ⟨a,ha,rfl⟩ := mem_map.mp hzx
        have ha5 : a ≠ 5 := by intro he;subst a;exact (mem_sdiff.mp hpD).2 hz
        exact mem_union_left _ (mem_map.mpr ⟨a,(hfirst a).mpr ⟨ha,ha5⟩,rfl⟩)
      · have hzq : z = q := by
          apply mem_singleton.mp
          rw [← hq]
          exact mem_sdiff.mpr ⟨hz,hzx⟩
        simp [hzq]
    · intro hz
      rcases mem_union.mp hz with hz | hz
      · obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
        have hai := (hfirst a).mp ha
        by_contra hn
        have haX : i a ∈ peelNeighbors G univ (i 0) := by
          rw [hc.neighborhood];exact mem_map.mpr ⟨a,hai.1,rfl⟩
        have he : i a = i 5 := by
          apply mem_singleton.mp
          rw [← hp]
          exact mem_sdiff.mpr ⟨haX,hn⟩
        exact hai.2 (i.injective he)
      · exact (mem_singleton.mp hz).symm ▸ (mem_sdiff.mp hqD).1
  · exact G.ne_of_adj (mem_filter.mp (mem_sdiff.mp hqD).1).2

theorem shared_four_near_excluded {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {y q : V} (hd : SharedFourData G i fiveNearCore y q) : False := by
  classical
  obtain ⟨j,hr,hComp,h1,h7⟩ := shared_four_realizes OverlapFourNear.witness hd
    (by intro e he;exact (mem_edges.mp (mem_sdiff.mp he).1).2)
    (by decide)
    four_near_P
    four_near_rule
  exact OverlapFourNear.excluded hG j hr

theorem shared_four_clique_excluded {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))} {y q : V}
    (hd : SharedFourData G i E y q) (hE : E = fiveCliqueCore ∨ E = edges univ \ {({4,5} : Finset (Fin 6))}) : False := by
  classical
  have hE2 : ∀ e ∈ E, e.card = 2 := by
    rcases hE with rfl | rfl
    · exact fun e he => (mem_edges.mp he).2
    · exact fun e he => (mem_edges.mp (mem_sdiff.mp he).1).2
  have hp : ∀ p ∈ OverlapFourClique.P, p.card = 3 ∧ edges p ⊆ fourLower E := by
    rcases hE with rfl | rfl
    · exact four_full_P
    · exact four_last_P
  obtain ⟨j,hr,hComp,h1,h7⟩ := shared_four_realizes OverlapFourClique.witness hd hE2
    (by decide) hp (by intro a b hn;rcases four_full_rule a b hn with h | h | h | h;exact Or.inl h;exact Or.inr (Or.inl h);exact Or.inr (Or.inr (Or.inl h));exact Or.inr (Or.inr (Or.inr (Or.inl h))))
  apply OverlapFourClique.excluded hG j hr
  apply mapped_triangles_of_edges j (shared_four_lower_edges hd j hComp h1 h7 hE2)
  rcases hE with rfl | rfl
  · exact four_full_Aug
  · exact four_last_Aug

/-- Actual common-four-neighbor exclusion, with no restrictions on outside attachments. -/
theorem minimal_no_four_common {G : SimpleGraph V} (hG : MinimalObstruction G) {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hne : x ≠ y) (hxy : ¬ G.Adj x y)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 4) : False := by
  classical
  obtain ⟨p,q,hp,hq⟩ := four_common_private_vertices hx hy hC
  obtain ⟨i,hi,hcfg⟩ := minimal_degree_five_configuration hG hx
  have hpN : p ∈ peelNeighbors G univ (i 0) := by rw [hi];exact (mem_sdiff.mp (show p ∈ peelNeighbors G univ x \ peelNeighbors G univ y by rw [hp];simp)).1
  have hNP : peelNeighbors G univ (i 0) = fiveLinkNeighbors.map i := hcfg.elim (fun h => h.neighborhood) (fun h => h.neighborhood)
  rw [hNP] at hpN
  obtain ⟨a,ha,hai⟩ := mem_map.mp hpN
  have ha0 : a ≠ 0 := (by decide : ∀ a : Fin 6, a ∈ fiveLinkNeighbors → a ≠ 0) a ha
  obtain ⟨k,hka⟩ : ∃ k : Fin 5, k.succ = a := ⟨⟨a.val-1,by omega⟩,by apply Fin.ext; simp;omega⟩
  let r := fourPrivateOrder k
  let i' := r.trans i
  have hi0 : i' 0 = x := by change i (fourPrivateOrder k 0) = x;rw [fourPrivateOrder_zero,hi]
  have hi5 : i' 5 = p := by change i (fourPrivateOrder k 5) = p;rw [fourPrivateOrder_last,hka,hai]
  have hp' : peelNeighbors G univ (i' 0) \ peelNeighbors G univ y = {i' 5} := by rw [hi0,hi5];exact hp
  have hq' : peelNeighbors G univ y \ peelNeighbors G univ (i' 0) = {q} := by rw [hi0];exact hq
  have hne' : i' 0 ≠ y := hi0.symm ▸ hne
  have hxy' : ¬ G.Adj (i' 0) y := hi0.symm ▸ hxy
  rcases hcfg with hn | hc
  · have hd := shared_four_data_of_private (near_reorder_private hn k) hne' hxy' hp' hq'
    by_cases hk : k.val < 2
    · apply shared_four_clique_excluded hG hd
      right
      simp only [fourNearCore,fourMissingPair,if_pos hk]
    · have he : fourNearCore k = fiveNearCore := by simp only [fourNearCore,fourMissingPair,if_neg hk,fiveNearCore]
      exact shared_four_near_excluded hG (he ▸ hd)
  · exact shared_four_clique_excluded hG
      (shared_four_data_of_private (clique_reorder_private hc k) hne' hxy' hp' hq') (Or.inl rfl)
end Tuza06
#check @Tuza06.minimal_no_four_common
#print axioms Tuza06.minimal_no_four_common
