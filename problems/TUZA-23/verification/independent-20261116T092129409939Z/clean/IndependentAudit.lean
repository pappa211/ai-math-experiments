import Research
import Tuza23.Controls
import Lean.Elab.Command
import Lean.Meta.Basic
import Lean.Util.CollectAxioms
set_option pp.universes true
set_option pp.explicit true
set_option pp.fullNames true
set_option pp.width 1000000
set_option maxHeartbeats 0
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let owned : Array Name := #[`Tuza.Basic, `Tuza.Graph, `Tuza06.Statement, `Tuza06.Transport, `Tuza06.FiniteCliques, `Tuza06.Pages, `Tuza06.Reduction, `Tuza06.Additivity, `Tuza06.BlockAggregation, `Tuza06.Components, `Tuza06.Critical, `Tuza06.MinimalObstruction, `Tuza23.GraphAPI, `Tuza23.WholeFootprint, `Tuza06.Footprints, `Tuza23.CliqueChoice, `Tuza23.BlockChoice, `Tuza23.PageAssembly, `Tuza23.InsertionAccounting, `Tuza23.BarePages, `Tuza23.PageGeometry, `Tuza23.AdjacentRestoration, `Tuza23.FourSet, `Tuza23.DisjointRestoration, `Tuza23.R2, `Tuza23.M0, `Research, `Tuza23.ControlBasic, `Tuza23.ControlSharedBlocks, `Tuza23.ControlRestoration, `Tuza23.Controls]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let mut count := 0
  for (n, ci) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? n then
      let mod := env.header.moduleNames[idx.toNat]!
      if owned.contains mod then
        let axioms ← Lean.collectAxioms n
        let fmt ← liftTermElabM <| Lean.Meta.ppExpr ci.type
        let refs := ci.type.getUsedConstants ++ (ci.value? true |>.map (·.getUsedConstants) |>.getD #[])
        let data := Json.mkObj [
          ("name", toJson n.toString), ("module", toJson mod.toString),
          ("type", toJson fmt.pretty), ("universe_parameters", toJson (ci.levelParams.map Name.toString)),
          ("is_theorem", toJson ci.isTheorem), ("is_axiom", toJson ci.isAxiom),
          ("is_unsafe", toJson ci.isUnsafe),
          ("axioms", toJson (axioms.map Name.toString)),
          ("direct_references", toJson (refs.map Name.toString))]
        liftIO <| IO.println ("TUZA23_AUDIT " ++ data.compress)
        for ax in axioms do
          unless allowed.contains ax do
            throwError "Unacceptable axiom {ax} in {n}"
        if ci.isAxiom || ci.isUnsafe then
          throwError "Unacceptable project declaration {n}"
        count := count + 1
  liftIO <| IO.println ("TUZA23_AUDIT_COUNT " ++ toString count)
