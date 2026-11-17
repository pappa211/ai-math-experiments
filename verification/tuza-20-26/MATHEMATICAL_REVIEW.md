# Independent mathematical and scope audit: TUZA-20–26

Date: 17 November 2026. Reviewer role: independent AI mathematical reconstruction for the consolidation mission. This is not external human peer review. Original source trees were read only; TUZA-27 was neither used nor modified. No Lean process, solver, census or finite-certificate execution was performed by this reviewer. Fresh execution is a separate reproduction obligation.

## Verdict and exact coverage

**The reconstructed central statements are mathematically coherent at their stated scopes; no new substantive mathematical contradiction was found. Publication remains subject to source-complete archive inspection and the separate required fresh reproduction.** This is not blanket reconstruction of every one of the 345 inherited ledger rows.

The companion [CLAIMS.json](CLAIMS.json) accounts for every row in the seven authoritative final claim/theorem ledgers: 16 (20), 19 (21), 162 (22), 29 (23), 19 (24), 24 (25), and 76 (26). It binds source ledgers and existing referenced primary files by SHA-256 and records exact formal types when supplied. Its abbreviated historical scope strings are not silently promoted into complete mathematical statements. The detailed exact statements and review depth below govern this review. Full primary notes remain required for minor technical interfaces not reconstructed here.

Fresh ordinary reconstruction in this review covers the complete TUZA-20 compulsory-gain witness, TUZA-21 Clebsch-cone private-witness obstruction and switched-book discriminator, Lemma A/M0, R1/R2/R3 including all five restored-edge shapes, the forest existential anchor and hereditary-class proof architecture, TUZA-25 separator/critical-edge/matching deletion arguments and mixed equivalences, and the key TUZA-26 core-minimization/eligibility/single-deletion and actual-parent composition/selection arguments. Formal semantic inspection covers actual graph/cover/forest/minimality definitions, target types and key exported proof wrappers in TUZA-23/24. The extensive TUZA-26 degree-four and terminal finite reconstructions are reviewed at the composition/dependency level, using their full immutable independent source reviews; this review does not claim to have freshly re-enumerated their domains or reconstructed every case.

## Definitions that must remain fixed

All graphs are finite and simple. The triangle family contains **every actual graph triangle**, not a chosen subhypergraph. A packing consists of pairwise graph-edge-disjoint triangles; vertices may repeat. A triangle cover consists of actual graph edges meeting every triangle. Write `nu` and `tau` for their optima and `delta=2nu-tau`. In particular defect one is positive slack, not a Tuza violation.

Triangle components are connected components of the triangle-intersection graph where adjacency means sharing a **graph edge**. Their literal supports are the unions of the actual triangle edges. `B(G)` means every nonempty such support is exactly a K4 or K5. This is not ordinary block decomposition, graph connectivity, or the assertion that every triangle lies in some K4/K5. Background edges are actual graph edges in no triangle and must be retained whenever the original graph is restored. `CS(G)` means both `tau(G)<=2nu(G)` and `(tau(G)=2nu(G) iff B(G))`.

Single-edge packing resilience means `nu(X-e)=nu(X)` for every actual edge; two-edge resilience quantifies over every set of at most two actual edges. An eligible edge belongs to **some** minimum cover; distinct edges being individually eligible does not imply joint eligibility. Every use of a whole triangle or pair in a minimum cover needs its own proof.

## Exact central claim ledger

### M20-C01 / M20-C02: prescribed compulsory gains fail

In TUZA-20, `C01` and `C02` refute particular fixed-packing cover constructions, not PK-all, PK-exists or Tuza. Original support and actual graph labels are essential.

For C01 take `G=K6-{35,45}` and `P={013,025,234}`. A four-packing would leave a single edge, impossible from the four odd-degree vertices. The bases are `01,25,24`, private pages `014,125,124`, gains `34,01,13`. The exact residual clauses are `{02,03,23}`, `{03,34}`, `{13,23}`, `{13,34}`. Two spokes, e.g. `03,13`, are necessary and sufficient, so the permitted optimum is five. A gain already paid as a mandatory base cannot be charged as a usable spoke coupon.

