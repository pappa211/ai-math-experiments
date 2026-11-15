# Individual tight triangle cuts do not imply the star residual bound

Status: complete ordinary counterexample with exact finite certificate. This attacks a necessary-condition relaxation, not the genuine maximum-star-packing case and not Tuza.

## Exact claim refuted

Let H have a perfect matching M of size k, and suppose every actual H triangle meets every perfect matching of H. Thus each triangle has exactly one internal perfect-matching edge and its three-vertex cut is tight. Let F=H-M and let U be the endpoints of M edges that lie in at least one H triangle.

The proposed implication alpha(F[U])>=number of those active M edges is FALSE. It fails even when every M edge is active, every M edge lies in exactly one actual H triangle, and all perfect matchings can be explicitly enumerated. The full maximum-star-packing premise requires simultaneous control of arbitrary old triangle packings, not just one triangle at a time.

## Literal graph

Use vertices 0,...,15. Let F consist of the three cycles

    1-2-3-4-5-1,
    6-7-8-9-10-6,
    11-12-13-14-15-11,

and the three edges 01,06,0-11. Add the perfect matching

    M={05,13,24,6-11,79,8-10,12-14,13-15}

to obtain H. Here hyphens disambiguate multi-digit endpoints. The actual H triangles are exactly

    015, 0-6-11, 123, 234, 789, 8-9-10,
    12-13-14, 13-14-15.

F is triangle-free. Since M is a matching, any H triangle must consist of one M edge and two F edges. Inspecting the common F-neighbors of each M pair gives exactly the list above, one triangle per M edge. All eight M edges are therefore active and U=V(H).

Each C5 supplies at most two independent vertices and vertex 0 supplies at most one more, so alpha(F)<=7. The set

    {0,2,4,7,9,12,14}

is independent, so alpha(F)=7<8=|M|.

## Every old triangle is matching-tight

In any perfect matching of H, vertex 6 must be matched outside {6,7,8,9,10}: this five-vertex set has odd order and all its boundary edges meet 6, so exactly one matching edge crosses its boundary. The same reasoning forces vertex 11 to match outside its five-cycle block. Hence the two diamond subgraphs on {7,8,9,10} and {12,13,14,15} are each internally perfectly matched.

Vertices 6 and 11 cannot match to 0: if 0 matched to one, the other would have no available external partner. Therefore 6-11 is forced. Vertex 0 matches either 1 or 5.

If 0 matches 5, the diamond on {1,2,3,4} is internally perfectly matched, in one of its two ways. If 0 matches 1, edge45 is forced and then edge23 is forced. Consequently both triangles123 and234 always contain one matching edge, and triangle015 always contains01 or05. Triangle0-6-11 always contains the forced edge6-11. Each triangle inside either internally matched four-vertex diamond contains exactly one matching edge, because any perfect matching on four vertices meets every three-vertex subset internally once.

These cases exhaust all perfect matchings. There are exactly 3*2*2=12: three choices on {0,...,5}, two in each remaining diamond, with6-11 fixed. Every listed triangle meets every one of them in exactly one edge, proving the tight-cut premise without a black-box matching theorem.

## The larger cone packing exposes the missing higher-order condition

Add a universal apex16 to H. Let P be the eight apex triangles based on M. Each prescribed member has private pages only on its base M edge, with exactly one such page, namely its corresponding old H triangle. Thus every member is in the type1 case and A(P)=B=E(P).

Every triangle cover contained in B must include every M edge: each old H triangle has exactly that one B edge. The remaining apex triangles based on F must be covered by selected spokes, which are exactly a vertex cover of F. Therefore the constrained cover number is

    |M|+vc(F)=8+(16-7)=17>16=2|P|.

This is not a counterexample to PK-all because P is not maximum. The two edge-disjoint old triangles015 and234 avoid the seven-edge matching

    {0-11,13,45,78,9-10,12-13,14-15}

in H. Appending the seven apex triangles based on that matching gives nine edge-disjoint triangles. Thus the cone's packing number is at least nine.

The displayed17-edge constrained cover (all M edges plus spokes outside the displayed independent seven-set) is also an ordinary triangle cover. Hence this graph satisfies tau<=17<=18<=2nu, with explicit witnesses.

## Evidence and interpretation

`checks/criticality_star_tight_control.py` uses a separate elementary recursive perfect-matching enumerator, checks all twelve matchings and every actual graph triangle, verifies alpha(F) over all65536 subsets, and validates the nine-packing and17-cover. Its exact literal output is `evidence/criticality_star_tight_control.json`.

The counterexample kills an argument based solely on individual triangle tight cuts, even with every matched edge active. It does not refute the stronger condition

    |Q|+matching(H-E(Q))<=k

for every old triangle packing Q, which is necessary and sufficient for the original all-apex packing to be maximum. The displayed Q={015,234} violates precisely that condition. A proof of the actual star-PK residual bound must use this higher-order packing interaction or another genuinely stronger input.
