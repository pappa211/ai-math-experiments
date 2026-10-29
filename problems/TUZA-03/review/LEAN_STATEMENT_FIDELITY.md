> Final accepted scope: full A, full B, and D1/D2 pass statement fidelity review. Earlier checkpoint entries are retained as historical audit evidence; the concluding supplements record completed scope. The current declaration table is in LEAN_VERIFICATION.md.

# Independent Lean statement-fidelity review

Reviewer role: fresh mathematical adversarial reviewer, separate from the implementers. Date: 29 October 2026. Reviewed code is bound by `audit/LEAN_STATEMENT_FIDELITY_HASHES.json`; later edits require a supplemental review. This is a source/type/meaning review, not a claim of an independent clean build. Build reproduction and transitive-axiom logging are recorded separately by the mission.

## Verdict on the closed-boundary development

**Pass.** The reviewed `Tuza.closed_boundary_stability` states the full general companion stability criterion, with no project-specific proof obligation hidden in an extra assumption. Its graph model and lost-triangle family are faithful. The elementary face and simultaneous-selection theorems are proved. The only external inputs of the stability theorem are the frozen `AharoniInput` and `HNSInput` from TUZA-01.

Reviewed Boundary hash:

    805b80d77b1e70da637816dc0211b31a84b9dc23747f00821c35e117251b2621

The displayed type and axiom output in `logs/boundary-build-04.log` match the reviewed source. The three audited declarations `closed_boundary_face`, `closed_boundary_faces`, and `closed_boundary_stability` report only `propext`, `Classical.choice`, and `Quot.sound`. This does not discharge the explicit Aharoni/HNS parameters, and it should never be described as doing so.

### Graph and optimization model

- `triangles G` is exactly `G.cliqueFinset 3`, with membership equivalent to `G.IsNClique 3 t`. It contains all actual triangles of a finite `SimpleGraph`, not a supplied selected subfamily.
- `edges t` is its finite set of two-element vertex subsets. Equality of graph edges is unordered equality, so reversed endpoints cannot evade disjointness.
- `Packing F P` means P is a subset of F and distinct triangles have disjoint edge sets. `nu F` is the actual finite maximum cardinality over those packings.
- `Covers F C` requires every triangle to contain a selected two-element edge. `tau F` is the actual minimum cardinality. Although C is typed as arbitrary vertex subsets, useless/nonedges can be removed, and `graph_min_cover` proves attainment by actual graph edges. This introduces no mathematical weakening.
- `TriangleTripartite H` is a coloring of graph edges with three labels injective on every actual triangle. It faithfully expresses 3-partiteness of the full triangle hypergraph. It is not graph-vertex 3-colorability.
- `deleteEdges G A` retains exactly those G-adjacencies whose unordered vertex pair is absent from A.

### Exact boundary hypotheses

`ClosedBoundary H U P A` contains precisely:

1. Disjoint U and P.
2. Independence of U in H.
3. Independence of P in H.
4. Every A element is an actual H-edge joining U to P.
5. For p in P and x outside U union P with the **actual H-adjacency** p-x, any two common H-neighbors u,t in U are equal.

There is no bound on A, U, P, graph order, or packing number. The uniqueness condition is not strengthened to all outside vertices or to nonedges p-x. No induced-boundary assumption is added.

### Elementary face-selection theorem

`closed_boundary_face` takes an actual K4 in any intermediate J with J <= H-A. It returns a J-triangle face disjoint in graph edges from every member of

    triangles H \ triangles (deleteEdges H A).

The flexibility J <= H-A is crucial: J may additionally delete the allegedly essential edge g, but the lost family remains the original full H-minus-(H-A) family. There is no filter excluding triangles using g.

The proof reconstructs each lost triangle as u-p-x with u in U, p in P and x outside the boundary. When the K4 meets U, it removes that U vertex; any possible shared remaining edge is p-x and the actual-edge uniqueness forces a deleted edge to survive, contradiction. When the block avoids U, a face avoiding P avoids both boundary sides. These are valid exhaustive cases. The implementation does not assume compatible faces exist.

`closed_boundary_faces` proves simultaneous selection from pairwise edge-disjoint actual K4 blocks. It proves injectivity of the chosen-face map using nonempty triangle edge sets and disjoint block supports, so the packing cardinality equals the number of blocks. It proves compatibility against every original lost triangle, uniformly, before any lost packing is chosen. It does not assume equality exhaustion; only actual blocks and their disjoint supports are needed.

### General stability declaration

