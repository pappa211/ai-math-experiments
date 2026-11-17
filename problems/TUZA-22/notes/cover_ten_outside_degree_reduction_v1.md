> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A ten-edge cover restricts outside vertices to degree seven or eight

Frozen proof candidate,2026-11-15. This is a symbolic endpoint reduction, not exclusion of packing five. It uses the reviewed sparse-link theorem and explicitly declared local minimum-CS inputs.

## A reusable core observation

Let C be any triangle-edge cover of G, and assume every edge of G lies in at least two triangles. If v is outside V(C), then its whole induced link L=G[N(v)] has every edge in C: the other two edges of each hub triangle touch v and cannot belong to C. For each neighbor x of v, edge-codegree at least2 gives degree at least2 for x in L. Consequently

    N(v) is contained in the graph-theoretic2-core of the edge graph C.

Indeed, an induced subgraph of C on N(v) has minimum degree2; the iterative deletion of degree0/1 vertices of C cannot remove any of its vertices. This holds simultaneously for every vertex outside V(C), independently of graph order or the number of outside vertices. In particular those outside vertices form an independent set.

## Scoped claim

Let G be a minimum-edge CS failure with nu(G)=5, with isolated vertices discarded, and let C be any minimum cover, so |C|=10. Then every vertex outside V(C) has degree7 or8.

The already reviewed sparse-link consequence gives a connected triangle-bearing link on at most9 vertices for every such outside vertex. M3 gives minimum degree5 and the degree5 link classification K5 or K5-e. SIX excludes outside degree6 because each permitted six-vertex link has at least12 edges, while the entire link is contained in C. It remains to exclude degrees5 and9.

## Excluding degree five

Suppose v outside V(C) has its five neighbors S. Its induced link is K5 or K5-e.

If it is K5, all ten C edges are precisely the edges on S, and V(C)=S. The core observation and minimum degree5 imply that every outside vertex is adjacent to all of S. Call their number t. They are independent. Every vertex of S has degree4+t. The M3 fact that a degree5 vertex has no neighbor of degree at most6 forces t>=3. On S labeled1,...,5, the three pairwise edge-disjoint two-matchings

    {12,34}, {13,25}, {14,35}

at three distinct outside hubs give six edge-disjoint triangles, contradicting nu(G)=5.

If the link is K5-xy, it uses nine cover edges on S. The tenth cover edge f cannot lie inside S, because xy is the sole absent pair there. Its additional endpoints outside S have degree at most1 in the cover edge graph. Thus the2-core of C is exactly S, and every outside vertex is again adjacent to all five S vertices. No vertex of V(C)-S can be adjacent to an outside vertex.

If f has exactly one endpoint z outside S, then V(C)=S union{z}. Minimum degree5 forces z to be adjacent to all of S and to have degree exactly5. The nonadjacent degree5 vertices v,z have five common neighbors, contrary to M3's bound of three.

If f has two endpoints z,w outside S, both have degree at most6 and at least5, and zw is an edge. If either has degree5, its neighbor of degree at most6 contradicts M3. Therefore both have degree6 and are adjacent to every vertex of S and to each other. The resulting seven-vertex induced subgraph is K7-xy, which contains six edge-disjoint triangles. Explicitly label the missing pair0,1 and the other vertices2,...,6; the six triples

    034, 056, 135, 146, 236, 245

are pairwise edge-disjoint and avoid01. This again contradicts nu(G)=5. All possible locations of f have been exhausted, so outside degree5 is impossible.

## Excluding degree nine

Suppose v outside V(C) has degree9, and write L=G[N(v)]. It is connected, has minimum degree2 and contains a triangle. It therefore has at least10 edges: equality of edges and vertices would make a connected2-regular cycle, and a9-cycle contains no triangle. Thus L has exactly10 edges and uses all of C. Put S=N(v), so V(C)=S and G[S]=L.

A connected graph with minimum degree2 and one more edge than vertices is bicyclic. Suppressing its degree2 paths gives either two loops sharing a degree4 branch, a pair of degree3 branches joined by three paths, or two cyclic pieces joined by a path. In ordinary terms the graph is respectively a figure-eight, a theta, or two cycles linked by a nonempty path. This classification follows from sum(d-2)=2: one degree4 vertex or two degree3 vertices are the only branch profiles.

Because L has a triangle and nine vertices, every proper connected induced subgraph of L that has minimum degree2 and contains a triangle is that triangle itself. For a figure-eight or two linked cycles, inclusion of any vertex on a second cycle forces that whole cycle, and inclusion of a linking path forces both ends; omitting the other cycle leaves just one cycle, which is triangle-bearing only if it is a triangle. For a theta, a triangle forces two of the three branch paths to have lengths1 and2. The remaining path has length7. Any minimum-degree2 induced subgraph using an internal vertex of that long path must use the whole path; adding the triangle then gives all of L. Omitting the long path leaves only the triangle. These statements also cover the possibility that both cycles of a linked pair are triangles.

Now any other outside vertex w has its neighbor set inside S. The preceding degree5 exclusion and SIX give degree at least7; its link is connected, triangle-bearing and has minimum degree2. The just-classified induced subgraph condition therefore forces N(w)=S. Thus every outside vertex is universal to S.

The link L has degree2 vertices, and G has minimum degree5, so at least three outside vertices exist. In fact two would suffice for the following packing. Each of the three bicyclic forms just described has a spanning path when it contains a triangle and has nine vertices: open each cycle at an attachment in the figure-eight/linked-cycle forms, and in the theta use the cycle consisting of the length2 and length7 paths. The resulting path has eight edges, partitioned alternately into two matchings of size4. At two distinct outside hubs these give eight edge-disjoint triangles, contradicting nu(G)=5. Outside degree9 is impossible.

The only remaining outside degrees are7 and8, as claimed.

## Scope and remaining obstruction

This does not show V(C)=V(G), bound the number of degree7/8 outside vertices, or settle the packing-five class. The reusable ingredients are the cover2-core observation and the exact high-density five-neighbor/bicyclic endpoint arguments. The minimum-CS application declares M0/M3/SIX and the previously reviewed sparse-link result, whose own finite-premise/Kotzig dependencies remain visible. No finite census or unknown solver result enters this proof.
