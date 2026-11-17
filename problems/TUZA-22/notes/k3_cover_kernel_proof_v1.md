> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Six-edge cover kernel and the packing-three minimum-CS case — frozen v1

Author: TUZA-22 independent verifier. Status: **ORDINARY_PROOF_CANDIDATE** for the two elementary lemmas; **PROOF_USING_DECLARED_INPUT_CANDIDATE** for the minimum-CS corollary. Awaiting fresh review. No finite census, unbounded attachment inference, Lean claim, or historical-priority claim is used.

## Lemma K: a proved finite vertex interface

Let G be a finite simple graph with no isolated vertices, minimum degree at least five, and every actual edge in at least two actual triangles. Suppose nu(G)<=3 and G has an actual-edge triangle cover C of size six containing all three edges of some triangle T. Then every vertex of G is incident to C. In particular |V(G)|<=9.

### Proof

Suppose v is not incident to C. Every neighbor of v belongs to V(C). Indeed, if both endpoints v,w lay outside V(C), a triangle containing vw could have no C edge: the other two edges are incident to v orw, and neither belongs to C. Thus vw would lie in no triangle, contradicting the codegree assumption.

Put N=N_G(v), a subset of V(C). Any edge xy of G[N] must belong to C, since otherwise vxy would miss C. Conversely every C edge on N is an edge of G[N], so

    G[N] = C[N].

For each x in N, the codegree of vx equals the degree of x within G[N]. Hence C[N] has minimum degree at least two. Also |N|>=5 by the degree hypothesis. As C has only six edges, this forces |N| in{5,6}.

If |N|=6, C[N] has at least six edges and hence contains all of C. Every vertex of C[N] has degree exactly two. Since it contains T, its only possibility is two disjoint triangles. In particular N=V(C).

If |N|=5 and C[N] had only five edges, it would be a five-cycle. It contains no triangle, so T would need a vertex outside N, requiring at least two C edges outside C[N]. Only one C edge remains, impossible. Therefore all six C edges lie within N. The triangle T=abc uses three of them; let d,e be the other two vertices. Each of d,e has degree at least two using the remaining three edges. Therefore de is one of those edges, and the other two must join d ande respectively to terminal vertices x,y in{a,b,c}. If x=y, C is a bowtie (two triangles sharing one vertex). If x!=y, C is a triangle with a three-edge path between two of its vertices. Again N=V(C).

Thus the presence of any vertex outside V(C) forces C to be exactly one of the following three graphs, and forces that vertex to be adjacent to every vertex of C:

1. Two disjoint triangles abc anddef.
2. Two triangles abc andade sharing a.
3. Triangle abc together with the path a-d-e-b.

The same reasoning applies to every outside vertex; all are universal to this fixed core. There are no edges between outside vertices by the first paragraph. Moreover G[V(C)]=C, because the first outside vertex is adjacent to the entire core, and any extra core edge would form a triangle missed by C.

There cannot be two outside vertices v,w. Each of the three core shapes then contains four pairwise edge-disjoint actual triangles, explicitly:

- Shape1: abv, acw, dev, dfw.
- Shape2: bcv, abw, dew, adv.
- Shape3: adv, dew, bev, abw.

Every displayed triple uses an actual core edge and two existing spokes. Direct inspection shows no graph edge is repeated, contradicting nu(G)<=3.

Therefore there would be exactly one outside vertex. But each core shape has a vertex of core degree two; its full G-degree would be three (two core edges plus the single outside neighbor), contradicting minimum degree five. Thus no outside vertex exists.

Finally, C consists of the three-edge triangle T plus three other edges. Its endpoints therefore number at most3+2*3=9. QED.

## Lemma D: packing at most three on at most nine vertices implies mad<7

Let G have at most nine vertices and nu(G)<=3. Then every subgraph has average degree strictly less than seven.

Proof. A subgraph on at most seven vertices has average degree at most six. An eight-vertex subgraph with average degree at least seven is K8 and contains four edge-disjoint triangles. A nine-vertex subgraph with average degree at least seven has at least32 edges, and therefore at most four missing edges relative to K9. Averaging over its six-vertex subsets, the expected number of missing induced edges is at most

    4 * binom(6,2) / binom(9,2) = 5/3.

Thus some six-vertex subset has at most one missing edge. K6 minus at most one edge contains K2,2,2: choose a three-pair partition with the potentially missing edge inside one pair. The four triangles

    135, 146, 236, 245

are edge-disjoint across the parts {1,2},{3,4},{5,6}. This contradicts nu(G)<=3. The same octahedral packing handles the K8 case by restricting to six vertices. Hence no such dense subgraph exists. QED.

## Corollary: a minimum CS failure cannot have packing number three

Declared existing inputs, each at its exact scope:

- M0: a minimum unrestricted CS failure has no isolates, all edges supported, tau=2nu, and proper subgraphs satisfy CS.
- Accepted R1 and elementary residual accounting: every triangle residual of such a failure has nu=k-1 and tau=2k-3.
- Archived class-independent M3: every edge has codegree at least two, and every nonempty link component has order at least five. Since there are no isolates and every edge is supported, this implies minimum degree at least five.
- Archived TUZA-15 theorem T0: every graph with mad<7 satisfies CS (unrestricted inequality plus exact B equality classification within that explicit sparse class). This theorem is invoked only after Lemma D has proved its hypothesis; no sparse-class conclusion is imported universally.

Suppose a minimum CS failure has k=3. Choose an actual triangle T. Its residual H=G-E(T) has tau(H)=3. Let D be a minimum actual-edge cover of H, and set C=D union E(T). The two edge sets are disjoint; C has size six and covers every G-triangle, since all lost triangles use a deleted T edge. Lemma K applies, so G has at most nine vertices. Lemma D yields mad(G)<7. T0 then says G satisfies CS, a contradiction.

Together with R1's exclusion of k=1 and the separately frozen packing-two endpoint theorem (using the declared M3 codegree input), any minimum unrestricted CS failure must therefore satisfy

    nu(G)>=4.

The new work is the six-edge-cover vertex interface and the elementary density bridge. This is a scoped obstruction exclusion with declared historical inputs, not an unrestricted proof, a proof of H-D-CS-min, or a solution of the defect-one residual class for k>=4.

## Review prompts and limits

The argument bounds arbitrary attachments by a theorem, not a fixed-core census. Check specifically: why an outside vertex has no outside neighbor; why every edge of G[N(v)] belongs to the six-edge cover; the five-cycle exclusion; the three possible core shapes; every explicit four-packing; and the nine-vertex missing-edge average. The final use of T0 must remain explicitly conditional on its accepted exact mad<7 result. No original H-D theorem is transferred.
