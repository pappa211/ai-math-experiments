> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# K4 star-boundary peeling and terminal-bearing residual leaves

Status: ordinary proof candidate. The boundary is defined using ALL actual triangles; arbitrary background edges and outside pages are permitted.

## General K4 peeling theorem

Let L be a literal K4 subgraph of G. Let A be the graph formed by the edge supports of all actual G triangles that are not wholly contained in L. Define the outside-triangle boundary

    D=E(L) intersect E(A).

Suppose D is contained in a star of L. Then CS(A) implies CS(G).

First, every actual A triangle is an actual G triangle. An actual triangle wholly contained in L cannot lie in A, because the intersection E(L) intersect E(A) is a star and contains no triangle. Conversely every actual G triangle outside L was included in the definition of A. Thus the actual triangles of A are exactly the triangles of G outside L.

The face of L opposite the star center avoids the entire edge set of A. It can be appended to any maximum A packing. Conversely a packing uses at most one triangle of L and at most nu(A) other triangles. Therefore

    nu(G)=nu(A)+1.

A minimum cover of A and a two-edge cover of L cover all G triangles, so

    tau(G)<=tau(A)+2.

CS(A) proves the inequality for G. If G is tight, the displayed relations force A tight, hence B(A). If D is nonempty, choose e in D. Every A edge is triangle-supported by the definition of A, so e lies in an actual K4/K5 component of A. Choose a minimum cover of that component containing e, extend it to a minimum A cover, and choose the opposite-pair cover of L containing e. Their union has at most tau(A)+1 edges, contradicting tightness. Therefore D is empty. The actual triangle supports of A and L are now disjoint, and all actual G triangles were accounted for. Thus B(G).

A is a proper edge-subgraph because at least the opposite face edges of L are absent from it. Consequently a minimum-edge CS failure contains no literal K4 with star-contained outside-triangle boundary. Equivalently, every K4 boundary in such a failure contains either two opposite edges or all three edges of a triangle: an edge family of K4 with no disjoint pair is a star or a triangle.

## Application to a triangle residual

Let G be a minimum-edge CS failure, let T be an actual triangle, and put H=G-E(T). Suppose H contains a literal K4 L and an edge pq of L such that every actual H triangle not wholly in L meets E(L) only possibly in pq. This is an explicit triangle-support boundary hypothesis; it is not inferred from a drawing or an induced core.

The three vertices of T are independent in H, so at most one of them belongs to L. Every triangle created when T is restored is either T itself or an ordinary page on one of its three bases. If no T terminal belongs to L, none of these new triangles uses an L edge. If its unique terminal a belongs to L, every L edge used by any new triangle is incident with a. This is a statement about the ENTIRE new family; it remains true for any number of outside apices and arbitrary background edges.

If a is absent or belongs to {p,q}, the old boundary {pq} and the whole new boundary together are contained in one star of L. The general theorem contradicts minimality. Therefore any such residual K4 leaf must contain a T terminal outside its attachment edge pq.

For a literal clique tree obtained by fresh edge gluings, a leaf bag's two vertices off its attachment edge occur in no other bag. Thus distinct K4 leaf bags require distinct T terminals, and there can be at most three K4 leaves in H. This counting conclusion requires that fresh-gluing/running-intersection hypothesis. The general boundary theorem above does not assume private vertices and does not by itself bound the number of leaves in arbitrary edge-support descriptions.

No bound on the length of a surviving tree path, no analogous K5 star-avoidance claim, and no classification of all connected defect-one residuals follows here. In particular K5 can fail to preserve its maximum two-packing after deletion of three incident edges, so the K4 face argument must not be silently reused for K5 leaves.

Dependencies: proper-subgraph combined CS in the minimal-obstruction application, elementary K4 star avoidance, and minimum covers through a prescribed edge in K4/K5. No external theorem or finite computation is used.
