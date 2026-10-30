> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Equality route: local restrictions on a minimal failure of S

TUZA-04 working proof note, 30 October 2026. Frozen source: reference at 97e913008e466de14f61437d8dae774946d92e8f. Status: complete ordinary proof candidate, independent adversarial review requested. No Lean verification or computational evidence is asserted.

## Definition and logical scope

S is the conjunction of Tuza's inequality for all finite simple graphs and the assertion that each nonempty triangle component of an equality graph is exactly the face family of K4 or K5. Components mean connectedness through shared graph edges. Triangle-free background edges are permitted. Let G be a counterexample to S of minimum edge count, and remove isolated vertices. All proper edge-subgraphs satisfy S. This is a hypothetical minimal obstruction, not an assertion that S has been proved.

The deductions below show that G has connected triangle support, tau(G)=2nu(G), every edge is packing-stable and cover-critical, every edge belongs to at least two triangles, and every vertex has degree at least five. The last conclusion concerns the triangle support; no triangle-free edge survives the minimality reduction.

## Block avoidance facts

In a K4, a maximum packing has one triangle and can avoid any star of forbidden edges by taking the face opposite its center. It can in particular avoid any one edge or any two adjacent edges.

In K5, a maximum packing has two triangles and can avoid any two edges. Up to relabeling, forbidden adjacent edges are 12,13; choose triangles 145,234. Forbidden disjoint edges are 12,34; choose triangles 135,245. These pairs are edge-disjoint and avoid the prescribed edges. The assertion for zero or one edge follows by enlarging the forbidden set to two edges.

Minimum covers in K4 and K5 can contain any prescribed edge: for K4 take that edge and its opposite; for K5 choose a bipartition with classes of sizes 2 and 3 whose size-2 class is the prescribed edge's endpoints, and take all edges inside classes (four edges). The complement is K2,3, so this is a minimum cover. For edges in different triangle components, these choices combine independently.

## 1. Tight-critical reduction (audited short deduction)

A triangle-free edge may be deleted without changing either optimum or the triangle components, contradicting minimality. Likewise, if there were more than one triangle component, each proper component support satisfies S; summing their nonnegative slacks would establish S for G. Thus G has connected nonempty triangle support.

Put h=nu(G). A failure of S has tau(G)>=2h. If nu(G-e)=h-1, minimality gives tau(G)<=tau(G-e)+1<=2h-1, impossible. Hence nu(G-e)=h for every edge e.

If tau(G-e)=2h for some e=xy, minimality classifies all its triangle components as K4 or K5. Since e belongs to a G-triangle, let xyw be one. The two old wedge edges xw,yw cannot belong to the same clique block, since xy is absent. In each block choose a maximum packing avoiding its possible single wedge edge; combine over blocks and append xyw. This gives h+1 triangles in G, contradiction. Thus tau(G-e)<=2h-1. Since deleting one edge decreases a cover optimum by at most one, tau(G)=2h and tau(G-e)=2h-1 for every e. This uses no global Tuza induction assumption beyond the minimality of the chosen S failure.

## 2. No edge lies in exactly one triangle

Suppose uv belongs only to uvw. Let K=G-{uw,vw}. The edge uv is triangle-free in K, so any K-packing can be appended by uvw. Thus nu(K)<=h-1. Deletion and minimality give

2h-2 <= tau(K) <= 2nu(K) <= 2h-2.

Consequently nu(K)=h-1, tau(K)=2h-2, and K has only K4/K5 triangle components. Every block meets U={u,v,w} in at most one vertex: uw,vw are absent, and uv is triangle-free in K.

Let F be the full family of triangles of G absent from K. Every F-triangle contains w and uses uw or vw. If nu(F)=1, the standard intersecting-triangle classification says that F has a common edge or consists of faces of a K4. In the second case, since uvw belongs to F and all F-triangles contain w, absence of a common edge forces the three faces wuv,wux,wvx. Their edges force the G-triangle uvx, contradicting uniqueness of uvw. Thus F has a one-edge cover. Combining it with a K-cover contradicts tau(G)=2h.

