import Tuza06.LowNeighborDominatingNear
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
variable {V : Type*} [Fintype V] [DecidableEq V]
private def cliqueOrder : Fin 20 → Fin 7 → Fin 7 := ![![1,0,2,3,4,5,6],![1,0,3,2,4,5,6],![1,0,4,2,3,5,6],![1,0,5,2,3,4,6],![2,0,1,3,4,5,6],![2,0,3,1,4,5,6],![2,0,4,1,3,5,6],![2,0,5,1,3,4,6],![3,0,1,2,4,5,6],![3,0,2,1,4,5,6],![3,0,4,1,2,5,6],![3,0,5,1,2,4,6],![4,0,1,2,3,5,6],![4,0,2,1,3,5,6],![4,0,3,1,2,5,6],![4,0,5,1,2,3,6],![5,0,1,2,3,4,6],![5,0,2,1,3,4,6],![5,0,3,1,2,4,6],![5,0,4,1,2,3,6]]
private theorem cliqueOrder_inj : ∀ q : Fin 20, Function.Injective (cliqueOrder q) := by decide
private def cliqueReorder (q : Fin 20) : Fin 7 ↪ Fin 7 := ⟨cliqueOrder q,cliqueOrder_inj q⟩
private def cliqueCenter : Fin 20 → Fin 6 := ![1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5]
private def cliqueApex : Fin 20 → Fin 6 := ![2,3,4,5,1,3,4,5,1,2,4,5,1,2,3,5,1,2,3,4]
private def cliqueKnown (q : Fin 20) := liftFamily sixIntoSeven fiveCliqueCore ∪
  ({{(cliqueCenter q).castSucc,6},{(cliqueApex q).castSucc,6}} : Finset (Finset (Fin 7)))
private theorem clique_choices : ∀ k w : Fin 6, k ≠ 0 → w ≠ 0 → w ≠ k →
  ∃ q : Fin 20, cliqueCenter q = k ∧ cliqueApex q = w := by decide
private theorem clique_first : ∀ q : Fin 20, cliqueReorder q 0 = (cliqueCenter q).castSucc := by decide
private theorem clique_second : ∀ q : Fin 20, cliqueReorder q 1 = 0 := by decide
private theorem clique_star : ∀ k : Fin 6, ∀ a : Fin 6, a ≠ k →
  ({k,a} : Finset (Fin 6)) ∈ fiveCliqueCore := by decide
private theorem clique_third : ∀ q : Fin 20, cliqueReorder q 2 = (cliqueApex q).castSucc := by decide
private theorem clique_last : ∀ q : Fin 20, cliqueReorder q 6 = 6 := by decide
private theorem clique_old : ∀ q : Fin 20, ∀ a : Fin 7, a ≠ 6 → (cliqueReorder q a).val < 6 := by decide
private def genericKnown : Finset (Finset (Fin 7)) :=
  edges ((univ : Finset (Fin 7)).erase 6) ∪ {{0,6},{2,6}}
private theorem clique_P : ∀ p : ↥DominatingCliqueSix.P,
  p.val.card = 3 ∧ edges p.val ⊆ genericKnown := by decide
private theorem clique_bad : ∀ q : Fin 20, ∀ a b : Fin 7,
  ({a,b} : Finset (Fin 7)) ∉ DominatingCliqueSix.Upper →
  a=b ∨ (cliqueReorder q a=0 ∧ cliqueReorder q b=6) ∨
  (cliqueReorder q a=6 ∧ cliqueReorder q b=0) := by decide

