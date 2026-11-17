> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Challenger: full-packing extension

Status: active sustained research. The ordinary D-all/D-some-extension counterexample is independently verified; scoped private-packing and density mechanisms have separate review records. Started 2026-11-15 UTC. Earlier chronological entries retain their original discovery-stage wording unless explicitly corrected below.

Exact targets are D-all, D-some-extension, D-some-choice in sources/MISSION.txt. D-all needs a minimum ordinary cover C, a maximum packing Q among actual one-C-edge triangles, and a full inclusion-maximal extension P with |C|>2|P|. The maximum possible extension is |Q|+nu(G-E(Q)); this identity is bookkeeping only.

## Initial mechanism: coupled apices

For a triangle-free link L and an independent set A of apices adjacent to some or all link vertices, triangles are pairs (a,xy), with a adjacent to x,y and xy in E(L). Edge-disjoint packings select a matching for each apex while using each rim edge at most once across all apices. This permits an apex's private triangles to block another apex's remainder through a shared rim edge and removes the single common-apex matching argument.

A naive repeated Clebsch cone is not automatically a private-deficient state. If the same spoke set is selected at r apices, adding a vertex x to all omitted-spoke sets saves r spokes but requires only the union of its incident uncovered rim edges. Thus the presumed cover may cease to be minimum. Example: for a Clebsch maximum independent five-set I, each ordinary outside vertex has two neighbors in I; putting x into all omitted sets changes cost by 2-r. For r>=3 this invalidates the unmodified spoke-only cover. This is a concrete minimum-cover obstruction to the naive construction, not a proof of D.

## Targeted finite discriminator

scripts/challenger_probe.py is newly authored (not Claude replay). Literal triangles are rebuilt from edge lists. Exact ordinary cover and private packing optima are obtained by standard-library recursion, with per-instance deadline and finite cache; timeouts are UNKNOWN. Candidate minimum covers are retained only if their cost equals the optimum and they cover every actual triangle. Maximum private packings are enumerated up to an explicit cap and tested with several maximal greedy full extensions. One failure is enough for D-all; absence is only a capped finite screen. An exact residual packing is computed for any failure to distinguish D-some-extension.

Initial states: additions of 1–4 Clebsch rim nonedges; partial second apices; split apex incidence with shared neighborhoods. These introduce triangles with no common apex or interacting two-apex triangle families, while retaining enough of the known private-deficient source to be promising. The unmodified Clebsch control is not repeated.

Two reasons to investigate: shared rim resources evade the old cone proof; minimum covers can be reoptimized exactly on targeted modifications. Two risks: cover reoptimization may remove private deficiency, and maximum private packings may already exceed half the cover size. Next action is a bounded monitored run, coordinated with root's heavy-job slot.

Additional read-only source dependencies: TUZA-21 scripts/pk_successor_probe.py, scripts/private_cover_probe.py, scripts/run_bounded.py. Their method informed this independent implementation; no historical script was executed or modified.

## Structural change after first computational obstruction

The generic first run ended normally in 102.44 s with peak sampled process-tree RSS 647.75 MiB, but exact ordinary-cover recursion timed out on its modified-cone cases. These are UNKNOWN, not passing cases. We change the optimization representation instead of extending that run.

**Exact cone cover identity (ordinary proof).** For any graph L on n vertices, including its actual triangles, put G=z*L. A cover chooses spokes at S and rim edges F. Write W=V(L) minus S. Every edge of L[W] is forced into F because its apex triangle has no selected spoke. After selecting these forced edges, the other requirement is to hit all residual triangles of L-E(L[W]). Conversely those choices cover all actual triangles of G. Therefore

    tau(G) = min_W [n-|W| + e(L[W]) + tau(L-E(L[W]))].

The final tau is ordinary triangle-edge cover in the residual link. This includes base triangles and is not the triangle-free cone formula applied beyond scope.

**Exact cone packing identity (ordinary proof).** Every packing consists of an edge-disjoint base-triangle packing B in L and apex triangles whose rim edges form a matching in L-E(B). Conversely every such pair combines to a full packing. Thus

    nu(z*L) = max_B [|B| + matching_number(L-E(B))].