For K=H-A, the final declaration takes:

    tau(triangles K)+1 = 2*nu(triangles K),
    nu(triangles K)+d = nu(triangles H),
    d+2 <= nu(triangles H \ triangles K).

These are faithful natural-number forms of K being slack one, packing loss d, and the full lost family containing a packing of size at least d+2. The additive equations avoid truncated subtraction mistakes. The theorem does **not** require tau(H)=2nu(H)-1; the ordinary general criterion also does not require it.

The conclusion `PackingEdgeStable K` quantifies over every actual K-edge a-b and asserts that deleting exactly its singleton unordered pair leaves nu unchanged. It is precisely the ordinary packing-edge-stability property, not a weaker condition on selected edges.

The proof assumes a decrease at one actual K-edge, obtains exact loss one and equality of J=K-g by Aharoni and one-edge cover loss, obtains nu(J) pairwise edge-disjoint K4s from the frozen HNS extraction input, invokes the proved simultaneous face theorem, and augments with the complete lost family. The cardinal inequality contradicts nu(H). No cone integrality, König theorem, equality exhaustion, or new stability premise is assumed.

### Sharper dependency observation

Both the ordinary D1 equality-deletion argument and D2 stability argument need only the maximum-number K4 **extraction** part of the graphical HNS input. Exhaustion is not needed: packing upper bounds use nu(K) by definition. Earlier ordinary audit wording referring to “extraction/exhaustion” was conservative; the Lean D2 correctly exposes the smaller boundary. The mixed-bowtie argument does need exhaustion.

## Current equality/restoration files

These statements are reviewed at the hashes in the companion JSON. The code may continue growing, so the boundaries below describe the inspected version only.

### `Tuza.maximum_k4_exhaustion`

**Pass.** In an actual finite graph, a set K of pairwise edge-disjoint actual K4s whose cardinality equals the graph's triangle packing number exhausts all graph triangles: every triangle is a vertex subset of one block. There is no tripartiteness or equality premise because the conclusion is a purely elementary deduction from these extracted witnesses. The proof chooses a face avoiding any alleged external triangle in each block and appends it, contradicting maximality. This new project-specific deduction is proved, not moved into HNSInput.

`Tuza.equality_k4_exhaustion` faithfully combines the frozen HNS input with that deduction. Its sole external parameter is HNSInput, whose frozen definition includes published home-base extraction and the preexisting graphical loose-cycle-to-K4 conversion. The conversion itself remains outside this project's Lean proof boundary; exhaustion is now inside.

### `Tuza.equality_restoration_packing_separation`

**Pass.** The conclusion concerns the full triangle difference after restoring a vertex triple, and constructs separation from a maximum old packing using actual K4 faces avoiding the triple. Its type does not require the triple to be a triangle because the statement is true more generally for deletion of all edges internal to that vertex subset whenever the equality premise holds. This is a legitimate stronger supporting lemma, not a weakening of a final theorem.

### `Tuza.equality_individual_family_nu_one`

**Pass.** It assumes two actual edge-disjoint triangles, the full doubly deleted remainder is tripartite equality, and total packing gain is less than three. It concludes that the complete first individual new family has packing number one. The other triangle survives the first deletion by explicit edge-disjointness. There is no replacement of the full jointly restored family by the union of individual families.

### `Tuza.two_triangle_equality_vertex_disjoint`

**Pass for the stated strict subcase.** It assumes **vertex-disjoint** restored triangles, not merely edge-disjoint ones. The proof explicitly establishes that every G-triangle survives one of the two deletions; vertex-disjointness justifies the absence of mixed triangles. It then handles a packing gain of at least three or bounds both individual families by two-cover arguments when the gain is smaller.

This declaration must not be advertised as the complete two-triangle exact-equality theorem for edge-disjoint triangles. Bowties are still outside this reviewed final declaration. The name and source documentation currently communicate that limitation correctly. There is no Aharoni parameter in this declaration: the exact-equality premise and HNS input suffice for this proved subcase.

### `Essential.lean` supporting lemmas

The inspected file contains no final essential-edge restoration theorem. Its supporting declarations are faithful:

- `essential_deletion_equality` derives equality after an essential singleton-edge deletion in a slack-one tripartite graph using Aharoni.
- `essential_opposite_cover` proves that an opposite edge pair covers every triangle face of a four-set.
- `essential_lost_page` reconstructs all triangles lost on deleting one edge as pages over it.
- `essential_not_both_endpoints` rules out both missing-edge endpoints in a retained K4.
- `essential_spoke_identity` identifies the possible shared spoke of a page and a block missing one endpoint.
- `essential_block_same` identifies pairwise edge-disjoint blocks sharing an edge.
- `essential_same_page_at_endpoint` uses an explicitly supplied exhaustive block system to prove that one block cannot touch two distinct pages at the same endpoint.

