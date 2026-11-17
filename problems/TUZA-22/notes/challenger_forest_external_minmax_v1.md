> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact packing-cover equality for outside pages on forest bases

Status: ORDINARY_PROOF_CANDIDATE; frozen for independent review. This strengthens the earlier whole-forest minimum-cover corollary by removing minimum-cover optimality entirely. The perfect-graph steps are proved below; no unproved perfect-graph theorem is an input. Those steps are classical, not claimed as new.

## Theorem

Let T be a finite forest on A, let B be disjoint from A, and let F be ANY family of actual triangles of the form uvb with uv in E(T) and b in B. No triangle uses two B-vertices. Let nu(F) be the maximum edge-disjoint subfamily and tau(F) the minimum number of actual graph edges meeting every member of F. Then

    nu(F)=tau(F).

The family need not contain every page permitted by its incidence edges; the theorem is valid for arbitrary subfamilies as well. In particular, if G[A] is a forest and B is independent, then all actual G-triangles have this form and nu(G)=tau(G), whether or not E(G[A]) is minimum.

The result concerns this specified triangle family. Additional internal triangles in a larger graph are not silently included or claimed covered by its family cover.

## 1. The triangle intersection graph is assembled from bipartite line graphs

Let X have one vertex for each triangle in F, with two vertices adjacent exactly when the triangles share a graph edge. Distinct pages can intersect only by sharing their base uv, or by having the same apex b and bases incident with the same A-vertex a.

For each a in A, form the induced subgraph X_a on pages whose bases are incident with a. It is a line graph of a bipartite graph: one side consists of T-edges incident with a, the other of apices b, and a page (e,b) is the corresponding bipartite edge. Adjacency in this line graph means a common base or a common apex, exactly the two possible page conflicts at a.

A page on uv belongs to precisely the two bags X_u and X_v. Adjacent bags intersect in the clique consisting of pages on their common base uv; nonadjacent bags have disjoint vertex sets. Every edge of X belongs to at least one bag. The bag index graph is the forest T. Across an edge of this bag tree, there are no X-edges between the exclusive vertices of its two sides: such a page conflict would require incident bases, whose common endpoint would put both pages in a bag on the same side, unless a base is the separating edge itself, in which case its page lies in the separator clique.

Thus X is obtained by gluing bipartite line graphs along cliques in a forest pattern. Empty and contained bags cause no difficulty.

## 2. Elementary perfection facts

Call a graph perfect when every induced subgraph has chromatic number equal to its clique number.

**Bipartite line graphs are perfect.** A bipartite graph of maximum degree d has an edge coloring with d colors. Add dummy vertices to balance its two parts and add edges, permitting parallel edges, until it is d-regular. Hall's condition follows by counting the d|S| edges from any subset of one part into its neighborhood, which has capacity d|N(S)|. Remove a perfect matching and repeat, decomposing the regular multigraph into d matchings. Restricting the colors proves the assertion. Every clique in a bipartite line graph is a set of edges at one common endpoint, so its clique number is d; every induced subgraph is again a bipartite line graph.

**Clique gluing preserves perfection.** If perfect graphs X1,X2 intersect in a clique and there are no edges between their exclusive parts, a clique of their union lies in one side. Color both sides with the larger clique number, permuting the color names on one side to agree on the common clique. This proves equality of chromatic and clique numbers. The same reasoning applies to every induced subgraph, so the union is perfect. Induction on the bag forest in Section1 proves that X is perfect.

For completeness, the minmax consequence of perfection needed next is also proved rather than imported.

## 3. A self-contained clique-cover consequence of perfection

