> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Proofs and obstructions — live index

Every ordinary result below is scoped; none proves unrestricted Tuza or CS. Reviews are internal AI reconstruction, not human peer review or Lean verification.

| Result | Full argument | Fresh review |
|---|---|---|
| Existing M0/residual reconstruction | notes/restoration.md | review/m0_residual_independent_review.md |
| R2 all attachments | notes/r2_proof_v1.md | review/r2_independent_review.md |
| R1 all attachments | notes/r1_proof_v1.md | review/r1_independent_review.md |
| Two missing edge-disjoint triangles | notes/two_triangle_restoration_v1.md | review/two_triangle_restoration_independent_review.md |
| Matching triangle transversal | notes/matching_cover_proof_v1.md | review/matching_cover_independent_review.md |
| k2 defect-one classification | notes/k2_defect_one_proof_v1.md | review/coordinator_k2_review.md |
| k3 kernel/density, declared inputs | notes/k3_cover_kernel_proof_v1.md | review/coordinator_k3_review.md |
| H-D plus one B residual | notes/hd_one_classified_residual_v1.md | review/coordinator_hd_classified_review.md |
| Two glued Clebsch cones, successful D family | notes/challenger_interacting_clebsch.md | review/coordinator_interacting_review.md |
| Four-cone D-all/some-extension counterexample | notes/challenger_D_counterexample.md | review/d_extension_counterexample_review.md |
| Independent ordinary counterexample cover lower bound | review/clebsch_cycle_cover_ordinary.md | coordinator ordinary reconstruction plus independent exact table |

The decisive D witness has exact tau44,nu32,minimumC44,private maximumQ20 and no extension. Its full literal graph and certificates are evidence/challenger_D_counterexample.json; independent reconstruction uses evidence/d_extension_independent_literal_input.json (see manifest for actual frozen filenames) and scripts/d_extension_independent_validator.py. A good alternate Q20 extends to32, preserving the existential-choice boundary.

Finite restoration sample: evidence/restoration_cases.jsonl and restoration_neartight.json; exact recurrences scripts/exact_graph.py. No exhaustive graph-order claim. Other exploratory failures and UNKNOWN attempts retain their own scripts and receipts, and are not admitted as theorems.

## Additional reviewed results

- Book residual restoration: notes/book_residual_triangle_restoration_v1.md and review/book_residual_restoration_independent_review.md.
- Active-kernel peeling and one-component defect-one residual: notes/active_kernel_peeling_v1.md and review/active_kernel_peeling_independent_review.md.
- Oddcycle and generaltriangle-freeWKElink exclusions: notes/odd_cycle_link_exclusion_v1.md, notes/triangle_free_wke_link_exclusion_v1.md, review/wke_and_odd_cycle_independent_review.md. General theorem declaresKotzig, directoddcycleproof isself-containedwithinM0/clique facts.
- Eight-edgecoverkernel: notes/k4_cover_kernel_proof_v1.md, review/coordinator_k4_kernel_review.md. Initiallyn<=13.
- MinimumcoveroneTplusmatching: notes/triangle_plus_matching_cover_v1.md, review/triangle_plus_matching_cover_independent_review.md. Combinednu4kernel now n<=12; noexclusionyet.
- Hereditarysmall-kCS and originalH-Dcorollaries: notes/hd_small_k_corollaries.md, pendingcoordinatorfreshclassminimalityaudit.

## Further structural and optimization results (reviewed during active research)

- Every prescribed two-triangle packing in a minimum CS failure extends to a maximum packing: `notes/two_triangle_extension_minimal_v1.md`, fresh review `review/two_triangle_extension_minimal_independent_review.md`. Three-triangle extension is not inferred.
- Connected matching covers satisfy tau<=nu+1, and r isolated cover bases with a nonempty remaining cover part force nu>=r: `notes/connected_matching_cover_bound_v1.md`, `notes/isolated_cover_edges_bound_v1.md`, with named independent reviews in STATUS_MATRIX.json.
- A connected edge-resilient defect-one graph admitting one B triangle deletion has nu<=7. The bound is attained by a K4 with three K5s attached along its spokes. This is not a bound on arbitrary near-tight graphs: `notes/resilient_defect_one_classified_residual_v1.md` and `review/isolated_bases_and_classified_defect_one_review.md`.
- Exact independent-side cover optimization and critical-spoke swaps preserve a triangle-free subset constraint. Dropping it is false, witnessed by an unbounded actual graph family: `notes/challenger_independent_side_cover_identity_v1.md`, `notes/challenger_independent_side_critical_swaps_v1.md`, `notes/minimum_cover_private_cover_gap_v1.md`. These results do not supply a packing min-max theorem.
- Complete independent apices yield a strict private-packing half bound under full minimum-cover optimality: `notes/challenger_universal_apex_private_strictness_v1.md`.
- An apex-forest closed link with a perfect forest matching cannot occur in a minimum CS failure: `notes/apex_forest_perfect_link_exclusion_v1.md`, independently reconstructed in `review/challenger_apex_forest_perfect_review.md`. The nonperfect forest branch is under investigation.