theorem minimal_no_clique_degree_six_neighbor {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hr : FiveLinkConfiguration G i fiveCliqueCore) (k : Fin 6) (hk : k ≠ 0)
    (hdeg : degreeWithin G univ (i k) = 6) : False := by
  classical
  obtain ⟨p,hpOut,hN⟩ := core_dominating_six_private_neighbor hr k (clique_star k) hdeg
  obtain ⟨w,hw0,hwk,hwp⟩ := core_outside_triangle_apex hG hr k hk hpOut hN
  obtain ⟨q,hqk,hqw⟩ := clique_choices k w hk hw0 hwk
  have hx : ∀ a : Fin 6, i a ≠ p := fun a h => hpOut (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let e := extendFiniteEmbedding i p hx
  let r := cliqueReorder q
  have hkp : G.Adj (i k) p := (mem_filter.mp (by rw [hN]; simp : p ∈ peelNeighbors G univ (i k))).2
  have hj0 : (r.trans e) 0 = i k := by
    change e (cliqueReorder q 0) = _
    rw [clique_first,hqk]
    exact extendFiniteEmbedding_old i p hx k
  have hj2 : (r.trans e) 2 = i w := by
    change e (cliqueReorder q 2) = _
    rw [clique_third,hqw]
    exact extendFiniteEmbedding_old i p hx w
  have hj6 : (r.trans e) 6 = p := by
    change e (cliqueReorder q 6) = _
    rw [clique_last]
    exact extendFiniteEmbedding_last i p hx
  have hKnown : ∀ f ∈ genericKnown, G.IsNClique 2 (f.map (r.trans e)) := by
    intro f hf
    rcases mem_union.mp hf with hold|hnew
    · obtain ⟨a,b,hab,hfEq⟩ := card_eq_two.mp (mem_edges.mp hold).2
      have ha : a ∈ (univ : Finset (Fin 7)).erase 6 := (mem_edges.mp hold).1 (by rw [hfEq]; simp)
      have hb : b ∈ (univ : Finset (Fin 7)).erase 6 := (mem_edges.mp hold).1 (by rw [hfEq]; simp)
      let aa : Fin 6 := ⟨(r a).val,clique_old q a (mem_erase.mp ha).1⟩
      let bb : Fin 6 := ⟨(r b).val,clique_old q b (mem_erase.mp hb).1⟩
      have haa : e (r a) = i aa := by
        have hcast : aa.castSucc = r a := Fin.ext rfl
        rw [← hcast]
        exact extendFiniteEmbedding_old i p hx aa
      have hbb : e (r b) = i bb := by
        have hcast : bb.castSucc = r b := Fin.ext rfl
        rw [← hcast]
        exact extendFiniteEmbedding_old i p hx bb
      have habb : aa ≠ bb := by
        intro h
        have hv := congrArg (fun z : Fin 6 => z.val) h
        exact hab (r.injective (Fin.ext hv))
      have he : ({aa,bb} : Finset (Fin 6)) ∈ fiveCliqueCore :=
        mem_edges.mpr ⟨subset_univ _,by simp [habb]⟩
      rw [hfEq,map_insert,map_singleton]
      change G.IsNClique 2 {e (r a),e (r b)}
      rw [haa,hbb]
      exact sparse_pair_edge ((hr.core_edges aa bb).mpr he)
    · rcases mem_insert.mp hnew with rfl|hnew
      · rw [map_insert,map_singleton,hj0,hj6]
        exact sparse_pair_edge hkp
      · have heq := mem_singleton.mp hnew
        rw [heq,map_insert,map_singleton,hj2,hj6]
        exact sparse_pair_edge hwp
  have hP : liftFamily (r.trans e) DominatingCliqueSix.P ⊆ triangles G := by
    apply mapped_triangles_of_edges (r.trans e) hKnown
    intro t ht
    exact clique_P ⟨t,ht⟩
  have hn06 : ¬ G.Adj (e 0) (e 6) := core_hub_not_outside hr hpOut
  have hu : ∀ a b : Fin 7, G.Adj (e (r a)) (e (r b)) →
      ({a,b} : Finset (Fin 7)) ∈ DominatingCliqueSix.witness.Upper := by
    intro a b hadj
    by_contra hn
    change G.Adj (e (cliqueReorder q a)) (e (cliqueReorder q b)) at hadj
    rcases clique_bad q a b hn with hab|h06|h60
    · exact G.irrefl (congrArg (fun x => e (r x)) hab ▸ hadj)
    · exact hn06 (by simpa only [h06.1,h06.2] using hadj)
    · exact hn06 (by simpa only [h60.1,h60.2] using hadj.symm)
  have hfirst : r 0 = k.castSucc := by simpa only [hqk] using clique_first q
  have hreal := dominating_six_realizes hr DominatingCliqueSix.witness rfl p hx k hN r
    hfirst (clique_second q) hu hP
  exact DominatingCliqueSix.excluded hG (r.trans e) hreal

end Tuza06
#print axioms Tuza06.minimal_no_clique_degree_six_neighbor