The last lemma's exhaustion premise is a natural local structural lemma premise, and `equality_k4_exhaustion` supplies it in the intended equality setting. It must not be turned into an opaque final-theorem assumption replacing the essential-edge argument. No final free-page existence, family classification, Hall assignment, or compatible packing construction has been inspected as completed in this version.

## Proposed classical König input for D1

The proposed input is **acceptable in principle** as a narrowly scoped published theorem, separate from the new project deductions. A suitable exact formulation is:

For a finite type W, disjoint finite subsets L,R of W, and a finite family F of unordered pairs each equal to {l,r} for some l in L and r in R, there exist a finite endpoint vertex cover C and a finite matching M subset F, with the members of M pairwise disjoint as subsets of W, such that |C|=|M|. The cover property is that every edge in F meets C. Prefer also C subset L union R, or its incidence support; that is the standard finite bipartite theorem and keeps the type narrow.

This is a direct existential form of finite bipartite matching/vertex-cover duality, not a new triangle-family integrality theorem. At W=Finset V it is still the same classical theorem, applied to a finite auxiliary graph whose vertices happen to represent original graph edges. It should appear as an explicit parameter such as `BipartiteKonigInput (W := Finset V)`, with documentation and source attribution. Listing only foundational axioms in the eventual theorem does not discharge this parameter.

### Conversion obligations that must be proved

For lost triangles u-p-x, map each to the auxiliary edge

    {{u,p},{u,x}},

whose auxiliary vertices are old spokes. The following are new elementary deductions and must be implemented, not assumed in the König parameter:

1. The left (deleted U-P spokes) and right (U-outside spokes) auxiliary vertex classes are disjoint; every auxiliary edge has one endpoint in each.
2. Every auxiliary edge represents an actual original lost triangle. The map from lost triangles to auxiliary edges is injective, or an explicit inverse provides the exact cardinal correspondence needed.
3. An auxiliary vertex cover becomes an original edge cover of the full lost triangle family. Each selected spoke is an actual original triangle edge.
4. An auxiliary matching becomes an original triangle packing. Sharing a spoke is already excluded by matching. Sharing a rim edge p-x must also be excluded: across distinct U rows it violates the actual-edge uniqueness at p-x; within one row it identifies the same triangle. This is the key structural obligation that would be missed by assuming only matching of spoke pairs.
5. Resulting packing/cover cardinalities are proved. A bare graph homomorphism does not justify equality of cardinalities.
6. The final D1 slack accounting and essential-edge extraction are proved from these constructions and the previously checked compatible faces.

A global auxiliary graph can encode all U rows together, avoiding separate additivity proofs, provided item 4 is proved. There is no need to assume project-specific cone integrality. For the D1 conclusion it is enough to obtain tau(L)<=nu(L); the reverse inequality is standard but need not be developed merely to state an equality if the final proof does not use it.

## Publication boundary

At this reviewed snapshot, the new completed boundary result is the full D2 criterion and its proved face constructions. The equality extraction-to-exhaustion deduction and vertex-disjoint exact-equality restoration subcase are also faithful completed declarations, subject to their recorded external parameters and actual successful builds. D1, the edge-disjoint bowtie portion of exact-equality restoration, and essential-edge restoration are not established merely by the inspected partial files. Later completed declarations require a supplemental independent statement review and fresh build/axiom reports.

## Supplemental final review: complete D1 and stable loss bound

This section supersedes the earlier statement that D1 was not completed in the inspected code. `lean/Tuza/BoundaryIntegral.lean` has now been independently read in full. Its exact reviewed hash and review time are in the `supplemental_reviews` section of `audit/LEAN_STATEMENT_FIDELITY_HASHES.json`. The final types and axiom reports were cross-checked against `logs/boundary-integral-05.log`.

**Verdict: pass.** The complete unbounded closed-boundary equality-deletion theorem and the stable packing-loss corollary are faithfully formalized, conditional on exactly the recorded Aharoni, frozen graphical HNS, and classical finite bipartite König inputs. All new elementary boundary-to-bipartite conversions, simultaneous compatibility, cardinal arguments, and essential-edge deductions are proved in Lean.

### Actual König input

