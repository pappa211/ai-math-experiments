> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent two-triangle low gain: the two J2 patterns, v1

Frozen ordinary proof candidate, 2026-11-17 UTC. Author: matching_geometry; the short matching-pattern bare-page proof was independently supplied by apex_challenger. Fresh independent review is required. No computation is used.

## Exact scope

Let B be a finite simple graph whose triangle components are literal K4s and K5s; arbitrary triangle-free background edges and arbitrary shared vertices are retained. Put m=nu(B), so tau(B)=2m. The six distinct edges of T=abc and U=ade are absent from B, and H=B+E(T)+E(U). Assume:

1. the triangle support of H is one triangle component, and H has no nonisolated edges outside that support;
2. nu(H)=m+2 and tau(H)=2m+3;
3. deleting any one edge of H preserves nu(H);
4. the new-triangle families of B+T and B+U individually have packing number q_T=q_U=1.

Only these properties are used. In particular, H need not be a minimum unknown graph, and no minimum-degree, two-edge-resilience, minimum-Q boundary theorem, or naming of a defect-two graph is used.

Let J be the B-edges between {b,c} and {d,e}. If J={bd,ce}, the assumptions are impossible. If J={bd,be}, the triangle support of H is one of the following exact frozen C12 graphs:

    central_K4_star_4, central_K4_star_44, central_K4_star_45,
    central_K4_star_444, central_K4_star_445, central_K4_star_455.

The application to an actual parent G uses this conclusion only after the actual-residual hypotheses have been established separately.

## Elementary interfaces, including the whole-family footprint

The archived two_triangle_restoration_v1, Sections 1 and 4, gives the following precise interfaces. The individual new family for q=1 is either a book on one restored base, including its central triangle, or the four faces of a K4 on that triangle and one full apex. Every new H-triangle is an individual ordinary page or central triangle, or a mixed triangle avw for vw in J. An old clique contains at most one of {b,c}, at most one of {d,e}, and cannot contain a together with another core terminal.

A two-triangle packing of the five-vertex core that avoids a restored base forbids an outside page on that base: the core pair plus the page has, in each old clique, at most two adjacent old edges as footprint, and therefore appends to an old maximum packing. K4 admits a maximum packing avoiding two adjacent edges; K5 admits one avoiding any two edges.

We also record explicitly a slightly stronger-looking formulation of the standard one-base footprint fact, to prevent an incomplete old-family interpretation. If pq is absent from B, a fixed old clique D contains **at most one distinct spoke edge among all ordinary pq-pages**. D cannot contain spokes incident to both p and q, since that would put p,q in D. If it contained two distinct spokes px and py, then xy lies in D. The other page spokes qx,qy are present in B, so qxy is an old triangle sharing xy with D. It would belong to D's triangle component and put q in D, again impossible. Thus the claim includes all actual pages and all old crossing triangles.

Consequently, if every ordinary pq-page has a supported spoke, choose in each old clique its unique family-footprint edge and a minimum clique cover containing that edge. Their union is a minimum B-cover hitting every ordinary pq-page. If that cover is unavailable, an ordinary page with both spokes background exists; call it B-bare. Every old edge of K4 or K5 lies in a minimum clique cover. Covers on distinct old triangle components can be chosen independently even if their vertex sets meet.

## 1. Matching cross graph J={bd,ce}: impossible

The core packing {abd,ace} avoids bc and de. Hence no outside ordinary page can use bc or de. There are no internal pages on these bases either: neither vertex of the opposite pair joins both endpoints. The q=1 families must therefore be books on f in {ab,ac} and g in {ad,ae}. If a family has only its central triangle, either indicated spoke may be chosen as its book base.

If (f,g)=(ab,ae) or (ac,ad), the two bases already hit every new triangle, including abd and ace, giving tau(H)<=2m+2. Thus, after simultaneously swapping b,c and d,e if needed, f=ab and g=ad.

