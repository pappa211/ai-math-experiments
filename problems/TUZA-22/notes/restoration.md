> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-22 restoration lead: dependency reconstruction and research ledger

## Authenticated dependency scope

Read the copied TUZA-15 `verification/FROZEN_TARGETS.md` and `verification/INDEPENDENT_PROOF_AUDIT.md`, and the actual pinned public proof `papers/tuza-five-degenerate/main.md`, §§1–2, Lemmas2/2A/3/3A. Also inspected public `problems/TUZA-15/PROOFS_AND_OBSTRUCTIONS.md`, initial scope statements and §5 SEP. Public pinned commit: 4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4. The full M0 reduction is class-independent within any subgraph-closed class. No five-degeneracy or mad<7 premise enters this local proof. The final sparse discharging theorem is not imported.

The following is a reconstruction of existing work, **not a new discovery**.

## 1. Actual components and elementary clique inputs

Triangle components use shared **graph edges**, with every actual triangle counted. Their edge supports are disjoint. A triangle formed from edges of one support is an actual triangle sharing an edge with that component and therefore belongs to it; an actual triangle cannot silently join several different components. Thus nu and tau add over component supports. Triangle-free background edges do not affect either parameter.

K4 has nu1,tau2: two opposite edges cover and no two triangles are edge-disjoint. K5 has nu2,tau4. Two triangles pack. Three would use nine edges and leave one edge, but a union of edge-disjoint triangles has even degree at every vertex, whereas K5 minus one edge has two odd degrees. Three cover edges hit at most nine of ten triangles since each edge lies in three; a2+3 partition gives four within-part cover edges.

A maximum K4 packing avoids a star by using the opposite face. A maximum K5 packing avoids any pair: for forbidden12,13 use145,234; for forbidden12,34 use135,245. Each clique edge can belong to a minimum cover: pair it with its opposite in K4, or use a2+3 partition with that edge as the two-vertex part in K5.

Consequently, in B(H), every single edge can be avoided by a maximum packing. A two-edge set lowers nu exactly when its two members are opposite edges of one K4 component. Proof: separate components contribute at most one forbidden edge each; within K5 any pair is avoidable; within K4 adjacent pairs form a star and are avoidable, while opposite edges hit all four triangles. Background edges have no effect. This characterizes actual-edge pairs, including triangle-free background.

## 2. Lemma A: one-edge insertion

Suppose B(H), uv is absent, and adding uv creates actual triangle uvw. Its old edges uw,vw cannot both lie in one old clique component, since that component would contain u,v and force uv present. Each supported spoke can therefore be avoided by its component's maximum packing, and unsupported spokes are avoided automatically. Appending uvw gives nu(H+uv)>=nu(H)+1. A minimum H-cover plus uv gives tau(H+uv)<=tau(H)+1=2nu(H)+1<=2nu(H+uv)-1.

No hypothesis excludes background edges or vertex-sharing components.

## 3. M0: full combined minimality

Let CS be unrestricted inequality plus exact B equality classification. B implies equality universally by the clique calculation and component additivity. If CS fails in a subgraph-closed class, choose a failure G with fewest edges, discarding isolated vertices. Every proper edge-subgraph satisfies CS. A failure has tau(G)>=2nu(G); put k=nu(G).

G has at least one triangle. A triangle-free edge could be deleted without changing tau,nu or B, contradicting minimality. If triangle support had more than one component, each component support would be a proper subgraph. Summing its CS inequalities gives the inequality for G; equality of the sum forces equality and B in each support, hence B(G). This also contradicts failure. Therefore the actual triangle support is nonempty and shared-edge connected, and all edges are supported.

For any edge e, deleting e lowers nu by at most one: discard the at most one packing triangle using it. If nu(G-e)=k-1, proper-subgraph CS and reinsertion give tau(G)<=tau(G-e)+1<=2k-1, contradiction. Hence nu(G-e)=k. Induction gives tau(G-e)<=2k. If equality held, induction would supply B(G-e); e is supported in G, so Lemma A gives nu(G)>=nu(G-e)+1, contradiction. Thus tau(G-e)<=2k-1. Since edge deletion reduces tau by at most one,

    2k <= tau(G) <= tau(G-e)+1 <= 2k.

All equalities follow:

    tau(G)=2k,
    nu(G-e)=k,
    tau(G-e)=2k-1 for every actual edge e.

This eliminates the Tuza-violation branch of the smallest CS failure. It does not prove unrestricted H-D, the combined target CS, or any blocker.

## 4. Exact residual consequences

For any actual triangle T, let H=G-E(T). Appending T to an H-packing gives nu(H)<=k-1. Restoring its three edges gives tau(H)>=2k-3. Proper-subgraph CS gives tau(H)<=2nu(H). For k>=2 the integer bounds imply nu(H)>=k-1; for k=1 the upper bound and nonnegativity force nu(H)=tau(H)=0 directly. Therefore

    nu(H)=k-1,
    max(0,2k-3)<=tau(H)<=2k-2.

If tau(H)=2k-2, H is tight and B(H) follows from proper-subgraph CS. If tau(H)=2k-3, H has defect one; CS does not classify it.

If S has one or two edges and nu(G-S)<k, put H=G-S. Then tau(H)>=2k-|S|>=2k-2, while proper-subgraph CS and the packing decrease give tau(H)<=2nu(H)<=2k-2. Thus |S|=2 (single deletions preserve nu by M0), nu(H)=k-1,tau(H)=2k-2, and B(H).

The exact conditional global bridge is:

    M0 + H-D-CS-min + R2 => no minimum CS failure => CS => Tuza.

