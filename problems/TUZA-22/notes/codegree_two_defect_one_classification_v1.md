> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Codegree-two graphs: exact defect-one triangle components

Frozen v1, 2026-11-16. Status: PROOF_USING_DECLARED_INPUT_CANDIDATE; fresh independent review required. The declared classical inputs are the Tutte–Berge formula and Staton's independence bound, with exact primary statements authenticated below. No novelty claim is made for the resulting scoped classification. The new campaign role is an alternative near-tight decomposition based on the actual triangle intersection graph.

## Theorem and definitions

Let G be finite and simple, and suppose every edge lies in at most two actual triangles. Then τ(G)≤2ν(G), with equality exactly when all nonempty triangle components have literal K4 support. If instead

    2ν(G)−τ(G)=1,

all but one nonempty triangle components have literal K4 support, and the remaining component has support exactly one of:

- a single K3;
- a diamond K4 minus one edge;
- the 5-wheel, meaning a five-vertex chordless cycle and its universal hub (six vertices total).

Thus its nonclassified component has packing number at most two. Arbitrary triangle-free background and shared graph vertices are allowed, subject to counting every actual triangle. An additional consequence is that if G is edge packing resilient, the exceptional component is the 5-wheel: K3 and the diamond each have an edge whose deletion lowers their packing number.

## 1. Exact triangle-intersection duality

Let X have one vertex per actual G triangle, adjacent when two triangles share a graph edge. Since any graph edge lies in at most two triangles, each triangle has at most three neighbors. A G triangle packing is an independent set in X, so ν(G)=α(X).

A graph edge used as a transversal hits one or two triangle vertices, corresponding to a singleton or an edge of X. Consequently the minimum number of these covering objects is

    τ(G)=|V(X)|−μ(X),

where μ is ordinary matching number. For the upper bound, pair triangles along a maximum X matching and cover each pair by its common G edge; cover each unmatched triangle by any of its edges. For the lower bound, a graph-edge cover gives a cover of X vertices by edges and singletons. In the graph of its chosen pairs, each nontrivial connected component contains a matching edge and needs at least its vertex count minus one chosen edges; singletons each cost one. Taking one matching edge per pair-component shows that any such cover has size at least |V(X)|−μ(X). This also covers isolated triangle vertices.

Write d(X)=2α(X)+μ(X)−|V(X)|. It equals the triangle defect 2ν−τ and is additive over X components.

Any triangle in X forces its whole component to be K4. Indeed its three G triangles cannot all share one G edge, by codegree two. Their three pairwise shared edges are distinct and pairwise incident. They cannot form a G triangle, since then the completion of a pair would be the third shared edge rather than the distinct remaining edge. They therefore form a three-edge star, and the three remaining edges form the opposite face of a literal K4. Its fourth triangle is actual. Every edge of that K4 already has two triangle occurrences, so no outside triangle shares an edge with it. Hence the whole X component is K4. Its support is exactly the literal K4 and d=0.

Every other X component is triangle-free and subcubic.

## 2. Matching bound for a triangle-free subcubic graph of minimum degree two

Let Y have n vertices, minimum degree at least two, maximum degree at most three, and no triangle. The Tutte–Berge formula says

    n−2μ(Y)=max_{S⊆V(Y)} (o(Y−S)−|S|),

where o counts odd components. Fix S, write s=|S|, and let q1,q3,q5 count odd components of orders one, three, and at least five, respectively. A singleton component has at least two edges to S. A connected three-vertex triangle-free component is a path, whose two endpoints each need an edge to S. Thus

    2q1+2q3≤3s.

Counting vertices and ignoring even components gives

    n≥s+q1+3q3+5q5.

Since 4q1+2q3≤6s, these inequalities imply

    5(q1+q3+q5−s)≤n.

The formula therefore yields n−2μ(Y)≤n/5, or μ(Y)≥2n/5. This argument allows arbitrary cut vertices, bridges, and disconnected components; it does not assume a perfect matching or cubic regularity.

The other declared theorem, Staton's bound, gives α(Y)≥5n/14. Combining the two,

    d(Y) = 2α(Y)+μ(Y)−n ≥ 4n/35 > 0                 (n>0).       (1)

## 3. Removing leaves and the exact defect-one classification of X

For an isolated vertex z, deletion decreases α by one and leaves μ unchanged, so d(Y)=d(Y−z)+1. If z is a leaf with neighbor w, some maximum independent set contains z, and some maximum matching contains zw. Hence

    α(Y)=1+α(Y−{z,w}),  μ(Y)=1+μ(Y−{z,w}),
    d(Y)=d(Y−{z,w})+1.                                      (2)

Repeatedly applying these equalities, with additivity across the induced remaining components, reduces any triangle-free subcubic graph to graphs of minimum degree at least two. Equation (1) proves that every nonempty triangle-free subcubic component has strictly positive integer defect.

