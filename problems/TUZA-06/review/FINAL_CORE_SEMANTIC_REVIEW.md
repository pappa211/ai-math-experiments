> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent final-core semantic review

Reviewer: separate AI `review` agent, not the author of the formal declarations or finite-core implementation. This pass extends the prior milestone review without changing that earlier reviewed scope. All reads and retained review artifacts are on the external verification server. Reviewed at UTC 2026-10-30T18:00:29.902995+00:00.

## Source identities and verification status

| Module under lean/Tuza06 | SHA-256 at this pass | Status |
| --- | --- | --- |
| `GraphOperations.lean` | `9f6316f84081c10b80852908da81bfe382a325e66198df52b00a4dd5a139b849` | compiled, semantic review; final audit/reproduction pending |
| `PageAugmentation.lean` | `2a7ab49af6c21e0f645c9bb191c7dbb8350c487630b4c5ba1e3a6f8c3f343a2b` | compiled, semantic review; final audit/reproduction pending |
| `FinalCoreReduction.lean` | `4807e290f762a5daf88297af3dd6d1955229621be775ec39c0f6704bbd5cad89` | compiled, semantic review; final audit/reproduction pending |
| `FinalConfiguration.lean` | `c4ca7480528ee670bacfa2b798c7cf818945d999c1a730f18060005aa2f53e62` | uncompiled draft semantic review only |

The first three modules have successful lead compiler logs at `logs/compile-175404-Tuza06.GraphOperations.log`, `logs/compile-175422-Tuza06.PageAugmentation.log`, and `logs/compile-175528-Tuza06.FinalCoreReduction.log`. All show exit status zero. This pass did not launch a build. Complete final exact-type/axiom audits and fresh reproduction of the frozen sources remain separate steps. `FinalConfiguration.lean` was a written but uncompiled draft at this pass; reading its intended proof is not a claim that it compiles. At this point the finite core's pair interface was temporarily inside a diagnostic block comment while its implementation was being repaired.

No material mathematical or statement-fidelity defect was found in these sources. The three compiled symbolic modules provide a representative arbitrary-graph argument. The final local strictness theorem is explicitly conditional on finite local data and residual induction conclusions. The complete global 5-degenerate inequality and equality necessity are not proved by these modules.

## GraphOperations: all triangles lost by the actual deletion

`prune G U A` is an actual simple graph on the unchanged ambient vertex type. It removes every edge incident with U and every edge with both endpoints in A. It therefore preserves arbitrary outside vertices, arbitrary edges among them, and arbitrary attachments not incident with U or entirely inside A. The retained U vertices become isolated; this does not change residual triangle extrema.

`prune_triangle_disjoint` and `prune_triangle_avoids_A` prove directly from adjacency that every residual triangle avoids U and has no edge inside A. `prune_lost_triangle` is a complete symbolic loss classification: an original graph triangle absent from the residual either contains a vertex of U or has a base edge in A. Its proof constructs residual adjacency if neither alternative holds. No finite enumeration or implicit restriction on outside triangles appears.

`prune_local_cross` proves that every edge of a local vertex set B contained in U union A is disjoint from all residual triangle edges. It does not assume that a selected local triangle has only deleted edges without checking it: a shared residual edge would have endpoints outside U and therefore both in A, contradicting the actual deletion. This establishes compatibility with every residual packing rather than one chosen packing.

## PageAugmentation: exact arbitrary-page compatibility and cardinality

`external_page_old_edge` proves that a three-element page whose base lies in B and which is not contained in B has exactly that base as its possible edge wholly in B. It uses the size-two intersection with B, derived from the base cardinality and the one-outside-vertex condition. `external_page_local_cross` then proves a local triangle avoiding that base is edge-disjoint from the whole page. These lemmas quantify over arbitrary finite sets and do not bound the available outside vertices or identify an apex from a fixed list.

