> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Fresh global adversarial review of the full 5-degenerate proof

Reviewer: a separate AI research agent, a separate internal AI reviewer, not an author of the candidate argument. This is independent AI reconstruction, not external human peer review or formal verification. Review performed on the verification server during the authorized TUZA-05 mission, 30 October 2026. No graph computation, solver run, or Lean check was performed by this reviewer.

## Verdict and scope

No material mathematical defect or surviving gap was found in the full-theorem spine of PAIR_REDUCTION_ROUTE.md: Sections 3 and 6 (only the degree-at-most-six and adjacent-five claims), 9, 10, 11, and 12. The argument proves the stated full 5-degenerate inequality and K4/K5 equality classification, conditional only on the correctly reconstructed frozen elementary local lemmas, not on any unproved global Tuza/equality assertion. I read the actual frozen EQUALITY_THEOREMS.md and checked that its Sections 1-5 are stated and proved for a minimal S failure in any subgraph-closed class; their use here does not import the forbidden-subgraph hypothesis of frozen Theorem B.

Sections 4-5 and 8 (the optional P7/P8 bounds) are not required for the full result and are outside the detailed fresh-review verdict. Leaving them out of the clean main proof reduces dependencies. The dense-remainder and stability-loss notes are also not needed for this theorem.

A minor expository omission should be repaired in the peeling paragraph: after choosing u in G-L with at most five neighbors there, explicitly state d_G(u)>=6 because u is not in L and the frozen minimum degree is at least five. Hence r=d_G(u)-|A|>=1; only then invoke the degree-at-least-seven neighbor restriction to obtain r>=2. This is a missing explanatory sentence, not a mathematical gap.

## Hereditary induction and normalization

The class of finite simple 5-degenerate graphs is closed under all edge and vertex deletions used. Minimality is by edge count, with isolates discarded. In the frozen reduction, a failure of S has tau>=2nu; an essential edge would give strict inequality by induction. Every single-edge deletion therefore preserves nu. If its cover value remained 2nu, the residual clique blocks would avoid the two old spokes of a restored triangle, one per block because the deleted base is absent. This would augment the packing. Consequently the minimal failure is tight-critical and has tau=2nu. This reasoning is an induction on proper subgraphs, not an assumption of the target theorem.

The frozen no-own-edge and small-link arguments give minimum degree at least five and limit degree-five links to K5 or K5 minus one edge. The final forbidden-subgraph step in frozen Theorem B is not used. Equality remainders below arise only from a displayed balanced packing/cover deletion.

## Adjacent low-degree vertices and degree-six exclusion

For a dominating neighbor of a degree-five vertex, deleting the pair and all four-vertex rim edges gives a strict 4/7 (or better) budget when the neighbor degree is five, or the local core is K6-e and the neighbor degree is six. In the K6/degree-six case, the unique external edge belongs to a triangle, so an external spoke supplies a fifth triangle while adding only two cover edges; the 5/9 budget is strict. No other neighbor-degree bound is assumed.

For adjacent degree-five vertices with common neighborhood of size three, both links must be near-cliques. The 4/8 deletion in Section 6 covers all triangles at the two centers even when the optional edge pq is present. The proposed five-packing uses precisely four residual edges: pw1,pw2,qw1,qw3. The common-neighborhood vertices are independent in the residual, so at most two of these edges lie in a clique block and they share its unique such vertex. K4 star avoidance and K5 two-edge avoidance are sufficient; no three-star assertion is used. Thus the degree-five set L is independent.

For a nondominating degree-six neighbor u, the other low vertex v and its non-u neighbors induce a K5 after deleting u. If the two external u-neighbors are adjacent, the matching pq,va,bc and vertex set {a,b,c} give a balanced 3/6 singleton deletion, leaving that K5 with two disjoint edges removed. If they are nonadjacent, the codegree condition supplies distinct C-neighbors for p,q; the matching pa,qb,vc gives the same budget and leaves K5 minus one edge. These are connected triangle supports on five vertices with an edge absent in the actual residual, so neither can be contained in an equality K4/K5 component. This establishes that every neighbor of L has degree at least seven without relying on P7 or P8.

