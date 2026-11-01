import Tuza08
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/- Verification instrumentation only. This module is not imported by any theorem. -/
open Lean Elab Command
set_option maxHeartbeats 4000000
run_cmd do
  let env ← getEnv
  let localModules : Array Name := #[`Tuza.Basic, `Tuza.Graph, `TuzaA1.Deletion, `Tuza08.Targets, `Tuza08.Geometry, `Tuza08.Basic, `Tuza08.Covers, `Tuza08.Counting, `Tuza08.Main, `Tuza08]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let mut checked := 0
  for (n, _) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? n then
      let mod := env.header.moduleNames[idx.toNat]!
      if localModules.contains mod then
        let axs ← collectAxioms n
        unless axs.all (fun ax => allowed.contains ax) do
          throwError "Forbidden transitive axioms for {n}: {axs}"
        liftIO <| IO.println s!"DECL|{mod}|{n}|{axs}"
        checked := checked + 1
  for mod in env.header.moduleNames do
    liftIO <| IO.println s!"IMPORT|{mod}"
  liftIO <| IO.println s!"PASS full local mathematical declaration closure: {checked} constants; transitive axioms restricted to propext, Classical.choice, Quot.sound"