Here H-D-CS-min asserts existence of such a one-/two-edge packing blocker in every minimum CS failure. H-D-CS-broad has different, broader hypotheses and would suffice if proved, but M0 identities cannot be imported merely from broad edge-cover-criticality. Original H-D is a distinct still-open target.

## 5. Reconstructed worked attachment diagnostic

In the tight triangle-residual branch let T=abc, H=G-E(T), and U={a,u,v,w} be a literal K4 triangle component in H. Suppose restoring T creates pages abu and acv with u!=v. Let R=H-E(U). Since H is B and U contributes nu1,tau2, component additivity gives nu(R)=k-2,tau(R)=2k-4 and B(R). Equivalently, this tightness licenses proper-subgraph CS. In particular k>=2.

The vertices b,c are outside U because ab,ac are absent in H. The edges bu,cv survive in R. They cannot be opposite edges of a single K4 of R, since such a clique would require bc (absent already in H) and uv (deleted with U). By the two-edge avoidance characterization, a maximum R-packing avoids both. Append abu,acv,uvw. These are actual pairwise edge-disjoint triangles; their only R edges are bu,cv. Their number gives (k-2)+3=k+1, contradiction.

This repairs that exact exchange under combined induction. It establishes neither availability of U nor arbitrary restoration by itself.

## 6. New restoration results and exact remaining branch

- `r2_proof_v1.md`: full arbitrary-attachment two-edge equality restoration. Frozen for fresh AI review; source_audit accepted it at ordinary-proof scope. The central new interface is that all spokes of all pages on one absent edge meet each old clique component in at most one edge. Tight restoration forces bare pages; their cross-intersection reduces the actual new family to one disjoint-edge-support K4.
- `r1_proof_v1.md`: full arbitrary-attachment triangle equality restoration. Frozen for independent review. The independent terminal triple lets any two edge-disjoint pages append simultaneously. Tightness forces one common apex and again only one new disjoint-edge-support K4.

Subject to accepted R1 and R2, a minimum CS failure would necessarily have:

    every two-edge deletion preserving nu;
    every triangle deletion giving nu=k-1,tau=2k-3;
    every triangle contained in some minimum G-cover.

The last condition follows by adjoining its three edges to a residual minimum cover. It is not contradictory: K5 has the same triangle-cover containment property and two-edge packing resilience. The unresolved issue is exclusion/classification of the non-B case, not restoration from an already classified residual.

## Research decisions

Initial reasons to pursue R2: the precise conditional blocker-to-CS chain; strong actual-clique endpoint restrictions. Risks: unbounded page families and full footprint conflicts. The all-page footprint lemma handles the first exactly, and choosing bare pages avoids the second. This is symbolic, not extrapolation from a bounded test.

After R2 was frozen, R1 became short because the terminal triple is independent and the known two-page compatibility bound applies. Both are scoped global restoration theorems; neither supplies the missing blocker. Next investigation: consequences of uniform defect-one triangle residuals and necessary minimum-cover incidence, or a stronger separator/near-tight reduction that uses actual endpoints.


## 7. Subsequent accepted mechanisms and exact exploration failure

Fresh independent reviews accepted the ordinary all-size proofs in:

- `r2_proof_v1.md` / `review/r2_independent_review.md`;
- `r1_proof_v1.md` / `review/r1_independent_review.md`;
- `two_triangle_restoration_v1.md` / `review/two_triangle_restoration_independent_review.md`;
- `book_residual_triangle_restoration_v1.md` / `review/book_residual_restoration_independent_review.md`;
- `active_kernel_peeling_v1.md` / `review/active_kernel_peeling_independent_review.md`.

The two-triangle theorem gives full CS for B plus two edge-disjoint missing triangles, and directly CS for all graphs with nu<=2. Its one-triangle page matching interface is exact, not just an inequality. The book theorem treats a genuine defect-one residual class and explicitly leaves more complicated connected near-tight components open.

The active-kernel theorem is the strongest structural step in this line: restoring one independent triple permits simultaneous avoidance of the ENTIRE new-family footprint in each old B component, so nu decomposes exactly into old B packing plus an active graph. Proper-subgraph CS and the minimum-cover shared-edge saving then exclude every tight component from a minimum-CS triangle residual. Consequently each such residual has exactly one defect-one triangle component and no tight B attachments. This is a named all-size obligation removed (attachment peeling); it does not exclude the remaining connected component.

`hd_one_classified_residual_v1.md` supplies an explicit original-H-D transfer theorem, pending coordinator review at the time this paragraph was written: original H-D plus one B residual implies the blocker and, at k>=2, exactly K4 triangle components. Universal CS would imply original H-D through that explicit classification step, not by exchanging hypotheses with H-D-CS.

The proposed forced-spine cover interface failed decisively on the six-wheel. See `spine_interface_obstruction.md`; the literal ordinary proof distinguishes forced cover6 from ordinary tau3,nu3. The small screen is retained with its own identity and labeled-choice scope; it was not extended after the counterexample.

For the separate challenger, `review/clebsch_cycle_cover_ordinary.md` supplies an ordinary tau>=44 proof for the four-cone2K2 cycle, using declared Clebsch facts and four literal C4 boundary checks. It proves a local total-cover lower bound11+q/2, which sums across doubly counted shared edges. The finite conditional table is corroboration, not its proof premise.

Next exact main state: a minimum CS failure has k>=4 by the coordinator's separately reviewed small-cover-kernel argument, and deleting any actual triangle leaves one connected triangle-support component of defect1. The missing step remains exclusion of that connected near-tight residual or a legitimate blocker; no B classification is assumed for it.


## 8. Unbounded triangle-free link mechanism

`odd_cycle_link_exclusion_v1.md` gives a direct arbitrary-attachment exclusion of every closed odd-cycle link component of length at least5. It uses an explicit balanced matching/cover tuple, a rotated matching, and a second page supplied by codegree. The r=2 case recovers the prior C5 argument; longer odd cycles are the extension.

