> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Pair reductions at a dense degree-five vertex

TUZA-05, 30 October 2026. Status of Sections 1-6: complete ordinary proof candidate, self-reviewed for all lost triangles, packing conflicts, and residual block footprints. Independent review by the lead remains required. No graph computation, SAT, or Lean was used.

## 1. Exact statement and hypotheses

Let C be any class closed under subgraphs, and let G be an edge-minimal failure in C of S: Tuza's inequality together with equality classification into K4/K5 triangle components. Delete isolated vertices. Use the audited TUZA-04 premises: G has connected triangle support, tau(G)=2nu(G), all proper edge-subgraphs satisfy S, every edge has triangle codegree at least two, every link component has order at least five, and every degree-five vertex has link K5 or K5 minus one edge.

**Proposition P7.** If v has degree five and u is a neighbor dominating its link (equivalently N[v] is contained in N[u]), then d(u)>=8.

For a clique link every neighbor dominates. For a link K5-ab, the three neighbors other than a,b dominate.

**Corollary.** Every 5-degenerate graph of maximum degree at most seven satisfies S. Proof: this is a hereditary class; a minimal failure has minimum degree at least five and thus a degree-five vertex. Its link has one of the two forms above, hence a dominating neighbor; P7 contradicts maximum degree seven.

The corollary allows K6 and K6-minus-edge subgraphs, so is not contained in frozen TUZA-04 Theorem B. Its inequality is already covered by Gupta's maximum-degree-seven theorem; the proposed advance is equality classification under the additional 5-degeneracy hypothesis. No claim of historical priority is made.

## 2. Packing and cover accounting

Write W=N(v)-{u}, B=G[{u,v} union W], Z=N(u)-N[v], and k=|Z|=d(u)-5. As u dominates v, W has four vertices, B is K6 or K6-ab, and every neighbor of u lies in {v} union W union Z. The vertex v has no neighbor in Z. Edges from W or Z to vertices outside this set remain unrestricted.

A pair reduction uses a triangle packing P and edge set X such that X meets every triangle incident to u or v and contains every P-edge with neither endpoint in {u,v}. Set K=G-u-v-X. Then
nu(G)>=nu(K)+|P| and tau(G)<=tau(K)+|X|.
If |X|<2|P|, induction contradicts tau(G)=2nu(G). If |X|=2|P|, equality forces K to have K4/K5 triangle components and nu(K)=nu(G)-|P|.

Whenever E(G[W]) is deleted, W is independent in K. Every residual clique block therefore meets W in at most one vertex. A page on a W-edge with apex outside B contributes at most one old edge to any such block. Two pages contribute at most two old edges; if two occur, they share the block's unique W vertex. K4 maximum packings avoid a forbidden star and K5 maximum packings avoid any two forbidden edges. Thus residual maximum packings can accompany one or two such pages and any selected triangles lying wholly in the deleted part.

A K6 has four edge-disjoint triangles avoiding any specified matching of at most three edges: extend the matching to a perfect matching, and decompose K6 minus that matching as the octahedron. If its three nonedge pairs are {a,b},{c,d},{s,t}, use acs,adt,bct,bds. In particular it avoids one edge, or two disjoint edges.

## 3. Dominating neighbors of degree at most six

Take X=E(G[W]) union {uv} union {uz:z in Z}. It meets all triangles incident to u or v.

If B=K6-ab, then |X|=6+k. For k<=1 this is at most seven, while B contains four disjoint triangles. For W={a,b,c,d} with ab absent, an explicit four-packing is auv,acd,bud,bcv. Every edge outside {u,v} lies in E(W), so the reduction is strict.

If B=K6 and k=0, |X|=7<8 gives the same strict conclusion.

If B=K6 and k=1, let Z={p}. Since up belongs to a triangle, p has a neighbor w in W. Choose a four-packing of B avoiding uw and append upw. Add pw to X. The new X has nine edges, strictly fewer than twice five. This excludes degree six.

Only degrees seven and higher remain.

## 4. B=K6-ab and d(u)=7

Here Z has two vertices. Take X=E(W) union {uv} union uZ, of size eight, and any four-packing of B. Equality forces K=G-u-v-E(W) to have residual blocks.

