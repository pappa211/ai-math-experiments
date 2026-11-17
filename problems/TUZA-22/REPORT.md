> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-22 — final research report

Unrestricted Tuza remains unresolved. No Tuza counterexample or tight non-B counterexample was found. The campaign produced reviewed restoration theorems, broader cover classes satisfying Tuza/CS, ordinary closed-link exclusions, a sharper original-H-D program, and a certified refutation of two private-packing extension variants.

Research ended at the **scheduled cutoff**, not because a candidate failed or ideas were exhausted. The original clock was preserved: start **15 November 2026 21:40:41.328 UTC**; research cutoff **16 November 05:10:41.328 UTC**; final deadline **05:40:41.328 UTC**. These are 22:40:41, 06:10:41 and 06:40:41 in Europe/Oslo. Substantive research lasted 7h30m. The remaining authorized interval was reserved for this documentation, scoped integrity checks and the private checkpoint; no mathematical verification was continued after cutoff. Actual checkpoint time and elapsed duration are in [FINAL_RECEIPT.md](FINAL_RECEIPT.md) and the owner-facing completion message.

All mathematical computation ran on the owner's Darwin arm64 Mac under the existing math-research root. No installation, cloud/server computation, SSH job, publication, outreach or automatic follow-on mission occurred. Reviews were internal AI reconstruction; no external human review, new Lean proof or historical originality claim is made.

## Definitions and final target status

Triangle packings are edge-disjoint and may share vertices. Covers use actual graph edges. B means that every nonempty component of the entire triangle family, adjacent under sharing an edge, has literal K4 or K5 support. This permits triangle-free background and shared vertices, but includes every crossing triangle. It is not a statement about ordinary graph blocks. CS is Tuza's inequality together with equality exactly at B.

| Target | Final status |
|---|---|
|Unrestricted Tuza|OPEN; no verified unrestricted proof or counterexample|
|Universal CS|OPEN; no certified tight non-B witness|
|R2, arbitrary at-most-two-edge restoration over B|ORDINARY PROOF; the required restoration bridge is closed|
|R1, one missing triangle restored over B|ORDINARY PROOF; full inequality and equality scope established|
|Full R3, at most three arbitrary edges restored over B|ORDINARY PROOF; stronger than the initial target|
|H-D-CS-min and H-D-CS-broad|OPEN; no universal one-/two-edge blocker established|
|Original H-D|OPEN globally; through packing number 5 with explicitly declared historical inputs, plus new all-size conditional mechanisms|
|C21-D-all and C21-D-some-extension|REFUTED by a literal 52-vertex witness|
|C21-D-some-choice|OPEN; the same witness has a successful alternative private maximum packing|
|PK-all and PK-exists|OPEN; historical reported totals remain unverified|
|A1 packing-one-component availability|OPEN; inherited stronger availability route remains unproved|

Full claim-specific scopes, predecessors and evidence levels are in [STATUS_MATRIX.json](STATUS_MATRIX.json). The main remaining bridges are separated in [GLOBAL_OBLIGATIONS.md](GLOBAL_OBLIGATIONS.md).

## 1. Restoration: named bridges removed, availability still missing

The initial R2 target now has an ordinary proof for arbitrary attachments and background edges. R1, restoration of two edge-disjoint missing triangles, and the specified triangle-plus-edge interface also have ordinary proofs. The final R3 theorem proves full CS for B(H) plus **any set of at most three nonedges**. Its five restored-edge shapes are treated symbolically, with complete old-block footprints. The proof explicitly handles a possible inequality violation; equality classification is not substituted for the inequality.

These are global mechanism advances within the proposed induction architecture: R2 removes the named restoration obligation in the blocker-to-CS chain, and R1 eliminates tight triangle residuals. They do not supply the blocker or classify arbitrary near-tight residuals. Sources: [R2](notes/r2_proof_v1.md), [R1](notes/r1_proof_v1.md), [full R3](notes/three_edge_restoration_full_cs_v1.md); fresh combined review: [restoration review](review/coordinator_R3_defect_one_and_isolate_review.md).

A connected resilient deficit-one residual that **already admits a two-edge B deletion** is classified: K5-e, or a root K4 with one/two K4/K5 attachments on adjacent edges. Its packing number is at most 5, sharply. Arbitrary missing-triangle restoration from every such residual is strict. The larger literal fresh-clique edge-gluing deficit-one class is also excluded as a minimum-CS triangle residual by strict restoration. Its sharp packing bound 7 belongs only to that construction class.

The remaining restoration difficulty can be stated precisely. Non-strict triangle restoration from any deficit-one graph forces either an actual six-cycle with an independent alternating triple whose deletion lowers packing by at least 2, or an exact K5-e new family whose old spokes occur in no minimum old cover. A three-page book completed to K5 controls the latter branch. Neither alternative is generally excluded. See [general restoration alternative](notes/coordinator_defect_one_triangle_restoration_alternative_v1.md) and its [fresh review](review/restoration_defect_one_triangle_alternative_review.md).