`triangle_free_wke_link_exclusion_v1.md` generalizes this to every triangle-free WKE closed link component. Balanced accounting supplies B; a larger link matching or an alternate maximum matching gives an augmentation with complete two-star footprint control. The unique-maximum branch becomes perfect by an unmatched-vertex swap. A derived induction using Kotzig's matching-bridge theorem then gives a strict vertex cover for L-M and closes that branch. The exact declared input is inspected Nenashev arXiv1402.0949v1, Theorem1; its local PDF hash is recorded in the proof.

`subcubic_hamiltonian_wke_v1.md` gives an elementary explicit WKE family: every Hamiltonian graph of maximum degree at most3, in either parity. Hence the general link exclusion reaches arbitrary cycle lengths with any matching of chords. These notes remain proof candidates until fresh review; none asserts that all triangle-free links are WKE.

## 9. Subsequent residual, boundary and cover mechanisms

The following additional notes have been frozen and independently reviewed in the continuing TUZA-22 work (their individual review files record exact scope):

- `one_edge_active_kernel_v1.md`: every single-edge residual of a minimum CS failure has exactly one nonempty defect-one triangle component and no tight B attachments. This is the one-edge whole-family footprint version of active peeling.
- `triangle_and_edge_restoration_v1.md`: full CS for B plus a missing triangle and another missing edge, provided that edge already creates a triangle before the triangle is restored. Consequently every minimum-CS triangle residual is packing-edge-resilient.
- `two_triangle_extension_minimal_v1.md`: EVERY prescribed pair of edge-disjoint triangles of a minimum CS failure extends to a maximum packing. Consequently every triangle in every single-triangle residual belongs to a maximum residual packing. This is stronger than deleting a subset of a preselected maximum packing.
- `k4_star_boundary_peeling_v1.md` and `safe_clique_patch_peeling_v1.md`: an already classified literal patch peels whenever a maximum patch packing avoids the entire actual outside-triangle boundary. For K4 this is exactly a star-contained boundary; for K5 exactly a C4-contained boundary. Arbitrary outside pages are included. Residual K4 leaves whose terminal lies only on the attachment edge therefore peel.
- `connected_matching_cover_bound_v1.md`: connected triangle support with a matching triangle cover satisfies tau<=nu+1. A spanning-tree choice of actual book pages gives the bound. Hence connected defect-one graphs with packing at least three admit no matching cover.
- `isolated_cover_edges_bound_v1.md`: rooting the same page-choice argument in the nonmatching part of a cover shows nu is at least the number of isolated cover edges. Every minimum cover of a connected defect-one graph therefore has at least nu-1 edges in its nontrivial cover components.
- `resilient_defect_one_classified_residual_v1.md`: a connected, edge-packing-resilient, defect-one graph with some B triangle residual has packing number at most seven. The bound is sharp: a root K4 with a fresh K5 attached along each of its three edges incident with one vertex has nu7,tau13 and deletion resilience. The fresh review contains the explicit sharpness proof.

These constrain the actual remaining defect-one component. They do not identify it with B, prove blocker availability, or imply that all larger maximal packings extend.

## 10. New all-size forest-cover class

The coordinator and restoration role jointly developed the two apex-forest link branches. Their self-contained versions are:

- `apex_forest_perfect_link_exclusion_v2.md`;
- `apex_forest_nonperfect_branch_v2.md`.

The nonperfect branch's v1 declared Gallai–Edmonds input was replaced in v2 by a proved forest alternating-reach decomposition, an elementary matching/vertex-cover leaf recurrence, and a direct triangle-free page augmentation. Thus neither v2 branch needs Gallai–Edmonds, Konig, Kotzig or a finite census as an imported theorem. Their shared inputs are the authenticated class-local M0/codegree/robustness and clique facts. The v1 files remain preserved with their original dependency labels; the self-contained v2 source is the operative stronger proof.

`forest_triangle_cover_cs_v1.md` assembles the hereditary-class consequence: every finite graph admitting ANY forest triangle-edge cover satisfies Tuza, with equality exactly when all nonempty triangle components are literal K4s. Restricting the forest cover proves heredity. A cover leaf gives an apex-forest closed link, excluded by the two branches. A K5 cannot have a forest cover because a bipartition of its selected forest leaves an independent triple uncovered. The assembled class theorem is sent for fresh review; the individual v2 branches have separate reconstruction records. No assertion of global forest-cover availability is made.

## 11. Exact failed constructions and remaining three-triangle branch

`near_tight_attachment_guardrails_v1.md` separates a genuinely unbounded connected defect-one family with a packing-critical book base from edge-resilient clique attachments. Neutral fresh clique attachment consumes cover-ineligible old edges and creates no new ones; the literal fresh K4/K5 edge-gluing class has a crude bounded packing consequence at defect one. This is not a bound for arbitrary near-tight graphs.

The coordinator-authorized overlap probe used only28.8 seconds of monitored computation, under2200MiB, and stopped/reconfigured on structural patterns. Its first hit merely completes K5-e and moves the defect to an attached K4. The obvious crossedge continuation has defect three. All six surviving neutral3/4-vertex-overlap upgrades in the second fixed target list merely replace an old K4 by K5. Four K5-e triangle-sum interface types likewise all increase defect to at least three. Exact scope and receipts are in `neartight_overlap_probe_diagnosis.md` and the named evidence; no finite survival count is a proof premise.