For C02 take K5 on `{0,1,2,4,5}` and add exactly the edges of triangles `013,036,167,678,189,{8,9,10},{1,10,11},{3,10,11}`. Let `P={013,124,025,167,189,{1,10,11}}`. The graph has 29 edges and 26 triangles. Its four star-side K4 families and one K5 family partition all triangles; a packing uses at most four plus two, and P attains six. All six owners have one private page. The mandatory bases are `03,14,05,67,89,{10,11}`, the six distinct mandatory gains are `16,25,24,18,{1,10},13`. Their union misses actual triangle `012`, so forcing all gains needs 13 edges; adding `01` attains it. Replacing gain `25` by `12` gives a permitted 12-cover. Six pairwise disjoint residual spoke clauses prove 12 is the support optimum. Thus `(nu,c(P),forced optimum)=(6,12,13)` by ordinary arguments. Unrestricted `tau=10` is a separate exact finite certificate, not needed by this proof.

Primary source: `problems/TUZA-20/notes/candidate02_counterexample.md`. The purported higher-level rotation or global gain-release availability theorem does not follow. Status: ordinary refutation, independently checked finite support in the original mission; no Lean claim.

### M21-private-witness / M21-book-construction

Let L be the graph of the sixteen even subsets of a five-element set, with adjacency when symmetric difference has size four, and let G be its cone with apex z. Then `|V(G)|=17`, `|E(G)|=56`, all forty triangles contain z, `nu(G)=8`, `tau(G)=11`, and for **every** minimum cover C the family of triangles meeting C in exactly one edge has packing number five. There are exactly sixteen minimum covers, each consisting of spokes outside one neighborhood `N_L(v)`.

Reconstruction: L is 5-regular and triangle-free; an independent set translated to include zero is an intersecting two-subset family plus zero, hence has size at most five, with equality exactly a neighborhood. An arbitrary cone cover is represented by `W subset V(L)` and cost `16-|W|+e(L[W])`. Equality eleven forces `L[W]` to be a matching plus isolates; choosing one endpoint of each matching edge gives an independent five-set, whose outside vertices each have at least two neighbors inside. Therefore W itself is that neighborhood. Full packing equals matching number eight in L; private packing equals the five-matching across the neighborhood cut. This refutes both universal- and existential-minimum-cover private-half-packing claims. It satisfies Tuza (`11<=16`). Primary: `problems/TUZA-21/PROOFS_AND_OBSTRUCTIONS.md`, §1.

The switched-four-cycle discriminator has a K4 on `x_0,...,x_3` and independent `a_i`, with `N(a_i)={x_(i-1),x_i,x_(i+1)}` modulo four. Prescribed owners are `x_(i-1)x_i a_i`, unique private pages `x_(i-1)x_(i+1)a_i`. It has nu four and permitted cover optimum eight. The specified book construction, with no later deletions, has possible costs 12, 10, 9 (zero, one, two compatible selected pages), so its best output is nine. The feasible two-page sets are adjacent-index pairs. It does not bound constructions permitting additional deletions. Primary: `problems/TUZA-21/review/book_verification.md`.

### M22-A / M23-one_edge_insertion: Lemma A

If B(H), `uv` is an old nonedge and adding it creates a triangle, then

`nu(H+uv)>=nu(H)+1`, and `tau(H+uv)+1<=2nu(H+uv)`.

The page's two spokes cannot belong to one old literal clique, since that clique would contain absent uv. Each old component can avoid its one relevant edge in a maximum packing; append the page. The cover bound follows by adding uv to a minimum H cover. Background and shared vertices are allowed. Ordinary source: `TUZA-22/notes/restoration.md`, §2. Formal declaration: `Tuza23.one_edge_insertion` in `Tuza23/GraphAPI.lean` (strict inequality conclusion). No hypothetical-counterexample premise is present.

### M22-R2 / M23-r2: all-size two-edge equality restoration

