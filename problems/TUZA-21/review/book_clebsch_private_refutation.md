> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent Clebsch-cone refutation of the private-witness candidate

**Disposition: REFUTED. Evidence: complete ORDINARY_PROOF plus independent FINITE_CERTIFICATE.**

Let F_C denote the actual triangles of G meeting the minimum ordinary triangle cover C in exactly one edge. The provisional assertion that every minimum C satisfies `nu(F_C)>=ceil(|C|/2)` is false. The example below also defeats the weaker assertion that some minimum C has this property: all sixteen minimum covers have size eleven and private packing number five. Unrestricted Tuza is not refuted: the graph has `tau=11` and `nu=8`.

## Literal graph

Let V be the sixteen even-cardinality subsets of a five-element set. Regard them as the integer masks

`0,3,5,6,9,10,12,15,17,18,20,23,24,27,29,30`.

Two distinct vertices are adjacent in L exactly when their symmetric difference has cardinality four. Add a new vertex z, labelled 32, adjacent to every vertex of L. This defines G completely. L is the Clebsch graph in its folded-five-cube presentation, but the name and literature are unnecessary to the proof.

Each vertex of L has five neighbors: translation by symmetric difference carries it to the empty set, whose neighbors are the five four-element subsets. L has no triangle. Indeed, after translating one triangle vertex to the empty set, the other two would be distinct four-element subsets; their symmetric difference has size two, so they are nonadjacent. Thus G has exactly forty actual triangles, all of the form zab for an edge ab of L. There are seventeen vertices and fifty-six edges.

## Independence number and all maximum independent sets

Translation by any even subset is an automorphism of L. Translate any nonempty independent set to include the empty set. Every other member must then be a two-element subset, since the four-element subsets are adjacent to the empty set. Two two-element subsets are nonadjacent in L exactly when they intersect.

A pairwise-intersecting family of two-element subsets has at most four members on a five-element ground set. To see this, either all pairs share a common element, giving at most four, or choose ab,ac and a pair omitting a; that pair must be bc. Every further pair meeting all of ab,ac,bc belongs to these three. A four-member family must therefore be a full four-edge star.

It follows that `alpha(L)<=5`. Equality is attained by

`U={0,3,5,9,17}`,

the empty subset and all four pairs containing coordinate zero. Hence `alpha(L)=5`.

This also classifies every independent five-set. After translation to include the empty set, it is the empty subset plus a full pair-star, which is the neighborhood of the four-element subset missing the star's center. Undoing the translation shows that every maximum independent set is N(v) for a vertex v of L.

These sixteen neighborhoods are distinct. Adjacent vertices have no common neighbors by triangle-freeness. Distinct nonadjacent vertices have exactly two common neighbors: translate one to zero and let the other be a two-element subset d. A common neighbor is a four-element subset s with `|s symmetric-difference d|=4`, equivalently with exactly one element of d in s. Its unique omitted element is therefore one of the two elements of d, giving exactly two choices. Since each neighborhood has size five, no two neighborhoods coincide.

In particular, every vertex w outside N(v) has at least two neighbors in N(v): it has five if w=v, and two otherwise.

## Ordinary cover number and classification of every minimum cover

For any triangle-free graph L, triangle covers of its cone can be converted into vertex covers of L without increasing size: keep the endpoints whose spokes were selected, and replace each selected rim edge by one of its endpoints. Every rim edge either has a selected-spoke endpoint or had to be selected itself to meet its cone triangle. Therefore

`tau(cone(L)) = vc(L) = |V(L)|-alpha(L)`.

The reverse inequality selects all apex spokes corresponding to a minimum vertex cover. Here this gives `tau(G)=16-5=11`; the displayed U gives the minimum cover `C={zs:s in V minus U}`.

We can describe *every* minimum cover. For an arbitrary cover D, let W be the vertices whose spokes are absent. Every rim edge in L[W] must belong to D. At minimum cardinality there are no other selected rim edges, since a rim edge outside L[W] already has its triangle hit by a selected spoke and is redundant. Thus

`|D|=16-|W|+e(L[W])`.

A minimum cover therefore has `|W|-e(L[W])=5`.

If L[W] had a vertex of degree at least two, deleting that one vertex and then at most one endpoint per remaining edge would produce an independent set of size at least `|W|-e(L[W])+1=6`, contradicting alpha=5. Hence L[W] is a matching together with isolated vertices. Choosing all isolated vertices and one endpoint of each matching edge gives an independent five-set U' inside W. If W contains any vertex outside U', that vertex has at most one neighbor in U', since L[W] has maximum degree one. But every independent five-set is some N(v), and every vertex outside it has at least two neighbors in it. This contradiction forces W=U', with no internal edges.

Consequently all minimum covers are pure spoke complements of maximum independent sets. There are exactly sixteen of them, indexed by the sixteen neighborhoods N(v).

## Exact full and private packing numbers

Every triangle of G uses two different spokes at z, so any packing has size at most eight. Symmetric difference with the fixed four-element mask 15 pairs the sixteen vertices into eight edges of L. Their eight cone triangles form a packing. Thus `nu(G)=8`.

Fix the minimum cover C complementary to U. Its private triangles are precisely zab with one endpoint in U and the other outside U. Each uses one of the five spokes zu, u in U. Hence `nu(F_C)<=5`. Equality is attained by the five edge-disjoint triangles

`(0,15,32), (3,12,32), (5,10,32), (6,9,32), (17,30,32)`.

All five rim pairs have symmetric difference of weight four; their endpoints are all distinct. These are actual triangles and each meets C in exactly one edge.

U is N(30). Translation by `v symmetric-difference 30` carries U to N(v) and carries the displayed private packing to a private five-packing for the corresponding minimum cover. Thus every one of the sixteen minimum covers has private packing number exactly five, while its target is `ceil(11/2)=6`.

This refutes both universal and existential minimum-cover private-witness packing assertions. It does not refute minimum-cover approaches that use triangles with two or three cover edges, and it does not refute Tuza or either PK statement.

## General mechanism of failure

Already the simple universal assertion fails for any triangle-free L with `|V(L)|>3 alpha(L)`: choose a maximum independent U, take the minimum spoke cover complementary to U, and observe

`nu(F_C) <= alpha(L) < (|V(L)|-alpha(L))/2 = |C|/2`.

The Clebsch graph gives a compact explicit instance and additionally defeats optimization over the choice of minimum cover. The loss comes from restricting the packing to one-cover-edge triangles: all such triangles are bottlenecked by the small independent set, while the full packing can use triangles whose rim edge has both endpoints in the minimum vertex cover.

## Independent finite certificate and limits

`scripts/book_clebsch_private_verify.py` was authored independently from the literal definition and candidate statement; it imports no producer checker, graph library, SAT solver, or optimization solver. `data/book_clebsch_private_certificate.json` retains the literal graph, all triangles, all sixteen maximum independent sets, all sixteen minimum-cover complements, and an explicit private five-packing for every minimum cover. It exhausts all 65,536 vertex subsets both for independence and for the equality `|W|-e(L[W])=5`. The finite checks agree with the ordinary proofs above.

Reproduce locally with the pinned environment:

```sh
source PRIVATE_PATH_REMOVED
python scripts/book_clebsch_private_verify.py
```

The final exact runtime, interpreter version, checksum and peak self RSS are retained in the JSON. The run is a subsecond light computation under a 30-second check deadline. No Lean formalization, independent kernel verification, external human review, or historical novelty claim is made. No historical source or public checkout was modified.
