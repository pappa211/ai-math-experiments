import Tuza06.FinalReconstructionFrame
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 8000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem FinalFrame.adj_u {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hf : FinalFrame G i p q) (a : Fin 8) :
    G.Adj (i 0) (i a) ↔ a ∈ frameNu := by
  classical
  constructor
  · intro h
    have hN : i a ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hf.u_neighborhood] at hN
    obtain ⟨b,hb,hbi⟩ := mem_map.mp hN
    exact i.injective hbi ▸ hb
  · intro ha
    have hN : i a ∈ peelNeighbors G univ (i 0) := by rw [hf.u_neighborhood];exact mem_map.mpr ⟨a,ha,rfl⟩
    exact (mem_filter.mp hN).2

theorem FinalFrame.adj_v {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hf : FinalFrame G i p q) (a : Fin 8) :
    G.Adj (i 1) (i a) ↔ a ∈ frameKv := by
  classical
  constructor
  · intro h
    have hN : i a ∈ peelNeighbors G univ (i 1) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hf.v_neighborhood] at hN
    rcases mem_insert.mp hN with haP|haK
    · exact (hf.p_outside (mem_map.mpr ⟨a,mem_univ _,haP⟩)).elim
    · obtain ⟨b,hb,hbi⟩ := mem_map.mp haK
      exact i.injective hbi ▸ hb
  · intro ha
    have hN : i a ∈ peelNeighbors G univ (i 1) := by rw [hf.v_neighborhood];exact mem_insert_of_mem (mem_map.mpr ⟨a,ha,rfl⟩)
    exact (mem_filter.mp hN).2

theorem FinalFrame.adj_w {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hf : FinalFrame G i p q) (a : Fin 8) :
    G.Adj (i 2) (i a) ↔ a ∈ frameKw := by
  classical
  constructor
  · intro h
    have hN : i a ∈ peelNeighbors G univ (i 2) := mem_filter.mpr ⟨mem_univ _,h⟩
    rw [hf.w_neighborhood] at hN
    rcases mem_insert.mp hN with haQ|haK
    · exact (hf.q_outside (mem_map.mpr ⟨a,mem_univ _,haQ⟩)).elim
    · obtain ⟨b,hb,hbi⟩ := mem_map.mp haK
      exact i.injective hbi ▸ hb
  · intro ha
    have hN : i a ∈ peelNeighbors G univ (i 2) := by rw [hf.w_neighborhood];exact mem_insert_of_mem (mem_map.mpr ⟨a,ha,rfl⟩)
    exact (mem_filter.mp hN).2

theorem FinalFrame.hub_nonadj_outside {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q z : V}
    (hf : FinalFrame G i p q) (hz : z ∉ (univ : Finset (Fin 8)).map i) : ¬ G.Adj (i 0) z := by
  classical
  intro h
  have hzN : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,h⟩
  rw [hf.u_neighborhood] at hzN
  exact hz (map_subset_map.mpr (subset_univ _) hzN)

theorem private_arm_near_clique {G : SimpleGraph V} {v u p : V} {A : Finset V}
    (hNear : NearClique G (peelNeighbors G univ v))
    (hN : peelNeighbors G univ v = insert p (insert u A))
    (hup : u ≠ p) (huA : u ∉ A) (hMissing : ¬ G.Adj u p) :
    G.IsClique ((insert v (insert p A) : Finset V) : Set V) := by
  classical
  have hu : u ∈ peelNeighbors G univ v := by rw [hN];simp
  have hp : p ∈ peelNeighbors G univ v := by rw [hN];simp
  have hcl := near_star_clique_after_missing hNear hu hp hup hMissing
  have hsub : (insert v (insert p A) : Finset V) ⊆ insert v ((peelNeighbors G univ v).erase u) := by
    intro z hz
    rcases mem_insert.mp hz with rfl|hz
    · exact mem_insert_self _ _
    · apply mem_insert_of_mem
      apply mem_erase.mpr
      constructor
      · rcases mem_insert.mp hz with rfl|hz
        · exact hup.symm
        · intro h;exact huA (h ▸ hz)
      · rw [hN]
        rcases mem_insert.mp hz with rfl|hz
        · simp
        · exact mem_insert_of_mem (mem_insert_of_mem hz)
  exact fun _ ha _ hb hab => hcl (hsub ha) (hsub hb) hab

theorem FinalFrame.v_clique {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) :
    G.IsClique ((insert (i 1) (insert p (frameX.map i)) : Finset V) : Set V) := by
  classical
  apply private_arm_near_clique (minimal_degree_five_near hG hf.v_degree)
  · simpa only [frameKv,frameX,map_insert,map_singleton] using hf.v_neighborhood
  · exact fun h => hf.p_outside (mem_map.mpr ⟨0,mem_univ _,h⟩)
  · intro h
    obtain ⟨a,ha,hai⟩ := mem_map.mp h
    have ha0 : a=0 := i.injective hai
    exact (by decide : (0 : Fin 8) ∉ frameX) (ha0 ▸ ha)
  · exact hf.hub_nonadj_outside hf.p_outside

theorem FinalFrame.w_clique {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) :
    G.IsClique ((insert (i 2) (insert q (frameY.map i)) : Finset V) : Set V) := by
  classical
  apply private_arm_near_clique (minimal_degree_five_near hG hf.w_degree)
  · simpa only [frameKw,frameY,map_insert,map_singleton] using hf.w_neighborhood
  · exact fun h => hf.q_outside (mem_map.mpr ⟨0,mem_univ _,h⟩)
  · intro h
    obtain ⟨a,ha,hai⟩ := mem_map.mp h
    have ha0 : a=0 := i.injective hai
    exact (by decide : (0 : Fin 8) ∉ frameY) (ha0 ▸ ha)
  · exact hf.hub_nonadj_outside hf.q_outside

end Tuza06