For every finite simple H with B(H), every set F of at most two distinct old nonedges, and `G=H+F`, equality `tau(G)=2nu(G)` implies B(G). If new triangles occur, equality requires two disjoint inserted edges; their endpoints form one new literal K4 whose old cross edges are background. All old triangle components survive and there are no other new triangles.

The decisive whole-family lemma is that, for a fixed old nonedge uv, the union of **all** page spokes meets each old literal clique support in at most one edge. If two spokes ux,uy were in a block, actual old triangle vxy would merge v into it, contradicting uv absent. This permits simultaneous minimum-cover choices covering every nonbare page. Tightness forces a bare page for each new edge. Every ordinary page must meet every bare opposite page or an `(m+2)` packing results. Adjacent new edges then have a single common-apex two-page family with a one-edge cover, contradiction. Disjoint new edges force a four-endpoint K4, and any supported old cross edge permits a one-edge cover overlap, contradiction. This fully accounts for arbitrary outside attachments.

Primary ordinary source: `TUZA-22/notes/r2_proof_v1.md`. Formal declaration: `Tuza23.r2`, exact type in `TUZA-23/THEOREM_LEDGER.json`, source `Tuza23/R2.lean`. **The formal R2 export is equality restoration; do not describe it as the full R3 inequality/equality theorem.** The at-most-two-edge inequality is an elementary ordinary deduction; no formal claim for that additional wrapper is made here.

### M22-R1 / M22-R3_full_CS: triangle and three-edge restoration

R1: if a,b,c are pairwise nonadjacent in B(H), completing `T=abc` yields CS. Under equality the complete new triangle family is exactly the four faces of one new K4 `abcx`, with all three old spokes background. The initial R1 file advertises equality restoration; full CS uses the stronger-scope audit in the final R3 assembly.

R3: for B(H) and **any** F of at most three distinct nonedges, H+F satisfies CS. With new triangles and equality, either one background-supported K4 component is added or a three-spoke star promotes an old K4 to K5 with the fourth spoke background. No graph order, page count, degree, minimality, or finite-search premise appears.

Reconstruction of the crucial inequality step: let `m=nu(H)`. One new triangle appends, and adding F covers, so `nu>=m+1` and `tau<=2m+3`. Gain at least two is strict. In the remaining case, assume `nu=m+1` and `tau>=2m+2`. Each of the five complete restored-edge shapes (triangle, star, P4, P3+edge, matching) is handled with only those inequalities: packing contradictions give m+2; cover contradictions give <=2m+1. The surviving literal B case has tau exactly 2m+2. Thus a potential tau=2m+3 violation is excluded, not overlooked. In the disconnected cases an inactive restored edge reduces to two-edge insertion, whose cover bound supplies equality before applying R2.

Reviewed primary files: `three_edge_restoration_full_cs_v1.md`, `r1_proof_v1.md`, `three_star_edge_restoration_v1.md`, `three_path_edge_restoration_v1.md`, `three_disconnected_path_edge_restoration_v1.md`, `three_matching_edge_restoration_v1.md` under `TUZA-22/notes/`. All four nontriangle case proofs were read and reconstructed. Their old-block opposite-edge obstruction and actual-triangle merging arguments are consistent. Status: ordinary, not new Lean.

### M22-two_triangle_restoration

For B(H), if T,U are two three-edge triangles whose six edges are distinct old nonedges (their vertex sets may share one vertex), then `G=H+E(T)+E(U)` satisfies CS. This is a separate six-edge restoration theorem, not a corollary merely of R3.

The one-triangle page incidence graph has the three bases on one side and outside apices on the other. Each apex has degree one or three; pages pack exactly as a matching. The entire selected footprint in each old block is a star of at most two edges, yielding exact additivity `nu(H+T)=nu(H)+q_T`. The lower two-triangle packing branch uses q_T=q_U=1; the upper equality branch requires its own full case proof, retained in `TUZA-22/notes/two_triangle_restoration_v1.md`. The TUZA-26 exclusion of a tight double residual explicitly depends on that **full equality theorem**, not counting alone. Review depth here: one-triangle interface and composition reconstructed; detailed upper two-triangle case review inherited and must remain accessible.

### M23-minimal_cs_package: combined minimality M0