Otherwise choose two edge-disjoint F-triangles. A K4 block has a face avoiding its possible U vertex and therefore both triangles. Each F-triangle uses at most one edge in any block (all its old edges meet U and a block meets U at most once); a K5 block can avoid the at most two edges used by the pair. Combine these maximum block packings with the two F-triangles to obtain h+1 triangles in G, contradiction.

## 3. Complete links K3 and K4 isolate clique triangle components

### Link K3

Suppose N(v)={a,b,c} and its induced graph is K3. Set K=G-v-ab. A K-packing plus vab is a G-packing, while a K-cover plus {ab,vc} is a G-cover. Equality of G and minimality force nu(K)=h-1, tau(K)=2h-2, and K4/K5 components in K.

Suppose abx is a triangle for x outside {v,a,b,c}. Then abx and vbc are edge-disjoint. Their edges present in K are bc,ax,bx. Since ab is absent, no clique block contains both a and b. A block sees at most two of these forbidden edges, and if two they are bc,bx, adjacent at b. The block avoidance facts therefore give a maximum K-packing compatible with abx,vbc, contradicting nu(G)=h. By symmetry none of ab,bc,ca lies in any external triangle. Since v has exactly these three neighbors, every triangle sharing a K4 edge lies inside the K4 on v,a,b,c. It is an isolated triangle component, contradicting connectedness/minimal failure.

### Link K4

Suppose N(v)={a,b,c,d} induces K4. Set K=G-v-{ab,cd}. The two triangles vab,vcd append to a K-packing. A K-cover plus {ab,cd,va,vb} covers G: all triangles through v either use va or vb or are vcd; triangles not through v but absent from K use ab or cd. Hence equality forces nu(K)=h-2, tau(K)=2h-4, and the residual block classification.

An external triangle abx, with x outside {v,a,b,c,d}, combines with vac,vbd. Its old forbidden edges are ac,bd,ax,bx. Since ab is absent, a and b cannot occur in one clique block. A block sees at most two forbidden edges, necessarily adjacent at a or b. Thus maximum residual packings combine with these three triangles, contradiction. Varying the perfect matching {ab,cd} excludes external triangles on every one of the six rim edges. Since all neighbors of v are listed, the K5 is an isolated triangle component, again impossible for a minimal failure.

## 4. Diamond link is impossible

Suppose N(v)={a,b,c,d} induces K4-ab, with c,d the degree-three vertices of the diamond. Set K=G-v-{ac,bd}. Append vab is NOT valid because ab is absent: the actual packing used is {vac,vbd}. The cover increment is {ac,bd,vc,vd}. It covers all triangles through v because every link edge meets c or d, and covers every other triangle lost from K via ac or bd. Thus nu(K)=h-2, tau(K)=2h-4 and residual blocks are K4/K5.

Suppose acx is an external triangle (x outside {v,a,b,c,d}). Combine it with vad,vbc. These three triangles are edge-disjoint. Their old edges are ad,bc,ax,cx. Because ac is absent in K, no block contains both a and c. Consequently each block sees at most two forbidden edges; the only possible pairs are ad,ax (at a) or bc,cx (at c). Maximum block packings avoid them, yielding h+1 triangles in G, contradiction.

By symmetry and by choosing the matching {ad,bc} instead when required, no external triangle uses any of ac,ad,bc,bd. Return to K=G-v-{ac,bd}. A K-cover plus {vc,vd,cd} now covers G: the first two hit every triangle through v; any triangle not through v lost by deleting ac or bd is the local acd or bcd, hit by cd. This gives tau(G)<=2h-1, contradiction.

## 5. Four-cycle link is impossible

Suppose N(v)={a,b,c,d} induces the cycle abcd. Put K=G-v-{ab,cd,da}, retaining bc. Append vab,vcd to a K-packing. A K-cover plus {ab,bc,cd,da} covers G. Equality therefore forces nu(K)=h-2,tau(K)=2h-4 and K4/K5 components.

The edge bc lies in some triangle bcx other than vbc, by Section 2. This triangle survives in K: x cannot be a or d since the diagonals ac,bd are absent, and none of its edges is among ab,cd,da. Hence bc belongs to a K4 or K5 triangle block. Choose a minimum K-cover containing bc and add only ab,cd,da. The result covers G with 2h-1 edges, contradiction.

