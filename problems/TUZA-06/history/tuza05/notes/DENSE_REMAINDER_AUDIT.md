> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Dense degree-five remainder: independent audit and essential-edge elimination

Status: complete ordinary deductions within the combined-S minimal-counterexample framework. These are not the full 5-degenerate theorem. No numerical experiment or Lean check was run by this author. The local existence proofs below are explicit and do not depend on enumeration. Historical novelty is unassessed.

This note was developed by the independent proof critic after auditing the final frozen equality source, SHA-256 b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd. The root proposed the initial dense-remainder bounds; the critic reconstructed those bounds, supplied the seven-edge rim argument, and obtained the essential-edge exclusion. Root independently obtained the same free-page lemma and K6 essential-edge exclusion before receiving the completed K6-minus-edge saving. Agreement is not a substitute for the proofs below.

## Framework and conclusion

Let G be a minimum-edge failure of S within the 5-degenerate graphs, where S asserts tau(G)<=2nu(G) and K4/K5 triangle components at equality. The frozen ordinary reductions give tau(G)=2h, h=nu(G), and a degree-five vertex v whose link is K5 or K5 minus one edge. Let W=N[v], B=G[W], K=G-E(B), and k=nu(K). Let F be all triangles with a rim edge in N(v) and third vertex outside W. Every triangle destroyed by deleting E(B) is a B triangle or an F page. The six vertices W are independent in K. Every proper edge-subgraph satisfies S by the minimality assumption.

Write sigma(K)=2nu(K)-tau(K). Then:

1. If B=K6, necessarily k=h-4 and sigma(K) is 1 or 2. If sigma(K)=1, K has no packing-essential edge.
2. If B=K6-ab, with a,b in the rim, necessarily k=h-4, sigma(K)=1, and K has no packing-essential edge.

No assertion that the full triangle hypergraph of K is tripartite is made or used. Packing-edge stability means nu(K-e)=nu(K) for every e in E(K).

## Elementary local facts

K6 and K6 minus an edge have packing number four. For K6, triangles 123,145,246,356 leave the matching 16,25,34 unused; relabel to avoid a prescribed absent edge. Five triangles would use all 15 K6 edges, impossible since triangle-union degrees are even whereas all K6 degrees are odd.

Deleting two disjoint edges from K6 still permits four triangles. With deleted ab,cd, write the other vertices v,e and use vac,vbd,ade,bce. Thus all two-disjoint-rim-edge deletions needed below have four-packings.

A minimum K6 cover has six edges and can contain any prescribed edge: take all inside-part edges of a balanced partition into two sets of three, with the prescribed endpoints in the same part. For B=K6-ab a five-edge cover is obtained by the same construction keeping a,b together. It can contain any prescribed existing rim edge f. If f meets a or b, put its other endpoint with a,b. If f is disjoint from {a,b}, place a,b with one of the two vertices outside f and place both endpoints of f in the other part. The inside-part edges have size five because only ab is absent.

### Seven-edge rim lemma

Every graph L with seven edges on five vertices contains a triangle C and two edge-disjoint hub triangles whose rim bases avoid E(C). Indeed, L contains a triangle by the five-vertex Mantel bound. The four edges of L-E(C) either contain a matching of size two, which gives the hub triangles, or form a four-star: an intersecting graph-edge family with at least four edges is a star. In the latter case write C=abc, star center s, and fourth leaf d. The center s is outside C, since every triangle vertex has two of its incident edges deleted. Use sab as the new rim triangle and the disjoint remaining edges sd and ac as hub bases. The three triangles are sab,vsd,vac.

Consequently B=K6-ab, after deletion of any two distinct existing rim edges, has a three-triangle packing. The resulting rim has exactly seven edges. This conclusion needs no exact optimum computation.

## First remainder reduction

The ten rim edges cover all lost triangles in the K6 case, and the nine rim edges do so in the K6-ab case. A K packing extends by four B triangles. Since K satisfies Tuza, these two budgets give