## Proposition O: complete case audit

For five common neighbors, the six displayed triangles use disjoint edge sets. Removing one triangle when the common link has a missing edge leaves a strict five-packing/nine-cover deletion. For four common neighbors, the two perfect matchings in K4-e exist and are edge-disjoint; the five-edge rim is strict. In the complete-rim case, a unique external neighbor has at least three rim neighbors, yielding a page. The K6 minus the nonedge between the two centers has a four-packing avoiding its page base, because those two forbidden edges are disjoint. The page contributes at most one old edge to each residual block, so the augmentation is valid with arbitrary outside attachments.

For three common neighbors and a missing common edge ac, I checked each displayed edge of the six-packing and the twelve-edge cover. All central triangles are covered, including triangles using both exclusive neighbors at a center. In the seven-packing the residual footprint is exactly pb,pc,sb,rs. The only pair that can coexist in a residual clique block is pb,sb: pb/pc requires deleted bc; pb/rs requires deleted br; pc/sb requires deleted bc; pc/rs requires deleted cr; sb/rs requires deleted br. Thus there is no hidden three-edge conflict.

When the common neighborhood is a triangle and y has a missing link edge outside it, a common triangle edge f can always be chosen disjoint from the missing edge. At least one exclusive x-neighbor joins all three common vertices; the other joins at least one endpoint of f. The four-packing inside the y-core avoiding f and the two x-triangles are disjoint because the exclusive x-neighbors are outside N(y). In the seven-packing replacement the surviving edges are exactly pa,pc,qa. Since N(y) is independent in the residual, a clique block sees at most pa,qa together. This establishes all cases of Proposition O, including a missing edge between the two exclusive neighbors.

## Peeling and exact final configuration

G-L is nonempty because L is nonempty and independent and its vertices have degree five. Its 5-degeneracy supplies u with at most five neighbors outside L. With the explanatory repair above, u has at least two L-neighbors and degree at least seven.

For each such neighbor v, all common neighbors of u,v are outside L. Its associated subset A_v of A=N(u)-L has size four when u dominates v and size three otherwise. If two A_v sets meet in at least two vertices, Proposition O rules this out when one low link is a near-clique. If both low links are cliques, their four-element sets in a set of size at most five actually meet in at least three, giving four common neighbors and again contradicting Proposition O. Hence the subsets pairwise meet in at most one point.

Two subsets of size at least three in a five-set must each have size three, share one point, and exhaust the five-set. A third three-set would meet their union in at least three points but, under the intersection bounds, in at most two. Therefore u has exactly two L-neighbors, degree seven, and exactly five other neighbors. Both low links are near-cliques with u at the missing-edge endpoint. Their outside vertices p,q are distinct by Proposition O. This yields the claimed two-arm configuration without any bound on degrees of p,q or the five rim vertices.

If a cross edge ce between the arms is missing, M={vc,we,ab} and Q={a,b,d} are indeed a matching and a valid singleton cover witness in the link of u. The only edges outside Q are vc and we; all other potential pairs are absent by the exact neighbor sets or the assumed missing cross edge. The resulting equality residual contains K5 on {v,p,a,b,c} minus vc and ab. The third matching edge we lies outside this five-set. This forces every cross edge and hence the complete K5 rim.

## Final eight-vertex certificate and arbitrary external attachments

The graph B has 23 edges. Its displayed seven-packing uses all but ub and ab. I checked this by direct symbolic edge accounting. The symmetry operations preserve B and are transitive on the four rim edges incident with a. Deleting one more used edge costs at most one triangle, covering all 30 pairs with an edge at a. The remaining 15 pairs on {b,c,d,e} consist of one pair of arm edges, eight arm/cross pairs, four adjacent-cross pairs, and two disjoint-cross pairs. These are exactly the four listed symmetry types. Every listed six-packing exists and is edge-disjoint and avoids its indicated bases.