Fix a finite vertex type and G with `not CS(G)` and CS(H) for every strict edge-subgraph H<G on that same type. Then G has nonempty shared-edge-connected triangle support, every edge is supported, and, putting k=nu(G),

`tau(G)=2k`, and for every actual e, `nu(G-e)=k`, `tau(G-e)=2k-1`.

Proof: a failure has tau>=2nu, since B universally implies equality. Unsupported-edge removal and component decomposition contradict minimality. If edge deletion lowers packing, proper CS and edge reinsertion give tau<=2k-1. If it leaves a tight residual, proper CS gives B and Lemma A increases packing on reinsertion. Therefore each residual has unchanged packing and tau<=2k-1; one-edge cover accounting forces all displayed equalities. A hypothetical minimum combined failure is thus tight non-B, not a Tuza-violating graph whose existence has been proved.

The hereditary-class version is valid only after proving the class closed under the relevant same-vertex subgraphs. TUZA-24 proves this for forest covers. Formal `Tuza23.MinimalCS`, `Tuza23.minimal_cs_package`, `Tuza23.minimal_tight_critical`, and finite minimization are in `Tuza23/M0.lean`. This is a **formal deduction with explicit proper-subgraph assumptions**, not an unconditional existence theorem or unrestricted CS proof. Those assumptions are mathematical hypotheses, not project axioms.

### M24-forest_cover_anchor / M24-forest_cover_cs / M24-forest_cover_equality_k4

For every finite simple G admitting **some actual triangle-edge cover C whose selected-edge graph is acyclic**, G satisfies CS; equality holds exactly when every nonempty shared-edge triangle component has literal K4 support. C need not be minimum, spanning, connected or nonempty; background edges in C are allowed. There is no ambient degree, density or order bound.

For **each supplied** forest cover C, there exist a packing I and actual-edge cover D with

`C intersect support(I) subset D`, `|D|<=2|I|`.

I is existential, not prescribed and not asserted maximum. D may use any actual graph edges and need not be a subset of C or a minimum cover.

Fresh reconstruction of anchor: the pointed apex-forest lemma produces a matching M in a link L and a vertex cover Q of L-M with |Q|<=|M|, and with w in Q whenever M meets the distinguished vertex w. The forest alternating-reach partition (even-reachable U, odd-reachable A, unreached Z) gives the three cases: a neighbor of w in U; no such neighbor with Z nonempty; no such neighbor with Z empty. The middle case saves one cover vertex by the forest edge count after removing a perfect matching of Z. A leaf v of selected C yields a full link with L-w forest. Delete all v-spokes and matched rims, recurse, then append vM triangles and add M plus vQ to the cover. Every outside triangle on a removed rim is hit directly by that rim. The pointed condition preserves the only possible selected spoke vw in the anchor. This argument is all-size and does not assume CS.

For equality, the class is hereditary by restricting C to subgraph edges. A minimum class failure satisfies M0. A selected cover leaf yields an apex-forest link, whose perfect/nonperfect branches are excluded by the published full proofs. K5 has no forest cover: any bipartition of the selected forest on five clique vertices leaves three same-colored vertices, an uncovered triangle. The general B equality condition consequently reduces to K4 components.

Ordinary sources: `TUZA-22/notes/challenger_forest_anchored_cover_v1.md`, `forest_triangle_cover_cs_v1.md` and the two v2 apex-forest branch proofs. Formal definitions and exports: `Tuza24/ForestAPI.lean`, `ForestAnchor.lean`, `ForestCS.lean`, `ForestK4Equality.lean`; declarations `Tuza24.forest_cover_anchor`, `forest_cover_inequality`, `forest_cover_cs`, `forest_cover_equality`, `forest_cover_equality_k4`. The actual definitions use all graph triangles, actual graph edges and Mathlib `IsAcyclic`. Formal wrappers inspected here have no unproved matching/compatibility premise. Historical axiom audits report only propext, Classical.choice, Quot.sound; fresh independent rebuild/audit remains separate.

### M25-separator_core

If triangle-supported H is single-edge resilient and is a genuine union A∪B with vertex intersection {u,v} and sole common edge f=uv, then

