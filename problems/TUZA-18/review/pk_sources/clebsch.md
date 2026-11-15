# A private-triangle obstruction surviving every choice of minimum cover

Recorded 2026-11-01 21:52 UTC. **Ordinary argument with exact finite certificates; not Lean-verified.** Coordinator-generated after seed exposure, independent of the scouts' prompts. Historical priority is unassessed. This is a NO_GO for a specific mechanism, not a counterexample to Tuza.

For a minimum graph-edge triangle cover C, let P_C be the full graph triangles meeting C in exactly one edge. The proposed sufficient assertion was that some minimum C satisfies |C| <= 2 nu(P_C). It would imply Tuza because nu(P_C) <= nu(G). The following graph refutes even this existential assertion.

## Statement

Let H have vertex set F_2^4, identified with integers 0,...,15, and join x,y when x xor y belongs to D={1,2,4,8,15}. Let G be the cone over H with apex a=16. Then

- H is triangle-free, 5-regular, with alpha(H)=5 and a perfect matching;
- (nu(G),tau(G))=(8,11);
- G has exactly sixteen minimum triangle covers, each consisting of the eleven spokes at V(H) minus N_H(v), for one v;
- for every such C, nu(P_C)=5. Thus |C|=11>10=2nu(P_C).

This graph has seventeen vertices, but verification is a targeted 2^16 vertex-subset calculation, not graph enumeration. The cone correspondence is existing prior art; the new mission contribution is the exact use of this finite graph to test a specific private-family bridge. No historical novelty is asserted.

## 1. Clebsch parameters, proved directly

Translation by xor z is an automorphism. Each vertex has the five neighbors x xor D. No two distinct elements of D differ by an element of D: the xor of two unit vectors has weight two, and the xor of the all-ones vector with a unit vector has weight three. Therefore H is triangle-free.

A maximum independent set may be translated to contain 0. Its other vertices must have Hamming weight two or three. Weight-three vectors are mutually nonadjacent. Among weight-two vectors, exactly complementary/disjoint pairs are adjacent, so at most three can be selected, and selected pairs form a pairwise intersecting family of two-subsets of a four-set. A weight-two vector is adjacent to precisely the two weight-three vectors containing its pair.

If there are zero selected weight-two vectors, at most four triples remain, giving five vertices with 0, achieved by all four triples. With one selected pair, at most two triples remain, giving at most four vertices. With two selected pairs, they must intersect; their forbidden triples have union of size three, so at most one triple remains, again at most four vertices. Three selected pairs form either a star or a triangle. For a star, precisely one triple is allowed, giving five vertices total. For a triangle, no triple is allowed, giving four. Thus alpha(H)=5.

The five-vertex independent sets containing 0 are precisely N(15), and N(1), N(2), N(4), N(8): the first is 0 plus all four triples; each other consists of 0, the three pairs containing its unit coordinate, and the triple omitting that coordinate. Translating back, **every maximum independent set is a vertex neighborhood**. The sixteen neighborhoods are distinct: a nonadjacent pair has exactly two common neighbors, and adjacent pairs have none.

To check the common-neighbor count directly, a nonneighbor difference d has weight two or three. If d=e_i+e_j, exactly the generator pair e_i,e_j sums to d. If d=1111+e_i, exactly the pair 1111,e_i does. Thus two distinct nonadjacent vertices have exactly two common neighbors. Consequently, relative to I=N(v), every vertex outside I has either five neighbors in I (v itself) or two (the other ten vertices); none has exactly one.

The eight pairs {x,x xor 1} for even x form a perfect matching in H.

## 2. Classifying every optimum cone cover

Every triangle of G corresponds to a base edge xy of H and is axy. A minimum triangle cover C has a set S of selected spokes. Put U=V(H) minus S. Every edge of H[U] must be selected as a base edge. No other base edge belongs to a minimum C: its triangle is already hit by a selected spoke, and that base edge occurs in no other triangle. Thus every minimum cover has exact cost

    |C| = 16 - |U| + e(H[U]).

For any U, deleting at most one endpoint per induced edge leaves an independent set, so |U|-e(H[U]) <= alpha(H)=5. Equality is attained by U=N(v), giving tau(G)=11.

Suppose equality holds and H[U] has two adjacent edges. Their common vertex covers both; choosing one endpoint of each remaining edge yields a vertex cover of H[U] with at most e(H[U])-1 vertices. Its complement is an independent set of H of size at least |U|-e(H[U])+1=6, impossible. Therefore H[U] is a matching plus isolated vertices.

Choose one endpoint of each of its t matching edges and all isolated vertices. This gives an independent set I of size |U|-t=5, so I=N(v). If t>0, an omitted matching endpoint has exactly one neighbor in I, contradicting the preceding two-or-five neighbor property. Hence t=0 and U is a maximum independent set, necessarily one of the sixteen N(v). This classifies all minimum covers, not just one preferred cover.

## 3. Packing and private family

Triangle packings of a triangle-free cone correspond to ordinary matchings in its base. The displayed perfect matching and the sixteen-spoke bound give nu(G)=8.

For C consisting of spokes at S=V(H) minus I, where I=N(v), a triangle is private exactly when its base edge crosses I,S. There are no edges inside I. Every private triangle uses a spoke at a vertex of the five-element set I, so an edge-disjoint private packing has size at most five.

For v=0, I={1,2,4,8,15}. The base matching

    {1,3}, {2,6}, {4,12}, {8,9}, {15,7}

has five edges, each crossing I,S. Translation by xor v gives a five-matching for every other neighborhood. Thus nu(P_C)=5 for all sixteen minimum covers.

## 4. Consequences and evidence

The exact script scripts/clebsch_private_obstruction.py checks all 65,536 subsets U, the full independent-set classification, all sixteen minimum covers, and explicit five-matchings. It uses integer graph combinatorics; no numerical LP or approximation. evidence/CLEBSCH_PRIVATE_OBSTRUCTION.json retains graph edges, covers, packings and the subset counts.

Earlier atlas testing examined all 1,253 unlabeled graphs through seven vertices and all 4,058 minimum covers, finding no failure of the private half-packing assertion. That finite survival did not predict this structured obstruction. The same atlas did refute both tempting intermediate identities tau(P_C)=tau(G) (already on the C5 cone) and nu(P_C)=nu(G).

**NO_GO:** selecting only triangles private to a minimum cover, even after optimizing the choice of minimum cover, cannot prove Tuza universally through |C|<=2nu(P_C). Any repaired method must explicitly use multiply-hit triangles or additional cover states. Wang's full one-red-triangle exchange family overlaps with P_C, but its proved covering bound does not supply this failed minimum-cover bridge. The obstruction does not refute Wang's theorem, R, or Tuza.
