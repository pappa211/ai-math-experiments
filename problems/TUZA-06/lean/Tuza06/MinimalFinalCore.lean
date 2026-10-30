import Tuza06.MinimalObstruction
import Tuza06.FinalConfiguration

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem configuration_prune_edgeCount {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q) :
    edgeCount (prune G (Core.U.map i) (Core.A.map i)) < edgeCount G := by
  classical
  have h01 : i 0 ≠ i 1 := fun h => (by decide : (0 : Fin 8) ≠ 1) (i.injective h)
  have hu : i 0 ∈ Core.U.map i := mem_map.mpr ⟨0, by decide, rfl⟩
  have hG : G.IsNClique 2 ({i 0, i 1} : Finset V) := by
    constructor
    · intro a ha b hb hab
      simp only [Finset.mem_coe, mem_insert, mem_singleton] at ha hb
      rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
      · exact (hab rfl).elim
      · exact (hc.core_edges 0 1).mpr (by decide)
      · exact ((hc.core_edges 0 1).mpr (by decide)).symm
      · exact (hab rfl).elim
    · simp [h01]
  apply edgeCount_strict (prune_le _ _ _) hG
  intro hH
  exact (hH.isClique (by simp) (by simp) h01).2.1 hu

/-- The final core is excluded in an ACTUAL edge-minimal failure of the combined
statement, with arbitrary ambient graph and outside attachments. The residual
induction hypotheses are obtained from minimality, not assumed as extra inputs. -/
theorem minimal_no_final_configuration {G : SimpleGraph V} (hG : MinimalObstruction G)
    (i : Fin 8 ↪ V) (p q : V) : ¬ FinalConfiguration G i p q := by
  intro hc
  have hGood := hG.2 _ (prune_le G (Core.U.map i) (Core.A.map i))
    (configuration_prune_edgeCount hc)
  have hstrict := configuration_strict hc hGood.1 hGood.2
  have hfail := failure_lower_bound hG.1
  omega

end Tuza06
