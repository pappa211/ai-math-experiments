# TUZA-16–19 internal mathematical source review

Private preparation review, 15 November 2026. This note is not publication-ready and is not a final frozen-candidate review.

## Verdict and independence

No blocking mathematical gap was found in the principal ordinary arguments reconstructed below. The strongest conclusions remain scoped theorems, equivalent classes, and obstructions to precisely defined mechanisms. They do not prove or refute unrestricted Tuza.

The concrete source-closure finding is that partial nested source snapshots contain unresolved relative links. They must not be represented as complete public proof packages. Several further qualifications are mandatory in the publication: historical pending/NOT_RUN statuses must remain historical; finite Lean scope must remain separate from ordinary all-size reductions; TF/non-WKE normalization does not preserve packing resilience; minimum support covers are not unrestricted minimum covers; and the Ramsey-completeness input is not verified by checking its one record.

This review used a separate AI context assigned to source mathematics. It read the source statements before reconstructing their interfaces and did not execute any archived checker, search, solver, or Lean process. The only scripts run by this reviewer performed static file/link inventory and file hashing. No frozen source or dependency was modified. `uname -s` returned `Darwin`. The canonical root and operating instructions were read. The reviewer requested no model override and inherited the parent configuration; no independently exposed exact serving-model or reasoning-effort receipt was available. The developer describes the agent as Codex based on GPT-6. This is internal AI review, not human or external peer review.

The parent supplied authenticated source pins. This reviewer independently re-read HEAD/tree and clean status with `git --no-optional-locks`; all four worktrees were clean:

| Archive | HEAD | Tree |
|---|---|---|
| TUZA-16 | `405e41c1eb24739405f4b06d8cdcd5715bb9fd13` | `cb812a36d61b81b586731278c305b8144c598d1b` |
| TUZA-17 | `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6` | `73dd4cabb6a6af747adc3b245811d27f4c8fa53e` |
| TUZA-18 | `57708a8413929012d9ca8d15b0f925b3ef6b51e8` | `0e03c90b4f0de472eaf442e3d9bc811a0cbba669` |
| TUZA-19 | `7563fdeeb5afb81ebe6ef005b5c5f9f7261ca670` | `207ad25f17e87caa850b1edfe021f251c4d008c1` |

The actual TUZA-19 pin above resolves the possible typo in the assignment. A selected 35-document hash inventory is `SOURCE_MATHEMATICAL_INPUTS.json`. This is not a complete archive hash audit or an independently recorded before/after comparison; the parent owns that mission-wide integrity audit.

## 1. Quantitative normalization: reconstructed accounting

Principal sources are TUZA-19 `notes/root_batched_universal_tf_nonwke.md`, `notes/root_subexponential_normalization_corollary.md`, and `notes/global_routes_quantitative_amplification.md`, together with the retained fresh reconstruction.

The minimal-seed argument is sound. If an edge-minimal violation has packing number k, deleting all three edges of any triangle leaves packing number at most k−1. Proper-subgraph Tuza and adding those three cover edges give tau<=2k+1; integrality and violation force equality. Thus every triangle is contained in a minimum cover. Triangle-free edges can be removed, and the standard componentwise WKE spoke/matching deletion contradicts minimality. These conclusions are properties of the hypothetical minimal seed, not of every subsequent normalized graph.

The elementary Behrend/EFR reconstruction gives the required role-labelled, linear, Berge-triangle-free incidence system. The weighted-average obstruction follows from no carries and strict convexity of a common squared-norm level. Two common role vertices determine the same line; three distinct edge owners of a graph triangle would create a Berge triangle. Hence every actual triangle is copy-local, and integral tau and nu add exactly. The independent role parts are essential to batching. This is classical incidence amplification with a project-specific deduction, not a priority claim for the construction.

For batches I_i of sizes g_i<=q and private cliques B_i of sizes q+g_i+6, the local graph J_i has order L_i=2(q+g_i+3), and its only missing complete-graph edges are inside I_i. All triangles are old H triangles, one-apex/old-edge triangles, or local J_i triangles. No mixed B_i/old-edge triangle was omitted because each I_i is independent.

Writing a=binom(q,2), e_i=binom(L_i,2)−binom(g_i,2), and t_i=e_i−L_i²/4, Mantel gives a local minimum cover t_i. A balanced cut with A∪I_i on one side attains it and selects every apex edge and apex–I_i spoke. Since different J_i share exactly E(A), the exact global identity is

    tau(W)=tau(H)+sum_i(t_i−a)+a.

