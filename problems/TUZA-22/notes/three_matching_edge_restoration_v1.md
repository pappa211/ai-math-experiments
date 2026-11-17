> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three disjoint missing edges: equality reduces to R2

Frozen ordinary proof candidate, 2026-11-16. Let B(H), let F={ab,cd,ef} be three pairwise vertex-disjoint nonedges, and set G=H+F. If tau(G)=2nu(G), then B(G). More precisely, at least one restored edge belongs to no actual triangle; deleting it leaves the exact two-edge restoration situation.

Every new triangle is an ordinary page on exactly one restored base. Put m=nu(H). With any new triangle, tightness forces nu(G)=m+1 and tau(G)=2m+2. Suppose all three bases have pages; we derive a contradiction.

## 1. Exact obstruction to appending two disjoint pages

Each ordinary page contributes at most one spoke to any old clique block. Therefore two edge-disjoint pages append to a maximum H packing unless some old K4 contains two DISJOINT spokes, one from each page. K5 avoids any two edges and K4 avoids every two-edge star. In such an obstructing K4, the two spokes are an opposite pair.

Two disjoint pages with the same apex are compatible, since all their old spokes form a star at that apex. Also, if the apex of one lies in the vertex set of the other, the pair is compatible. Indeed if that vertex is the other's apex, use the preceding star argument. If it is a base endpoint, a pair of disjoint old spokes in a K4 would force both endpoints of that missing base into the clique, contradiction. We will use these elementary restrictions when naming distinct vertices.

## 2. Three pages cannot all be pairwise edge-disjoint

Choose one page from each base. Suppose they are pairwise edge-disjoint. Each pair needs an old K4 obstruction as in Section1. These three obstruction blocks are distinct: if two pair obstructions used the same block, the page common to those pairs has a unique spoke there; both other pages would then use its unique opposite edge and hence share an edge, contrary to the assumption.

The three page apices are distinct by Section1. Every pair-obstruction block contains the two corresponding apices and therefore contains their old joining edge. The three apices consequently form an actual old triangle, whose three edges lie in the three different obstruction blocks. That triangle joins their triangle components, impossible for distinct literal old blocks.

Thus some pages on two bases intersect. Relabel endpoints and bases so that they are

    abc and cda,

on bases ab and cd, sharing the old edge ac. The old edges bc and ad are present as well.

## 3. A third page forces one opposite pair in one old K4

Take any page efx on the third base. Its base endpoints lie outside {a,b,c,d}, so it is edge-disjoint from both fixed pages. Section1 implies x is outside {a,b,c,d}; it is also different from e,f.

For each fixed page it must have an old K4 obstruction. Let the selected spoke of abc be one of ac,bc, and that of cda one of ac,ad. Both obstruction blocks contain x.

If the selected spokes share a vertex, the two blocks share that vertex and x, hence the actual old edge between them, so they are the same old component. If the selected spokes are different, that common clique would contain either a,b or c,d, forcing a missing restored base. Therefore the only feasible common-vertex choice is that BOTH selected spokes are ac.

The one remaining choice is bc against ad, which are disjoint. In that case the first block contains c,x and the second contains a,x. Together with the old edge ac, the actual old triangle acx joins those blocks, again forcing a,b or c,d into one clique. This is impossible.

Hence both obstructions use ac in the SAME old K4 B. The third page contributes its opposite edge in B. Interchanging e,f if needed, write

    V(B)={a,c,e,x}, with opposite cover edges ac and ex.

The vertices b,d,f cannot belong to B because ab,cd,ef are missing in H.

## 4. This forces the ENTIRE new family to consist of three pages

Consider any other ab-page aby. It is edge-disjoint from the fixed efx page: pages on disjoint bases can intersect only with reciprocal endpoint apices, whereas x is neither a nor b. Thus it requires a K4 obstruction.

If its partner spoke is ex, the obstructing block is B, and the opposite edge to ex is ac. Hence the ab-page must be abc.

If its partner spoke is fx, let B' be the obstructing block. If the ab-page spoke is ay, then B' contains a,x, whose old edge already lies in B; thus B'=B, impossible because f is not in B. If the spoke is by, B' contains b,x. The old triangle bcx uses bc from the fixed page, cx in B and bx in B', so it joins B and B', again forcing b into B, impossible. There is no other possibility. Therefore abc is the ONLY ab-page.

The same argument gives cda as the only cd-page: for the alternative d-spoke use the actual old triangle adx, while a c-spoke shares the old edge cx with B.

Finally, apply Section3 to any ef-page and the same fixed intersecting pair. Its obstruction block must contain ac and hence must be B. The opposite edge is ex, and only e, not f, lies in B, so its apex is x. Thus efx is the ONLY ef-page.

A minimum cover of the old K4 B can be chosen as its opposite pair {ac,ex}. Together with minimum covers of all other old blocks, it already covers all three new pages: ac hits the first two and ex the third. Consequently tau(G)<=2m, contradicting tightness.

## 5. Finish by the accepted two-edge theorem

Therefore not all three bases can have pages. A restored matching edge without an ordinary page lies in no triangle at all, since no triangle can use two vertex-disjoint restored edges. Removing it changes neither packing, cover nor the actual triangle family. The remaining graph is H plus at most two nonedges and is tight, so the accepted R2 theorem gives B. The same B classification holds in G.

Dependencies are elementary clique cover/avoidance, the whole ordinary-page footprint lemma, actual old-triangle closure, and R2. No CS induction, finite computation, graph-order bound or outside-attachment restriction is used.
