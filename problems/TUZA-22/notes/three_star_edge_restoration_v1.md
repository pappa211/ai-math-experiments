> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three missing spokes restore equality only by completing a K5

Frozen ordinary proof candidate, 2026-11-16. All triangles are actual, with arbitrary triangle-free background and outside attachments.

## Theorem

Let B(H), let ab,ac,ad be distinct missing edges with common endpoint a, and set G=H+{ab,ac,ad}. If tau(G)=2nu(G), then B(G).

More precisely, if any new triangle exists, equality forces an old literal K4 on {b,c,d,u}, with au a triangle-free old edge, and the restored spokes complete exactly one new K5 on {a,b,c,d,u}. Every new triangle lies in that K5, and all other old triangle components retain disjoint support.

Put m=nu(H). If a new triangle exists, elementary insertion and the three-edge cover bound give nu(G)=m+1 and tau(G)=2m+2. Every new triangle contains a. It is either an ORDINARY page axu, where x belongs to {b,c,d} and au,xu are old, or a TWO-NEW-edge triangle axy, where x,y are distinct members of {b,c,d} and xy is old. No triangle uses all three restored edges.

## 1. Two disjoint ordinary pages always append

Take edge-disjoint ordinary pages axu and ayv. Their bases must differ, since pages on one base share that edge. Each page has at most one old spoke in any old block, by the accepted whole one-nonedge footprint lemma.

In a block containing a, their entire footprint is a star of at most two edges. In a block not containing a, only the rim spokes xu,yv can occur. If both occur and are disjoint, then u and v are distinct old neighbors of a in that clique. The actual old triangle auv would share its edge uv with the block and force a into the same literal clique component, contradiction. Thus the two rim spokes, when both present, are incident.

Every old K4/K5 maximum packing avoids these whole footprints. Appending the two pages gives m+2 triangles, contrary to tightness. Therefore two ordinary pages must intersect in an edge.

## 2. The only incompatible mixed pair completes an old K4

Take an edge-disjoint pair consisting of axy (two new edges) and an ordinary page azu. Necessarily {x,y,z}={b,c,d}, and u lies outside {a,b,c,d}, because au is old while ab,ac,ad are missing in H.

The first triangle has old footprint xy. The second has old spokes au,zu. A block containing a cannot contain xy: it would contain x,y and force the missing ax,ay. A block not containing a can receive only xy and zu, two disjoint edges.

K5 avoids any two edges. Hence the only possible failure of simultaneous maximum-block avoidance is a K4 containing all four vertices x,y,z,u. That block is exactly the literal old K4 on {b,c,d,u}. If no such block exists, the mixed pair also appends and contradicts nu(G)=m+1.

Two two-new-edge triangles necessarily share one restored edge, since their two-element subsets of the three restored spokes intersect. Thus, unless such an old K4 exists, EVERY pair of new triangles intersects in an edge.

## 3. Pairwise-intersecting new triangles give a strict cover

All new triangles contain a. Remove a from their vertex sets, obtaining the graph of their opposite old rim edges. Pairwise edge intersection of the triangles is exactly pairwise vertex intersection of those rim edges. A family of pairwise-intersecting graph edges is a star or a triangle: take two edges with a common endpoint; an edge missing that endpoint must join their other endpoints, after which every edge lies on those three vertices.

In the star case one a-spoke meets every new triangle. Adding it to a minimum H cover gives tau(G)<=2m+1, contradiction.

In the triangle case the three opposite rim edges are xy,xz,yz, all old, so xyz is an actual H triangle. Take a minimum H cover containing xy and add the actual spoke az. The edge xy hits axy and az hits the other two new triangles. Again the total is at most2m+1.

Therefore equality forces the old K4 identified in Section2. Let C be its completion to K5 on {a,b,c,d,u}. Its only old edge outside that K4 is au.

## 4. No outside new page can survive

Suppose an ordinary page axv exists with x in {b,c,d} and v outside V(C). Choose a maximum C packing of size two avoiding BOTH ax and au; elementary K5 two-edge avoidance supplies it. It avoids the page's base, and avoids the only possible C edge in another old H triangle component.

For every other old H block, the outside page has at most one old spoke: its two old spokes av,xv cannot belong to the same old clique, since ax is absent in H. Choose maximum block packings avoiding those respective spokes. These old block packings are disjoint from the selected C packing, since C meets their support in at most au, which the C packing avoids.

The two core triangles, the outside page and all old block packings other than the original K4 give

    2+1+(m-1)=m+2

edge-disjoint triangles, contradiction. Thus no outside ordinary page exists. All two-new-edge triangles are already inside C, so EVERY new triangle lies in C. The old triangle-family audit is now complete.

## 5. The final overlap is strict unless au is background

If au is supported in H, it belongs to an old block other than the original K4. Choose its minimum cover containing au, and a minimum four-edge cover of C also containing au. Together with minimum covers of all other old blocks, these cover every actual G triangle. Replacing the original K4 cover by the C cover costs two, and the shared au saves one, giving tau(G)<=2m+1, contradiction.

Hence au is triangle-free in H. The completed K5 has edge support disjoint from every other old triangle component, and there are no new outside triangles. It replaces the old K4 by one K5 component while all other components remain literal K4/K5. Therefore B(G).

## Dependencies and scope

Inputs are the elementary K4 star avoidance, K5 two-edge avoidance, minimum clique covers through a prescribed edge, and the accepted whole one-nonedge page-footprint lemma. No induction on CS, defect-one classification, finite enumeration, bounded graph order or external result is used. The theorem addresses the three-edge STAR shape; it does not silently cover P4, a two-edge path plus an isolated edge, or a three-edge matching.