`nu(H)=nu(A)+nu(B)`, `tau(H)=tau(A)+tau(B)-epsilon`, `delta(H)=delta(A)+delta(B)+epsilon`,

where epsilon=1 iff f belongs to some minimum cover of **both** sides. Both sides inherit single-edge resilience. Proof uses `nu(H-f)=nu(A-f)+nu(B-f)` and the two one-sided append inequalities; cover restrictions give the exact epsilon identity.

For a shared-edge-connected support, a two-vertex separator must contain the edge uv, and the two sides have connected supported triangle families. With defect one and proper-subgraph CS, either both sides are tight literal cliques, or one is tight and the other is resilient defect one with f ineligible on the active side. Peeling the tight side is a strict supported-edge descent. Background is retained separately for parent restoration. The terminal core is three-vertex-connected; no further configuration is thereby guaranteed. Primary: `TUZA-25/notes/residual_edge_separator_core.md`. Fully reconstructed.

### M25-critical_deletion / M25-matching_resilience

If every triangle of J lies in a literal K4, `delta(J)=2`, proper CS holds on the deleted graphs, and e is packing-critical, then `J-e` is single-edge resilient and defect one. Connected triangle support passes from J when explicitly assumed; every surviving supported edge stays triangular through a K4-e diamond. Every-triangle extension does not automatically pass.

Reconstruction: a tight one-edge residual would have a B component containing the K4-e diamond and hence the absent edge. A second critical deletion yields B. Every K4 containing either deleted edge must contain both; for adjacent deleted edges two different fourth vertices would create an old triangle merging the purported components. Thus all lost triangles lie in one K4, inconsistent with two packing units lost. Primary: `mixed_critical_edge_addendum_frozen.md`.

If J is K4-completed, `tau(J)=2nu(J)-3`, and a matching M of two edges has `nu(J-M)=nu(J)-2` and `tau(J-M)=tau(J)-2`, then J-M is single-edge resilient and defect one. A third critical edge would yield B after three deletions. For the matching and P3+edge shapes the lost triangles lie in at most two K4s; for P4, packing gain three is possible but a simultaneous old minimum cover plus the two outer edges saves a cover unit. **The P4 case must not be replaced by a false universal packing-gain<=2 claim.** The retained eight-vertex five-K4 counterexample verifies the distinction. Primary: `mixed_matching_deletion_resilience_frozen.md`. Fully reconstructed.

The named 210-nonedge interface and leaf reconstruction remain finite/scoped deductions. The matching reconstruction uses actual marked-boundary identity `tau(H)=2r+tau(K-F)`, not unmarked `2r+tau(K)`. Every deleted tight piece has a proved complete one-edge triangle boundary; arbitrary vertex sharing does not license a fresh-gluing assumption.

### M25-mixed_equivalences

For triangle-free N⊆E(G), mixed covers use A=E(G)\N, and mixed packings require their A-footprints to be disjoint. Capacity M=|A|+1 on N and capacity one on A exactly realizes these finite optima. Universal mixed inequality is equivalent to ordinary Tuza. Universal mixed inequality plus equality iff N is inactive and B(G) is equivalent to ordinary CS. These are **two different equivalences**; the stronger equality statement is not claimed equivalent to Tuza alone.

The forward inequality proof removes the A-support of any inclusion-maximal N-hit packing. The residual has no N-hit triangles, its ordinary Tuza bound pays the remaining cost, and |removed support|<=2|packing|. The equality proof needs the explicit final two-edge restoration lemma in the inactive-B residual branch. Primary: `TUZA-25/notes/mixed_frozen_theorems.md`. Fully reconstructed, with no new universal solution inferred.

### M26-minimum_Q: the second minimization is essential

Assume a minimum-edge **CS failure** G exists, with its archived M0/restoration consequences. For each actual triangle T, H=G-T has `(nu,tau)=(k-1,2k-3)`, connected resilient defect-one support and every-triangle extension. Strict restoration excludes the frozen twelve supports C12 for that support.

