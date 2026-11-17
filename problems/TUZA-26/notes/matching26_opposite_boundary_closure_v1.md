> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Opposite-boundary K4 closure in the minimum unknown core

Frozen ordinary proof candidate v1, 2026-11-16. The final step is CONDITIONAL on independent acceptance of the P3-plus-edge profile theorem. The decisive neutral-insertion/three-edge-B closure was supplied by the coordinator and reconstructed here. No finite search is used in this proof.

## Scope and region

Let Q be the fixed-G minimum unknown core of notes/eligibility_saturation_v1.md: connected nonempty triangle support, single-edge resilient, defect one, outside frozen C12, minimized by supported-edge count among such graphs inside proper edge-subgraphs of a fixed minimum-CS failure G. It is three-vertex-connected and every edge is cover-eligible by the accepted earlier reductions. All proper edge-subgraphs used below satisfy CS.

Let D be a literal K4 in Q. Let F={a,b} be its COMPLETE outside-triangle boundary: all D edges lying in some actual Q triangle not wholly in D. Assume a,b are opposite D edges. Let K=Q-(E(D) minus F), retaining all vertices and all other edges. Every K triangle is an outside Q triangle; each uses at most one D edge. Both a,b are triangle-supported in K by the definition of F. Put k=nu(Q), so tau(Q)=2k-1.

## Exact responses

The following equalities hold without minimum-Q hypotheses:

    tau(Q)=2+tau(K-F),
    nu(Q)=max(nu(K), 1+max(nu(K-a),nu(K-b))).

For the cover equality, F itself is a minimum two-edge K4 cover. A K-F cover together with F covers Q. Conversely every Q cover has at least two D edges, and its non-D part covers K-F. This counts every crossing triangle through the complete boundary.

For the packing equality, a packing without an internal D triangle is a K packing. A packing with an internal D triangle has exactly one such triangle, containing exactly one of a,b. The other triangles form a packing of K with that boundary edge deleted. Conversely choose an internal D triangle containing a (or b) and append any K-a (or K-b) packing; the other two triangle edges are deleted private D edges and occur in no K triangle. Hence nu(Q) is either nu(K) or nu(K)+1.

## The branch nu(Q)=nu(K)+1 is impossible

In this branch nu(K)=k-1. For any surviving edge g of K, a Q-g packing partitions into at most one internal D triangle and a K-g packing. Resilience gives k=nu(Q-g)<=1+nu(K-g), so K is resilient. The exact cover response gives tau(K-F)=2k-3=2nu(K)-1. Proper CS and monotonicity force delta(K) in{0,1}.

If delta(K)=0, K has B support. Both F edges are supported and they lie in distinct B components: a literal clique containing both opposite D edges would contain further D edges deleted from K. Deleting F therefore saves two cover edges, giving tau(K-F)=tau(K)-2=2k-4, contradiction.

If delta(K)=1, tau(K-F)=tau(K), so both F edges are cover-ineligible. The unique active defect-one component inherits resilience and has fewer supported edges than Q; fixed-G minimum-Q choice puts it in C12. Every F edge belongs to it because tight B edges are eligible. Connectedness of Q's triangle family excludes any other old component: D can connect outside components only through F, both lying in the active one. By the named eligibility facts independently accepted in reviews/apex_boundary_review.md, any disjoint pair of ineligible C12 edges has a third C edge among its endpoints. That edge is a D edge surviving in K, impossible because K retained only F from D. This branch is excluded.

## Saturation forces the neutral branch to have defect three

We must therefore have nu(K)=nu(Q)=k. The exact packing response forces

    nu(K-a)=nu(K-b)=k-1.

The cover response still gives tau(K-F)=2k-3. Every minimum Q cover uses exactly two D edges: its non-D part must have at least tau(K-F)=2k-3 edges, so three D edges would exceed tau(Q). Since every Q edge is cover-eligible, choose a minimum Q cover containing any private D edge outside F. Its two D edges form a minimum K4 cover, hence an opposite pair other than F; neither boundary edge is selected. Its non-D part therefore covers all K triangles. Consequently

    tau(K)<=2k-3=tau(K-F)<=tau(K),

and equality holds throughout. Thus K has defect three, both F edges are packing-critical, and deleting F does not change its cover number.

## Neutral insertion or an actual three-edge B residual

