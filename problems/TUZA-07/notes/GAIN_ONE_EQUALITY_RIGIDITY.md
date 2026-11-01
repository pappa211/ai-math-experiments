> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Gain-one equality rigidity over block-type graphs

Status: PROVED by an ordinary argument, independently reconstructed by the coordinating AI and designated AI critic during TUZA-07. No Lean verification, no human peer review, and no novelty claim.

## Exact statement (A9 / B1 equality strengthening)

Let H be a finite simple graph whose nonempty shared-edge triangle components have literal K4 or K5 edge supports. Let G be any finite simple supergraph on the same vertex set (new vertices may first be adjoined to H as isolates). Write h=nu(H), so tau(H)=2h. Suppose
nu(G)=h+1 and tau(G)=2h+2.

Then G also has only K4/K5 triangle components. More precisely, let N be the full family of G triangles absent from H. Exactly one of the following holds:

(i) N consists of all four faces of a K4 whose edges lie outside all old H triangle-block supports. This is a new triangle component, and every old component is unchanged.

(ii) There is one old K4 block B and a vertex z outside B such that N consists exactly of the six triangles zxy for xy in E(B), and every spoke zb (b in V(B)) lies outside ALL old H triangle-block supports. That old block becomes the K5 on V(B) union {z}; every other old component is unchanged.

Arbitrary triangle-free background edges are allowed. New edges that lie in no G triangle do not matter.

Conversely, either displayed full-triangle-family configuration gives nu(G)=h+1 and tau(G)=2h+2 by additivity over triangle supports and the K4/K5 optima.

## Inputs from B1

The proven gain-one cover-completion argument in [GAIN_ONE_THEOREM.md](GAIN_ONE_THEOREM.md) supplies:

1. Every new triangle uses at most one old support edge per old block.
2. If a new triangle uses two old support edges in total, then tau(G)<=2h+1.
3. If two new triangles P,Q are edge-disjoint, they append simultaneously to a maximum H packing unless their old edges form an opposite pair in an old K4 block. K5 can avoid every two prescribed edges; K4 can avoid two incident edges, but not an opposite pair.

Under the equality assumption, (2) says EVERY new triangle has at most one old support edge in total. Consequently every edge-disjoint pair of new triangles must be pages on opposite base edges of the SAME old K4. Here a page is a triangle with that old edge as base and apex outside the old block.

We also use the elementary fact that an edge-intersecting triangle family either has a common edge or lies among the four faces of a K4.

## Case I: N is pairwise edge-intersecting

If every N triangle shares one edge, adjoining that edge to a minimum H cover gives tau(G)<=2h+1, contradiction.

Thus N is contained in the faces of a K4 U and has no common edge. At least three of its faces occur. If any N triangle uses an old support edge e, choose a minimum cover of its old block containing e and arbitrary minimum covers in all other blocks. Add the edge of U opposite e. The opposite pair covers every U triangle, so this covers all G triangles with at most 2h+1 edges, contradiction.

Therefore no N triangle uses any old support edge. At least three K4 faces force all six U edges to be present in G, so the fourth face is also a G triangle. It cannot be an H triangle: then its edges would be old support edges, all of which occur in the union of the other three faces, contrary to the preceding conclusion. Hence the fourth face is also in N.

Thus N is exactly all four U faces, and no U edge lies in old H supports. Since N is the full new triangle family, there are no further mixed triangles that could join this component to an old block. This is configuration (i).

## Case II: N contains an edge-disjoint pair P,Q

The input above forces an old K4 B with vertices a,b,c,d and
P=abx, Q=cdy,
where ab,cd are opposite B edges, and x,y lie outside B. The only old support edge in P is ab, and in Q it is cd.

### Different apices x!=y are impossible at equality

P and Q then have disjoint vertex sets.

A new triangle R having no B base must meet both P and Q in edges. Indeed if it were edge-disjoint from either, their old support edges could not be an opposite pair in B, so they would append to an H maximum packing. But no triangle can contain an edge from each of two vertex-disjoint triangles. Hence every new triangle has a B base.

A page on a cross edge of B, such as ac, must meet both P and Q, since its base is incident with both ab and cd and thus neither pair has opposite bases. Meeting P forces its apex to be x; meeting Q forces its apex to be y. This is impossible when x!=y. The same argument applies to the four cross bases ac,ad,bc,bd.

Therefore every new triangle is a page on ab or cd. Choose the old minimum B cover {ab,cd} and minimum covers of the other old blocks. This already covers all new triangles, yielding tau(G)<=2h, contradiction.

### Equal apices x=y=z force exactly one K5

P=abz and Q=cdz show that z is adjacent in G to every B vertex. Because B is a K4, ALL six z-pages on B edges therefore occur in N.

A new triangle R without a B base must meet both P and Q. A triangle meeting both in edges must use two z-spokes, one to {a,b} and one to {c,d}; its third edge is consequently a B cross edge. (Using base ab or cd together with an edge of the other page would require four vertices.) Thus such a triangle in fact has a B base, contradiction. Therefore every new triangle is a B-page.

Suppose a new B-page R has an apex w!=z. Choose a B edge f incident with but different from R's base. The already-present z-page on f is edge-disjoint from R: their bases differ and their outside apices differ. Their bases are incident, so a maximum B packing avoids them simultaneously. All other old blocks are unaffected. This supplies two compatible new triangles and gives nu(G)>=h+2, contradiction.

Hence every new B-page has apex z. N is exactly the six z-pages. Every z-spoke lies outside all old supports: it occurs in a z-page whose base is already one old support edge, and equality excluded two old support edges in any new triangle. This proves the full configuration (ii), including its support-disjointness condition. No new triangle uses any other old block edge, so all other triangle components remain unchanged.

## Corollary: three-edge combined preservation

If G is obtained from block-type H by adding at most THREE edges, then Tuza holds and equality occurs only with K4/K5 triangle components.

Proof. If there are no new triangles, both optima and triangle components are unchanged. Otherwise q=nu(G)-h>=1. If q=1, B1 proves the inequality and the theorem above classifies equality. If q>=2, a minimum H cover together with the three added edges gives
tau(G)<=2h+3<2h+4<=2nu(G),
so equality is impossible.

The converse equality direction is the elementary K4/K5 additivity statement. For at most TWO added edges, any nontrivial equality is configuration (i): turning an old K4 into a K5 needs at least three added edges, since an outside vertex can have at most one H neighbor in an old K4 (two neighbors would already create an H triangle joining it to that block).

Thus the third-addition frontier does not fail: even the combined inequality/equality statement survives three arbitrary additions. B1's separate four-addition inequality corollary remains valid. This result does not prove composability through arbitrary positive-slack states.

## Independent-review correction

The independent critic accepted the forward argument but required making support-disjointness of every new K5 spoke explicit in configuration (ii) and its converse. This condition follows in the forward proof from the at-most-one-supported-edge rule. Merely saying that N comprises six pages on an old K4 is insufficient: a spoke might belong to a different old block, joining the new K5 to it and lowering the cover number. The precise statement above now includes that condition.
