> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Equality rigidity at degeneracy four and five

TUZA-04, 30 October 2026. Status: complete ordinary proofs, independently reconstructed by the root agent and the separate literature/adversarial-review agent. This is not external expert review and no Lean verification is claimed. Historical novelty is unestablished. The proof uses elementary finite graph arguments; no Aharoni or HNS input is needed for Theorems A and B. The restoration corollary separately uses the accepted one-triangle theorem of the frozen project manuscript.

## Statements

For a finite simple graph G, nu(G) is the maximum number of edge-disjoint triangles and tau(G) the minimum number of edges meeting every triangle. A triangle component is a component of the triangle-intersection graph in which two triangles are adjacent when they share an EDGE. A graph is d-degenerate if every nonempty subgraph has a vertex of degree at most d.

**Theorem A.** Every 4-degenerate graph G satisfies tau(G)<=2nu(G). Equality holds if and only if every nonempty triangle component consists exactly of the triangles of a K4 or K5. Additional triangle-free edges are permitted.

**Theorem B.** Every 5-degenerate graph G containing no K6-minus-one-edge as a SUBGRAPH satisfies tau(G)<=2nu(G). Equality holds if and only if every nonempty triangle component consists exactly of the triangles of a K4 or K5. The forbidden-subgraph condition is not merely an induced-subgraph condition. Additional triangle-free edges are permitted.

**Corollary B1.** For every K5-free 5-degenerate graph, Tuza holds and equality has exactly K4 triangle components. This follows because K6-minus-one-edge contains a K5.

The inequality portions follow from known local reducibility arguments of Puleo. The proposed added contribution is equality rigidity with full triangle components, together with the explicit compatibility mechanism proving it. Corollary B1 contains the planar equality characterization of Cui--Haxell--Ma as a consequence, but the hypotheses here neither imply planarity nor require a global triangle-hypergraph tripartition.

## 1. Elementary block facts

K4 has (nu,tau)=(1,2). K5 has (nu,tau)=(2,4): two disjoint triangles exist; three disjoint triangles would use nine edges and leave one edge, impossible because every degree in a union of edge-disjoint triangles is even whereas removing one edge from K5 creates two odd degrees. Each edge of K5 meets three of its ten triangles, so three cover edges cannot cover them all; four edges inside a vertex bipartition of sizes two and three do cover all triangles.

A K4 maximum packing can avoid any star of forbidden edges by choosing the face opposite the star center. A K5 maximum packing can avoid any two edges. Up to relabeling, for forbidden adjacent edges 12,13 choose 145,234; for forbidden disjoint edges 12,34 choose 135,245. Each displayed pair is edge-disjoint. Zero or one forbidden edge follows by enlarging the forbidden set.

In either block there is a minimum cover containing any specified edge. In K4 take it and its opposite edge. In K5 take the four edges inside a 2+3 vertex partition whose two-vertex class is that edge's endpoints. Independent choices combine across triangle components, whose edge supports are disjoint.

We also use the elementary intersecting-triangle lemma: a pairwise edge-intersecting triangle family has a two-edge cover; if it has no common edge, all its triangles are faces of a single K4. Indeed, two distinct triangles can be written abc,abd. A triangle avoiding ab must share another edge with each, hence is acd or bcd. Once such a triangle is present, every further triangle lies among those four faces. The pair ab,cd covers the family. Families with a common edge, or a single triangle, are immediate.

## 2. Minimal-obstruction framework in a hereditary class

Call S the assertion that Tuza holds and equality has only K4/K5 triangle components. Let C be any class closed under taking subgraphs, and suppose G is a failure of S in C with as few edges as possible. Discard isolated vertices. Then every proper edge-subgraph satisfies S.

There are no triangle-free edges: deleting one preserves the triangle family and the failure. There is only one nonempty triangle component: otherwise apply S to each component support, sum the inequalities, and observe that equality of the sum forces equality and the block classification in every component. Thus G has connected nonempty triangle support.

Write h=nu(G). A failure of S has tau(G)>=2h. If nu(G-f)=h-1 for an edge f, induction gives tau(G)<=tau(G-f)+1<=2h-1, impossible. Hence every edge deletion preserves nu.

If tau(G-f)=2h for f=xy, then G-f has only K4/K5 triangle components. Choose a triangle xyw of G. The wedge edges xw,yw cannot lie in the same residual clique block, since xy is absent. Choose in each block a maximum packing avoiding its possible single wedge edge and append xyw. This gives h+1 triangles, contradiction. Therefore tau(G-f)<=2h-1 for every edge f. Cover deletion changes tau by at most one, so

    tau(G)=2h; nu(G-f)=h; tau(G-f)=2h-1 for every edge f.