## Forest anchor and weighted TREE, accepted at 02:04 UTC

The self-contained existential forest anchored packing-cover theorem is proved in `notes/challenger_forest_anchored_cover_v1.md` and freshly accepted in `review/forest_anchored_cover_independent_review.md`. Together with the accepted forest external-family minmax, it removes the full weighted TREE local-availability obligation. The stronger fixed maximum-packing residual inequality remains open and is unnecessary for this result. The literal K4/C4 control prevents extending the anchor verbatim to every unicyclic cover.

The mixed minimum tree/triangle-cover inequality is accepted in `notes/challenger_tree_triangle_cover_tuza_v1.md` and `review/tree_triangle_cover_tuza_independent_review.md`. The stronger any-cover normalization has been frozen as v2 and is undergoing final independent reconstruction. Neither version currently classifies equality.

## Accepted 04:31 UTC: full R3 and two-edge defect-one representation

Full CS for B plus at most three arbitrary edges is ordinary, assembled in notes/three_edge_restoration_full_cs_v1.md. The connected resilient defect-one/two-edge-B representation has the sharp packing bound five and exact supports in notes/resilient_defect_one_two_edge_B_classification_v2.md. Shared-edge connectivity is required. Both freshly reconstructed in review/coordinator_R3_defect_one_and_isolate_review.md; neither supplies residual availability. The same review records the independently validated2422-case isolate subdomain and conditional two-link global transport.

## Accepted 04:40 UTC: one-cycle-cover CS and the red-book kernel

Full CS for any triangle cover of total cycle rank at most one is assembled in notes/challenger_one_cycle_cover_cs_v1.md, with independently verified interfaces of2018,2422 and8220 records. This is PROOF_USING_FINITE_CERTIFICATES. The ordinary strict restoration from classified resilient two-edge-B residuals is notes/classified_two_edge_B_residual_triangle_restoration_v2.md; v1 background-footprint wording is corrected explicitly. Parameterized rerooting, actual residual-family decomposition and the original-H-D star-boundary blocker kernel are in notes/red_book_tree_rerooting_v1.md and notes/red_book_residual_family_and_blocker_kernel_v1.md. Fresh coordinator reconstruction of all three chains: review/coordinator_cycle_CS_and_book_kernel_review.md.

## Accepted late structural results, 04:55 UTC

The former three-neighbor-C4 bouquet obstruction is excluded by an ordinary reduction using rim and hub triangles; full apex-pseudoforest exclusion and strict link excess now follow. Any cover of cycle rank<=2 gives Tuza, inheriting the finite rank-one CS premises. Fresh-clique deficit-one components have strict triangle restoration; the exact two-edge-B class has strict edge insertion except completion toK5. The H-D red-diagonal count strengthens to k<=9binom(s,2)+3s-2 under cover-deletion hypotheses alone. A general deficit-one triangle-restoration alternative identifies a damaging independent-alternating C6 or cover-ineligible K5-e spokes. Complete source/review paths and scopes are in STATUS_MATRIX.json and review/coordinator_late_structural_results_review.md.

## Final pre-cutoff ordinary replacement

The full at-most-four-branch closed-link exclusion now has an ordinary proof in notes/coordinator_four_branch_ordinary_completion_v1.md, independently reconstructed in review/restoration_four_branch_ordinary_completion_review.md. Explicit thread matchings resolve all2K2/K3/P4 doubled-pair shapes; the triangle-free large-even branch uses its explicit assignment tuple plus S-empty cover collapse. Neither the historical5375-state WKE table nor the363-record predecessor is a premise. Their evidence is preserved. The remaining standard bipartite matching-cover input is explicit.
