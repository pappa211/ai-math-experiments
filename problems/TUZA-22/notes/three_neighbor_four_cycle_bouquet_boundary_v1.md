> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The exact surviving three-neighbor four-cycle bouquet boundary

Frozen ordinary boundary diagnostic, 2026-11-16. This is an obstruction to a proof method, not a counterexample to Tuza or CS.

After the accepted apex-pseudoforest classification and full-C4-component exclusion, a remaining such closed link L would have c>=2 components of L-w, each a C4 with cyclic labels0_i,1_i,2_i,3_i, and w adjacent exactly to0_i,1_i,2_i. The following parameters are exact.

## No WKE tuple exists

The matching number of L is2c: use a perfect matching in each C4, and the order4c+1 gives the upper bound. For ANY matching P, suppose Q covers L-P.

If w belongs to Q, every C4-P still requires at least two cover vertices. A matching deletes at most two cycle edges, and deleting two disjoint cycle edges leaves two disjoint edges; deleting one leaves P4; deleting none leaves C4. Thus |Q|>=2c+1>|P|.

If w is not in Q, every surviving w-neighbor must belong to Q. At most one of its3c spokes can be in P, so |Q|>=3c-1>2c>=|P| for c>=2.

Therefore L is genuinely non-WKE. Componentwise WKE or a larger matching search cannot repair this boundary. The vertex-cover number of L itself is2c+1, attained by w plus two opposite vertices per cycle.

## The literal cone is strongly strict

Let A=h+L. In each component choose the three triangles

    w 0_i 1_i, h 1_i 2_i, h 3_i 0_i.

These form an edge-disjoint3c-packing across all components and avoid hw. The3c edges

    h0_i, h2_i, w1_i   (for every i)

cover every actual triangle of A, including every hw-page. Thus

    nu(A)=tau(A)=3c.

The local cone therefore satisfies Tuza strictly. Arbitrary outside pages, not a tight local cone, are the remaining issue in a minimum-CS transfer.

For each i, deleting h3_i lowers the cone packing number by one. The affected local triangle support becomes K5-e on {h,w,0_i,1_i,2_i}; the two residual cycle edges incident with3_i are triangle-free in A-h3_i. That K5-e has packing two, while other components still contribute three each and no triangle crosses components except through the common edge hw. Hence nu(A-h3_i)=3c-1. In a true minimum-CS ambient G, M0 instead requires nu(G-h3_i)=nu(G), so outside triangles must compensate. No claim that this compensation is impossible is made.

## Feedback vertex number

If w is deleted, at least one vertex must be deleted from each C4, giving c+1 vertices, and that choice suffices. If w remains, at least two vertices must be deleted from each C4: deleting only one leaves a cycle in w+C4 with its three spokes. Explicitly, deleting the nonneighbor3 leaves a diamond; deleting1 leaves the cycle w0-3-2-w; deleting0 or2 leaves a triangle through w and the other adjacent pair.

Therefore the feedback vertex number is min(c+1,2c)=c+1>=3. In particular this remaining link cannot have a two-vertex forest deletion. This is useful in the separate Hamiltonian-cycle-cover direction, where the two selected neighbors of a vertex leave a forest in its link.

Dependencies: the exact displayed graph only, elementary matching/cover counts, and the elementary K5-e packing number. No computation or external theorem is used. Excluding this final non-WKE bouquet in an arbitrary ambient minimum-CS graph remains open.
