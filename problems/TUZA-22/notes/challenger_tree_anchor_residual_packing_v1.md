> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Residual packing bound for an extremal tree-cover anchor

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh review. Joint coordinator/challenger parity and symmetric-difference reconstruction, 2026-11-16 UTC. This proves a PACKING bound, not the open residual COVER bound.

## Theorem

Let C be a forest triangle-edge cover of a finite simple graph H. Choose a maximum triangle packing P minimizing the number p2 of its members containing two C-edges. Let p1 count its members containing one C-edge, set S=C intersect E(P), and write R=H-S. Then

    nu(R)<=p1.

No minimum-cover hypothesis on C is needed. Isolated selected vertices and disconnected forests are allowed.

## 1. The actual conflict graph

Fix any edge-disjoint triangle packing Q in R. Make a bipartite graph J with vertices the triangles of P and Q; join two when they share an actual graph edge. They cannot share a C-edge: every C-edge used by P belongs to S and is absent from Q. They cannot share two graph edges, since two triangles sharing two edges are identical, whereas every P-triangle uses a deleted C-edge.

Every triangle has one or two C-edges because C covers triangles and is acyclic. A one-C triangle has only two non-C edges and hence degree at most two in J. A two-C triangle has only one non-C edge and hence degree at most one. These degree bounds use that each of P and Q is itself a packing, so a fixed graph edge occurs in at most one opposite-side triangle. Every Q-vertex has a neighbor, since otherwise it could be appended to the maximum packing P.

Thus J consists of paths, cycles, and possibly isolated P-vertices.

## 2. Forest parity excludes cycles and two-C endpoint pairs

A cycle of J can contain only one-C triangles, since all its vertices have degree two. Every non-C edge of every triangle in this component is then shared by exactly one P-triangle and one Q-triangle.

The same is true for a nontrivial path whose two endpoints are both two-C triangles: each endpoint's unique non-C edge is used by its one conflict, and each intermediate one-C triangle uses both non-C edges in its two conflicts.

In either configuration, take the symmetric difference of the actual edge sets of all triangles in that component. All non-C edges cancel in pairs. Every remaining C-edge appears exactly once: P uses its C-edges in S, Q uses C-edges outside S, and each packing is edge-disjoint internally. At least one such edge remains because each triangle meets C.

But a symmetric difference of cycles has even degree at every vertex. This would give a nonempty even-degree subgraph of the forest C, impossible: a nonempty forest has a degree-one vertex in one of its nontrivial components. Therefore J has no cycle and no nontrivial path with two two-C endpoints.

This proof concerns the full actual graph-edge sets. No assumption about distinct triangle vertices or a pictorial noncrossing embedding is used.

## 3. Extremal packing exchange classifies the remaining paths

A path with both endpoints in Q contains one more Q-triangle than P-triangle. Replace its P-triangles by its Q-triangles. No new conflict with P outside the component exists by definition of J, so this increases packing size, contradiction.

A path with one endpoint on each side has equal numbers of P and Q vertices. If its P-endpoint is two-C and its Q-endpoint is one-C, every internal vertex is one-C. Replacing P by Q on this component therefore preserves maximum cardinality and decreases p2, contradiction.

We now count every remaining component. For a P-P path there is one more P vertex than Q vertices; it has at most one two-C P-endpoint by Section2, so it has at least as many one-C P vertices as Q vertices. For a balanced P-Q path, a two-C P-endpoint is impossible: a one-C Q-endpoint would violate the preceding exchange, and a two-C Q-endpoint would violate Section2. Thus all its P vertices are one-C, again giving exactly as many one-C P vertices as Q vertices. Isolated P-vertices contribute no Q triangle.

Consequently Q can be injected componentwise into the one-C members of P, and |Q|<=p1. Since Q was arbitrary, nu(R)<=p1. QED.

## 4. The cover gap is real even in a small literal tree-covered graph

This theorem does NOT imply tau(R)<=p1. In particular R need not satisfy tau(R)=nu(R).

For a concrete boundary, let H have a K4 on {1,2,3,4}, together with edges

    25,56,63,45,16.

Take the selected tree

    C={12,25,56,63,34},

which is the path1-2-5-6-3-4. The actual triangles are exactly the four K4 faces and245,136; each has exactly one C-edge. The packing P={245,136} is maximum of size2. Indeed at most one K4 face can be packed, and every K4 face uses exactly one of the opposite edges24,13, so it conflicts with at least one of these two outside faces. Thus no three-packing exists. Here p2=0,p1=2, and S={25,36}.

After deleting S, the only nonempty triangle component of R is the literal K4. Therefore

    nu(R)=1, tau(R)=2=p1.

The extra remaining edges are triangle-free. This is an internal tree-cover example; C is not asserted minimum in H. It shows why even a correct residual packing bound cannot be promoted to a covering equality or to the claim that R has a perfect triangle-intersection minmax.

## 5. Exact role and remaining obligation

The anchored-cover target requires

    tau(H-S)<=p1

for some suitable packing choice, because |S|=2p2+p1 and then S plus a residual cover has size at most2|P|. The present theorem supplies only nu(H-S)<=p1. Ordinary Tuza for the forest-cover residual gives at most tau(H-S)<=2p1 and leaves the missing factor two. The separately proved p1<=1 theorem closes its scope by exploiting adjacent-edge residual coverage and a six-C-edge forest trail; it is not a consequence of this packing bound alone.

No computation or external matching theorem is a premise. The exact residual graph, complete edge conflicts, maximum-cardinality quantifier, and secondary minimization of p2 are all essential to the proof as written.
