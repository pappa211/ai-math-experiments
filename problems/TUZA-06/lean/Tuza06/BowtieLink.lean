import Tuza06.PatternTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A singleton matching with fewer cover vertices than matching edges is strict. -/
theorem minimal_no_strict_link_matching {G : SimpleGraph V} (hG : MinimalObstruction G)
    {u : V} {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G u M Q)
    (hM : M.Nonempty) (hQ : Q.card < M.card) : False := by
  have hw := matching_reduction_witness hm
  have hc := (hub_matching_packing hm).2
  have hp : (hubPacking u M).Nonempty := by apply card_pos.mp; rw [hc]; exact card_pos.mpr hM
  apply minimal_no_strict_reduction hG hw hp
  have hx := matching_cover_card u M Q
  rw [hc]
  omega
end Tuza06

namespace Tuza06.Bowtie
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
-- Labels v,a,b,c,d,e = 0,...,5; link bowtie abc ∪ ade.
def N : Finset (Fin 6) := {1,2,3,4,5}
def M : Finset (Finset (Fin 6)) := {{2,3},{4,5}}
def Q : Finset (Fin 6) := {1}
def Bad : Finset (Finset (Fin 6)) := {{2,4},{2,5},{3,4},{3,5}}
variable {V : Type*} [Fintype V] [DecidableEq V]
structure Data (G : SimpleGraph V) (i : Fin 6 ↪ V) : Prop where
  neighborhood : peelNeighbors G univ (i 0) = N.map i
  matching_edges : ∀ e ∈ liftFamily i M, G.IsNClique 2 e
  forbidden : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ Bad → ¬ G.Adj (i a) (i b)

/-- All arbitrary attachments outside the hub neighborhood are permitted. -/
theorem excluded {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V) (hd : Data G i) : False := by
  classical
  have hm := linkMatching_of_pattern i 0 N M Q Bad hd.neighborhood hd.matching_edges
    (fun e he => (by decide : ∀ e : ↥M, e.val ⊆ N) ⟨e,he⟩)
    (fun e he f hf hef => (by decide : ∀ e f : ↥M, e.val ≠ f.val → Disjoint e.val f.val) ⟨e,he⟩ ⟨f,hf⟩ hef)
    (by decide) hd.forbidden
  apply minimal_no_strict_link_matching hG hm
  · exact ⟨({2,3} : Finset (Fin 6)).map i,mem_liftFamily.mpr ⟨{2,3},by decide,rfl⟩⟩
  · rw [card_map,card_liftFamily]
    decide
end Tuza06.Bowtie
