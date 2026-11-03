# Independent reconstruction B

Initial independent audit, before access to the two earlier reviewer reports or their evidence. The original target is frozen in FROZEN_TARGETS.md; source references below are to the unchanged author-completed `review/B_AUTHOR_CLOSEOUT.md` (B) and `notes/WEIGHTED_ROOT_LEMMA.md` (W). This reconstruction reads the author's mathematical argument but supplies and checks its missing intermediate details. It is not a blind rediscovery.

**Initial verdict: VERIFIED_ORDINARY**, relying on the standard Tutte–Berge theorem for the weighted alternative. The labelled equality, rather than merely a factor-two inequality, survives. The elementary alternate Tuza proof needs no matching theorem. Historical priority is a separate question, addressed in PRIOR_ART_AND_SCOPE.md. Exact checks are FINITE_CHECKED and are not the justification for the universal quantifier.

## 1. Exact interpretation and triangle components

All triangles are actual 3-cliques. Regard a triangle as its three actual edges when discussing conflict, packing, or covers. Two components of X(G) use disjoint actual-edge supports: an edge occurring in both would make two triangles adjacent. Consequently both nu and tau add over these components, even if their vertex sets meet. Triangle-free background edges do not affect either optimum. Removing a triangle component means removing its support edges, not its vertices. Deletion cannot create triangles, and by component isolation it cannot destroy triangles of another component.

We first establish the exceptional components. Suppose abc has two distinct common neighbors d,e. The five-vertex induced graph is K5 if de is present and K5-e otherwise. In the latter case partition its edges into edges of abc and edges from {d,e} to {a,b,c}. If an external triangle abx, x outside the five vertices, exists, the triangles abx, acd, bce are three pairwise edge-disjoint neighbors of abc, hence an induced claw. If an external triangle adx exists, use center abd and leaves adx, abe, bcd. These leaves intersect only in single vertices and are therefore pairwise nonadjacent in X. Symmetry covers the two edge types. For K5, symmetry covers every edge using the first claw pattern, including the possible de edge. Thus no external triangle uses an edge of the support.

The triangles within each support form a connected conflict graph. For K5-e this also follows from the complementary-pair root below; its seven-edge root is connected with no isolated edge component. Thus these supports really are whole isolated triangle components, not merely some isolated pieces of a larger component. Distinct exceptional components may share vertices but cannot share a support edge. All are removed independently.

For K5, nu=2: {012,034} is a packing, and three packed triangles would use nine of its ten edges. Their union has even degree at every vertex; deleting one edge from K5 leaves two odd degrees, impossible. For tau=4, the four edges within the two parts of a 2+3 vertex partition cover all triangles. Conversely the complement of a triangle cover is triangle-free. On five vertices a triangle-free graph has at most six edges: if its maximum degree is at most two this is immediate; if it is three, its three independent neighbors and the one remaining vertex give at most 3+3=6 edges; if it is four it is a star. Hence at least 10-6=4 edges must be removed.

For K5-e, with missing edge 34, {013,024} packs two triangles. Three packed triangles would use all nine edges, but vertices 3,4 have degree three, contradicting even degrees of a union of edge-disjoint triangles. The same triangle-free five-vertex bound gives tau>=9-6=3. Put the missing-edge endpoints in the size-three part of a 2+3 partition: the present internal edges total three and meet every triangle. Therefore its exact pair is (2,3).

For the *full* claim that X(G) is a line graph, the exceptions also need roots. On a five-vertex support, map every triangle T to its complementary two-element set. Two triangles share an edge iff their complementary pairs meet. This realizes X(K5) as L(K5). For K5-e it realizes X as the line graph of K5 with the three edges of the triangle complementary to the missing edge removed. These are loopless roots. Take their disjoint union with the residual root below. No triangle-free-root or special weighted-cover claim is made for these exceptional roots.

Source map: B lines 15–28. The exceptional roots and explicit elementary optimum proofs above expand obligations left implicit in the short source.

## 2. Residual K4s and triangles outside K4s

After removing the exceptional support components, no triangle belongs to two K4s: if abc belonged to abcd and abce, the preceding exceptional support would already contain it. In particular the sets of four faces of distinct remaining K4s are disjoint.