For a prescribed private family the same decomposition restricts both allowed base triangles and allowed rim edges to those whose actual triangle meets C once. For an extension after Q, also remove apex spokes occupied by Q. No statement about arbitrary noncone graphs is inferred.

**Identical multi-apex cover identity.** If r independent apices are each adjacent to every vertex of a triangle-free L, then

    tau(G) = min_W [r(n-|W|)+e(L[W])].

To prove the lower bound, fix selected rim edges F. For each apex its selected spokes form a vertex cover of L-F, so at least r times the minimum vertex-cover number are needed. Choose one minimum vertex cover S of L-F and W=V minus S; then E(L[W]) is contained in F. Repeating S at every apex and selecting E(L[W]) gives the displayed cost no larger than the original. The converse construction is immediate. This identity is useful for recomputation, not a proof of D.

Replacement script `scripts/challenger_cone_modifications.py` exploits the first two identities on 16-vertex links with few new base triangles. This is an exact structural optimization reduction, with per-instance UNKNOWN timeouts, capped retained minimum covers and capped maximum private packings. It aims to reach the deficient states that generic recursion did not reach. Existing NetworkX maximum-cardinality matching is an optimization input; any decisive witness needs an independent matching/packing check.

Admission for replacement: all actual triangles are included, minimum C and maximum private Q are required, and only the displayed C,Q/P would refute D-all. Reasons to pursue: (1) nonapex base triangles make the old cone maximal-matching argument inapplicable; (2) the exact reduction makes cover recomputation cheap enough to test the difficult state. Risks: (1) added base triangles may remove deficiency by augmenting private Q; (2) capped choices can miss failure. Cheapest sufficient falsifier is literal C,Q,P with exact optimality and full maximality. Root authorized up to five minutes of monitored computation; initial replacement budget100s plus per-case12s, external120s.

## Four-cone regeneration and decisive candidate

The two-apex identical Clebsch rim has a cheaper20-edge cover, so repeated22-spoke C is not minimum. A cycle of four cones with3K2 overlap gives a full maximal20-packing but tau42 and a displayed minimum cover with private packing number28; that candidate fails the maximum-private premise. The failed construction is retained in challenger_cycle_cones/private artifacts.

Changing the outgoing residual from3K2 to2K2 plus two isolates changes the cover tradeoff. The resulting four-cone graph has52 vertices,216 edges,160 triangles, tau44, nu32, and a minimum44-edge cover with a maximum private20-packing that is already full maximal. The ordinary proof and full quantifier distinctions are frozen in `notes/challenger_D_counterexample.md`, with literal data in `evidence/challenger_D_counterexample.json`. Pending fresh independent review, this defeats D-all and D-some-extension, while a successful alternate private packing and28-extension show D-some-choice holds on the witness. This is a refuted auxiliary statement, not a Tuza counterexample or an unrestricted mechanism proof.


## Current verified outcomes and active scope (2026-11-16 local date)

The52-vertex D witness is no longer pending: root and source-audit independently verified the literal graph, tau44, full nu32, minimum C44, maximum private Q20, and the empty residual after the bad Q. The same C has a different maximum private Q20 extending to a full32-packing. The earlier chronological reference to a28-extension was superseded by that stronger explicit32 certificate. D-all and D-some-extension are refuted; D-some-choice is not.

The packing-four density interface now has an ordinary five-packing proof in notes/challenger_near_bipartite_five_packing_v1.md, freshly reviewed by source_audit. The generalized page-abundance mechanism is notes/challenger_bipartite_page_strictness_v1.md, also accepted by source_audit. The historical Gyori small-surplus shortcut was rejected because its original theorem requires sufficiently large order; the exact boundary is saved separately and is not an input to the density proof.

The arbitrary-size triangle-plus-matching PRIVATE theorem, with bipartite-complement and minimum-cover hypotheses, is notes/challenger_triangle_matching_private_v1.md. Source_audit independently accepted the literal owner augmentation. Its earlier finite3+4 discriminator was exhaustive on4096 masks and had a separate witness-only verifier; it remains finite evidence only and is not needed by the final ordinary proof.