`BipartiteKonigInput W` quantifies over a finite edge family F of finite subsets of W, disjoint finite vertex classes L,R, and a proof that every F edge is exactly {l,r} with l in L and r in R. It returns a matching M subset F whose distinct edges are disjoint as W-vertex sets, and a vertex cover C meeting every F edge, with C.card=M.card.

This is precisely the standard existential form of finite bipartite König duality. Disjoint L,R force l and r to differ, so every edge has two vertices and the Finset model permits no parallel edges. The finite family itself defines the whole auxiliary graph; there is no restriction to an unexplained selection from another auxiliary graph. The returned cover is not explicitly required to be inside L union R, but this does not strengthen the external theorem or weaken the project result: ordinary König supplies such a cover, and the proof uses only its coverage and cardinality. No triangle, closed-boundary, face-compatibility, integrality, or stability conclusion is hidden inside this input.

The parameter is explicitly instantiated at W=Finset V, so auxiliary vertices are unordered original graph-vertex subsets representing original edges. This is a classical theorem instance, not a custom axiom declaration. It remains an assumed published input; it was not discharged by the reported foundational-axiom list.

### Conversion and injectivity

`terminalSpokes U t` filters the actual two-element edges of t for those meeting U. `closed_lost_spokes` proves, for every member of the full original lost family, its representation t={u,p,x} with u in U, p in P, x outside U union P, and

    terminalSpokes U t = {{u,p},{u,x}},
    {u,p} in A, {u,x} not in A, H.Adj p x.

All of these follow from the original boundary hypotheses. In particular, the right-spoke exclusion from A is proved from the actual U-P description of deleted edges.

`closed_spokes_recover` proves that unioning the vertex sets in the auxiliary edge recovers t exactly. `closed_spokes_injective` derives injectivity on the full lost family from this recovery identity. No cardinal correspondence is assumed.

`closed_lost_cover_le_packing` uses auxiliary parts A and its complement in the finite ambient type Finset V. This is legitimate: every auxiliary edge has one deleted spoke in A and one retained U-outside spoke in its complement, with the two sides disjoint. The complement includes unused vertices, which do not change the edge family or invalidate König.

The inverse matching image is defined explicitly as the lost triangles whose terminal-spoke pair belongs to M. Its image is proved equal to M; injectivity proves its cardinality equals M.card. A cover C of auxiliary pairs is proved to cover the original triangle family because every selected auxiliary endpoint lying in a pair is an actual edge of its original triangle.

### The shared-rim issue is closed, not assumed

`closed_spokes_disjoint` proves that disjoint spoke pairs imply disjoint full triangle edge sets. If a common original edge meets U, it belongs to both terminal-spoke pairs, immediately contradicting disjointness. Otherwise the edge is proved to be each triangle's rim, say {p,x}={q,y}. Independence-side membership and outside membership force p=q and x=y. Both terminals are common U-neighbors of the actual original H-edge p-x. The precise `ClosedBoundary.unique` hypothesis therefore forces those terminals equal, producing a common deleted spoke and again contradicting auxiliary disjointness.

Thus auxiliary matching is converted to an original **edge-disjoint triangle packing**, not merely a packing disjoint on selected spokes. This was the main potential modeling gap, and the implementation proves the required structural fact.

The resulting theorem `Tuza.closed_lost_cover_le_packing` has only the König parameter and the original closed-boundary structure. It proves tau(L)<=nu(L) for the full lost family L. No slack, tripartiteness, HNS, or packing-number bound is unnecessarily assumed here.

### Full equality-deletion theorem

`Tuza.closed_boundary_equality_deletion` takes exactly:

- AharoniInput on the actual original vertex type;
- frozen HNSInput on that type;
- BipartiteKonigInput on Finset V;
- tripartiteness of the full H triangle family;
- the previously audited ClosedBoundary H U P A;
- tau(H)+1=2nu(H);
- tau(H-A)=2nu(H-A).

It concludes `HasPackingEssentialEdge H`, which is defined by existence of actual vertices a,b satisfying H.Adj a b and

    nu(H-{ab})+1 = nu(H).

The conclusion is therefore an actual graph-edge essentiality assertion, not a selected-family or abstract-edge conclusion. The proof derives packing loss one, lost-family packing one, and a singleton minimum lost-family cover. It proves that this cover's unique edge is an actual H-edge, and that deleting it removes every lost triangle. Aharoni plus cover loss then gives the exact essential packing drop. None of these is supplied as an additional hypothesis.

The graph is finite but its order, h, |A|, and the boundary sizes are unbounded. The implementation still uses only K4 extraction, not exhaustion, from the frozen HNS input.

