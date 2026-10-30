import Tuza06.FinalReconstructionCliques
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2000000
variable {V : Type*} [Fintype V] [DecidableEq V]

def eightIntoNine : Fin 8 ↪ Fin 9 := ⟨Fin.castSucc,Fin.castSucc_injective 8⟩
private def crossOrder : Fin 4 → Fin 9 → Fin 9 :=
  ![![0,1,2,3,5,4,7,6,8],![0,1,2,3,5,4,6,7,8],![0,1,2,3,4,5,7,6,8],![0,1,2,3,4,5,6,7,8]]
private theorem crossOrder_inj : ∀ k : Fin 4, Function.Injective (crossOrder k) := by decide
private def crossReorder (k : Fin 4) : Fin 9 ↪ Fin 9 := ⟨crossOrder k,crossOrder_inj k⟩
private def crossPair : Fin 4 → Finset (Fin 8) := ![{4,6},{4,7},{5,6},{5,7}]
private def frameMatch : Finset (Finset (Fin 8)) := {{1,4},{1,5},{2,6},{2,7},{3,4},{3,5}}
private def frameBad : Finset (Finset (Fin 8)) := {{1,2},{1,6},{1,7},{2,4},{2,5}}
private def frameForbidden (k : Fin 4) := insert (crossPair k) frameBad
private theorem cross_zero : ∀ k : Fin 4, crossReorder k 0 = 0 := by decide
private theorem cross_N : ∀ k : Fin 4, CrossPattern.N.map (crossReorder k) = CrossPattern.N := by decide
private theorem cross_N_old : CrossPattern.N = frameNu.map eightIntoNine := by decide
private theorem cross_K : ∀ k : Fin 4, CrossPattern.K.map (crossReorder k) = CrossPattern.K := by decide
private theorem cross_M : ∀ k : Fin 4, ∀ f : ↥CrossPattern.M,
    f.val.map (crossReorder k) ∈ liftFamily eightIntoNine frameMatch := by
  intro k
  fin_cases k <;> decide
private theorem cross_F : ∀ k : Fin 4, ∀ f : ↥CrossPattern.F,
    f.val.map (crossReorder k) ∈ liftFamily eightIntoNine (frameForbidden k) := by
  intro k
  fin_cases k <;> decide
private theorem frameMatch_cases : ∀ f : ↥frameMatch, f.val.card=2 ∧
    (f.val ⊆ insert 1 frameX ∨ f.val ⊆ insert 2 frameY) := by decide
private theorem crossPair_choices : ∀ b c : Fin 8, b ∈ ({4,5} : Finset (Fin 8)) →
    c ∈ ({6,7} : Finset (Fin 8)) → ∃ k : Fin 4, crossPair k = {b,c} := by decide

theorem FinalFrame.matching_edges {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) :
    ∀ f ∈ frameMatch, G.IsNClique 2 (f.map i) := by
  intro f hfm
  obtain ⟨hc,hV|hW⟩ := frameMatch_cases ⟨f,hfm⟩
  · refine ⟨?_,by rw [card_map];exact hc⟩
    have hsub : f.map i ⊆ insert (i 1) (insert p (frameX.map i)) := by
      intro z hz
      obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
      rcases mem_insert.mp (hV ha) with rfl|haX
      · simp
      · exact mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨a,haX,rfl⟩))
    exact fun _ ha _ hb hab => hf.v_clique hG (hsub ha) (hsub hb) hab
  · refine ⟨?_,by rw [card_map];exact hc⟩
    have hsub : f.map i ⊆ insert (i 2) (insert q (frameY.map i)) := by
      intro z hz
      obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
      rcases mem_insert.mp (hW ha) with rfl|haY
      · simp
      · exact mem_insert_of_mem (mem_insert_of_mem (mem_map.mpr ⟨a,haY,rfl⟩))
    exact fun _ ha _ hb hab => hf.w_clique hG (hsub ha) (hsub hb) hab

theorem FinalFrame.bad_edges {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hf : FinalFrame G i p q) : ∀ f ∈ frameBad, ¬ G.IsNClique 2 (f.map i) := by
  intro f hfB hClq
  simp only [frameBad,mem_insert,mem_singleton] at hfB
  rcases hfB with rfl|rfl|rfl|rfl|rfl
  all_goals
    rw [map_insert,map_singleton] at hClq
  · exact (by decide : (2 : Fin 8) ∉ frameKv) ((hf.adj_v 2).mp (hClq.isClique (by simp) (by simp) (fun h => (by decide : (1 : Fin 8) ≠ 2) (i.injective h))))
  · exact (by decide : (6 : Fin 8) ∉ frameKv) ((hf.adj_v 6).mp (hClq.isClique (by simp) (by simp) (fun h => (by decide : (1 : Fin 8) ≠ 6) (i.injective h))))
  · exact (by decide : (7 : Fin 8) ∉ frameKv) ((hf.adj_v 7).mp (hClq.isClique (by simp) (by simp) (fun h => (by decide : (1 : Fin 8) ≠ 7) (i.injective h))))
  · exact (by decide : (4 : Fin 8) ∉ frameKw) ((hf.adj_w 4).mp (hClq.isClique (by simp) (by simp) (fun h => (by decide : (2 : Fin 8) ≠ 4) (i.injective h))))
  · exact (by decide : (5 : Fin 8) ∉ frameKw) ((hf.adj_w 5).mp (hClq.isClique (by simp) (by simp) (fun h => (by decide : (2 : Fin 8) ≠ 5) (i.injective h))))