Thus every minimal S-obstruction in a hereditary class is tight-critical. This argument proves the reduction; it does not presume global Tuza.

Whenever a local deletion produces K and supplies r triangles disjoint from every K-packing and a cover increment of size 2r, equality forces

    nu(K)=h-r, tau(K)=2(h-r),

and the inductive hypothesis classifies K into K4/K5 triangle components. We will always give the actual local packing and cover increment.

## 3. An edge cannot belong to just one triangle

Suppose uv belongs only to uvw. Delete uw,vw to get K. The edge uv is triangle-free in K, so every K-packing can be appended by uvw. A K-cover plus uw,vw covers G. Hence nu(K)=h-1, tau(K)=2h-2 and K has the block classification. Each block meets U0={u,v,w} at most once: uw,vw are absent, and uv is triangle-free in K.

Let F be the full family of triangles lost in this deletion. They all contain w. If F is intersecting, the preceding lemma says that F has a common edge or is contained in K4 faces. In the latter case, since uvw belongs to F and all F-triangles contain w, absence of a common edge forces wuv,wux,wvx for a fourth vertex x. Their edges force the triangle uvx, contradicting uniqueness of uvw. Thus F has a one-edge cover, giving tau(G)<=tau(K)+1<2h.

If F is not intersecting, take two disjoint members. A K4 block has a face avoiding its possible U0 vertex, hence avoiding both members. Each member uses at most one edge of a given K5 block, so that block can avoid the at most two forbidden edges. These maximum block packings combine with the two F-triangles to give h+1 triangles, contradiction. Therefore every G-edge has triangle codegree at least two. Equivalently every vertex in every link G[N(v)] has degree at least two.

## 4. Every link component has at least five vertices

Let C0 be a connected component of the link at v. In the following cases, deleting v means deleting just the spokes into C0; other neighbors of v remain. There is no triangle through a deleted spoke with its third vertex outside C0, because that would join link components. All listed covers therefore account for every lost triangle. External rim pages have apex outside C0 union {v}.

### 4.1 Link component K3

Write C0=abc. Delete its three v-spokes and ab. The triangle vab appends to any residual K-packing, and {ab,vc} is a cover increment, so K has equality blocks and nu(K)=h-1.

An external abx combines with vbc. Their edges present in K are bc,ax,bx. Since ab is deleted, no block contains both a and b; the only possible two-edge overlap is bc,bx, a star at b. Block avoidance yields h+1 triangles, contradiction. By symmetry no rim edge of abc has an external triangle. Thus the K4 on v,a,b,c is an isolated triangle component. Connectedness makes it the whole triangle support, which satisfies S, contradiction.

### 4.2 Link component K4

Write C0=abcd. Delete its v-spokes and ab,cd. The packing vab,vcd appends, and {ab,cd,va,vb} is a four-edge cover increment. Hence nu(K)=h-2 and K has equality blocks.

An external abx combines with vac,vbd. Its old forbidden edges are ac,bd,ax,bx. Because ab is absent, a block sees at most two of these edges, necessarily adjacent at a or b. Block avoidance gives h+1 triangles. Varying the perfect matching ab,cd excludes external triangles on every rim edge. The K5 on v,a,b,c,d is therefore an isolated triangle component, again impossible.

### 4.3 Diamond link component

Write C0=K4-ab on a,b,c,d. Delete its v-spokes and ac,bd. Use packing vac,vbd and cover increment {ac,bd,vc,vd}; equality gives nu(K)=h-2 and blocks.

An external acx combines with vad,vbc. Its old forbidden edges are ad,bc,ax,cx. Since ac is absent in K, a block sees at most two of these, with the only possible pairs ad,ax or bc,cx. Block avoidance contradicts maximality. By symmetry, including use of the other matching ad,bc, no external triangle uses ac,ad,bc,bd. Returning to K above, a K-cover plus {vc,vd,cd} covers G: vc,vd cover all v-triangles, and the only other lost triangles are acd,bcd, hit by cd. This gives 2h-1 cover edges, contradiction.

### 4.4 Four-cycle link component

Let C0 be the cycle abcd. Delete its v-spokes and ab,cd,da, retaining bc. The packing vab,vcd appends; all four rim edges are a cover increment. Thus nu(K)=h-2, tau(K)=2h-4 and K has equality blocks.

