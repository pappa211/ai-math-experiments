import TuzaA1.Deletion

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Strict edge-subgraphs on the SAME vertex type; only the original inequality. -/
def EdgeMinimalTuzaCounterexample (G : SimpleGraph V) : Prop :=
  2 * nu (triangles G) < tau (triangles G) ∧
  ∀ H : SimpleGraph V, H < G → tau (triangles H) ≤ 2 * nu (triangles H)

def EdgeCriticalityTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G → ∀ e : Finset V,
    G.IsNClique 2 e →
    nu (triangles (removeEdgeFamily G {e})) = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily G {e})) = 2 * nu (triangles G) ∧
    tau (triangles G) = 2 * nu (triangles G) + 1 ∧
    ∃ T ∈ triangles G, e ∈ edges T

def ResilienceTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G →
    ∀ S : Finset (Finset V), S.Nonempty → (∀ e ∈ S, G.IsNClique 2 e) →
    nu (triangles G) - nu (triangles (removeEdgeFamily G S)) ≤ (S.card - 1) / 2

def SmallDeletionTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G →
    ∀ S : Finset (Finset V), S.card ≤ 2 → (∀ e ∈ S, G.IsNClique 2 e) →
    nu (triangles (removeEdgeFamily G S)) = nu (triangles G)

def PackingExtensionTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G →
    ∀ P : Finset (Finset V), Packing (triangles G) P → (P.card = 1 ∨ P.card = 2) →
    nu (triangles (removeEdgeFamily G (support P))) + P.card = nu (triangles G) ∧
    ∃ Q, Packing (triangles G) Q ∧ P ⊆ Q ∧ Q.card = nu (triangles G)

def OneTriangleTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G → ∀ T ∈ triangles G,
    nu (triangles (removeEdgeFamily G (edges T))) + 1 = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily G (edges T))) + 2 = 2 * nu (triangles G)

def TwoTrianglesTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G →
    ∀ T₁ ∈ triangles G, ∀ T₂ ∈ triangles G, Disjoint (edges T₁) (edges T₂) →
    let R := removeEdgeFamily (removeEdgeFamily G (edges T₁)) (edges T₂)
    nu (triangles R) + 2 = nu (triangles G) ∧
    (tau (triangles R) + 5 = 2 * nu (triangles G) ∨
      tau (triangles R) + 4 = 2 * nu (triangles G))

/-- An arbitrary edge e of an arbitrary full-family triangle T. The other two
edges F are precisely its spokes, even with arbitrary outside vertices. -/
def WedgeTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G →
    ∀ T ∈ triangles G, ∀ e ∈ edges T,
    let H := removeEdgeFamily G {e}
    let F := (edges T).erase e
    F.card = 2 ∧ (∀ f ∈ F, H.IsNClique 2 f) ∧
    removeEdgeFamily H F = removeEdgeFamily G (edges T) ∧
    nu (triangles H) = nu (triangles G) ∧ tau (triangles H) = 2 * nu (triangles G) ∧
    nu (triangles (removeEdgeFamily H F)) + 1 = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily H F)) + 2 = 2 * nu (triangles G) ∧
    (∀ f ∈ F, nu (triangles (removeEdgeFamily H {f})) = nu (triangles G) ∧
      tau (triangles (removeEdgeFamily H {f})) + 1 = 2 * nu (triangles G)) ∧
    (∀ P, Packing (triangles H) P → P.card = nu (triangles H) →
      ¬ Disjoint (support P) F)

def CodegreeTarget : Prop :=
  ∀ G : SimpleGraph V, EdgeMinimalTuzaCounterexample G → ∀ e : Finset V,
    G.IsNClique 2 e → ∃ T₁ ∈ triangles G, ∃ T₂ ∈ triangles G,
      T₁ ≠ T₂ ∧ e ∈ edges T₁ ∧ e ∈ edges T₂
end TuzaA1