`two_page_augmentation` assumes an actual residual clique decomposition, two edge-disjoint original graph triangles each having a base in A, and a local packing Q contained in B and disjoint from both pages. The local set satisfies B subset U union A. It obtains an actual maximum residual packing avoiding the two pages by the already reviewed `blocks_avoid_two_pages`; residual A-independence is proved by `prune_independent`, not supplied as a guessed outside-attachment condition. It appends the local packing and the two pages, proves every required cross-edge disjointness, and proves all packing cardinalities add. The conclusion is the exact lower bound

    |Q| + 2 + nu(prune G U A) <= nu(G).

Both pages are graph triangles of G, and their edge-disjointness implies they are distinct. The maximum residual packing is constructed; compatibility is not an assumed law about arbitrary maximum packings. The remaining assumptions about Q and the residual decomposition are explicit and are discharged, or retained as induction obligations, at subsequent applications.

## FinalCoreReduction: visible interfaces and a complete local conditional argument

`localTriangles G B` filters the full graph triangle family by vertex containment in B. `externalPages G A B` is the full family of graph triangles with a base in A and a vertex outside B. For A subset B and triangle cardinality three, such a triangle has exactly one outside apex; its apex set is otherwise unrestricted.

`FinalCoreData` is a transparent structure of local obligations. It requires A subset B, B subset U union A, a set Z of at most two outside spokes, a complete classification of every triangle meeting U into local triangles or triangles hit by Z, an actual local seven-packing, a local cover of size at most twelve containing every A-edge, a local nine-cover, and a local six-packing avoiding each pair of distinct A-edges. These fields are not axioms or opaque substitutes. A theorem depending on this structure remains conditional until the structure is instantiated from a graph configuration. No graph-theorem hypothesis has been hidden from the declared type.

`final_core_lost` combines the actual prune-loss theorem with the hub field and containment cases to classify every graph triangle into residual, local, external page, or hit by Z. This exhausts arbitrary outside triangles. `final_core_packing_lower` appends the seven-packing to every residual packing by `prune_local_cross`. `final_core_cover_fourteen` uses the initial local twelve-cover plus at most two edges in Z; the A-edge containment additionally hits every external page. Those are precisely the seven/fourteen balanced bounds.

`final_core_inequality` proves the original graph's inequality from the local data and the explicitly assumed residual inequality. It is a full local reduction, not the completed degeneracy induction.

`final_core_pages_intersect` visibly assumes residual component classification and the packing upper bound nu(G)<=nu(residual)+7. For two disjoint external pages, their bases must be distinct. The pair-six field supplies six local triangles avoiding those bases. The old-edge lemma proves those six triangles avoid all page edges. The proved component/decomposition equivalence supplies the actual residual blocks. `two_page_augmentation` then gives nu(G)>=nu(residual)+8, contradicting the assumed upper bound. Thus the whole external-page family is intersecting, with arbitrary outside attachments handled symbolically.

`final_core_cover_thirteen` invokes the proved arbitrary intersecting-triangle cover lemma and explicitly combines four contributions: a minimum residual cover, at most nine local cover edges, at most two external-page cover edges, and at most two Z edges. The complete loss classification proves coverage, and union-cardinality bounds allow overlap without requiring disjoint cover sets.

Finally `final_core_strict` explicitly assumes (1) the residual inequality and (2) residual equality implies residual component classification. If the original graph failed strict inequality, exact balanced accounting would give the original equality, a seven-triangle packing drop, and residual equality. Assumption (2) can then be applied legitimately. The thirteen-cover gives the contradiction. No residual classification is inferred from positive slack, and no global Tuza or desired global equality result is silently used. The resulting theorem proves strictness for graphs with the local data subject to those residual induction conclusions; these are precisely the remaining global induction obligations at this stage.

Some raw cover witnesses may contain sets not corresponding to surviving residual graph edges. This does not weaken graph-edge cover extrema: a cover uses an edge only if it is a two-element subset of an actual graph triangle, and the reused graph-minimum-cover theorem trims unused/nongraph sets without increasing cardinality. In the concrete configuration, any designated outside spoke that actually hits a triangle is automatically an actual original graph edge.