The subtraction of (number of batches−1) copies of E(A) has the correct sign. A cover restriction lower bound does not assume that the restrictions are mutually compatible optima; the explicit all-spokes construction supplies the matching upper bound. TF follows by placing at most three additional vertices of a chosen local triangle on that same balanced side. For a mixed triangle, TF of H plus every old edge lying in a triangle supplies the needed minimum old cover containing its base.

The non-WKE proof handles arbitrary matching choices in all three link vertex types. At an old vertex, cross matching edges use only the q apex vertices; the clique residual-cover bound combines with each old component's non-WKE inequality. At a fresh vertex, a residual independent triple must lie in the independent batch. At an apex, private-clique cover lower bounds exceed half the link order. The q=1 componentwise case is separately handled; for q>=2 all links are connected. No unjustified inference from a whole disconnected link to each component is used.

The upper bound on packing is deliberately generous: old triangles contribute at most nu(H), local assigned triangles at most sum floor(e_i/3), and remaining mixed triangles use two of the qh apex–old spokes. Double counting available resources here weakens the upper bound and is harmless. It yields loss at most

    h(3q+4+4/q)+r(2q²+4q+4)=O_G(Nq)

for fixed seed and q=o(N). The graph order is q+2h+k(q+6)<=4N eventually. Every edge has at least q common neighbors.

With fixed 1/2<a<1, q=ceil(f_a(4N)) grows to infinity but is o(N). Eventual monotonicity gives q>=f_a(n_W). The ratio of Nq to b is bounded by constants times exp(C_G sqrt(log N)−(log(4N))^a), plus a vanishing rounding term. Thus the seed's fixed positive defect survives. For the additive-error equivalence, h>=N/r ensures h→infinity, and eventual monotonicity gives E_a(h)<=E_a(N)=o(b).

Required presentation: natural logarithms; integer q by ceiling; eventual inequalities; an unbounded incidence sequence, not every integer order; fixed a and fixed uniform C,n_0; seed fixed before the asymptotic limit. No endpoint a=1/2, n/polylog(n), fixed positive linear universal fraction, unspecified o(n²) implication, or preservation of minimality/resilience follows.

## 2. Normalized odd-cover obstruction: reconstructed seed, equality and slack

Principal sources are TUZA-19 `notes/global_routes_critical_cut_obstruction.md`, `notes/root_batched_odd_cover_obstruction.md`, its exact-identity addendum, and its asymptotic-slack addendum.

The finite-existence K5 seed has a complete elementary probabilistic proof. With p=N^(−15/4), the expected number of selected 5-sets is order N^(5/4). For every coloring at least a quarter of potential blocks are unbalanced; the exponential tail dominates the 2^N union bound. Expected short Berge-cycle counts are at most N^(1/2)+N^(3/4), so deleting at most N blocks removes all such cycles while retaining more than L N unavoidable bad blocks. Component additivity permits selection of one incidence-connected component. This is a finite-existence proof, not a retained literal giant graph.

Linearity and absence of Berge triangles make all actual graph triangles K5-local. Therefore nu(S)=2c and tau(S)=4c, while each unbalanced block costs at least two extra monochromatic edges, so beta(S)>4c+2L|V(S)|. The K5 packing upper bound uses degree parity, not merely nine used edges out of ten. Its TF and link K4 descriptions are exact.

Role amplification gives beta(H)=b beta(S), not merely a lower bound: a role-consistent lift of an optimal seed coloring attains all copywise minima. That same role consistency is indispensable to the final exact odd-cover identity.

With a universal vertex, each odd-cover indicator satisfies x_uv=1+x_au+x_av over F2; hence odd covers are exactly complements of vertex cuts, and pi=beta. For fixed old colors, balancing each J_i loses exactly u_i(g_i−u_i) cut edges from the missing batch clique. Setting the universal clique monochromatic avoids repeated-cut-edge penalty. Consequently

    pi(W)=B+min_z[uncut_H(z)+sum_i u_i(g_i−u_i)].

Every term in the sum is nonnegative. The role-consistent optimum makes every batch monochromatic, so the exact value is B+b beta(S). The ordinary cover identity is B+b tau(S). It is incorrect to discard the batch penalties without this explicit attainment argument.

