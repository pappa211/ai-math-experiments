> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A minimum combined-CS obstruction has no minimum cover made of isolated edges and triangles

Status: PROOF_USING_DECLARED_INPUT_CANDIDATE; frozen for fresh review. Coordinator construction and challenger reconstruction, 2026-11-16 UTC. This is a necessary-cover-shape restriction on a minimum obstruction, not an unconditional equality theorem for every graph admitting this minimum-cover shape.

## Statement and exact inputs

Let G be a failure of combined CS with the fewest edges, either globally or within an edge-subgraph-hereditary class. Assume the authenticated class-local minimality conclusions: every proper subgraph satisfies CS; tau(G)=2nu(G); every edge of G belongs to at least two actual triangles. Then no minimum triangle-edge cover C of G has every nonempty edge-component equal to K2 or K3.

The proof uses the independently reviewed ordinary inequality and local two-page classification in notes/matching_and_triangle_cover_tuza_v1.md, the all-two-page equality theorem in notes/challenger_two_page_triangle_matching_cs_v1.md, and elementary avoidance of an adjacent edge pair in a literal K4 and of any edge pair in a literal K5. No availability of this cover shape is claimed.

Write triangle components of C as triangle cores and isolated C-edges as book cores. All cores have disjoint vertex sets. Every actual G-triangle is assigned to exactly one core: all its C-edges belong to that core. A triangle-core family consists of its internal triangle and its private pages; its minimum cover number is three. Its maximum private packing size is either two or three. The two-page case has exactly two full apices and no other pages. A book family is the family of triangles on its base.

## 1. Every chosen three-page core has three distinct mutual targets

At every triangle core choose a maximum private packing, of size two or three; at every book core choose one page. The potential mutual-target graph J joins two cores precisely when each has a chosen page whose apex lies in the other core. Give a triangle core weight one or two according as its local packing size is two or three, and give a book weight one. The degree of every vertex is at most its number of chosen pages; in particular a weight-one triangle has degree at most two and a book has degree at most one.

The reviewed inequality proof gives a packing of size t+alpha_weight(J), with t the number of triangle cores, except that all-weight-one odd-cycle components are handled by two full-apex pages per core and give strict slack.

There is also strict slack whenever a weight-two vertex v has degree at most two. First remove any exceptional all-weight-one odd-cycle components. Select v and delete its closed neighborhood: the weight gain is two and at most three vertices are removed. No new all-weight-one odd-cycle component can appear, since each weight-one vertex originally had degree at most two and a vertex on such a cycle has already used both neighbors on the cycle. The remaining weighted independent-set lemma therefore yields total weight strictly greater than half the number of remaining cores. Adding the other components gives a packing larger than |C|/2, contradicting tau(G)=2nu(G).

Thus, for EVERY choice of the local maximum private packings and book pages, every three-page core has degree exactly three in J. Its three selected apices lie in three distinct other cores, each of which points back. We will use this universal choice quantifier, including when replacing a local three-packing at a neighbor.

If all triangle cores have private packing size two, the reviewed all-two-page CS theorem already contradicts that G is a CS failure. Hence select a three-page core T=abc.

## 2. An exact balanced reduction on four cores

Fix a local three-packing at T. Its pages have distinct bases and distinct apices; write them as abx, acy, bcz after relabeling. By Section1 the apices x,y,z lie in distinct mutual-neighbor cores. Let R consist of T and these three cores, of which s are triangle cores and 3-s are book cores.

Let P consist of these three center pages and the internal triangle of each neighboring triangle core. These triangles are pairwise edge-disjoint. A page from the center meets any other core in at most one vertex, so it cannot share an edge with its internal triangle. Therefore |P|=3+s. The selected cover edges in R have total size

    |C_R|=3+3s+(3-s)=6+2s=2|P|.

Let K be the graph consisting of all edges of all triangles assigned to the cores outside R. No C-edge of a removed core lies in K, because it belongs to no remaining assigned family. Consequently every actual triangle of K is assigned to a remaining core; conversely every remaining assigned triangle is present in K. This construction therefore retains precisely the remaining actual triangle family, including every crossing triangle within it.

Moreover, no edge with both endpoints among vertices of R lies in K. If such an edge uv occurred in a remaining assigned triangle uvw, that triangle's C-edge would have to be uv, uw, or vw. In each case the selected edge has an endpoint in a removed core and hence belongs to a removed core, a contradiction. Every edge used by P has both endpoints among vertices of R, so P is edge-disjoint from K.

K is proper, since it omits the selected edges of T. Writing k=nu(G), proper-subgraph CS and the cover/packing inequalities give

    2k=tau(G)<=|C_R|+tau(K)<=2|P|+2nu(K)<=2k.