Now choose Q minimizing **supported-edge count** among all connected nonempty triangle-supported single-edge-resilient defect-one supports outside C12 that occur in proper edge-subgraphs of this fixed G. This is a nonempty finite collection. A strictly smaller connected/resilient/defect-one support inside G is named by this second minimization, **not** by proper CS. Proper CS classifies only defect zero. Q need not be an actual G-T and does not inherit a missing-triangle parent, every-triangle extension, or arbitrary original-parent properties. Conversely an actual G-T-U does not inherit Q-minimality, its degree bounds or its forbidden boundaries.

Sources: `TUZA-25/PROOF_CHAIN.md`, §§1–3; `TUZA-26/notes/eligibility_saturation_v1.md`. The separator descent makes Q three-vertex-connected. This second choice is an indispensable theorem hypothesis throughout subsequent descent.

### M26-minimum_Q_saturation / M26-single_deletion_defect_two

For the above Q every edge is minimum-cover eligible. Before ruling out blocker pairs, each blocker pair lies jointly in a minimum Q cover and leaves defect one. The proof first excludes a <=2-edge B residual by the archived exact classification (which lies in C12). An ineligible e gives a resilient defect-one Q-e, whose active component is smaller and named. Neutral insertion over one named active component plus tight blocks is impossible except completing K5-e to K5, which raises tau. This contradicts unchanged tau. No degree theorem or blocker-free conclusion is used circularly in this first step.

The five fragile three-edge shapes, tight-boundary exclusions and complete adjacent/disjoint named reconstruction then prove Q is two-edge resilient. This composition includes independently checked finite interfaces; it is not all Lean and not a wholly computation-free argument. The source composition audit records the acyclic order and terminal-domain completeness.

After that, every actual edge lies in at least two triangles. For each e,

`K=Q-e` has `(nu,tau)=(nu(Q),2nu(Q)-2)`, is itself supported, shared-edge connected, single-edge resilient, and has defect **two**.

Reconstruction: components of K have nonnegative defects summing to two. Two defect-one components would both be smaller named cores; neutral reinsertion can then only complete two K5-e components along their same absent pair, making the named double-K5, contradiction. A tight extra component cannot attach by a new page while packing is unchanged, by the whole-page footprint and one-edge avoidance. Finally every surviving edge retains a triangle because distinct graph edges share at most one triangle and Q codegree is at least two. **No defect-two support is named.** Primary: `TUZA-26/notes/single_deletion_connected_defect_two_v1.md`; this argument freshly reconstructed.

### M26-final_Q_profile

At the final accepted scope, the conditional minimum Q is outside C12, shared-edge and three-vertex connected, supported, all-edge cover eligible, two-edge packing resilient, minimum degree at least five, and every vertex link has vertex-cover number at least three. Every triangle T extends to a maximum Q packing, every triangle is wholly contained in some minimum Q cover, and `Q-T` has defect two and `(nu,tau)=(nu(Q)-1,2nu(Q)-4)`. It has some edge of triangle codegree at least three, **not necessarily an edge of codegree two**. These are necessary conditions on a hypothetical object, not existence or impossibility.

The degree-four link cases are exactly C4, diamond, K4 because link minimum degree is at least two; their individual reconstruction proofs must all be preserved. The arbitrary K2,t link exclusion has an optional hub edge and no upper bound on t. The triangle-defect-zero exclusion is a separate no-B lemma plus proper CS; elementary counting alone permits defects 0,1,2. The defect-one triangle-residual reconstruction uses its own complete 6672-presentation/130-certificate interface. No blanket finite-to-all-size inference is acceptable without its ordinary domain reduction.

The codegree theorem is an ordinary argument with explicit **Brooks and Tutte–Berge** inputs. When every supported primal edge has codegree exactly two, the actual-triangle dual is simple cubic, packing is independent set and covering is dual edge cover. Dual triangles force isolated K4 components; remaining components are triangle-free cubic. The reviewed Tutte–Berge estimate gives matching size >=7n/16, Brooks alpha>=n/3, and integer/small-order checks give defect at least two outside K4. Thus defect one cannot have all codegrees exactly two. This is not a computer census and not a theorem excluding mixed codegree distributions.

