# Final targeted check: matching subsets and the thirteen-vertex catalogue

Same TUZA-17 mission and original deadline. This is an additional internal AI review requested by the coordinator after the user's boundary steering. Prior frozen critiques remain unchanged. No broad graph census was run.

**Verdict:** the generalized matching-subset criterion is valid. The explicit three-C5 and thirteen-vertex circulant witnesses satisfy it. The reduction from all matching-six/cover-nine links to those two shapes is valid **with McKay's catalogue completeness explicitly accepted as an external input**. The b≤6 theorem has no dependence on this new catalogue.

## 1. Generalized sufficient criterion, with the joint minimum-cover constraint retained

Let H,X,L,G satisfy literal AC, write p=nu(G), b=2p−tau(H), m=mu(L), and suppose m=b−1. Let R be the intersection of all maximum ordinary link matchings. Assume |R|<m−1. If there exists a maximum matching M and a subset F of M such that

    vc(L−F)≤b,

then AC holds.

Suppose instead AC fails. No minimum H triangle-edge cover can contain ALL of F, because its residual link would be a subgraph of L−F and would have vertex cover at most b. The exact minimum size of an H cover containing F is

    |F|+tau(H−F).

Indeed restricting such a cover after removing F covers H−F, and conversely a cover of H−F together with F covers every H triangle. Thus integrality gives

    |F|+tau(H−F)≥tau(H)+1.

Delete the remaining m−|F| matching edges to obtain

    tau(H−M)≥tau(H)−m+1=2(p−m).

Aharoni and the actual apex packing bound give tau(H−M)≤2nu(H−M)≤2(p−m), so the residual is tight. The already checked tight-frontier theorem then forces |R|≥m−1, contradiction.

The joint condition matters. For |F|>1, individual edges of F may each belong to some minimum H cover even though no minimum cover contains the entire set. The proof does NOT assume separate zero-cost deletions. It uses the exact forced-cover identity for F as a set. Matching EDGES are deleted, and all triangle families are full actual graph triangle families. The sufficient criterion has no outside-incidence restriction.

## 2. Explicit ordinary witnesses at b=7

### Three disjoint C5s

Label their vertices 0–4, 5–9, and 10–14 cyclically. The link has matching number six and vertex-cover number nine. Choose

    F={01,56},
    M={01,23,56,78,(10,11),(12,13)}.

M is maximum and contains F. The seven vertices {2,4,7,9,10,12,14} cover L−F. The intersection R of all maximum matchings is empty, since a C5 has maximum matchings avoiding each of its edges. Thus the sufficient criterion proves AC for every eligible surrounding instance with this link and b=7, including arbitrary extra isolated link vertices.

### The thirteen-vertex circulant

Let L have vertices Z/13Z and edges of difference ±1 or ±5. Its verified ordinary parameters are mu=6 and vc=9. Let

    I={0,1,3,4,7,10},
    F={01,34},
    M={01,34,56,78,(9,10),(11,12)}.

The graph induced on I has exactly the two edges F. Therefore its seven-vertex complement covers L−F. M is an actual six-edge matching, hence maximum, and contains F. The ordinary 13-cycle is a spanning subgraph. Its thirteen rotated near-perfect matchings are maximum matchings of L and have empty intersection, proving R is empty. The criterion again proves AC for every eligible surrounding instance with this link and b=7.

These are unbounded statements about arbitrary eligible H attachments, obtained from explicit finite LINK certificates. They are not constructions of a surrounding H with budget seven and not AC counterexamples.

## 3. Why matching-six/cover-nine links have only the stated structural possibilities

Let L be triangle-free with mu(L)=6 and vc(L)=9. No vertex can be covered by every maximum matching: deleting such a vertex would give matching number five and vertex cover at most seven by the already proved ordinary bound; adding the vertex back would give vc(L)≤8.

Thus the elementary Gallai argument applies componentwise, making every nontrivial component factor-critical. Such a triangle-free component has matching number at least two. The nonzero component matching numbers partition six as

    6; 4+2; 3+3; or 2+2+2.

For 4+2, the component orders are nine and five, with cover bounds five and three, totaling at most eight. For 3+3, both orders are seven and both covers at most four, again totaling at most eight. The remaining possibilities are:

- three C5 components; or
- one thirteen-vertex triangle-free factor-critical component with independence number four.

Arbitrary isolated vertices are allowed. This reduction is proved ordinarily, using only the previously proved matching decomposition and small triangle-free independent-set bounds. It is NOT itself a classification of all thirteen-vertex Ramsey graphs.

## 4. Exact external catalogue dependency

I directly inspected [Brendan McKay's Ramsey graph catalogue](https://users.cecs.anu.edu.au/~bdm/data/ramsey.html). It defines Ramsey(s,t,n) graphs by absence of the specified clique and independent set, labels the relevant section **All Ramsey(3,5)-graphs**, and lists one graph at thirteen vertices. This section is distinct from later sections explicitly restricted to maximal graphs. The linked [thirteen-vertex graph6 record](https://users.cecs.anu.edu.au/~bdm/data/r35_13.g6) contains one graph. The mission saved both page and record locally.

Accepted external input: this published catalogue is complete up to isomorphism for triangle-free thirteen-vertex graphs with no independent five-set. The catalogue's exhaustive generation and completeness proof were NOT independently reconstructed or rerun in this mission. Inspecting one downloaded record cannot verify that there are no omitted records. The classification-based conclusion below retains that explicit dependency.

New independent code `checks/critic_catalogue.py` reads the downloaded graph6 bytes without importing the coordinator's checker. It decodes adjacency directly, verifies triangle-freeness and independence number four by exact enumeration, constructs an isomorphism to the ±1,±5 circulant, and checks that bijection against every edge. It also independently verifies both displayed matching-subset witnesses and the empty-intersection cycle certificates. Results are in `evidence/critic_catalogue.json`.

The watchdog run completed successfully in 0.213 seconds with a 60-second/512 MiB sampled-RSS limit. This is a check of ONE catalogue record and two explicit witnesses, not a broad graph census or a recomputation of catalogue completeness.

## 5. Conditional scope conclusion and unchanged earlier theorem

With the declared primary catalogue completeness accepted, every thirteen-vertex component in Section3 is isomorphic to the checked circulant. Hence ALL eligible AC instances satisfying

    b=7, mu(L)=6, vc(L)=9

satisfy AC, by the ordinary structural reduction and matching-subset criterion. Evidence category: **PROVED_USING_DECLARED_CATALOGUE_AND_PUBLISHED_INPUT**, the latter including the scoped Aharoni/HNS dependency of the tight-frontier theorem.

Without relying on catalogue completeness, the ordinary proof still settles the explicit three-C5 and circulant link shapes, while the universal thirteen-vertex classification remains an external obligation. This distinction must not be erased by the local isomorphism PASS.

The theorem AC for b≤6 remains exactly as proved in CRITIC_BUDGET_SIX.md and has no McKay catalogue dependency. With the catalogue-supported branch included, the next conditional numerical AC-failure case at budget seven is

    b=7, m=6, vc(L)=lambda=8.

This remaining stratum is unresolved here. No full eligible H realizing it has been supplied by this critic. Proving AC on a parameter stratum excludes failure, not raw numerical realizability of eligible instances. Full AC and unrestricted Tuza remain unresolved; no global apex or ear availability theorem has been established.

Originality UNESTABLISHED. New Lean and separately commissioned independent_final_verification NOT_RUN. Earlier critic notes remain byte-for-byte unchanged.