Deleting u,v,w and all ten rim edges has the displayed fourteen-edge cover increment. Every lost triangle is either local, uses vp or wq, or has a rim-edge base. Thus no external triangle is silently omitted. The seven-packing avoids the entire residual edge set, forcing residual equality and packing h-7.

Two edge-disjoint external pages have distinct bases. A six-packing avoiding those bases is disjoint from both pages because their apices lie outside B. In each residual block the page footprint has at most two edges, both incident with its unique rim vertex. Hence compatible maximum block packings exist. This would give h+1 triangles, so the page family is intersecting and has a cover of at most two graph edges.

The nine-edge B-cover is valid: its first six edges cover the K6 on u plus the rim; remaining v-triangles meet vc and remaining w-triangles meet wd or we. Adding the two page-cover edges and vp,wq covers every lost triangle with at most thirteen edges. This contradicts the forced fourteen-edge budget. The argument places no restriction on the outside apex degrees, on p-q, or on further edges among outside vertices.

## Evidence status and limitations

This is an ordinary symbolic proof audit. No finite survival is used to infer an unbounded theorem, and no external computation or source certificate was rerun. The exact equality converse follows from additivity over edge-disjoint triangle-component supports, using (nu,tau)=(1,2) and (2,4) for K4 and K5. Triangle-free background edges remain permitted in the final statement; they are removed only in the minimal-failure normalization.

No claim of historical priority or external expert approval follows from this review. The clean theorem file should include or precisely cite the frozen local lemmas and should distinguish the full proof spine from optional research routes. Source and review hashes below identify the reviewed candidate; later substantive edits should receive corresponding review.

## Reviewed source identity

- `notes/PAIR_REDUCTION_ROUTE.md`: SHA256 `1734affb5b40f1b3c0d68587a784deb29785378dc2d0af5c7762e4376d9d7cdd`.
- `baseline-tuza04/EQUALITY_THEOREMS.md`: SHA256 `b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd`.

Review written UTC: 2026-10-30T13:31:46.642828+00:00.

## Final consolidated-text delta review

Reviewed UTC: 2026-10-30T13:34:30.117882+00:00.
Authoritative file: `THEOREMS_AND_PROOFS.md`, SHA256 `525032516433ae3e9ecc0c897f4c2a955dc7b73bbfcef9817a31eaa971218ae7`.

**Delta verdict: PASS, no new gap or material omission found.** I read the entire consolidated text against the previously reviewed spine and frozen source. A direct text comparison confirmed that Sections1–5.4 are copied completely and identically from the frozen elementary lemmas, apart from trailing whitespace at the extraction boundary. This is document comparison, not graph computation.

The added Section5.5 correctly derives the two possible degree-five links using a vertex-minimal non-3-colorable subgraph on at most five vertices and the existing link minimum degree. Rewritten Section6 retains all needed dominating degree-five/six cases, the adjacent degree-five augmentation, and both nondominating degree-six cases. Its residual obstruction is deliberately restricted to K5 minus one edge or two independent edges, which covers every use in the main proof.

Renumbered Sections7–8 preserve the complete overlap and peeling argument and every displayed packing/cover witness. The earlier explanatory repair is now explicit: u outside L gives d>=6, hence r>=1, then the low-neighbor restriction gives d>=7 and r>=2. The cross references used by the new sections point to available internal statements. The optional P7/P8 and near-equality/stability notes are excluded from the dependency spine as intended.

The conclusion closes induction in the subgraph-closed 5-degenerate class, gives the componentwise converse including triangle-free graphs, and correctly withholds implications for unrelated graph classes without a separate degeneracy argument. No new mathematical computation or Lean check was performed in this delta review. The verdict applies to the exact version hash above.