theorem FinalFrame.cross_missing_impossible {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) (k : Fin 4)
    (hMissing : ¬ G.IsNClique 2 ((crossPair k).map i)) : False := by
  classical
  have hp : ∀ a : Fin 8, i a ≠ p := fun a h => hf.p_outside (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let e := extendFiniteEmbedding i p hp
  let r := crossReorder k
  let j := r.trans e
  have hcomp : eightIntoNine.trans e = i := by ext a;exact extendFiniteEmbedding_old i p hp a
  have hmap : ∀ t : Finset (Fin 8), (t.map eightIntoNine).map e = t.map i := by
    intro t
    rw [map_map]
    change t.map (eightIntoNine.trans e) = _
    rw [hcomp]
  have hMknown : ∀ f ∈ liftFamily eightIntoNine frameMatch, G.IsNClique 2 (f.map e) := by
    intro f hfM
    obtain ⟨t,ht,rfl⟩ := mem_liftFamily.mp hfM
    rw [hmap]
    exact hf.matching_edges hG t ht
  have hFmissing : ∀ f ∈ liftFamily eightIntoNine (frameForbidden k), ¬ G.IsNClique 2 (f.map e) := by
    intro f hfF
    obtain ⟨t,ht,rfl⟩ := mem_liftFamily.mp hfF
    rw [hmap]
    rcases mem_insert.mp ht with rfl|ht
    · exact hMissing
    · exact hf.bad_edges t ht
  have hj0 : j 0 = i 0 := by
    change e (crossReorder k 0) = _
    rw [cross_zero]
    rfl
  have hN : peelNeighbors G univ (j 0) = CrossPattern.N.map j := by
    rw [hj0,hf.u_neighborhood]
    change frameNu.map i = CrossPattern.N.map (r.trans e)
    rw [←map_map,cross_N,cross_N_old,hmap]
  have hKset : CrossPattern.K.map j = insert (i 1) (insert p (frameX.map i)) := by
    change CrossPattern.K.map (r.trans e) = _
    rw [←map_map,cross_K]
    have he1 : e 1 = i 1 := extendFiniteEmbedding_old i p hp 1
    have he3 : e 3 = i 3 := extendFiniteEmbedding_old i p hp 3
    have he4 : e 4 = i 4 := extendFiniteEmbedding_old i p hp 4
    have he5 : e 5 = i 5 := extendFiniteEmbedding_old i p hp 5
    have he8 : e 8 = p := extendFiniteEmbedding_last i p hp
    simp only [CrossPattern.K,frameX,map_insert,map_singleton,he1,he3,he4,he5,he8]
  have hd : CrossPattern.Data G j := by
    constructor
    · exact hN
    · intro f hfM
      obtain ⟨t,ht,rfl⟩ := mem_liftFamily.mp hfM
      have hactual := hMknown (t.map r) (cross_M k ⟨t,ht⟩)
      rw [map_map] at hactual
      exact hactual
    · intro a b hab hadj
      have hactual := hFmissing (({a,b} : Finset (Fin 9)).map r) (cross_F k ⟨{a,b},hab⟩)
      apply hactual
      rw [map_map,map_insert,map_singleton]
      exact sparse_pair_edge hadj
    · rw [hKset]
      exact hf.v_clique hG
  exact CrossPattern.minimal_no_missing_cross hG hd

theorem FinalFrame.cross_edges {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 8 ↪ V} {p q : V} (hf : FinalFrame G i p q) :
    ∀ b ∈ ({4,5} : Finset (Fin 8)), ∀ c ∈ ({6,7} : Finset (Fin 8)), G.Adj (i b) (i c) := by
  intro b hb c hc
  by_contra hn
  obtain ⟨k,hk⟩ := crossPair_choices b c hb hc
  apply hf.cross_missing_impossible hG k
  intro hcl
  rw [hk,map_insert,map_singleton] at hcl
  have hbc : b ≠ c := by
    intro h
    subst c
    exact (by decide : ∀ b : Fin 8, b∈({4,5} : Finset (Fin 8)) → b∉({6,7} : Finset (Fin 8))) b hb hc
  exact hn (hcl.isClique (by simp) (by simp) (fun h => hbc (i.injective h)))

end Tuza06
#print axioms Tuza06.FinalFrame.cross_edges
