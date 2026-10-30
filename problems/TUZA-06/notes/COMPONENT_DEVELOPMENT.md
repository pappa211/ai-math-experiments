> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Component/decomposition equivalence development

Completed on the external verification server at 2026-10-30T17:47:56.424258+00:00.

Reviewed candidate source: `lean/Tuza06/Components.lean`, SHA-256 `169c27a6c30668b573312b6e3d2d99fb059e094e63064db283a000e86871bd0e`.
Latest successful type/axiom/compiler log: `logs/compile-174727-Tuza06.Components.log`.
Build invocation: `cd lean && python3 build_serial.py Tuza06.Components`, using the shared build lock, serial Lean `-j 1`, 1900 MiB Lean memory limit, and the helper's 240-second timeout. All source and logs are remote. No dependencies or frozen sources were rebuilt or edited by this role. Imports reuse the campaign's pinned, previously compiled modules and Mathlib dependencies.

## Completed substantive milestones

1. `component_eq_cliqueFamily_of_support`: literal component edge support `edges k` implies that the component is exactly the full family of triples of k. The support equality forces a real graph clique. Every clique triangle shares one of its edges with an existing component triangle, placing it in that literal component; this is not an assumed equivalence.
2. `componentCliques_decomposition`: the literal component characterization yields a finite exhaustive edge-disjoint clique decomposition. A common edge would join two components and force their clique supports, hence their vertex sets, to be equal. Different blocks may share vertices.
3. `cliqueFamily_connected`: arbitrary triples in a clique of size at most five have a common vertex. If necessary, a bridging triangle gives a path through shared graph edges. No bounded ambient graph or attachment restriction is imposed.
4. `connected_subset_block` and `decomposition_component_eq`: shared-edge paths cannot leave an edge-disjoint exhaustive block decomposition; each block is exactly a literal component.
5. `componentCliques_iff_decomposition`: proves the exact equivalence `ComponentCliques G ↔ ∃ K, CliqueDecomposition G K` in both directions.
6. `componentCliques_equality`: proves the equality converse for EVERY finite simple graph: `ComponentCliques G → tau (triangles G) = 2 * nu (triangles G)`. It applies the lead's proved block parameter additivity through `blocks_equality`. No degeneracy hypothesis is required for this direction.

The final source prints complete theorem types with explicit implicit parameters (`#check @...`) and transitive axioms. Both completed final milestones report exactly `propext`, `Classical.choice`, and `Quot.sound`. There are no additional mathematical hypothesis parameters besides the displayed component/decomposition premises, no placeholders, no custom axioms, and no native/unsafe proof shortcuts in this module.

## Limits

This module does not prove that a 5-degenerate graph satisfies Tuza's inequality, nor that equality implies the clique-component condition. Those are the remaining global directions of the combined target. Its completed equality converse and representation equivalence are unconditional in the stated graph/finite-type setting. Separate review and clean reproduction remain campaign-level acceptance obligations.

## Failed approach and correction record

The initial write/build orchestration was not executed because automatic approval review timed out; a permitted retry succeeded. Initial compilation found an unavailable `pair_subset_iff` name and then a finite-set/set coercion simplification mismatch; both were repaired using the actual `insert_subset_iff`, `singleton_subset_iff`, and `Finset.mem_coe` lemmas. The compiler logs retain these failures. No mathematical statement was weakened to obtain compilation.