For a K4 Q=abcd, call an edge active if a triangle not contained in Q uses it. Suppose adjacent ab and ac were active, with triangles abx and acy outside Q. Necessarily x,y are outside Q. If x!=y, the three triangles abx,acy,bcd are pairwise edge-disjoint neighbors of abc, giving a claw. If x=y, it is a second common neighbor of abc alongside d, creating an exceptional five-vertex support, already removed. Thus active edges form a matching: at most two, and if two they are opposite. This permits K4s sharing an edge, and arbitrary numbers of K4s at a common active port; it does not impose vertex-disjointness of K4s.

Let abc lie in no K4. If each of ab,bc,ca were shared with another triangle, choose witnesses abx,bcy,caz. Their tips are outside abc. If two tips coincide, that tip is adjacent to all a,b,c, making a K4. Hence the three tips are distinct, and the three witnesses are pairwise edge-disjoint neighbors of abc, a claw. Therefore an ordinary (non-K4) triangle has at most two shared edges.

This is where the full triangle family matters: a repeated tip forces actual extra edges/triangles of a K4; none may be omitted from X.

Source map: B lines 27–28.

## 3. Explicit labelled multigraph

For each residual K4 Q choose an opposite edge pair P_Q={e_Q,f_Q} containing every active edge. Such a pair exists by section 2. Introduce a new hub q_Q of weight two. For each actual edge selected anywhere in the construction, introduce exactly one node p_e, globally identified by its actual-edge label e, of weight one. Never merge nodes merely because the corresponding triangles are twins.

Each face T of Q contains exactly one member e of P_Q. Represent T by a root edge q_Q p_e. Each of the two ports receives two distinct parallel root edges, with the two original faces recorded as separate identities. A port edge with no triangles outside Q gives a dummy port node: it still represents the specified actual edge and covers TWO faces of Q. It is not an ordinary one-triangle private leaf.

For each ordinary triangle T select two of its edges P_T containing all shared edges, filling with private actual edges if fewer than two are shared. Represent T by the root edge joining the two distinct nodes p_e,p_f for P_T. An ordinary selected private edge has exactly one associated triangle and hence its node is a genuine private leaf. If both selected edges are private the root edge is an isolated K2 component. The third unselected edge is private to T.

H is finite and loopless: hub and edge-node types are distinct, and an ordinary triangle chooses two distinct actual edges. There is exactly one root edge per actual triangle, retaining parallel edges. Hubs form an independent set because every root edge has at most one hub endpoint. Nodes for unused graph edges need not exist.

### Exact adjacency

Faces of one Q all share its hub, and indeed any two faces share an actual edge. Triangles not belonging to the same Q can intersect as root edges only at an edge-node p_e, and then both contain actual e. Conversely, if triangles not belonging to the same Q share e, that edge is active for any participating K4, so is in P_Q; it is shared for any ordinary participant, so is in P_T. Both represented root edges therefore meet at p_e. This proves a label-preserving isomorphism L(H)=X(residual), not just an abstract line-graph recognition result. It immediately yields nu(residual)=mu(H).

### Triangle-free underlying simple root

A triangle in the underlying simple H could contain at most one hub. If it contained q_Q, its other two vertices would have to be p_e,p_f for the opposite ports of Q, and a root edge between them would represent an ordinary triangle containing both disjoint original edges e,f. No three-vertex triangle can contain four distinct endpoints, so this is impossible.

If a root triangle has no hub, its three root edges represent ordinary graph triangles with pairwise shared *distinct* actual edges. Three pairwise edge-intersecting distinct graph triangles either share a common edge or are three faces of a K4. To see the needed case directly, write the first two abc,abd with common ab. A third triangle sharing an edge different from ab with each must be acd or bcd; these edges force the K4 abcd. In the present root triangle the three shared actual-edge labels are distinct, excluding a common-edge book. Thus those triangles would not be ordinary, contradiction.

This proves triangle-freeness of the underlying simple root, while preserving parallel edges in H. It is not a claim that all abstract claw-free graphs are line graphs, or that every multigraph root is triangle-free. The optional true-twin statement follows: choose one representative of each true-twin class in L(H), equivalently delete the other labelled root edges. No parallel pair survives (parallel edges always give true twins), so the retained triangle-free root is simple, even if additional twin identifications occurred.

Source map: B lines 30–35 and 57–60.