## 6. Minimum degree conclusion

Every edge has triangle codegree at least two by Section 2, so every vertex of each link has degree at least two. A nonempty link on at most four vertices is K3, C4, K4-minus-an-edge, or K4; these are exactly the cases excluded above. Therefore delta(G)>=5.

## 7. Scope, novelty and next obstacle

This is an equality-aware version of the small-degree reduction. It does not prove S, R, stable-remainder strictness, OCT-five, or any new bounded-degree Tuza theorem. It gives structural restrictions on a minimal counterexample to the stronger global statement S, whose minimality supplies the full K4/K5 classification for proper subgraphs. It cannot be transferred to a minimal stable-restoration counterexample without proving that its deletion family stays in a class where the required equality classification is available.

Cui, Haxell and Ma, Packing and Covering Triangles in Planar Graphs, Graphs and Combinatorics 25 (2009), 817-824, published online 2010, https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf, prove planar equality classification into K4 triangle components. Their Sections 2-3 use equality induction and prescribed-edge minimum covers; their Lemma 2.4 excludes two own-edges in one triangle, and their subsequent link path/cycle arguments exclude small configurations. The present proof adapts that mechanism to residual K4/K5 blocks and uses explicit K5 two-edge avoidance plus external-page augmentation. Historical novelty is unestablished; the exact minimum-obstruction formulation was not found in the targeted check.

Puleo, Tuza's Conjecture for graphs with maximum average degree less than 7, European Journal of Combinatorics 49 (2015), 134-152, https://doi.org/10.1016/j.ejc.2015.03.006, gives minimum-degree and robust-link restrictions for a minimal counterexample to Tuza itself. Those are not automatically restrictions on a failure of equality classification. Gupta arXiv:2608.06538v1 and Kandasamy arXiv:2610.15269v1 build on that reducible-set framework. Kandasamy's October 2026 preprint asserts the maximum-degree-ten Tuza theorem, not a K4/K5 equality characterization. No claim here supersedes those results.

A next structural question is whether every weak Konig-Egervary link in a minimal S failure forces a K4/K5 triangle component. The proof above handles every connected link of order at most four; general WKE witnesses can have many matching edges, and old K5 blocks cannot necessarily avoid arbitrarily many forbidden edges. This is a genuine named obstruction to blindly extending the two-page argument.

## Essential-edge equality isolation audit

For J=H+abc with D(H) tripartite, tau(H)=2h-1, tau(J)=2nu(J)=2h+2 and an essential edge e of H, manuscript Section 7 forces e=pq, exactly two universal page apices p,q, and h-1 K4 blocks exhausting H-pq. Any block meeting the K5 on {a,b,c,p,q} can meet only on an old spoke pu or qu: no block contains p,q or two terminals. If it contains pu, cover this block by pu and its opposite edge, all others with two edges, and add pq,qu,vw where {u,v,w}={a,b,c}. These choices cover all old triangles via pq plus the blocks and every new K5 triangle via pu,pq,qu,vw, with 2h+1 edges, contradiction. Thus all K5 spokes avoid all old blocks. If an additional old pq-page pqz has z outside {a,b,c}, choose old block faces avoiding p,q and append abp,acq,pqz, obtaining h+2 triangles, contradiction. Hence the old pq-book has exactly three pages and the completed K5 is isolated; remaining triangle components are K4s. This is a new short deduction from accepted premises, not an independent major discovery.

## Failed directions / computations

No computation or Lean check was run by this route as of this note. Cone-over-triangle-cactus extension does not enlarge the named slack-one star cores: if the base is a triangle cactus with b triangle blocks, cone packing is b and cover is b plus the minimum vertex transversal of the base triangle blocks. Slack one forces the block-intersection graph's minimum vertex cover to have size one, hence a star with at most three leaves on distinct vertices of the central triangle. This was only a hand derivation and is not promoted here as a separately reviewed theorem.

## 8. Link-component strengthening and transfer to restoration R