Review depth: global composition and the preceding central elementary proofs freshly checked; long terminal/degree-four cases use existing bound independent reviews and need fresh reproduction of their finite premises. Sources: final `PROOF_CHAIN.md`, `reviews/opening_composition_review.md`, `reviews/opening_exact_codegree_two_exclusion.md`, `reviews/root_exact_codegree_two_review.md` plus all primary notes cited by final STATUS_MATRIX rows.

### M26-actual_parent_double_residual_resilience / M26-actual_parent_defect_one_triple_extension

For the **actual minimum-CS parent** G and every specified pair of edge-disjoint actual triangles T,U, `R=G-T-U` has `nu(R)=k-2` and defect one or two. If defect one, R is single-edge resilient and every actual triangle of R extends to a maximum R packing. **Connectedness, C12 membership, two-edge resilience, minimum degree, and the existence of such a pair are not conclusions.**

Double-residual defect zero is excluded by the archived full two-triangle CS restoration theorem, not by counting. If a defect-one R had a critical e, proper CS yields B=R-e, and the actual single-residual resilience gives the exact `(2,2)` intermediate squares. A bare e-page rebases to an actual single residual with gains `(2,3)`. Its six cross-graph orbits are exhausted by the accepted paid/C12 reconstruction, so strict actual-parent restoration contradicts G. No minimum-Q fact is used.

Independently, if V fails to extend in defect-one R, cover accounting forces `B=R-V` tight; the complete new V-family is a bare K5-e. In the actual single residual G-T, the cases (U,V share one vertex; are disjoint with zero/one peripheral vertex; are disjoint with two peripheral vertices) are paid or produce C12 stars 5,45,55. Strict restoration again applies to that actual single residual. This proof does not depend on the newly proved resilience of R. Thus failure of a specified triple to extend requires **all three** corresponding double residuals to have defect two.

Primary composition sources: `notes/actual_parent_double_residual_resilience_v1.md`, `notes/actual_parent_defect_one_triple_extension_v1.md`. Accounting, quantifiers and independence of the two compositions were freshly checked; the extensive six-orbit/page-classification components retain their existing independent bound reviews.

### M26-actual_parent_selected_triangle_dichotomy: authoritative v2

Choose T maximizing supported-edge count of G-T over **all** actual triangles. Then choose U maximizing supported-edge count of `(G-T)-U` over **all** triangles of the fixed first residual. Both finite maximizations are unconditional; no all-pair or all-partner defect assumption is needed.

The local lemma needs only the **selected** triangle to be wholly in a minimum cover. If an ordinary restored page has two background spokes, exchanging the deleted central triangle with that page preserves every old residual triangle. Any new triangle increases support; if there is none, replacing two edges of the selected whole-triangle minimum cover by the opposite spoke saves one edge. Either contradicts maximality/minimality.

T has the required cover property by the actual single-residual profile. For selected R=G-T-U, either:

- defect one: R has parameters `(k-2,2k-5)`, is resilient and triangle-extendable;
- defect two: R has `(k-2,2k-6)`, so adding E(U) to a minimum R cover is a minimum first-residual cover containing selected U; the local lemma gives the second no-bare-page conclusion.

The defect-one branch does not get a second bare-page claim; the defect-two branch does not get resilience or naming. Neither gives a contradiction, a useful third residual, a tight triple residual or a failed triple containing the selections. The v1 all-partner hypothesis is superseded as unnecessarily strong, not as a false theorem. Primary: `notes/actual_parent_selected_triangle_dichotomy_v2.md`; complete proof freshly reconstructed.

### M26-actual_parent_cycle_complete and remaining triple frontier

Conditional on an actual failed triple whose triple residual is tight B, the accepted double-residual extension theorem makes its three double residuals defect two. This does not require a global all-pair hypothesis. Vertex-disjoint restored pairs are paid; the entire distinct-pairwise-intersection (cyclic) pattern is paid including the one-exceptional-family case. What may remain is a common-center pattern with mixed A/B or one-exceptional families, as well as other triple-residual numerical profiles. The existence, tightness and containment of the selected pair in such a triple are not proved. Pairwise cover coeligibility has no automatic Helly consequence; K9 is a cover-side countercontrol that does not satisfy tight-parent hypotheses.

