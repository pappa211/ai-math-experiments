> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three-star deletion to B: the defect-one support is W5

Frozen ordinary proof candidate, TUZA-26, 2026-11-16. Awaiting independent criticism. This is the packing-gain-two branch, distinct from TUZA22's equality restoration (gain one). Every triangle and all retained background edges are included.

## Theorem

Let Q be finite simple, triangle-supported, with nonempty triangle family connected through shared edges. Let S={ab,ac,ad} consist of three actual edges, with a,b,c,d distinct. Write L=Q−S and suppose B(L): each old triangle component has literal K4 or K5 support, with arbitrary background retained. Put r=nu(L). If

    nu(Q)=r+2,    tau(Q)=2r+3,

then Q is exactly the five-wheel W5. Single-edge resilience is not needed for this theorem. In particular a conditional minimum unknown Q outside frozen C12 cannot have such a star deletion to B.

## 1. Bare ordinary pages are forced on all three bases

An ordinary page on base au, u in N={b,c,d}, is aux where both ax and ux are old L edges. Hence x is outside {a,b,c,d}. It is B-bare if neither old spoke belongs to an old triangle support.

For a fixed missing edge au, each old literal clique component contains at most one old spoke from its ENTIRE family of ordinary pages. Indeed it cannot contain both a and u, because au is missing. If it contains a, and two different spokes ax,ay occur, then ux,uy are old and xy is a clique edge, so the old triangle uxy forces u into that same triangle component, contradiction. The case containing u is symmetric; a component containing neither receives no spoke.

If au had no bare page, choose in each old clique a minimum triangle cover through its possible page spoke. Every K4/K5 edge belongs to a minimum cover, and different triangle-component supports have disjoint edges. This old cover of size2r covers every ordinary au-page. Adjoin the OTHER TWO restored edges. Every new triangle except those ordinary au-pages uses one of those two edges. This gives a Q cover of size at most2r+2, contradiction. Therefore each base has at least one bare ordinary page.

## 2. Three ordinary pages on distinct bases and distinct apices cannot exist

Build the bipartite incidence graph with left side N={b,c,d}, right side U of ordinary apices, and ux an incidence when aux is an ordinary page. Mark the incidences corresponding to bare pages. Every left vertex has a marked neighbor.

If there is a matching saturating N, there is one containing a marked incidence. To see this, start with any saturating matching. If it has no mark, choose a marked neighbor for each left vertex. A marked neighbor outside the matched right vertices permits a one-edge replacement. Otherwise direct each left vertex to the left vertex whose matched right neighbor was selected. Each left vertex has an outgoing arc, with no loop. A directed cycle permits rotation of the matching along the selected marked edges, yielding a saturating matching containing marks.

Take the resulting three pages. Distinct bases and distinct apices make them pairwise edge-disjoint. At least one is bare. The other two pages lie on adjacent restored bases and have compatible ENTIRE old footprints with a maximum L packing, as follows.

Write these two pages abx,acy, with x!=y outside N. An old clique contains at most one spoke from each page. If it receives two spokes and contains a, they are incident at a. If it does not contain a, the only possibility is bx and cy. Were these disjoint edges in one clique, xy would be old, and the old triangle axy would force a into that component, contradicting the missing ab or ac. Thus the whole footprint in any old clique is at most two incident edges. A K4 has a triangle opposite their common vertex, avoiding them; a K5 has a two-triangle packing avoiding any two incident edges. Components with a single footprint edge also avoid it at full packing size. The bare third page has no old supported footprint. Therefore all three pages append to a maximum old packing, giving r+3, contradiction.

Consequently the incidence graph has no matching saturating N.

## 3. Hall reduces to two explicit incidence forms

All three left degrees are positive. Hall's theorem (or its elementary three-row case) implies either:

(a) two distinct bases, say ab,ac, have exactly the same singleton ordinary-apex set {x}; or
(b) ALL ordinary apices lie in a set of at most two vertices.

In case (a), their unique pages are bare, so bx,cx are old background edges. The leaf edge bc cannot be old: it would make bcx an old triangle, contradicting background status. The two actual edges ax and ad cover every new triangle: ax covers both ordinary ab/ac families; ad covers all ordinary ad-pages and every two-restored-edge triangle involving ad; the only remaining potential triangle abc is absent because bc is absent. Add these two edges to any old minimum cover, contradicting tau(Q)=2r+3.