Let F be all triangles with a base edge in W and apex outside B. A page on cd is impossible: B has the four-packing acu,adv,bcv,bdu avoiding cd. Append the page and compatible residual maximum packings to obtain nu(G)+1.

Thus all F-bases lie in the four-cycle ac,ad,bc,bd. Every pair of distinct bases can be avoided by a three-packing in B. Under swapping a,b and c,d, the three types and witnesses are:

| Avoided bases | Three edge-disjoint triangles |
| --- | --- |
| ac,ad | uva,ubc,vbd |
| ac,bc | uvc,uad,vbd |
| ac,bd | uva,ubc,vcd |

Therefore F has no edge-disjoint pair: such a pair plus the corresponding three-packing and compatible residual maximum packings would yield nu(G)+1.

We now classify the bases of this intersecting F. If all pages have the same base, there is nothing to prove. Otherwise choose pages on distinct bases. Their bases meet at a vertex r and their apices coincide at x; otherwise they would be edge-disjoint. The pages have form rax,rbx. A page intersecting both but avoiding rx would have to be abx (the fourth possible face rab is entirely inside W, so is not in F). If r is a missing-edge endpoint of W, a,b are c,d and abx is a forbidden cd-page. If r is c or d, a,b are the missing pair, so abx does not exist. Consequently all F-pages share rx.

If r is a or b and two distinct bases occur, graph closure forces the forbidden external cd-page. Hence, apart from the single-base case, F-bases are contained in {ac,bc} or {ad,bd}.

The five edges {ac,bc,uv,ud,vd} cover B and every F-page in the first case; {ad,bd,uv,uc,vc} do so in the second. Every single possible base belongs to one of these two cases, so one of these covers works whenever F has at most one base too. If F is empty either works.

Add the two edges uZ and a minimum K-cover. Every lost triangle is either in B, an F-page, or incident with an edge of uZ. Thus this is a cover of G of size tau(K)+7, contradicting equality tau(G)=tau(K)+8.

No assumption was made on edges within Z or beyond this neighborhood.

## 5. B=K6 and d(u)=7

Write Z={p,q}. There are two cases.

### 5.1 pq is present

Take P to be a four-packing of B plus upq. Set
X=E(W) union {uv,up,uq,pq}.
Its size is ten. It covers every triangle incident to u or v, and contains every P-edge not incident to them, so K=G-u-v-E(W)-pq has equality blocks.

Any external W-page f x can be combined with a four-packing of B avoiding f and with upq. These six triangles are disjoint. The external page meets each residual block in at most one old edge; all other selected triangles avoid K. This augments the residual packing to nu(G)+1. Therefore there is no external W-page.

Take a six-edge cover of K6 (the edges within the two parts of a 3+3 vertex partition), and add up,uq,pq and a K-cover. This covers all lost triangles, including every triangle on the deleted edge pq. Its increment is nine, contradicting the balanced value ten.

### 5.2 pq is absent

The codegree bound on up and uq implies that p and q each have at least two neighbors in W.

Fix any z in {p,q} and any w in N(z) intersect W. A four-packing of B avoiding uw, together with uzw, has size five. Use
X=E(W) union {uv,up,uq,zw},
again of size ten. Hence K=G-u-v-E(W)-zw has equality blocks.

If an external W-page has base f not containing w, the two edges uw and f are disjoint. A four-packing of B avoids both. Append uzw and that page. These six triangles are edge-disjoint, including when the page apex is z. The residual packing avoids the page's at-most-one forbidden old edge in each block. Thus equality is impossible.

This works for every choice of z and w. Therefore every external W-page base must contain every vertex in R=N_W({p,q}). There is an external W-page because p has at least two W-neighbors. A base has only two vertices, so |R|=2; write R={a,b}, W={a,b,c,d}. Both p and q have precisely a,b as W-neighbors.

Now apply a singleton reduction at u. In its link take matching M={ap,bq,cd} and Q={v,a,b}. The graph left in the link after deleting Q has only the edge cd, which lies in M. Delete all u-spokes and M. The packing uap,ubq,ucd appends to every residual packing, and M union {uv,ua,ub} is a six-edge cover increment. Equality classifies the residual into K4/K5 components.

