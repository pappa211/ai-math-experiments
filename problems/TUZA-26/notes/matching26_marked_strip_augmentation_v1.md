> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A marked two-hub strip gives a two-triangle augmentation

TUZA-26 ordinary operation, frozen 2026-11-16. This is an actual packing augmentation under an explicit complete boundary condition. It does not assert availability of the strip from the minimum-cover exchange graph.

## Precise statement

Let Q be a simple graph, let e=uv be an edge with exactly two common neighbors x,y, and put

    K=Q-e, P_x={xu,xv}, P_y={yu,yv}, L=K-P_x-P_y.

Suppose nu(Q)=nu(K)=k and nu(L)=k-1. In the conditional minimum-Q application, the latter equality follows from two-edge resilience of Q and the page-pair blocker equations: a k-packing of Q-P_x must use the only surviving e-page uvy, and deleting it yields a (k-1)-packing of L; conversely nu(L)<=nu(K-P_x)=k-1.

Assume K contains the literal subgraph D formed by joining the hub edge xy to a path

    v_0=u, v_1, ..., v_l=v,       l>=3,

where all path vertices and the two hubs are distinct. Thus E(D) consists of xy, all xv_i,yv_i, and the l path edges v_(i-1)v_i. Write

    B={xy,xu,yu,xv,yv}.

The COMPLETE boundary assumption is: for EVERY actual triangle T of Q whose edge set is not contained in E(D),

    E(T) intersect E(D) is contained in B.

No vertex privacy, induced-subgraph assumption, absence of retained background edges, or absence of external triangles is assumed. The complete edge-boundary condition quantifies over them all. The two restored e-pages are outside D and meet D only in the four endpoint spokes, as allowed.

Then these hypotheses are inconsistent: Q has a packing of at least k+1 triangles.

## Local path packing calculation

For m>=1, the join of a hub edge xy with a path of length m has triangle packing number exactly m. The m rim triangles obtained by assigning alternating hubs to consecutive path edges are edge-disjoint. For the upper bound, every triangle is either a rim triangle (one path edge and one hub) or a spine triangle (xy and one path vertex). A packing without a spine triangle uses at most one triangle per path edge. A packing with a spine triangle can use no rim triangle on an edge incident with its apex, so it has at most 1+(m-1)=m triangles. This includes m=1, where the join is K4.

The graph D with its four endpoint spokes removed has the same triangle family as the join of xy with the internal path v_1,...,v_(l-1), of length l-2>=1. The two endpoint path edges remain as background and lie in no remaining D triangle. Therefore this residual D family has packing number l-2.

## The actual augmentation

Take an actual (k-1)-packing M of L. Partition it into M_D, the triangles whose edge sets are contained in D, and M_out, all other triangles. The preceding calculation gives

    |M_D|<=l-2, hence |M_out|>=(k-1)-(l-2).

Retain every triangle in M_out. The complete boundary hypothesis implies that a retained triangle can use a D edge only from B. Because M is a packing of L, no retained triangle uses any of the four endpoint spokes. Thus a retained triangle can meet D only in the hub edge xy.

Now append the l alternating-hub rim triangles on the full path of D. They are pairwise edge-disjoint and avoid xy. They therefore avoid EVERY retained triangle, including triangles through arbitrary outside vertices and background edges. The resulting actual packing in K, and hence in Q, has size at least

    (k-1)-(l-2)+l = k+1,

contradicting nu(K)=nu(Q)=k.

This construction deletes only local packing triangles; it does not delete graph vertices or discard crossing triangles. Each retained outside triangle is checked by the complete boundary condition, and the only boundary edge it may still use is explicitly avoided by the appended packing.

## Scope and availability

This excludes a COMPLETE-boundary strip of every length l>=3 when its path endpoints are EXACTLY the missing-edge endpoints u,v and its hubs are EXACTLY the two common neighbors x,y. It is stronger in this marked situation than a cover-extension payment requiring longer strips. It does not apply to an arbitrary two-hub path elsewhere in Q, nor to an apparent strip with an unaccounted outside triangle on a private D edge.

Choosing page-containing minimum K covers with minimum outside exchange distance ensures their entire disagreement graph lies in the one component containing the four marked spokes: every other balanced component could be aligned with the first cover while retaining the second page pair and reducing the distance. This fact alone does not produce D or its complete boundary. An outside triangle on a private candidate-strip edge can be hidden by the covers' common part D_common. Universal full-triangle eligibility supplies a minimum Q cover containing that outside triangle, but does NOT guarantee this cover also contains e; without e it has tau(K)+1 old edges and cannot simply be inserted into a minimum-K-cover exchange argument.

Consequently the remaining next step is specific: extract a literal marked two-hub path with the displayed complete boundary, or provide a direct repair for a crossing triangle. A Dulmage–Mendelsohn component or an abstract alternating cycle, without this actual edge/triangle boundary statement, is not enough.

## Dependency chain

Accepted minimum-Q no-blocker and page-blocker profiles -> nu(L)=k-1 -> the marked-strip augmentation above (PROVED_ORDINARY, independent review requested) -> existence of such a strip or another paid operation (OPEN) -> elimination of the final core (OPEN) -> Tuza.

Sources relied on: notes/matching26_book_exchange_v2.md for the common-residual argument; notes/matching26_doublecone_exchange_diagnosis_v1.md for the elementary two-hub path packing calculation. No numerical computation or finite search was used for this proof.
