> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The whole-cone triangle-free matching-residual case is impossible

Frozen ordinary proof candidate, 2026-11-16. This is a minimum-CS theorem, not a characterization of arbitrary cones satisfying a packing identity.

## Statement

Let G be a proper-subgraph-minimum CS failure, globally or in an edge-subgraph-hereditary class. Suppose G is the literal whole cone h+L, and L has a matching P of size r such that

    R=L−P is triangle-free,       nu_triangle(G)=r.

Then this is impossible. In particular this excludes the A=G branch of the accepted triangle-free WKE-residual interface: that interface already gives the displayed packing equality. The following proof does not need a vertex cover Q once these hypotheses are established.

The link L may be taken connected as in the interface. All links used below are WHOLE induced G-links, not induced subgraphs of larger uncontrolled links.

## 1. Every rim vertex is matched

If u is unmatched by P, all its rim neighbors lie in N_R(u). Since R is triangle-free, the rim graph induced on these neighbors has only P edges and is a matching, possibly with isolates. The whole G-link at u is h joined to that matching. It is connected, and deleting h leaves a forest. The accepted ordinary apex-pseudoforest exclusion, or its earlier apex-forest special case, forbids this closed link. Thus P is perfect in L.

## 2. Two matched common-neighbor pairs augment

Fix any P edge ab and put

    W=N_R(a) intersect N_R(b).

Suppose W contains two distinct P edges xy and zt. Replace the three hub triangles hab,hxy,hzt in the P hub packing by

    hax,       hby,       abz,       hzt.

All four are actual triangles: ax,by,az,bz are R edges and zt,ab are P edges. They are pairwise edge-disjoint. They use hub spokes only at a,b,x,y,z,t, so they also avoid every other hub triangle of the P packing; their non-hub edges are either the two displayed P bases or R edges, which cannot equal another P base. This gives r+1 triangles, a contradiction.

Therefore the matching induced by P inside W has at most one edge.

## 3. A neighboring whole link is apex-pseudoforest

Let D=N_R(a). The whole G-link J at a has vertex set {h,b} union D. Every edge from h to the other vertices is present. After h is deleted, its edges are exactly:

- the star from b to W;
- the P edges with both endpoints in D.

There are no R edges within D, because R is triangle-free, and b has no other P neighbor because its mate is a. Thus J−h is a star plus a matching. Every cycle in this graph is a triangle bxy arising from a P edge xy wholly contained in W. By Section2 there is at most one such edge. All other matching edges either extend star leaves, form isolated edges, or leave isolated vertices. Consequently J−h is a pseudoforest.

The graph J is connected because h is universal in it. It is a nonempty whole closed link in the same minimum-CS graph. The accepted ordinary apex-pseudoforest theorem therefore gives the required contradiction.

## Consequences and exact limit

In the accepted triangle-free WKE-residual interface, let A=h+L be the local cone. The whole-cone alternative A=G is now excluded ordinarily. If A is proper, that interface already shows that at least one P base has an outside page, and every such base is packing-critical in A. Therefore every surviving tuple must lie in that proper-cone/outside-page branch.

A useful additional local restriction is immediate. If ab in P has an outside page, then W contains NO complete P edge xy: the two hub triangles hax,hby replace hab,hxy, retain the same total packing size r, and avoid ab. This contradicts the accepted outside-page criticality nu(A−ab)<=r−1. This restriction concerns the local cone only; it does not turn the induced subgraph of the global a-link into a closed link when outside attachments are present.

The ordinary counterexample `challenger_cone_matching_robustness_boundary_v1.md` remains valid: it shows that cone packing equality and cyclic robustness alone do not suffice without the full minimum-CS framework. This theorem uses that framework explicitly through the whole induced neighboring link and the apex-pseudoforest exclusion.

## Dependencies

- `notes/apex_pseudoforest_full_exclusion_v1.md`, SHA256 `a4329ae4b512eb74e7efbf016e9299e756309052876a876dc6ad11cc82846ceb` (ordinary, freshly reviewed).
- For the WKE application and final outside-page statement only: `notes/coordinator_triangle_free_WKE_residual_interface_v1.md`, its accepted whole-cone packing identity and outside-page criticality.
- Authenticated class-local minimum-CS framework, including its application to every proper edge subgraph.

No finite certificate, GE, Kotzig theorem, matching-cover equality, or assumption that all P bases have outside pages is used.
