> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary-cover scout: component peeling

## Admitted candidate A1 (2026-11-15, initial record before testing)

**Exact statement (CONJECTURE).** Let G be finite and simple, k=nu(G)>0, and suppose every actual triangle T has nu(G-E(T))=k-1 and tau(G-E(T))=2k-2. Then some nonempty component of the actual triangle family, with adjacency defined by sharing a graph edge, has packing number one. Covers and packings are unrestricted graph-edge objects.

**Unrestricted implication.** Triangle components have disjoint edge supports, and every triangle belongs to one of them, so their packing numbers add. A component with packing number one has a cover of at most two graph edges by the pairwise-intersecting-triangle lemma below. Deleting that cover lowers the total packing number, proving H-D. The known edge-minimal-counterexample implication then proves Tuza. OPEN: all-k component availability, not assumed equality classification.

**Graph-specific structural basis.** A family of pairwise edge-intersecting actual triangles either shares an edge or has literal K4 support. For k=2 the residuals are therefore actual K4s, and their endpoints give a three-triangle augmentation unless their completing vertices agree. Generic linear triple systems do not have this completion property.

**Two reasons to pursue.** (i) It converts the residual equalities into a literal local graph substructure, with a complete k=2 argument. (ii) It gives an actual blocker through additivity, without retaining a chosen old minimum cover or imposing support confinement.

**Two reasons it may fail / be low leverage.** (i) A1 is stronger than H-D: a graph could have a two-edge packing blocker but no packing-one component. (ii) At k>=3 the tight residual need not have known K4/K5 classification; proving component availability may conceal the original global difficulty. Sparse equality theorems cannot be applied without their hypotheses.

**Cheapest falsification and controls.** Reconstruct literal triangles in small K4-cell overlaps and clique-sums, including edge/triangle overlaps, cyclic vertex incidence, and one-edge joins that create crossing triangles. Retain K4, K5, two vertex-sharing K4s, and the switched-four-cycle as controls. Test both H-D premises exactly before interpreting a candidate failure. A1 refutation needs a qualifying graph with all triangle components having packing number at least two; H-D refutation additionally needs every edge pair packing-resilient. No broad atlas extension is planned.

**First nontrivial lemma.** Prove the residual-K4 completion argument at k=2, then determine whether an actual K4 triangle component in some residual can be forced to survive as a packing-one component of G. The latter would isolate a local interface; general availability of such a residual cell remains a separate all-k obligation.

**Continue / revise / retire.** Continue only if overlap geometry provides an all-size boundary lemma or exact candidate counterexample. Retire A1 on a certified counterexample. If the only next step is unrestricted equality classification or enumerating more survivors, downgrade it to an unsupported structural conjecture and regenerate.

## Known H-D implication reconstructed

Choose a Tuza violation G with the least number of edges and set k=nu(G). Every proper subgraph satisfies Tuza. For any edge e, tau(G)<=tau(G-e)+1<=2nu(G-e)+1<=2k+1, while tau(G)>2k, hence tau(G)=2k+1. If |S|<=2 and nu(G-S)<=k-1, then tau(G)<=tau(G-S)+|S|<=2(k-1)+2=2k, impossible. For a triangle T, any packing in G-E(T) can be adjoined to T, so nu(G-E(T))<=k-1. Thus 2k+1=tau(G)<=tau(G-E(T))+3<=2nu(G-E(T))+3<=2k+1. Equality gives both H-D premises. This is inherited infrastructure, not new progress.

## Lemma L1: pairwise-intersecting actual triangles

If a graph has packing number one, every two of its triangles share an edge. If all share one edge, that edge covers them. Otherwise choose abc and a triangle abx with x outside abc (if no such triangle exists, abc is the sole triangle). A triangle not containing ab must intersect both abc and abx in edges. The only possibilities are acx or bcx, after relabeling. The six edges on {a,b,c,x} are then present, so all four K4 faces are actual. Any triangle meeting all four faces in edges lies inside this K4: an outside triangle has at most two of its vertices in the K4 and hence at most one K4 edge, which misses two faces. Therefore the entire triangle support is exactly K4. Its two opposite edges cover all four faces. In particular nu=1,tau=2 forces literal K4 triangle support.

## Theorem L2: complete H-D classification at k=2 (ordinary proof candidate)

Suppose the H-D premises hold with k=2. Fix a triangle T. L1 says the full triangle support of G-E(T) is a literal K4 on U. Since no edge of T lies in that K4, |V(T) intersect U|<=1.