By Section 3, bc has a triangle bcx other than vbc. It survives in K: x cannot be a or d since the diagonals ac,bd are absent. Hence bc lies in a residual block. Choose a minimum K-cover containing bc, and add only ab,cd,da. It covers G with 2h-1 edges, contradiction.

Since every link has minimum degree at least two, its connected components of order at most four are exactly K3,C4,diamond,K4. All are excluded. Hence every link component has order at least five, and delta(G)>=5.

## 5. A 3-colorable link component cannot have five vertices

Suppose a link component L has five vertices, minimum degree at least two, and is 3-colorable. Its complement has maximum degree at most two. A 3-coloring gives either a size-three color class (a triangle in the complement) or two size-two classes (a matching of size two). The possible complements are exactly

    2K2+I, P3+K2, P4+I, P5, C3+K2, C3+2I, C4+I, C5.

For a matching M and vertex set Q with L-Q a subgraph of M, delete the local v-spokes and M. The |M| triangles at v on M append to every residual packing, while M plus the v-spokes to Q is a cover increment. If |Q|<|M| this is strict; if equality holds, the residual has K4/K5 blocks and packing h-|M|.

### 5.1 Four dense types

In each row |M|=|Q|=2. The listed three triangles are mutually edge-disjoint. Their edges present in the residual are in the next column. The missing and deleted edges restrict a block's intersection as shown, so maximum block packings avoid that set and append all three triangles, contradiction.

| L | M | Q | Three triangles | Edges present in K | Possible overlap of size two |
|---|---|---|---|---|---|
| K2,3 with sides {p,q},{b,c,x}, plus bc | bc,px | p,q | pbc; vqb; vpx | pb,pc,qb | none: bc deleted and pq absent |
| K5 minus ab,bc,cd; fifth vertex e | bd,ce | a,e | ace; vad; vbe | ac,ae,ad,be | only ae,ad |
| K5 minus ab,bc,cd,de | ac,bd | a,e | ace; vad; vbe | ae,ce,ad,be | none |
| K2,3 with sides {p,q},{a,b,c}, plus pq | ap,bq | p,q | apq; vbp; vcq | aq,pq,bp,cq | only pq,cq |

Both allowed pairs are adjacent. For completeness, in the second row ac with ae requires deleted ce; ac with ad requires absent cd; ac with be requires absent ab; ae with be requires absent ab; ad with be requires deleted bd. Only ae,ad remains, precluding a triple. In the third row, the pairs respectively require deleted ac, absent de, absent ab, deleted ac, absent bc, or deleted bd. In the fourth row, every pair except pq,cq requires deleted ap or bq, or an absent pair among a,b,c. The first row's three pairs require bc or pq. These are all pair tests.

### 5.2 Three sparse types

For a bowtie L=abc union ade, take M={bc,de}, Q={a}. The cover increment has size three for a compatible two-packing, immediately strict.

For L=K2,3 with sides {a,b},{c,d,e}, take M={ac,bd}, Q={a,b}. An external acx combines with vad,vbe. The old forbidden edges are ad,be,ax,cx. Missing/deleted ac,ab,cd,ce exclude every pair except ad,ax, adjacent at a. Hence no external ac-page exists; symmetry handles every rim edge. There are no triangles within L, so each rim edge belongs only to its v-triangle, contradicting Section 3.

For L=C5 with rim abcde, take M={ab,cd}, Q={c,e}. An external abx combines with vbc,vde. Old forbidden edges are bc,de,ax,bx. Deleted ab,cd and absent ad,bd leave only the possible pair bc,bx. Thus no rim edge has an external page, by symmetry. Again each rim edge belongs to just its v-triangle, contradiction.

### 5.3 The remaining type K221

Write the missing link edges ab,cd and the fifth link vertex e. The local graph B on W={v,a,b,c,d,e} is K6 minus ab,cd. Delete all B-edges to K. The four edge-disjoint triangles vac,vbd,ade,bce append to every K-packing. All eight rim edges cover every lost triangle through v and every other lost triangle. Hence equality forces nu(K)=h-4 and tau(K)=2h-8, and K has equality blocks. Each block meets W at most once, since W is independent in K.

Let F be the external rim pages, triangles with a rim edge and apex outside W. The lost triangles are exactly the B-triangles and F. B has the four-edge cover {va,vb,ec,ed}; therefore equality forces tau(F)>=4.

Call the following four pairs of rim edges bad:

    {ac,bd}, {ad,bc}, {ae,be}, {ce,de}.

Every other pair f,g is good and B-{f,g} has three edge-disjoint triangles. The symmetries swapping a,b, swapping c,d and exchanging the two two-vertex parts reduce all good pairs to four cases:

