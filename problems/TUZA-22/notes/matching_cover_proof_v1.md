> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching triangle covers: a scoped equality theorem — frozen v1

Coordinator-developed ordinary proof candidate,15November2026. Pending independent AI review and prior-art comparison. Not an unrestricted proof or claim of novelty.

## Exact theorem

Let G be any finite simple graph having a matching M of actual edges that meets every actual triangle. Then tau(G)<=2nu(G). Equality holds if and only if every nonempty shared-edge triangle component has literal K4 support (triangle-free case vacuous). No bound on order, degree, number of matching edges, or triangle-free background is assumed.

Equivalently, start with a triangle-free graph H and add an arbitrary matching of missing edges: the resulting graph satisfies CS, and its tight triangle components are K4, not K5.

## Proof

Discard from M any edge lying in no triangle. Write r=|M|. Every actual triangle has exactly one M edge, since M is a matching. Partition the entire triangle family into r nonempty books according to that edge, called its base.

Choose one actual triangle from each book, arbitrarily. The intersection graph of these r chosen triangles (adjacent when sharing a graph edge) is a matching plus isolated vertices. To see this, take a chosen triangle on base ab with third vertex x. Another chosen triangle has a different disjoint base cd. Edge intersection is possible only if x is one of c,d and that triangle's third vertex is one of a,b. Thus a chosen triangle can conflict only with the chosen triangle in the unique book whose matching base contains its apex x. If x lies outside all matching bases, it has no conflict. Consequently maximum degree is at most one.

Select one triangle from each conflicting pair and every isolated chosen triangle. This gives at least ceil(r/2) edge-disjoint triangles. Since M itself is a cover,

    tau(G) <= r <= 2nu(G).

Now assume equality, with r>0. Both inequalities are equalities, so r=2nu(G) is even and tau(G)=r. For EVERY selection of one triangle per book its intersection graph must be a perfect matching: if it had an isolated vertex, because r is even it would have at least two isolated vertices, and its independent set would have size greater than r/2, contradicting nu(G)=r/2.

Fix a book i and one of its triangles T, whose base is ab and apex x. By the preceding perfect-matching conclusion, x belongs to some other base cd (book j), and EVERY triangle chosen from book j must intersect T; all choices in other books are arbitrary and cannot meet T. Hence every j-triangle has its apex in {a,b}. Conversely, fix one j-triangle. The same argument applied while varying the chosen i-triangle shows that every i-triangle has apex in {c,d}. No i- or j-triangle has an apex on any other base or outside these four vertices. The books therefore partition into disjoint pairs, and all triangles belonging to each pair lie on its four base endpoints.

For one pair with bases ab,cd, activity of both books and cross-intersection force at least three of the four cross edges ac,ad,bc,bd. If exactly three exist, the entire triangle family in that pair consists of two triangles sharing a cross edge. Selecting that one cross edge and retaining every other matching-base edge gives a cover of G of size r-1, a contradiction. Therefore all four cross edges exist. The paired books are exactly the four actual faces of the literal K4 on a,b,c,d.

All actual triangles belong to one such paired book, so no actual crossing triangle joins pairs. Their edge supports are disjoint (indeed their vertices are disjoint because matching bases are disjoint). All remaining graph edges are triangle-free. Thus every nonempty triangle component is a K4. Conversely, additivity gives tau=2nu whenever all triangle components are literal K4. QED.

## Exact global role and limits

This is an unbounded scoped theorem for graphs admitting a matching triangle transversal. There is no claim that a minimum CS obstruction admits one; such availability would itself be a new global requirement. The theorem uses all actual triangle constraints and does not apply merely because selected/private triangles have matching bases. It does not prove arbitrary B-plus-matching restoration: old supported block edges can obstruct simultaneous page packings.

Reasons to pursue: (1) endpoint geometry converts arbitrary choices into a maximum-degree-one conflict graph, an actual integral packing certificate; (2) equality rigidifies all choices, showing how tightness can force clique components without a bounded census. Risks: (1) matching-cover availability is highly restrictive; (2) extending through existing supported blocks introduces footprint conflicts absent here.

Cheapest falsifier: a literal graph with a genuine matching transversal and tau>2nu or equality outside K4 components. Independent proof review should challenge the universal choice-to-perfect-matching step and check background/crossing triangles. Finite examples cannot prove matching-cover availability in arbitrary graphs.
