# Symbolic robustness corollary for the genuine-cover obstruction

Status: ordinary proof; no new experiment. This short corollary only records why high connectivity/codegree would not repair the already-refuted universal cover-existence gate. It is not a reason to continue that route, and it does not address an actual minimal-counterexample-only transformation.

Let J be the 11-vertex Mycielski graph of C5 from notes/late_cover_gate.md. For arbitrary integers q>=1 and t>=q, let B=J square K2 (Cartesian product), H=B[t] (replace each vertex by t independent clones and each edge by all t squared cross edges), and G=I_q join H. B and H are connected and triangle-free, and H contains a copy of J. Hence chi(H)>=4. H has n=22t vertices and minimum degree at least 4t.

Every actual G triangle has one apex and one H edge. Its edge codegrees are exactly q on rim edges and deg_H(x)>=4t on the spoke to x, so minimum triangle codegree is at least q. Removing fewer than q vertices leaves an apex and a rim vertex; every remaining rim vertex is adjacent to the surviving apex and every remaining apex is adjacent to the surviving rim vertex. Thus vertex connectivity is at least q. The actual triangle family is a single shared-edge component: connected H connects all triangles at one apex via spokes, and equal rim edges connect different apices' triangles. G is K4-free.

Every triangle-preserving genuine graph cover of G is a disjoint union of unchanged G sheets. Fix a lift a of one reference apex. As in the cone proof, local bijectivity names its rim neighbours x_a, and closed triangle lifting puts every H edge within this rim sheet. For another base apex b, choose its unique lifted neighbour b_a of any x_a. For an H edge xy, triangle bxy lifts closed at x_a, forcing b_a to be adjacent to y_a. Connectedness of H propagates the same b_a across the entire rim sheet. Its neighbours are exhausted by local bijectivity. Doing this for every base apex completes one G sheet; the sheets are disjoint and exhaustive because each rim lift has a unique neighbour above the reference apex. No lifted edge joins sheets.

Rainbow triangle-edge 3-colourability fails: the spoke colours at any apex would properly 3-colour H. Therefore no permitted cover has all shared-edge triangle components rainbow colourable or literal K5 blocks.

There is an exact maximum packing certificate. Label clone indices by Z/tZ and the two B layers by 0,1. At apex r in {0,...,q-1}, use the perfect matching

  {(v,0,j)(v,1,j+r): v in V(J), j in Z/tZ}.

These q matchings have disjoint rim edges because their offsets are distinct; their apex spokes are also distinct. They give 11qt edge-disjoint triangles. No packing has more: at each apex, each triangle uses two of its 22t spokes, so at most 11t triangles occur. Thus nu(G)=11qt. All 22qt spokes form a cover of size 2nu(G).

Deleting any one spoke lowers nu by exactly one. The upper bound at that apex becomes floor((22t-1)/2)=11t-1; remove the unique triangle using the deleted spoke from the displayed maximum packing to attain the upper bound. Thus these graphs explicitly fail the one-edge packing resilience of an actual minimal Tuza violation. Neither arbitrary q nor the cover rigidity bridges that logical gap.

The family is similar to earlier multicone obstruction families, but its use here is the elementary rigidity of genuine triangle-preserving graph covers. No novelty claim is made for the family itself.
