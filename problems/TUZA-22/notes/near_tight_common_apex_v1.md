> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Defect-one triangle components with a common apex

Coordinator ordinary proof candidate, 15 November 2026. A scoped classification of one near-tight family; it does not assert that general near-tight components have a common vertex.

## Elementary matching-cover improvement for triangle-free graphs

Let L be triangle-free, with maximum ordinary matching M of size r. Let U be the unmatched vertices. U is independent, since otherwise M could be enlarged. For each matching edge xy, at least one endpoint has no neighbor in U. Indeed, if x andy had unmatched neighbors u andw, then u=w would give the triangle uxy, while u!=w would let us replace xy by xu,yw and enlarge M.

Choose one such safe endpoint from every M edge, forming S of size r. S has no neighbors in U. If r>=3, triangle-freeness ensures that S has two nonadjacent vertices p,q. Thus U union{p,q} is independent. Its complement is a vertex cover with at most2r−2 vertices. Consequently

    tau_vertex(L) <= 2 nu_matching(L)−2  whenever nu_matching(L)>=3.

For r=1 the same safe-endpoint argument gives tau_vertex<=1; for r=2 it gives tau_vertex<=3. More generally any independent subset of S yields a corresponding saving, but no Ramsey-number input is needed here.

## Application to graph triangles with a common vertex

Suppose a nonempty actual triangle component J has a common vertex z, and use its literal edge-support graph. The rim L=J−z is triangle-free: any rim triangle would be an actual J triangle missing z. Every actual triangle is zxy for one rim edge xy. Hence

    nu(J)=nu_matching(L), tau(J)=tau_vertex(L).

For the cover identity, a rim vertex cover gives a spoke cover. Conversely replace every selected rim edge of a mixed triangle cover by one endpoint's spoke, retaining already selected spokes. This does not increase size and still meets every zxy triangle; the selected spoke endpoints form a vertex cover of L.

Therefore a defect-one component, tau(J)=2nu(J)−1, must have nu(J)<=2. In particular it cannot be the unique defect-one residual component of a minimum CS failure once the already reviewed packing-number exclusions imply nu(G)>=4 (and hence residual packing at least3).

## Exact classification at the remaining two packing values

If nu(J)=1, then L is triangle-free with matching number1. Its edges form a star: pairwise incident graph edges either have a common endpoint or are the three edges of a triangle, and the latter is excluded. Thus J is a book.

If nu(J)=2 and tau(J)=3, L is not bipartite, by the ordinary Konig matching-cover theorem. A shortest odd cycle in L has length at least5, and at most5 because a cycle of length at least7 would contain a matching of size3. Hence L contains an induced C5. An additional edge incident with a vertex outside this C5 would also give a matching of size3: if it meets the C5 at v, append the two-edge perfect matching of C5−v; if disjoint from C5, append any two cycle matching edges. Chords of C5 create triangles and are forbidden. Thus L is exactly C5 plus possible isolates, and the triangle-support graph J is the five-wheel (a hub joined to C5).

Conversely a nonempty book has (nu,tau)=(1,1), and the five-wheel has (2,3). Thus the only defect-one actual triangle components with a common apex are books and the five-wheel.

The classification uses only the displayed matching argument, triangle endpoint geometry, and Konig's standard bipartite matching-cover theorem. The bound excluding packing>=3 is self-contained and does not require Konig or the classification.

## Global role and limit

Active-kernel peeling leaves a minimum CS failure's triangle residual with one connected defect-one triangle component, of packing k−1. The present theorem excludes common-apex representations of that component for k>=4. This diagnoses a real limitation of cone-normalization proposals; it does not provide a transformation from arbitrary components to cones. The connected noncone defect-one class remains the primary open structural problem.
