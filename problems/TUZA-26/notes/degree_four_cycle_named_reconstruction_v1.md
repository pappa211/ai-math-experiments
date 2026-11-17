> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Completing the induced-cycle degree-four reconstruction

Frozen root ordinary candidate v1. Independent review required, including the cited new boundary lemmas. This excludes a supplied degree-four C4-link vertex, not arbitrary higher-degree cores.

Use degree_four_cycle_link_v1.md: c has neighbors A={a,b,d,e}, inducing cycle ab,bd,de,ea with ad,be absent. Positive gain is excluded. In the neutral case J=Q-c has nu=k,tau=2k-3 and every rim edge critical. For M={ab,de}, R=J-M is resilient with nu=k-2,tau=2k-5. Its active component C is C12, with other old components tight K4/K5. Keep every background edge and vertex. Put N={bd,ea}.

The preceding reviewed interface supplies a maximum R packing avoiding BOTH N edges. For any ordinary M-page, its old spokes together with N block maximum R packings, because that page and both c-pages on N would append to give k+1. Every tight component avoids this combined footprint at full size: at most one N edge, plus at most one incident page spoke. Hence EVERY ordinary M-page has at least one C spoke. This is only nonempty active intersection; no whole-page confinement is assumed.

## Tight components and their complete boundaries

A fixed old clique D meets the WHOLE ordinary-page family on one missing base in at most one edge. For base ab, two distinct footprints ap,aq would combine old bp,bq with old clique edge pq into an R triangle merging b into D, forcing absent ab. The same holds for de. A clique contains at most one N edge, since two force an absent M edge.

All new Q triangles are ordinary M-pages or c-pages on A. Thus D has complete boundary at most three: one N edge and one whole-page footprint from each base. Without an N edge, its boundary is at most two and the accepted tight-boundary exclusion applies.

A K4 with at most three complete boundary edges is excluded by apex_k4_triangle_boundary_v1.md: some D triangle has at most one boundary edge; replace that whole triangle in its guaranteed minimum Q cover by an opposite-pair D cover retaining that boundary edge, saving one.

For a remaining K5 with three distinct boundary edges, suppose its N edge is ea. It excludes b,d because ab,de are absent in R. Its other boundary edges are ap,eq. If p!=q, this is the P4 p-a-e-q, excluded by k5_three_edge_path_boundary_v1.md. If p=q, its boundary is triangle eap.

In the latter case, actual pages abp and dep each have a C spoke. Their D spokes ap,ep are not in C; therefore bp,dp belong to C. Thus b,d,p are C vertices, and the universal-vertex property puts the old edge bd in C. D and C share exactly p: a second shared vertex would yield a D edge between C vertices, already supported in C, merging the components.

There is no other old tight component. One without an N edge has boundary at most two; one with an N edge would contain ea, already in D, or bd, already in C. The two D vertices outside eap are therefore in no other old triangle component, and are not A vertices. They cannot gain Q-supported background edges: a new M-page with either as apex would use a private D edge from a or e, enlarging the complete boundary; c-pages use only A. Since Q is triangle-supported, both vertices have exactly their four D neighbors. D is a genuine K5 triangle leaf, excluded by the already reviewed leaf reduction. ALL old tight pieces are now absent.

## Named support and literal cover saving

R has only C support plus background. Every maximum J packing consists of k-2 old triangles and two ordinary M-pages. A page cannot have apex in A because one of the diagonals ad,be would be required. Neither new page uses an N edge. Both N edges are critical in J, so must occur in every maximum J packing; they therefore belong to old C support. All four A vertices lie in C, inducing exactly 2K2 there.

Any support vertex outside C union A union{c} could only be an ordinary M-page apex. Its old neighbors lie in A and are independent in N, else it belongs to an R triangle. Since N is two disjoint edges, its degree is at most two. It has no c edge because N_Q(c)=A. Minimum degree four excludes it. The universal vertex of C rules out internal old background. Consequently the exact support is J=C+M and Q=J plus a fresh c adjacent precisely to A.

The already independently reviewed named eligibility fact says every ineligible C12 edge has a universal endpoint (two_edge_tight_boundary_v2.md and reviews/apex_boundary_review.md). Neither edge of an induced 2K2 can have such an endpoint. Choose a minimum C cover containing bd. Add ab,de and one c-spoke meeting the remaining old-rim page cea. This covers all C triangles, all M-pages, and all c-pages, at cost

    tau(C)+3 = 2(k-2)-1+3 = 2k-2,

contrary to tau(Q)=2k-1.

Together with the prior positive-gain exclusion and opposite-residual resilience, this excludes EVERY degree-four vertex whose neighborhood induces C4. The operation uses universal single-deletion resilience, full-triangle cover eligibility and two-edge resilience at their exact points. Naming occurs only on resilient defect-one R. The separate diamond-link and higher-degree availability obligations remain OPEN. No global R, Tuza solution or originality claim is made.
