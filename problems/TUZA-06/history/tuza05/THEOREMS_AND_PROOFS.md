> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Tuza inequality and equality for all 5-degenerate graphs

TUZA-05 private research checkpoint, 30 October 2026. AI-led ordinary mathematical proof. This text consolidates the frozen TUZA-04 local lemmas and the new TUZA-05 pair/overlap/peeling argument. It does not invoke an unproved general Tuza conjecture, a global equality classification, Aharoni/HNS, a fractional stability theorem, or an external computational theorem. No Lean certification or human peer review is claimed. Review details and exact versions are in REVIEW.md and SOURCE_RECORD.md.

## Main theorem and definitions

For every finite simple **5-degenerate** graph G,

    tau(G) <= 2 nu(G).

Equality holds if and only if the supporting graph of each nonempty triangle component is **K4 or K5**. Additional triangle-free edges are permitted.

Here nu counts maximum EDGE-disjoint triangles; tau counts minimum GRAPH EDGES hitting all triangles. Triangle components connect triangles through shared EDGES. A graph is 5-degenerate when every nonempty subgraph has a vertex of degree at most five; there is no maximum-degree bound. All triangle families in this proof are the full families determined by the graph, unless an explicitly named subfamily is used.

A string abc denotes the triangle on distinct vertices a,b,c, and ab its edge. A clique block means the edge support of a residual triangle component classified by the induction as K4 or K5. Different blocks may share vertices but not edges. The proof always checks intersections through edges.

## Proof organization and dependency boundary

Sections1–5 reproduce the complete relevant ordinary lemmas of frozen EQUALITY_THEOREMS.md (SHA256 b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd), with a short explicit final link classification added. They establish a tight-critical minimal obstruction, minimum degree five, and the two possible degree-five links. Sections6–8 are the new extension: low vertices are independent and have no degree-six neighbor; their overlap is severely restricted; deleting all of them and applying degeneracy forces one fixed configuration, excluded using arbitrary external pages. Section9 closes the induction.

The optional P7/P8 bounds and the positive-slack remainder notes are NOT dependencies of this proof. Every balanced residual-equality inference below is licensed by edge-minimality in the subgraph-closed class of all5degenerate graphs.

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

### 5.5 The two remaining degree-five links

Every K4-free graph on at most five vertices is 3-colorable. Indeed, a vertex-minimal graph that is not3colorable has minimum degree at least3. On four vertices it is K4; on five its complement is a matching. K5 minus zero or one edge contains K4, while K5 minus two independent edges is K221 and is3colorable.

Thus a degree-five link not already excluded contains K4. Its fifth vertex has at least two neighbors there. Exactly two is the configuration excluded in5.4; three gives K5 minus one edge, and four gives K5. Hence every degree-five vertex of a minimal S obstruction has one of these two links.

## 6. Degree-five vertices are independent and have no degree-six neighbor

We use a general reduction only with its actual witnesses. For a vertex set U, let P be r edge-disjoint triangles and X an edge set meeting every triangle incident to U and containing every P-edge with neither endpoint in U. In K=G-U-X, every K-packing can be appended by P, and every K-cover plus X covers G. Thus |X|<2r is impossible in a minimal S obstruction. If |X|=2r, equality forces nu(K)=h-r, tau(K)=2(h-r), and the residual clique-block classification.

The singleton matching version takes a matching M in a link and a vertex set Q such that the link minus Q is a subgraph of M. Delete the central vertex and M. The hub triangles on M give |M| packed triangles, and M plus the spokes to Q give a cover increment |M|+|Q|. No assumption that Q and M are disjoint is needed.

We will repeatedly exclude a residual containing K5 minus one edge or minus two independent edges. In each graph all remaining edges lie in one triangle component with five vertices. It cannot lie in a K4 block; it cannot lie in a K5 block because the specified missing edge was deleted from the whole residual. This can also be seen by listing their triangles or starting with two overlapping K4s in the one-edge case.

### 6.1 Dominating neighbors of degree five or six

Let v have degree5 and let u be a neighbor with N[v] contained in N[u]. Write W=N(v)-{u}, B=G[{u,v} union W], and Z=N(u)-N[v]. Then B is K6 or K6 minus one rim edge, and |Z|=d(u)-5.

Take X=E(G[W]) union {uv} union {uz:z in Z}. It meets every triangle at u or v. If B is K6-ab and |Z|<=1, X has at most7 edges and B has the four-packing auv,acd,bud,bcv (W={a,b,c,d}); this is strict. If B=K6 and Z is empty, |X|=7 and again a four-packing is strict.

