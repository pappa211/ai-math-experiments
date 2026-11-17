> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: no K2/K3-only minimum cover in a minimum CS obstruction

Decision: ACCEPT USING THE DECLARED CLASS-LOCAL MINIMAL-CS INPUTS. This is a cover-shape restriction on a minimum obstruction. It is not a direct full-CS theorem for every graph admitting this minimum-cover shape.

Frozen source: notes/challenger_small_component_cover_exclusion_v1.md
SHA256: f850a3338718e2ee644d56262019ff5b43c36f8135371cf283f832eeedc3ebff

The explicitly used obstruction inputs are proper-subgraph CS, tau(G)=2nu(G), and actual edge codegree at least2. Earlier local-family classification, all-two-page equality, and literal clique-avoidance facts have already received independent review. This review reconstructs the new four-core argument rather than inferring it from the weighted graph alone.

## Universal degree-three condition

For any choice of maximum local private packings and book pages, the potential reciprocal graph satisfies the reviewed weighted lemma. A weight2 vertex of degree at most2 can be selected while deleting at most3 vertices, producing a strict half-unit surplus. The remainder cannot acquire a new all-weight1 odd cycle because every such vertex already had original degree at most2. Exceptional original odd cycles are separately strict. Thus equality forces degree3 at EVERY private-three core under EVERY choice. Its three chosen apices must occupy distinct other cores, all pointing back.

This universal quantifier legitimately survives later changes to a neighbor's private three-packing. Two of its apices in the same center core would bound its number of outgoing target cores by2, contradicting the condition regardless of the other choices.

## Exact residual support and balanced accounting

Let R be the chosen private-three center and its three distinct target cores. The center's three pages and internal triangles of the s neighboring triangle cores pack3+s, while their selected cover cost is6+2s.

The graph K is defined as the edge support of ALL actual triangles assigned to the remaining cores. It contains no selected edge of a removed core. Any actual triangle of K still has a selected C-edge, which must therefore belong to a retained core. Hence K has exactly the retained assigned triangle family, including every crossing triangle; support closure does not create an unassigned exception.

No K edge has both endpoints in the vertex union of the removed cores. A retained-family triangle containing such an edge would have its selected edge incident with one of those removed-core vertices, and every selected edge incident with such a vertex belongs to a removed core. That is impossible. All initial local packing edges consequently lie outside K.

K is proper. The displayed chain tau(G)<=|C_R|+tau(K)<=2|P|+2nu(K)<=2nu(G) is justified by the exact family partition and disjoint local packing. Tightness forces B(K) and the exact packing budget.

## Neighbor augmentations and full footprints

At a triangle neighbor U=xuv, only the center page abx can conflict with a U-page. Two private U-pages avoiding that page are compatible with all other selected center/internal triangles. In any literal residual block there is at most one U vertex, since all three U base edges are absent. Each added page therefore contributes at most one spoke in that block, and two contributions share that U vertex. The ENTIRE added footprint is an adjacent edge pair or less, so residual maximum packings can avoid it.

Failure of this augmentation has the asserted exact apex-list consequence. The allowed sets on xu,xv delete a,b, while the uv list is unchanged and nonempty. If either incident allowed list is nonempty, absence of a two-SDR forces it and the opposite list to be one common singleton d. Since d is on two actual bases, closure makes it full, so both incident allowed lists equal {d}. If both incident lists are empty, all their original apices lie in {a,b}. In either case any original three-packing would use a and b on the two incident bases, violating the universal degree-three target condition. Thus U is private-two and its two full apices must be exactly a,b; otherwise one could choose two pages avoiding abx. This gives the literal K5 bag.

At a book neighbor xx', a page with apex outside {a,b} similarly augments. A residual block contains at most one of x,x', so its footprint is at most one edge. Thus all page apices lie in {a,b}. Codegree at least2 is used here to force BOTH apices, giving a literal K4. This is precisely where the proof requires the minimum-obstruction input; minimum-cover optimality alone was not substituted for it.

## Final simultaneous augmentation

The three bags use three disjoint neighbor-core vertex sets and different center attachment edges. Distinct bags intersect in at most one center vertex, so their internal maximum packings are mutually edge-disjoint. Choosing each packing to avoid its own attachment edge also makes them disjoint from the center triangle. All their endpoints lie in R, hence none of their edges lies in K by the earlier exact support fact.

They give3+s triangles, and the center triangle adds one beyond the balanced budget. Appending a maximum K packing contradicts maximum cardinality. Arbitrary outside attachments were accounted for either in the retained actual family or in the new-page footprint arguments.

No gap, missing finite-domain hypothesis or unrecorded quantifier change was found. The result excludes ALL K2/K3-only minimum covers of a minimum CS obstruction. It leaves larger connected minimum-cover components and the stronger direct equality theorem outside this obstruction setting unresolved.
