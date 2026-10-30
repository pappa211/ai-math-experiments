import Tuza06.FinalReconstructionCross
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

private theorem arm_pair_cases : ∀ a b : Fin 8, a∈Core.A → b∈Core.A → a≠b →
    (a∈frameX ∧ b∈frameX) ∨ (a∈frameY ∧ b∈frameY) ∨
    (a∈({4,5} : Finset (Fin 8)) ∧ b∈({6,7} : Finset (Fin 8))) ∨
    (b∈({4,5} : Finset (Fin 8)) ∧ a∈({6,7} : Finset (Fin 8))) := by decide
private theorem core_u_iff : ∀ a : Fin 8, ({0,a} : Finset (Fin 8)) ∈ Core.BEdges ↔ a∈frameNu := by decide
private theorem core_v_iff : ∀ a : Fin 8, ({1,a} : Finset (Fin 8)) ∈ Core.BEdges ↔ a∈frameKv := by decide
private theorem core_w_iff : ∀ a : Fin 8, ({2,a} : Finset (Fin 8)) ∈ Core.BEdges ↔ a∈frameKw := by decide
private theorem core_noncentral : ∀ a : Fin 8, a≠0 → a≠1 → a≠2 → a∈Core.A := by decide

theorem FinalFrame.a_clique {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) :
    G.IsClique (Core.A.map i : Set V) := by
  intro x hx y hy hxy
  obtain ⟨a,ha,rfl⟩ := mem_map.mp hx
  obtain ⟨b,hb,rfl⟩ := mem_map.mp hy
  have hab : a≠b := fun h => hxy (congrArg i h)
  rcases arm_pair_cases a b ha hb hab with hX|hY|hCross|hCross
  · exact hf.v_clique hG
      (mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨a,hX.1,rfl⟩)))
      (mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨b,hX.2,rfl⟩))) hxy
  · exact hf.w_clique hG
      (mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨a,hY.1,rfl⟩)))
      (mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨b,hY.2,rfl⟩))) hxy
  · exact hf.cross_edges hG a hCross.1 b hCross.2
  · exact (hf.cross_edges hG b hCross.1 a hCross.2).symm

/-- The final core and all permitted outside attachments are reconstructed from
the actual saturated arm frame in a genuine minimal combined obstruction. -/
theorem FinalFrame.configuration {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) : FinalConfiguration G i p q := by
  classical
  have hA := hf.a_clique hG
  have hU : ∀ a : Fin 8, G.Adj (i 0) (i a) ↔ ({0,a} : Finset (Fin 8))∈Core.BEdges :=
    fun a => (hf.adj_u a).trans (core_u_iff a).symm
  have hV : ∀ a : Fin 8, G.Adj (i 1) (i a) ↔ ({1,a} : Finset (Fin 8))∈Core.BEdges :=
    fun a => (hf.adj_v a).trans (core_v_iff a).symm
  have hW : ∀ a : Fin 8, G.Adj (i 2) (i a) ↔ ({2,a} : Finset (Fin 8))∈Core.BEdges :=
    fun a => (hf.adj_w a).trans (core_w_iff a).symm
  constructor
  · intro a b
    by_cases ha0 : a=0
    · subst a;exact hU b
    by_cases ha1 : a=1
    · subst a;exact hV b
    by_cases ha2 : a=2
    · subst a;exact hW b
    by_cases hb0 : b=0
    · subst b
      constructor
      · intro h;simpa only [pair_comm] using (hU a).mp h.symm
      · intro h;exact ((hU a).mpr (by simpa only [pair_comm] using h)).symm
    by_cases hb1 : b=1
    · subst b
      constructor
      · intro h;simpa only [pair_comm] using (hV a).mp h.symm
      · intro h;exact ((hV a).mpr (by simpa only [pair_comm] using h)).symm
    by_cases hb2 : b=2
    · subst b
      constructor
      · intro h;simpa only [pair_comm] using (hW a).mp h.symm
      · intro h;exact ((hW a).mpr (by simpa only [pair_comm] using h)).symm
    have haA := core_noncentral a ha0 ha1 ha2
    have hbA := core_noncentral b hb0 hb1 hb2
    constructor
    · intro h
      have hab : a≠b := fun he => G.irrefl (congrArg i he ▸ h)
      exact Core.A_edges_subset (mem_edges.mpr
        ⟨by simp only [insert_subset_iff,singleton_subset_iff];exact ⟨haA,hbA⟩,by simp [hab]⟩)
    · intro he
      have hsize := Core.edges_size _ he
      have hab : a≠b := by intro h;subst b;simp at hsize
      exact hA (mem_map.mpr ⟨a,haA,rfl⟩) (mem_map.mpr ⟨b,hbA,rfl⟩)
        (fun h => hab (i.injective h))
  · intro z hadj
    have hz : z ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [hf.u_neighborhood] at hz
    exact map_subset_map.mpr (subset_univ _) hz
  · intro z hadj
    have hz : z ∈ peelNeighbors G univ (i 1) := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [hf.v_neighborhood] at hz
    rcases mem_insert.mp hz with rfl|hz
    · exact Or.inr rfl
    · exact Or.inl (map_subset_map.mpr (subset_univ _) hz)
  · intro z hadj
    have hz : z ∈ peelNeighbors G univ (i 2) := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [hf.w_neighborhood] at hz
    rcases mem_insert.mp hz with rfl|hz
    · exact Or.inr rfl
    · exact Or.inl (map_subset_map.mpr (subset_univ _) hz)

theorem final_configuration_of_arm_data {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} (hd : FinalArmData G i) :
    ∃ p q : V, FinalConfiguration G i p q := by
  obtain ⟨p,q,hf⟩ := hd.frame
  exact ⟨p,q,hf.configuration hG⟩

end Tuza06
#check @Tuza06.final_configuration_of_arm_data
#print axioms Tuza06.final_configuration_of_arm_data