The current new boundary is notes/challenger_local_hall_boundary_v1.md. Local star-Hall fails to yield the half bound even for actual common-apex lists; the K5,5 closed-neighborhood construction has C25, private/full nu10, true tau10. Its displayed C is inclusion-minimal but not minimum, and no minimum-C private theorem is refuted.

The global independent-side cover formula in notes/challenger_independent_side_cover_identity_v1.md retains precisely what local Hall loses: for every triangle-free edge subset S of the internal base graph, the sum of its per-apex vertex-cover costs must be at least |S|. The formula is a proof-obligation reformulation, not a global packing theorem. Source_audit has the source for fresh reconstruction.

A proposed book-with-K4-ear detour was not frozen because the root's reviewed packing-critical-edge restoration theorem already excludes it more generally. A literal-support-only version would also require an explicit arbitrary triangle-free-background audit. It is not counted as a new result.

## 2026-11-16 around01:00 UTC: weighted tree-component route and new exact boundary

The all-size inequality for a minimum cover of disjoint K2/K3 components was independently accepted. The all-q2 subclass has a full CS equality theorem. The later four-core balanced reduction excludes this whole minimum-cover shape in a global or hereditary-class minimum CS obstruction, with the declared codegree-two input; it does not assert the stronger direct-CS theorem for every graph with that cover shape. Frozen proof: challenger_small_component_cover_exclusion_v1.md; source-audit review accepted.

The current generative target is a minimum TREE cover component C_i on A: find an assigned-family packing with2 internal triangles +1 outside pages at least |C_i|. The STAR case is now an ordinary Hall proof, with no Gallai–Edmonds input: choose any maximal matching within a specified minimum vertex cover, then Hall-match its unmatched independent vertices into the complement. Frozen operative proof: challenger_minimum_vertex_cover_matching_v2.md; fresh review accepted. Version1 is preserved as a superseded correct declared-input proof.

The arbitrary connected/clique-component extension is refuted by the K4 core plus four face apices. Exact parameters are tau6, full/private packing4, weighted internal/external optimum5<6. The complete ordinary certificate and fresh acceptance are in challenger_clique_core_weighted_boundary_v1.md and its review. This does not refute TREE.

A bounded P4/P5 test with internal triangles and at most3 outside apex occurrences found no failure across8,215 constructed graphs,742 with the specified cover minimum. No UNKNOWN; monitored0.235s. This is only the displayed finite domain, not evidence for unrestricted trees. No larger passing census is planned.

Mixed Hall selection is proved: internal2-C triangles form a graph J on tree bases; choose any maximal J-matching, then proper private-list coloring of the unmatched J-independent bases follows from ordinary minimum-cover exchange and the clique-block Hall theorem. This is a SELECTION, not a packing. Internal1-C pages may hit the non-C chord of an already selected2-C triangle, producing literal chord-book conflicts. The exact obstruction and nonminimum tree illustration are retained in challenger_tree_mixed_hall_selection_v1.md; fresh review accepted. The abstract mixed-Hall probe became redundant once the elementary proof was found.

A stronger external-family minmax is now proved and independently accepted: ANY outside-page subfamily over forest bases has packing number equal to actual edge-cover number, without a whole-forest minimum-cover assumption. Its intersection graph is a forest-pattern clique gluing of bipartite line graphs; the needed perfect-graph clique-cover consequence is reconstructed fully, including replication, so no unchecked perfection theorem is imported. Frozen proof: challenger_forest_external_minmax_v1.md.

This gives an exact remaining TREE interface. For q(S), the outside-page packing number on bases S, ordinary assigned-family cover optimum is min_D [|D|+q(C_i minus D)], over internal edge covers D of internal triangles. Weighted optimum is max_I [2|I|+q(C_i minus E(I))], over internal triangle packings I. The missing result is the mixed minmax inequality between these displays. q is not a matroid rank (even a one-apex path gives ordinary matching rank), so no submodular-duality shortcut is assumed.

Parallel verification work accepted restoration's defect-one perfect-tree-link exclusion, its localization to EVERY component after deleting a link vertex, the parallel-thread exclusions and link-excess corollary, and the at-least-four-branch theorem. These are actual minimum-CS necessary restrictions with declared minimality inputs, not unrestricted proofs or automatic upgrades of historical WKE certificates.


