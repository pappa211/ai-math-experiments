# Triangle-free heavy-edge gate: exact screen and endpoint controls

Status: the broad gate below remains OPEN in this run. The two cell theorems and the resource-graph constraints below are ordinary proofs, independently reconstructed in discussion with root. They are not a proof of the broad gate or of unrestricted Tuza. No census or Lean computation was used for this screen.

Provenance: TUZA-19, packing_critic lane, local Darwin host. Original mission start 2026-11-15T01:53:58Z, research cutoff 2026-11-15T09:23:58Z, hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving identity and effort are not exposed. Root supplied the gate and the square-cell transition-circuit argument; the star-cell construction, its exact parameters, and the endpoint constraints were reconstructed jointly. All claims concern finite simple graphs.

## 1. Exact candidate and global role

Write d_T(e) for the number of actual graph triangles containing e and let H_3 be the spanning subgraph with edge set {e:d_T(e)>=3}. The candidate is

    H_3 triangle-free  ==>  tau(G)<=2 nu(G).

Equivalently, every actual triangle has an edge of triangle-codegree at most two. This hypothesis is preserved by arbitrary edge and vertex deletion: the heavy edges in a subgraph are a subset of the original heavy edges. Thus a minimal counterexample within this class would have all the usual minimal-Tuza-violation consequences, including TF (every triangle is contained in some minimum triangle cover), edge-cover criticality, and two-edge packing resilience. A proof would force an all-heavy triangle in a minimal violation; it would not by itself exclude arbitrary minimal violations.

The stronger intermediate statement “every nonempty TF graph has an all-heavy triangle” was considered but NOT proved. There is no claimed reduction from TF to that assertion. In particular, analogous claims forcing a K4 would already settle the open K4-free case and must not be used casually.

Targeted primary-source searches did not locate the exact gate. This is a bounded source check, not a novelty claim. Puleo's weak Konig-Egervary reductions and the more recent bounded-codegree/core localization statements inspected by the source-audit lane do not directly state this unrestricted hypothesis. Primary reference for the WKE framework: G. J. Puleo, *Tuza's Conjecture for graphs with maximum average degree less than 7*, European Journal of Combinatorics 49 (2015), 134–152, https://doi.org/10.1016/j.ejc.2015.03.006 . The related primary triangle-graph paper explicitly gives a different sufficient condition (no odd wheel of rim length at least five), not this gate: https://doi.org/10.1016/j.dam.2015.12.012 .

## 2. Why a degree-only hypergraph argument fails

The Fano plane with one line removed has matching number one and transversal number three. Each remaining triple contains a point of degree two. Moreover every remaining triple itself is a transversal, so the example has the abstract TF property. It is not a full actual-graph triangle family.

In the special model where every actual triangle has EXACTLY two heavy edges and one light edge, define a simple resource graph F: vertices are heavy graph edges, and each actual triangle supplies an F-edge joining its two heavy edges, colored by its light graph edge. Then

* F is a subgraph of the line graph of H_3.
* The coloring is proper. A fixed heavy edge and a fixed light edge determine at most one actual triangle.
* Each color appears at most twice, since its graph edge is light.
* Triangle packings correspond exactly to rainbow matchings in F. A triangle cover is exactly a choice of F-vertices and colors meeting all F-edges.

Actual endpoints give additional constraints absent from the abstract colored-graph model.

First, F is triangle-free in this EXACT model. Three pairwise incident edges of triangle-free H_3 must be three spokes at one center. If the three corresponding F-edges exist, the three distinct closing light edges form an actual all-light triangle, contrary to the exact-two-heavy hypothesis. In the broader gate, an F-triangle instead forces such an all-light triangle; it cannot simply be forbidden.

Second, consider two F-edges of one color xy. Their heavy pairs are {ux,uy} and {vx,vy}, where u,v,x,y are distinct. The only possible cross adjacencies between these four F-vertices are ux--vx and uy--vy, since the other two pairs are vertex-disjoint graph edges. Either cross adjacency exists exactly when the graph edge uv exists; both then exist. The edge uv is light because ux and vx are heavy and H_3 is triangle-free. The four F-vertices therefore induce a C4, with its opposite F-edges sharing each of two colors. This is the full actual K4 on {u,v,x,y}, with heavy C4 boundary and light diagonals.

In particular the K4 resource graph with its three opposite-edge color classes (the Fano-minus-line obstruction) is not actual-graph realizable here. Four pairwise incident heavy edges must be four spokes at one center, whose six closing edges are distinct; moreover their low-edge closure creates additional graph triangles.

There is a stronger valid local consequence when TF is imposed. In ANY TF graph, no K4 can contain an all-light triangle. Its three edges have codegree exactly two, so every triangle containing any of them is in that K4. A minimum cover containing all three can keep one of them, add its opposite K4 edge, and remove the other two. The remaining opposite edge pair covers the entire K4, all removed edges are irrelevant outside it, and the size falls by at least one, a contradiction.

Therefore, under TF and triangle-free H_3, both the heavy and light edges inside any K4 are triangle-free. The heavy pattern must be exactly 2K2, P4, or C4: a triangle-free subset of K4 with a triangle-free complement has two, three, or four edges; the two-edge case must be a matching, the four-edge case its C4 complement, and in the three-edge case the triangle and star are excluded, leaving P4. In particular F is triangle-free under TF even when the graph also has zero- or one-heavy triangles: an F triangle would create the forbidden heavy-star/light-rim K4. This is a proved local exclusion, not the unproved assertion that every TF graph contains an all-heavy triangle.

