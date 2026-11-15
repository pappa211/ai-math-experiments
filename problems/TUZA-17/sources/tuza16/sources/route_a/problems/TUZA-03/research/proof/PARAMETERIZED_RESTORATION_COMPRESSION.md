> Curated source from TUZA-03/proof/PARAMETERIZED_RESTORATION_COMPRESSION.md. Original SHA-256: `7407519d38593b3d8287cd3925a946efbbe6342702f5d4acd45883da36eba8b2`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A parameterized compression for edge-stable restoration instances


## Statement

Let H be a finite simple graph with nu(H)=h and

    nu(H−e)=h for every edge e of H.

Let G be obtained by adding the six edges of two edge-disjoint triangles, all six absent from H. Let S be the union of their vertex sets, so |S|≤6.

There is a subgraph G' of G containing all six added edges, and H'=G'−(E(G)−E(H)), such that

    nu(G')=nu(G), tau(G')=tau(G),
    nu(H')=nu(H), tau(H')=tau(H),

and

    |V(G')| ≤ 6h²+3h+454.

If the triangle hypergraph of H is 3-partite, the same is true for H'. The retained H' is packing-edge-stable. The construction is explicit once a maximum H-packing is supplied.

No claim is made that this numerical bound is efficient for enumeration. In particular, a packing-number bound alone is not being called a kernel: the reduction below is the additional argument that actually removes irrelevant vertices.

## 1. Bounding the vertices belonging to old triangles

For an edge e=ab of H, its pages are the triangles abx, one for each common neighbor x. Choose a maximum packing P_e of size h avoiding e; this is possible by edge stability.

Every page meets P_e in an edge, since otherwise it could be appended. Each triangle of P_e meets at most two different pages. Indeed, it does not contain ab, hence contains at most one of a,b; if it contains one, its two incident edges can meet at most two pages. Consequently

    number of triangles containing e ≤ 2h.

Now fix any maximum packing P of h triangles. Every H-triangle shares an edge with P. Since P has 3h edges, the total number of H-triangles is at most 6h².

Let A be the set of vertices occurring in at least one H-triangle. The set V(P) has at most 3h vertices, and every H-triangle has at least two vertices in V(P), because it shares a P-edge. Thus each H-triangle contributes at most one vertex outside V(P), giving

    |A| ≤ 3h+6h².

This bound also holds when h=0, in which case A is empty.

## 2. Removing edges that belong to no restored triangle

Retain all vertices in A union S. A vertex w outside A union S lies in no H-triangle. Every G-triangle containing w is therefore new and contains an added edge xy. All added edges have endpoints in S, so this triangle is exactly wxy, with x,y in S.

It follows that every edge incident to w but not joining w to S lies in no G-triangle. Delete all these edges. This preserves both triangle packing and triangle cover numbers in G and H.

For each remaining outside vertex w, record its exact neighborhood N(w) within S. There are at most 2^6=64 neighborhood types. For a type N, write D_N for the set of added edges xy with x,y in N. The triangles through any vertex of this type are precisely its pages wxy for xy in D_N.

For each type keep at most seven vertices, deleting every other vertex of that type. Let G' be the resulting graph and let H' retain precisely its old edges. Its order is at most

    |A|+|S|+7·64 ≤ 6h²+3h+454.

All old triangles survive, so nu(H')=nu(H) and tau(H')=tau(H). More precisely, their complete triangle hypergraphs are identical after isolated graph edges are ignored. This also preserves packing-edge stability and any 3-partition of the old triangle hypergraph.

## 3. Packing preservation after truncation

Every packing in G uses at most six new triangles: each new triangle contains an added edge, and edge-disjoint triangles consume distinct added edges. Therefore the packing uses at most six distinct vertices outside A union S.

Within each neighborhood type, injectively relabel the outside vertices used by the packing to retained vertices of that type. This is possible because a truncated type retains seven vertices, while an untruncated type retains all its vertices. Keep A union S fixed.

Every mapped triangle exists, and injectivity preserves edge disjointness. Old triangles do not use outside vertices. Thus every G-packing has a packing of the same size in G'. The reverse inequality follows because G' is a subgraph of G. Hence nu(G')=nu(G).

## 4. Cover preservation after truncation

Choose a minimum G'-cover C. Consider a type that was truncated, with seven retained vertices W.

Suppose some added base xy in D_N is absent from C. For each w in W, the page wxy must then be met by wx or wy. These are distinct edges for distinct w, so C contains at least seven edges incident with W.

Replace every edge of C incident with W by all the bases D_N. There are at most six such bases. Every triangle through W is covered by its base, and no other triangle loses a covering edge. This would produce a strictly smaller cover, a contradiction.

Therefore C contains all of D_N for each truncated type. The same cover C, without adding any edge, covers every page through every discarded vertex. Edges removed in section 2 belonged to no triangle. Thus C covers all G-triangles and tau(G)≤tau(G'). The reverse inequality is subgraph monotonicity, proving equality.

## Scope and limitations

The proof uses neither tripartiteness nor slack one, except when one wishes to preserve these properties for the intended application. Edge stability is essential to the codegree estimate used here.

For unrestricted two-triangle restoration, h is unbounded. This theorem therefore does not reduce the conjecture to a finite list. If a separate argument bounds h, the theorem supplies a finite, exact reduction, but the displayed bound can still be far too large for practical exhaustive search.

Seven representatives are chosen to make the minimum-cover replacement strictly improving. A smaller constant may be possible, but is unnecessary for the stated theorem and is not claimed here.