Ordinary Tuza is certified independently. In each full batch, the K_(q,q,q,q) packing uses no old edge and no apex-clique edge, so different batches' packings combine despite shared apex vertices. For even q the displayed K_(2,2,2,2) base and Latin lift give 2q² triangles per full batch. The comparison with C_q=3q²+11q+6 yields strict slack once q>=24 and the number of full batches exceeds 7r+1. Both conditions hold eventually. No assumed Tuza inequality is used to show the graphs are not counterexamples.

Finally B=O_S(Nq)=o(b) and the upper/lower packing bounds give nu(W)/b→nu(S). The exact cover identities imply tau/(2nu)→1 from below and pi/nu→beta(S)/nu(S)>2. There is no exact nu(W), monotone convergence, or seed-independent numerical excess claim. The decorated family has unestablished two-edge resilience, despite the original K5-incidence seed having it. It does not refute H-O2.

## 3. Four branches, the finite kernel and heavy-core localization

Principal sources are TUZA-19 `notes/root_four_branch_wke.md`, `notes/four_branch_wke_scope_addendum.md`, `review/four_branch_wke_fresh_audit.md`, and `review/four_branch_wke_formal_root_scope.md`.

The all-size reduction is sound as an ordinary proof conditional on the complete finite certificate set. Isolates and leaf–neighbor deletion reduce order. A two-vertex subdivision lifts a WKE matching/cover witness with both sizes increasing by one and retains selected boundary vertices. A returning degree-two path is a cycle with its unique branch selected, so removing the whole cycle has every boundary edge covered. Two nondirect parallel paths, or a direct path paired with an odd nondirect path, have explicit bases with both branches selected and may be removed. A direct edge plus an even nondirect path is correctly retained: its canonical triangle cannot have both endpoints selected within a one-matching budget.

After suppression, every pair of at most four branches is exactly one of 0,D,E,O,D+E. Canonical path interiors are fresh; the branch-degree test is necessary; disconnected canonical cases enlarge the finite domain harmlessly. The raw domain has 5^0+5^1+5^3+5^6=15,756 vectors and the retained domain is reported as 5,375. This reviewer did not re-enumerate or compile it. Fresh certificate and formal execution are separate publication obligations.

For a low-heavy-degree vertex v, link degree at u equals the triangle codegree of vu. A WKE witness M,Q yields the precise residual G'=G−v−M. Its packings extend by |M| apex triangles; its covers extend by M and spokes vQ. Hence delta(G)<=delta(G'). This is a proved reduction inequality, not monotonicity of defect under arbitrary deletion.

Codegrees cannot increase during the reductions. A nonempty survivor has minimum degree at least five in its current heavy-edge graph, which is a subgraph of the original H3. Thus its vertices lie in the original H3 5-core K, and the theorem yields SOME R⊆G[K]. The induced graph G[K] can retain matching edges deleted during reduction. Any sufficient condition imposed on G[K] must guarantee Tuza for every edge-deleted subgraph, not just induced subgraphs. The correction addendum must be adjacent to the theorem.

The finite formal evidence concerns 128 separately compiled certificate chunks, domain/schedule lemmas and explicit ordinary cross-file bookkeeping. It does not formalize suppression, subdivision lifting, graph semantics, or core localization. No accepted monolithic aggregate exists. Historical failed aggregates must not become positive build targets. The all-size ordinary theorem requires both the reduction and the finite certificate closure.

## 4. Common-vertex theorem and chain distinction

The TUZA-18 common-vertex theorem is valid for every SPECIFIED maximum packing P with a common vertex v in an arbitrary ambient graph. Opposite edges form a matching M. Every old triangle contains exactly one M edge, unmatched neighbors of v are independent, and a two-page plus free-spoke augmentation controls all interpair edge matrices of ACTIVE pairs. Two pages on disjoint bases may share an edge only through reciprocal tips; merely sharing a tip is not an edge conflict.

The six matrix shapes reduce to empty, one directed two-edge star, or a rigid P4/C4 pair; the one-edge and two-disjoint-edge shapes contradict the two-page augmentation. Exact all-tip conclusions make the directed active-pair graph have outdegree at most one. The reverse leaf operation either adds one endpoint or replaces a selected parent center by both leaf endpoints. It preserves independence and one unit of net size per pair; it does not preserve one chosen vertex per pair or permanent root membership, neither of which is needed.