There must be a B-bare ordinary ab-page abx. Otherwise the whole-family footprint construction supplies a minimum B-cover hitting every ordinary ab-page; adding ac and ad covers the central T, the U-book, and both mixed triangles, again giving 2m+2. Likewise there is a B-bare ordinary ad-page ady, since a minimum B-cover hitting all such pages could be extended by ab and ae. Both x,y lie outside {a,b,c,d,e}: the missing old edges at a forbid internal ordinary pages on these bases.

If x=y, then bdx is an old triangle, using the old cross edge bd and the two supposedly background spokes bx,dx. This contradicts bare status. If x!=y, the three actual triangles

    abx, ady, ace

are edge-disjoint. The first two have only background old spokes, while ace has only the old edge ce. An old maximum packing can avoid ce and therefore append all three triangles. This gives nu(H)>=m+3, a contradiction.

This proof of the matching case does not require the single-edge-resilience assumption.

## 2. Adjacent cross graph J={bd,be}: determine the complete new family

The individual U-family contains the ordinary page bde. Since q_U=1, it is a book on de. Indeed a K4-type family with apex b would require the absent old edge ab. In particular, there are no ordinary pages on ad or ae, and every outside U-page has the form dey. The mixed triangles are exactly abd and abe.

### A footprint calculation used twice

Suppose P is an outside T-page on ac or bc, and dey is an outside U-page. Then

    P, abd, dey

are edge-disjoint. The assertion also allows equality between their outside apices.

These three triangles append to a maximum B-packing. To verify the complete old footprint, write P=acx or bcx. The old clique sees at most one of the two P-spokes, since the base is absent from B. By the whole de-family footprint fact it sees at most one edge among bd,be,dy,ey; note that both bde and dey are actual ordinary de-pages. Thus its footprint has at most two edges. For P=acx, no P-spoke can share a clique with any of bd,dy,ey: the corresponding terminal pair is one of ab,ad,ae,bc,cd,ce, all absent in B. For P=bcx, a cx-spoke likewise cannot coexist with those edges. A bx-spoke can coexist with bd only as an adjacent pair. It cannot coexist with dy or ey: clique membership would supply bd or be as an additional de-family footprint edge, contradicting the one-footprint fact. Every possible footprint is therefore a singleton or an adjacent pair. This proves the claimed three-packing, without ignoring old crossing triangles or shared outside apices.

### The T-family is a K4

If the T-family is a book on ab, {ab,de} hits every new triangle and contradicts tau(H)=2m+3. This also deals with a T-family consisting only of its central triangle.

Otherwise, if it is a book on f in {ac,bc}, it has an outside page on f. If an outside U-page exists, the preceding three-packing contradicts nu(H)=m+2. If no outside U-page exists, deleting f kills the complete T-family, and the remaining new triangles are exactly the faces of the K4 on {a,b,d,e}. These have packing number one. Partitioning any packing of H-f into old and new triangles gives nu(H-f)<=m+1, contrary to resilience.

Thus N_T is exactly the K4 on {a,b,c,x}, for one x outside the five-vertex core. If an outside U-page dey existed, apply the same footprint calculation with P=acx and obtain a contradiction. Hence the entire U-family consists of ade and bde.

We have now proved actual new-triangle completeness: the full new family is the union of the faces of

    D1=K4[{a,b,c,x}],     D2=K4[{a,b,d,e}],

sharing edge ab. Their only old edges are ax,bx,cx,bd,be. Moreover dx and ex are absent from B: either would, with the existing old edge ax, create an ordinary ad- or ae-page, forbidden by the de-book.

## 3. Cover gain determines the old attachment edges

Call an old edge supported if it belongs to an old B-triangle component.

First cx is background. Otherwise choose a minimum B-cover containing cx and add ab,de. The two opposite pairs {ab,cx} and {ab,de} cover D1,D2, giving tau(H)<=2m+2.

Set

    S1 = supported edges among {ax,bx},
    S2 = supported edges among {bd,be}.

There is at most one edge in S1. If both were supported, they would lie in distinct old cliques, since one old clique cannot contain a,b. Choose minimum old covers through both and add ab,de. These cover both new K4s with only two extra edges.

