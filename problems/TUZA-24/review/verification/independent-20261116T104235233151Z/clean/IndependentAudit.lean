import Research
import Tuza24.Controls
import Lean.Elab.Command
import Lean.Meta.Basic
import Lean.Util.CollectAxioms
set_option pp.universes true
set_option pp.explicit true
set_option pp.fullNames true
set_option format.width 1000000
set_option pp.proofs true
set_option pp.maxSteps 10000000
set_option maxHeartbeats 0
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let owned : Array Name := #[`Tuza.Basic, `Tuza.Graph, `Tuza06.Statement, `Tuza06.Transport, `Tuza06.FiniteCliques, `Tuza06.Pages, `Tuza06.Reduction, `Tuza06.Additivity, `Tuza06.BlockAggregation, `Tuza06.Components, `Tuza06.Critical, `Tuza06.MinimalObstruction, `Tuza23.GraphAPI, `Tuza23.M0, `Tuza24.ForestAPI, `Tuza24.MatchingAPI, `Tuza24.ForestMatching, `Tuza23.WholeFootprint, `Tuza06.Footprints, `Tuza23.CliqueChoice, `Tuza23.BlockChoice, `Tuza23.PageAssembly, `Tuza06.Reducible, `Tuza06.SetPeeling, `Tuza06.GraphPeeling, `Tuza06.MatchingReduction, `Tuza06.GraphOperations, `Tuza06.PageAugmentation, `Tuza.Intersecting, `Tuza.IntersectingStructure, `Tuza06.UniqueEdge, `Tuza06.SmallLinksBase, `Tuza06.SmallLinksOperations, `Tuza06.SmallLinksK3, `Tuza06.SmallLinksPatterns, `Tuza06.SmallLinksK4, `Tuza06.SmallLinksCross, `Tuza06.SmallLinksFour, `Tuza06.SmallLinks, `Tuza24.LinkAPI, `Tuza24.AnchorLift, `Tuza24.ForestMatchingSlack, `Tuza24.PointedAssembly, `Tuza24.AlternatingForestExchange, `Tuza24.AlternatingForestDecomposition, `Tuza24.PointedForest, `Tuza24.ForestAnchor, `Tuza24.PerfectForestStructure, `Tuza24.FootprintGeometry, `Tuza24.LinkAugmentation, `Tuza24.InternalPageAugmentation, `Tuza24.ExternalPageAugmentation, `Tuza24.PerfectForestExclusionBase, `Tuza24.ApexLinkGeometry, `Tuza24.MatchingChoice, `Tuza24.PerfectForestExclusionTools, `Tuza24.PerfectForestExclusion, `Tuza24.ForestMatchingUnique, `Tuza24.ForestMatchingBoundary, `Tuza24.ForestMatchingDeletion, `Tuza24.AlternatingForestAllowed, `Tuza24.AlternatingForestLeaves, `Tuza24.ForestMatchingLeafRetention, `Tuza24.ForestMatchingLeafAvoidance, `Tuza24.ResidualMatching, `Tuza24.ForestMatchingDeficiency, `Tuza24.NonperfectLinkReduction, `Tuza24.ForestMatchingSafeEdge, `Tuza24.NonperfectForestExclusion, `Tuza24.ForestCS, `Tuza24.ForestK5Exclusion, `Tuza24.ForestK4Equality, `Research, `Tuza23.ControlBasic, `Tuza24.ControlsForest, `Tuza24.ControlsMatching, `Tuza23.ControlSharedBlocks, `Tuza24.ControlsShared, `Tuza24.Controls]
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
        liftIO <| IO.println ("TUZA24_AUDIT " ++ data.compress)
        for ax in axioms do
          unless allowed.contains ax do
            throwError "Unacceptable axiom {ax} in {n}"
        if ci.isAxiom || ci.isUnsafe then
          throwError "Unacceptable project declaration {n}"
        count := count + 1
  liftIO <| IO.println ("TUZA24_AUDIT_COUNT " ++ toString count)