### Stable loss bound

`Tuza.closed_boundary_packing_loss` has the same external inputs and original slack-one/boundary hypotheses, plus `PackingEdgeStable H`. It concludes

    nu(H) <= nu(H-A) + A.card / 2.

Natural-number division by 2 is floor division; this is exactly the advertised loss bound h-floor(|A|/2)<=nu(H-A), expressed additively without subtraction truncation. It first rules out equality in H-A using the proved D1 conclusion and stability, then combines strict Aharoni with cover loss. No bound on A is added.

### Checked axiom/type boundary

The recorded successful build prints the exact final declaration types and reports only `propext`, `Classical.choice`, and `Quot.sound` for `closed_lost_cover_le_packing`, `closed_boundary_equality_deletion`, and `closed_boundary_packing_loss`. The narrow external hypotheses remain visible theorem parameters. This source review finds no statement weakening, hidden project-specific assumption, omitted actual-edge restriction, or selected-family substitution.

The updated publication boundary is therefore: **full D1 equality deletion, its floor packing-loss corollary, and full D2 stability are now faithful completed conditional Lean deductions**, subject to independent clean reproduction and final source-hash confirmation. The rest of the earlier restoration review remains current until a separate supplemental review of later restoration declarations.

## Supplemental review: completed free-page theorem and intersecting-family structure

The later `Essential.lean` and `IntersectingStructure.lean` sources have now been independently read in full, with hashes recorded in the companion JSON. The `essential_free_page` axiom output in `logs/essential-10.log` lists only the standard three foundational axioms. This section supersedes the earlier observation that only the first essential-edge support lemmas had been inspected; it does **not** claim completion of the full essential-edge restoration theorem.

### `Tuza.essential_free_page`

**Pass.** The theorem assumes an actual H-edge x-y, tripartiteness of the full H triangle hypergraph, tau(H)+1=2nu(H), and nu(H-xy)+1=nu(H), with only the frozen AharoniInput and HNSInput parameters. It constructs a maximum-cardinality family K of pairwise edge-disjoint actual K4s in H-xy, proves that every triangle of H-xy belongs to some K block, and constructs an actual H-triangle Q containing xy whose entire edge set is disjoint from the edge set of **every** block.

The proof establishes equality after essential deletion, obtains the blocks, and invokes the newly proved `maximum_k4_exhaustion`. It proves that one block can touch at most one spoke across the entire lost page family: two distinct same-endpoint spokes would create a triangle at the missing other endpoint whose block shares an edge with the first, forcing that forbidden endpoint into the first block. The oriented versions are combined using the fact that a retained block cannot contain both missing-edge endpoints.

For each block it constructs an opposite-pair cover that includes its unique touched page edge, if any, and therefore covers every page touching that block. If all lost pages touched blocks, the union of these covers would cover all of H in at most 2|K| edges, contradicting slack one and essentiality. Hence a wholly free page exists. Block covers, their union, and the cardinal bound are all proved, not supplied as hypotheses. The conclusion is the precise strong free-page property needed by the ordinary B proof.

This is a substantive completed structural deduction. It is **not** yet a theorem restoring two triangles: its statement has no restored triangles, and it does not formalize the later family classification, Hall assignment, or final compatible packing construction. Publication must label it as the free-page component of essential-edge restoration.

### `Tuza.intersecting_k4_structure`

**Pass.** This supporting theorem takes a finite family F of actual G-triangles, nu(F)=1 and tau(F)>1. It constructs one actual G-K4 containing every F triangle. Allowing a selected family here is correct: this is explicitly a structural lemma for arbitrary triangle families, not a final statement about the full graph. Its two extremal parameters are still the actual defined maxima/minima of F.

The proof selects two distinct intersecting triangles and a third triangle avoiding their common edge, justified by tau(F)>1. It proves that all members lie in their four-vertex union and checks all six actual G-adjacencies. It does not infer an actual K4 merely from a hypergraph pattern without verifying graph edges.

### `Tuza.intersecting_prescribed_cover`

**Pass.** For an intersecting family of actual graph triangles, a chosen member U, and any graph edge e of U, the theorem constructs a cover of the whole family of size at most two containing e. If the family has a one-cover, insert e; otherwise use the structural K4 and e with its opposite edge. These cases implement exactly the ordinary prescribed-base-edge cover argument. No external mathematical input is assumed for these new structural results.

## Supplemental final review: full exact-equality two-triangle restoration