An active pair with an unmatched neighbor has a unique old tip there by a one-for-two augmentation. The resulting K4 is private relative to the ORIGINAL support. Giving that sink component one extra independent-set vertex pays for its permitted new apex spoke. Repeated tips can only lower the extra cost. The cover S∪{vx:x∈U\I}∪{vw:w∈W0} costs at most 2|P| and covers all old and apex triangle cases. It never changes the packing used to define A(P).

The corollary needs exactly absence of 0→1,1→2,2→3 augmentations. A discovered augmentation need not remain a common-vertex packing, so this is not a global iterative algorithm.

The chain result is a different statement. The seven-vertex block has a four-packing, six odd-degree vertices giving the upper bound, and support-cover constraints equal to two P4 vertex-cover problems after four forced bases. Its exact support minimum is eight with nine states. The edge sums use outside-support, vertex-disjoint ports; nonadjacent blocks stay vertex-disjoint and every actual triangle has one block owner. Hence packing upper bounds and support minima factor even though unrestricted cover numbers need not.

Every local minimum has equal heavy/light counts. Prefix balance forces equal numbers of matched heavy-to-light crossings in both directions. Two adjacent unchanged blocks supply only one direction, and the first unchanged block supplies an isolated light member. Therefore compatible covers must change block one and meet every path edge, requiring ceil(N/2) changed blocks. Distinct support blocks turn this into symmetric-difference distance 2ceil(N/2). Odd-block pivots attain the lower bound.

TUZA-19's continuation supplies an optimal sequence of ceil(N/2) one-edge pivots with deficiency one until the final pivot. Its lower-bound argument correctly uses isolated final heavy H_N, not an incorrectly isolated suffix light. Thus the pair of results refutes bounded immediate STRICT descent of the chosen Hall potential and explicitly allows plateau repair in this family. It does not refute Tuza, all packings, arbitrary reconfiguration, existential compatible support covers, or separator methods.

The separate November 15 replay package is a common-vertex replay only. It has no separate Git pin. The chain evidence is the frozen TUZA-18 proof/check plus TUZA-19 reconstruction/plateau continuation. Public prose and receipts must preserve that identity distinction.

## 5. Additional reconstructed statements and inherited dependencies

TUZA-16: random transversal averaging proves the t² monochromatic-rim lower bound without assuming uniform colors in twin parts. The cone spoke bound applies to every packing; 576>552 is a valid 553-vertex obstruction to that deletion payment. The exact twin compression proof accounts for all destroyed triangles through the rim and appends a packing using only removed edges, so arbitrary outside attachments are allowed. It does not preserve arbitrary forced residual-edge occupancy. Globally labelled copy transfer needs both the edge partition and the homomorphism to cover every closure triangle. The dense consequence additionally needs the uniform Yuster/Haxell–Rödl approximation and Krivelevich input. The GF4 partial-slope optimum remains 20 or 21. The 66 K10/K11 certificates address nonempty deletion sets with support at most five, not all local reductions.

TUZA-17: AC must retain the rainbow triangle-edge coloring of H, induced triangle-free L=H[X], and minimization over MINIMUM H covers. Use b=2nu(G)−tau(H), m=matching(L), and lambda=min_C vc(L−C). The necessary m<=b and saturation branch follow from the correctly oriented matching-edge deletion inequalities. The tight remainder uses Aharoni/HNS only at the tripartite equality interface, followed by graph-specific K4 extraction and full triangle exhaustion. The matching-five/cover-seven classification and the eleven-vertex critical-edge argument give the budget-six contradiction. No Ramsey catalogue enters b<=6. The elimination of budget-seven/cover-nine uses an explicitly external completeness premise for McKay's 13-vertex R(3,5) catalogue; the record/isomorphism check does not prove completeness. The first remaining b=7,m=6,lambda=vc(L)=8 window is conditional, with no eligible H,X realization established. Earlier b<=3/b<=4/b<=5 and raw-boundary prose is chronological, not the final scope. The final nonsaturation supplement gives a complete elementary matching-blocker argument and supersedes dependence on an unproved invocation of Tutte–Berge for that particular deduction.