## 4. Both cover inequalities, including normalization

Let R be any root vertex cover. For p_e in R select actual edge e. For q_Q in R select the two opposite edges of P_Q. If a represented triangle is covered in H at an edge-node, it contains that actual edge. If covered at a hub, one of that hub's opposite edges lies in its Q face. Hence the resulting actual-edge set meets EVERY residual triangle and has cardinality at most w(R); overlap only decreases its size. Thus tau(residual)<=vc_w(H).

For the reverse direction start with an arbitrary actual-edge cover C, not necessarily an optimum. Discard edges in no residual triangle. For every ordinary T, replace a selected unchosen edge of T by either selected-construction edge in P_T. The unchosen edge occurs in T alone, so this cannot uncover another triangle; T stays covered, and cardinality does not increase. These replacements cannot remove an edge required by another replacement or a K4: an edge of a K4 already belongs to at least two faces and would not be private to an ordinary T. Write C' for the resulting cover.

Select p_e whenever e in C' and e is a chosen node label. Every ordinary root edge is now covered. For a K4 Q consider its opposite ports e,f.

* If both e,f belong to C', their two port nodes cover every incident root edge; do not select q_Q.
* Otherwise one port, say ab in Q=abcd with opposite cd, is absent. Both faces abc and abd must then be hit using their cross edges {ac,bc} and {ad,bd}. Those pairs are disjoint. Thus C' contains at least two of Q's four unchosen cross edges. Select q_Q and cease charging the selected cross edges of Q.

Every unchosen Q edge is inactive, since all active edges were in P_Q. Hence it occurs in no triangle outside Q. In particular such a cross edge cannot also be an unchosen cross edge of another K4, or a selected ordinary label, or a port of another K4: any such occurrence would make it active. The costs of different hubs therefore charge disjoint groups of at least two selected actual edges. There is no double charge. Selected edge-nodes each charge their own selected actual edge. We have constructed a root cover of total weight at most |C'|<=|C|. This proves vc_w(H)<=tau(residual).

Together the two inequalities give the exact optimum identity

    tau(residual) = vc_w(H),   nu(residual) = mu(H).

An isolated K4 illustrates why dummy ports must retain the actual-edge labels: its two dummy nodes each cover two faces, and its hub has weight two; both optima are two on the cover side. An ordinary private leaf covers just one face. Treating a dummy port as a single-face leaf would corrupt the correspondence.

The correspondence is a *free scalar optimum* identity, not an identity for all forced boundary states. In an ordinary triangle with two shared selected ports, forbidding both port nodes leaves its represented root edge uncovered, whereas its unselected private actual edge still covers that graph triangle. Our normalization is allowed to change which boundary edges are selected. This qualification is already explicit in B lines 44 and 73; it does not weaken the frozen scalar claim.

Source map: B lines 31–35, 39–44, 64–73. The no-double-charge and missing-port two-face arguments are supplied explicitly here.

## 5. Weighted matching inequality

We independently check W's general claim. Let H be any finite loopless multigraph, S an independent set, and w=1+1_S. Parallel edges do not change matching or vertex-cover optima, so pass to the underlying simple graph without removing vertices (including isolated ones).

Use the established Tutte–Berge formula in its precise form: for n vertices there exists A subset V such that

    2 mu(H) = n + |A| - q,

where q is the number of odd-order components of H-A. This is the minimum over A of the right side, not an arbitrary chosen separator.

Let t count odd components of H-A containing a vertex of S. Set I=(S minus A) union {one vertex from each odd component disjoint from S}. The first part is independent by hypothesis. Chosen additional vertices lie in different components of H-A and in components containing no vertex of S, so no two selected vertices are adjacent. There are no selected vertices in A. Thus I is independent in H itself.

Each of those t components consumes a distinct vertex of S minus A, so t<=|S minus A|. The added q-t vertices all have weight one. Therefore

    w(I) = 2|S minus A| + q - t
         >= |S minus A| + q
         >= |S| + q - |A|.

Total vertex weight is n+|S|. Its complementary vertex cover has weight at most n+|A|-q=2mu(H), proving vc_w(H)<=2mu(H). Empty H, isolated vertices, no heavy vertices, even components, and parallel edges require no separate exception. The five-vertex weighted census separately checks every barrier/subset algebra for all 12,625 independent-heavy-set instances.