The completed `lean/Tuza/BowtieEquality.lean` has now been independently read, including all supporting bowtie lemmas and the final reduction from arbitrary edge-disjoint triangle pairs. Its reviewed hash is recorded in the companion JSON. The final type and standard-three-axiom output were cross-checked against `logs/bowtie-equality-build-04.log`.

**Verdict: pass for the complete A statement.** This supersedes the earlier restriction of the completed formal A boundary to vertex-disjoint triangles. `Tuza.two_triangle_exact_equality` now assumes exactly two actual G-triangles whose graph-edge sets are disjoint, tripartiteness of the full doubly deleted triangle family, and exact equality tau(H)=2nu(H). It concludes tau(G)<=2nu(G). The sole explicit external parameter is the frozen HNSInput. No Aharoni hypothesis is needed in this exact-equality theorem. There is no vertex-disjointness, no-mixed-triangle, prescribed-apex, packing-number, or graph-order restriction in the final declaration.

### Complete case reduction

`edge_disjoint_triangle_vertex_cases` proves from the two cardinal-three vertex sets and edge disjointness that either the vertex sets are disjoint or they are a genuine five-distinct-vertex bowtie. A shared pair of vertices would be a shared graph edge, which is excluded. Thus the final theorem's two branches are exhaustive and do not silently discard overlaps.

The vertex-disjoint branch uses the previously reviewed theorem. The bowtie branch restores vab and vcd with all five vertices distinct. If packing gain is at least three, the six-edge cover bound settles the result. Otherwise the previously proved equality packing-separation lemma makes each complete **individual** restoration family have packing number one.

### Mixed triangles are explicitly handled

`bowtie_mixed_triple` proves that any three-set meeting both restored edge sets is exactly one of vac,vad,vbc,vbd. Its proof uses the actual edge-set memberships and cardinality; this is not an assumed classification of a selected family.

`new_cover_of_individuals_and_mixed` explicitly splits every member of the full G-minus-H triangle family into the two individual families or the family absent from both intermediate graphs. Thus the final cover is verified against the complete jointly restored family.

`bowtie_column_exclusion` proves that when the first individual family is intersecting but needs more than one cover edge, both ac and bc cannot be present. The newly proved actual-K4 structure theorem puts all first-family triangles in one actual K4 of G with the second restored triangle still deleted. The hypothetical abc triangle and base vab would put v,c in that K4, contradicting deleted vc. This is a genuine graph argument and uses no additional apex hypothesis.

`bowtie_new_cover_first_nontrivial` prescribes vd in a two-edge cover of the second intersecting family. If ac is present, column exclusion forbids bc, so prescribing va in the first cover handles every remaining c-mixed triangle; if ac is absent, prescribe vb. All d-mixed triangles are hit by vd. The code checks every mixed triple. If both families have one-edge covers, `bowtie_new_cover` takes their union with va,vb, covering all mixed triangles within four edges. If only the second family is nontrivial, it exchanges the two restored triangles and proves the deletion-order equality explicitly.

The resulting `bowtie_new_cover` proves a four-edge cover of the **full** new family whenever both complete individual families have packing one. It does not assume the mixed cross graph is a matching in a case where only one family's structure has been proved. The final arithmetic adds an old equality cover and uses the automatic packing gain of two.

### Dependencies and publication meaning

New K4 intersecting-family structure, prescribed-edge covers, mixed-triple classification, cross-column exclusion, four-edge full-family coverage, deletion commutation, and exhaustive overlap cases are all proved. No new project-specific assumption is introduced. The axiom reports for `bowtie_new_cover`, `two_triangle_equality_bowtie`, and `two_triangle_exact_equality` contain only `propext`, `Classical.choice`, and `Quot.sound`; HNSInput remains an explicit undischarged theorem parameter, including the frozen graphical extraction interface.

The formal publication boundary now includes **the full arbitrary edge-disjoint exact-equality restoration theorem**, not merely a special case. The distinct mixed/shared-apex slack-one theorem of manuscript Section 6 remains ordinary-only; the word “bowtie” in both developments must not blur those different hypotheses and results.

## Supplemental final review: complete essential-edge restoration B

The completed `EssentialRestoration.lean` and all of its new dependencies (`Essential.lean`, `EssentialPages.lean`, `EssentialFourPages.lean`, and the already reviewed equality/bowtie helpers) have now been independently read. Exact hashes are recorded in the companion JSON. Forcing lemmas are contained in `EssentialRestoration.lean`; there is no separate `EssentialForcing.lean` file in the inspected development.