But the residual contains K4 on {v,a,b,c} and K4 on {v,a,b,d}, sharing their triangle vab, while cd is absent. Those K4s must belong to the same triangle component. It cannot be a K4 because their union has five vertices; it cannot be a K5 because cd is absent. Contradiction.

This completes the proof of Proposition P7 and its corollary.

## 6. Additional adjacent degree-five restriction

This is not required for the corollary but is a separate equality upgrade of Puleo's common-neighborhood-three case.

If two degree-five vertices u,v are adjacent, the already proved strict cases exclude common-neighborhood size four. In the remaining case both links are K5-minus-edge. Write common neighborhood W={w1,w2,w3}, let p be the unique neighbor of u outside N[v], and q the unique neighbor of v outside N[u]. Then W is a clique, p and q each join every W-vertex, vp and uq are absent, and p,q are distinct. Whether pq is present is irrelevant.

Use
P={uw1w2,vw1w3,upw3,vqw2},
X=E(W) union {uv,up,vq,pw3,qw2}.
This is a balanced four/eight reduction deleting u,v; hence residual K has equality blocks and W is independent in K.

The following five triangles are edge-disjoint:
uvw1, upw2, vqw3, pw1w3, qw1w2.
Their edges surviving in K are exactly pw1,pw2,qw1,qw3. Each residual clique block meets W at most once, so it contains at most two of these edges, and two share that W vertex. The standard block-avoidance facts give maximum residual packings avoiding all four forbidden edges. Appending the five triangles contradicts nu(G).

Thus degree-five vertices form an independent set in any minimal S failure satisfying the frozen local premises.

## 7. Relation to published reductions and limits

The pair-reduction framework and balanced common-neighborhood-three template are from Puleo, arXiv:1308.2211v3, Proposition 5.2; the subsumed degree-seven/eight analysis is Lemma 7.5. Those published statements concern reducibility for an inequality counterexample. A minimal S failure need not have no balanced reducible set. The proofs above explicitly classify the equality remainder and handle every balanced case instead of importing irreducibility.

The proposed additions are the equality analysis, the external-page restriction/cover replacement for the K6-minus-edge core, and the missing-edge obstruction in the clique-link independent-exterior case. Their historical novelty has not been certified. The corollary's inequality alone is already known.

Degree eight is not yet excluded by this note. With three external neighbors, some reductions force six packed triangles and twelve cover edges, including a prescribed external spoke; the one-page augmentation can then fail when a page base meets the core spoke that the local four-packing must avoid. This is a named remaining case, not a proof of the larger bound.

All notation and arguments concern full graph triangles; mixed triangles and triangles on deleted external edges are included in the cover accounting. No script or finite check is being used as proof.

## 8. Degree-eight upgrade: Proposition P8

**Proposition P8.** Under the same minimal-obstruction hypotheses, every dominating neighbor u of a degree-five vertex v has degree at least nine.

The previous sections exclude degrees at most seven. Suppose d(u)=8, so Z has three vertices. The following arguments exclude degree eight too. They use the same arbitrary-exterior conventions.

We use one elementary obstruction repeatedly: K5 with one or two distinct edges removed has a connected triangle support spanning all five vertices and is not a clique. For two adjacent missing edges, a K4 on the other four vertices shares an edge with a triangle containing the degree-two vertex. For two disjoint missing edges, it is K221, whose four triangles form one connected triangle component. Thus such a graph, with the indicated edges absent from the ambient graph, cannot occur in a graph whose triangle components are K4/K5.

### 8.1 Z is independent, either core

Every z in Z has at least two neighbors in W by the codegree-at-least-two property of uz. Let J be the bipartite graph between Z and W.

If J has a matching M0 of size three, let w0 be the unique W vertex not matched by it. In the link at u, take M=M0 union {vw0} and Q=W. This is a matching of size four; Q is a vertex cover of the link. The singleton reduction deleting all u-spokes and M has four packed triangles and eight cover edges. Hence its residual has equality blocks. Yet on {v} union W it contains K5 or K5-ab with just the further edge vw0 deleted. The preceding obstruction contradicts the block classification.