Put W=K-F. Its cover number is2k-3. Since W is contained in K-a, criticality gives nu(W)<=k-1; proper CS gives nu(W)>=ceil((2k-3)/2)=k-1. Hence

    nu(W)=k-1, tau(W)=2k-3, delta(W)=1.

Both W+a=K-b and W+b=K-a have packing k-1 and cover2k-3 by the preceding identities and monotonicity. They are triangle-bearing neutral insertions. Indeed a or b has an outside Q triangle by its boundary definition, and that triangle cannot use the other D boundary edge: a triangle using two D edges is wholly inside D. Its remaining edges survive in W.

If W is resilient, proper CS decomposes its support into one active resilient defect-one component and tight B components. The active support is strictly smaller than Q inside fixed G, so it is C12 by explicit minimum-Q choice. Restoring a contradicts the accepted named-active neutral insertion lemma, which permits arbitrary old tight components and retained background. No connectivity assumption on all of W is needed.

If W is fragile, choose a packing-critical edge g of W. Then nu(W-g)=k-2, while cover extension and proper CS give

    2k-4<=tau(W-g)<=2(k-2).

Thus W-g satisfies B, with exact nu=k-2,tau=2k-4. Now

    Q-{a,b,g} = (W-g) plus the four private edges E(D) minus F.

Those four retained D edges form a4-cycle, which contains no triangle. By COMPLETE boundary, no private D edge lies in any outside Q triangle. Therefore adding this4-cycle back creates no triangle at all, including any crossing triangle. The entire triangle family remains that of W-g, and Q-{a,b,g} satisfies B with the same two optima.

Thus Q has a three-edge B deletion with packing gain two and cover gain three. Since a,b are disjoint, the three-edge set has only the shapes matching, P3 plus disjoint edge, or P4. The matching profile is independently excluded by reviews/opening_matching_shape_review.md; P4 is independently excluded by reviews/opening_three_path_review.md. The P3-plus-edge theorem notes/matching26_disconnected_path_classification_v1.md gives only K5-e/W5 for a three-connected profile, hence excludes the minimum Q outside C12, CONDITIONAL on its pending independent review. This contradiction excludes the opposite-boundary K4.

## Consequence and next finite reconstruction domain

Together with the already accepted notes/two_edge_tight_boundary_v1.md / reviews/apex_boundary_review.md, the conditional minimum Q contains NO literal K4 or K5 whose complete outside-triangle boundary has at most two edges.

For a disjoint blocker pair S={e,f}, suppose R=Q-S is resilient. Its unique active defect-one triangle component is C12 by minimum-Q choice, and all other components are tight. The whole-one-base footprint lemma gives each tight component a complete boundary of at most two edges in Q. The theorem therefore excludes every tight component. R has exactly its active C12 triangle support C, with arbitrary triangle-free background retained.

Furthermore Q has no vertex outside V(C) union the four S terminals. Such a vertex x, if present in a Q triangle, is the apex of an ordinary restored page and lies in no old triangle, so both page spokes are old background. After deleting that page's base, resilience supplies a maximum packing consisting of nu(C) old triangles and one page on the other disjoint base. The bare page would append unless it intersects that other page. Matching-base page intersection requires reciprocal endpoint apices, impossible for x outside all S terminals. Since Q is triangle-supported, this exhausts all nonisolated vertices.

This is a proved reduction to a finite named-support restoration interface, not a completed classification or an arbitrary census. Its exact domain and counts must be independently frozen before a full enumeration. The no-blocker branch and availability of a blocker remain OPEN.

## Dependencies and status

- notes/eligibility_saturation_v1.md and reviews/opening_saturation_review.md: saturation, blocker residual profile, named-active neutral insertion.
- notes/two_edge_tight_boundary_v1.md and reviews/apex_boundary_review.md: previously accepted boundary cases and exact named ineligible-pair geometry.
- notes/matching26_three_connected_exclusion_v1.md / reviews/opening_matching_shape_review.md; notes/apex_three_path_defect_gap_v1.md / reviews/opening_three_path_review.md.
- notes/matching26_disconnected_path_classification_v1.md: P3-plus-edge profile, INDEPENDENT REVIEW PENDING at freeze.

All comparisons are proper actual edge-subgraphs inside fixed G. All vertices and background edges are retained until triangle support is explicitly extracted for minimum-Q naming. Global R is not assumed. Full opposite-boundary closure is CONDITIONAL on the last named profile review; all response and neutral/fragile arguments above are ordinary proof candidates submitted for a fresh independent review.
