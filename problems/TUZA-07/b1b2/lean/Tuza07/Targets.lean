import Tuza06.Components

/-! Frozen mission propositions, not proof assumptions or asserted theorems. -/
namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def newTriangles (H G : SimpleGraph V) : Finset (Finset V) :=
  triangles G \ triangles H

def GraphCover (G : SimpleGraph V) (C : Finset (Finset V)) : Prop :=
  Covers (triangles G) C ∧ ∀ e ∈ C, G.IsNClique 2 e

def PackingOrCover (H G : SimpleGraph V) : Prop :=
  (∃ P, Packing (triangles G) P ∧ P.card = nu (triangles H) + 2) ∨
  (∃ C, GraphCover G C ∧ C.card ≤ 2 * nu (triangles H) + 2)

def NewK4 (H G : SimpleGraph V) : Prop :=
  ∃ U : Finset V, U.card = 4 ∧ newTriangles H G = cliqueFamily U ∧
    Disjoint (edges U) (support (triangles H))

def PromotedK4 (H G : SimpleGraph V) : Prop :=
  ∃ t ∈ triangles H, ∃ B : Finset V, ∃ z : V,
    B.card = 4 ∧ support (triangleComponent H t) = edges B ∧ z ∉ B ∧
    newTriangles H G = cliqueFamily (insert z B) \ cliqueFamily B ∧
    Disjoint (edges (insert z B) \ edges B) (support (triangles H))

def B1ConstructiveTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    (newTriangles H G).Nonempty → PackingOrCover H G

def B1GainTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    (newTriangles H G).Nonempty →
    ∃ P, Packing (triangles G) P ∧ P.card = nu (triangles H) + 1

def B1ScalarTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    nu (triangles G) = nu (triangles H) + 1 →
    tau (triangles G) ≤ 2 * nu (triangles H) + 2

def B1StrictTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    nu (triangles G) = nu (triangles H) + 1 →
    (∃ t ∈ newTriangles H G, 2 ≤ (edges t ∩ support (triangles H)).card) →
    tau (triangles G) ≤ 2 * nu (triangles H) + 1

def B2CoarseTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    nu (triangles G) = nu (triangles H) + 1 →
    tau (triangles G) = 2 * nu (triangles H) + 2 → ComponentCliques G

def B2FullTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    nu (triangles G) = nu (triangles H) + 1 →
    tau (triangles G) = 2 * nu (triangles H) + 2 →
    ComponentCliques G ∧ (NewK4 H G ∨ PromotedK4 H G)

def B2ConverseTarget : Prop :=
  ∀ H G : SimpleGraph V, ComponentCliques H → H ≤ G →
    (NewK4 H G ∨ PromotedK4 H G) →
    nu (triangles G) = nu (triangles H) + 1 ∧
    tau (triangles G) = 2 * nu (triangles H) + 2
end Tuza07