If B=K6 and Z={p}, the edge up belongs to a triangle, so p has a neighbor w in W (v has no neighbor p). Choose a four-packing of K6 avoiding uw and add upw. Add pw to X. Its size is9<10, strict. The required four-packing exists because K6 minus a perfect matching decomposes into four triangles: for nonedge pairs ab,cd,st, use acs,adt,bct,bds; extend uw to such a matching.

Thus no dominating neighbor of a degree-five vertex has degree5 or6.

### 6.2 Adjacent degree-five vertices

If two degree-five vertices u,v are adjacent and have four common neighbors, they dominate each other and6.1 applies. Otherwise, their precise links force three common neighbors W={w1,w2,w3}. Both links are K5 minus one edge. Let p be the unique neighbor of u outside N[v] and q the unique neighbor of v outside N[u]. The vertices p,q are distinct, each joins all of W, vp and uq are absent, and W is a triangle. Whether pq is present is irrelevant.

Use

    P={uw1w2, vw1w3, upw3, vqw2},
    X=E(W) union {uv,up,vq,pw3,qw2}.

This is a balanced four/eight reduction deleting u,v. Its residual K has equality blocks and W is independent there. The five triangles

    uvw1, upw2, vqw3, pw1w3, qw1w2

are edge-disjoint. Their surviving edges in K are exactly pw1,pw2,qw1,qw3. A residual block meets W at most once; it therefore sees at most two of these edges, and any pair shares that W vertex. Block avoidance lets us append all five to a maximum K-packing, contradiction. Hence the degree-five vertices form an independent set.

### 6.3 A nondominating degree-six neighbor

Suppose v has degree5 with link K5-ut, and u is one of the missing-edge endpoints. Thus N(v)={u,t,a,b,c}, ut is absent, and W={a,b,c} is a triangle. If d(u)=6, write its two remaining neighbors p,q outside N[v]. In G-u, the vertices {v,t,a,b,c} induce K5.

If pq is present, in the link at u take M={pq,va,bc} and Q=W. Outside Q the only link edge is pq. This balanced three/six singleton reduction leaves that K5 minus the two independent edges va,bc, impossible for residual equality blocks.

If pq is absent, triangle codegree at least2 for up and uq implies that p,q each have at least two neighbors in W. Choose distinct a in N(p) intersect W and b in N(q) intersect W, with c the third vertex. Take M={pa,qb,vc} and Q=W. The link outside Q is independent. This balanced three/six reduction leaves the K5 with only vc deleted, again impossible.

Together with minimum degree5,6.1 and6.2, this proves:

**Low-neighbor restriction.** Every neighbor of a degree-five vertex has degree at least7.

## 7. Overlap restriction for nonadjacent degree-five vertices

**Proposition O.** Two nonadjacent degree-five vertices x,y have at most three common neighbors. If they have exactly three, both links must be K5.

Write C=N(x) intersect N(y). The two links are K5 or K5 minus one edge by the frozen local analysis. No assumption is made about other degrees.

### 7.1 Five common neighbors

Their common neighborhood A has five vertices and is K5 or K5-ab. Delete x,y and E(A); the cover increment is |E(A)|.

When A=K5 on {a,b,c,d,e}, the six triangles
xbc, xde, ybd, yce, abe, acd
are disjoint. The cover increment ten is strictly smaller than twelve.

When A=K5-ab, omit abe from that list. The remaining five triangles exist and the cover increment nine is strictly smaller than ten.

### 7.2 Four common neighbors

Write W=C and let p,q be the respective unique neighbors outside the common neighborhood. The graph on W is K4 or K4 minus one edge. It has two edge-disjoint perfect matchings, so four triangles, two at each center, form a packing.

Take X=E(W) union {xp,yq}. It meets all triangles at x,y and contains the noncentral edges of this four-packing. If W has five edges this is strict, with |X|=7.

If W=K4, the reduction is balanced four/eight and the residual has equality blocks with W independent. The vertex p has at least three neighbors in W, because the link at x misses at most one edge. Thus there is a page p f on some W-edge f. The graph on {x,y} union W is K6-xy. Since xy and f are disjoint, it has a four-packing avoiding f. Append the page and compatible residual block packings, giving nu(G)+1. Contradiction.

### 7.3 Three common neighbors, a missing edge inside C

If a common edge ac is absent, write C={a,b,c}, N(x)-C={p,q}, N(y)-C={r,s}. Both links are precisely K5-ac; all edges required below therefore exist. The pairs p,q and r,s are disjoint, because C is exactly the common neighborhood.

