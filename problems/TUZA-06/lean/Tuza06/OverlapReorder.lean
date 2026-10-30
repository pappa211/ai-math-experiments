import Tuza06.OverlapFive

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 12000

def fourPrivateOrderFn : Fin 5 → Fin 6 → Fin 6 :=
  ![![0,3,4,5,2,1], ![0,3,4,5,1,2], ![0,1,2,4,5,3], ![0,1,2,3,5,4], ![0,1,2,3,4,5]]
private def fourPrivateInverseFn : Fin 5 → Fin 6 → Fin 6 :=
  ![![0,5,4,1,2,3], ![0,4,5,1,2,3], ![0,1,2,5,3,4], ![0,1,2,3,5,4], ![0,1,2,3,4,5]]
private theorem fourPrivate_left : ∀ k : Fin 5, Function.LeftInverse (fourPrivateInverseFn k) (fourPrivateOrderFn k) := by
  unfold Function.LeftInverse
  decide

def fourPrivateOrder (k : Fin 5) : Fin 6 ↪ Fin 6 := ⟨fourPrivateOrderFn k,(fourPrivate_left k).injective⟩

theorem fourPrivateOrder_zero (k : Fin 5) : fourPrivateOrder k 0 = 0 := by fin_cases k <;> decide
theorem fourPrivateOrder_last (k : Fin 5) : fourPrivateOrder k 5 = k.succ := by fin_cases k <;> decide
theorem fourPrivateOrder_neighbors (k : Fin 5) : fiveLinkNeighbors.map (fourPrivateOrder k) = fiveLinkNeighbors := by
  fin_cases k <;> decide

def fourMissingPair (k : Fin 5) : Finset (Fin 6) := if k.val < 2 then {4,5} else {1,2}
def fourNearCore (k : Fin 5) : Finset (Finset (Fin 6)) := edges univ \ {fourMissingPair k}

private theorem missing_pair_map (k : Fin 5) :
    (fourMissingPair k).map (fourPrivateOrder k) = ({1,2} : Finset (Fin 6)) := by
  fin_cases k <;> decide

private theorem fourNearCore_compat (k : Fin 5) (a b : Fin 6) :
    (({fourPrivateOrder k a,fourPrivateOrder k b} : Finset (Fin 6)) ∈ fiveNearCore ↔
      ({a,b} : Finset (Fin 6)) ∈ fourNearCore k) := by
  classical
  have hCard : ({fourPrivateOrder k a,fourPrivateOrder k b} : Finset (Fin 6)).card = ({a,b} : Finset (Fin 6)).card := by
    simpa only [map_insert,map_singleton] using card_map (fourPrivateOrder k) (s := ({a,b} : Finset (Fin 6)))
  have hPair : ({fourPrivateOrder k a,fourPrivateOrder k b} : Finset (Fin 6)) = {1,2} ↔
      ({a,b} : Finset (Fin 6)) = fourMissingPair k := by
    have h := (Finset.map_inj (f := fourPrivateOrder k) (s₁ := ({a,b} : Finset (Fin 6))) (s₂ := fourMissingPair k))
    simpa only [map_insert,map_singleton,missing_pair_map] using h
  simp only [fiveNearCore,fourNearCore,mem_sdiff,mem_edges,subset_univ,true_and,mem_singleton,hCard,hPair]

private theorem fourCliqueCore_compat (k : Fin 5) (a b : Fin 6) :
    (({fourPrivateOrder k a,fourPrivateOrder k b} : Finset (Fin 6)) ∈ fiveCliqueCore ↔
      ({a,b} : Finset (Fin 6)) ∈ fiveCliqueCore) := by
  have hCard : ({fourPrivateOrder k a,fourPrivateOrder k b} : Finset (Fin 6)).card = ({a,b} : Finset (Fin 6)).card := by
    simpa only [map_insert,map_singleton] using card_map (fourPrivateOrder k) (s := ({a,b} : Finset (Fin 6)))
  simp only [fiveCliqueCore,mem_edges,subset_univ,true_and,hCard]

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem relabel_five_configuration {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E E' : Finset (Finset (Fin 6))} (hc : FiveLinkConfiguration G i E)
    (r : Fin 6 ↪ Fin 6) (h0 : r 0 = 0) (hN : fiveLinkNeighbors.map r = fiveLinkNeighbors)
    (hE : ∀ a b : Fin 6, (({r a,r b} : Finset (Fin 6)) ∈ E ↔ ({a,b} : Finset (Fin 6)) ∈ E')) :
    FiveLinkConfiguration G (r.trans i) E' := by
  constructor
  · change peelNeighbors G univ (i (r 0)) = fiveLinkNeighbors.map (r.trans i)
    rw [h0,hc.neighborhood,← Finset.map_map,hN]
  · intro a b
    change G.Adj (i (r a)) (i (r b)) ↔ _
    rw [hc.core_edges]
    exact hE a b

theorem near_reorder_private {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hc : FiveLinkConfiguration G i fiveNearCore) (k : Fin 5) :
    FiveLinkConfiguration G ((fourPrivateOrder k).trans i) (fourNearCore k) :=
  relabel_five_configuration hc (fourPrivateOrder k) (fourPrivateOrder_zero k)
    (fourPrivateOrder_neighbors k) (fourNearCore_compat k)

theorem clique_reorder_private {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hc : FiveLinkConfiguration G i fiveCliqueCore) (k : Fin 5) :
    FiveLinkConfiguration G ((fourPrivateOrder k).trans i) fiveCliqueCore :=
  relabel_five_configuration hc (fourPrivateOrder k) (fourPrivateOrder_zero k)
    (fourPrivateOrder_neighbors k) (fourCliqueCore_compat k)

/-- The two private neighbors are actual singleton set differences. -/
theorem four_common_private_vertices {G : SimpleGraph V} {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 4) :
    ∃ p q : V, peelNeighbors G univ x \ peelNeighbors G univ y = {p} ∧
      peelNeighbors G univ y \ peelNeighbors G univ x = {q} := by
  have hxN : (peelNeighbors G univ x).card = 5 := hx
  have hyN : (peelNeighbors G univ y).card = 5 := hy
  have h1 := card_sdiff_add_card_inter (peelNeighbors G univ x) (peelNeighbors G univ y)
  have h2 := card_sdiff_add_card_inter (peelNeighbors G univ y) (peelNeighbors G univ x)
  rw [inter_comm (peelNeighbors G univ y)] at h2
  obtain ⟨p,hp⟩ := card_eq_one.mp (show (peelNeighbors G univ x \ peelNeighbors G univ y).card = 1 by omega)
  obtain ⟨q,hq⟩ := card_eq_one.mp (show (peelNeighbors G univ y \ peelNeighbors G univ x).card = 1 by omega)
  exact ⟨p,q,hp,hq⟩
end Tuza06