## 2026-11-16 around02:00 UTC: full forest anchor and mixed-cover inequality

The existential anchored internal target is now proved and freshly accepted. In challenger_forest_anchored_cover_v1.md, ANY forest triangle cover C admits a packing I and an ordinary cover D with C intersect E(I) contained in D and |D|<=2|I|. The key is a pointed apex-forest WKE lemma, proved by elementary alternating reach and forest edge counts, followed by induction at a selected-cover leaf. The extra pointed condition forces the selected spoke into the loss cover whenever the new matching uses it. This avoids the earlier fixed-maximum-packing residual-cover bottleneck entirely. Source_audit independently reconstructed and accepted the full proof, including all lost actual triangles and arbitrary outside pages.

Combined with the already accepted exact external-family minmax, this closes the full local weighted TREE target: every tree component of a minimum ordinary cover has an assigned packing of weight2 per internal triangle and1 per external page at least its selected-edge count. The theorem requires no CS, Gallai--Edmonds, Kotzig, finite enumeration or maximum-packing input. The stronger assertion about EVERY maximum/minimum-p2 packing's residual tau remains OPEN and unnecessary for this consequence.

A second all-size inequality now has frozen v2 source challenger_tree_triangle_cover_tuza_v2.md. If ANY triangle cover, not necessarily minimum, has only tree and literal-triangle components, then tau(G)<=sum_i tau(assigned family_i)<=2nu(G). Tree weights pay local family cover costs via the new anchor. Triangle families of cover cost at most2 use their internal triangle; cost-three families use q3 pages or exact two-full-apex q2 pages. Coherent fair orientations retain both q2 pages or neither, adding the internal triangle in the latter case. Closed odd q2 target cycles are handled by the two-full-apices lemma. The v1 minimum-cover version was independently accepted; source_audit also independently accepted the v2 local-cost normalization before the frozen v2 check. This existence-of-ANY-cover class is hereditary; no equality classification or unrestricted availability is claimed.

Additional ordinary scoped advances retained from the preceding route: challenger_tree_anchor_one_private_v1.md proves the extremal residual tau bound when p1<=1; challenger_tree_anchor_residual_packing_v2.md proves only nu(R)<=p1 in general; challenger_anchor_residual_realization_boundary_v1.md shows arbitrary forest-cover triangle structure can appear as an extremal anchor residual, including a wheel5 odd hole. The realization's selected tree is not minimum and it refutes only universal structural shortcuts. The new implication-path note identifies repeated unused C-edges in every forced literal-choice contradiction but makes no global budget claim; it is now an optional mechanism, not needed by the forest anchor.

Fresh review work also accepted the full four-branch CS assembly with exact363-profile finite bridge, DE2/DE4 triangle-preserving lift, complete residual footprints and the heavy-five-core hereditary CS consequence. Its new finite and historical triangle-free WKE/Kotzig inputs remain explicit. The ordinary apex-unicyclic WKE theorem was accepted at its exact exception scope; triangle-bearing CS restoration is not automatic.

Next action: use the new local weighted availability in larger-component/equality mechanisms, and continue fresh reviews of genuinely new restoration restrictions. No larger passing census is planned. The unrestricted theorem remains open.


## 2026-11-16 around02:40 UTC: mixed-cover equality closure candidate

The arbitrary-cover v2 inequality has now received fresh acceptance. Equality analysis produced two accepted normalizations: q3 triangle cores force strictness, and q2 cores force their two full apices to be joined by a selected TREE edge, yielding a literal K5. The latter uses additive local cover costs, deletion of another family's minimum cover at no local-cost loss, and complete finite sign comparisons. Low-cost triangle cores are also excluded in a class-minimum CS failure: a private two-packing gives strictness, and private packing1 gives a single-full-apex K4 with star-contained outside boundary.

