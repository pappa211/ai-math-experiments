import Tuza23.GraphAPI

/-! Small kernel-checked semantic controls; none is a substitute for all-size R2. -/
namespace Tuza23.Controls
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
set_option maxRecDepth 10000
set_option maxHeartbeats 2400000

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem triangles_complete : triangles (⊤ : SimpleGraph V) = cliqueFamily univ := by
  ext t
  constructor
  · intro ht
    exact mem_powersetCard.mpr ⟨subset_univ _, (mem_triangles.mp ht).card_eq⟩
  · intro ht
    refine mem_triangles.mpr ⟨?_, (mem_powersetCard.mp ht).2⟩
    intro a _ b _ hab
    exact hab

theorem k4_actual_parameters :
    nu (triangles (⊤ : SimpleGraph (Fin 4))) = 1 ∧
    tau (triangles (⊤ : SimpleGraph (Fin 4))) = 2 := by
  rw [triangles_complete]
  exact k4_parameters (by decide)

theorem k5_actual_parameters :
    nu (triangles (⊤ : SimpleGraph (Fin 5))) = 2 ∧
    tau (triangles (⊤ : SimpleGraph (Fin 5))) = 4 := by
  rw [triangles_complete]
  exact k5_parameters (by decide)

theorem empty_vertex_cs : CS (⊥ : SimpleGraph (Fin 0)) := by
  apply (cs_iff_good _).mpr
  apply triangle_free_good
  ext t
  rw [mem_triangles]
  have hh : ∀ t : Finset (Fin 0), ¬ (⊥ : SimpleGraph (Fin 0)).IsNClique 3 t := by decide
  simp [hh]

def edgeGraph {n : ℕ} (E : Finset (Finset (Fin n))) : SimpleGraph (Fin n) :=
  SimpleGraph.fromRel (fun a b => ({a,b} : Finset (Fin n)) ∈ E)

instance {n : ℕ} (E : Finset (Finset (Fin n))) : DecidableRel (edgeGraph E).Adj :=
  inferInstanceAs (DecidableRel (SimpleGraph.fromRel (fun a b => ({a,b} : Finset (Fin n)) ∈ E)).Adj)

def sharedVertexFamily : Finset (Finset (Fin 5)) := {{0,1,2}, {0,3,4}}
def sharedVertexGraph : SimpleGraph (Fin 5) :=
  edgeGraph (edges {0,1,2} ∪ edges {0,3,4})

theorem shared_vertex_actual_triangles : triangles sharedVertexGraph = sharedVertexFamily := by
  ext t
  rw [mem_triangles]
  have h : ∀ t : Finset (Fin 5), sharedVertexGraph.IsNClique 3 t ↔ t ∈ sharedVertexFamily := by
    unfold sharedVertexGraph sharedVertexFamily
    decide
  exact h t

theorem shared_vertex_packing : Packing (triangles sharedVertexGraph) sharedVertexFamily := by
  rw [shared_vertex_actual_triangles]
  unfold Packing Independent sharedVertexFamily
  decide

theorem shared_vertex_witness :
    ({0,1,2} : Finset (Fin 5)) ∩ {0,3,4} = {0} ∧ sharedVertexFamily.card = 2 := by decide

theorem shared_edge_packing_rejected :
    ¬ Packing (triangles (⊤ : SimpleGraph (Fin 4))) {{0,1,2}, {0,1,3}} := by
  rw [triangles_complete]
  unfold Packing Independent
  decide

theorem empty_cover_rejected : ¬ Covers (triangles (⊤ : SimpleGraph (Fin 4))) ∅ := by
  rw [triangles_complete]
  unfold Covers
  decide


end Tuza23.Controls
