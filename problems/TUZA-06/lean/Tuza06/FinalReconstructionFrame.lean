import Tuza06.LowNeighborStructure
import Tuza06.FinalConfiguration
import Tuza06.ForcedCross

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 8000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

def frameNu : Finset (Fin 8) := {1,2,3,4,5,6,7}
def frameX : Finset (Fin 8) := {3,4,5}
def frameY : Finset (Fin 8) := {3,6,7}
def frameKv : Finset (Fin 8) := {0,3,4,5}
def frameKw : Finset (Fin 8) := {0,3,6,7}

/-- The actual output of saturated two-arm peeling before any cross-edge
adjacency is asserted. -/
structure FinalArmData (G : SimpleGraph V) (i : Fin 8 ↪ V) : Prop where
  u_neighborhood : peelNeighbors G univ (i 0) = frameNu.map i
  v_arm : peelNeighbors G (Core.A.map i) (i 1) = frameX.map i
  w_arm : peelNeighbors G (Core.A.map i) (i 2) = frameY.map i
  v_degree : degreeWithin G univ (i 1) = 5
  w_degree : degreeWithin G univ (i 2) = 5
  vw_nonadjacent : ¬ G.Adj (i 1) (i 2)

/-- Exact neighborhoods, retaining the arbitrary private outside vertices. -/
structure FinalFrame (G : SimpleGraph V) (i : Fin 8 ↪ V) (p q : V) : Prop where
  u_neighborhood : peelNeighbors G univ (i 0) = frameNu.map i
  v_neighborhood : peelNeighbors G univ (i 1) = insert p (frameKv.map i)
  w_neighborhood : peelNeighbors G univ (i 2) = insert q (frameKw.map i)
  p_outside : p ∉ (univ : Finset (Fin 8)).map i
  q_outside : q ∉ (univ : Finset (Fin 8)).map i
  v_degree : degreeWithin G univ (i 1) = 5
  w_degree : degreeWithin G univ (i 2) = 5

theorem core_degree_five_private_neighbor {G : SimpleGraph V} (i : Fin 8 ↪ V)
    (v : Fin 8) (K : Finset (Fin 8)) (hK4 : K.card = 4)
    (hSub : K.map i ⊆ peelNeighbors G univ (i v))
    (hCore : ∀ a : Fin 8, G.Adj (i v) (i a) → a ∈ K)
    (hDegree : degreeWithin G univ (i v) = 5) :
    ∃ p ∉ (univ : Finset (Fin 8)).map i,
      peelNeighbors G univ (i v) = insert p (K.map i) := by
  classical
  let N := peelNeighbors G univ (i v)
  have hKc : (K.map i).card = 4 := by rw [card_map,hK4]
  have hNc : N.card = 5 := hDegree
  have hRest : (N \ K.map i).card = 1 := by rw [card_sdiff_of_subset hSub,hNc,hKc]
  obtain ⟨p,hEq⟩ := card_eq_one.mp hRest
  have hpR : p ∈ N \ K.map i := by rw [hEq];simp
  have hpOut : p ∉ (univ : Finset (Fin 8)).map i := by
    intro hp
    obtain ⟨a,ha,hai⟩ := mem_map.mp hp
    have hadj : G.Adj (i v) (i a) := by simpa only [hai] using (mem_filter.mp (mem_sdiff.mp hpR).1).2
    exact (mem_sdiff.mp hpR).2 (mem_map.mpr ⟨a,hCore a hadj,hai⟩)
  refine ⟨p,hpOut,?_⟩
  calc
    N = (N \ K.map i) ∪ K.map i := (sdiff_union_of_subset hSub).symm
    _ = insert p (K.map i) := by rw [hEq,singleton_union]