Use
P={qab,bcr,xpa,xqc,yar,ycs}
and
X=E(qab) union E(bcr) union {qc,pa,ar,cs,xp,ys}.
The six triangles are disjoint and |X|=12. It covers every triangle incident to x or y: xp handles the p-pages at x, qa,qb,qc handle its q-pages, ab,bc handle its C-triangles; the y side is analogous. Every noncentral P-edge lies in X. Thus the residual has equality blocks.

Now use the seven edge-disjoint triangles
xpa, qab, pbc, xqc, yar, ysb, rsc.
Their edges surviving in the residual are exactly pb,pc,sb,rs. Every pair of these except pb,sb requires an absent residual edge to be in a common clique block: pb/pc requires bc, sb/rs requires br, pb/rs requires br, pc/sb requires bc, and pc/rs requires cr. Those edges were deleted. Hence each block contains at most two forbidden edges and the only possible pair shares b. Standard block avoidance appends the seven-packing, contradiction.

### 7.4 Three common neighbors, a missing edge outside C

Suppose C is a triangle and at least one link is K5 minus an edge; take that link to be the one at y. Let its missing edge be e. At least one endpoint of e lies outside C. Choose an edge f=ac of C disjoint from e and let b be the third vertex.

Write N(x)-C={p,q}. At least one of p,q joins all three C vertices; call it p. Relabel a,c if necessary so that qa exists. Then pb also exists.

The core on {y} union N(y) is K6-e. Because e and f are disjoint, it has a four-packing P0 avoiding f. Take
P=P0 union {xac,xpb}
and
X=E(G[N(y)]) union {xp,xq,pb}.
This is a balanced six/twelve reduction deleting x,y. The nine edges of the near-clique link at y cover all its triangles. Any x-triangle either contains p or q, hit by xp or xq, or has its other two vertices in C, whose edges are deleted. Noncentral packed edges all lie in X.

The residual has equality blocks and N(y) is independent in it. Replace the two x-triangles by three triangles
pac, xpb, xqa.
Together with P0 they form a seven-packing. Its surviving edges are pa,pc,qa: pb and ac were deleted. A residual block meets N(y) at most once, so its only possible two-edge footprint is pa,qa, sharing a. Avoidance gives the contradiction.

All cases with a near-clique link are excluded, proving Proposition O.

## 8. The global peeling reduction and final local configuration

We now exclude the minimal obstruction in the subgraph-closed class of all5degenerate graphs.

Let G be a minimal S failure among 5-degenerate graphs. Let L be its set of degree-five vertices. It is nonempty by degeneracy and the frozen minimum-degree-five bound. Section6 makes L independent and gives degree at least7 for all its neighbors.

The subgraph G-L is nonempty and 5-degenerate. Choose u in it with at most five neighbors in G-L. Set A=N(u)-L, d=d(u), r=|N(u) intersect L|. Then |A|<=5 and r>=d-5. Since u is outside L and delta(G)>=5, d>=6, so r>=1. Thus u does have a neighbor in L, and the low-neighbor restriction gives d>=7 and r>=2.

For each v in N(u) intersect L, put A_v=N(v) intersect A. If u dominates v, |A_v|=4; otherwise |A_v|=3, and v has one further neighbor p_v outside N[u]. These descriptions use the precise K5/K5-minus-edge links. For distinct low vertices v,w, the sets A_v,A_w intersect in at most one vertex. Indeed two common A vertices together with u give at least three common neighbors. Proposition O excludes this if either link is a near-clique. If both links are cliques, both A sets have size four in an at-most-five-element set, so their intersection has size at least three and there are at least four common neighbors, again excluded.

There can be at most two subsets of an at-most-five-element set, each of size at least three, whose pairwise intersections have size at most one. To see this, two must each have size three, meet in one point and exhaust five points. Any third three-set would have total intersection size at least three with their union, whereas meeting each in at most one allows at most two. Thus r=2, d=7, |A|=5, and both A sets are triples meeting in exactly one vertex.

Label
A={a,b,c,d,e},
N(v)={u,p,a,b,c},
N(w)={u,q,a,d,e},
N(u)={v,w,a,b,c,d,e}.
The low vertices v,w have near-clique links missing up,uq respectively. The vertices p,q lie outside N[u] and are distinct: if they were equal, v,w would have three common neighbors u,a,p and Proposition O would exclude them. The sets {a,b,c} and {a,d,e} are triangles.

### 8.1 The four cross edges are forced

Suppose one of the four edges joining {b,c} to {d,e} is absent. Relabel within each pair so that ce is absent.

In the link at u, choose M={vc,we,ab}, Q={a,b,d}. Outside Q the vertices are v,c,w,e, whose only edges are vc and we: vw,ve,wc are absent by the displayed neighborhoods and ce is absent by assumption. Hence this is a balanced singleton three/six reduction.