The proofs of Sections 3-5 apply to a connected component C of the link G[N(v)], not just to the entire link. Replace deletion of v by deletion of precisely the spokes vu with u in C. No triangle through v uses vertices in different link components. All packing, cover and block-forbidden-edge arguments are unchanged. If an external apex is another neighbor of v, its incident rim edge would connect it to C; thus every external rim page considered in the proofs is genuinely outside C. Consequently a minimal failure of S is robust: every component of every link has at least five vertices. This strengthening was identified and independently checked by the separate literature/review agent.

More relevantly, let R be the equality classification for graphs J=H+E(T), where D(H) is tripartite and T is restored on independent U={a,b,c}. Suppose R fails and choose a failure minimizing the number of old edges |E(H)|. Any deletion A of old edges leaves J-A=(H-A)+E(T) in the accepted one-triangle class, so it satisfies Tuza. If equality holds after a nonempty old-edge deletion, minimality gives the K4/K5 triangle-component classification. No induction on arbitrary graphs is assumed here.

After discarding isolated vertices, we may assume every old J-edge belongs to a J-triangle, by deleting triangle-free ones, and that J has exactly one triangle component, containing T. Indeed any component not containing T has tripartite full triangle hypergraph, so its slack is nonnegative and equality makes it K4. The T-component also satisfies the one-triangle theorem. Thus equality of J splits into equality of all components; a failure must lie in the T-component and all others may be deleted.

Let v be outside U with at most one neighbor in U. Every triangle through v is old. If an edge incident v had codegree one in J, its sole triangle would be old, so the two-edge deletion in Section 2 deletes only old edges. That proof applies verbatim. In particular, every vertex of the link J[N(v)] has degree at least two.

All local spokes and rim edges used in Sections 3-5 are old, since a rim edge could be restored only if both endpoints belonged to U. Hence all residual equality classifications invoked there are legitimate by old-edge minimality. A locally isolated K4/K5 component cannot contain T (its vertices meet U at most once), so it contradicts the single T-component normalization. Therefore every link component at v has order at least five, and d_J(v)>=5.

Finally, J[N(v)] is 3-colorable: color a neighbor w by the rainbow edge label of vw in H. If wz is a link edge, v,w,z form an old triangle, so vw and vz have different labels. This uses 3-partiteness of the FULL triangle hypergraph of H, not ordinary graph tripartiteness.

**Restoration-specific structural reduction:** an old-edge-minimal counterexample to R has no vertex of degree at most four outside U and the set of page apices (vertices adjacent to at least two terminals). Its remote links are robust and properly 3-colorable. This is an ordinary proof, conditional only on the accepted one-triangle theorem and short block facts; it does not establish R.

## 9. Five-vertex remote links: only K_{2,2,1} remains

Assume v is as in Section 8 and d_J(v)=5. Its link L is connected (all components have size at least five), has minimum degree at least two, and is 3-colorable. Up to isomorphism, the complement of L is one of

- 2K2+I;
- P3+K2;
- P4+I;
- P5;
- C3+K2;
- C3+2I;
- C4+I;
- C5.

Reason: the complement has maximum degree at most two. A proper 3-coloring of five vertices has a size-three class (a triangle in the complement) or two size-two classes (a matching of size two in the complement). Enumerating the path/cycle components under these two alternatives gives exactly the list. A separate finite check may verify the list, but no computation was used to derive this note.

For each WKE witness below, delete all local v-spokes and the matching M. A packing of |M| triangles vxy, xy in M, survives alongside every residual packing. A cover of the residual plus M and the spokes vq for q in Q covers J whenever L-Q is a subgraph of M. If |Q|=|M|, equality forces residual K4/K5 blocks with packing number nu(J)-|M|. If |Q|<|M|, the same inequalities already give strictness.

### Four dense WKE types: explicit augmentations

All rows have |M|=|Q|=2. The displayed packing consists of three edge-disjoint triangles. Its old forbidden edges are those not among the deleted v-spokes or M. A clique block can meet those edges only in the subsets described; the K4/K5 avoidance facts then append all three triangles to a maximum residual packing, contradiction.