Review depth: final composition/scope checked against all final evidence pointers; individual cyclic case proofs are inherited independent ordinary reviews, not re-enumerated or Lean-checked by this reviewer.

## Required corrections and publication safeguards

1. **R1 scope reference:** attach its full-CS assertion to the R3 stronger-scope audit. The initial R1 equality-only statement is historical and should not alone be cited for the inequality.
2. **R2 vs R3 formal scope:** R2 is all-size equality restoration; R3 full-CS is ordinary. M0 has explicit proper-subgraph CS hypotheses. Forest proofs are all-size with standard foundational axioms only in historical formal receipts.
3. **Candidate headers:** many accepted frozen proof files still say candidate/review pending. Preserve their scientific bytes but provide an authoritative adjacent status/correction map to their later acceptance reviews. Conversely historical assertions of remaining gaps that later closed need explicit supersession pointers, not silent deletion.
4. **Actual residual vs Q:** retain two separate symbols/universes in every theorem. Minimum Q has the final degree-five profile; actual double residual R has only the stated conditional resilience/extension. Do not merge them by prose.
5. **Defect-zero exclusions:** in both Q triangle and parent double-triangle accounting, name the extra no-B/restoration lemma. Counting alone does not eliminate defect zero.
6. **Four-branch replacement:** The final ordinary four-branch theorem proves that every nonempty closed link in a minimum counterexample to combined CS has at least five branch vertices. It supersedes the historical 363/5375 finite premises for this minimum-CS closed-link exclusion and its heavy-core consequences. It does not replace the separate universal WKE or constructive signed-defect survivor theorem for arbitrary links with at most four branch vertices; that route retains the 5375-state finite certificate and its declared inputs. The separate one-cycle-cover CS theorem still uses finite interfaces 2018/2422/8220. Do not remove these by analogy.
7. **Codegree and availability:** some codegree>=3 is proved; existence of a codegree-two edge is not. Conditional strip/cap/release/switch payments need their supplied interface; failure to find one is not a theorem of nonexistence.
8. **Finite boundaries:** source claims include 210 named insertions, 4289 neighborhoods/12605 pair presentations/343 retained pair candidates, and 6672 triangle presentations/130 certificates. Preserve ordinary domain reductions and literal certificates, not counts alone. Solver UNKNOWN and reported historical censuses remain unchanged in status. No new unknown defect-one core was reached in the TUZA-25/26 searches.
9. **Mixed equivalences and rigidity ambiguity:** inequality is equivalent to Tuza; combined inequality/equality is equivalent to CS. Define R12 precisely as universal classification of connected resilient defect-one support by the twelve frozen models; R12 is sufficient for CS by the proved actual-single-residual extraction and strict C12 restoration. TUZA-25’s frozen R-F allows triangle and K4 overlaps and explicitly leaves its restoration bridge incomplete. No R-F-to-CS implication is established. TUZA-26 PROOF_CHAIN.md line47 uses the undefined shorthand “global R” in a sufficiency claim; publication must resolve that shorthand to R12 and must not read it as the broader frozen R-F. See rigidity_scope_correction.md for exact source pointers and proof.
10. **Attribution:** external matching/colouring inputs (including Brooks, Tutte–Berge, and explicitly invoked bipartite matching-cover equality) remain attributed. No new priority claim follows from this audit. Independent AI review is not external specialist peer review.

## Release status

No material error requiring exclusion was found in the central reconstructed statements. This finding does not certify the not-yet-frozen public archive, assert fresh Lean/certificate reproduction, or approve a not-yet-written synthesis. The source-complete ledger is a starting audit artifact, not a substitute for exact theorem prose and full proofs in the paper. Unrestricted Tuza and universal CS remain unresolved; the owner has paused the research series. The exact open step remains an **available** paid operation or contradiction for the final minimum-Q class, or closure of the actual-parent selected-residual/triple frontier.
