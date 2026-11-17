> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full disagreement-graph cover operation

Frozen supporting ordinary candidate v1, TUZA-26, 2026-11-17. This strengthens the set of explicit cover exchanges available from two actual minimum covers. It does NOT turn a matching of cover edges into a triangle packing, produce a literal strip, or establish availability in the remaining core. The marked complete-boundary strip augmentation remains the geometric operation taking priority.

Use the exact disagreement graph H from notes/matching26_book_exchange_v2.md. For two minimum triangle covers F,F' of K, write D=F intersection F', A=F-D and B=F'-D. For every actual K triangle missed by D, join every edge of A on that triangle to every edge of B on it. This defines a bipartite graph on actual COVER EDGES. Both intersections are nonempty. Let |A|=|B|=n.

## Any vertex cover gives a literal triangle cover

If Z is ANY vertex cover of H, then D union Z covers every K triangle. A triangle missed by D supplies at least one H edge between its A and B intersections. If Z missed the triangle, that H edge would be uncovered. Therefore

    tau_vertex(H)>=n,

since a smaller H vertex cover would give a smaller K triangle cover. Either entire side A or B is a size-n cover, so equality holds.

The graph H has a perfect matching. This can be seen directly from Hall's condition: a subset S of A with |N(S)|<|S| would give the H cover (A-S) union N(S) of size less than n, contradiction. Thus Hall's finite matching theorem applies. This matching is ONLY an auxiliary cover certificate; its witnessing actual triangles may collide on their third edges, as the archived control demonstrates.

## Exact implication description of all minimum H covers

Fix a perfect matching M={(a_i,b_i):1<=i<=n}. Every size-n H vertex cover chooses exactly one endpoint of each matched edge. Write z_i=true for selecting a_i and false for selecting b_i. An H edge a_i b_j is covered precisely when

    z_i OR NOT z_j,

equivalently z_j implies z_i. Thus all minimum H vertex covers, and their resulting minimum K covers, are described exactly by these implications. This allows more exchanges than selecting one whole side in each undirected component.

A selection containing a prescribed a_i and b_j exists if and only if the implication digraph has NO directed path i -> j. Necessity is propagation from z_i=true to z_j=true. For sufficiency, set true exactly the vertices reachable from i; this set is closed under implications and omits j, so it gives the required vertex cover. The path convention includes a zero-length path when i=j, correctly forbidding both ends of the same matched edge.

## Actual codegree-two cover saving

Suppose uv has exactly the two common neighbors x,y in Q=K+uv, tau(Q)=tau(K)+1, and choose F containing P_x={ux,vx}, F' containing P_y={uy,vy}. Each cover misses the other page pair, so P_x lies in A and P_y in B.

If ANY x-spoke a_i and ANY y-spoke b_j have no implication path i -> j, choose the corresponding minimum H cover described above. Its actual K cover D union Z hits both uv-pages, and therefore covers Q with tau(K) edges, saving one from tau(Q). This is a complete explicit paid cover operation, accounting for every actual triangle in the construction of H.

Consequently any surviving interface forces all FOUR directed reachabilities from the two x-spoke matched indices to the two y-spoke matched indices. This is sharper than merely requiring one undirected H component. It remains a directed cover obstruction, not a packing contradiction or a geometric strip theorem.

One may additionally choose F,F' minimizing their outside symmetric difference among the prescribed full-page covers. Then no matched variable can lie outside the forward closure of the two x-spoke indices: replacing F by the minimum H cover choosing exactly that closure retains P_x and agrees with F' on every other variable, strictly reducing the difference if any such variable exists. Similarly no variable can lie outside the set of indices that can reach at least one y-spoke index, by modifying F' while retaining P_y. The marked variables themselves cannot be removed in these modifications because the four reachabilities hold. Thus every remaining disagreement variable lies on a directed route from some marked x-spoke to some marked y-spoke. This is a precise minimality statement about actual cover exchanges; it does not bound path length, remove branches, or control third-edge collisions.

## Scope and unresolved geometry

The operation succeeds whenever the specified reachability test fails. Its universal availability is OPEN. A forced directed route is a sequence of pairs of cover edges sharing actual triangles. It may branch, revisit original graph vertices, and have repeated third edges. It cannot be silently identified with a path joined to two hubs. Even a literal two-hub path requires its COMPLETE outside-triangle boundary to be checked before the marked packing augmentation applies.

No new numerical test or matching-as-packing inference is used here. This note is a supporting exact cover-operation criterion; the remaining main obligation is an actual paid region forced by the long exchange geometry or by a usable complete-boundary violation.