`three_triangle_restoration_scope_v1.md` proves the inequality for B plus three arbitrary edge-disjoint missing triangles, by applying CS to a two-triangle intermediate. Equality remains open. It also corrects an initially proposed transfer: even full CS for B plus three triangles would not alone imply extension of every three-triangle packing, because deletion of nine edges can leave packing k-4 and cover2k-9, a defect-one branch. In that branch all pair-deletion residuals have defect two. This remaining arithmetic branch is preserved explicitly.

## 12. One-cycle cover class and corrected availability boundary

The assembled forest-cover CS theorem has now passed fresh review. `one_cycle_cover_tuza_v1.md` then proves the inequality for every graph admitting any cover of total cycle rank at most one, equivalently a one-edge extension of the forest-cover class. Deleting a selected cycle edge leaves a forest cover; a strict residual absorbs the one-edge cover cost, and a tight B residual invokes the insertion lemma. Full equality classification for the one-cycle class remains open.

`cover_leaf_cycle_corollary_v1.md` proves that any selected cover leaf in a minimum CS obstruction must see a selected cycle after its parent is removed. For a one-cycle cover every leaf sees the entire cycle, and its parent lies off that cycle. Leaves are G-independent only in the connected unicyclic case; disconnected covers may have selected isolated K2 components whose two leaves are adjacent. `one_cycle_cover_structural_restrictions_v2.md` adds that a leaf forces the selected cycle to be induced, and every nonisolated G vertex has positive selected degree. The v2 explicitly discards isolates, correcting the v1 wording noted in fresh review.

`forest_cover_optimum_boundary_v1.md` supplies an ordinary unbounded warning: K3 joined to an independent set of size t>=3 has nu=tau=3, unique minimum cover equal to the cyclic core triangle, but minimum forest-cover size t+1. Thus class membership does not supply a forest-shaped minimum cover; the optimization gap is unbounded even at fixed ordinary parameters. The example is not edge-resilient or defect one.

## 13. Sharp literal clique construction and its insertion interface

`defect_one_fresh_clique_tree_classification_v1.md` sharpens the earlier crude bound for literal fresh K4/K5 edge gluings. At deficit one the only forms are two K5s sharing an edge, or one central K4 with one to three clique leaves on distinct edges of a star. Two adjacent attachments leave exactly one ineligible central edge; the third makes all edges eligible. Hence nu<=7, sharply. This is a construction-class classification, not an availability result for arbitrary near-tight graphs.

`k4_tree_vertex_avoidance_insertion_v1.md`, freshly accepted, proves that every fresh K4-only edge-gluing graph has a maximum packing avoiding any prescribed vertex. The proof is an explicit induction, and extends to actual triangle components plus triangle-free background. Any new edge producing a page at a vertex-avoidable apex therefore increases packing and gives strict Tuza. This excludes that whole existing generative family from the unchanged-packing forest-residual insertion branch. K5-e remains an essential positive control for the broader target.

The precise broader open target is: connected forest-cover H with deficit one and single-edge packing resilience, and a nonedge e with unchanged packing but cover increase one, should force H+e to be B (hence the connected K5 completion case). This has not been proved.

## 14. New available local restrictions on the actual minimum obstruction

`defect_one_perfect_tree_link_exclusion_v1.md`, freshly accepted, proves that an edge-resilient defect-one H with proper-subgraph CS has no closed perfect-matchable tree link component. Strict deletion forces a B residual. All external pages must lie on the unique rim matching; complete simultaneous page-footprint control gives an exact matching identity for every subset of those bases, forcing a critical edge. No matching independence assumption is hidden in this step.

`link_vertex_deletion_cyclic_components_v1.md`, freshly accepted, combines that perfect-tree branch with localization of the nonperfect forest proof. Every imported cover tuple includes the boundary vertex, so all outside pages on its deleted hub spoke are covered. The P3 exceptions are repaired explicitly by a C4 external-page exchange and a diamond/K5-e-core exchange. The resulting available minimum-CS conclusion is: for every adjacent v,w, EVERY component of L_G(v)-w contains a cycle. Other link components and arbitrary outside attachments are allowed.

`link_excess_and_one_cycle_leaf_v1.md` records the quantitative consequence mu(L)=m-n+1>=Delta(L), hence m>=n+2 for every closed link component. A leaf of a one-cycle cover has L-w connected unicyclic, so mu(L)=deg_L(w)=Delta(L)>=3; the degree-three case has exactly four cubic branch vertices.

The active next question is full CS exclusion of links with at most four branch vertices. The historical TUZA-19 WKE theorem gives only the inequality reduction and is not being promoted automatically. `parallel_thread_link_exclusion_v1.md` supplies a new ordinary first step: all nondirect/nondirect parallel degree-two paths and direct-plus-odd paths are forbidden in minimum CS, with explicit parity tuples and complete outside footprints. Returning loops are already excluded by link deletion. The remaining irreducible kernels and their parity extensions still need equality mechanisms; no new census has been launched.

## 15. Accepted all-size four-branch CS bridge

The ordinary parallel-thread restriction was followed by separately frozen and freshly reconstructed arguments for at most three branches, every triangle-bearing subcubic four-branch link, links containing K4 with at most four branches, and K4-free four-branch links having at least four even nondirect threads. Their full arbitrary-attachment footprints are recorded in `three_branch_cs_link_exclusion_v1.md`, `subcubic_four_branch_triangleful_link_v1.md`, `four_branch_k4_link_exclusion_v1.md`, and `four_branch_many_even_threads_v1.md`.

The remaining interface was a NEW six-state parity domain, not a rerun of the historical WKE question. Distinguishing actual short doubled ears DE2 from long doubled paths DE4 preserves every selected rim triangle under two-vertex subdivision. The authorized diagnostic completed in2.996 monitored seconds at26.92MiB:363 canonical states,170 strict tuples and193 fixed-rim augmentation tuples, zero UNKNOWN. The coordinator independently regenerated all46,656 labelled state vectors, retained7,113 eligible vectors and363 orbits, rebuilt literal edges/triangles, checked every certificate, and rejected four negative controls without importing the producer. The symbolic lifting, coverage and whole-footprint assembly then passed a separate fresh challenger review.

