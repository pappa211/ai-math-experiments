> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Restoration-role fresh review of the general S cover collapse

Source: `notes/coordinator_triangle_deletion_set_WKE_collapse_v1.md`, SHA 7c5e3ef8b7027f1d19e2de67a2edafe337c48fcb7883cf84539df27ff08a4f6c.

Verdict: ACCEPT at the exact supplied-WKE-tuple scope. This is an ordinary theorem.

I reconstructed the support exception directly. For an undeleted F edge avoiding Z, its nonhub second page cannot have an apex in F; a page through S can lose a spoke only along an S-to-outside matching edge, which would put an endpoint in Z. An outside-L page cannot lose a matching edge because all matching endpoints lie in L. Closedness rules out a different hub-link component. Thus all specified edges are supported in the residual, including arbitrary outside-page cases.

The simultaneous prescription is valid because a literal residual clique can contain at most two F vertices and hence at most one prescribed F edge. One minimum cover through that edge in each affected K4/K5 block gives a single minimum residual cover containing every prescription; shared vertices cause no edge-cover conflict.

I checked the final actual-triangle cover by partitioning lost triangles into P-base pages and remaining hub pages. The former retain their bases; every latter rim either meets S or Z or is already in the residual cover. The cardinality is exactly the claimed upper bound, and |Z|<=|S| uses only that P is a matching.

The S-empty consequence is sound and removes Kotzig from this alternative triangle-free WKE transfer. It does not remove finite or other inputs from separate WKE availability theorems. The statement correctly concerns the supplied matching size; it does not infer a maximum-matching bound for arbitrary larger S. No objection remains.