Otherwise the matching number of J is at most two. By Konig's theorem it has a vertex cover of size at most two. Such a cover cannot contain a Z vertex: one Z vertex plus one W vertex leaves one of the other two Z vertices with an uncovered edge, since each has at least two W neighbors; two Z vertices leave the third uncovered. Therefore all J edges lie on a fixed pair R={r1,r2} of W vertices. Every Z vertex has exactly those two W neighbors.

Write W-R={t1,t2}. If t1t2 exists, take M={r1z1,r2z2,t1t2}; otherwise take M={r1z1,r2z2,vt1}. In both cases Q={v,r1,r2} covers every link edge outside M and |M|=|Q|=3. The corresponding balanced singleton reduction forces equality blocks. On {v} union W the residual is again K5 with one or two edges removed, contradiction.

This excludes independent Z in both core types.

### 8.2 Z contains an edge pq and B=K6-ab

Use a four-packing of B together with upq, and set
X=E(W) union {uv} union uZ union {pq}.
This is a balanced five/ten reduction. The residual has W independent and pq absent.

Let F be the external W-pages. The proof of Section 4 applies verbatim, with upq appended to every displayed packing: a cd-page gives six triangles; a disjoint pair of other pages plus a local three-packing gives six. These packings are compatible even if page apices are in Z, because their edges to W are distinct from up,uq,pq. Residual block avoidance is unchanged. Hence the same five-edge cover covers B and F.

Adding uZ and pq gives an increment of nine over the residual cover. This contradicts the balanced value ten.

### 8.3 Z contains an edge pq and B=K6

Let Z* be the vertices of Z having at least one W neighbor.

If |Z*|<=2, choose a two-element set Y in Z containing Z*. The edge set
X=E(W) union {uv,pq} union {uy:y in Y}
has size ten and covers every triangle incident to u or v. Indeed any edge within the three-vertex graph G[Z] has an endpoint in Y, and all Z-W edges meet Z*. A four-packing of B plus upq gives a balanced five/ten reduction.

An external W-page appends to a core four-packing avoiding its base and to upq, giving a contradiction. Thus there are no such pages. Replace the seven core-cover edges E(W) union {uv} by a six-cover of B; retain pq and the two uY edges. The increment is nine, another contradiction.

It remains that all three Z vertices have W neighbors. Let r be the third vertex of Z and choose a in N(r) intersect W. Take a four-packing of B avoiding ua, together with upq and ura. Set
X=E(W) union {uv} union uZ union {pq,ra}.
This is a balanced six/twelve reduction. In its equality residual K, W is independent and pq,ra are absent.

Any external W-page with base f not incident to a combines with a core four-packing avoiding both ua and f (these are disjoint edges), together with upq and ura. This gives seven triangles. Their residual footprint is at most one edge per block, so this is impossible. Thus every external W-page has its base in the star at a within W.

Write W={a,b,c,d}. Suppose two such pages have distinct bases, say ab and ac. If their apices coincide at x, graph closure gives the external bc-page, already excluded. If their apices differ, the two pages are edge-disjoint. The core three-packing
adv, ubv, ucd
avoids ua,ab,ac. Append upq,ura and the two pages to obtain seven triangles. The pages have at most two residual edges per block, sharing its unique W vertex, so residual maximum block packings avoid them. This is again a contradiction. The same argument handles any two distinct star bases by relabeling.

Consequently all external W-pages have a single base, or there are none. A six-edge minimum cover of K6 can contain any specified edge: place its endpoints in the same three-vertex part of a 3+3 partition. Choose that cover to contain the possible page base. It covers B and every external W-page. Adding uZ,pq,ra and a residual K-cover covers every lost triangle, including those on pq and ra. Its increment is eleven, contradicting twelve.

All cases are excluded, proving P8.

**Corollary P8.** Every 5-degenerate graph of maximum degree at most eight satisfies S. This is an equality result beyond the exact frozen classes; its inequality is already included in Kandasamy's reported maximum-degree-ten theorem. The ordinary proof here is self-contained from the audited TUZA-04 minimal-obstruction lemmas and elementary Konig, without relying on that recent preprint's computation.