## 2. New cover classes

Full CS has an ordinary proof, using the explicitly inherited class-local lemmas, for every graph admitting **any** triangle-edge cover whose connected components are trees or literal triangles. The supplied cover need not be minimum. The proof closes the weighted TREE obligation through a self-contained anchored forest argument, coherent component compatibility and exact equality substitutions. See [tree/K3-cover theorem](notes/challenger_tree_triangle_cover_cs_v1.md) and [review](review/tree_triangle_cover_cs_independent_review.md).

Full CS also holds whenever some cover has **total selected cycle rank at most 1**. This proof retains three independently validated finite interfaces: 2,018 P6 states, 2,422 isolate states and 8,220 final link states. Ordinary all-size reductions derive those exact domains and handle arbitrary outside attachments; the computation does not enumerate arbitrary ambient graphs. A genuinely non-WKE boundary was excluded by comparing two full neighboring links, not by asserting local WKE availability. See [one-cycle CS assembly](notes/challenger_one_cycle_cover_cs_v1.md) and [independent assembly review](review/one_cycle_cover_cs_independent_assembly_review.md).

A direct insertion corollary proves Tuza's inequality for any triangle cover of **total cycle rank at most 2**, inheriting those finite premises. Equality classification at rank 2 remains open. See [rank-two theorem](notes/challenger_two_cycle_cover_tuza_v2.md).

A separate ordinary reduction says that any pseudoforest cover in a minimum-CS failure must be a spanning disjoint union of cycles after isolates are discarded. Arbitrarily many cycle components and their interactions remain. In particular, selected C5 and K3-plus-edge configurations prevent a general K5-free inference. These are scoped theorems; no unrestricted cover-shape availability is supplied.

## 3. Ordinary link mechanisms, including the final replacement proof

The simultaneous paid-cover argument bounds a WKE matching by a chosen vertex set, its outside matching mates, and the number of actual remaining triangles. The triangle-free residual interface uses the entire local cone and complete old-block footprints. It excludes an equally large residual matching, hence bipartite residuals, and supports further maximum-degree-two and whole-cone exclusions. The proper-cone branch with outside pages remains open.

The last non-WKE C4-bouquet boundary was excluded by a different balanced reduction: pack a rim triangle and two hub triangles per component, then prescribe supported residual edges simultaneously in old minimum covers. This completes **ordinary apex-pseudoforest exclusion**. Every closed link L in a minimum-CS failure satisfies

    cycle_rank(L) >= maximum_degree(L)+1,
    |E(L)| >= |V(L)|+3.

At least one component of each L-w is multicyclic; the statement is not that every component is.

Immediately before cutoff, explicit thread matchings completed an **ordinary proof that every nonempty closed link has at least five branch vertices**. The new proof covers triangle-free links without historical WKE availability and replaces the earlier 363-record/historical 5,375-record dependencies for this particular result. Its finite predecessor remains preserved. Three fresh reviewers accepted the final assembly before cutoff. This does not remove the separate 2,018/2,422/8,220 premises from the one-cycle-cover theorem.

Sources: [apex-pseudoforest assembly](notes/apex_pseudoforest_full_exclusion_v1.md), [ordinary four-branch completion](notes/coordinator_four_branch_ordinary_completion_v1.md), [fresh completion review](review/challenger_four_branch_ordinary_completion_review.md). These are scoped all-size exclusions, not a contradiction for arbitrary links.

## 4. Original H-D remains a distinct active architecture

Original H-D assumes, for every actual triangle T, packing drops from k to k-1 and the residual cover number is2k-2. It is not replaced by minimum-CS hypotheses. The strict branch tau=2k-1 forces every minimum cover to meet every triangle exactly once.

Let P be any maximum packing, delete its non-cover (“blue”) edges, let Q be a surviving packing of size q, and put s=k-q. Under the full original strict H-D hypotheses, the new ordinary exchange/restoration chain gives **q<=k-3**. Rerooting an auxiliary red-book tree controls every actual page on its red bases. After singleton-triangle deletion, the entire residual family consists of those rooted-tree K4 families plus at most s-1 uncontrolled common-spine families. The K4s are not silently promoted to whole triangle components; a literal seven-vertex attachment control rules that out.

A further ordinary diagonal argument, using the cover-deletion hypotheses alone, gives

    q <= 9*binom(s,2)+2(s-1),
    k <= 9*binom(s,2)+3s-2.

This is a parameterized restriction, not a bound on k independent of s. A regular K4 with a star boundary directly gives the desired blocker. What remains is a survivor lower bound or a compatible simultaneous replacement across the uncontrolled families.

The all-minimum-cover quantifier also yields exact cone interfaces: a triangle-free-cone component has a one-edge blocker; for cones with rim triangles, the assigned all-base cover is unique, each local star has a full private packing, and a cross-family matching can avoid both endpoints of each prescribed rim base. Every rim base has at least two nonhub apices. Global simultaneous page selection remains unproved. No unrestricted cone availability or list-coloring minmax is assumed.