| Link L | M | Q | Three-triangle packing | Old forbidden edges | Largest possible block overlap |
|---|---|---|---|---|---|
| K2,3 with sides {p,q},{b,c,x}, plus bc | {bc,px} | {p,q} | pbc, vqb, vpx | pb,pc,qb | at most one (bc deleted, pq absent) |
| K5 minus ab,bc,cd (complement P4+I; e universal) | {bd,ce} | {a,e} | ace, vad, vbe | ac,ae,ad,be | only possible pair ae,ad, adjacent at a |
| K5 minus ab,bc,cd,de (complement P5) | {ac,bd} | {a,e} | ace, vad, vbe | ae,ce,ad,be | at most one |
| K2,3 with sides {p,q},{a,b,c}, plus pq | {ap,bq} | {p,q} | apq, vbp, vcq | aq,pq,bp,cq | only possible pair pq,cq, adjacent at q |

For example, in the second row any block containing ac and ae would contain the deleted ce; ac and ad would require absent cd; ac and be would require absent ab (also deleted ce); ae and be would require absent ab; ad and be would require deleted bd. Thus ae,ad is the only allowed pair, and no triple is possible. The analogous pair exclusions in every row follow directly from the displayed missing or deleted edges.

### Three sparse types (independent reviewer derivations)

1. Bowtie L=abc union ade (complement C4+I): M={bc,de}, Q={a}. The cover increment has size three versus a compatible two-triangle packing. This is already strict, so equality is impossible.

2. L=K2,3 with sides {a,b},{c,d,e} (complement C3+K2): use M={ac,bd}, Q={a,b}. If acx is an external rim page, combine it with vad,vbe. The old forbidden edges are ad,be,ax,cx. The absent edges ac (deleted), ab,cd,ce make every pair impossible except ad,ax, adjacent at a. Hence an external page gives a three-triangle augmentation. By symmetry no rim edge has an external page. Since K2,3 has no rim triangle, any rim edge is then in just its v-triangle, contradicting the no-own-edge result (for this use, the two other edges in that sole triangle are old).

3. L=C5 with rim abcde (self-complementary): M={ab,cd}, Q={c,e}. An external abx combines with vbc,vde. The old forbidden edges are bc,de,ax,bx. The absent/deleted edges ab,cd,ad,bd ensure the only possible pair in a block is bc,bx, adjacent at b. Hence no external rim page exists, by symmetry. A rim has no local triangle, again contradicting no-own-edge.

Thus all seven WKE types are excluded. The remaining link is K_{2,2,1}=K5 minus two independent edges. Consequently a degree-five remote vertex in an old-edge-minimal R failure must have exactly this link.

## 10. The K_{2,2,1} exception and terminal caveat

This exception is not a claimed irreducible configuration. Puleo Proposition 5.1, proof Case 1 (arXiv:1308.2211v3), has a singleton reduction: write the missing link edges ab,cd and the fifth link vertex e. The four triangles vbd,vac,ade,bce are edge-disjoint. Deleting all eight link edges plus the v-spokes leaves a residual to which that packing appends; all eight link edges are a cover increment of size eight. Thus equality again forces residual K4/K5 blocks. The obstruction to a strict inequality is the external triangle family on those eight deleted rim edges. Naively replacing the eight-edge cover by a small cover of the six-vertex local graph ignores those external triangles.

A residual block meets the five link vertices in at most one vertex. It can touch at most one external page on a fixed rim edge ac: if it contained a and two ac-page apices x,y, the triangle cxy would share the block edge xy and violate the block-component classification. This resembles the essential-edge free-page mechanism, but coordinating several rim-edge families has not been completed. No exclusion of K221 is asserted.

For a terminal a in the exact-two-apex setting, the degree-five link shape can be K2,3+bc with sides {p,q},{b,c,x}, where bc is restored. Although this link is 3-colorable, the reduction in Section 9 deletes bc and also terminal spokes ab,ac. Those are restored edges, so the residual does not stay in the fixed one-triangle class. In fact its size-two WKE Q is forced to be {p,q}, leaving bc and forcing it into M. An old-only replacement is needed. This is a precise scope obstacle, not a proof that the terminal shape is possible.

## 11. K221 exception closed by external-page pairing

