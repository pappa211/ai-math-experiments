> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Source-audit late-phase closeout index

Documentation-only record after the original research cutoff, 2026-11-16. Mathematical research and proof verification stopped at 05:10:41.328 UTC. This agent owns no running job. The coordinator owns the campaign-wide report, status matrix, source-integrity ledger, final private commit and final deadline.

Unrestricted Tuza, unrestricted CS and original H-D remain unresolved. The late H-D deductions below constrain a hypothetical strict original H-D graph; they do not supply the missing global survivor lower bound or prove existence of a cone representation. No new census is authorized or suggested by this index.

## Original H-D ordinary chain

The exact fixed-cover interface is in `hd_minimum_cover_colored_interface_v1.md`. In the strict branch tau=2k-1, every minimum cover hits every actual triangle exactly once. The cover-replacement inequalities retain actual graph endpoints. Its nearly-bipartite-cover consequence separately uses the declared rainbow-three-color equality input; the elementary exact-one and replacement identities do not.

The reconstructed Wang book exchange is attributed to arXiv2609.13831v1, Section2, but the elementary exchange is fully supplied in the notes; no global Wang bound or formal verification is imported. The chain is:

* `hd_wang_full_survivor_exclusion_v1.md`: universal residual COVER equality excludes survivor packing q=k.
* `hd_wang_one_missing_survivor_exclusion_v1.md`: the same cover-side hypotheses exclude q=k-1.
* `hd_wang_book_defect_count_v1.md`: for q paired books, s=k-q singleton triangles and g distinct unused-red good opposites, d=q-g<=s-1.
* `hd_distinct_good_books_residual_reduction_v1.md`: all-good distinct books give an exact B residual after deleting all singleton triangles. Availability of that special state is not assumed.
* `two_edge_glued_k4_triangle_restoration_v1.md`: restoring one missing triangle to arbitrary B background plus two K4s sharing an edge is strictly below equality. Arbitrary attachments and actual crossing triangles are handled.
* `hd_two_missing_survivors_exclusion_v1.md`: using FULL original H-D and the preceding restoration modules, q=k-2 is excluded as well. Thus every chosen maximum packing/minimum cover has q<=k-3 in the hypothetical strict original H-D branch.

The last step uses original residual PACKING equality and a classified-residual H-D theorem; those premises are not imported into intermediate near-tight residuals. The coordinator accepted this exact distinction.

## Parameterized book structure and counts

`red_book_tree_rerooting_v1.md` proves diagonal flips and rerooting in the actual red-book pseudoforest. A nontrivial tree rooted at an unused red edge has an exact K4-page description outside the singleton blue edges. Different rooted trees have disjoint edge supports; K4s within one tree may share red edges. Rooted-tree availability does not eliminate uncontrolled spines or their outside attachments. The literal seven-vertex guardrail in this note shows why a regular K4 need not be an entire actual triangle component.

`red_book_residual_family_and_blocker_kernel_v1.md` gives the complete residual-family partition into those rooted-tree K4 families and books on b uncontrolled spines, with b<=s-1. In a blocker-free FULL original H-D graph, a regular K4 meeting the exceptional vertex set in at most one vertex gives a two-edge blocker by TRIANGLE-FAMILY inclusion, not edge-graph inclusion. The resulting bound is

    k <= binom(5s-2,2)+2s-1.

`red_book_diagonal_singleton_bound_v1.md` gives the stronger count without blockerlessness or residual packing equality. Every red diagonal of a regular K4 needs a third global page by residual-cover rigidity, and the two diagonals force vertices from two different singleton triangles. Hence

    q <= 9 binom(s,2)+2(s-1),
    k <= 9 binom(s,2)+3s-2.

All three notes have fresh restoration reviews as well as coordinator reconstruction. These are genuine all-size necessary conditions; s remains unbounded. They do not close the existential lower-survivor bridge.

## Final cone interfaces

`all_minimum_exact_cone_unique_family_v1.md` and its fresh restoration/coordinator reviews establish the following conditional structure. In a whole cone G=h+L with all minimum covers exact-one and triangle codegree at least two, a chosen minimum cover is spoke set S plus all bases of a triangle-free rim A=L[B]. S is independent and dominates B. The assigned A-page family has UNIQUE minimum cover E(A). Its exact induced-neighborhood inequalities use ordinary vertex covers, not matching numbers.

