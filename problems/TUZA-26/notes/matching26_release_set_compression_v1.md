> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Profitable codegree-two release sets compress to one triangle

Frozen ordinary operation lemma v1, TUZA-26, 2026-11-17. Independent review required. Matching rank as a function of released triangle labels is NOT assumed submodular. The compression below follows from the actual common-rim geometry after one of exactly two book apices is reserved.

## Actual interface

Use the accepted endpoint-link setup. Q has nu(Q)=k; uv has exactly the common neighbors x,y; K=Q-uv; L=K-{ux,vx,uy,vy}; and nu(L)=k-1. Fix an actual maximum L packing

    M=M_0 union M_u union M_v,

with M_0 containing neither endpoint, M_u containing u, and M_v containing v. Write m_u=|M_u| and m_v=|M_v|. Define the usable endpoint links H_u,H_v by excluding the opposite endpoint and every physical rim edge occupied by M_0. At codegree two, the opposite endpoint packing removes no additional rim edge. The earlier one-endpoint operation proves, for each h in {x,y},

    nu_match(H_u-h)=m_u, nu_match(H_v-h)=m_v.

Indeed any gain followed by the reserved uvh-page would already exceed nu(Q). The proof below can alternatively take these two equalities as explicit hypotheses on an arbitrary graph/packing interface.

Fix the SAME reserved hub h at both endpoints, and write g for the other common neighbor. For a set S of triangles in M_0, let H_u^S,H_v^S release exactly the physical rim edges occupied by those triangles, retaining all other occupied-edge exclusions. Define

    a_u(S)=nu_match(H_u^S-h)-m_u,
    a_v(S)=nu_match(H_v^S-h)-m_v.

The two chosen endpoint matchings have no common physical rim edge: their common vertex set after deleting h is contained in {g}. Thus the literal replacement, retaining M_0-S and appending uvh, has size

    k + a_u(S)+a_v(S)-|S|.

A set S is profitable when a_u(S)+a_v(S)>=|S|+1.

## Compression theorem

If ANY release set S is profitable, some single T in S satisfies

    a_u({T})=a_v({T})=1.

Thus existence of a profitable release set is EQUIVALENT to existence of a jointly releasing single outside triangle, for a fixed packing M and reserved hub h. This is stronger than a sufficient release criterion, but it does not prove that such a triangle exists.

Choose maximum matchings N_u,N_v in the released, h-deleted links. Call a selected rim new if it belongs to an S triangle; all other selected rims belong to the old corresponding link. Each new edge has a unique S label because M_0 is edge-disjoint. Each triangle T supplies at most one selected rim to N_u and at most one to N_v, since any two of its edges meet.

If T supplies one selected rim to EACH matching, the rims are distinct and share a vertex. Their shared vertex must be g: an endpoint shared by a u-link rim and a v-link rim is a common neighbor of u,v, and h was deleted. Consequently at most ONE S triangle can supply two selected rims. Two such triangles would make N_u (and also N_v) use g twice. Hence, writing n_u,n_v for the numbers of new selected rims,

    n_u+n_v <= |S|+1.

Delete all new edges from the two matchings. What remains consists of old-link matchings, so

    |N_u|-n_u <= m_u, |N_v|-n_v <= m_v.

Therefore

    a_u(S)+a_v(S) <= n_u+n_v <= |S|+1.

Profit forces equality throughout. In particular there is exactly one doubly used triangle T*, every S triangle supplies at least one selected rim, and BOTH old remainders already have sizes m_u and m_v. Add back only the selected T* rim to each old remainder. These are matchings in H_u^{T*}-h and H_v^{T*}-h of sizes m_u+1 and m_v+1. Releasing one triangle can increase either rank by at most one, so both gains are exactly one. This proves compression without any exchange of different M_0 triangles or any submodularity inference.

## Literal geometry and an equivalent neutral repacking

The pivotal triangle has the form T*={g,a,b}, with a a u-exclusive neighbor and b a v-exclusive neighbor. The two selected new rims are ga and gb. Neither a nor b is h, and neither is an endpoint u,v because T* lies in M_0. Codegree two makes the non-hub neighbors exclusive.

The two old-remainder matchings avoid BOTH x and y: they avoid h by construction, and avoid g because their full matchings also contain the pivotal rims at g. Thus replacing M_u,M_v by these old-remainder matchings gives another actual maximum packing M' of L with the SAME M_0. The u-spoke ua and v-spoke vb are unused by M'. One can then make the literal three-for-one replacement

    gab -> uga, vgb, uvh.

This gives k+1 actual edge-disjoint Q triangles. Equivalently, apply the already accepted single-triangle link repair directly to M. The neutral-repacking description makes all formerly occupied endpoint spokes explicit; it is not needed to justify the rank inequalities.

## Exact obstruction and useful limitation

If no single triangle jointly releases the two h-deleted links, then EVERY set S obeys

    a_u(S)+a_v(S) <= |S|.

Hence releasing arbitrarily many outside triangles and replacing ONLY the two endpoint fans, while keeping the remaining outside packing fixed, cannot pay the missing extra unit. This remains true even when individual released-label matching ranks have complementarity or fail submodularity. A successful next operation must either identify the single pivotal triangle already isolated here, or change the OUTSIDE packing itself by using other actual L triangles. Merely increasing the number of released labels adds no new power in this codegree-two, common-reserved-hub framework.

When both old endpoint links are empty, the statement is particularly literal: a jointly releasing triangle is exactly an occupied triangle gab with a u-exclusive and b v-exclusive. A mixed triangle gab which is actual but UNPACKED has its rims ga,gb in different occupied M_0 triangles (otherwise both would force gab itself to be that packed triangle). Thus an unpacked crossing triangle can connect the two sides without being the pivotal occupied triangle. The full cover-disagreement graph includes such triangles and also omits triangles hit by the common cover D; neither closest-cover reachability nor abstract component connectedness alone changes this occupied-edge fact. This identifies the precise remaining bridge rather than promoting a cover matching to a packing.

The smaller K5-pq control in matching26_endpoint_link_operations_v1.md has no jointly releasing singleton and therefore no profitable S here; its predecessor is fragile and it is not a full-profile counterexample. The star555 control has codegree three, so the compression hypotheses deliberately do not apply: multiple common physical rims remain after reserving one hub. No new computation or census is used.

Dependencies: notes/matching26_endpoint_link_operations_v1.md and reviews/opening_endpoint_link_review.md; notes/matching26_one_outside_triangle_repair_v1.md and reviews/opening_one_outside_repair_review.md. Full minimum-Q cover saturation/closeness is not needed for this compression lemma and still has to force availability or an outside-packing replacement. No universal Tuza conclusion is claimed.