- K6: h-5 <= k <= h-4;
- K6-ab: k=h-4 and 0<=sigma(K)<=1.

### Excluding k=h-5 for K6

The cover budget forces tau(K)=2k. Hence its triangle components are K4/K5 blocks. Because W is independent in K, each block meets W at most once.

Suppose two occupied external-page bases f,g are vertex-disjoint. Choose one page on each. They are edge-disjoint even if their apices coincide. Four B triangles avoid f,g by the preceding explicit packing. Each residual block sees at most two old page spokes; K4 avoids their star and K5 avoids any two edges. Thus the two pages and four B triangles extend a maximum K packing to k+6=h+1, contradiction.

Therefore the occupied bases form an intersecting family of edges in the five-vertex rim. Such a family is either a star with at most four edges or a triangle with three edges. A six-edge B cover can contain one occupied base; adjoining the at-most-three remaining bases covers every external page. If there is no occupied base, the B cover alone suffices. Thus tau(G)<=2k+9<2h, contradiction.

### Excluding equality at k=h-4 for K6

Again the residual triangle components would be equality blocks. If F is nonempty, take one page on base f and a four-packing of B-f. Every residual block can avoid its at-most-one old page spoke, so these five triangles append to a K packing, giving h+1. If F is empty, a six-edge B cover gives tau(G)<=2k+6<2h. Thus sigma(K) is 1 or 2.

### Excluding equality for K6-ab

If two external pages are edge-disjoint, their distinct bases can be deleted and the seven-edge rim lemma supplies three local triangles. Each residual equality block avoids at most two old spokes, so the five triangles append to a K packing, giving h+1. Hence F would be pairwise intersecting. The elementary intersecting-triangle lemma gives tau(F)<=2. A five-edge B cover then gives tau(G)<=2k+7<2h. Thus sigma(K)=1.

## Essential-edge structure of an arbitrary deficit-one remainder

Assume now sigma(K)=1 and an edge e=pq is packing-essential. Put Q=K-e and q=nu(Q)=k-1. Since a single edge deletion lowers the cover number by at most one,

  2k-2 <= tau(Q) <= 2nu(Q)=2k-2.

So Q has equality and its triangle components are K4/K5 blocks. Triangle-free Q edges are retained and may be important. All W vertices remain independent in Q.

### One touched spoke per equality block, and existence of a free page

Every triangle of K absent from Q is an e-page pqt. A Q clique block cannot contain both p and q. If it contained two old spokes pt1,pt2 from e-pages, it would contain t1t2. But qt1t2 is then a Q triangle sharing the block edge t1t2, forcing q into the same triangle component and hence the same clique block. This would force the absent edge pq, a contradiction. The same applies with p,q exchanged. Thus each block contains at most one old spoke across the entire e-page family.

If every e-page touched a Q block, select in each touched block a minimum cover containing its unique touched spoke. The union is a 2q-cover of Q and all e-pages, hence a cover of K, contrary to tau(K)=2q+1. Therefore there exists an e-page A whose two old spokes lie in no Q triangle block. Only existence of one free page is asserted; the proof does not say every e-page is free.

Since W is independent in K, A has at most one W vertex and uses no B edge. Its two old edges are triangle-free in Q, so adjoining A does not constrain any chosen maximum block packing. External pages meeting A can only share one of the at-most-two A edges incident to its possible W vertex. They consequently have a two-edge cover consisting of those A edges. If A misses W, no external page meets A.

## Eliminating an essential edge: K6

Suppose an external page P is edge-disjoint from A. A four-packing of B minus P's base, together with A and P, extends a maximum Q packing: each Q block needs to avoid only its at-most-one P spoke, and A's old edges are outside all blocks. This gives q+6=h+1, contradiction.

Hence every external page meets A. Take a minimum Q cover, add e to cover every e-page of K, add a six-edge B cover, and add the at-most-two A edges covering F. This gives

  tau(G) <= 2q+1+6+2 = 2q+9 < 2h,