| f,g | Three triangles avoiding them |
|---|---|
| ac,ad | vae; bce; vbd |
| ae,ce | bde; vad; vbc |
| ac,ae | bde; vad; vbc |
| ac,be | ade; vbd; vce |

The four cases are adjacent pairs of cycle edges, spokes at e to different parts, an incident mixed pair, and a nonincident mixed pair. The remaining cycle pairs and spoke pairs are precisely those listed as bad. Thus the list covers every good pair without an appeal to enumeration.

If F has no edge-disjoint pair on good bases, then tau(F)<=2. To prove this, an intersecting F already has a two-edge cover. Otherwise choose disjoint pages on bases f,g, which must be bad partners. Every page on a third base must intersect both, since a third base is good with each bad partner. Such intersections require a common external apex and bases meeting both f and g.

For adjacent bad partners ae,be (or ce,de), disjointness requires distinct apices, so no third base occurs; f,g cover F. The same holds for disjoint partners with distinct apices. For disjoint partners ac,bd with common apex x, a third base meeting both is only ad or bc, and its page has apex x. Its presence forces every page on ac or bd to have apex x, or else it would form a good disjoint pair with that third page. The other possible third base likewise has apex x. Thus F lies in the four pages at x over the cycle ac,cb,bd,da, covered by xa,xb. If there is no third base, ac,bd cover F. This proves the claim; symmetry handles ad,bc.

Since tau(F)>=4, F has a disjoint pair on good bases f,g. Combine these two pages with the displayed local three-packing avoiding f,g. Each residual block meets W at most once, and hence meets each external page in at most one old spoke. If it meets both, the forbidden spokes share its unique W vertex. A K4 avoids that star and a K5 avoids the at most two edges. Maximum residual block packings thus append to all five selected triangles, yielding h+1, contradiction.

This completes exclusion of every 3-colorable five-vertex link component.

### 5.4 One additional non-3-colorable link

The link consisting of K4 on a,b,c,d and a fifth vertex x adjacent exactly to a,b is also excluded. Take M={cd,ax} and Q={a,b}; L-Q is the single edge cd. Deleting the local v-spokes and M forces equality blocks with packing h-2. The triangles acd,vax,vbd are edge-disjoint and have old forbidden edges ac,ad,bd. A block cannot contain both ac,ad or both ac,bd because cd is deleted; the only possible pair is ad,bd, adjacent at d. Maximum block packings avoid this pair and append the three triangles, giving h+1, contradiction.

This certificate was developed by the root agent and independently checked by this route and the literature/review agent.

## 6. Deduction of Theorems A and B

For Theorem A, the class of 4-degenerate graphs is closed under subgraphs. A minimal failure of S in it would have minimum degree at least five by Section 4, contradicting degeneracy. Hence S holds. Conversely, disjoint triangle edge supports with K4/K5 components have additive nu,tau and equality, irrespective of triangle-free edges.

Every K4-free graph on at most five vertices is 3-colorable. Otherwise take a vertex-minimal non-3-colorable subgraph; its minimum degree is at least three. On four vertices this forces K4. On five vertices its complement is a matching; K5 minus zero or one edge contains K4, while K5 minus two independent edges is K221 and 3-colorable. These exhaust the possibilities.

For Theorem B, use the hereditary class of 5-degenerate graphs with no K6-minus-one-edge subgraph. A minimal failure has minimum degree at least five, while degeneracy supplies a degree-five vertex v. If its link is 3-colorable, Sections 5.1-5.3 exclude it. Otherwise the preceding observation gives a K4 in the five-vertex link. The fifth link vertex has two, three or four neighbors in that K4, since every link has minimum degree at least two. Two neighbors give the configuration excluded in Section 5.4. Three neighbors make the link K5-minus-one-edge, and adjoining v gives a forbidden K6-minus-one-edge. Four neighbors give a K6, which contains the same forbidden graph as a non-induced subgraph. All cases contradict minimality. Thus S holds; the converse equality direction is additive over the specified blocks.

Corollary B1 follows because K5-free graphs cannot contain K6-minus-one-edge, and their equality components cannot be K5. Theorem A and Theorem B are incomparable: K6-minus-one-edge itself is 4-degenerate, so Theorem A is not redundant.

The same reasoning also proves the K4 equality classification for all 5-degenerate graphs whose vertex links are 3-colorable; this class is hereditary and excludes K5. This is subsumed by Corollary B1.

## 7. Restoration-specific corollary