`four_branch_cs_link_exclusion_v1.md` therefore excludes every closed link with at most four branch vertices in a minimum CS failure. This is a PROOF_USING_FINITE_CERTIFICATES_AND_DECLARED_INPUTS: the new363 literal certificates are finite evidence; the triangle-free branch retains the historical5375-record WKE theorem and the declared Kotzig input of the TF-WKE CS transfer. It is not relabeled as an ordinary all-cases proof or as all-size Lean verification.

The exact available global consequence is that the graph of edges lying in at least three actual triangles has minimum degree at least five in a minimum CS failure. Hence every graph whose high-codegree graph is four-degenerate satisfies full CS, allowing both K4 and K5 equality components. The coordinator's hereditary core localization transfers proved CS classes to the induced high-codegree five-core. Arbitrary graphs need not have an empty such core; this does not establish unrestricted Tuza or a global blocker.

## 16. New unicyclic link question, with an ordinary matching advance

The next structural target is a closed link L for which deleting one vertex w leaves a connected unicyclic graph F. This arises exactly at a leaf of a one-cycle triangle cover. It is not an increase of the branch-count census. The reasons to pursue it are the actual cover-leaf availability and the possibility of extending the now-complete apex-forest architecture. The risks are that even wheels genuinely fail WKE and that a triangle-bearing WKE link still needs a full CS equality augmentation.

`apex_unicyclic_wke_v1.md` proves, by ordinary leaf induction, that every maximum matching M of a pseudoforest has a vertex cover of its complement of size at most |M|. A second elementary induction shows a nonperfect connected unicyclic graph with leaves has a maximum matching exposing an original leaf. These give WKE for L unless F is an even cycle with adjacent w-neighbors; perfect noncycle F gives the witness by a one-vertex saving on two adjacent nonmatching edges. Thus every triangle-free apex-unicyclic L is WKE and is excluded via the already accepted TF-WKE CS mechanism. The matching proof itself has no finite or external source premise; the CS transfer retains its declared Kotzig input. Fresh review has been requested.

The remaining triangle-bearing apex-unicyclic interface is open. WKE existence alone is not promoted to CS. In particular even wheels require a different local reduction, while triangle-bearing WKE cases require preservation of complete residual-clique footprints or an exact cover-overlap saving. No new computation is launched for this question.

## 17. Ordinary apex-unicyclic advances and exact version corrections

Fresh review accepted `apex_unicyclic_wke_v1.md` and `apex_unicyclic_perfect_remainder_restriction_v1.md`. The latter is a strict-counting necessary condition: for EVERY perfect F matching, its complement is a matching or a matching plus exactly one P3, P4 or K3. Thus a noncycle perfect remainder has maximum degree three and at most three degree-three vertices; the three-branch case is a triangle with three odd pendant paths.

`apex_triangle_odd_pendant_link_exclusion_v1.md`, freshly accepted, excludes a triangle with one odd pendant path beneath the apex, with arbitrary extra apex neighbors on the path. The proof first excludes an external page by an alternate matching, then replaces two extension-cover edges. A supported replacement edge gives an old-cover overlap saving; if neither replacement edge is supported, the literal K4 has a star boundary and peels.

`apex_unicyclic_triangle_cycle_perfect_exclusion_v1.md`, freshly accepted, supplies a general paid residual-triangle cover substitution and excludes the two- and three-pendant-path triangular cases. The old block can be covered through all three edges of a retained triangle at cost at most one above minimum; a drop of at least two in the residual link vertex-cover cost then forces strictness. This is also a corollary of the coordinator's independently reviewed general residual-cover invariance. Every perfect unicyclic remainder with triangular cycle is now excluded ordinarily.

The bare-cycle analysis required a parity correction that is preserved honestly. The unreviewed `apex_cycle_link_exclusion_except_w5_v1.md` incorrectly switched between the two endpoints of an odd gap; those endpoint matchings can select the same internal edges. Version2 replaced that switch by explicit matchings P_0,P_1 at the originally adjacent apex neighbors. Fresh review then requested an explicit u outside {0,1} domain in the rim parity statement, supplied in operative `apex_cycle_link_exclusion_except_w5_v3.md`. Version1 is not accepted, and version2 retains the documented boundary wording correction.

The corrected v3 and `apex_cycle_link_exclusion_full_v2.md` passed fresh reconstruction. The new ordinary argument handles every cycle length and apex-neighbor set except the full five-wheel. That exact exception is already excluded by pinned TUZA-15 main.md §5.3, whose four/eight local reduction and complete good-base-pair page argument were reread at closed-component scope. Therefore every closed apex-cycle link is excluded, with no new finite or Kotzig premise. This is a scoped all-size local advance, not an unrestricted theorem.

## 18. Current perfect-branch question

`apex_unicyclic_one_branch_perfect_exclusion_v1.md` is frozen and sent for fresh review. It excludes every cycle-plus-one-pendant-path remainder with a perfect matching. Even cycles use their two alternating perfect matchings. Odd cycles use the original forest-like perfect matching, alternate matchings through the apex-leaf edge, and a new tuple whose complement has a three-edge star or two P3s. All arbitrary apex adjacencies are covered by the apex in Q; every packing exchange includes the complete residual-block footprint.

