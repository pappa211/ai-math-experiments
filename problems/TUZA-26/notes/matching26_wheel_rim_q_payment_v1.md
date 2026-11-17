> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Paying the wheel-rim reconstruction, conditional on the simplicial degree-four exclusion

Frozen ordinary reconstruction candidate, TUZA-26. Independent review requested. This is modular: it uses the newly frozen exact wheel-family classification and, in its last remaining case, the SEPARATE exclusion of degree-four simplicial vertices. That final dependency must be independently established without this cap argument before composing a closed degree-four-cap theorem.

## Actual setting

Use the degree-four cap setting inside the conditional minimum Q. The edge uv has exactly common neighbors x,y. The existing cap c has N_Q(c)={u,x,y,z}, with uz absent. Put L=Q-{uv,ux,vx,uy,vy} and A=L-c. The remaining branch has xy eligible in L.

The exact wheel-family classification gives a four-wheel W on rim x-y-t-w-x and hubz, with xz,zt the restored bases over B, yz,zw background in B, and diagonals xt,yw absent. The entire A triangle family is W plus the old literal K4/K5 families. Every old clique meets W in at most one rim edge or one vertex. All eight vertices u,v,c,x,y,z,t,w are distinct; in particular u,v,c are outside W. The latter follows from the actual deleted spokes and the ordinary-page descriptions. All ambient background remains.

Use the accepted minimum-Q facts: triangle support, minimum degree four, whole-triangle minimum-cover eligibility, the complete-boundary exclusion for at most two edges (adjacent for K4), the two-private-vertex K5 triangle-leaf exclusion, and the local-cap theorem. The existing cap c and any additional cap must be distinct vertices for the two-cap contradiction.

## 1. A private K4 face is an immediate cover payment

Let D be any literal K4 in Q whose complete outside-triangle boundary is contained in the three-edge star at one vertex. The opposite face T is private: none of its three edges is used by any triangle outside D. By whole-triangle eligibility choose a minimum Q cover containing E(T). Remove those three edges and add any two-edge minimum cover of D. Outside triangles remain covered, and all D triangles are covered. This saves at least one edge, contradiction.

This elementary payment requires no packing assumption and no privacy of the vertices themselves. Its complete boundary condition is essential.

## 2. Untouched old cliques have small complete Q boundaries

An old B clique D not containing a wheel rim edge remains a separate literal A triangle component, since all new A triangles are W. It contains at most one W vertex and at most one of u,v. It cannot contain c. If it contains u, it cannot contain x,y,z (the relevant old edges are absent); if it contains v, it cannot contain x,y.

Restore c and the five marked book edges to A. A c-triangle contributes an old edge only among its neighbors u,x,y,z; no such edge belongs to D. The uv-pages are exactly uvx,uvy. For ux,uy,vx,vy, the one-base footprint in D is at most one old edge. If D contains u orv, the possible footprints lie on at most two incident edges there; if it contains x ory, they lie on at most two incident edges there. The exceptional possible pair v,z in D gives the SAME footprint vz for both vx- and vy-pages. All other cases give no footprint. Triangles with multiple restored edges have their old edge between restored terminals and add no hidden D edge beyond these listed cases.

Thus D has complete Q boundary at most two adjacent edges and is excluded. Every surviving old clique is attached along one of the four wheel rim edges.

## 3. Freshness and exact possible private-vertex neighbors

At most one old clique occupies each rim edge. Adjacent rim attachments already share their wheel endpoint, so cannot share another vertex: two literal cliques sharing two vertices would share an edge and be the same old component. Opposite rim attachments cannot share an outside vertex a either. Such a shared vertex, together with the intervening rim edge, forms an old triangle using an edge of each clique, merging their old components. Hence all private vertices of the rim cliques are mutually fresh.

The endpoints u,v can lie in a rim clique only on the opposite rim edge tw: every other rim clique contains x ory, whose u/v spokes are absent in A. At most one endpoint can lie in any clique because uv is absent. The vertex c belongs to none.

Let a be a private vertex of a rim clique D, different from u,v. Every old A triangle through a belongs to D. Any new Q triangle through a must be a page on ux,uy,vx,vy, since c has its stated degree-four neighborhood and uv has only x,y as apices. Thus any extra neighbor of a belongs to {u,v,x,y}. If x ory is outside D, it cannot be an old neighbor of a: the intervening old wheel rim edge and a D edge would make an old triangle forcing that hub into D, contrary to the absent rim diagonal. Therefore

    N_Q(a) is contained in (V(D) minus {a}) union {u,v}.

