> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: actual endpoint-link operations

Verdict: PASS, PROVED_ORDINARY for notes/matching26_endpoint_link_operations_v1.md, SHA-256 bd036561b1f7ce72e97584ee541105b12ce20be51b21e4a99b81c381f834f901. The supplied matching witnesses are exact packing operations; existence of applicable witnesses remains OPEN. No computation or Lean verification was needed.

An actual maximum L packing partitions into endpoint-u triangles, endpoint-v triangles and triangles containing neither endpoint, because L has no uv edge. Edge-disjoint u-triangles correspond exactly to a matching of their physical opposite edges. Their link matching exposes both marked hubs x,y, whose u-spokes are absent from L.

For a one-endpoint replacement, every retained triangle avoids u. Thus every u-spoke is free, and excluding every retained PHYSICAL rim edge from the link is sufficient to ensure compatibility. The opposite endpoint v is excluded from the link. A matching of size m_u+1 avoiding hub y can therefore replace M_u, and the uv-page through y appends using only missing or unused edges. The count gives k+1. The symmetric statements hold at either endpoint and for either reserved hub.

Each vertex-deleted link contains the original matching, so the resulting matching-number equalities are exact. Any augmenting path relative to that matching must have x,y as its two exposed ends: an exposed vertex cannot be internal to an alternating augmenting path, and a path with any other endpoints would avoid at least one marked hub and trigger the one-endpoint repair. Deleting one vertex reduces a matching number by at most one, also giving the stated full-link bound m_u or m_u+1.

When both endpoint families are replaced, retain M_0 only. The only possible cross-family edge collision is a common physical rim edge. A u-spoke cannot equal a v-spoke or a v-link rim because opposite endpoints are excluded from the links. The common rim set is exactly the induced edge set on all common neighbors X, minus occupied M_0 edges. Disjoint selected rim sets with total matching gain at least two therefore give k+1 triangles in K. No auxiliary cover-edge matching is being interpreted as a triangle packing.

At codegree two, retaining the old opposite endpoint family removes no extra usable rim edge. Such a rim would need both endpoints in{x,y}, but the old opposite endpoint triangles use neither marked hub. Consequently the one- and two-endpoint links coincide, and their only possible common rim is xy. If xy is absent or occupied, simultaneous augmentations are automatically disjoint. If xy is free, it directly augments either old matching. Any other augmenting x-y path avoiding that edge could be used at one endpoint and paired with the direct edge at the other, giving the forbidden gain two. Thus every augmenting matching must use xy in that surviving case.

## Ordinary controls and scope

For the already certified star555 control, u=4,v=5,x=0,y=1. In L the first leaf has only triangle016 and background46,56. Its full triangle family is partitioned by central K4, the two other K5 leaves and triangle016, giving upper bound1+2+2+1=6. The displayed six-packing attains it. Every maximum therefore includes016, and the endpoint families are empty because4,5 lie in no L triangle. The endpoint neighbor sets are{0,1,6}, whose three rim edges are all occupied by016. Both usable links are empty for EVERY maximum L packing. Its connected resilient defect-two K and local page equations were independently certified earlier, but Q fails the required global core hypotheses. This is an actual limitation of the weaker local assumptions, not a counterexample to the full minimum-Q theorem.

For Q=K5-pq, e=up, hubs a,b, K is K4[uqab] with trianglepab on ab. It has nu2,tau2, whereas Q has nu2,tau3. L has just triangleqab and backgrounduq. Both endpoint usable links are empty. K is fragile (deleting ab leaves a one-packing graph), and a minimum two-cover cannot contain either full marked page pair; this control likewise lies outside the full profile.

All named-control optimum facts used here were already accepted; the new common-residual partitions and explicit packings were checked ordinarily. No new census was run. The unresolved bridge is changing an occupied triangle of M_0 or using a global constraint to force a valid link witness, rather than merely restating absence of augmenting paths.

Frozen UTC: 2026-11-16T23:57:54.784909+00:00