Weakest link: neither this TF exclusion nor the square-completion condition gives a proved global rainbow-matching/cover theorem. Triangles with zero or one heavy edge are additionally present in the broad gate and cannot be discarded. No such theorem or availability reduction is claimed.

## 3. Star K4 cells: a large triangle-free heavy graph with an exact solution

Let H be a finite simple graph of girth at least seven, with every nonzero vertex degree a multiple of three. At each vertex v partition N_H(v) into triples. For each triple {x,y,z}, add xy,xz,yz, producing a K4 cell on {v,x,y,z}. Retain all original H edges. Let c be the number of cells.

Every added edge has a unique length-two H path, since H has no 4-cycle. Every actual triangle of the resulting graph G belongs to one cell. To see this, replace each of its added edges by that length-two H path. The resulting union has at most six H edges and hence is a tree. Three vertices at pairwise tree-distance at most two either have one as their common center or are three neighbors of a common center. Existence of their added pair edges forces them into the same triple of that center's partition. This proves the asserted cell ownership; each triangle contains a new edge, so ownership is unique.

Each original H edge lies in exactly the two cells centered at its endpoints, and contributes two triangles in each; its triangle-codegree is four. Each added edge is private to one cell and has triangle-codegree two. Consequently H_3(G)=H exactly. The construction assumes no upper degree bound on H; it illustrates why triangle-freeness of H_3 does not directly imply a small heavy core.

Form the cubic cell-dual D: each cell is a vertex and each original H edge joins its two owning cells. It has no isolated vertices. The following identities hold:

    nu(G)=c,
    tau(G)=c+rho(D)=2c-mu(D),

where rho is minimum edge-cover size and mu is ordinary matching number.

Proof of nu: each K4 contains at most one packed triangle, so cell ownership gives nu<=c. The c rim triangles, consisting of the three private edges of each cell, are pairwise edge-disjoint and attain c.

For tau, if a cover chooses no original H edge at a cell, it must select all three private rim edges. Adding any one cell spoke and removing the two rim edges incident with its leaf gives a smaller cover; the remaining rim edge is opposite that spoke, and removed edges occur in no other cell. Thus every minimum cover chooses at least one H edge at each cell. It also needs at least one private rim edge per cell to hit the rim triangle. Conversely any edge cover F of D, together with one suitable rim edge per cell, covers all triangles: with one selected spoke use the opposite rim edge; with two or three selected spokes any rim edge suffices. Hence tau=c+rho(D). The standard identity rho(D)=c-mu(D) follows by completing a maximum matching to an edge cover, with the reverse inequality obtained by taking one edge from each star component of a minimum edge cover.

The same local replacement shows that NO minimum cover contains all three edges of a rim triangle. Therefore G fails TF whenever c>0. This family is not an obstruction to the proposed gate.

Further limitation: each link component consists of a central K3 on three heavy neighbors, with a private pendant K3 attached at each of those neighbors. It has exactly three vertices of degree at least three. Thus this construction is already removed by the componentwise four-branch WKE reduction proved elsewhere in this run. A large H_3 core alone does not mean a graph survives that reduction.

## 4. Square K4 cells: transition circuits settle the exact model

Suppose a finite simple graph has a family of K4 cells such that:

1. every actual triangle belongs to exactly one cell;
2. each cell has a designated four-edge boundary cycle and two diagonals;
3. every diagonal is private to its cell and is not a boundary edge of another cell;
4. each boundary edge belongs to exactly two distinct cells.

There are c cells. No assertion is made that every graph in the broad gate admits this decomposition.

The cell-dual D is 4-regular: its edges are shared boundary edges. At each dual vertex pair its four incident half-edges according to opposite edges of the cell's boundary C4. Following these fixed transitions partitions the dual edges into closed circuits. Orient each circuit consistently. At every cell each opposite pair then has one outgoing and one incoming boundary edge, so its two outgoing boundary edges are adjacent on the C4. Take the triangle formed by those two boundary edges and their private closing diagonal.

These c triangles are pairwise edge-disjoint. A shared boundary edge is used only at its outgoing endpoint cell, and diagonal edges are private. Therefore nu>=c; unique cell ownership gives nu<=c. The 2c private diagonals meet each triangle exactly once, so they are also an odd cover. Thus

    nu(G)=c,    tau(G)<=pi(G)<=2c=2nu(G).

This proof covers the stated exact multiplicity-two model. No claim for arbitrary higher boundary multiplicities, arbitrary cell overlaps, or incomplete diamond cells follows. The root-suggested dangling-boundary extension is not needed here and is not asserted in this frozen statement.

## 5. Decision

The broad triangle-free-H_3 Tuza gate is unresolved. The actual-graph Fano exclusion is valid but insufficient as a global proof. The TF light-rim K4 exclusion and both all-size cell models are resolved and identify why their tempting large heavy cores do not constitute obstructions. No graph counterexample to Tuza, no proof of the broad gate, and no new global minimum-counterexample reduction is claimed. Further work needs a genuine availability or exchange theorem incorporating all triangle types, rather than a larger census of the controls above.
