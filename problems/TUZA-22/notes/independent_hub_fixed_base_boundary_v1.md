> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fixed packing bases fail outside the residual-link interface

Status: ORDINARY_EXACT_BOUNDARY using the already reviewed literal non-WKE graph. This is a new application of that retained control to notes/independent_hub_fiber_cover_v1.md, not a claim of a newly discovered graph or a Tuza counterexample.

Let L be the independent-part C5 blowup with cyclic part sizes(2,2,1,2,2), and let G be its cone with hub s. The literal definition and ordinary certificates are in notes/c5_blowup_wke_boundary_v1.md, independently accepted in review/hamiltonian_and_nonwke_boundaries_review.md.

The link L has9 vertices,16 edges, matching number4, independence number4 and dissociation number4. The last assertion means every vertex set inducing maximum degree at most1 has size at most4. These facts follow directly from the five parts: if a dissociation set uses an edge between consecutive parts, each of those parts supplies one vertex, their two other neighboring parts supply none, and the one remaining part supplies at most2 vertices.

The cone G has10 vertices,25 edges and16 actual triangles. Every triangle contains s. Thus S={s} is an independent triangle transversal and nu(G)=nu_matching(L)=4. Its ordinary triangle-cover number equals the vertex-cover number of L, namely9−4=5: spokes from a link vertex cover give a triangle cover, and any selected base edge of a cone cover can be replaced by an endpoint's spoke without increasing size.

Fix ANY maximum triangle packing P. Its four opposite-hub bases form a maximum matching M of L. There are no essential BASE edges of P in the fiber sense: an actual triangle on a selected base is uniquely the original hub triangle, so it intersects E(P) in all three edges, not only in its base.

For every matching M of L, alpha(L−M)=4. A fixed independent set of L still has size4 after deleting edges, giving the lower bound. Conversely an independent set of L−M induces only matching edges in L, so the dissociation bound gives size at most4. Therefore

    tau_vertex(L−M)=5

for EVERY maximum matching M, independently of its choice.

It follows that the restricted cover recipe retaining all four packing bases and adding only hub spokes has exact optimum

    |M| + tau_vertex(L−M) = 4+5 = 9 > 2nu(G)=8,

although unrestricted tau(G)=5. The initial bases and spokes are disjoint edge sets, so no duplicate-edge saving changes this count.

This falsifies the auxiliary assertion that, for an arbitrary independent triangle transversal, some maximum packing always has residual hub links cheap enough for the fixed-all-bases recipe to meet factor2. Changing the maximum packing does not repair this example. The scoped bipartite/residual-Konig theorem remains valid; here every residual link violates its vertex-cover/matching equality premise.

A viable extension must allow a different selected base set, a different cover family, or another source of compatible savings. Requiring all packing bases to remain selected is a genuine limitation of this particular mechanism. The old private-only minimum-edge-cover obstruction is a different parameter and quantifier; it is not being silently reused as the present claim.