If this proof is accepted, the only remaining perfect unicyclic remainder has exactly two degree-three vertices, cycle length at least four, and the two branch vertices are joined by an edge belonging to no perfect matching. The nonperfect unicyclic branch is still open. The current task is an ordinary analysis of these exact unbounded interfaces, not a larger branch-count census. No new mathematical computation has been launched since the accepted363-certificate bridge.

## 19. The perfect unicyclic branch closes, and two false shortcuts are retained

The coordinator freshly accepted `apex_unicyclic_perfect_full_exclusion_v1.md`. Its decisive new support fact is that, when F=L-w is triangle-free and the deleted matching lies entirely in F, EVERY surviving F edge is supported in the B residual: any second page is through w or an outside apex, so its spokes survive. An isolated matching-complement edge or a P4 end is then cover-critical and contradicts residual-cover invariance. The lone P3 exception would force a noncycle triangle-free unicyclic graph on four vertices, impossible. Together with the bare-cycle and triangular-cycle arguments, EVERY perfectly matchable connected unicyclic remainder is excluded.

The separately developed one-branch proof also passed fresh review, but is not needed in the shortest full perfect assembly. It remains a correct independent exchange mechanism.

For nonperfect remainders, an isolated critical-edge selection proposal failed twice at precise scopes. `unicyclic_critical_edge_candidate_boundary_v1.md` uses a cycle with three private leaves per cycle vertex; every maximum matching complement has the same cover number and no critical edge. This family already violates the available no-double-leaf condition, since two leaves would form forbidden parallel length-two threads in L. However `unicyclic_no_double_leaf_critical_boundary_v1.md` shows that condition does not repair the proposal: subdivide every edge of a cycle once and attach one private leaf at each original cycle vertex. Every maximum-matching complement is a disjoint union of odd-order paths and even cycles, so again it has no critical edge. Both notes include ordinary rim/external augmentations excluding their actual link families. They refute intermediate matching lemmas, not CS, and show why the critical-edge and triangle-exchange alternatives must be combined.

## 20. Full triangle-free remainder candidate and its declared matching input

`apex_unicyclic_triangle_free_deficiency_one_exclusion_v1.md` is frozen for fresh review. For deficiency one, a matching exposing an original leaf leaves r+1 edges with cover r; the one-unit-saving classification gives P3/P4/K3 plus isolated edges. All edges except the exposed leaf's base are supported in the residual. Two P4 ends or a nonexceptional isolated edge force a contradiction; the final C4-plus-leaf case also has such an edge. This proof does NOT use the unicyclic retain/avoid leaf facts, whose deficiency-at-least-two hypothesis is essential.

`apex_unicyclic_triangle_free_remainder_exclusion_v1.md` is a frozen PROOF_USING_DECLARED_GE_INPUT candidate for all remaining deficiencies. Source_audit proved the exact unicyclic retain-an-allowed-edge and avoid-a-matching-preserving-edge leaf facts, using authenticated general Gallai-Edmonds structure. The proof keeps that dependency explicit. In the candidate, every admissible maximum matching complement must itself have matching number r; otherwise a cycle-edge deletion creates a supported cover-critical edge. This makes every F edge avoidable. GE then leaves only singleton or one odd-cycle D-component and an empty or pure-even-cycle C region. Allowed triangular edges yield rim augmentations. Any remaining unallowed triangular edge reaches an original leaf through an A-D tree; an odd path with both endpoints adjacent to w forces a safe00 edge, which yields the external-page augmentation.

The full proof and its unique-cycle incidence-component selection are awaiting fresh reconstruction. If accepted, the remaining apex-unicyclic case has an actual TRIANGULAR unique cycle in F and F has no perfect matching. No general WKE-to-CS theorem, forest/one-cycle cover availability, or unrestricted Tuza conclusion is asserted.

## 21. Simultaneous residual covers replace the declared matching route

The full GE-dependent triangle-free unicyclic proof and its deficiency-one predecessor passed fresh review at their exact scopes. A subsequent shorter ordinary proof, `apex_unicyclic_triangle_free_remainder_ordinary_v2.md`, also passed fresh reconstruction. Its key mechanism is simultaneous prescribed edges in old minimum covers: when L-w is triangle-free, each residual B block contains at most one surviving edge of L-w. Every such supported edge can therefore be selected in ONE minimum residual cover. Unsupported edges are confined to the star at the outside mate of w in the deleted matching. This collapses the remaining extension cover to at most two spokes, or one if w is unmatched.

The coordinator's independently reviewed general S version extends this to any vertex set S for which L-S is triangle-free: if Z is the set of outside mates of S in P, balanced equality forces |P|<=|S|+|Z|. In particular S empty supplies an ORDINARY triangle-free WKE-to-CS exclusion with no Kotzig input. Earlier frozen proofs keep their original declared labels; new assemblies explicitly repin this shorter mechanism where used.

## 22. Full apex-unicyclic exclusion with a new complete finite interface

The triangular nonperfect branch reduces ordinarily to matching number at most three and no doubled original leaf neighbor. A reviewed rooted-attachment classification gives exactly twelve F shapes, all of order5,7 or8. Every apex neighborhood containing all original leaves and having size at least two was retained:374 literal records, with no symmetry quotient or unproved neighbor pruning.

The restricted-vocabulary v1 job stopped at its fourth record, an already excluded three-sun, and remains UNKNOWN in its frozen evidence. The authorized v2 kept the SAME domain and added two separately proved certificate types: the ordinary at-most-three-branch theorem and a complete residual-clique test for outside-page augmentation. It certified all374 in0.242 monitored seconds at19.375MiB. The coordinator independently regenerated the AHU domain, established the graph bijection, checked every literal certificate and every required residual clique, and rejected five negative controls. No optimizer values or counts alone are proof premises.

