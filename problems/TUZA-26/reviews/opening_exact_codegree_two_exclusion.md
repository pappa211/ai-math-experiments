> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion of the exact-codegree-two defect-one branch

Status: PROVED ORDINARY with the explicitly named standard graph-theoretic dependencies below. This is a narrow branch exclusion requested by the coordinator. It uses no computation, no CS assumption, no C12 naming, and no claim that a codegree-two edge exists. It is not a formal Lean proof.

## Statement

Let H be a finite simple graph such that every triangle-supported edge belongs to exactly two actual triangles. Background edges, if any, are irrelevant. Then

    2 nu(H) - tau(H) is either zero or at least two.

Moreover equality zero occurs exactly when every nonempty actual triangle component is a literal K4. In particular the conditional minimum-Q defect-one core, whose supported edges already have codegree at least two, has at least one edge of codegree at least three.

The statement does not supply a codegree-two edge and does not assert that all edges have codegree at least three.

## Standard dependencies used

1. Brooks's vertex-coloring theorem: a connected simple graph of maximum degree Delta is Delta-colorable unless it is a complete graph or an odd cycle. Applied only to connected cubic graphs other than K4, this yields alpha >= ceil(n/3).
2. Tutte-Berge formula: for a finite graph D, its maximum matching size mu satisfies

       n - 2 mu = max_{S subset V(D)} (o(D-S) - |S|),

   where o counts odd-order components.

These are stated ordinary mathematical dependencies, not newly replayed or formally verified library results. Everything specific to the present reduction, including the required matching bound, is proved below.

## Exact actual-triangle dual

Make a graph D whose vertices are the actual triangles of H. Each triangle-supported physical edge of H joins the two distinct actual triangles containing it. Distinct triangles of a simple graph cannot share two edges, so D has no parallel edges. At a triangle, its three physical edges give three distinct neighbors. Thus D is simple cubic.

An edge-disjoint triangle packing is exactly an independent vertex set of D, so nu(H)=alpha(D). A triangle edge cover is exactly an edge cover of the vertices of D, because every supported edge hits precisely its two incident triangles. Hence

    tau(H) = rho(D) = n - mu(D).

For completeness, the edge-cover identity needs no additional theorem here. A maximum matching plus one incident edge for each unmatched vertex gives an edge cover of size n-mu. Conversely an inclusion-minimal edge cover has only star components: a selected edge with both endpoints of selected degree at least two could be removed. Choosing one edge from each star gives a matching of size n-|F|, so every edge cover F has size at least n-mu. There are no isolated vertices in cubic D.

These parameters add over the components of D, so it suffices to analyze one connected component.

## A dual triangle forces an isolated tetrahedron

Suppose three D vertices form a triangle. Their three primal triangles cannot share one common physical edge, since that would have codegree at least three. Their pairwise shared edges are therefore distinct. Label two primal triangles abc and abd, sharing ab. A third triangle sharing a different edge with each must be acd or bcd: the two chosen edges must meet, and their union determines its three vertices. In either case all six edges of the primal K4 on a,b,c,d are present. The fourth K4 triangle is consequently an ACTUAL triangle too.

Each physical K4 edge is already in its two K4 triangles. Exact codegree two prevents any outside triangle using it. Thus these four triangles form a whole D component K4. The corresponding primal triangle component is exactly the literal K4, with nu=1,tau=2,defect zero.

Every other D component is triangle-free cubic. In particular it is not K4 and Brooks applies.

## Elementary cubic matching bound from Tutte-Berge

Let D be any simple cubic graph on n vertices. Fix S, write s=|S|, and let q be the number of odd components of D-S with one or three vertices; let r count all other odd components, each of order at least five.

An odd component has an odd number of edges into S, because its degree sum in D is three times an odd number. It therefore has at least one such edge. A one-vertex component has three; a three-vertex component has at most three internal edges and hence at least 9-2*3=3 edges into S. Consequently

    3q + r <= 3s,
    n >= s + q + 5r.

Set d_S=q+r-s. These inequalities give

    n - 8 d_S
      >= 9s - 7q - 3r
      >= 2q
      >= 0.

Thus d_S<=n/8 for EVERY S, including those where it is negative. Tutte-Berge implies n-2mu<=n/8, or

    mu(D) >= 7n/16.

No connectedness, bridge-free assumption, perfect-matching assertion, or external-boundary assumption was used in this bound.

## Defect bound and small orders

For a connected non-K4 dual component, Brooks and the matching bound give

    2 alpha(D) - [n-mu(D)]
      >= 2n/3 - n + 7n/16
      = 5n/48.

Cubic graphs have even order. For n>=10 the last quantity exceeds one, so the integer defect is at least two.

For n=8, alpha>=ceil(8/3)=3 and mu>=ceil(56/16)=4, giving defect at least 6-(8-4)=2.

A simple cubic graph has at least four vertices, and the only order-four graph is K4, already handled. At order six, a triangle-free cubic graph is K3,3: choose any vertex v; its three neighbors are independent, and each must join both of the two remaining vertices to reach degree three. Then alpha=3,mu=3, giving defect three.

This exhausts all orders. Each dual component contributes either zero (exactly K4) or at least two. Summation proves the statement and its equality characterization.

## Consequence and precise limit

The accepted minimum Q has defect one and every edge has triangle codegree at least two. If every edge had codegree exactly two, the theorem would contradict that defect. Therefore some actual edge has at least three page apices.

This makes an arbitrary-codegree operation directly relevant. It does not rule out the simultaneous presence of codegree-two edges, prove a supply of those edges, classify the larger book, or make any existing same-reserved-hub compression valid when further common apices create physical rim collisions. Those require separate paid operations.
