import Tuza23.GraphAPI
import Mathlib.Combinatorics.SimpleGraph.Acyclic

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A graph-edge matching, not a triangle packing: distinct edges have disjoint vertices. -/
def EdgeMatching (G : SimpleGraph V) (M : Finset (Finset V)) : Prop :=
  (∀ e ∈ M, G.IsNClique 2 e) ∧ ∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f

/-- Ordinary vertex cover of actual graph edges. This differs from GraphCover. -/
def VertexCover (G : SimpleGraph V) (Q : Finset V) : Prop :=
  ∀ e : Finset V, G.IsNClique 2 e → ¬ Disjoint e Q

noncomputable def matchingVertices (M : Finset (Finset V)) : Finset V := by
  classical
  exact M.biUnion id

def MaximumMatching (G : SimpleGraph V) (M : Finset (Finset V)) : Prop :=
  EdgeMatching G M ∧ ∀ N, EdgeMatching G N → N.card ≤ M.card

/-- Remove incident edges but retain the complete ambient vertex type, including isolates. -/
def isolate (G : SimpleGraph V) (U : Finset V) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ a ∉ U ∧ b ∉ U
  symm := ⟨fun _ _ h => ⟨h.1.symm,h.2.2,h.2.1⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

/-- Cover only edges remaining after the matching edges themselves are removed. -/
def ResidualVertexCover (G : SimpleGraph V) (M : Finset (Finset V)) (Q : Finset V) : Prop :=
  ∀ e : Finset V, G.IsNClique 2 e → e ∉ M → ¬ Disjoint e Q

/-- Pointed witness used by the anchored forest induction; no maximum requirement. -/
def PointedWitness (L : SimpleGraph V) (w : V)
    (M : Finset (Finset V)) (Q : Finset V) : Prop :=
  EdgeMatching L M ∧ ResidualVertexCover L M Q ∧ Q.card ≤ M.card ∧
    (w ∈ matchingVertices M → w ∈ Q)

end Tuza24