**Verdict: pass for the full B statement and its strong critical-case family-saving conclusion.** This supersedes the previous formal boundary limiting B to the free-page theorem. The full theorem is no longer partial in the inspected source. Final full-project clean reproduction remains separately required; the independent clean A+D run intentionally excluded these later modules.

### Exact final statement

`Tuza.two_triangle_essential_edge_restoration` assumes:

- An actual finite simple graph G.
- Two actual G-triangles U,W with disjoint graph-edge sets; they may share one graph vertex.
- An actual edge x-y of the doubly deleted remainder H.
- Tripartiteness of the full H triangle hypergraph.
- Exact essentiality, nu(H-xy)+1=nu(H).
- The frozen AharoniInput and HNSInput, and no further mathematical input parameter.

It concludes tau(G)<=2nu(G), for the full graph G. There is no additional slack-one, no-mixed, apex-family, graph-order, packing-number, or compatibility assumption. Its proof derives tau(H)+1<=2nu(H) from essentiality, Aharoni on H-xy, and one-edge cover loss. Slack at least two and large total packing gain are settled directly; only the genuine critical branch invokes the proved family-saving theorem.

`Tuza.two_triangle_essential_family_saving` assumes the same graph/restoration/essential-edge setting plus slack one in H and nu(G)<=nu(H)+2. It proves that one of the two complete **individual** new families has an edge cover of size at most two. The packing inequality is equivalent to minimal gain here because the two original restored triangles always append to an old maximum packing. This is the correct stronger scoped result, not an assertion about the larger full incident families.

### Full-family page classification and Hall step

`essentialApices G U e` explicitly enumerates **all** external vertices adjacent in G to the two endpoints of base e. `essential_new_page_decomposition` proves that every full new triangle is the base U or one such page. `essential_page_mem` proves the converse inclusion. Spokes are old edges because their apices lie outside U, so this is the correct individual-restoration family.

`essential_distinct_pages_disjoint` proves that different bases and different external apices give graph-edge-disjoint pages. `essential_injective_apices_packing` proves the injectivity and cardinality needed to convert a system of distinct representatives for the three bases into a three-triangle packing.