**Replication lemma.** Replacing a vertex v of a perfect graph Y by two adjacent twins preserves perfection. It suffices to prove the coloring equality for an induced subgraph containing both twins; an induced subgraph containing at most one is inherited from Y. Let k be the clique number after duplication. If k exceeds the clique number before duplication, color the original graph and give the new twin a new color. Otherwise k is unchanged and v belongs to no original k-clique. Take a k-coloring of the original graph and let S be v's color class. The induced original graph on V(Y) minus (S minus {v}) has clique number at most k-1: every original k-clique meets S, and none can meet it only in v. Color that induced graph with k-1 colors. The set (S minus {v}) together with the new twin is independent and receives the last color. This proves the lemma, including all induced subgraphs.

Now let Y be a nonempty perfect graph with independence number alpha. List all its maximum independent sets as S1,...,Sk. Replace each vertex v by a clique of m_v adjacent twins, where m_v is the number of these sets containing v; delete vertices with m_v=0. The resulting graph Y' is perfect by repeated replication and induced deletion. Its vertices can be partitioned into k independent sets, one copy of each v in each S_i, so it has a k-coloring. It has exactly k*alpha vertices and independence number at most alpha, so at least k colors are necessary. Hence its clique number is exactly k.

A k-clique in Y' meets each of those k color classes once. Its projection to Y is a clique K meeting every maximum independent set S_i. Projection may merge several twins, but still meets each S_i and remains a clique. Therefore alpha(Y-K)=alpha-1. The reverse lower bound follows by removing the exactly one K-vertex from any maximum independent set; the upper bound follows because K meets them all.

By induction on vertices, Y-K has a cover by alpha-1 cliques. Adding K gives a cover of Y by alpha cliques. No clique cover can use fewer than alpha, because each clique meets an independent set at most once. Consequently

    minimum vertex-clique-cover number(Y)=alpha(Y).

This is the standard weak-perfect-graph minmax argument, included here in full at the exact scope needed.

## 4. Every intersection clique is an actual graph-edge fiber

Consider a clique of page vertices in X. Its distinct bases are pairwise incident tree edges, because disjoint bases with apices in B cannot share an edge. Pairwise incident edges of a forest have a common endpoint: three edges incident in pairs without a common endpoint would form a triangle. Thus the clique lies in some X_a.

In the associated bipartite graph for X_a, pairwise incident edges have a common endpoint, since a bipartite graph has no triangle. Hence all those pages share either their common base e or a common spoke ab. A singleton page can be covered by any one of its edges. Every clique in X is therefore contained in an actual edge fiber.

An independent set in X is exactly an edge-disjoint packing in F. A graph-edge cover of F gives a vertex-clique cover of X via its edge fibers. Conversely Section4 turns every clique cover of X into an actual graph-edge cover, with no increase in size. Section3 and perfection of X yield

    tau(F)=clique_cover_number(X)=alpha(X)=nu(F).

This proves the theorem. QED.

## Role in the weighted TREE question

For a tree component C_i of a minimum ordinary triangle cover, the family of its OUTSIDE pages therefore has exact matching-cover equality, even when those pages alone do not make C_i minimum. This improves the pricing of external pages and is independent of the unresolved internal-triangle collisions in the mixed-Hall selection.

It does not prove that an optimum external packing can be combined with an internal packing of the desired weighted value. Internal triangles can meet its bases, and the ordinary cover may still force choices between them. That joint-attainability obligation remains open.

## Attribution and evidence boundary

The replication and clique-cover argument is a classical form of Lovasz's perfect-graph theorem. Original primary publication metadata and abstract were inspected: L. Lovasz, *Normal hypergraphs and the perfect graph conjecture*, Discrete Mathematics2(3) (1972),253–267, DOI https://doi.org/10.1016/0012-365X(72)90006-4. The abstract states the matching-transversal minmax for normal hypergraphs and the complement-perfection consequence. No historical-priority claim is made for the present application. The complete needed graph argument is supplied above rather than relying on an unchecked reading of the original proof.

No finite computation is a premise. The outside-family theorem is stronger than the prior minimum-whole-forest corollary but has the same essential forest-base boundary; the actual C6 page-cycle example remains outside its scope.