**Review status:** complete ordinary proof candidate, self-reviewed only at time of writing. No numerical search or external endorsement is claimed. The next requested investigation concerns pair overlaps and degree-six neighbors at the two nondominating positions; no conclusion about those degree-six positions is asserted by P8.

## 9. Nondominating degree-six neighbors

Suppose v has degree five, its link is K5-ut, and u is one of the two nondominating positions. Thus N(v)={u,t,a,b,c}, with ut absent. Suppose d(u)=6. Its remaining two neighbors are p,q, both outside N[v], and W={a,b,c} is the common neighborhood. In G-u, the vertices {v,t,a,b,c} induce K5.

If pq is present, in the link at u take matching M={pq,va,bc} and Q=W. The link outside Q consists just of the possible edge pq, which is in M. Hence the singleton reduction has packing size three and cover increment six. Its equality residual contains K5 on {v,t,a,b,c} with va,bc deleted, impossible by the obstruction in Section 8.

If pq is absent, the edges up and uq have codegree at least two, so p and q each have at least two neighbors in W. Choose distinct a in N(p) intersect W and b in N(q) intersect W, and let c be the third W vertex. Use M={pa,qb,vc}, Q=W. Again the singleton reduction is balanced three/six, and its residual contains that K5 with only vc deleted. Contradiction.

Together with Section 6 and P8, this proves that every neighbor of a degree-five vertex has degree at least seven, and every dominating neighbor has degree at least nine.

## 10. Overlap restriction for nonadjacent degree-five vertices

**Proposition O.** Two nonadjacent degree-five vertices x,y have at most three common neighbors. If they have exactly three, both links must be K5.

Write C=N(x) intersect N(y). The two links are K5 or K5 minus one edge by the frozen local analysis. No assumption is made about other degrees.

### 10.1 Five common neighbors

Their common neighborhood A has five vertices and is K5 or K5-ab. Delete x,y and E(A); the cover increment is |E(A)|.

When A=K5 on {a,b,c,d,e}, the six triangles
xbc, xde, ybd, yce, abe, acd
are disjoint. The cover increment ten is strictly smaller than twelve.

When A=K5-ab, omit abe from that list. The remaining five triangles exist and the cover increment nine is strictly smaller than ten.

### 10.2 Four common neighbors

Write W=C and let p,q be the respective unique neighbors outside the common neighborhood. The graph on W is K4 or K4 minus one edge. It has two edge-disjoint perfect matchings, so four triangles, two at each center, form a packing.

Take X=E(W) union {xp,yq}. It meets all triangles at x,y and contains the noncentral edges of this four-packing. If W has five edges this is strict, with |X|=7.

If W=K4, the reduction is balanced four/eight and the residual has equality blocks with W independent. The vertex p has at least three neighbors in W, because the link at x misses at most one edge. Thus there is a page p f on some W-edge f. The graph on {x,y} union W is K6-xy. Since xy and f are disjoint, it has a four-packing avoiding f. Append the page and compatible residual block packings, giving nu(G)+1. Contradiction.

### 10.3 Three common neighbors, a missing edge inside C

If a common edge ac is absent, write C={a,b,c}, N(x)-C={p,q}, N(y)-C={r,s}. Both links are precisely K5-ac; all edges required below therefore exist. The pairs p,q and r,s are disjoint, because C is exactly the common neighborhood.

Use
P={qab,bcr,xpa,xqc,yar,ycs}
and
X=E(qab) union E(bcr) union {qc,pa,ar,cs,xp,ys}.
The six triangles are disjoint and |X|=12. It covers every triangle incident to x or y: xp handles the p-pages at x, qa,qb,qc handle its q-pages, ab,bc handle its C-triangles; the y side is analogous. Every noncentral P-edge lies in X. Thus the residual has equality blocks.

Now use the seven edge-disjoint triangles
xpa, qab, pbc, xqc, yar, ysb, rsc.
Their edges surviving in the residual are exactly pb,pc,sb,rs. Every pair of these except pb,sb requires an absent residual edge to be in a common clique block: pb/pc requires bc, sb/rs requires br, pb/rs requires br, pc/sb requires bc, and pc/rs requires cr. Those edges were deleted. Hence each block contains at most two forbidden edges and the only possible pair shares b. Standard block avoidance appends the seven-packing, contradiction.