The cover-number-three hypothesis is used constructively: an empty page column gives a cover by the other two bases, while two columns confined to one apex give a shared-spoke-plus-third-base cover. Thus every column is nonempty and every two-column union has at least two apices. If all three columns together had at least three, the code proves every finite-subset Hall inequality and applies Mathlib's `all_card_le_biUnion_card_iff_existsInjective'` to produce the forbidden three-page packing. Hall is already formalized in the pinned Mathlib dependency; it is **not** a new undischarged theorem parameter.

The union therefore has exactly two apices p,q. If one apex missed a terminal, the two base columns through that terminal would both be confined to the other apex, contradicting the proved two-column bound. This proves universal adjacency. The final `essential_two_apex_classification` states that p,q are distinct and outside U, each sees every terminal, and every external apex of any base equals p or q. Together with the proved page decomposition, this is exactly the full seven-triangle bipyramid classification. The needed graph-realizability restriction is derived from actual adjacencies, not assumed as an arbitrary hypergraph property.

### Free page and apex-edge forcing

The previously independently accepted `essential_free_page` provides the complete equality block system after essential-edge deletion and one old triangle Q disjoint from every block's entire edge support.

`restoration_tight_essential_endpoints` applies that theorem to one individual restoration with actual packing gain at most one and full new-family cover number three. Faces avoiding the restored terminal triple show the new family has packing at most two, enabling the proved classification above.

If the two universal apices p,q were nonadjacent in H, `restoration_two_bases_avoid_old` constructs different bases for p,q whose pages avoid Q. It uses independence of the terminal triple and the fact that an old triangle cannot contain both nonadjacent apices. `restoration_nonadjacent_apex_gain` appends those two pages and Q to the equality-block faces, proving an impermissible gain of three above the blocks. Compatibility with Q is justified by its strong free-page property and the proved equality exhaustion theorem; compatibility with all new pages uses faces avoiding the terminal set.

For adjacent p,q, `restoration_adjacent_apex_pair` proves {p,q}={x,y}. If the pairs differed, the independent terminal triple contains two vertices outside the actual essential-edge endpoint set. Their two p-q pages survive in H-xy and share pq. Exhaustion and disjoint block supports force them into one K4, contradicting independence of those two terminals. Hence the essential endpoints themselves are universal apices, outside the restored triple. All retained-edge checks in this argument are explicit.

### Simultaneous four-page packing and old-face compatibility

If both individual families required three edges, the forcing theorem applies separately and shows that the same essential endpoint pair x,y is universal for both restored triangles. `essential_four_pages` constructs four actual, mutually edge-disjoint G-triangles with these apices. Its vertex-disjoint and bowtie branches are exhaustive by the previously proved overlap classification. In the bowtie branch it uses the bases corresponding to abx, vay, cdy, vcx and proves all six pairwise disjointness conditions; it does not assume the restored triples are vertex-disjoint.

After deleting xy, the endpoint pair {x,y} is independent. Equality-block faces are selected avoiding both endpoints. The code separately proves that each such old triangle cannot share the base edge of a new page because the respective terminal triple is independent in the deleted remainder, while it cannot share a spoke because it avoids x,y. This closes every cross-pair compatibility condition, not just compatibility within the four new pages. Their union gives nu(H-xy)+4=nu(H)+3 triangles, contradicting the critical bound.

Therefore one individual family has a two-edge cover. The final restoration proof combines it with an old cover and **all three edges of the other restored triangle**. That last step covers every triangle missing from the intermediate graph, including all mixed triangles; no equality between the full new family and the union of individual families is assumed.

### Updated formal boundary

All free-page geometry, full-family Hall classification, universal-apex forcing, equality exhaustion used in forcing, explicit four-page construction, and final compatibility/arithmetic are proved. B has only AharoniInput and HNSInput as visible external parameters; it does not depend on the new König input or on HKT/SPGT. The current completed formal main results are full A, full B (including the critical family saving), and full closed-boundary D1, its loss bound, and D2. Flat restoration, the separate mixed/shared-apex slack-one theorem, and compression remain ordinary-only unless later declarations explicitly establish them. These source/type conclusions must be paired with final full-project reproduction and axiom evidence before publication claims are frozen.

The full B source review was also cross-checked against `logs/essential-restoration-build-04.log` and `logs/essential-restoration-declarations.log`. The printed final types agree with the review above, and the completed apex-forcing, family-saving, and restoration theorems report only `propext`, `Classical.choice`, and `Quot.sound`. The build has harmless unused-variable warnings in a supporting lemma; those do not change theorem types or proof trust. These implementation-build records are separate from the planned clean full-project reproduction.

## Final frozen-source and declaration fidelity review

Independent review UTC: 2026-10-29T10:01:19.743760+00:00.

The subsequent B-inclusive run was executed by the root author and independently inspected here; it is distinct from the A+D clean run personally executed by this reviewer. The final record is `clean-reproduction-final/reproduction-output/verification.json`, SHA256 `c8b430eb53dc6ce7fbe9f4bac2a6982038e0aa59d40dae8ca6a938bc75f80ca1`. It reports PASS at 2026-10-29T09:54:21.479749+00:00, elapsed 158.628 seconds.

All 21 source/pin records were independently hashed against both the frozen implementation and the clean reproduction copy, with exact matches. All 13 source files that have explicit prior independent review hashes match their latest accepted versions. The remaining inherited baseline modules, toolchain and dependency manifest also match the frozen public baseline; the root importer and project package configuration are reproduction infrastructure, not new theorem assumptions. All nine dependency records report matching revisions and clean tracked sources.

All 55 recorded commands exit zero. All 17 substantive modules have separate successful `leanchecker -v` replay records; the eighteenth module is the imports-only root and was compiled without requesting a recursive prefix replay. All 152 theorem reports have exactly the standard foundational axiom set `propext`, `Classical.choice`, `Quot.sound`. The final six principal theorem types were reread from raw compiler output and agree with their manuscript/report input tables.

The completed boundary is full A, full B and its critical individual-family saving, D1 equality deletion, D1's stable floor-loss corollary, and D2 general stability. C, E, F and the separate stable-four-spoke application are explicitly not Lean-formalized. HNSInput retains the disclosed frozen graphical extraction/conversion assumption; the additional closed-boundary input is exactly the classical bipartite König interface. No new project-specific lemma is silently assumed.

The limits stated earlier continue to apply: this is a source rebuild and Lean-kernel replay of target modules using pinned compiled dependencies, not a cold dependency rebuild, an external verifier, or a proof of the explicit mathematical input parameters. The final full run was independently reviewed, not independently re-executed a second time by this reviewer. The separate A+D run supplies independent execution evidence for that subset.

Machine-readable comparison evidence: `audit/FINAL_REPRODUCTION_INDEPENDENT_REVIEW.json`. Final recommendation: **publish after owner review**, subject to final publication-tree safety/integrity checks and separate publication authorization. No further Lean work is necessary merely to make the stated conditional boundary defensible.
