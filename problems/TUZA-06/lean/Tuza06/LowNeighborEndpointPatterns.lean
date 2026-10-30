import Tuza06.LowNeighborResidual
namespace Tuza06
open Finset Tuza
set_option maxRecDepth 6000
set_option maxHeartbeats 1800000

namespace EndpointSix
def N : Finset (Fin 8) := {0,3,4,5,6,7}
def Q : Finset (Fin 8) := {3,4,5}
def baseKnown := liftFamily sixIntoEight fiveNearCore
def presentM : Finset (Finset (Fin 8)) := {{6,7},{0,3},{4,5}}
def absentM : Finset (Finset (Fin 8)) := {{6,3},{7,4},{0,5}}
def presentBad : Finset (Finset (Fin 8)) := {{0,6},{0,7}}
def absentBad : Finset (Finset (Fin 8)) := {{0,6},{0,7},{6,7}}
def presentKnown := baseKnown ∪ ({{6,7}} : Finset (Finset (Fin 8)))
def absentKnown := baseKnown ∪ ({{6,3},{7,4}} : Finset (Finset (Fin 8)))
private theorem present_match : ∀ f : ↥presentM, ∀ g : ↥presentM,
    f.val ≠ g.val → Disjoint f.val g.val := by decide
private theorem absent_match : ∀ f : ↥absentM, ∀ g : ↥absentM,
    f.val ≠ g.val → Disjoint f.val g.val := by decide
private theorem present_choice : ∀ x y : Fin 8, x∈N → y∈N → x∉Q → y∉Q → x≠y →
    ({x,y} : Finset (Fin 8)) ∈ presentM ∨ ({x,y} : Finset (Fin 8)) ∈ presentBad := by decide
private theorem absent_choice : ∀ x y : Fin 8, x∈N → y∈N → x∉Q → y∉Q → x≠y →
    ({x,y} : Finset (Fin 8)) ∈ absentM ∨ ({x,y} : Finset (Fin 8)) ∈ absentBad := by decide

def present : ResidualOverlapPattern (Fin 8) where
  hub := 1
  N := N
  M := presentM
  Q := Q
  Bad := presentBad
  Known := presentKnown
  S := {0,2,5}
  T := {3,2,5}
  e := {2,5}
  a := 0
  b := 3
  m_nonempty := by decide
  q_card := by decide
  m_size := by decide
  m_known := by decide
  m_sub := by decide
  m_match := fun f hf g hg => present_match ⟨f,hf⟩ ⟨g,hg⟩
  choice := fun x hx y hy => present_choice x y hx hy
  s_tri := by decide
  t_tri := by decide
  s_hub := by decide
  t_hub := by decide
  s_old := by decide
  t_old := by decide
  common_s := by decide
  common_t := by decide
  a_s := by decide
  b_t := by decide
  ab_ne := by decide
  ab_m := by decide

def absent : ResidualOverlapPattern (Fin 8) where
  hub := 1
  N := N
  M := absentM
  Q := Q
  Bad := absentBad
  Known := absentKnown
  S := {0,2,3}
  T := {5,2,3}
  e := {2,3}
  a := 0
  b := 5
  m_nonempty := by decide
  q_card := by decide
  m_size := by decide
  m_known := by decide
  m_sub := by decide
  m_match := fun f hf g hg => absent_match ⟨f,hf⟩ ⟨g,hg⟩
  choice := fun x hx y hy => absent_choice x y hx hy
  s_tri := by decide
  t_tri := by decide
  s_hub := by decide
  t_hub := by decide
  s_old := by decide
  t_old := by decide
  common_s := by decide
  common_t := by decide
  a_s := by decide
  b_t := by decide
  ab_ne := by decide
  ab_m := by decide
end EndpointSix
end Tuza06
#print axioms Tuza06.EndpointSix.present
#print axioms Tuza06.EndpointSix.absent
