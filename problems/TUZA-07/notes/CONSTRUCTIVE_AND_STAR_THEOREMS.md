> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Constructive extension certificates and star-addition theorem

Status: PROVED by ordinary arguments, accepted in independent internal AI review during TUZA-07. This is not human peer review. No Lean verification. Novelty unassessed.

Independent review: saved critic reconstruction (historical source reference).

## Constructive packing/cover dichotomy

Let H have only literal K4/K5 triangle components, G be any supergraph, and h=nu(H). There is a finite constructive procedure returning either (a) a G triangle packing of size h+2, or (b) a G triangle cover of size at most 2h+2.

If no new triangle exists, an old minimum cover gives (b). If some new triangle P uses an old block edge, construct C union D as in GAIN_ONE_THEOREM.md. If it covers G, return it. If not, choose an uncovered new triangle Q; the compatible-pair proof constructs blockwise avoiding maximum packings and appends P,Q, returning (a). If every new triangle avoids all old supports, search for two edge-disjoint new triangles. If found, append them to an old maximum packing for (a). Otherwise the pairwise-intersecting triangle-family lemma gives a two-edge new-family cover, yielding (b).

The alternatives need not be exclusive. This procedure does not first solve the global packing or cover optimum. Local clique choices are finite and explicit. The discovery implementation experiments/constructive.py and its finite validations are historical records not included in this public archive. The public fixed-example checker is [check_tuza_examples.py](../../../tools/check_tuza_examples.py).

## One-apex extension over K3/K4/K5 triangle components

Let H be finite simple with every nonempty triangle component having literal support K3, K4, or K5. Add a new vertex v with arbitrary neighborhood X, obtaining G. Then tau(G)<=2nu(G).

Let a,b,c count K3,K4,K5 components. Then h=nu(H)=a+b+2c, tau(H)=a+2b+4c, and 2h=tau(H)+a. Every K3 supplies exactly one unit of old slack.

### Proof

Let L=H[X]. Remove from L all old K3 support edges. In the remaining link choose an inclusion-maximal matching M using at most one edge from each old K4 block. Write m=|M| and U for its 2m endpoints.

A maximum H packing avoids M: M uses no K3 support edge, so every old K3 triangle can be retained; each K4 sees at most one selected edge; each K5 sees at most two because M is a matching. Other selected edges are triangle-free in H. Append the m new triangles vxy for xy in M, giving nu(G)>=h+m.

For each old K3 block T, cover the old triangle and all pages based in T as follows. If v has at most one T-neighbor, choose any old edge. If it has exactly two T-neighbors x,y, choose xy. If it has all three neighbors, the old triangle and its pages are the four faces of a K4; choose an opposite edge pair. This uses at most two edges per old K3, exactly its 2nu budget. Some choices use a v-spoke; overlaps between choices only reduce union size.

For each used old K4 choose the opposite-pair minimum cover containing its selected M edge. Choose arbitrary minimum covers in other K4 and K5 blocks. Add all spokes vu with u in U. The resulting cover candidate costs at most 2a+2b+4c+2m=2h+2m.

Old triangles and all K3-based pages are covered. Any remaining uncovered new triangle vxy has xy disjoint from U. By inclusion-maximality, xy must belong to a K4 block already used by M. Being disjoint from the selected edge there, xy is its opposite, already covered. This contradiction proves coverage, and tau(G)<=2h+2m<=2nu(G).

Arbitrary triangle-free background edges, shared block vertices, high degrees, and outside attachments are covered by the link argument. The possible nonminimum old-cover cost in K3 blocks is charged to their explicit old slack; no arbitrary cover is silently treated as optimal.

## Arbitrary star additions to K4/K5 block graphs

Let H have only K4/K5 triangle components. Fix any existing vertex a and add any number of missing edges incident with a, obtaining G. Then tau(G)<=2nu(G).

Let R=H-a. Each old K4 containing a becomes a K3 and each old K5 containing a becomes a K4; other components are unchanged. Deletion introduces no new triangles, distinct supports remain edge-disjoint, and old triangle-free edges remain triangle-free. Thus R has only K3/K4/K5 triangle components. The final G is obtained from R by adjoining apex a with its entire final neighborhood, so apply the preceding theorem. A genuinely new center is included by first adjoining it as an isolate.

## Limitations

No equality classification is claimed. After a star addition, the resulting triangle components need not remain K3/K4/K5, so iteration needs a preserved structural invariant. Two independent apices admit nonzero-loss footprints such as a four-cycle in an old K4; the one-apex maximality certificate does not automatically extend.
