import Tuza.Graph
import Mathlib.Logic.Relation

namespace Tuza06
open Finset Tuza
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Number of neighbors in an arbitrary vertex subset, not original degree. -/
noncomputable def degreeWithin (G : SimpleGraph V) (U : Finset V) (v : V) : ℕ := by
  classical
  exact (U.filter (G.Adj v)).card

/-- Equivalent to the usual nonempty-subgraph definition: induced subgraphs suffice. -/
def Degenerate (G : SimpleGraph V) (d : ℕ) : Prop :=
  ∀ U : Finset V, U.Nonempty → ∃ v ∈ U, degreeWithin G U v ≤ d

/-- Shared GRAPH EDGE adjacency. Isolated vertices and graph edges are not nodes. -/
def TriangleAdjacent (G : SimpleGraph V) (s t : Finset V) : Prop :=
  s ∈ triangles G ∧ t ∈ triangles G ∧ ¬ Disjoint (edges s) (edges t)

def TriangleConnected (G : SimpleGraph V) (s t : Finset V) : Prop :=
  Relation.ReflTransGen (TriangleAdjacent G) s t

noncomputable def triangleComponent (G : SimpleGraph V) (t : Finset V) :
    Finset (Finset V) := by
  classical
  exact (triangles G).filter (TriangleConnected G t)

/-- The edge support of every nonempty triangle component is exactly a K4 or K5.
Different supports may share vertices. Triangle-free background edges are unrestricted. -/
def ComponentCliques (G : SimpleGraph V) : Prop :=
  ∀ t ∈ triangles G, ∃ k : Finset V,
    (k.card = 4 ∨ k.card = 5) ∧ support (triangleComponent G t) = edges k

/-- The complete target. This is a proposition, not a proved theorem. -/
def CombinedStatement (G : SimpleGraph V) : Prop :=
  Degenerate G 5 →
    tau (triangles G) ≤ 2 * nu (triangles G) ∧
    (tau (triangles G) = 2 * nu (triangles G) ↔ ComponentCliques G)

/-- An efficient block representation used in intermediate proofs.
Equivalence to ComponentCliques is a separate obligation until explicitly proved. -/
structure CliqueDecomposition (G : SimpleGraph V) (K : Finset (Finset V)) : Prop where
  clique : ∀ k ∈ K, G.IsClique (k : Set V)
  size : ∀ k ∈ K, k.card = 4 ∨ k.card = 5
  independent : Independent K
  exhaustive : ∀ t ∈ triangles G, ∃ k ∈ K, t ⊆ k

theorem degenerate_mono {G H : SimpleGraph V} {d : ℕ}
    (hHG : H ≤ G) (hG : Degenerate G d) : Degenerate H d := by
  classical
  intro U hU
  obtain ⟨v, hv, hd⟩ := hG U hU
  refine ⟨v, hv, le_trans ?_ hd⟩
  apply card_le_card
  intro x hx
  exact mem_filter.mpr ⟨(mem_filter.mp hx).1, hHG (mem_filter.mp hx).2⟩

end Tuza06