Applied to the residual root, S is exactly the independent set of K4 hubs, so tau<=2nu. Add the exact (2,4)/(2,3) exceptional components from section 1.

The secondary interaction bound in W is also correct: for arbitrary S choose a minimum vertex cover R of H[S]. Then S minus R is independent. Lower weights at R by one, apply the lemma, and restore weights, increasing the chosen cover cost by at most |R|. Hence vc_(1+1_S)(H)<=2mu(H)+vc(H[S]). This does not produce a root for unrestricted graph triangles. K3 with every vertex heavy has weighted cover four and 2mu=two, showing why independence cannot be dropped without an additional term.

Source map: W lines 5–25. Only the Tutte–Berge formula is an external theorem dependency of this proof route; the construction and algebra are shown here.

## 6. Independent elementary two-edge-neighborhood proof

For an ordinary residual triangle T, choose its two edges containing all shared edges (fill with private edges if needed). They cover T and every triangle adjacent to it in X. For a K4 face T, take the port e in T from P_Q and the opposite port f. They meet every face of Q. Any triangle outside Q adjacent to T shares an active edge in T; by the opposite-port condition that edge must be e. Hence these two actual edges cover the full CLOSED conflict neighborhood of T. This includes missing/dummy ports and triangles attached to multiple pieces.

Let P be any inclusion-maximal triangle packing in the residual. Every actual triangle is either in P or adjacent to some member of P, since otherwise it could be added. The union of the two-edge sets for members of P therefore covers every actual triangle and has size <=2|P|<=2nu. Combine with the exceptional component optima. This is a complete proof of restricted Tuza independently of the weighted lemma; it does not establish the exact cover equality on its own.

Source map: B line 37. Maximal is sufficient; maximum is not needed for the construction.

## 7. Fresh exact checks and scope

`checks/check_b.py` is newly written standard-library code, without reading/importing the discovery or reviewer solvers. It recomputes triangles from all actual edges. Triangle packing uses an independent-set recursion on conflicts; actual covers use a hitting-set recursion; root matching branches on root vertices; weighted root cover branches on endpoints of an uncovered labelled root edge. Witnesses are independently realized/normalized. No prior numerical census count was used as an assertion in the script.

All 32,768 labelled six-vertex graphs passed, including 30,272 claw-free cases (24,483 nonempty), 456 claw-free cases with exceptional components, and 2,865 with residual hubs. Actual nu/tau were computed for every graph. In EVERY claw-free case the script checked both root optimum identities, exact adjacency, opposite-port and ordinary shared-edge bounds, exception isolation, exception line roots, hub independence, triangle-free underlying root, and the two-edge local cover certificate. There were no finite Tuza violations. The canonical per-graph certificate stream has SHA-256 `8dcefff789bbbef0a557a56c7aa90991e52e02bed3e6886e19a70ec7679d2ac1` (recomputed rather than stored exhaustively).

Sixteen named controls include empty/triangle-free graphs, K4/K5/K5-e/diamond, opposite versus adjacent K4 attachments, a triangle sharing three support edges, K4s sharing an edge or only a vertex, a three-K4 chain on eight vertices, ordinary two-shared-edge triangles, disjoint components, and K5 with triangle-free background. For every claw-free named control every actual residual edge subset that is a cover was normalized, and every root vertex cover was realized. The largest ordinary-edge subset domain is 2^16 for the three-K4 chain. Negative controls are correctly rejected by the claw-free test, not forced into the theorem.

`checks/check_weighted.py` checks all 1,024 labelled five-vertex graphs with every independent heavy set (12,625 instances), explicitly enumerates Tutte–Berge barriers, constructs I, checks the algebra and compares with every vertex cover. This is supporting evidence, not a proof of Tutte–Berge or a replacement for section 5.

Public reproduction, from the repository root with a new output directory:

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```

The driver runs writers in fresh copies. The shipped
[root/control receipt](../../verification/tuza-11-15/finite/TUZA-12/check_b-replayed.json)
and [weighted receipt](../../verification/tuza-11-15/finite/TUZA-12/check_weighted.json)
retain actual edge/triangle/root identities and optimum witnesses for controls.
No general theorem has been labelled Lean-proven. No general-Tuza bridge or
two-red conjecture was investigated in this proof.