For each face F of U, T survives in G-E(F), whose full triangle support is another literal K4, on V(T) union {w_F}. If two faces give distinct vertices w and wprime, write T={x,y,z}, choosing x as its intersection with U when nonempty. The actual triangles xyw and xzwprime share only x, hence no edge. Choose a face of U avoiding x (any face if x is outside U). Each of xyw,xzwprime contains at most one vertex of this face: y,z are outside U, while x is excluded. Thus that face is edge-disjoint from both, giving a packing of three, contradiction. All w_F therefore equal a single w, and the residual K4 is a fixed V=V(T) union {w}.

Every triangle Q not contained in V must meet every face F of U in an edge, because the only triangles disjoint from F are the faces of V. A triangle meeting all four faces of U must itself be a face of U, by L1's elementary endpoint observation. Hence the full triangle family consists precisely of the faces of U and V. The two K4 supports are edge-disjoint, since for each face F of U all edges of V survive deletion of F; the four faces cover E(U). They may share a vertex. Their packing numbers are one each and either opposite pair in either K4 is a two-edge blocker. Triangle-free background edges are permitted.

This establishes A1 and H-D for k<=2 only. It does not establish an unrestricted component-peeling mechanism. No historical novelty claim is made.

## Initial boundary diagnosis

If a residual K4 cell U is edge-component-isolated in H=G-E(T), then |U intersect T|<=1. If U and T are vertex-disjoint, no restored triangle can share a U edge, so U remains a packing-one component in G. If they share a vertex a, restored pages can attach along two different spokes au,av. Each of the other two vertices of T can have at most one neighbor in U minus {a}, since two would create an H triangle sharing a U edge. Distinct attachments create a local three-for-two packing, but external residual triangles may occupy its attachment edges. Ignoring those outside triangles is an invalid augmentation argument. The all-k availability and occupied-attachment interface are OPEN.

## Targeted finite control and disposition

`scripts/ordinary_cells.py` freshly rebuilt literal graph triangles and used exact memoized packing/cover recurrences on 24 targeted graphs. All finished in less than 0.01 seconds; no partial/UNKNOWN case occurred. Full literal inputs and every triangle-deletion pair are in `data/ordinary_cell_controls.json`. Qualifying graphs had packing-one K4 triangle components. Two K4s sharing an edge or triangle fail H-D; so do the three-cell vertex cycle (whose shared vertices create an additional crossing triangle), common-edge bouquets, K5, K6, and the switched-four-cycle. Four K4s arranged in a vertex cycle qualify because their full triangle family stays cell-local. These controls explain boundary behavior, not an all-size inference.

The first serious A1 hypothesis remains CONJECTURE, neither proved nor refuted. The accepted scoped output is L2, subject to independent reconstruction. The scout recommends suspending A1 proof effort after the concrete boundary diagnosis: outside residual triangles can occupy the two attachment edges, and proving those edges avoidable requires an unproved all-size property of tight residuals. No bound, cover-reconfiguration rule, or general equality classification follows from the k=2 argument.

A possible narrower intermediate statement is that a two-edge packing blocker in a Tuza-tight graph whose proper subgraphs satisfy Tuza must be opposite edges of a literal K4. This is an unproved exploratory proposal, not admitted as a serious new candidate: the current evidence is entirely inherited K4/K5 equality structure, and there is no demonstrated all-size mechanism. Assuming it would merely hide the principal difficulty in a new name. The precise next needed input is a graph-geometric proof controlling such blockers without classifying every tight graph; no credible proof step to obtain it was found in this scout.

## Focused primary-source check

Cui, Haxell and Ma, *Packing and Covering Triangles in Planar Graphs*, Graphs and Combinatorics 25 (2009), 817–824, published online 10 February 2010, DOI 10.1007/s00373-010-0881-5. Inspected the authors' hosted PDF https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf on 2026-11-15. Theorem 1.2 and the definition in Section 2 characterize tight **planar** graphs by edge-disjoint K4 cells with every actual triangle cell-local. Proposition 2.2 gives a minimum-cover choice across distinct cells. The proof uses planarity to obtain a vertex whose link has maximum degree at most two (Lemma 2.3). This is relevant precedent for cell-based equality arguments, but provides no unrestricted availability theorem. Neither the current k=2 observation nor A1 is assigned an originality claim; the limited source check cannot establish priority. Search snippets from secondary sites were not used as theorem inputs.

Source access limitation: the browser tool exposed the eight-page PDF, but direct local download returned HTTP 403; no archived PDF hash is claimed. The receipt records the bibliographic version and inspected scope. The self-contained k=2 proof does not depend on the external theorem.