A complete scoped CS theorem is now frozen for fresh adversarial review in challenger_tree_triangle_cover_cs_v1.md. In a minimum failure in the hereditary ANY tree/K3-cover class, choose a selected tree leaf v with parent w. Its closed link minus w has forest and literal-triangle components. A triangle component must be a normalized q2 core with other full apex w. A separate elementary lemma excludes such a full triangular branch: another perfect forest component supplies one cover saving; another nonperfect forest or triangle supplies an exposed w-neighbor. Each produces balanced accounting but leaves a literal diamond in the alleged B residual. If it is the sole component the link is K4, already excluded. The remainder is therefore a forest and the accepted ordinary apex-forest theorem contradicts minimality. Root independently reconstructed this closure; source_audit has the frozen proof for fresh review. This is not unrestricted Tuza; cover-shape availability outside the class remains open.

Two tempting stronger anchor quantifiers were decisively retired. The prescribed ONE-C triangle test on the SAME small corpus stopped at its eighth valid graph, no UNKNOWN,0.122s/4.25MiB. The five-vertex fan with triangles012,023,034 and selected path01,12,23,34 has prescribed middle023 incompatible with any other packing member and anchored cost3>2. A separate K4/path-middle-edge argument refutes forcing an arbitrary selected base into D. Both selected covers are nonminimum; neither refutes the accepted existential anchor or an equality-specific forcing invariant. Ordinary certificates are frozen in challenger_prescribed_one_c_anchor_boundary_v1.md and challenger_forced_base_anchor_boundary_v1.md.

The distinct normalization “forest cover exists implies minimum forest cover exists” is also false: K5-minus-edge on coreabc plus three dedicated base pages has tau=nu3 and unique minimum coverabc, but an explicit forest5-cover. This strict graph boundary is challenger_minimum_forest_cover_boundary_v1.md. It explains why the arbitrary-cover hereditary scope must not be conflated with a minimum-cover shape assumption.

Fresh restoration reviews accepted the perfect triangular-cycle unicyclic assembly, corrected apex-cyclev3 plus historical full-W5 local input, and one-branch perfect-unicyclic exclusion. The old odd-gap endpoint matching error was preserved and superseded, and a parity-domain wording correction was required before acceptance ofv3. No finite/Kotzig premise entered those new ordinary branches; the full-wheel input retains its pinned historical source identity.

## 2026-11-16 03:14–04:25 UTC: cycle-cover equality and two-link bridge

The complete ANY tree/K3-cover CS theorem is independently accepted, not merely its inequality. Its frozen source is challenger_tree_triangle_cover_cs_v1.md and review/tree_triangle_cover_cs_independent_review.md. Unrestricted CS remains open.

A scoped C6/C7 spanning-cycle minimum-cover probe completed all512+16384 chord masks (392+7269 valid covers), no τ=n witness, no UNKNOWN. The broad proposed spare-edge normalization was then refuted ordinarily by the infinite circulant family with cyclic distances1,2,3 for every n>=10: its n triangles{i,i+1,i+3} partition all3n edges and the selected C_n is minimum withτ=ν=n. Frozen challenger_spanning_cycle_mincover_boundary_v1.md; no larger census followed.

New ordinary two-apex forest theorem: a minimum-CS closed link L with F=L-{a,b} forest has ν_match(F)<=3. Full alternating/Hall and perfect/odd-path proof is challenger_two_apex_forest_large_matching_exclusion_v1.md; root and source_audit independently ACCEPT. The independently frozen matching-three reduction excludes every nonperfect r3 case, leaving only F=P6 with ab absent; review/two_apex_forest_matching_three_independent_review.md ACCEPT.

The one authorized P6 diagnostic covered4096 raw/2018 eligible states, all certified,0UNKNOWN,0.3565s/25.34MiB. Root independently regenerated and validated every state and certificate, including5 negative controls. Assembly challenger_two_apex_forest_matching_two_bound_v1.md is PROOF_USING_FINITE_CERTIFICATES and independently symbolically accepted. It gives ν_match(F)<=2, and Δ(G)<=9 for a minimum-CS graph with a Hamiltonian-cycle cover; earlierΔ<=12 remains ordinary. This is not full one-cycle-cover CS.

Ordinary complete residual-domain derivation: challenger_cycle_cover_residual_domain_v1.md. The accepted ordinary apex-unicyclic theorem forces a rank-one selected cover to be Hamiltonian; such a graph is K5-free, hence all links K4-free. The remaining F shapes are the seven path forests P2,P3,P4,P5,P2+P2,P2+P3,P3+P3, each with0/1 isolate:14 shapes,67360 raw states,8220 eligible under onlyδ>=2,connectivity,K4-freeness.

