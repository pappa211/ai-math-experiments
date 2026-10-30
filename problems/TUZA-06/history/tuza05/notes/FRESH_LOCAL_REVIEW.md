> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Fresh local adversarial review

Independent AI-agent reconstruction, 30 October 2026. The reviewer did not develop the candidate proof. This is not human peer review or a Lean verification. The review was conducted from the actual remote files, not only from messages reporting conclusions. All retained notes were written on the designated verification server. No numerical computation, graph enumeration, solver, certificate-check script, or Lean build was run by this reviewer; the lead coordinated any finite checks separately.

## Reviewed sources and verdict

The reviewed candidate is `notes/PAIR_REDUCTION_ROUTE.md`, especially Sections 3, 6, and 9–12. Its exact SHA256 at review is 1734affb5b40f1b3c0d68587a784deb29785378dc2d0af5c7762e4376d9d7cdd. The frozen dependency `baseline-tuza04/EQUALITY_THEOREMS.md` has SHA256 b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd. I read its actual block facts, minimal-obstruction framework, own-edge and link reductions, and degree-five link conclusion. The mission's separate opening audit supplies the more comprehensive frozen-source audit.

**Verdict:** no material defect found in the new proof spine. The local reductions, overlap restrictions, final-core symmetry cases, and arbitrary external-page argument withstand this reconstruction. This verdict concerns the mathematical arguments below; reviewer agreement is not a replacement for them. No global novelty conclusion follows from this review.

## 1. Accounting and induction boundary

Each balanced reduction deletes vertices and explicitly listed graph edges, hence remains in the hereditary class of 5-degenerate graphs. Its cover increment covers all triangles at deleted vertices and also contains every additionally deleted edge. Its displayed packing uses no surviving edge, until the subsequent augmentation step where forbidden surviving edges are listed explicitly. Tightness of G and the proper-subgraph inequality then force equality of the remainder. The remainder's K4/K5 classification is therefore licensed by minimality, not assumed for an arbitrary positive-slack graph.

Maximum packings of separate triangle components combine because their graph-edge supports are disjoint, even when blocks share vertices. A clique block meeting an independent terminal set contains at most one terminal. Two external pages consequently impose at most two old edges in any block, and those edges share its terminal when both occur. K4 can avoid this star; K5 can avoid any two edges. No three-spoke K5 avoidance is used in the main spine.

## 2. Degree-five adjacency and degree-six neighbor exclusions

Section 3's strict cases are valid. For a near-clique core and a dominating neighbor of degree at most six, the old rim has five edges, and adding uv and at most one external u-spoke costs at most seven against four packed triangles. For a clique core with a degree-five neighbor, the cost is seven. For a clique core and degree-six neighbor with external p, some W-neighbor w of p exists because up lies in a triangle. Four core triangles avoiding uw plus upw are disjoint, while the cover increment has nine edges. All other triangles at u or v are hit by the rim edges, uv, or up.

For adjacent degree-five vertices with exactly three common neighbors W, Section 6's original four-packing and eight-cover are valid. The five-triangle augmentation leaves exactly pw1,pw2,qw1,qw3 in the remainder. Since W is independent, a block can contain two of these only at w1, giving pw1,qw1, an adjacent pair. The other forbidden edges lie at different W vertices and cannot share a block. This excludes the remaining adjacent case, so degree-five vertices form an independent set.

For Section 9, the nondominating degree-six vertex u has exactly the six link vertices v,a,b,c,p,q. If pq exists, M={pq,va,bc} and Q={a,b,c} satisfy the singleton reduction condition: outside Q the only possible link edge is pq. If pq is absent, both p and q have at least two neighbors among a,b,c by the codegree bound; distinct choices a,b exist. M={pa,qb,vc}, Q={a,b,c} is then valid. In both cases the remainder contains the five-vertex clique {v,t,a,b,c} with respectively two disjoint edges or one edge actually deleted. Its triangle support is connected and spans five vertices, but the missing edges prevent it from being a K5. It cannot fit in a K4 either. Extra ambient attachments cannot repair an actually absent clique edge, so this is a valid contradiction to the residual component classification.

The endpoint exclusion needs neither P7 nor P8. Together with the strict dominating cases and degree-five independence it proves every neighbor of a degree-five vertex has degree at least seven.

## 3. Nonadjacent degree-five overlaps

### Five and four common neighbors

The six-packing for a K5 common neighborhood uses every one of its ten rim edges exactly once and four spokes at each center. Omitting abe gives five valid triangles when ab is absent. The increments ten and nine are strict against twelve and ten respectively.

For four common neighbors W, both K4 and K4 minus one edge have two edge-disjoint perfect matchings. The four hub triangles and X=E(W)+xp+yq give the claimed strict/balanced cases. In the balanced case p has at least three W-neighbors, yielding an external W-page. The local K6-xy admits four triangles avoiding its base because that base and xy are a matching. The page's surviving footprint is at most one edge per block. The resulting augmentation is valid even with arbitrary other edges incident to p or q.

### Three common neighbors with a missing common edge

For C={a,b,c}, ac absent, the six displayed triangles
qab, bcr, xpa, xqc, yar, ycs
are edge-disjoint. The twelve-edge set X consists of qa,qb,ab,bc,br,cr,qc,pa,ar,cs,xp,ys, all distinct. It covers every x-triangle: xp handles p, qa/qb/qc handle q, and ab/bc handle the possible C-edges. The analogous statement at y uses ys, ar/br/cr, and ab/bc. No triangles at a deleted center are omitted.

