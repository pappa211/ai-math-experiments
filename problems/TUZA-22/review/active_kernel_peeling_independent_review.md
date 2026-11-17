> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Active-kernel peeling — independent reconstruction

Reviewed `notes/active_kernel_peeling_v1.md`; frozen hash and timestamp below. **Verdict: ACCEPT the general interface and the minimum-CS residual connectedness corollary as ordinary proofs at their exact scopes.** No unresolved objection found. This is an all-size symbolic reduction, not a classification of the remaining defect-one component.

The central strengthening over a selected-page argument is valid. For any one absent base uv, two old spokes in the same selected literal clique component must share u orv, since that component cannot contain both endpoints. If those spokes are ux,uy with distinct apices, then xy is a clique edge and the actual old triangle vxy merges v into that same component, forcing the absent uv. Thus the **entire** page family on a fixed base has at most one old edge in each selected block, even when all other old components are arbitrary.

A selected block contains at most one member of the independent terminal triple. Therefore only two of the three new bases can contribute there, and their entire union is a star of at most two edges. Old J support is disjoint from the block by the actual triangle-component definition. This proves the full A-footprint bound without a page-count, outside-incidence or global B(H) assumption.

Every actual A-triangle is a G-triangle. The old J triangles and every new triangle are included by construction. No selected old block triangle is present in A because A retains at most two of that block's edges. The old/new triangle partition is exhaustive, so the claimed triangle family of A is exact; there is no latent crossing-triangle exception.

Choose a maximum packing in each selected block avoiding its whole A footprint, using K4 star and K5 two-edge avoidance. These choices are independent because block supports are disjoint, and the resulting m-packing avoids every A edge. It combines with any A-packing. Conversely every G-packing partitions into selected-block triangles and A-triangles, bounded by m andnu(A). Hence nu(G)=m+nu(A) exactly. Minimum covers combine to give tau(G)<=2m+tau(A).

If A satisfies CS, this chain proves Tuza for G. Equality forces A to be tight and therefore B(A). Every A edge lies in an actual A triangle, since A was defined as a union of triangle supports. Thus, if A shares an edge e with a selected block, e belongs to a literal component of B(A). Choose minimum covers through e on both sides; their union saves at least one edge and makes G strict. Equality consequently forces support disjointness, after which the exhaustive triangle partition shows B(G). Shared vertices and background edges cause no problem. The converse B(G)=>equality is the universal additivity fact.

For a minimum CS failure, reviewed M0/R1 give defect one in every triangle residual H. Every actual triangle component of H is a proper subgraph of G and hence satisfies CS. Their nonnegative integer defects sum to one, so exactly one component has defect one and every other component is tight, hence a literal K4/K5. If such a tight component existed, selecting all tight components in the interface would produce a proper A: each selected block has at least six edges and retains at most two in A. Proper-subgraph CS for A would then transfer to G, contradiction. Therefore H has exactly one nonempty triangle component, with defect one, plus possible triangle-free background edges.

Important limits: this is shared-edge connectedness of the residual triangle family, not ordinary vertex connectivity or block structure. Proper-subgraph tightness is proved before B is invoked. No sparsity theorem, finite census or description of the remaining non-B component is needed. No two-edge blocker is produced. The corollary removes tight attachments from the active near-tight residual problem and leaves the connected defect-one core as the genuine unresolved object.

Reviewed source SHA-256: `c69f69c03630db5d06e472c41913765758edf8772abbc33f5a6b16a4dc1a01bd`.
Review completed UTC: 2026-11-15T22:22:05.089867+00:00.