theorem FinalArmData.frame {G : SimpleGraph V} {i : Fin 8 ↪ V} (hd : FinalArmData G i) :
    ∃ p q : V, FinalFrame G i p q := by
  classical
  have hHub : ∀ a ∈ frameNu, G.Adj (i 0) (i a) := by
    intro a ha
    have hN : i a ∈ peelNeighbors G univ (i 0) := by rw [hd.u_neighborhood];exact mem_map.mpr ⟨a,ha,rfl⟩
    exact (mem_filter.mp hN).2
  have hVarm : ∀ a ∈ frameX, G.Adj (i 1) (i a) := by
    intro a ha
    have hN : i a ∈ peelNeighbors G (Core.A.map i) (i 1) := by rw [hd.v_arm];exact mem_map.mpr ⟨a,ha,rfl⟩
    exact (mem_filter.mp hN).2
  have hWarm : ∀ a ∈ frameY, G.Adj (i 2) (i a) := by
    intro a ha
    have hN : i a ∈ peelNeighbors G (Core.A.map i) (i 2) := by rw [hd.w_arm];exact mem_map.mpr ⟨a,ha,rfl⟩
    exact (mem_filter.mp hN).2
  have hVSub : frameKv.map i ⊆ peelNeighbors G univ (i 1) := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    rcases mem_insert.mp ha with rfl|ha
    · exact mem_filter.mpr ⟨mem_univ _,(hHub 1 (by decide)).symm⟩
    · exact mem_filter.mpr ⟨mem_univ _,hVarm a ha⟩
  have hWSub : frameKw.map i ⊆ peelNeighbors G univ (i 2) := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    rcases mem_insert.mp ha with rfl|ha
    · exact mem_filter.mpr ⟨mem_univ _,(hHub 2 (by decide)).symm⟩
    · exact mem_filter.mpr ⟨mem_univ _,hWarm a ha⟩
  have hVCore : ∀ a : Fin 8, G.Adj (i 1) (i a) → a ∈ frameKv := by
    intro a hadj
    by_cases ha : a ∈ Core.A
    · have haN : i a ∈ peelNeighbors G (Core.A.map i) (i 1) :=
        mem_filter.mpr ⟨mem_map.mpr ⟨a,ha,rfl⟩,hadj⟩
      rw [hd.v_arm] at haN
      obtain ⟨b,hb,hbi⟩ := mem_map.mp haN
      exact mem_insert_of_mem (i.injective hbi ▸ hb)
    · have hc : a=0 ∨ a=1 ∨ a=2 := (by decide : ∀ a : Fin 8, a∉Core.A → a=0 ∨ a=1 ∨ a=2) a ha
      rcases hc with rfl|rfl|rfl
      · simp [frameKv]
      · exact (G.irrefl hadj).elim
      · exact (hd.vw_nonadjacent hadj).elim
  have hWCore : ∀ a : Fin 8, G.Adj (i 2) (i a) → a ∈ frameKw := by
    intro a hadj
    by_cases ha : a ∈ Core.A
    · have haN : i a ∈ peelNeighbors G (Core.A.map i) (i 2) :=
        mem_filter.mpr ⟨mem_map.mpr ⟨a,ha,rfl⟩,hadj⟩
      rw [hd.w_arm] at haN
      obtain ⟨b,hb,hbi⟩ := mem_map.mp haN
      exact mem_insert_of_mem (i.injective hbi ▸ hb)
    · have hc : a=0 ∨ a=1 ∨ a=2 := (by decide : ∀ a : Fin 8, a∉Core.A → a=0 ∨ a=1 ∨ a=2) a ha
      rcases hc with rfl|rfl|rfl
      · simp [frameKw]
      · exact (hd.vw_nonadjacent hadj.symm).elim
      · exact (G.irrefl hadj).elim
  obtain ⟨p,hpOut,hpN⟩ := core_degree_five_private_neighbor i 1 frameKv (by decide) hVSub hVCore hd.v_degree
  obtain ⟨q,hqOut,hqN⟩ := core_degree_five_private_neighbor i 2 frameKw (by decide) hWSub hWCore hd.w_degree
  exact ⟨p,q,hd.u_neighborhood,hpN,hqN,hpOut,hqOut,hd.v_degree,hd.w_degree⟩

/-- In a near-clique link, deleting one endpoint of a known missing pair and
putting the hub back leaves an actual clique. -/
theorem near_star_clique_after_missing {G : SimpleGraph V} {v u p : V}
    (hNear : NearClique G (peelNeighbors G univ v))
    (hu : u ∈ peelNeighbors G univ v) (hp : p ∈ peelNeighbors G univ v)
    (hup : u ≠ p) (hMissing : ¬ G.Adj u p) :
    G.IsClique ((insert v ((peelNeighbors G univ v).erase u) : Finset V) : Set V) := by
  classical
  intro a ha b hb hab
  change a ∈ (insert v ((peelNeighbors G univ v).erase u) : Finset V) at ha
  change b ∈ (insert v ((peelNeighbors G univ v).erase u) : Finset V) at hb
  rcases mem_insert.mp ha with rfl|ha
  · have hbN := mem_of_mem_erase ((mem_insert.mp hb).resolve_left hab.symm)
    exact (mem_filter.mp hbN).2
  · rcases mem_insert.mp hb with rfl|hb
    · exact (mem_filter.mp (mem_of_mem_erase ha)).2.symm
    · have haN := mem_of_mem_erase ha
      have hbN := mem_of_mem_erase hb
      have hPair : ({a,b} : Finset V) ≠ {u,p} := by
        intro h
        have huPair : u ∈ ({a,b} : Finset V) := h.symm ▸ (by simp)
        rcases mem_insert.mp huPair with hua|hub
        · exact (mem_erase.mp ha).1 hua.symm
        · exact (mem_erase.mp hb).1 (mem_singleton.mp hub).symm
      exact nearClique_adj_of_missing hNear hu hp hup hMissing haN hbN hab hPair

end Tuza06
