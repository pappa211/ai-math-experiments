> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Global cover optimality and the local-Hall boundary — independent review

**ACCEPT both notes.** The K5,5 example is an actual-graph counterexample only to local-Hall/inclusion-minimal shortcuts. The independent-side formula is an exact ordinary cover identity, not a packing min-max theorem.

## Literal local-Hall obstruction

The core has10 vertices and25 edges; each of its10 new independent apices has6 neighbors, giving20 vertices and85 edges overall. A core edge xy has exactly the two apices z_x,z_y: any third closed neighborhood seeing both endpoints would require a common core neighbor, impossible in the triangle-free core. Thus exactly50 actual triangles exist, all private to their core base. Each apex's triangles share its identity spoke, so no packing can use more than10 triangles. The displayed cyclic family uses10 distinct core bases and10 distinct apices, hence is edge-disjoint and attains10. The identity spokes form a10-cover, proving tau=nu=10.

Every nonempty s-edge star has exactly s+1 available apex labels, so all local Hall inequalities hold; each core edge is individually essential to the inclusion-minimal25-edge core cover. Nevertheless that cover is not minimum, since10 spokes suffice. The abstract K6 example also has the asserted6-edge optimum, but its vertex-label lists cannot be realized by actual common-apex neighborhoods on K6: each color would require an apex adjacent to all six vertices and hence present on every base. This nonrealizability distinction is correctly explicit.

## Exact independent-side identity

For any cover, let R be its selected A-edges, S the omitted A-edges, and F its cross spokes. Every triangle wholly in A with all three edges in S would be uncovered, so L[S] must be triangle-free. At each independent-side apex b, the selected spokes must meet every edge of L[S][N(b)]. Their least possible number is the ordinary vertex-cover number of that induced edge graph. Distinct apex spoke sets are disjoint, so these minimum costs sum exactly to h(S). This gives the lower bound m-|S|+h(S).

Conversely, for any triangle-free S, taking all A-edges outside S and the separate optimum spoke covers at each apex covers every actual triangle. Internal triangles use a retained A-edge, and each mixed triangle is covered by either its base or its selected spoke. There are no two-apex triangles. Therefore the formula is exact, with no tacit realizability or missing-triangle assumption.

Minimum cover C=E(A) is thus equivalent to h(S)>=|S| for every triangle-free S. The all-subset formulation follows correctly by removing a minimum triangle cover D from S and using monotonicity h(S)>=h(S-D). The reverse implication just restricts to triangle-free S. For a star S, every nonempty induced apex graph is a star with cover number1, recovering precisely the local page-union Hall inequality. In the literal K5,5 obstruction, all25 core edges form a triangle-free S with h(S)=10, exposing the global violation.

For the private-family-only covering problem, internal triangles do not need coverage, so removing the triangle-free restriction is exactly correct. This change may matter; no equality of private-family and full cover optima has been established by the formula.

## Exact two-sided reconstruction and its limit

The same accounting extends to a minimum-cover candidate C whose complement H is bipartite and whose edges are all internal to its bipartition. For S subset C, form an auxiliary graph J_S with vertices the H-edges and an edge between the two blue spokes of every private triangle based in S. Then

    tau_triangle(G)=min_{S subset C, S triangle-free} (|C|-|S|+tau_vertex(J_S)).

Indeed the only nonprivate triangles are wholly internal and use three C-edges; after omitting S they are covered exactly when S has no triangle. The remaining uncovered triangles are precisely the private pages on S, whose spoke covers are vertex covers of J_S. This is a direct independent reconstruction, not a claim about rainbow matching rank. In the one-sided case J_S splits by apex and yields h(S).

The parent supplied the relevant abstract warning: a K4 properly colored by its three perfect matchings has tau(J_S)>=|S| for every color subset S, but its largest rainbow matching has size1, smaller than half the three colors. It cannot be imported as an actual private-page realization. Four pairwise adjacent auxiliary vertices would correspond to four pairwise incident H-edges; such a family of graph edges is a star. Its six possible private-page bases are six distinct endpoint pairs, so a three-color1-factorization is impossible. The actual endpoint geometry remains essential. No matroid-union identity is available for arbitrary families of matchings.

Reviewed `notes/challenger_local_hall_boundary_v1.md` SHA-256: `08c38551ccc15d6380b32fea3f009d8fa5fe656d23a7d77e9a3347687642448d`.

Reviewed `notes/challenger_independent_side_cover_identity_v1.md` SHA-256: `72822fa7798ba2df4e85a4de61c4efa3364cda384d0f4130e2216fb9219640f0`.

Completed UTC: 2026-11-15T23:20:23.220598+00:00.