TUZA-19 bounded stars/all cliques: the CP_r parity upper bound and one-factorization doubling retain every C4 leave orbit; the same construction proves two-edge resilience. The bounded-star marginal mixtures use leaves avoiding selected parts and symmetrization, with t=1 and t=2 treated separately. Clique feasibility uses an explicit Latin-rectangle packing and mixing with empty packing; no exact clique packing formula is needed. Summed edge capacities yield rho=m/3=nu+4/3. Incidence amplification preserves non-WKE LINK COMPONENTS, not connectedness of full links. These are compatible first marginals, not one common joint distribution or a moment-hierarchy result. The cover saving may compensate for fractional packing gaps: delta=2(nu*−nu)−(2nu*−tau), by direct algebra.

TUZA-19 square cells: canonicalizing the auxiliary matching proves mu(A)=c+nu(G). The actual endpoint argument excludes odd cycles with fewer than four terminals. A maximum-cardinality Tutte barrier has factor-critical odd components; each nontrivial one contains an odd cycle and at least four terminals. Selecting one free terminal per odd component gives expected private-diagonal cost <=|X_I|−o0, exactly cancelling terminal-free singleton components. Unique ownership of EVERY actual triangle and private diagonals are essential. No general cell availability or odd-cover inequality is proved.

TUZA-19 line graphs: star-clique line-edge sets are disjoint for SIMPLE roots; root triangles are the only additional triangles. Balanced Euler edge coloring gives local q(d) cover cost, with one possible odd-Euler defect. Explicit even-clique packings can avoid a prescribed edge, so a root triangle pays that defect; triangle-free roots permit independently chosen clique odd covers. No arbitrary-graph-to-line-graph transfer follows.

TUZA-19 private-page bound: the endpoint lemma excludes a base-free triply attached triangle whose three owners are all multi-page type one via a four-for-three augmentation. The corrected doubly-attached classification has disjoint exceptional K5 owner pairs. Selecting all edges of non-multi owners, each multi owner's base, and two spokes from one owner per exceptional pair gives exactly 3n−2m+2p. The sufficient threshold m−p>=n/2 is unavailable generally. The statement that bases alone suffice when there are no exceptional pairs belongs to the all-owners-multi special case, not arbitrary packings.

CKSU: the retained mathematical correction concerns precisely arXiv:2001.00257v2 Proposition 13 and the inspected Section 3 procedure. Reciprocal private tips on K5 invalidate its disjointness assertion. The amended endpoint classification and fractional credit repair are complete scoped ordinary arguments. They do not refute the existential main theorem or validate all later sections. The narrow later-use audit expressly excludes full validation of the half-integral theorem. Publication should identify the inspected edition and compare the accessible proceedings edition before attributing the same error to it.

## 6. Exact TUZA-16/17 summary statements for the manuscript

### TUZA-16 theorem interfaces

**Fixed-palette obstruction.** For every fixed integer r>=2, there are arbitrarily large finite simple graphs G satisfying Tuza, with every edge in a triangle, such that every partition into at most r vertex classes has more than 2nu(G) within-class edges; the ratio is unbounded. Choose triangle-free B with chi(B)>r and b vertices, form the independent t-blow-up R=B[t], then cone G over R. Uniform random transversal averaging proves at least t² monochromatic rim edges for every coloring, while each packed triangle consumes two of bt spokes. Thus t>b gives t²>bt>=2nu(G), independently of residual-cover or repacking choices. The cone's matching/vertex-cover construction certifies Tuza. For r=4 the retained base has b=23 and t=24, giving the exact comparison 576>552. Source: TUZA-16 `PROOFS_AND_OBSTRUCTIONS.md` §1 and `notes/A_RESULTS.md`. This proof is self-contained; the published triangle-edge-three-colorable theorem is context rather than a premise of the obstruction.

**Saturated independent-twin identity.** Let nonempty independent X have the exact same neighborhood S. Let F=E(G[S]), q=|F|, and R=(G−X)−F. If a supplied proper edge coloring c:F→X exists, then

    nu(G)=q+nu(R), tau(G)=q+tau(R), delta(R)=delta(G)+q.

The q triangles c(uv)uv are edge-disjoint and wholly outside R. Every triangle destroyed by the operation contains an F edge, including crossing triangles with arbitrary outside attachments. This proves both upper and lower packing bounds and both cover bounds. Forbidden residual edges or prescribed residual triangles are compatible with the appended packing; arbitrary forced occupancy of residual edges is not preserved. Source: TUZA-16 `notes/B_RESULTS.md` B1–B2 and consolidated §2. The scalar identity is ordinary; broader payment reductions are attributed to Puleo and supply no availability theorem.