## FinalConfiguration draft: semantic audit before compilation

The configuration embeds the eight named local vertices by an injection from Fin 8, with the intended labels 0=u, 1=v, 2=w, 3=a, 4=b, 5=c, 6=d, 7=e. `core_edges` requires exact induced adjacency on those eight vertices, matching the twenty-three-edge finite core. The ambient graph can have arbitrarily many additional vertices and edges. Only the three neighborhood inclusions restrict attachments: u has no outside neighbor; v has at most p outside; w has at most q outside. Attachments at every A vertex and elsewhere remain arbitrary.

The definition does not require p,q distinct, outside the core, or actually adjacent to v,w. This broadens the configurations covered; it does not smuggle in a missing graph restriction. If an outside triangle actually meets v or w, the corresponding neighborhood inclusion proves its outside vertex equals p or q and produces a genuine spoke edge. If p or q lies inside the core, the relevant outside triangle is impossible. The stronger ordinary final configuration from the peeling argument satisfies these inclusions in particular.

`configuration_local_family` proves the local family is exactly the injective image of ALL triangles of the finite core, in both directions using actual graph adjacency. It does not replace the ambient graph triangle family by a selected subfamily. `configuration_hub_triangles` derives the formerly abstract hub-loss classification from the three neighborhood inclusions and clique adjacency of a full graph triangle. Any original triangle containing a designated hub and an outside vertex is impossible at u, or uses vp/wq at v/w. This symbolic step discharges the arbitrary-attachment coverage interface.

`configuration_data` intends to transport checked finite packing/cover witnesses and pair-avoidance statements to this exact local family, supplying every `FinalCoreData` field. `configuration_inequality` and `configuration_strict` then instantiate the local reductions while retaining the residual inequality and residual equality-to-classification hypotheses explicitly. They would be genuine representative arbitrary-graph local theorems once compiled and audited, but still would not imply that every minimal 5-degenerate obstruction contains this configuration. That global derivation requires the earlier local-link, pair, overlap, and peeling formalization.

At this pass, `FinalConfiguration` had not compiled and the final core pair theorem was not active outside its diagnostic comment. Hence no completion claim about those concrete instantiated declarations is made here. A later frozen-source audit can update this status without revising the scope of this semantic read.

## Trust and remaining work

No placeholder, custom axiom, unsafe/native shortcut, or opaque mathematical stand-in was found in these four source files at the recorded hashes. This pass is not a complete transitive-axiom audit of these newly added declarations. Their complete types and axiom closures must be printed and independently checked at the final freeze, followed by fresh source reproduction and established serial kernel replay where supported.

The global formal obligations remain substantive: establish the minimal combined obstruction, every inherited local-link and codegree reduction, the low-neighbor and overlap restrictions, the second degeneracy peeling argument and forced cross edges, then the complete induction connecting those hypotheses to the now-formal local reduction. Ordinary mathematical review found no defect in those arguments; it does not supply Lean proof terms for them.

## Status refresh after concrete instantiation, 18:20 UTC

The initial uncompiled-draft status above records the earlier review state. It is superseded for current status by `STRUCTURAL_MILESTONE_REVIEW.md` and `STRUCTURAL_SOURCE_HASHES.json`: FinalCoreFinite now compiles at hash `06f25eddcd011506681b4b191c5069e4162da266bf7fa94b0ef1b075f032d88b`, and FinalConfiguration compiles at hash `42a3d6896655b806a0fcdc16787f509802f9c58e9d5f9d63649cf746ab245c1d`. All FinalCoreData fields are concretely instantiated from actual graph adjacency and finite proof terms. `minimal_no_final_configuration` additionally discharges both residual induction hypotheses from actual edge-minimality, so it is a genuine exclusion theorem for actual MinimalObstruction graphs with arbitrary outside attachments. The global theorem remains incomplete because existence of that configuration under five-degeneracy has not been derived. Final frozen-source exact-type/axiom audits and clean reproduction remain separate closeout obligations.
