# Independently checked elementary reductions

These are ordinary mathematical arguments within TUZA-13. Neither proves the universal two-red conjecture. The critic authored the cone argument before reading the hostile-family implementation, and the clique argument after the root requested a symmetry reduction for its timed-out generic K10 job.

## All minimum covers of a complete graph form one orbit

**Lemma.** Every maximum triangle-free spanning subgraph of K_n is a complete bipartite graph with part sizes floor(n/2), ceil(n/2). Hence every minimum triangle cover consists of the internal edges of these two parts.

**Proof, including the equality case.** Induct on n to show every triangle-free n-vertex graph has at most floor(n^2/4) edges. The empty graph is harmless. For any edge uv, N(u) and N(v) are disjoint (a common neighbor would make a triangle); hence d(u)+d(v)<=n. Removing u,v removes d(u)+d(v)-1<=n-1 edges. Induction gives

    m <= floor((n-2)^2/4)+(n-1) = floor(n^2/4).

A balanced complete bipartite graph attains equality. If another graph attains equality, both inequalities in the preceding argument are equalities, so for any edge uv the disjoint neighborhoods N(u),N(v) cover all vertices. Both neighborhoods are independent by triangle-freeness, giving a bipartition with sizes a,b. The graph has at most ab<=floor(n^2/4) edges; equality forces all cross edges to be present and the two part sizes to differ by at most one. This proves the lemma for n>=2; the smaller cases are immediate.

Thus every minimum cover of K_n is a relabeling of the selected representative, and transports any eligible packing along the same permutation. The number of distinct covers is binomial(n,floor(n/2)), divided by two for even n because exchanging equally sized parts does not change the cover. In particular the counts for n=10,11,12 are 126,462,462. This is mathematical completeness via symmetry, not a claim that every cover was independently enumerated.

`checks/independent_clique_thresholds.py` supplies literal qualifying packings for the representative covers of K10, K11, K12. All edges and triangles are independently listed. Every selected triangle is checked against the literal red set and every pair is graph-edge-disjoint. These are **exact affirmative threshold decisions**, not computed exact maximum eligible packing numbers. Each eligible triangle consumes two blue edges, so floor(ab/2) is an independent upper bound; the code records the interval between its witness and this bound. It does not upgrade the generic K10 timeout into an exhaustive generic-solver success.

## Triangle-free cones cannot be counterexamples

Let H be triangle-free on n vertices and G its cone with apex x. Its actual triangles are exactly xuv for uv in E(H). Fix a minimum triangle cover C and let U be the base vertices whose spokes xv are not in C.

The base edges in C are exactly E(H[U]): every such edge is forced by the otherwise uncovered triangle, and any other base edge would be redundant because its triangle already contains a red spoke. Thus

    |C| = n-|U|+|E(H[U])|.

For any U, deleting at most one endpoint for each induced edge leaves an independent set of size at least |U|-|E(H[U])|; consequently that quantity is at most alpha(H). Conversely a maximum independent set attains alpha(H). Therefore tau(G)=n-alpha(H), the ordinary vertex-cover number of H.

If uv is a red base edge, both xu and xv are blue. If uv is blue, its triangle contains at most the two red spokes. Hence **no triangle is all-red in any minimum cover**. In fact this no-all-red conclusion holds for every inclusion-minimal cover of a triangle-free cone. Every graph-edge-disjoint triangle packing in G corresponds exactly to a vertex-disjoint matching in H, because two cone triangles conflict precisely when their base edges share a vertex. Thus nu(T_{<=2}(C))=nu(G)=matching(H).

The endpoints of any maximal matching cover all edges of H. A maximum matching is maximal, so the vertex-cover number of H is at most twice its matching number. Combining these facts gives

    nu(T_{<=2}(C)) >= ceil(tau(G)/2)

for every minimum C. This is a fully quantified proof for this class only.

A useful equality characterization for finite enumeration is also immediate. If an optimizing U contains a vertex of degree at least two in H[U], deleting it increases |U|-|E(H[U])|, a contradiction. Therefore H[U] is a matching plus isolated vertices, with number of components alpha(H); conversely any such U attains the optimum. Exhaustive enumeration of all 2^n choices U is a valid all-minimum-cover classification for a specified H.

The unmodified Clebsch cone therefore cannot refute the two-red conjecture, although its private-only packing deficit is real. Perturbations that introduce base triangles or additional apices are outside this lemma.
