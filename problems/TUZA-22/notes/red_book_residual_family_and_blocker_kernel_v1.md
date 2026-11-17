> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Red-book residual families and a parameterized H-D blocker kernel

Frozen ordinary companion to red_book_tree_rerooting_v1.md,2026-11-16. Source_audit. This is an actual-family decomposition and boundary-count reduction. It neither supplies a survivor lower bound nor proves unrestricted H-D.

## 1. Entire residual triangle family

Use the supplied configuration and notation of red_book_tree_rerooting_v1.md: C is exact-one, P is maximum of size k, Q is a q-packing surviving P's blue deletion, and T1,...,Ts are the s=k-q singleton triangles. Let

    H=G - union_i E(Ti),
    g=# distinct unused-red opposite edges,
    d=q-g.

Take every nontrivial auxiliary tree whose root is an unused red edge. Let A be the union of all its literal paired-book K4 supports, over all such trees. Let B0 be the set of paired red spines OUTSIDE these unused-root tree components, and put b=|B0|.

Then the ENTIRE actual triangle family of H is exactly

    (all triangles of those rooted-tree K4 books)
      union
    (all actual H pages on the b red bases in B0).          (1)

Every actual triangle is assigned by its unique red edge. A singleton red edge was deleted. An unused red edge not among the g opposites cannot survive: the book-cover fact would make it an opposite of a paired book. Every red edge in an unused-root tree is completely controlled by the independently proved rerooting identity. The remaining possible red edges are precisely B0. This proves (1), including every actual crossing triangle.

Within an unused-root tree, K4 books can SHARE RED EDGES. Their literal support has exactly its displayed triangles, but it need not be a whole triangle component of H. Supports from different rooted trees are edge-disjoint; arbitrary remaining attachments come from the B0 book families. The seven-vertex blue-edge attachment guardrail in the preceding note remains applicable.

The exact auxiliary-component count gives

    b<=d=q-g.                                             (2)

Indeed every paired spine outside the unused-root trees contributes one to q-g, while a rooted tree with r books contributes r-1. Under the strict H-D cover hypotheses and s>=1, the exact singleton count gives

    b<=d<=s-1.                                            (3)

Thus at most s-1 actual common-spine book families are uncontrolled, regardless of their number of pages or attachments. This is a family bound, not a bound on their vertices.

## 2. Regular K4 boundary lies at a small actual vertex set

A regular K4 slot is an isolated one-edge auxiliary tree from a used spine to an unused opposite. Let

    X=(all vertices of T1,...,Ts)
      union (all endpoints of the b red edges in B0).

Then |X|<=3s+2b. For every regular K4, EVERY edge of its support used by a triangle outside that K4 is incident with X.

To verify this, first consider an outside H triangle. By (1), triangles with red edges in rooted trees stay within their own K4 supports. Different rooted trees have disjoint supports, and the regular slot is an entire auxiliary component. Hence an outside H triangle meeting this K4 belongs to a B0 spine family. Its red base is not a K4 edge, so a shared K4 edge is one of its two blue spokes and is incident to an endpoint of that B0 base.

Next consider a G triangle not present in H. It contains an edge f of some singleton Ti. The regular K4 support is disjoint from all singleton edges. If the triangle shares a K4 edge e, then e and f are different edges of the same actual triangle and share a vertex. That vertex lies in V(Ti), hence in X. This proves the full G boundary claim without ignoring restored or crossing triangles.

## 3. A star boundary supplies an actual H-D blocker

Assume now the ORIGINAL H-D premises: every actual triangle T has nu(G-E(T))=k-1 (and the stated cover equalities when used below).

If a literal K4 has all of its outside-triangle boundary edges in a star centered at one of its vertices v, its opposite face T has NO edge belonging to any outside triangle. Deleting E(T) kills every K4 triangle and preserves all outside triangles. Two opposite edges f1,f2 of that K4 also meet every K4 triangle; their deletion may additionally destroy outside triangles but cannot leave any new one. Therefore

    triangle_family(G-{f1,f2}) subset triangle_family(G-E(T)),
    nu(G-{f1,f2})<=k-1.                                  (4)

Thus {f1,f2} is the desired actual two-edge packing blocker. This argument uses original H-D directly and requires no CS induction or assertion that the K4 is an isolated triangle component.

If a regular K4 contains at most one vertex of X, Section2 places its entire outside boundary in such a star (or leaves the boundary empty). It therefore supplies a blocker by (4).

## 4. Blocker-free configurations have only quadratically many paired slots

Suppose, for the purpose of analyzing a potential H-D counterexample, that no one-/two-edge blocker exists. Every regular K4 must then contain at least two X vertices. Distinct regular K4s have edge-disjoint full supports, so no pair of X vertices can belong to two of them. Consequently

    # regular slots <= binom(|X|,2) <= binom(3s+2b,2).     (5)

For the nonregular slots, let the unused-root trees with at least two books have sizes r_i. Their deficit is sum(r_i-1)=d-b, and sum r_i<=2(d-b). Adding the b other paired slots yields

    # exceptional slots <=2d-b.

Hence the more precise all-size bound is

    q <= binom(3s+2b,2)+2d-b,
    0<=b<=d<=s-1.                                       (6)

For fixed d, the right side increases with b: its increment from b to b+1 is 6s+4b>0. It is then largest at b=d, and increases with d. Thus

    q <= binom(5s-2,2)+(s-1),
    k=q+s <= binom(5s-2,2)+2s-1.                         (7)

The inequalities are CONDITIONAL NECESSARY bounds for a blocker-free strict original-H-D graph, for every supplied maximum P/surviving Q with s>=1. They do not assert a universal bound on k: s may grow with k. No large finite verification is proposed or authorized by this parameterized kernel.

## Exact remaining obligation

The rerooting and family decomposition remove the need to treat arbitrarily many different uncontrolled red bases at a fixed s. The star-boundary argument directly resolves easy regular K4 attachments as actual blockers. What remains is the interaction of the at most s-1 uncontrolled spine families, the at most2(s-1) exceptional paired slots, and regular K4s meeting multiple vertices of X; their number can grow quadratically with s. A survivor lower bound, a compatible simultaneous replacement, or another all-size argument is still missing.

All claims above are ordinary consequences of the actual book geometry, rerooting, the exact cover count and original H-D. No finite certificate, GE, Kotzig, asymptotic theorem, formalization or arbitrary colored-graph realization is a premise.