Thus case (b) holds. One ordinary apex would itself give case (a), so write U={x,y}.

## 4. The complete new link is triangle-free and forces C5

Define a graph K on {b,c,d,x,y}. Its edges are the old opposite edges of all NEW Q triangles through a: incidences ux,uy give ordinary pages; old edges among b,c,d give the two-restored-edge triangles. There is no edge xy in K. Every K vertex is joined to a in Q.

For an old leaf edge uv among b,c,d, choose bare apices for u and v. They must differ: a common bare apex t would make uvt an old triangle containing background spokes. Thus, after interchanging x,y, u has a bare page at x and v at y. The opposite incidences uy and vx are impossible: uy together with uv,vy would make the bare spoke vy old-supported, and vx similarly makes ux supported. Hence the ordinary-apex sets of u,v are exactly {x},{y}.

This proves K has no triangle containing a vertex in {x,y}: adjacent leaves have disjoint ordinary-apex sets. Nor can b,c,d form a triangle, since their pairwise adjacent endpoints would require three pairwise disjoint nonempty subsets of the two-element bare-apex set. Thus K is triangle-free.

If K has a vertex cover of size at most two, the corresponding a-spokes together with an old minimum cover cover Q at cost at most2r+2, contradiction. Hence vc(K)>=3, equivalently alpha(K)<=2. Any triangle-free graph on five vertices with alpha<=2 is C5: degree at least three gives three independent neighbors; degree at most one gives that vertex plus a nonadjacent pair among its at least three nonneighbors, also an independent triple. Therefore every degree is two, and the triangle-free 2-regular graph on five vertices is a five-cycle. Thus K=C5.

## 5. Connected support removes all old B components

If any edge e of K is old-supported, choose an old minimum cover containing e. Deleting e from the five-cycle leaves the four-edge path P5, which has a two-vertex cover. Add the corresponding two a-spokes. This covers every new triangle as well as every old triangle at cost at most2r+2, contradiction. Thus every edge of K is background in L.

In the five-cycle, exactly one old leaf edge joins two of b,c,d; its endpoints have the distinct singleton apex sets {x} and {y}, as above. Their bare pages imply ax and ay are also old background. The only other spokes in the new five-wheel are the restored edges ab,ac,ad. Thus no edge of ANY new triangle belongs to an old triangle component.

The new triangles form the literal five-wheel with hub a and rim K. Their triangle family is edge-disconnected from every old triangle family. Since Q's triangle family is connected and nonempty, L has no triangles. Finally every Q edge is triangular by assumption, so there are no extra edges outside this wheel. Therefore Q=W5.

## Scope, dependence, and implication to Tuza

The entire proof preserves arbitrary old background and arbitrary shared vertices of old clique components. It uses actual old triangles to exclude conflicting footprints; no fresh attachment assumption is made. The two-ordinary-page compatibility mechanism is already present in TUZA22 notes/three_star_edge_restoration_v1.md and notes/three_path_edge_restoration_v1.md. The new scoped conclusion here concerns gain2 and cover increase3, not their equality case. No historical originality claim is made.

For the coordinator's conditional minimum Q, accepted cover-eligibility/blocker lemmas give the following chain. A blocker pair {e,f} has a defect-one residual. If another edge g is critical there, then L=Q−{e,f,g} is B, nu(Q)=nu(L)+2, tau(Q)=2nu(L)+3. If {e,f,g} is a three-edge star, the theorem gives W5, contradicting Q outside C12. Thus a fragile blocker residual cannot have its original blocker pair and further critical edge form a three-star. This is a constraint applying at all minimum degrees, including at least four.

Status arrows: conditional minimum-CS framework -> Q: CONDITIONAL on archived profile/restoration. Q plus accepted saturation -> the displayed three-edge-B numerical state: PROVED at those premises. Three-star numerical state -> W5: this frozen ordinary proof, awaiting critic. W5 excluded in Q: PROVED by frozen C12 membership. Availability of a star-shaped obstruction, exclusion/reconstruction of OTHER shapes, and treatment of the NO-BLOCKER branch: OPEN. Universal CS -> Tuza: PROVED. No universal availability theorem or full blocker-residual resilience theorem is claimed.
