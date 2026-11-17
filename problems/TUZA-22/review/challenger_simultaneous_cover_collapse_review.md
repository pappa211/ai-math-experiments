> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: simultaneous residual covers and triangle-free unicyclic remainders

Verdict: ACCEPT at the stated scopes. Reviewer: challenger, 2026-11-16 UTC.

Frozen sources: near_bipartite_wke_cover_collapse_v1.md, SHAaec8d88dba77cc18895810e77ad27a626722ac68d381073709959ea851043fb3; apex_unicyclic_triangle_free_remainder_ordinary_v2.md, SHA3ea922cdab26e291196dd7537b46e7eb20dc872fca604532c11cf8372b93951d.

The hypothesis in the first note is explicitly that F=L-w is triangle-free; no stronger bipartiteness is needed or inferred from its filename. I reconstructed the support audit: every surviving F edge has a second page; its apex is outside F, and all its spokes survive unless the apex is w and the edge meets the matched neighbor z. Thus the only possible unsupported F edges form the star at z. If w is unmatched there is no exception.

A literal residual clique block has at most two F vertices, so it contains at most one prescribed supported F edge. Minimum covers through one specified edge can therefore be chosen IN EVERY BLOCK simultaneously. This is legitimate even when different triangle blocks share graph vertices. The resulting minimum old cover absorbs all supported F edges; the uncovered link edges are met by {w,z}, or just {w} when w is unmatched. Adding these hub spokes and P covers every lost triangle, including arbitrary outside pages on each deleted P edge. The strict bounds for r>=3 or unmatched w with r>=2 are exact.

The larger-matching argument is also valid: F triangle-free implies L K4-free, so an old block has at most three L vertices and a matching supplies at most one surviving rim edge. Avoiding that one edge in each maximum block packing permits the larger hub matching. Hence any surviving WKE tuple has maximum matching size, yielding the stated size-at-most-two boundary. The frozen v1 note correctly leaves that boundary open.

For the ordinary unicyclic v2 assembly, a nonperfect connected triangle-free unicyclic F has r>=2 and exposes either an original leaf adjacent to w or an arbitrary chosen w-neighbor in the bare odd cycle. Appending wz gives a WKE tuple of size r+1>=3 using the accepted elementary matching-complement cover lemma. The collapse applies directly for every deficiency.

A perfect noncycle F has exactly r nonmatching edges with an adjacent pair, giving a cover of size r-1. The resulting r-tuple avoids w and r>=2, so the stronger unmatched-apex collapse applies. A perfect cycle is exactly the previously reviewed full apex-cycle branch, including the historical ordinary W5 local argument. These exhaust connected triangle-free unicyclic remainders.

The v2 assembly therefore has no GE, Kotzig, finite census or prescribed-edge-selection premise. Its older GE-based v1 remains a separately labeled proof and is not retroactively relabeled. The exact remaining triangular-cycle/nonperfect cases are not proved by this review. The generic matching-two boundary of the first note is a separate next lemma, not silently included in this verdict.