S1 and S2 cannot both be nonempty. A selected edge from S1 and one from S2 are in distinct old cliques: an ax-edge cannot share a clique with bd or be because ab is absent. A bx-edge cannot share a clique with bd or be because dx or ex would then be present, which was just excluded. Hence the two selected edges can be jointly included in a minimum B-cover. In D1 add the edge opposite its selected edge (bc opposite ax, or ac opposite bx); in D2 add the edge opposite its selected edge (ae opposite bd, or ad opposite be). Each selected-plus-opposite pair covers its whole K4. Only two added edges cover all new triangles, a contradiction.

Finally the two possible edges in S2 lie in distinct old cliques, because de is absent. These statements exhaust all old edges in the complete new family.

## 4. Connected support forces literal fresh C12 geometry

Every old triangle component must contain an edge of S1 union S2. Otherwise it has no edge in any new triangle and remains a separate triangle component of H. Shared vertices alone do not connect triangle components, so arbitrary old vertex overlaps do not evade this argument.

For each selected supported edge there is exactly one old K4 or K5 containing it. That old clique meets the six-vertex new core exactly in the two endpoints of its selected edge:

- a clique on ax cannot contain b,c,d,e, using respectively the absent old edges ab,ac,ad,ae;
- a clique on bx cannot contain a,c, using absent ab,bc, or d,e, using absent dx,ex;
- a clique on bd cannot contain a,c,e, using absent ab,bc,de, or x, using absent dx;
- a clique on be is symmetric.

If two old cliques occur, they are the pieces on bd and be. They already share b and cannot share any second vertex: doing so would share an old edge and merge their triangle components, forcing the absent edge de. Thus their private vertices are distinct. There is never a simultaneous S1/S2 attachment. The new K4 not chosen as the center meets each old leaf only in their prescribed common central endpoint, by the core-intersection statements above.

No further old background edge can remain in H: by hypothesis every H edge is triangle-supported, and the complete triangle list contains only old clique triangles and the two new K4 families. Such an edge would either be an edge of a listed old clique or one of their already listed new-family spokes. This also rules out additional support vertices. Isolated vertices, if the ambient graph retains them by convention, have no effect on the support classification.

The resulting literal graphs are therefore:

- S1=S2=empty: D1 and D2 share ab, giving central_K4_star_4;
- |S1|=1: choose D1 as the center, with its D2 leaf on ab and one old K4/K5 leaf on ax or bx; the attachment edges share a central vertex, giving central_K4_star_44 or _45;
- S1=empty, |S2|=1: choose D2 as the center, with D1 on ab and the old K4/K5 on bd or be, again giving _44 or _45;
- S1=empty, |S2|=2: D2 is central with its K4 leaf D1 on ab and old K4/K5 leaves on bd,be; all three attachment edges share b, giving _444, _445, or _455.

These are exactly the indicated entries of inputs/C12_frozen.json. This proves both J2 cases at the stated all-size scope.

## Dependencies and controls

Read-only mathematical sources:

- problems/TUZA-22/notes/two_triangle_restoration_v1.md (Sections 1 and 4; SHA256 12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7).
- problems/TUZA-22/review/two_triangle_restoration_independent_review.md (SHA256 f716b04d855d19e62788e9caa85aa927826eab2053682897280344d716b53ba9).
- inputs/C12_frozen.json (only exact output graph identification).

Application context read, but no additional premise imported: notes/apex_actual_parent_two_triangle_decision_v1.md and notes/apex_actual_parent_disjoint_restoration_v1.md.

Sharp elementary adjacent-J2 control: B has the triangle-free edges ax,bx,cx,bd,be only. Restoring abc and ade gives the two K4s sharing ab, namely central_K4_star_4, with nu=2,tau=3 and single-edge resilience. Thus the adjacent branch cannot be excluded outright. Old K4/K5 leaves in the admitted configurations give the remaining named controls. The matching branch has an actual packing/cover contradiction instead of a control.

No census, optimization, numerical resource, degree lower bound, inherited minimum-Q assertion, or enlargement of C12 is used. The all-J actual-parent conclusion remains dependent on the other cross-graph cases and their separate review.