### 10.4 Three common neighbors, a missing edge outside C

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

## 11. The global peeling reduction and final local configuration

This section records a proposed closure of the full 5-degenerate target. Every preceding local result must be independently checked before this conclusion is accepted.

Let G be a minimal S failure among 5-degenerate graphs. Let L be its set of degree-five vertices. It is nonempty by degeneracy and the frozen minimum-degree-five bound. Section 6 makes L independent. All its neighbors have degree at least seven by Section 9.

The subgraph G-L is nonempty and 5-degenerate. Choose u in it with at most five neighbors in G-L. Set A=N(u)-L, d=d(u), r=|N(u) intersect L|. Then |A|<=5 and r>=d-5. Since u is adjacent to a low vertex it has d>=7, so r>=2.

For each v in N(u) intersect L, put A_v=N(v) intersect A. If u dominates v, |A_v|=4; otherwise |A_v|=3, and v has one further neighbor p_v outside N[u]. These descriptions use the precise K5/K5-minus-edge links. For distinct low vertices v,w, the sets A_v,A_w intersect in at most one vertex. Indeed two common A vertices together with u give at least three common neighbors. Proposition O excludes this if either link is a near-clique. If both links are cliques, both A sets have size four in an at-most-five-element set, so their intersection has size at least three and there are at least four common neighbors, again excluded.

There can be at most two subsets of an at-most-five-element set, each of size at least three, whose pairwise intersections have size at most one. To see this, two must each have size three, meet in one point and exhaust five points. Any third three-set would have total intersection size at least three with their union, whereas meeting each in at most one allows at most two. Thus r=2, d=7, |A|=5, and both A sets are triples meeting in exactly one vertex.

Label
A={a,b,c,d,e},
N(v)={u,p,a,b,c},
N(w)={u,q,a,d,e},
N(u)={v,w,a,b,c,d,e}.
The low vertices v,w have near-clique links missing up,uq respectively. The vertices p,q lie outside N[u] and are distinct: if they were equal, v,w would have three common neighbors u,a,p and Proposition O would exclude them. The sets {a,b,c} and {a,d,e} are triangles.

### 11.1 The four cross edges are forced

Suppose one of the four edges joining {b,c} to {d,e} is absent. Relabel within each pair so that ce is absent.

In the link at u, choose M={vc,we,ab}, Q={a,b,d}. Outside Q the vertices are v,c,w,e, whose only edges are vc and we: vw,ve,wc are absent by the displayed neighborhoods and ce is absent by assumption. Hence this is a balanced singleton three/six reduction.

The residual contains K5 on {v,p,a,b,c} with vc and ab deleted. The other deleted edge we is outside this vertex set because p lies outside N[u]. This is impossible for the equality block classification. Thus all four cross edges exist and A is K5.

### 11.2 The final eight-vertex graph B

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

### 11.3 External-page augmentation closes the configuration

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

## 12. Proposed resulting theorem and review boundary

**Theorem candidate.** Every finite simple 5-degenerate graph G satisfies tau(G)<=2nu(G). Equality holds if and only if every nonempty triangle component is the full triangle family of a K4 or K5. Triangle-free background edges are allowed.

The forward implication follows from the minimal-obstruction proof above and the frozen local lemmas. The reverse implication follows by additivity of the packing and cover numbers over the disjoint edge supports of triangle components, using (nu,tau)=(1,2) for K4 and (2,4) for K5.

At this historical stage this was an ordinary proof candidate pending separate audit and formalization. No Lean verification or external expert review was claimed at that stage. No new computation was used to obtain the certificates in Sections 9–11; the explicit witnesses and symmetry argument carry the ordinary proof. Subsequent final status and publication verification are recorded separately.

The degree-eight result of Section 8 is no longer needed for the global argument: the latter uses degree-five independence, the degree-six neighbor exclusion, and Proposition O. P7/P8 remain valid subsidiary candidates and useful alternate reductions, subject to the same review.
