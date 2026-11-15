> Historical mission record, 14–15 November 2026. Original proof/status boundaries remain; publication review and fresh execution are recorded separately in [publication evidence](../../verification/tuza-16-19/README.md). Operational publication restrictions in this record describe the earlier mission.

# TUZA-19 — Final private research report

**Unrestricted Tuza remains unresolved in this run. No complete proof and no graph certified to violate tau(G)<=2nu(G) were found.** The strongest outcomes are a quantitative equivalent class, an independently reviewed obstruction to the odd-cover route even on that class, and an all-size four-branch WKE theorem whose finite kernel has Lean certificates. Several other precise routes were proved or refuted. None supplies the missing unrestricted step.

This is the private discovery checkpoint, not a paper or public update. Exact originality remains unresolved. The primary literature inputs and prior private results are distinguished from the deductions developed here.

## Mission and source boundary

The original clock was retained throughout:

| Event | UTC, 15 November 2026 |
|---|---|
| First clock read / start | 01:53:58 |
| Research and candidate-verification cutoff | 09:23:58 |
| Hard deadline | 09:53:58 |

Before the first clock read, the parent announced the attachment read, listed the initial workspace and AGENTS candidates, and read the pasted mission. Darwin and the canonical math-research workspace root were confirmed before mathematics or creation of this private workspace. Research and interim review ended by the cutoff; only documentation, preservation checks and checkpoint work followed. All mathematical execution was local on the owner's Mac. No cloud/server execution, new environment, publication or author contact occurred.

Workspace: `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-19`. Branch: `codex/tuza19`; zero remotes. The requested configuration was Astra/Ultra, including exposed child-agent request controls. Exact applied serving identity and reasoning effort were not independently exposed and are not asserted. [Original clock — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) · [Mission — inspected source/access record](../../papers/tuza-16-19-research-summary/LITERATURE_RECHECK.md) · [Final receipt](FINAL_RECEIPT.md).

Frozen sources used:

| Source | Observed commit |
|---|---|
| TUZA-18, annotated `tuza18-final-checkpoint` | `57708a8413929012d9ca8d15b0f925b3ef6b51e8` |
| TUZA-17 | `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6` |
| TUZA-16 | `405e41c1eb24739405f4b06d8cdcd5715bb9fd13` |
| Published baseline, `ai-math-experiments` | `d4029fbafc3dffc250b50ed237ad81c3206cd1a0` |

The November 15 replay at `TUZA-18-replay-20261115T014227Z` is positively identified as the **common-vertex** replay. It is not a separate connected-chain replay and has no separate Git commit. The owner confirmed this and authorized use of the frozen TUZA-18 chain proof and recorded N=3 check on the original clock. The current chain continuation also reconstructed that finite control independently of the old checker. No unresolved user-input request remains. [Source audit](review/chain_archive_audit.md) · [Initial identities — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json).

Closeout preservation passed for all four historical repositories and 664 file-hash comparisons, including the 19 replay files and the frozen formal bundle. This is an identity/byte check, not a new mathematical replay. [Preservation receipt — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json).

## Definitions and verification labels

For a finite simple graph, nu is the maximum number of edge-disjoint actual triangles, tau the minimum number of graph edges meeting every triangle, and delta=tau-2nu. The odd-cover number pi requires every triangle to meet the selected edge set in one or three edges. TF means **each specified triangle is wholly contained in some minimum ordinary triangle cover**; the minimum cover may depend on the triangle.

A link is WKE if it has a matching M and a vertex cover Q of the link with M deleted, with |Q|<=|M|. “No WKE link component” quantifies over every connected component, not merely the entire link.

An ordinary all-size proof may use a finite reduction with complete literal certificates. Fresh AI review reconstructs a frozen argument in an independent context; it is not human review. A solver's UNSAT return without a checked proof trace remains solver-only. The Lean result below covers its finite domain and schedule, not the all-size reductions. Superseded producer notes retain their original “pending” status text; the final status matrix and linked dated reviews govern this checkpoint.

## 1. Quantitative normalization, with almost linear numbers of universal vertices

For every fixed a with 1/2<a<1, put

    f_a(n)=n exp(-(log n)^a).