Let R assert that if H has tripartite FULL triangle hypergraph and J=H+E(T), then equality tau(J)=2nu(J) forces K4/K5 triangle components. Suppose R fails; choose a failure minimizing old edge count. Any old-edge deletion stays in the one-triangle class, so the accepted one-triangle theorem supplies Tuza for every residual. If a nonempty such deletion leaves equality, minimality classifies its components.

Remove old edges that are triangle-free in J and then discard isolated vertices. Any component not containing T is an equality component of H and hence K4 (by the accepted tripartite equality result); the T-component satisfies the one-triangle theorem. Equality is additive, so the failure may be reduced to the unique T-component.

Let v be outside U=V(T), with at most one neighbor in U. Every triangle through v is old. Any edge whose sole J-triangle is an old triangle can be excluded by Section 3 because the two edges deleted there are old. Thus the link at v has minimum degree at least two. All local spokes and rim edges in Sections 4-5 are old, since the local neighbor set contains at most one terminal. Every residual equality classification used there is therefore available by old-edge minimality. A locally isolated K4/K5 component cannot contain T and contradicts the normalization. Finally, color a neighbor w of v by the rainbow edge label of vw in H: adjacent link vertices have different labels, so this link is 3-colorable.

**Corollary R-local.** After discarding isolated vertices, in an old-edge-minimal counterexample to R every vertex v outside U with at most one U-neighbor has all its link components of order at least six. In particular d_J(v)>=6.

This is a structural reduction toward restoration. It does not prove R or stable-remainder strictness. At a terminal, the analogous deletion can remove restored edges and is not authorized by this induction; the exact two-apex terminal link K2,3 plus a base edge is a concrete instance where that scope issue occurs.

## 8. Evidence and literature boundary

The proof was developed from the frozen TUZA manuscript at revision 97e913008e466de14f61437d8dae774946d92e8f, with external pages and K5 compatibility retained explicitly. The route's working history and superseded stopping points remain in EQUALITY_ROUTE.md.

The root agent independently checked all 1,024 labeled graphs on five vertices: 212 have minimum degree at least two and are 3-colorable, representing exactly the eight isomorphism types listed. It also computed all 28 pairs of rim edges in K221's cone using exact recurrence and independent direct triangle-packing subset enumeration, confirming exactly the four bad pairs. Artifacts: check_local_links.py and local_links.json, with local_links.log, local_links.initial.log and check_local_links.initial.py. The first exploratory expectation that there were only two bad pairs failed; the script stopped at that assertion. The corrected four-pair statement and complete passing check are retained. This finite check supports the local list and witnesses, not the unbounded induction theorem. No Lean build was run for these results.

Primary comparisons inspected:

- Cui, Haxell, Ma, Packing and Covering Triangles in Planar Graphs, Graphs and Combinatorics 25 (2009), 817-824, online 2010, https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf. Gives the planar K4 equality classification. Its equality induction, prescribed-edge minimum covers, and own-edge/link mechanisms are important antecedents. The present statements replace planarity by the specified degeneracy hypotheses and include K5 blocks where allowed.
- Puleo, Tuza's Conjecture for graphs with maximum average degree less than 7, European Journal of Combinatorics 49 (2015), 134-152, https://arxiv.org/abs/1308.2211 and https://doi.org/10.1016/j.ejc.2015.03.006. Its robust-link and small-link reductions supply the inequality antecedents; Proposition 5.1, proof Case 1 supplies the four-packing/eight-rim-cover template for K221. Those results concern minimal failures of the inequality, so their application to equality failures requires the compatibility and cover-saving arguments given here.
- Gupta, Tuza's conjecture for graphs of maximum degree at most seven, https://arxiv.org/abs/2608.06538. Its equality question is posed within the degree-seven setting; it is not cited as a proof or exact global source of S.
- Kandasamy, Tuza's Conjecture for Graphs of Maximum Degree at Most 10, https://arxiv.org/abs/2610.15269, October 2026. The inspected preprint asserts a maximum-degree-ten inequality theorem; it does not provide the equality classification proved here.

Targeted searches for equality/extremal formulations with degeneracy four or five (including the stronger forbidden-K6-minus-edge formulation) did not identify an exact predecessor. This negative search does not establish historical priority. No external census or external solver result was rerun by merely reading these sources. 

Review correction: an earlier draft stated the R-local degree bound without explicitly discarding isolated vertices. Edge-count minimality alone does not exclude isolated vertices. The normalization and corollary now state their removal. The link-component bound was vacuous at isolates; the main degeneracy theorems already discarded them. This correction changes no local proof.