`cone_exact_cover_local_matching_interfaces_v1.md` has a PRE-CUTOFF coordinator ACCEPT in `review/coordinator_final_active_interfaces_review.md`, recorded at 05:06:54 UTC. It is not pending. Its consequences are local saturation on each A-star, avoidance of each A-active vertex by a cross-family maximum matching, and, under exact residual-cover loss one, a size-|S| cross matching avoiding BOTH endpoints of each prescribed A-edge. Appending the associated hub page gives nu>=|S|+1 and, in strict H-D, |E(A)|>=k.

`cone_residual_cover_common_apices_v1.md` has a pre-cutoff challenger ACCEPT. Residual-cover rigidity forces every A-edge to have at least two common S-neighbors, in addition to its hub page. The resulting K5-minus-an-edge is a literal subgraph, not a classified actual component.

The remaining simultaneous-selection question is explicit: can these strict induced-palette and two-vertex-avoidance constraints force a sufficiently large global compatible page packing? Per-star Hall does not supply a global list edge coloring; no abstract matroid or rainbow-matching minmax is invoked. The whole-cone hypothesis is itself unavailable in unrestricted H-D.

The separate elementary `all_minimum_exact_triangle_free_cone_blocker_v1.md` records a one-edge blocker for a triangle-free cone under ALL-minimum exactness. Its exact cone identities and bipartite matching-cover input are displayed. The pre-cutoff ACCEPT is recorded in `review/coordinator_late_structural_results_review.md`; its location was confirmed during documentation-only closeout, without new mathematical verification.

## The only late targeted computation

The coordinator authorized one fixed graph-atlas discriminator for the proposed lower-survivor bridge, with 30-second external deadline and 2200MiB process-tree ceiling. It is a new candidate probe, not a historical census replay.

Admission, script, monitor and literal evidence are separately named in `hd_survivor_lower_bridge_atlas_boundary.md`. The run processed all 1253 fixed NetworkX atlas graphs through seven vertices in 0.250205 external seconds, peak 41.5 MiB, with 0 UNKNOWN. Of 62 near-tight cases, 44 failed ALL-minimum exactness and 18 qualified; each qualifying graph supplied the requested existential survivor witness. EVERY qualifying case had nu=2, tau=3. The three nu=3, tau=5 cases failed ALL-minimum exactness. Thus the run supplies no positive test at k>=3 and no global proof. It is retained as a producer discriminator with literal evidence, not relabeled an independently validated census or formal certificate. No enlargement or rerun followed.

## Late independent reviews

The review files listed in `operations/source_audit_late_phase_scoped_hashes.json` preserve exact evidence boundaries:

* Two-apex forest matching>=4 exclusion and matching-three reduction: ordinary symbolic reviews.
* Matching-at-most-two assembly: finite P6 premise retained; this reviewer did not duplicate the coordinator's independent validator.
* Degree-two WKE residual exclusion: ordinary.
* Two-link isolated-vertex bridge and complete one-cycle-cover CS assembly: the relevant independently validated finite domains remain explicit; no duplicate run by this reviewer.
* Total-cover-cycle-rank-at-most-two Tuza inequality: accepted corrected v2, with the nonisolated-vertex qualification and inherited one-cycle finite premises.
* Cone matching/robustness boundary: ordinary counterexample with nu5, tau7, refuting only the omitted-tightness shortcut.
* `source_audit_four_branch_ordinary_completion_review.md`: completed before cutoff. It checks the new ordinary two-disjoint-doubles construction, the triangle-free many-even assignment plus paid collapse, exact 2K2/K3/P4 coverage and the extra-even bipartite residual. Earlier named ordinary inputs remain dependencies rather than newly re-audited proofs. The replacement removes the old 363/5375 finite premises from this four-branch assembly; it does not retroactively remove unrelated finite inputs elsewhere.

Earlier mission source-audit findings remain unchanged: the located original eq.c is an equality checker despite its stale PK comment; pk.c and historical complete input/build receipts were unavailable, and reported PK totals remain REPORTED_UNVERIFIED. No historical census was reconstructed. The earlier independent D-extension counterexample and Petersen cover-side/packing-side boundaries retain their previously frozen exact scopes.

## Receipt limits

The late-phase manifest hashes explicitly selected artifacts and review receipts only. It is not a full archive integrity claim. No source/archive mutation, install, remote computation, publication, external outreach or post-cutoff mathematical verification was performed by this agent. All proof reviews are AI reviews, not external human review or Lean verification. The final private commit and source-wide integrity checks belong to the coordinator's closeout.
