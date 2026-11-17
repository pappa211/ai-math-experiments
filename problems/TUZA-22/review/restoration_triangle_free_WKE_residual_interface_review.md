> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the triangle-free WKE residual interface

Reviewer: restoration agent, 2026-11-16. Result: ACCEPT at the stated conditional scope.

Reviewed `notes/coordinator_triangle_free_WKE_residual_interface_v1.md`, SHA e18b148c7903a71ea13213fbcdd9c2d0200f78182f62a4d94a3a80d0a3d2c793.

I independently reconstructed each implication before recording acceptance. Balanced deletion forces vc(R)=r as well as the recorded B residual. Since R is triangle-free, each old block has at most two L vertices and at most one R edge. Prescribing every supported R edge in its distinct block's minimum cover is simultaneous, so cover invariance gives vc(U)>=r, while U subset R gives the reverse inequality. For an unsupported R edge, every second page must be destroyed on P; an outside-link apex would have both spokes surviving, so the local containing-triangle superset is valid.

Every selected triangle in the literal cone uses only hub spokes and L rim edges. Hub spokes were deleted, so an arbitrary mixture of hub and rim triangles has at most one surviving edge per old block. Thus the entire cone packing lifts, proving nu(A)=r, without a one-rim restriction.

For an outside page on f in P, its old footprint is at most one spoke. If a cone-packing rim and that spoke were disjoint in one old block, their three distinct L endpoints would form an R triangle. Hence their whole footprint is a two-edge star, and the bound nu(A-f)<=r-1 follows for every cone packing avoiding f.

Finally, absence of outside pages on P makes all lost triangles belong to A. The union of minimum covers of A and K covers G. Applying class-local CS only when A is a proper edge subgraph is valid. The connected nonempty link makes all hub triangles one shared-edge component, and every cone edge is in that component; equality would force literal K4 or K5, contradicted by link robustness. The explicit A=G boundary is retained and is not closed by this review.

No universal WKE exclusion or availability of outside pages has been inferred. No computation was used.