All inequalities are equalities. Thus nu(K)=k-|P|, tau(K)=2nu(K), and B(K) holds: every nonempty actual triangle component of K is a literal K4 or K5.

## 3. Augmentation at a neighboring triangle core

Consider the neighbor containing x. Suppose it is a triangle core U=xuv. The only center page that can share an edge with a U-page is abx. A U-page on base uv always avoids abx; a U-page on base xu or xv avoids it exactly when its apex is outside {a,b}.

If two edge-disjoint private U-pages avoid abx, replace the internal triangle U in P by those two pages. This adds one triangle. They are compatible with the other center pages, whose apices lie in different cores, and with the other internal neighbor triangles.

Their possible footprint in any literal K-block is an adjacent pair or a smaller set. Indeed, the block contains at most one U-vertex because all three U-edges are absent from K. Each new page can meet that block only in a spoke incident with that one U-vertex. Thus the two pages use at most two block edges, sharing a terminal. A maximum packing of every K4/K5 block can avoid this footprint. Combining those block packings with the modified P gives k+1 triangles, a contradiction.

Hence no private two-packing at U avoids abx. Let A,B,D be the allowed apex sets on xu,xv,uv, respectively, after removing a,b from the first two sets only. D is nonempty. Pages on distinct U-bases with distinct apices are edge-disjoint, so the nonempty allowed sets admit no distinct representatives of size two.

If A=B=empty, then every original three-packing at U must put the distinct apices a,b on the two incident bases xu,xv. If either A or B is nonempty, the no-two-packing condition forces it and D to be the same singleton {d}. Since d lies on two U-bases, literal triangle closure makes d a full apex, so the other incident allowed set is also {d}. Thus A=B=D={d}, with d outside {a,b}; every original three-packing uses d on uv and the distinct apices a,b on xu,xv.

In either case, if U had private packing size three, any such packing would have two apices in the same center core T. This contradicts Section1's degree-three condition for U. Therefore U has private packing size two. Its two full apices p,q give an avoiding two-packing unless {p,q}={a,b}. Consequently its full apices are exactly a,b and there are no other U-pages. The vertices {a,b,x,u,v} span a literal K5 bag attached to the center base ab.

This conclusion applies independently to every triangle-core neighbor.

## 4. Augmentation at a neighboring book core

Suppose the core containing x is instead the book base xx'. Any page xx'd whose apex d is outside {a,b} avoids the center page abx and is compatible with every other triangle in P. Its footprint in a literal K-block has at most one edge: the block cannot contain both x and x', since xx' is absent from K. Choosing maximum block packings avoiding these one-edge footprints would again give k+1 triangles.

Thus every page of this book has apex in {a,b}. The declared edge-codegree bound gives at least two pages on xx', so both a and b occur. The vertices {a,b,x,x'} therefore form a literal K4 bag attached to center base ab.

The codegree input is used at this exact step. Minimum-cover optimality by itself does not yet provide the same conclusion when the book has only one page. No stronger direct-CS theorem for the full cover-shape class is asserted here.

## 5. Final augmentation by all three bags

For each of the three center bases there is now a bag: K5 if its neighboring core was a triangle and K4 if it was a book. Take a maximum packing in each bag that avoids its center attachment edge. Such a packing exists: a K4 has a triangle avoiding one prescribed edge, and a K5 has a two-packing avoiding one prescribed edge.

The three bag packings are mutually edge-disjoint. Distinct bags have disjoint neighbor-core vertex sets and meet only in at most one center vertex; their only possible center-center edge is their own attachment base, which was avoided. They are also disjoint from the center triangle abc. All their vertices lie in the four removed cores, so all their edges lie outside K by Section2.

The bags supply 2s+(3-s)=3+s triangles. Append the center triangle and a maximum K-packing. This gives

    nu(K)+(3+s)+1=k+1,

a contradiction. Therefore the stated minimum C cannot exist. QED.

## Global role and limits

This removes all minimum covers made solely of disjoint K2/K3 components from a global or hereditary-class minimum CS obstruction. It uses literal triangle geometry, an actual balanced four-core reduction, and whole-block footprint avoidance; it is not a deduction solely from the weighted target graph.

The unrestricted obligation remains: a minimum obstruction may have minimum covers with larger connected components, and no theorem here transforms an arbitrary minimum cover into the excluded shape. The stronger statement that EVERY graph with such a minimum cover satisfies the full CS equality classification remains unproved by this note: its direct induction has a one-page-book case without the minimum-obstruction codegree hypothesis. The reviewed all-size Tuza inequality for that cover shape is unaffected.