`apex_unicyclic_full_exclusion_v1.md` assembles the ordinary reductions, all six arbitrary-outside-attachment certificate proofs, the independent finite evidence, and exact dependency pins. Fresh challenger review ACCEPTED it. The label is PROOF_USING_FINITE_CERTIFICATES; it uses the new374 bridge and the ordinary historical five-wheel local case, but no GE, Kotzig or four-branch363/historical5375 bridge.

Its available consequence is precise: a class-minimum CS failure admitting any triangle edge cover of total cycle rank at most one must have that cover a HAMILTONIAN CYCLE after isolates are discarded. A selected leaf would have a connected unicyclic link remainder, now excluded; selected-degree-zero vertices were already excluded. This does not complete CS for Hamiltonian-cycle covers or unrestricted graphs. The next structural question is multiple-component apex-pseudoforest localization, while the challenger independently studies two-apex-forest link structure from the remaining Hamiltonian-cover state.

## 23. Ordinary replacement and the exact pseudoforest boundary

The new `wke_residual_triangle_count_collapse_v1.md` passed fresh coordinator and challenger reconstruction. For any WKE matching P and vertex set S, it proves |P|<=|S|+|Z|+t, where Z is the outside-S mate set and t counts ACTUAL triangles of L-S. A minimum residual cover can be enlarged to contain all supported L-S edges at a cost bounded by its intact triangle count; every unsupported edge lies at a mate or opposite a deleted edge in a broken triangle. The explicit K4/K5 clique-intersection cost table and complete second-page audit are ordinary.

This sharpens a triangular unicyclic remainder to matching number at most two. The two possible shapes were then excluded by symbolic optional-apex cases, without a finite certificate premise. `apex_unicyclic_full_exclusion_ordinary_v2.md` repins the full theorem and Hamiltonian-cover consequence as ORDINARY; the accepted374-state predecessor remains preserved as independent finite evidence and discovery history.

The ordinary pseudoforest extension passed fresh review. `apex_pseudoforest_boundary_v1.md` excludes every nonperfect component by global matching tuples and whole-footprint2/3-triangle augmentations; the all-perfect branch reduces to four-cycles. Keeping the shared hub edge hw supplies an exact reduction for two-neighbor four-cycles. `full_four_cycle_pseudoforest_component_exclusion_v1.md` then localizes the historical good-page-pair argument while retaining hw: a block containing hw cannot receive an outside page spoke, so the local three-packing's possible surviving hw is compatible. This too passed fresh review.

The only unexcluded apex-pseudoforest link is therefore a bouquet of at least two C4s, each seen by w at exactly three vertices. `three_neighbor_four_cycle_bouquet_boundary_v1.md` records that this family is genuinely non-WKE, its literal cone has nu=tau=3c, and its feedback vertex number is c+1. These are method boundaries, not CS counterexamples. The parent has redirected the next independent structural investigation to restoration of three arbitrary nonedges over B; no additional finite census is planned.

## 24. Ordinary restoration of three arbitrary nonedges

`three_edge_restoration_full_cs_v1.md` passed fresh coordinator and challenger reconstruction. It proves FULL CS for B plus at most three arbitrary nonedges, not only equality restoration. All five restored-edge shapes are exhausted by ordinary symbolic arguments. The stronger-scope audit explicitly uses nu=m+1 and tau>=2m+2, so the possible violation value2m+3 is also excluded; if packing gains at least two, the three-edge cover bound was already strict.

The new star, P4, three-matching and P3-plus-disjoint-edge proofs account for every actual page and entire residual-clique footprint. Their decisive mechanism is that disjoint page pairs can fail compatibility only through opposite spokes in an old K4. Actual old triangles merge purported obstruction blocks, and the WHOLE one-base footprint lemma forces complete page-family uniqueness. Equality either creates one background-supported K4 or, for a three-spoke star, completes an old K4 to K5. The detailed frozen sources and hashes are recorded in the assembly.

R3 does not supply three-edge packing resilience or a global blocker. Every triangle is already a three-edge blocker in a minimum CS graph and leaves deficit one. The exact new global restriction is that no deletion of at most three edges can leave B; a three-edge deletion that lowers packing by one must leave deficit one rather than equality.

## 25. A new exact near-tight representation and strict restoration

`resilient_defect_one_two_edge_B_classification_v2.md` passed fresh review. A SINGLE SHARED-EDGE triangle component with deficit one, single-edge packing resilience, and some two-edge B deletion is exactly K5-e or a root K4 joined along one/two adjacent edges to old K4/K5 components. Its packing number is at most five, sharply attained by two K5 attachments. The v1 connectivity wording was clarified in v2; mere vertex connectivity would allow unbounded additional clique components and is explicitly excluded.

`classified_two_edge_B_residual_triangle_restoration_v2.md` then proved ordinary STRICT missing-triangle restoration from every one of those classes. A cover-eligibility argument confines every supported new spoke to an avoidable root star; the new page family is forced to be K5-e, and a compatible old maximum packing gives a contradiction. The one-K4 attachment uses the independently reviewed double-K4 theorem, and old K5-e is handled by a direct full-apex split. Version2 corrects v1's overly broad phrase "entire old intersection": only the triangle-SUPPORTED footprint matters, while old background spokes are automatically avoided by triangle packings.

Consequently a minimum-CS triangle residual cannot become B after deleting any two further edges. This is not two-edge packing resilience: an additional deficit-one packing-drop branch remains possible. `classified_two_edge_B_residual_edge_insertion_v1.md` also gives the exact one-edge equality completion on this representation: only K5-e can complete to K5, with no new outside page.

## 26. The full literal fresh-clique near-tight construction is excluded from triangle residuals