**Weighted copy transfer.** If X contains G-copies H_i with nonnegative weights w_i and every X-edge has total copy weight at most one, put M=sum_i w_i. Then tau(X)>=M tau(G) and nu*(X)>=M nu*(G). The first follows by weighted cover restriction; the second by summing scaled feasible fractional packings. Uniform fractional-to-integral approximation adds nu(X)>=M nu*(G)−e(N)N², e(N)→0. It is a lower packing bound. If the fixed base has positive integral/fractional gap and M>=cN², it excludes the proposed upper bound nu(X)<=M nu(G)+o(M). Source: TUZA-16 `notes/C_FROZEN_PROOF.md` §3; dependency: uniform Yuster Theorem 1.2 for K3, with Krivelevich Theorem 8 ensuring a positive gap for a hypothetical Tuza violation.

**Exact labelled-copy transfer.** If E(X) partitions into r G-copies and a graph homomorphism X→G is an isomorphism on each copy, then tau(X)=r tau(G), nu*(X)=r nu*(G). The homomorphism maps every actual triangle, including closure triangles, to a triangle; pulling back an integral/fractional cover gives the upper bounds. Consequently

    delta(X)=r[tau(G)−2nu*(G)]+2[nu*(X)−nu(X)].

Only the asymptotic consequence uses Krivelevich and the uniform approximation; the exact identities use finite LP duality. Same-vertex-set o(N²) edge edits change delta by at most o(N²). This says positive quadratic defect cannot survive this interface; it does not exclude all amplification or all approximate proofs. Source: consolidated §3 and frozen C §4; keep the domain addendum.

**Exact apex states.** For G obtained from arbitrary H by adding z adjacent exactly to X and L=H[X],

    tau(G)=min over ALL H triangle covers C [|C|+vc(L−C)],
    nu(G)=max over ALL L matchings M [|M|+nu(H−M)].

The first splits a cover into old edges and apex spokes; the second splits a packing into old triangles and apex pages. Matching deletion removes edges, not vertices. A minimum H-cover restriction is an additional compatibility claim and is not implied by either identity.

### TUZA-17 AC: complete low-budget interface

**Eligibility and target.** H is finite simple with a three-coloring of graph edges rainbow on every actual triangle. X is arbitrary subject to L=H[X] being induced triangle-free. G adds z adjacent exactly to X. Put h=nu(H), p=nu(G), a=p−h, D=2h−tau(H), b=D+2a=2p−tau(H), m=mu(L), and

    lambda=min{vc(L−C): C is a MINIMUM triangle-edge cover of H}.

AC is lambda<=b. Aharoni gives D>=0. The proved theorem is AC for every eligible instance with b<=6, at arbitrary order and outside incidence. It is not an unrestricted apex theorem.

**Equality interface.** Deleting graph edges preserves the rainbow coloring, hence its triangle hypergraph remains tripartite. Aharoni gives tau(J)<=2nu(J). When equality holds, HNS's home-base structure yields disjoint loose-cycle supports; the graph-specific extraction turns each into an actual K4. If an additional triangle were not a block face, choose in every block a face avoiding its possible shared edge and append it, contradicting maximum packing. Thus ALL J triangles are faces of edge-disjoint K4 blocks. The blocks can share vertices, and triangle-free leftover edges are allowed. This is the precise inherited TUZA-01/TUZA-03 consequence used, not unrestricted equality classification.

**Necessary and saturated branches.** For maximum link matching M of size m,

    tau(H)−m <= tau(H−M) <= 2nu(H−M) <= 2p−2m,

so m<=b. If m=b all inequalities are equalities. Cover each tight K4 block with an opposite edge pair containing its possible L edge, and add M. This gives an H cover of size exactly tau(H). Any remaining link edge is unsupported by old triangles: an old triangle containing it cannot be a residual block face and cannot also contain an M edge because the induced link is triangle-free. Every matching of remaining link edges appends to any maximum H-packing, giving residual vertex cover at most 2a. This settles saturation with a truly minimum old cover.

