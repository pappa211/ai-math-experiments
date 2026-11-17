> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: whole-cone triangle-free matching-residual exclusion

Reviewer: restoration. Frozen 2026-11-16 before the research cutoff. Verdict: ACCEPT, ordinary at the full minimum-CS scope.

Reviewed source: `notes/challenger_whole_cone_triangle_free_matching_residual_exclusion_v1.md`, SHA-256 `859fb1886e7ce98bc9a6aa9fa13326dcb2e0668712a8ede7f89db45c15d1f305`.

I reconstructed the proof independently. For a P-unmatched rim vertex u, its full rim-neighbor graph has only P edges since R is triangle-free. Its whole G-link is therefore a cone over a matching, an excluded apex-forest link. Minimum codegree rules out a vacuous isolated-rim case. Thus P is perfect.

For a P edge ab, two disjoint P edges xy,zt in its common R-neighborhood produce the explicit four triangles hax,hby,abz,hzt replacing hab,hxy,hzt. All six named vertices are distinct, all non-P bases are R edges, and no hub spoke or P base of another packing triangle is used. This is a valid four-for-three augmentation without external assumptions.

The WHOLE neighboring link at a, after removing h, is exactly the star b-W plus the P matching inside D=N_R(a). R supplies no edges inside D and b has no P mate there. Such a graph has only the possible triangles bxy for P edges contained in W. At most one exists by the augmentation, so it is a pseudoforest. The full link is connected through h and is forbidden by the freshly reviewed apex-pseudoforest theorem.

The proof correctly uses G=the whole cone; its neighboring link is not silently treated as closed in a graph with arbitrary outside attachments. In the proper-cone application, the remaining outside-page branch stays open. The additional outside-page restriction is also sound: one P edge xy inside W permits hax,hby to replace hab,hxy at equal size while avoiding ab, contrary to cone-edge criticality. No finite or external matching theorem is needed. No gap found.