The residual contains K5 on {v,p,a,b,c} with vc and ab deleted. The other deleted edge we is outside this vertex set because p lies outside N[u]. This is impossible for the equality block classification. Thus all four cross edges exist and A is K5.

### 8.2 The final eight-vertex graph B

Let B be the graph induced on {u,v,w,a,b,c,d,e}. It has A=K5, u joined to all other seven vertices, v joined within B precisely to u,a,b,c, and w joined within B precisely to u,a,d,e. The only further neighbors of v,w in G are p,q respectively.

A seven-packing of B avoiding ab is
vua, vbc, wud, wae, uce, acd, bde.
The two unused B edges are ub,ab. By swaps inside {b,c}, inside {d,e}, and exchange of the two arms together with v,w, there is a seven-packing avoiding each A-edge incident with a.

**Pair-avoidance claim.** For any two distinct A-edges f,g, B-{f,g} has six edge-disjoint triangles.

If one edge is incident to a, take a seven-packing avoiding it and discard the possible triangle using the other edge. It remains to consider pairs among the six edges on {b,c,d,e}. Up to the same symmetries their types and witnesses are:

| Avoided edges / type | Six edge-disjoint triangles |
| --- | --- |
| bc,de: two arm edges | vub, vac, wud, wae, uce, abd |
| bc,bd: arm edge and cross edge | vub, vac, wue, wad, ucd, abe |
| bd,ce: disjoint cross edges | vub, vac, wue, wad, ucd, abe |
| bd,be: adjacent cross edges | vua, vbc, wud, wae, uce, acd |

These four cases exhaust pairs: an arm edge and any cross edge meet; two cross edges either meet or are disjoint. Every displayed triangle uses a B edge and the triangles in each row are pairwise edge-disjoint. Thus this is an ordinary finite certificate with an explicit symmetry reduction, not an appeal to an unperformed enumeration.

### 8.3 External-page augmentation closes the configuration

Delete u,v,w and every A-edge, obtaining K. The seven-packing of B appends to every K-packing. The fourteen edges
X=E(A) union {uv,uw,vp,wq}
cover every triangle lost in the deletion. Triangles at u are inside B; triangles at v or w are inside B or use vp or wq; other lost triangles use an A-edge. Equality therefore forces
nu(K)=nu(G)-7, tau(K)=2nu(K),
and K has K4/K5 triangle components. Since A is independent in K, each block meets A at most once.

Let F be the family of all triangles with an A-edge as base and apex outside B. If F contains two edge-disjoint members on bases f,g, use a six-packing of B avoiding f,g and append those two pages. Each residual block has at most two old forbidden edges, sharing its unique A vertex. Maximum residual block packings avoid them. This constructs nu(K)+8=nu(G)+1 triangles, contradiction.

Thus F is pairwise edge-intersecting and has a cover of size at most two by the elementary intersecting-triangle lemma.

The following nine edges cover B:
{ua,ub,ab,cd,ce,de,vc,wd,we}.
The first six are the within-part edges of the 3+3 partition {u,a,b}/{c,d,e} of the K6 core. The only remaining v-triangles use vc; the only remaining w-triangles use wd or we.

Add a two-edge F-cover, vp,wq, and a minimum K-cover. Every lost triangle is covered by the preceding exhaustive classification. The cover increment is at most 9+2+2=13, contradicting tau(G)=tau(K)+14.

Therefore the minimal failure cannot exist.

## 9. Conclusion, converse and scope

The class of finite5degenerate graphs is closed under every vertex and edge deletion used above. If it contained a failure of S, choose one with the fewest edges and discard isolates. Sections1–5 give the minimal-obstruction premises. Sections6–8 exclude it. Hence every graph in this class satisfies the inequality and the asserted necessity at equality.

Conversely, packing and covering numbers add over triangle components because their edge supports are disjoint. K4 has (nu,tau)=(1,2), K5 has (2,4), and triangle-free edges contribute zero. Thus the stated component condition implies equality, including the vacuous triangle-free case.

This proves the main theorem by ordinary finite graph arguments. The finite checks in checks/ independently verify displayed local certificates and the frozen small-link coverage; they do not enumerate arbitrary external attachments and are not substitutes for the induction or page arguments above. There is no claim of a formal Lean proof, external human endorsement, or established historical priority.

The theorem extends TUZA-04 by removing its forbidden-K6-minus-edge condition entirely. It does not prove general Tuza, the global K4/K5 equality conjecture, unrestricted two-triangle restoration, stable-restoration strictness, OCT-five, or the fixed-c<3 density application. Those graph classes need not be5degenerate. Each becomes an immediate application only when the resulting graph independently satisfies5degeneracy.