The seven-triangle replacement
xpa, qab, pbc, xqc, yar, ysb, rsc
is edge-disjoint and has exactly pb,pc,sb,rs surviving. A common block for pb and pc would require deleted bc; for sb and rs it would require deleted br; for pb and rs it would require br; for pc and sb it would require bc; for pc and rs it would require cr. Only pb,sb may share a block, and they are adjacent. This checks all six pairs and precludes a three-edge block footprint.

### Three common neighbors with a missing noncommon edge

When C is a triangle and y's link misses e with an endpoint outside C, an edge f=ac of C disjoint from e exists. The other x-neighbors p,q are outside N(y); at least one joins all of C because x's link misses at most one edge. The other has at least one neighbor among a,c, allowing the stated relabeling.

The four-packing P0 in K6-e avoiding f uses neither x nor p nor q. Therefore both the original two x-triangles and the three replacements pac,xpb,xqa have precisely the disjointness asserted. X=E(N(y))+xp+xq+pb has twelve distinct edges and covers all triangles at x and y. The replacement's old footprint is pa,pc,qa. Since a,c lie in the residual independent set N(y), only pa,qa may share a block, and they share a. This completes the missing-edge cases in Proposition O.

## 4. Forced cross edges in the final configuration

If ce is a missing cross edge, the link outside Q={a,b,d} is precisely the two disjoint edges vc,we on the four remaining vertices v,c,w,e. The matching M={vc,we,ab} has size three, and the three/six singleton reduction is valid. The five-vertex clique {v,p,a,b,c} loses exactly vc and ab among its internal edges. The deleted edge we is outside it because p lies outside N[u]. Again its connected five-vertex nonclique triangle support contradicts the equality remainder. Thus all four cross edges are forced, giving A=K5.

## 5. Fixed eight-vertex core and symmetry coverage

The core B has 23 graph edges: ten on A, five from u to A, uv and uw, three additional v-spokes, and three additional w-spokes. The seven displayed triangles
vua, vbc, wud, wae, uce, acd, bde
use 21 distinct edges; the unused edges are exactly ub and ab. The stated automorphisms swap b,c; swap d,e; and exchange the two arms with v,w. They act transitively on ab,ac,ad,ae, establishing the seven-packing avoiding any A-edge at a.

For a two-edge deletion with an edge at a, delete at most one triangle from the appropriate seven-packing. For the remaining pairs among the six edges on b,c,d,e, there are exactly four types under these automorphisms: the two arm edges; one arm and one cross edge; two disjoint cross edges; and two adjacent cross edges. In each listed row I checked that all triangles exist, are pairwise edge-disjoint, and omit both indicated edges. The shared certificate for bc,bd and bd,ce avoids bc,bd,ce simultaneously; it is valid for each row. No additional pair type is omitted.

The nine-edge cover is correct. On the K6 core {u,a,b,c,d,e}, its first six edges are the edges within {u,a,b} and within {c,d,e}. After these deletions, every remaining v-triangle uses vc, and every remaining w-triangle uses wd or we. Thus all B-triangles are covered.

## 6. Arbitrary external attachments at the final core

The initial fourteen-edge cover increment E(A)+uv+uw+vp+wq is exhaustive. Triangles at u lie wholly in B because N(u) is exactly the displayed seven-vertex set. At v and w, any triangle outside B uses vp or wq, since each has only its single named external neighbor. Triangles avoiding u,v,w but lost by deletion have an A-edge and therefore belong to the full external page family F. There is no restriction on the external apex or its other incident edges.

The equality remainder makes A independent. Two edge-disjoint F-pages necessarily have distinct bases, and the six-packing avoiding those bases is disjoint from both pages. It uses only deleted vertices or A-edges. Each block sees at most two old page spokes, sharing its A-vertex, so the standard compatible maximum packings append. This would give h+1 triangles. Hence F is pairwise edge-intersecting, and the elementary graph-triangle lemma supplies a cover of at most two graph edges.

The final cover is the residual cover, nine-edge B cover, an F-cover, and vp,wq. It covers the same exhaustive loss classification above and has increment at most thirteen, strictly below the forced fourteen. No triangle-free background edge was silently discarded: if it participates in an activated page, that page is in F and accounted for.

## Presentation corrections, not mathematical gaps

The working note's Section 7 still says degree eight is not excluded, which is superseded by Section 8. Section 9's reference to P8 is unnecessary for the clean full proof. These should be removed or labeled historical in a consolidated theorem text. The main proof should explicitly spell out why the chosen u after deleting all degree-five vertices has a low neighbor: u is not degree five and the original minimum degree is five, hence d(u)>=6, while its remaining degree is at most five. The local review did not find a mathematical error requiring withdrawal.

## Scope and limits

This review validates the local spine conditional on the frozen minimal-obstruction and degree-five-link lemmas, whose actual statements were checked and whose comprehensive audit is recorded separately. It does not verify every optional degree-seven/eight subsidiary proof, nor the separate stable-remainder notes; neither is needed for the full main argument. No human endorsement, formal proof, external computation reproduction, or priority certificate is claimed.