If a connected such X has d=1 and contains a leaf, (2) forces the remaining graph to be empty, since each nonempty remaining component has positive defect. Thus X=K2. An isolated connected X is K1.

Otherwise δ(X)≥2. Equation (1) gives n≤8. From μ(X)≥ceil(2n/5) and d=1,

    2α(X)−1=n−μ(X)≤n−ceil(2n/5)≤4.

Thus α(X)≤2. An elementary six-vertex Ramsey argument now gives n≤5: if a triangle-free graph on six vertices has a vertex with three neighbors, they are an independent triple; otherwise a vertex has at least three nonneighbors, two of which are nonadjacent, and these two with the vertex are independent. Since every vertex of X has degree at least two, it has at least four vertices. A triangle-free four-vertex graph of minimum degree two is C4, whose defect is two. With five vertices and α≤2, no vertex can have degree three, since its neighbors would be independent. Hence every vertex has degree two and connectedness gives X=C5. Its defect is one.

Therefore the only positive-defect connected types with defect exactly one are K1,K2,C5. Additivity and the isolated K4 components establish the intersection-graph part of the theorem.

## 4. Actual graph realization of C5

K1 is a single triangle, and K2 is two triangles sharing an edge, with literal diamond support. For C5, order the triangles cyclically T0,...,T4. Write T0=abc, T1=abx and T4=acy after relabeling. The vertices x,y are distinct and outside {a,b,c}; if x=y, T1 and T4 would share ax, an extra intersection.

T2 shares ax or bx with T1, and T3 shares ay or cy with T4. It must also share an edge with T2, with no other intersections.

If T2=axz and T3=ayw, the requirements forbid z∈{b,c,y} and w∈{b,c,x}. Their shared edge therefore forces z=w, a new vertex. The five triangles are exactly the hub-a triangles on the rim cycle b,x,z,y,c,b. Their support is the 5-wheel. Extra rim chords would create extra actual triangles with a, so none lies in the support or in G on these six vertices.

In either mixed choice, one of T2,T3 uses ax or ay and the other uses the disjoint opposite spoke cy or bx. To share an edge, an apex would have to be a forbidden earlier vertex or the triangles would repeat an earlier triangle. Thus mixed choices are impossible.

Finally suppose T2=bxz and T3=cyw. Their bases bx,cy are disjoint, so edge intersection requires z∈{c,y} and w∈{b,x}. Any choice with z=c or w=b produces the edge bc and an extra intersection with T0. The only remaining choice is z=y,w=x, giving T2=bxy,T3=cxy. The union of the five triangles is then all ten edges of K5, which has additional actual triangles, a contradiction. This exhausts the choices.

The 5-wheel has five triangles with intersection graph C5, so it has ν=2,τ=3. Deleting a rim edge removes one intersection vertex and leaves a four-vertex path, of independence number two. Deleting a spoke removes two adjacent intersection vertices and leaves a three-vertex path, also of independence number two. Thus it is edge packing resilient. Literal K4 components are also edge packing resilient; K3 and diamond components have the critical edges stated above.

## Source authentication and proof boundary

Staton's bound is authenticated in the first-page Corollary of the author-hosted primary paper Christopher Carl Heckman and Robin Thomas, *A New Proof Of The Independence Ratio Of Triangle-Free Cubic Graphs*, Discrete Mathematics 233 (2001), 233–237, DOI 10.1016/S0012-365X(00)00242-9, https://thomas.math.gatech.edu/PAP/514.pdf . The four-page author version explicitly covers finite simple triangle-free graphs of maximum degree at most three. It credits W. Staton, *Some Ramsey-type numbers and the independence ratio*, Transactions AMS 256 (1979), 353–370. The theorem statement and proof text were inspected; the full case analysis in that proof is not independently certified here. Local PDF SHA256 3bc31df70ee7175e3c23fc0da9c10c95b303280d54c82609b183c9d97e115a07.

The exact Tutte–Berge formula and a one-page proof were inspected at Alexander Schrijver's author-hosted source https://homepages.cwi.nl/~lex/files/tutteb.pdf . Its attribution is Tutte 1947 and Berge 1958. Local PDF SHA256 9e5fa747fdc37b0687b7c6ba69128478b04f73cfd2fd7f0062b4f68dc70faaab. This note treats the formula as a declared standard theorem; the new odd-component estimate is fully proved above. Both PDFs and retrieval receipts are in `literature/subcubic_defect/`.

No claim is made that a minimum CS failure, or all its residuals, satisfy the codegree-two restriction. Applying this classification to a residual requires that actual hypothesis and the accepted active-kernel/minimality interfaces. It is a scoped near-tight decomposition, not a proof of the unrestricted obligation. No numerical search or historical census is a premise.