Authorized full-domain v1 stopped at known non-WKE W5 after49 records; preserved UNKNOWN reflects a missing theorem rule. Authorized SAME-domain v2 added only ordinary apex-unicyclic reference, then stopped at1321 records on the genuinely non-WKE seven-vertex P5 boundary: F0-1-2-3-4, nonadjacent apices both adjacent{0,1,3,4}. Ordinary non-WKE proof and precise outside-page gap are frozen challenger_two_apex_p5_non_wke_boundary_v2.md. Its cone hasν5 and an explicit six-edge cover; forced outside12/23 pages yield local6packings but no balanced/global contradiction is inferred. No blind rerun followed.

New global mechanism: an internal F vertex of degree2 in its full link has its two selected cycle neighbors as ALL common neighbors with the hub. In the neighboring vertex's FULL link, the original hub becomes an isolate after deleting those selected neighbors; their apex edge is absent. Frozen conditional bridge challenger_cycle_cover_two_link_isolate_bridge_v1.md, independently ACCEPT by source_audit. This transfers the P5 obstruction to the one-isolate/no-ab SUBDOMAIN rather than fabricating a WKE tuple in the non-WKE link.

The authorized one-isolate/no-ab diagnostic completed26944 raw/2422 eligible states,2422 certificates,0UNKNOWN,0.482s/27.81MiB. Evidence challenger_cycle_cover_isolate_interface.json. Current status at this log entry: root independent validator PENDING, so no unconditional isolate exclusion or original full-domain rerun is claimed. The added accepted maxdegree-two WKE-residual rule was unused by the producer.

Fresh ordinary reviews completed in this period: full apex-unicyclic finite assembly (old finite label retained), paid-triangle collapse and two-shape replacement (removes374 dependency in ordinary v2), apex-pseudoforest C4 bouquet boundary, full-neighbor C4 retained-hw exclusion, and all five R3 restoration shapes plus full combined-CS assembly. Review files have challenger_ prefixes; root/restoration notified with hashes. Full R3 stronger audit usesν=m+1 andτ>=2m+2, so it proves inequality as well as equality, but supplies no global blocker availability.

## 04:40–05:06 UTC — completed one-cycle class, ordinary bouquet closure, and precise remaining branches

The isolate interface and final unchanged14-shape interface both passed fresh root validators. Final raw67360/eligible8220,0UNKNOWN,8/8 negative controls; independent receipt `evidence/coordinator_cycle_cover_complete_validation.json`. The three-interface DAG is noncircular: P62018 gives the matching-two domain, isolate2422 uses local rules only, neighboring-link transport then enables the final8220 certificates. The full class theorem is frozen `challenger_one_cycle_cover_cs_v1.md` SHA e8412e3e36014cfa1067c3d98ae3b51640051d9bdb600b26f019b171a2e86418 and freshly accepted by root and source_audit. It proves combined CS for ANY cover of total cycle rank≤1, without requiring minimum cover. Exact2018/2422/8220 finite premises remain explicit; no374 predecessor input, GE or Kotzig is imported. Earlier v1/v2/v3 UNKNOWNs are preserved as genuine vocabulary/mechanism boundaries.

The rank-two inequality corollary `challenger_two_cycle_cover_tuza_v2.md` SHA8a086bbf8276250c9af094c17ed6a08f1170cebf7eba70550e33b15ac84840cd is freshly accepted. It proves only Tuza for ANY cover of total cycle rank≤2 by one-edge insertion into the rank-one CS class. Every rank-reducing edge in a non-B equality candidate must leave an unchanged-packing deficit-one residual. The v1 isolated-vertex wording was corrected in preserved v2. No rank-two CS claim is made.

