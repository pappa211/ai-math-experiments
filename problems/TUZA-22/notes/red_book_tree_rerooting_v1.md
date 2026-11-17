> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Rerooting red-book trees and bounding exceptional paired slots

Frozen ordinary structural mechanism,2026-11-16. Source_audit. The theorem controls actual pages by changing the supplied maximum packing. It does NOT assert that the resulting K4 supports are whole triangle components or that arbitrary attachments can be removed.

## 1. Supplied configuration and exact auxiliary graph

Let C be an actual triangle-edge cover meeting EVERY actual triangle exactly once. Color C red and the remaining edges blue. Let P be a maximum packing of size k and let Q be a packing of size q surviving deletion of P's blue edges. Pair the Q and P pages on their common red spine, leaving s=k-q singleton P-triangles. All book supports are pairwise edge-disjoint. Let W be the 2s singleton blue edges and R the k used red spines.

A paired book on red spine c=uv has displayed pages uvx,uvy. If xy is an actual edge, it MUST be red: otherwise uxy would be an all-blue triangle. Its four blue cross edges together with c and d=xy form a literal K4.

Define an auxiliary graph A whose vertices are the red edges C themselves. Each paired book with an existing opposite d contributes the directed edge c->d. A paired book whose opposite is absent contributes no auxiliary edge but remains assigned to its spine vertex. Singleton spines have no outgoing edge. Unused red vertices also have no outgoing edge.

There are no loops. There cannot be two auxiliary edges with the same unordered endpoints: the corresponding books would use the same four blue edges of the same K4, violating disjoint supports. Every vertex has outdegree at most one. Therefore every weak component is a tree or has precisely one cycle.

For completeness, an auxiliary triangle is impossible. Its three red bases would be pairwise vertex-disjoint actual edges, and the three K4 books give every blue cross edge between each pair of bases. One endpoint from each base would form an all-blue actual triangle. Thus any auxiliary cycle has length at least four. This observation is not needed for the main count.

## 2. Exact diagonal flip

Suppose a paired book has used spine c and UNUSED red opposite d. Replace its P and Q pages by the two pages on d in the same literal K4. Their four blue edges are the same four edges, merely repartitioned between the two pages. The new P and Q are still packings, their blue supports remain disjoint, and the other books and all singletons are unchanged. The red edge d becomes used and c becomes unused. Thus P remains maximum of size k and Q remains a q-packing surviving its blue deletion.

In the auxiliary graph this reverses exactly the edge c->d; the underlying auxiliary graph is unchanged. No new abstract graph edge or triangle is introduced.

## 3. Reroot an entire unused-root tree

Let A0 be a nontrivial tree component containing an unused red vertex r. Since it has |V(A0)|-1 edges and outdegree at most one, r is its UNIQUE outdegree-zero vertex; every other vertex is the spine of one represented paired book. In particular this component has no singleton spine and no paired spine with missing opposite. Its orientation points toward r.

Successive diagonal flips along the unique path from r to any chosen vertex c move the unused red root to c. The full paired-book K4 supports, all singleton triangles and W remain fixed. Every intermediate state satisfies the hypotheses of Section1.

Apply the elementary book-cover geometry after c has become unused. Any actual triangle whose red edge is c and whose blue edges avoid W must avoid all used spines. Consequently it is an opposite page of one of the paired books. Its opposite is c, so that book is an auxiliary edge incident with c. Conversely, each of the two c-pages in every incident K4 is actual and avoids W.

Hence, for EVERY red vertex c of A0, the following exact identity holds in the ORIGINAL graph and configuration:

    {actual triangles with red c avoiding W}
      = {the two c-pages of every auxiliary K4 incident with c}.       (1)

The singleton red edges are outside A0, so the same identity holds after deleting all singleton triangles completely. All actual crossing triangles with a red edge in A0 are counted by (1); no fresh-gluing or vertex-disjointness assumption was used.

In particular, the literal edge-support subgraph formed by the K4s of A0 has exactly their displayed triangle family: any triangle in that support has its red edge in A0, and (1) excludes any additional crossing triangle. Nonadjacent K4s may still share graph vertices. This statement concerns the literal support subgraph, not its isolation from the rest of the residual.

## 4. Exact exceptional-slot count

Let g be the number of DISTINCT unused-red opposite edges of the paired books. Each is the unique unused root of a nontrivial auxiliary tree, so g equals the number of such tree components.

Call a paired slot regular if its entire auxiliary component consists of one edge joining its used spine to an unused root. These are literal K4 pairs to which (1) applies. All other paired slots are exceptional; this definition counts book slots, NOT actual triangles or graph vertices outside those supports.

For an unused-root tree containing r>=2 paired books, its contribution to q-g is r-1, which is at least r/2. A one-edge unused-root tree contributes zero and is regular. Every other component has no unused root and contributes its entire number of paired slots to q-g; this includes a root at a singleton spine, a root whose paired book has missing opposite, and a unicyclic component. Isolated unused red vertices have no paired slot and contribute nothing. Summing gives

    number of exceptional paired slots <= 2(q-g).                     (2)

Now impose the strict-branch cover hypotheses

    tau(G)=2k-1,
    tau(G-E(T))=2k-2 for every actual triangle T,

with C minimum and s>=1. The exact singleton book-cover count already proved in hd_wang_book_defect_count_v1.md gives q-g<=s-1. Therefore

    number of exceptional paired slots <=2(s-1).                     (3)

This is an all-size parameterized bound, independent of q and the number of ordinary K4 slots. It does not make the exceptional book families finite: a missing-opposite spine may have arbitrarily many extra pages, and other actual triangles may attach along regular K4 blue edges.

## 5. Literal attachment guardrail: a regular K4 need not be a component

Let G have vertices0,...,6 and edges

    K4 on {0,1,2,3}, together with 04,05,45,06,46,24.

Its actual triangles are the four K4 triangles and the three pages042,045,046 on spine04. The cover C={01,23,04} is minimum and exact-one. Its size is three: the K4 requires two cover edges, and triangle045 has no edge in that K4. The packing number is two, because every triangle lies either in that K4 or in the common-spine04 book; one of each can be packed.

Take

    P={012,045}, Q={013,046}.

P is maximum, Q survives deletion of its blue edges, and the paired book on01 has unused opposite23. Its auxiliary component is the isolated edge01--23, so it is a regular K4 slot. The paired book on04 has missing opposite56.

Nevertheless the extra bad-spine page042 shares the BLUE edge02 with the regular K4. It remains present when there are no singletons to delete, and the regular K4 is not an actual triangle component of the whole graph. Identity(1) is still exactly true for red01 and red23.

Thus it would be invalid to replace the original residual by B merely because all but a bounded number of AUXILIARY slots are regular. Their outside-page boundary must be handled by a separate argument. This control is not an original-H-D graph and is not a counterexample to any proved H-D statement.

## Dependency and remaining bridge

The only source mechanism is the elementary actual book-cover fact reconstructed from Wang, arXiv:2609.13831v1, Section2 Lemma2.2. Rerooting, pseudoforest orientation, the exact page identity and the slot count are proved here directly. No finite computation, published general bound, GE, Kotzig, graph-realization relaxation or formalization is used.

The new interface is: a surviving strict H-D state with s singleton triangles has at most2(s-1) exceptional paired slots, while every unused-root tree admits complete actual red-page control by rerooting. The unproved bridge is a simultaneous attachment/restoration argument or an independent lower bound on attainable survivor packing. Neither is supplied by (1)-(3).