Sources and reviews are indexed in [H-D/source late-phase index](notes/source_audit_late_phase_closeout.md). The one atlas discriminator of a proposed survivor lower bridge had only 18 qualifying graphs, **all with k=2**; it supplies no higher-k evidence and was not expanded.

## 5. Decisive auxiliary refutations and preserved boundaries

Four Clebsch cones glued cyclically give a 52-vertex, 216-edge graph with 160 actual triangles, tau=44 and nu=32. A minimum cover C of size 44 has a maximum private packing Q of size 20 that is already maximal in the full graph, so no extension reaches the required 22 triangles. This refutes both D-all and D-some-extension with their exact quantifiers. Another maximum private Q of size 20 for the same C extends to 32, so D-some-choice remains open. Ordinary cover lower bounds using declared Clebsch facts and independent literal/optimization checks support the witness. See [witness proof](notes/challenger_D_counterexample.md), [independent review](review/d_extension_counterexample_review.md) and [literal certificate](evidence/d_extension_literal_input.json).

Other rejected shortcuts include prescribed forest anchors, normalization of every pseudoforest cover to tree/K3 components, automatic spare cost in a minimum spanning-cycle cover, arbitrary private-page completion, and cone-matching rigidity inferred from local robustness alone. The final cone boundary has matching number 5, cone packing number 5 and cover number 7: it satisfies the proposed local tests while remaining strict. None of these is a Tuza counterexample. Frozen exploratory UNKNOWN records retain their original meaning.

## 6. Verification and census limits

| Evidence | Exact scope and result |
|---|---|
|Restoration discriminator|1,145 retained constructed labelled graphs on 11–14 vertices; 24 tight; no tight non-B exception; 21.862s, 82.594MiB. A sample, not an order census.|
|P6 interface|4,096 raw, 2,018 eligible; independently checked; five damaged controls rejected.|
|Isolate interface|26,944 raw, 2,422 eligible; independently checked; five damaged controls rejected.|
|Final cycle-cover interface|67,360 raw, 8,220 eligible; 57,954 degree/connectivity and 1,186 K4 exclusions; zero UNKNOWN; eight damaged controls rejected. Independent validation 1.437s, 159.969MiB.|
|Earlier four-branch 363 / apex-unicyclic 374 interfaces|Preserved predecessor evidence; ordinary replacement proofs now exist for those conclusions.|
|Historical Claude census|Reported totals remain REPORTED_UNVERIFIED; complete source/input provenance is unavailable.|

The independent validators regenerate domains and check literal matchings, covers, all actual triangles and whole clique footprints; they import no producer code. Some later validators reuse the coordinator's separately written certificate-checking kernel, which is disclosed. This is independent finite checking, not Lean verification. Exact monitored commands, capped attempts and reproducibility cautions are in [REPRODUCTION.md](REPRODUCTION.md).

The source intake located and hashed **eq.c** and **PK_RESULTS.txt** in the existing Claude output folder. It did not find pk.c, original graph-generation commands or complete input streams after the directed brief search. The original equality checker received explicit small graph6 controls; 40 selected restoration cases received separate independent rechecks. Its safe established domain is prevalidated short graph6 with n<=16. Its 12,005,168-graph/5,756-tight totals and the roughly 145-million PK packing total were not reproduced. The missing census package did not pause the mission or reset its clock, and no historical census was rebuilt merely to recover totals.

## 7. Integrity, provenance and remaining significance

The public source remained pinned at `4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4`, tree `f6716f2578ba5346960cbb69b9b2e0698b834b4f`; TUZA-20 at `62f522a9b0554ecfc92b1133cdbbfdd7f2eac7d7`; TUZA-21 at `3b8759da5c530e52f24fe137827a79b25c804155`. All three source worktrees remained clean. All 29 selected before/after source checks passed, including four additional historical TUZA-19 dependencies. This is scoped detection and operating discipline, not OS-enforced immutability or a full-archive audit.

Primary-source mechanisms and access limitations are documented in [PRIOR_ART.md](PRIOR_ART.md). Wang's inspected actual one-red exchange is used at its stated elementary scope; neither its global bound nor its reported formalization is imported. The Chen–Diao–Hu–Tang bibliographic correction and the planar/degree-bounded equality scopes are retained. No novelty claim is inferred from searches.

The principal advance is removal of several named restoration and local-structure obligations, with explicit descriptions of what remains. The central unresolved step is still global: establish a suitable blocker/residual/cover representation, or solve the surviving simultaneous-selection problem. This campaign stops because its authorized research period ended. It does not certify scientific exhaustion or start another mission.

Checkpoint preparation completed at 2026-11-16T05:24:56.425810+00:00, 7h44m15s after the original start. The final commit hash and clean-state check are reported outside that commit as described in FINAL_RECEIPT.md.