This supersedes the unresolved status of K221 in Section 10, while retaining that failed stopping point as provenance. Both this route and the separate adversarial reviewer independently developed the following argument. A finite check of the 28 rim-edge pairs is being performed separately by the root agent; the ordinary proof has four symmetry cases and does not depend on assuming the computation succeeds.

Let C be a link component K221 at v, write C={a,b,c,d,e}, with missing edges ab,cd, and put W=C union {v}. The induced local graph B is K6 minus ab,cd. Delete every B-edge to obtain K. The four edge-disjoint triangles vac,vbd,ade,bce append to any K-packing. Adding all eight rim edges E(C) to a K-cover covers the original graph: any triangle lost by deleting a v-spoke is local, because C is a link component. Thus equality forces nu(K)=nu(J)-4 and tau(K)=2nu(K), so its triangle components are K4/K5. Every residual clique block meets W at most once because W is independent in K.

Let F be all triangles with a rim edge and an apex outside W. All triangles of J absent from K are either triangles of B or members of F. The local graph B has the four-edge cover {va,vb,ec,ed}, the edges inside the bipartition {v,a,b}/{e,c,d}. Consequently tau(J)=2nu(K)+8 implies tau(F)>=4.

A pair of distinct rim edges is BAD if it is one of

{ac,bd}, {ad,bc}, {ae,be}, {ce,de}.

For every other (GOOD) pair f,g, B-{f,g} has three edge-disjoint triangles. Up to swapping a,b, swapping c,d, and exchanging the two parts {a,b},{c,d}, four representatives and packings are:

| Deleted pair | Three-triangle packing |
|---|---|
| ac,ad | vae, bce, vbd |
| ae,ce | bde, vad, vbc |
| ac,ae | bde, vad, vbc |
| ac,be | ade, vbd, vce |

The bad pairs have packing number two: for ae,be every remaining triangle uses v and the remaining link has matching number two; for ac,bd the only rim triangles are ade,bce, and after deleting either such triangle's three edges the remaining rim edges form a triangle, with matching number one. A three-packing cannot consist of three v-triangles (only five v-spokes), or two rim triangles plus a v-triangle (only six remaining rim edges). Symmetry covers the other two pairs. Exact values of bad cases are not needed for the exclusion; only the displayed good-pair packings are used.

**External-page lemma.** If no two edge-disjoint F-triangles have a good pair of rim bases, then tau(F)<=2.

Proof: if F is pairwise edge-intersecting, the standard two-edge cover lemma applies. Otherwise choose two disjoint pages on bases f,g. Their bases must be bad partners. Any page on a third base must meet both chosen pages, since its base is good with each bad partner (the bad-pair graph is a matching). An intersection between pages on distinct bases requires the same external apex and intersecting bases.

If f,g are adjacent bad partners ae,be (or ce,de), disjointness requires their external apices to differ. No third-base page can meet both; all F-pages use f or g, which form a two-edge cover. The same reasoning handles disjoint bad partners with distinct apices.

For disjoint partners ac,bd with common apex x, any third base meeting both can only be ad or bc: ab and cd are nonedges, and a base through e cannot meet both disjoint pairs. The third page has apex x. Its presence forces every page on ac or bd also to have apex x, or it would make a good disjoint pair with that third page. The other possible third base likewise has apex x by its requirement to meet the initial pair. Thus all pages are at x over the four-cycle ac,cb,bd,da, and {xa,xb} covers F. If no third base occurs, {ac,bd} covers F. Symmetry handles partners ad,bc. This proves the lemma.

Since tau(F)>=4, choose two edge-disjoint external pages on a good base pair f,g. Append the displayed three-packing in B-{f,g}. These five triangles are pairwise edge-disjoint. They can also be appended to a maximum K-packing: the local three triangles use only deleted edges; each external page meets a residual clique block in at most one old spoke; if a block meets both pages, its two forbidden edges share the block's unique W vertex. A K4 avoids this star, and a K5 avoids any two edges. Choosing these block packings simultaneously gives nu(K)+5=nu(J)+1, contradiction.

Therefore a K221 link component is impossible. Combining Sections 8-11 gives the stronger restoration-specific theorem:

**Remote-link theorem.** In an old-edge-minimal failure of equality classification R, every vertex v outside U with at most one U-neighbor has all link components of order at least SIX. For nonisolated v, in particular d_J(v)>=6.