**Unrestricted Tuza is equivalent to its restriction to graphs that simultaneously have at least f_a(n) universal vertices, minimum triangle codegree at least f_a(n), TF, and no WKE link component.** The constructed graphs have connected links once their universal clique has at least two vertices. In particular, the statement holds with n^beta in place of f_a(n), for every fixed 0<beta<1.

There is also an additive-error equivalence: a uniform estimate

    tau(G)<=2nu(G)+C n^2 exp(-(log n)^a)

for all sufficiently large graphs, with fixed C and a in that range, implies exact unrestricted Tuza. The earlier consequence with any fixed power-saving error C n^(2-epsilon), 0<epsilon<2, follows as well.

The incidence ingredient is classical Behrend/Erdos–Frankl–Rodl. For a fixed seed, its linear, Berge-triangle-free copy system has b>=N^2 exp(-C_seed sqrt(log N)) blocks, and actual integral packing and cover numbers add exactly over copies. The new batching step uses the fixed independent role parts: groups of at most q old vertices share one private clique attached to a universal K_q. Exact Mantel cover counts and arbitrary-matching link estimates give O(N) final order and O(Nq) defect cost. Choosing q around f_a(4N) makes that cost o(b), so a hypothetical fixed positive defect survives.

This is a stronger equivalent class, **not a proof on that class**. Packing resilience and edge-minimality are not preserved; taking a minimal subgraph can destroy universality. There is no positive fixed fraction of universal vertices, n/polylog(n) threshold, fixed-coefficient endpoint at a=1/2, or automatic implication from an unspecified o(n^2) error claimed here.

