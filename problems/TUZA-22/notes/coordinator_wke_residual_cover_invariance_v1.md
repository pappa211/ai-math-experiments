> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Residual-cover invariance in a balanced WKE link reduction

Frozen ordinary conditional interface, coordinator, 2026-11-16 UTC. This is a necessary equality condition, not a general WKE-to-CS theorem.

Let L be a closed link component at hub v. Let M be a matching of size r, Q a vertex cover of F=L-M with |Q|<=r. Delete all v-spokes to L and all M rim edges, obtaining H. Suppose B(H), nu(G)=nu(H)+r and tau(G)=2nu(G). These are exactly the balanced conclusions for such a tuple in a class-minimum CS failure. All triangles and arbitrary outside pages are retained in the reasoning.

## 1. Cover-substitution inequality

Let D be ANY actual triangle-edge cover of H. Set F_D=F-(D intersect E(F)), and let Q_D be a vertex cover of F_D. Then

    D union M union {vq:q in Q_D}

is an actual triangle-edge cover of G. A lost triangle on an M edge is met by that rim edge regardless of its third vertex. Every other lost triangle is a v-page on an edge of F. If its rim belongs to D it is already covered; otherwise a Q_D spoke meets it. Closedness accounts for every deleted spoke. Consequently

    tau(G) <= |D| + r + vc(F_D).

If |D|=2nu(H)+s, equality of G forces

    vc(F_D) >= r-s.                                      (*)

In particular EVERY minimum cover D of H satisfies vc(F_D)=r. Indeed the lower bound follows from (*), while Q is still a cover of F_D and has size<=r. This also forces |Q|=vc(F)=r. Minimum residual covers may be chosen independently across actual B triangle components; vertex sharing is harmless because their triangle-edge supports are disjoint.

## 2. A supported-edge consequence

Every triangle-supported H edge belongs to a minimum H cover: in its K4 block choose an opposite pair containing it; in its K5 block choose a triangle plus the complementary edge containing it. Thus for any f in E(F) that is triangle-supported in H,

    vc(F-f)=r.

Otherwise choose a minimum H cover containing f. Since F_D is a subgraph of F-f, its cover number would be at most r-1, contradicting (*). This includes all edges of actual F triangles. The edge may also be H-supported only by vertices outside L; that case is equally covered.

This is stronger than assuming that a particular chosen Q cannot lose a vertex. It rules out every smaller cover after removing the specified supported rim edge. It does not say all F edges are H-supported.

## 3. A literal clique constraint

For every literal K4 in L, M intersects its six edges in either zero or two edges, never exactly one. If exactly one ab were deleted, its other four vertices would induce a diamond in H. The two triangles sharing the opposite edge cd would belong to one B component, whose literal clique support forces ab to be present in H, a contradiction. Two M edges, when present, are opposite because M is a matching.

Likewise any literal K5 in L must avoid M entirely. Deleting one or two matching edges leaves all five vertices in a connected shared-edge triangle family. For two deleted edges ab,cd and fifth vertex x, the triangles acx,adx,bcx,bdx already form such a connected family and include all five vertices. B(H) forces a literal K5 containing those five vertices and hence the missing edges. The one-deleted-edge case follows from a K4 containing that edge.

These are constraints on the SAME matching witness that produces the balanced residual. They do not assert that L has no K4/K5 or that every matching has this property absent the balanced hypothesis.

## 4. Research role and exact gap

The substitution inequality permits paid residual covers as well as minimum covers. For example, a residual triangle can be covered by all three of its edges at extra cost at most one in K4 and zero in K5; an accompanying drop of at least two in the link vertex-cover number yields a strict contradiction. Restoration is developing this application separately.

The general missing implication remains: prove that every nontrivial WKE link of order at least five has a feasible strict substitution or compatible packing augmentation, under the literal balanced B-residual conditions. Dense clique intersections and outside attachments still matter. Neither WKE alone nor the displayed necessary conditions establish that implication. No finite computation or external matching theorem is used here; the only local input is the elementary K4/K5 cover classification and the stated balanced hypotheses.