This theorem is a structural reduction, not R itself. Its novelty is qualified: it extends the equality-induction mechanisms of Cui--Haxell--Ma and the local reductions of Puleo to the restoration class, with explicit compatibility and an external-page lemma. No exact predecessor was identified in the targeted primary-source checks; this is not a novelty certificate.

## 12. Review and evidence updates

Root independently checked all 1,024 labeled graphs on five vertices: 212 have minimum degree at least two and are 3-colorable, representing the eight types used above. All 28 K221 rim-edge pairs were checked by exact recurrence and independently by direct subsets of triangles; exactly the four bad pairs in Section 11 occurred. Files: check_local_links.py, local_links.json, local_links.log. An initial prediction of only two bad pairs failed its assertion; check_local_links.initial.py and local_links.initial.log preserve that failed hypothesis. No finite computation is being used as a replacement for the unbounded proof. This route itself ran no graph computation or Lean build.

A fresh independent reviewer caught the need to discard isolated vertices in the R degree statement: old-edge minimality alone does not remove isolates. The statement now includes that normalization; alternatively its degree bound is only for nonisolated vertices.

The clean complete proofs and strongest corollaries are consolidated in EQUALITY_THEOREMS.md. They include S for 4-degenerate graphs and for 5-degenerate graphs excluding K6-minus-one-edge as a (not necessarily induced) subgraph; K5-free 5-degenerate equality rigidity is a corollary. These ordinary proofs do not require Aharoni/HNS. Their transfer to R uses the accepted one-triangle theorem.

## 13. Scope of the next local obstacles

In any classified equality residual J'=H'+T with D(H') tripartite, at most one K5 component exists and it contains all of T. Indeed a K5 with no restored edge would lie in H', impossible: at any vertex of a K5, the four incident edge labels would have to be pairwise distinct to make all triangles rainbow. If a K5 component contains a restored edge, it contains T because T shares that edge and all triangles in the component belong to that block.

In the exact two-apex case with nonadjacent p,q, there is no such K5 component at all: a K5 containing T requires two universal page apices, necessarily p,q, and would require the absent edge pq. Thus classified residuals have only K4 blocks. For local deletions making a vertex set W independent, every residual K4 block meets W at most once and its maximum face avoids arbitrarily many external spokes at that vertex. This removes the two-edge avoidance limitation in that exact subclass. It does not force the residual to be equality.

If a deletion avoids all six boundary spokes, the exact T-plus-six-pages family survives, which cannot fit a K4 triangle component. Such an equality residual would therefore be impossible in a minimal exact-two-apex obstruction. Deletions at a remote vertex with no U-neighbor are of this type. A remote vertex with one U-neighbor can have a boundary spoke as a deleted rim edge; its classified K4 residual remains possible. Do not transfer every published local reduction without checking this distinction.

The remaining five-vertex links K5 and K5-minus-one-edge explain why an unrestricted 5-degenerate equality theorem is not immediate. In the local cone B=K6-minus-ab with hub v not incident with ab, no ordinary singleton reduction at v using only triangles of B fits the packing/cover budget. A packing has at most two v-triangles. For four packed triangles its outside-v footprint has eight rim edges, exhausting the eight-edge budget but leaving the ninth rim's v-triangle uncovered. For three packed triangles it must have two hub triangles and one rim triangle, requiring five rim edges and at most one added spoke; the four uncovered rims would have to form a full star at a universal rim vertex w. All packed triangles would then lie in K5-minus-ab on the remaining vertices, whose packing number is two, contradiction. For two hub triangles, the required two rim edges form a matching, but deleting at most two link vertices leaves a three-vertex graph with at least two adjacent edges, not a subgraph of that matching; combinations involving base triangles exceed the budget or leave uncovered hub triangles. The cases with at most one triangle are immediate. The analogous count for local K6 is at least as obstructed.

This is a limitation of the specified local singleton template. It is not a claim that a larger ambient graph admits no reduction using external triangles, nor a refutation of a 5-degenerate theorem. A different reduction, potentially using a pair of vertices or a stable slack-one residual, is needed.