Verification: complete ordinary proofs, partner reconstruction, fresh independent reconstruction PASS. No Lean or huge graph generation. Exact deduction priority remains unresolved after a bounded primary-source screen. The classical incidence construction is explicitly attributed to [Erdos–Frankl–Rodl (1986)](https://www.renyi.hu/~p_erdos/1986-17.pdf); nearby dense-edge and unspecified-o(n²) results are different statements.

- [Batched theorem](notes/root_batched_universal_tf_nonwke.md), SHA256 `d4ff2e5f0539b43fedc54fab7eef87a01717b43103577e5862b7739a63101913`.
- [Subexponential corollary](notes/root_subexponential_normalization_corollary.md).
- [Fresh reconstruction](review/batched_universal_tf_nonwke_fresh_audit.md).
- [Classical quantitative input](notes/global_routes_quantitative_amplification.md) and [primary-source audit](review/efr_power_saving_source_audit.md).
- [Bounded originality screen](review/nearlinear_universal_prior_art_screen.md).

## 2. The odd-cover route fails even on that stronger class

For every fixed 1/2<a<1, there are arbitrarily large actual graphs W with the same almost linear universal-vertex and codegree threshold, TF, and connected non-WKE links, but

    tau(W)<2nu(W)<pi(W).

Their ordinary ratio tau(W)/(2nu(W)) tends to one from below, while pi(W)/nu(W) tends to a fixed value strictly above two. Thus merely adding relative near-equality in ordinary Tuza does not repair this odd-cover gate.

The fixed finite seed is the K5-incidence cut obstruction, with tau(S)=2nu(S) but bipartization number beta(S)>2nu(S). Role amplification preserves beta exactly. In the batched graph, a universal vertex forces every odd cover to be the complement of a vertex cut. The exact identities are

    tau(W)=B+b tau(S),   pi(W)=B+b beta(S).

The local cost B and the increase in packing number are O(Nq)=o(b). Ordinary Tuza is independently certified: each full even-q batch contains a K_(q,q,q,q) with an explicit 2q²-triangle decomposition. These packings avoid old edges and shared apex-clique edges, so they combine with an old maximum packing and give strict ordinary slack. There is no circular assumption of Tuza.

This is an ordinary finite-existence family, not a retained literal huge edge list. The K5-incidence seed uses a proved probabilistic existence argument; the later amplification and decorations are explicit. The eight-triangle K_(2,2,2,2) base was independently checked. **Two-edge packing resilience is unestablished**, so this is not a counterexample to H-O2 or its TF strengthening.

Verification: ordinary proof, partner and fresh AI reviews PASS, independent literal base check. No formal or human verification.

- [Construction and certificates](notes/root_batched_odd_cover_obstruction.md), SHA256 `240f03702de1bc3f2deadb1be99307c27de26849607b2bd50e8ecd2cffcca4f7`.
- [Exact identities](notes/root_batched_odd_cover_exact_identity.md) · [Asymptotic ratios](notes/root_batched_odd_asymptotic_slack.md).
- [Fresh proof review](review/batched_odd_cover_fresh_audit.md) · [Fresh ratio review](review/batched_odd_asymptotic_slack_fresh_audit.md).

## 3. Four-branch WKE theorem and unrestricted core localization

**Every finite simple graph with at most four vertices of degree at least three is WKE.** There is no order or maximum-degree bound. Leaf, cycle, loop, parallel-path and two-vertex-subdivision reductions leave exactly 5,375 canonical graphs, all supplied with literal witnesses.

For arbitrary G, let H_3 contain the edges in at least three actual triangles, and let K be the vertex set of its 5-core. WKE reductions produce some R contained in G[K] with

    delta(G)<=delta(R).

Hence an empty 5-core of H_3 proves Tuza. The claim is about **a subgraph R**, not an unsupported comparison with the full induced graph G[K]. Any sufficient condition used on G[K] must survive arbitrary edge deletions. Each link component of a genuinely irreducible counterexample must have at least five branch vertices.

Verification: ordinary all-size reduction and fresh AI reconstruction, complete literal certificates, and a **finite Lean proof bundle**. All 5,375 records passed in 128 separately compiled modules; separate enumerator and schedule proofs establish the complete finite domain. The 128 certificate theorems report no axioms. Some general list/domain proofs use the standard propext, Classical.choice and Quot.sound. Three deliberately corrupted controls were rejected.

The all-size WKE reduction and core theorem were **not** formalized. There is no accepted monolithic theorem importing all chunks; the bundle has explicit checked cross-file bookkeeping. Lean 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, used installed Std/core, no Mathlib import, native_decide, new axiom or admitted accepted declaration. The recorded Mathlib environment pin is `0df444a360eaa60ab8c11dca51a86af692955474`.

Material execution limit: accepted checks peaked at 1,781,858,304 bytes RSS and about 4.86 seconds per command. Failed aggregate/schedule attempts reached up to 4,340,842,496 bytes despite configured Lean memory limits no greater than 2,200 MiB. The setting was not an OS hard RSS cap. Those failures and diagnostics are retained and excluded from the accepted result. One Lean process ran at a time, with 240-second per-command limits and no cap increase.

- [Ordinary proof](notes/root_four_branch_wke.md) · [Scope correction](notes/four_branch_wke_scope_addendum.md).
- [Fresh all-size review](review/four_branch_wke_fresh_audit.md).
- [Formal scope, pins and replay](formal/four_branch_wke/README.md) · [Formal receipt](formal/four_branch_wke/FINAL_RECEIPT.json).
- [Root formal-correspondence review](review/four_branch_wke_formal_root_scope.md).

## 4. Bounded-star and all-clique packing polytopes still do not synchronize

For every fixed k, intersect the exact triangle-packing polytopes on all triangle families meeting a vertex set of size at most k, and also on every original-graph clique, with no bound on clique size. Requiring their **first marginals** to agree is insufficient to recover the global packing number.

An explicit family CP_r=K_(2,...,2), with r=3*2^j-1 and r large enough for k, has

    m=2r(r-1), nu=(m-4)/3, tau=(r-1)^2,
    relaxation optimum rho=m/3=nu+4/3.

These graphs have TF, two-edge packing resilience, and connected non-WKE links. Literal CP_5 packings with each C4-leave orbit seed an all-size doubling construction. Symmetric mixtures prove feasibility for every fixed-budget star; explicit complete-tripartite packings give feasibility for every clique. Incidence amplification preserves the relevant componentwise properties and makes the additive gap exceed every fixed C n^(2-epsilon), epsilon>0, along a sequence.

This does **not** refute Tuza, a factor-two cover inequality, or any named hierarchy imposing a common joint distribution or higher moments. Global leave/component constraints can detect these controls. After amplification, non-WKE **link components** persist, but full links need not stay connected. The fixed CP_5 note's K5 edge-count wording is corrected separately; parity, not edge count alone, excludes a three-packing in K5.

Verification: ordinary all-size proof, fresh AI reconstruction PASS, independent literal base and finite property checks. Complete-equipartite packing has classical antecedents; exact relaxation priority is unresolved.

- [Unified proof](notes/global_routes_bounded_stars_all_cliques.md) · [Scope addendum](notes/global_routes_bounded_stars_scope_addendum.md).
- [Fresh review](review/bounded_stars_all_cliques_fresh_audit.md).
- [CP_5 control](notes/global_routes_clique_link_polytope_obstruction.md) · [Erratum](notes/global_routes_clique_link_erratum.md) · [Fresh control audit](review/clique_link_polytope_fresh_audit.md).

## 5. Other positive all-size results

| Result | Exact limit and evidence |
|---|---|
| Arbitrary-multiplicity square K4 cells satisfy tau<=2nu | Every actual triangle must have unique cell ownership and each cell's opposite diagonals must be private. Boundary multiplicity is unrestricted. Auxiliary ordinary matching, actual endpoint closure and Tutte–Berge give the proof. General availability is open. [Proof](notes/global_routes_square_cells_matching.md), [fresh review](review/square_cells_fresh_independent_audit.md). |
| Every ordinary line graph satisfies pi<=2nu | Balanced edge colorings, local clique packings and a payment for the Euler-tour parity defect cover all finite simple roots. No reduction of arbitrary graphs to line graphs is supplied. [Proof](notes/root_line_graph_parity.md), [fresh review](review/line_graph_parity_fresh_audit.md). |
| Integral private-page bound | For any maximum packing of size n, with m multi-page type-one owners and p disjoint exceptional K5 pairs, an explicit support cover has size 3n-2m+2p. The sufficient threshold m-p>=n/2 is not generally available. [Proof](notes/root_multi_private_integral_cover.md), [fresh review](review/multi_private_fresh_audit.md). |
| Connected-chain plateau repair | The frozen TUZA-18 family admits an optimal ceil(N/2)-move sequence of one-edge replacements, with Hall deficiency one until the final move and then zero. This resolves that control under plateau moves, not an arbitrary reconfiguration theorem. [Proof](review/chain_plateau_control.md). |
| Paired-color resource reduction | Selecting exactly one codegree-two edge per actual triangle is equivalent to a perfect matching in the light-page graph D. The heavy-set/light-completion objective is exact. Availability and the all-size rainbow mixed-cover inequality remain separate open claims. [Reduction](notes/tf_heavy_triangle_free_light_matching.md). |

These results are ordinary proofs with the review levels recorded in their linked files. Their classical ingredients and attribution questions are retained; none is presented as a verified priority claim.

## 6. Decisive failed mechanisms and literal witnesses

The complete [status matrix](STATUS_MATRIX.md) indexes every serious lane. The most consequential failures are:

- **TF alone does not exclude adjacent light edges.** A literal nine-vertex graph has 22 edges, 18 triangles, tau=8 and nu=6; all 18 triangles have containing minimum covers, while triangle 012 has codegree-two edges 01 and 02. An ordinary half-packing tightness contradiction proves the cover lower bound; parity proves the packing upper bound. It fails two-edge resilience and has heavy triangles, so stronger joint hypotheses remain open. [Full edge list and proof](notes/fresh_tf_light_wedge_counterexample.md), [root reconstruction](review/root_tf_light_wedge_audit.md).
- **TF plus two-edge resilience does not force minimum codegree three or integral fractional-cover normalization.** The literal 72-vertex, 216-edge control has nu=49 and tau=pi=86, five codegree-two edges, and a half-cover of mass 85. Every order k>=2 has a normalized budget at most 85. Its 240 TF certificates and all 23,220 edge-pair deletions were checked independently. [Codegree counterexample](notes/codegree_two_tf_resilience_counterexample.md), [fractional obstruction](notes/fresh_halfcover_tf_resilience_counterexample.md). It satisfies ordinary Tuza.
- **A universal join does not uniformly preserve packing resilience.** Explicit planted perfect rim matchings make every single cross edge a packing blocker. This refutes a guarantee over all amplifications, not existence of a specially chosen amplification. [Proof and quantifiers](notes/global_routes_universal_join_saturation.md), [fresh review](review/universal_join_saturation_fresh_audit.md).
- **The printed CKSU v2 Proposition 13 fails on a literal K5 input.** The source was checked directly. The existential main theorem is not refuted. An exceptional K5-pair repair gives the known order-three fractional target; a narrow later-use audit does not validate the entire paper. [Source audit](review/cksu_prop13_independent_audit.md), [repair](notes/root_cksu_order3_repair.md), [dependency scope](review/cksu_half_prop13_dependency_audit.md).
- **Optimized private-page shortcuts still fail.** A 32-vertex, 75-edge concentration control and a distinct 32-vertex, 76-edge pair-overcover control have different scopes and are not conflated. The latter defeats the precise simplification for all 4,374 F-maximizers; keeping the third literal or allowing unequal allocation repairs that simplification. [Concentration](notes/packing_routes_concentration_obstruction.md), [pair control](notes/fresh_global_private_pair_gate_obstruction.md).
- **Other closed routes:** the exact local diamond matching signature violates alternating-path exchange; the Delta-Y closed-boundary T-join target fails for every K5 maximum packing; weighted barycentric transfer fails on X(K4); optimal odd-cover two-lift transfer fails in an all-size family; insulated K5 spokes retain a two-spoke blocker. These are scoped architecture failures, not general impossibility theorems. Exact statements, witnesses and reviews are in the status matrix.

The two stronger rainbow gates remain open. The mixed-cover and ordinary vertex-cover versions each reduce a hypothetical rainbow-number-two counterexample to 28 domains; all returned UNSAT, but no DRAT or Lean trace was checked. These are **solver-only finite results**, not all-size theorems. The ordinary vertex-cover gate is proved for maximum degree at most two. The strengthened nine-vertex TF/light-wedge search and the earlier K2-join n=11 test ended **UNKNOWN_TIMEOUT**, not UNSAT. No larger census was used to replace a missing proof.

## 7. Exact unresolved steps

No specific complete route to unrestricted Tuza emerged. The strongest remaining gates are concrete but unresolved:

1. H-O2: edge cover-criticality plus two-edge packing resilience implying pi<=2nu; its TF strengthening also remains open. The new normalized odd-cover family has unestablished resilience and cannot be used against this gate.
2. The simultaneous triangle-deletion/triangle-addition compatibility step. Separate optimal states exist, but no joint exchange is proved.
3. Availability of compatible packing groups or a general nonincreasing cover-reconfiguration sequence. The connected-chain family now has an optimal plateau repair, but does not establish global availability.
4. For triangle-free H_3, a perfect matching in D selecting one light edge per triangle, followed by the separate rainbow mixed-cover bound. Even both successes would establish that graph class, not an argument forcing every minimal violation into it.
5. The K5 canonical cycle/isolated-vertex gate in the two-apex envelope. Two targeted controls and five exact endpoint rotations survive, but no global termination or blossom invariant has been proved.
6. A proof on the almost-linear-universal normalized class. The odd-cover shortcut on that class is now decisively false; extracting a minimal subgraph loses the normalization.

Future work should challenge one exact missing implication rather than enlarge a census without a structural reason. No post-cutoff candidate verification is included in this checkpoint.

## Evidence delivery and later use

[REPRODUCTION.md](REPRODUCTION.md) gives replay entry points, expected outcomes and trust boundaries. [PRIVATE_PUBLICATION_HANDOFF.md — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) is a concise evidence/editorial index for a later combined TUZA-18/TUZA-19 update, not a drafted paper. [RESEARCH_LOG.md](RESEARCH_LOG.md) preserves decisions and failures; [STATUS_MATRIX.md](STATUS_MATRIX.md) is the exhaustive result ledger. Frozen proof hashes, sources, finite witnesses, accepted formal objects and failed attempts remain in the private repository.

The final checkpoint's tag, full commit identity, elapsed time and clean-state receipt are recorded through [FINAL_RECEIPT.md](FINAL_RECEIPT.md). Human specialist review, exact priority checks, any broader formalization and publication belong to a later authorized mission.