**Elementary link bounds and b<=4.** A maximum matching in a triangle-free graph has, on each edge, an endpoint with no unmatched neighbor: two distinct such neighbors augment, while a common one forms a triangle. Remove one such endpoint from the usual 2m endpoint cover to get vc<=2m−1 for m>=1. For m>=3, among three safe endpoints two are nonadjacent; removing those two gives vc<=2m−2. Together with m<=b and saturation, every b<=4 case follows.

**b=5.** The sole potentially failing case is m=4, lambda=vc(L)=6. The elementary Gallai decomposition and independent-set bound on triangle-free nine-vertex graphs show L is two disjoint C5s plus isolates. Every cycle edge is cover-critical and is allowed in a maximum matching. AC failure would force every minimum H-cover to omit such an edge e, so tau(H−e)=tau(H). Choosing maximum M containing e and deleting e first forces H−M tight. The tight-frontier lemma below would require at least m−1=3 link edges in every maximum matching, whereas the two C5s have empty intersection. Contradiction. This also supplies a direct final-proof chain for the earlier b=5 result.

**Tight-frontier lemma.** If m=b−1 and J=H−M is tight, let R_L be the intersection of all maximum L matchings. Any old-supported f∈M must belong to R_L. Otherwise choose a triangle Q containing f and a maximum link matching N avoiding it. Every tight J-block has at most one N edge and at most one Q edge; if both occur, they are adjacent because the induced triangle-free link permits only two X vertices in the block. Choose a block face avoiding both, then append Q and all m apex pages of N, contradicting p. Covering J and adding only supported M edges yields tau(H)<=2nu(J)+|R_L|. Frontier arithmetic gives |R_L|>=m−1.

**b=6.** The remaining case is m=5 and lambda=vc(L)=7. If a link vertex is matching-essential, deleting it leaves two C5s plus isolates; the vertex must have a leaf neighbor and may join independent subsets of the cycles. Otherwise Gallai gives a C5 plus a seven-vertex factor-critical component, or one eleven-vertex factor-critical component with independence number four. These exhaust all components because nontrivial triangle-free factor-critical components have matching number at least two. In all cases at most one edge lies in every maximum matching.

Every such link has a cover-critical edge belonging to a maximum matching. The C5-containing cases are immediate. For the eleven-vertex case, fix an independent four-set A. A vertex outside A with one A-neighbor already gives a critical edge. Otherwise all seven outside vertices have at least two A-neighbors; outside adjacency can occur only between complementary two-subsets of A. The maximum independent-set bound forces r+sum|p_i−q_i|=1. If r=0, choosing appropriate sides yields an independent five-set, contradiction. If r=1, the unique vertex with three/four A-neighbors gives a critical edge. Factor-criticality makes every edge allowed in a maximum matching.

Choose such e∈M. AC failure makes every minimum H-cover omit e, hence tau(H−e)=tau(H). Deleting the other four M edges gives tau(H−M)>=tau(H)−4=2(p−5), while Aharoni and apex packing give the reverse inequality. Thus J is tight. The frontier lemma demands |R_L|>=4, contradicting |R_L|<=1. This completes b<=6 without a Ramsey catalogue.

Sources: TUZA-17 `notes/B_FROZEN_v1.md`, `notes/B_FROZEN_ADDENDUM_1.md`, `notes/BOUNDARY_A.md`, `notes/BOUNDARY6_FROZEN_LINK_LEMMA.md`, `notes/B_FRONTIER_MATCHING_CERTIFICATE.md`; final dependency compilation and reviews control the historical early status wording.

**b=7 and catalogue boundary.** Saturation handles m=7; m<=5 has vc<=7. A matching-six/cover-nine triangle-free link has no essential vertex, hence its nontrivial components are either three C5s or one 13-vertex factor-critical graph with independence number four. The general frontier certificate asks for a maximum M with some F⊆M and vc(L−F)<=7, plus |R_L|<=4. Explicit F,M choices certify three C5s and the circulant on Z/13 with differences ±1,±5. McKay's catalogue-completeness statement identifies every remaining 13-vertex graph with that circulant. The local record decoder/isomorphism checks verify only the displayed graph and application, not completeness. With that declared input, the first remaining failure window is b=7,m=6,lambda=vc(L)=8. No full eligible H,X instance in that numerical stratum was established. Source: `notes/CRITIC_CATALOGUE_SCOPE.md` and `PRIOR_ART_AND_DEPENDENCIES.md`.