`fresh_clique_defect_one_triangle_restoration_v1.md` passed fresh challenger review and coordinator reconstruction. It extends strict triangle restoration to the entire previously classified literal fresh K4/K5 edge-gluing deficit-one class, including three star leaves and two K5s sharing an edge. Both remaining forms have every supported edge eligible for a minimum cover. Three incidence-matched pages can be combined with p-1 old triangles; for the two K5s the second petal needs only one triangle avoiding its two-edge page footprint and the shared edge. The forced new K5-e family then has no supported old spoke, so its two-packing appends to an old maximum packing.

This excludes that precise construction from every minimum-CS triangle residual. It does not classify arbitrary near-tight graphs or permit extra crossing triangles, larger old-vertex overlaps, or an unavailable clique construction.

## 27. Independent H-D module reviews

I freshly reconstructed source_audit's double-K4 strict triangle restoration, the parameterized red-book tree rerooting theorem, and the red-book residual-family/blocker kernel. The recorded reviews check all actual outside-page accounting, diagonal-flip invariants, the exact red-page identity, star-boundary triangle-family inclusion, pair injection and the quadratic bound in the singleton parameter. Their missing survivor lower bound and uncontrolled blue-edge attachments remain explicit; no original-H-D proof or global blocker availability is inferred from those parameterized restrictions.

## 28. Ordinary full apex-pseudoforest exclusion and strict link excess

The challenger balanced three-neighbor-C4 bouquet reduction was freshly reconstructed and accepted in `review/restoration_three_neighbor_bouquet_review.md`. Together with our ordinary boundary and retained-full-C4 exclusion it closes ALL apex-pseudoforest closed links, frozen in `notes/apex_pseudoforest_full_exclusion_v1.md` (SHA a4329ae4b512eb74e7efbf016e9299e756309052876a876dc6ad11cc82846ceb). Every L-w has cyclic components and at least one multicyclic component. Consequently mu(L)>=Delta(L)+1 and |E(L)|>=|V(L)|+3. This uses ordinary proofs only, no finite certificate or matching structure theorem. It does not imply every L-w component is multicyclic.

## 29. Additional fresh reviews and remaining restoration mechanism

Accepted source_audit's diagonal singleton-terminal strengthening in `review/restoration_diagonal_singleton_bound_review.md`: regular slots<=9*binom(s,2), k<=9*binom(s,2)+3s-2, without blockerlessness or residual packing hypotheses. This remains a parameterized necessary bound.

Accepted root's arbitrary deficit-one triangle-restoration alternative in `review/restoration_defect_one_triangle_alternative_review.md`: non-strict restoration forces either an independent-alternating actual C6 whose six-edge deletion loses at least two old packing triangles, or an exact K5-e new family with all six spokes old-cover-ineligible and whose deletion loses packing. The latter branch is excluded by eligibility of every supported old edge. Neither global eligibility nor C6 robustness has been proved.

## 30. Final ordinary replacement of the four-branch finite interface

The new apex-pseudoforest exclusion reduces the at-most-three-even-thread four-branch domain to complete underlying K4 with doubled pairs2K2,K3,orP4. This exact deduction and the three-sun obstruction to uniform matching-bipartization are recorded in `four_branch_after_pseudoforest_boundary_v1.md`. The obstruction remains valid, but does not prevent the following ordinary reductions.

`four_branch_triangle_doubles_ordinary_exclusion_v1.md` and `four_branch_path_doubles_ordinary_exclusion_v1.md` construct all-length matchings with |Q|=|P|+1-q, where q counts nondirect odd single paths. q>=2 is strict, q1 forces a literal residual diamond, and q0 invokes the separately ORDINARY K4-bearing theorem. Both received fresh challenger acceptance.

`four_branch_two_doubles_extra_even_ordinary_v1.md` handles the allowed third even thread on an undoubled pair using an explicit near-perfect matching with bipartite residual. The ordinary bipartite matching-cover theorem and accepted TF-residual theorem exclude it; the entire parity/residual coloring was freshly reviewed by challenger.

Coordinator completed the no-extra-even2K2 case with the same endpoint counts and an explicit equal-size triangle-free residual matching in its balanced q1 case. `coordinator_four_branch_ordinary_completion_v1.md`, SHA a67ee9350b06917ad3b77b098244e35c160d7ef8074b0679a891090c0920a81b, assembles ALL cases. The triangle-free>=4-even branch uses the ordinary endpoint-assignment tuple plus S-empty collapse, so it requires NO historical finite WKE availability. My fresh ACCEPT is `review/restoration_four_branch_ordinary_completion_review.md`, SHA 5a786fa8ff0ac133d25a0296044a2e69d4200578233bdf3465e79a1a43075819.

Therefore every nonempty closed link in a minimum CS failure has at least FIVE branch vertices by an ordinary proof. The old363-record and historical5375-record finite results remain preserved predecessor evidence but are no longer premises of this threshold. No unrestricted-CS conclusion is inferred.

## 31. Last independent reviews before the original cutoff

`review/restoration_whole_cone_TF_matching_residual_review.md` accepts challenger's whole-cone exclusion from a supplied matching P with triangle-free residual and cone packing exactly|P|. The neighboring WHOLE link is apex-pseudoforest after a four-for-three augmentation bounds its matching-containing common neighborhood. Proper local cones with outside pages remain a separate boundary.

`review/restoration_all_minimum_exact_cone_unique_family_review.md` accepts source_audit's ALL-minimum exact-cover cone reduction: the assigned rim-base family has a unique minimum all-base cover, yielding strict induced-neighborhood vertex-cover inequalities. This is cover-side structure and does not assert global page packing or list-colorability.

All mathematical construction and verification above was completed before the fixed2026-11-16 05:10:41.328UTC cutoff. Later changes, if any, are restricted to documentation, integrity checks and cleanup.