A new ordinary mechanism closed the all-three-neighbor C4 bouquet left by apex-pseudoforest analysis: pack per component {wab,had,hbc}, delete five rim edges and all hub spokes, obtain B residual paths w-c-d. Codegree forces cd supported, all cd can be prescribed simultaneously in old minimum covers, and one shared hw replaces t separate hub spokes, saving t−1. Primary `challenger_three_neighbor_four_cycle_bouquet_exclusion_v1.md` SHAc75c92699a9fea6b1b6588b8cf89e2e89b4322e802bf9ecd81263b8423019017, freshly reconstructed by restoration and root. Full ordinary assembly `apex_pseudoforest_full_exclusion_v1.md` now excludes every closed link with a one-vertex pseudoforest deletion, and gives cycle rank mu>=Delta+1 and m>=n+3. My assembly review explicitly records authorship/reconstruction roles. The root's ordinary consequence says ANY pseudoforest cover in a minimum CS failure is a spanning2-factor after discarding isolated vertices; my fresh review accepts it. A selected C5 can cover K5, so the exploratory broader K5-free claim was explicitly retracted and never frozen as a theorem.

The proposed cone/matching characterization was falsified ordinarily: L is K4 vertex-glued to K3,4 at the larger-part vertex. It has a TF-residual WKE tuple, cone packing5, every maximum matching hits every rim triangle, and every vertex-deleted link is cyclic and not a pseudoforest, yet the cone has exact cover7. Frozen `challenger_cone_matching_robustness_boundary_v1.md` SHA687c494c1ff6e664b62839d4c4db4be15a624be89dd326633a0dc944fd07e447; source_audit/root accepted. This retires the shortcut while preserving full minimum-CS cover invariance.

A distinct valid theorem then closes the WHOLE-cone TF-WKE branch: `challenger_whole_cone_triangle_free_matching_residual_exclusion_v1.md` SHA859fb1886e7ce98bc9a6aa9fa13326dcb2e0668712a8ede7f89db45c15d1f305. Unmatched rim vertices give apex-forest links; two P-pairs in a common-neighbor set give an explicit4-for3 augmentation; otherwise a neighboring whole link minus the hub is star+matching with at most one cycle, excluded by the new theorem. Restoration freshly accepted. The proper-cone outside-page branch remains; `challenger_outside_supported_matching_base_restrictions_v1.md` records only explicit matching-switch necessities (every maximum rim matching uses each outside-supported Pbase; no unmatched neighbor; each other Ppair cross-interface is a star).

Additional fresh ordinary reviews completed: corrected classified two-edge-B strict triangle restoration, full fresh-clique defect-one restoration extension, and the triangle-doubles four-branch shape. No new heavy job was run after the completed final domain. No unrestricted Tuza, global CS, original H-D, representation availability, or rank-two equality claim follows from these results.

## Final pre-cutoff verification, 05:07–05:09:44 UTC

Freshly accepted source_audit's ordinary common-apices cover-rigidity lemma: review/challenger_cone_common_apices_review.md SHAc697a3cb1d8bdd20d2885615470977befe2581b10dbc1d09cbbd43b85edb94a3.

Independently noticed that the triangle-doubles counting proof extends to the P4 doubled-pair pattern; restoration had simultaneously frozen that proof. Freshly reviewed it and the two-disjoint-doubles plus extra-even-single case in review/challenger_four_branch_path_and_extra_even_review.md SHA69d1cae7673296c1ce482b113dbecf850fbc507855b17e9e593c50241d5cf738.

At clock05:09:44, before the original05:10:41.328 cutoff, completed and froze the fresh FULL ordinary four-branch completion review: review/challenger_four_branch_ordinary_completion_review.md SHA4e04859f9fd7334bd698836f93857ce03be0d0bfcd278925c7c1e21073b248dc. The primary is coordinator_four_branch_ordinary_completion_v1.md SHAa67ee9350b06917ad3b77b098244e35c160d7ef8074b0679a891090c0920a81b. I reconstructed the final two-double q1 complementary residual matching, opened the many-even Section1 source to verify its triangle-free extension through Sempty paid collapse, and checked the complete triple-multiplicity reduced domain. All old363/historical5375/Kotzig premises are removed from this replacement theorem. No claim that this automatically removes the separate2018/2422/8220 premises of the one-cycle-cover theorem is made.

No new mathematical task or computation is being started in the final minute. After05:10:41.328 only documentation, integrity and cleanup are authorized; the clock is not reset.