## 7. Source-closure and status findings requiring editorial disposition

1. **Partial copied snapshots are not closed archives.** A static scan of Markdown link targets, excluding `sources/`, `.git`, and `.lake`, found zero missing targets in TUZA-16/17, two in TUZA-18, and 41 in TUZA-19. The TUZA-18 misses are in `evidence/critic_source_constructive_and_star.md`, pointing to `../../../STATUS_AND_PROVENANCE.md` and `../../../tools/check_tuza_examples.py`. The TUZA-19 misses are nested partial copies under `evidence/source_audit/frozen/`: copied replay receipts point to absent frozen proofs, `checker_result.json`, `run_replay.py`, and related replay files; copied TUZA-18 report/receipt/status documents point to the numerous intentionally uncopied notes and receipts. Publish the full canonical retained proof/replay closure, map these references to it, or exclude redundant partial copies with an explicit disposition. A broken-link fix must not mislabel the copied receipt as a newly replayed package.

2. **Historical status conflicts are expected but must be controlled visibly.** Frozen TUZA-19 principal notes say review pending, no Lean, or candidate; later final ledgers and reviews report acceptance and finite Lean evidence. Keep source bytes where appropriate and place a current status wrapper/addendum beside them. Do not silently change frozen theorem prose to manufacture prior review. TUZA-16/17 `independent_final_verification: NOT_RUN` remains true historically; this source review is new evidence for the stated reconstruction scope only, not a retroactive relabeling.

3. **Corrections must travel with their dependencies.** Include the TUZA-18 source-access correction (failed ECCC download), TUZA-19 core-subgraph scope addendum, CP5 K5 parity erratum, bounded-stars link-component addendum, exact odd-cover identity, and near-tightness addendum. Do not retain a corrected report while omitting the full corrected interface.

4. **External dependency notices remain claim-specific.** TUZA-17 AC uses Aharoni/HNS and, only for one frontier elimination, catalogue completeness. Square-cell proofs use Tutte–Berge. TUZA-16 dense transfer uses the uniform approximation statement and Krivelevich. Finite-existence seed and principal normalization include self-contained incidence arguments, but classical attribution remains necessary. This review did not repeat the targeted live primary-source literature comparison; the publication's literature lane must do that.

5. **Evidence levels cannot be merged.** Solver-only rainbow UNSAT lacks checked traces. Historical timed-out/cutoff cases remain UNKNOWN. Historical large censuses are not fresh replays. Finite WKE certificate Lean proofs do not formalize all-size reductions; RoleWitness does not formalize the common-vertex or chain theorems. Formal schedule/source correspondence must be checked on the fresh accepted bundle rather than by reading old logs through embedded paths.

6. **Notation should prevent false analogies.** Distinguish graph defect delta from Hall deficiency; ordinary matching m from triangle-packing nu; beta as exponent from bipartization beta; q as clique size from other source uses; and p as number of exceptional pairs from an owner triangle. Define triangle codegree using all actual triangles. Uncovered-edge degrees retain original graph-degree parity; they are not universally even. For support-contained covers |C|−2|P|=a3−a1; adding r outside-support selected edges gives a3−a1+r.

7. **Negative results retain exact interfaces.** Distinguish the two 32-vertex witnesses (75-edge concentration versus 76-edge pair-overcover), the nine-vertex TF control from the resilient 72-vertex control, graph controls from abstract hypergraphs, all-packing quantifiers from one fixed packing, and normalized graphs from minimal violations. No barrier table should prohibit all approximation, fractional tools, local algorithms, bounded-radius approaches, or local hierarchies.

## 8. Remaining final-review obligations

This source review is preparation only. No curated publication tree/content manifest was frozen or supplied to this reviewer, so there is no final candidate sign-off. A final mathematical/editorial review must inspect the actual canonical manuscript, generated derivatives, current guide, root claims, all claim/evidence dispositions, public proof links, retained dependencies, and source-to-publication transformations against a frozen candidate identity. Required finite and formal replays are separate and were not run here. Privacy, licensing, PDF page inspection, new Git metadata, release checksums, and public verification are also outside this review's executed scope.

Subject to those remaining checks, the reconstructed principal ordinary results are mathematically publishable at the exact scopes stated here. The archive-link closure issue is a concrete preparation requirement; no new research campaign is needed to resolve it.
