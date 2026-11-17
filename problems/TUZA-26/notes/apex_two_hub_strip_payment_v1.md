> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Complete-boundary two-hub strip: a cover and packing payment

Frozen ordinary supporting candidate v1, TUZA-26, 2026-11-17. Independent review required. This general complete-boundary payment is superseded at the actual codegree-two marked endpoints by the stronger packing augmentation in notes/matching26_marked_strip_augmentation_v1.md. No strip availability is inferred from an abstract exchange path.

Let H contain the literal subgraph D which is the join of hub edge ab with a simple path v0,...,v_l. The hubs and all path vertices are distinct. Suppose the COMPLETE outside-triangle boundary of D is contained in

    F={ab,av0,bv0,av_l,bv_l}.

Precisely: every D edge belonging to an actual H triangle that is not a triangle of the stated D lies in F. An endpoint chord v0v_l is permitted, as are arbitrary outside triangles through the hubs, endpoints, and even internal vertices using only retained outside edges.

Let I=E(D)-F and let R=H-I, retaining EVERY vertex and every other edge. The boundary premise says exactly that every lost actual triangle is a D triangle. The only D triangles surviving in R are the endpoint spine triangles abv0,abv_l; all outside triangles survive. In particular, genuine private internal vertices are a sufficient special case, but are not necessary for this edge-deletion operation. No crossing triangle is silently discarded.

## Universal transfers

For l>=3, choose the l-2 rim triangles on the internal path edges v1v2,...,v(l-2)v(l-1), alternating the two hubs. They are edge-disjoint and use only I. They therefore append to ANY R packing, giving

    nu(H)>=nu(R)+l-2.

Every R cover extends to an H cover with at most l new edges. If the cover contains ab, add all l rim edges. Otherwise the two retained endpoint spine triangles force at least one chosen hub spoke at each endpoint. Choose one such spoke at each end. At the l-1 internal vertices choose hub spokes alternating from the first endpoint's chosen hub color. These spokes cover every lost internal spine triangle and all rim triangles except possibly those on the last path edge. If the endpoint colors disagree with the required parity, add that one rim edge. This uses at most (l-1)+1=l new edges and covers ALL lost actual triangles. Consequently

    tau(H)<=tau(R)+l.

If proper-subgraph CS applies to R, these inequalities yield

    delta(H)=2nu(H)-tau(H)>=l-4.

This is a literal paid operation with the complete five-edge retained boundary. It does not require resilience of H or R.

## Defect-one consequence: no strip of length at least five

If delta(H)=1, every l>=6 contradicts the preceding inequality. For l=5, equality throughout would be necessary:

    nu(H)=nu(R)+3, tau(R)=2nu(R), tau(H)=tau(R)+5.

Proper CS therefore puts R in B. The two endpoint spine triangles share ab and must belong to one literal K4/K5 component Z of R. In particular Z contains a,b,v0,v5, and contains the endpoint chord v0v5 even though that chord was not assumed in H initially.

Choose a minimum Z cover containing the disjoint endpoint spokes av0,bv5. If Z=K4, those two opposite edges themselves form such a cover. If Z=K5 with fifth vertex w, use the four-edge cover {av0,aw,v0w,bv5}. Choose arbitrary minimum covers in the other B components. This is a minimum R cover containing both endpoint spokes.

Add only the four alternating internal spokes bv1,av2,bv3,av4. Together with av0,bv5 these cover every lost rim triangle, and each internal spine triangle meets its selected spoke. Thus tau(H)<=tau(R)+4, contradicting the forced increase five.

Hence a defect-one H with proper CS on the retained residual cannot contain the stated complete-boundary strip of any length l>=5. In a surviving minimum Q, any such literal long strip must have an actual outside triangle using at least one private D edge in I. This is the exact necessary boundary violation; it is not evidence that the violating triangle can already be paid for.

## Defect-two predecessor with nonadjacent endpoints

Suppose instead delta(H)=2 and v0v_l is absent from H, as when H is the single-edge predecessor K and the path endpoints are the missing-edge endpoints. The residual R cannot satisfy B: its two retained endpoint spine triangles would force the missing endpoint chord in one literal tight clique. Proper CS therefore gives delta(R)>=1, and the universal transfers improve to

    delta(H)>=delta(R)+l-4>=l-3.

Thus l<=5. At l=5 all bounds are exact: R has defect one, nu(H)=nu(R)+3 and tau(H)=tau(R)+5. If R has a packing-critical edge g, cover extension and proper CS force R-g to be B. Such g must belong to F, since otherwise both endpoint spine triangles survive and again force the absent endpoint chord. This isolates a five-edge resilience obligation, rather than treating R as automatically resilient or named.

At the ACTUAL marked endpoints of the codegree-two Q interface, the stronger accepted-profile equality nu(K-four endpoint spokes)=nu(Q)-1 permits the worker's direct packing replacement for every l>=3. That stronger argument takes priority there. The present payment remains useful for unmarked strip regions and explicitly separates their transfer from the unproved availability of their boundary.

No numerical search was used. The predecessor's resilience does not itself guarantee the complete-boundary premise: external triangles can meet private path/spoke edges and change local packing responses. The marked cover-exchange graph has not been shown to supply this geometric strip, and no global Tuza conclusion follows from this local operation.