The vertex a is adjacent to at most one of u,v by codegree two. Also, an endpoint outside D has at most one old neighbor in D; two would form an old triangle sharing a D edge and force the endpoint into the old clique, contradicting the missing hub spokes when appropriate.

For clarity, no unlisted support vertex exists outside W, c,u,v and the old rim cliques. Such a vertex has no old A triangle and could acquire support only as a page apex for the five marked book edges; codegree two and the fixed c-neighborhood bound its degree by three. This violates minimum degree. The argument for private vertices above already controls every background edge that could become supported.

## 4. Rim K4 attachments are all impossible

### Along xy

Let D have private vertices a,b. Neither u norv belongs to D. Each private vertex has old degree three and must gain a u/v neighbor. An endpoint outside D has at most one D neighbor, and no private vertex can neighbor both endpoints. Thus, up to labels, ua and vb are present and the other cross attachments are absent.

In L, ua lies in no triangle: a has no neighbors outside D except u, and u has only a as an old D neighbor. The non-spine triangles through xa and ya both have the sole apex b after the marked endpoint spokes are deleted. Hence a is a cap at u under the exact local-cap theorem. It differs from the existing cap c, contradiction.

### Along yt or wx

For D on yt, the old central family contributes only boundary edge yt. The only new bases touching D are uy and vy, each contributing at most one edge incident with y. Thus the COMPLETE Q boundary lies in the three-edge star at y. Section1 gives a cover saving. The wx case is symmetric, with star center x.

### Along tw

If neither endpoint lies in D, its only Q boundary is tw and the accepted small-boundary exclusion applies. Otherwise suppose u belongs to D (the v case is symmetric). The old rim neighbors of x and y in D are respectively w and t; any additional old D neighbor would form an old triangle forcing a missing rim diagonal. The complete boundary is therefore contained in triangle {tw,uw,ut}. The remaining private vertex a is adjacent to u inside D and cannot be adjacent to v, or it would be a third uv common neighbor. By Section3 it has no other outside neighbor, so its Q degree is three, contradiction.

## 5. Rim K5 attachments either are paid leaves or expose degree-four simplicial vertices

For D on xy,yt orwx, both endpoints u,v lie outside D. D has three private vertices, and the two endpoints together can attach to at most two of them. Hence at least one private vertex d has exactly its four D neighbors in Q. It is a degree-four simplicial vertex. Once the independent simplicial degree-four exclusion is established, this case is impossible.

For D on tw, if neither endpoint lies in D the boundary is tw and is already excluded. If u belongs to D, the complete boundary is the triangle {tw,uw,ut}, as above. The other two private vertices are each adjacent to u and hence cannot acquire a v neighbor. Their neighborhoods are exactly the other four D vertices. They are therefore the two wholly fresh vertices of the accepted K5-on-triangle leaf theorem, which excludes this configuration without any new degree-four result. The case v in D is symmetric.

Consequently, conditional only on the independently proved general degree-four simplicial exclusion, ALL old B cliques are removed.

## 6. Final cover contradiction with no old pieces

Then A has exactly W4 triangle support, and L has exactly W4 plus c adjacent to x,y,z. The edge uc and any remaining old edges are background in L. This central six-vertex graph is W5 on rim x-c-y-t-w-x with hubz, plus chord xy.

It has a three-edge cover {xz,zt,cy} and a three-packing

    cxy, xwz, ytz.

Deleting xy leaves W5, whose cover number is three (five wheel triangles, each edge hitting at most two, and a three-spoke cover). Therefore deleting xy does not lower the cover number of L: xy is ineligible. This contradicts the surviving cap branch's eligible xy.

Thus the exact wheel-rim reconstruction closes the remaining non-simplicial degree-four cap branch PROVIDED the separate simplicial degree-four exclusion is independently available. No cap-existence theorem is claimed.

## Dependency and status

Background/same-edge wedge reductions -> exact W4 triangle-family classification -> complete Q boundary/freshness analysis above -> K4 payments and K5 triangle-leaf payment -> separate simplicial degree-four exclusion (explicit dependency) -> final xy-ineligibility contradiction. The degree-four simplicial proof must not use this non-simplicial cap conclusion; the coordinator is checking the dependency direction.

Relied sources: notes/matching26_critical_wedge_wheel_classification_v1.md; notes/matching26_local_cap_augmentation_v1.md; notes/two_edge_tight_boundary_v2.md; notes/apex_k5_triangle_leaf_v2.md; actual cap profile notes/degree_four_cap_critical_wedge_v1.md. No numerical computation, census, or larger-family naming was used. This note remains PROOF_CANDIDATE pending independent review and the final explicit simplicial dependency.