because h=q+5. Thus K has no packing-essential edge when sigma(K)=1.

## Eliminating an essential edge: K6-ab

Let F0 be the external pages edge-disjoint from A. If F0 contained two edge-disjoint pages P1,P2, use the seven-edge rim lemma after deleting their bases to obtain three B triangles. Together with A,P1,P2 these extend a maximum Q packing to q+6=h+1. The only block avoidance requirements come from the at-most-two old page spokes, since A is free. This is impossible, so F0 is pairwise intersecting.

The required one-edge cover saving comes from the exact shape of an intersecting external-page family. If F0 has a common edge, one extra edge covers it. Otherwise the intersecting-triangle lemma places it in the faces of one K4. Every external page has exactly two W vertices and one vertex outside W. The only non-common-edge possibility is therefore exactly the three pages xyz,xtz,ytz, where x,y,t are rim vertices and z is a single outside apex. Their bases form a rim triangle. A five-edge B cover containing base xy covers xyz, and adding tz covers the other two pages. Thus in all cases B triangles together with F0 admit a cover of size at most six. The empty-family case is easier.

The pages F-F0 meet A and are covered by its at-most-two W-incident edges. A minimum Q cover, e, the just-constructed six-edge cover of B and F0, and these two edges therefore give

  tau(G) <= 2q+1+6+2 = 2q+9 < 2h,

again h=q+5. This rules out the essential edge.

## Exact limitation

The surviving K6-ab remainder is a packing-edge-stable graph with integer deficit one. The surviving K6 remainder either has the same stability and deficit one, or has deficit two. This does not settle either dense-link configuration. In particular, K need not have tripartite full triangle hypergraph, and equality-block avoidance cannot be applied directly to a stable deficit-one graph. The elementary obstruction to an unjustified extension is that a maximum K5 packing cannot avoid a three-edge star. The free-page argument above legitimately avoids that obstruction only after deleting an essential edge from a deficit-one remainder.

## Independent audit of the root's further K6 deficit-one localization

The root proposed the following strengthening after the preceding proof. It has been independently reconstructed by this critic.

Suppose B=K6 and sigma(K)=1. The preceding theorem gives packing-edge stability. Additivity over triangle components, together with nonnegative integer deficits supplied by the proper-subgraph inequality, gives exactly one component D of deficit one; all remaining triangle components are equality K4/K5 blocks. Stability passes to D.

For any external page xyz, with x,y in the rim and z outside W, both old spokes xz,yz must belong to D. Otherwise a maximum D packing can avoid its at-most-one affected edge by stability, and each equality block can avoid its at-most-one spoke because W is independent. Appending xyz and four local triangles in B-xy then gives h+1 triangles, a contradiction.

Let S be the rim vertices lying in D. All external page bases therefore lie inside S. If |S|<=3, a balanced 3+3 partition with S inside one part supplies a six-edge B cover containing every possible base. If |S|=4, its six internal edges together with the spoke from v to the fifth rim vertex cover every B triangle and every external page. Either construction adds at most seven edges to a minimum K cover, strictly less than the required cover gain nine. Hence D contains all five rim vertices.

No equality K block can share an edge with a new triangle: B edges were deleted, and the old edges of every external page belong to D. Such a block would remain an isolated triangle component of G, contrary to the normalization to one triangle component. Similarly, a triangle-free edge of K cannot be activated by an external page, since both spokes of every page already lie in D. It would remain triangle-free in G, also excluded. Thus K consists of this single deficit-one triangle component and the isolated vertex v.

Finally every external wedge {xz,yz} satisfies nu(K-{xz,yz})=k-1. A packing of size k after deleting both spokes would append its page and four local triangles, contradicting nu(G)=h=k+4. Stability gives the opposite bound k-1 after the two deletions. This is an exact local packing-loss profile, not a contradiction or an equality classification of D. The full triangle hypergraph of D is not asserted tripartite.
