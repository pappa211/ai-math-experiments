> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# K5 on an old triangle: a paid one-vertex deletion without predecessor completion

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-16. Independent review required. This addresses the actual two-private-vertex K5 triangle leaf exposed by a possible three-edge tight-component boundary. It does not assume that such a leaf occurs everywhere.

## Conditional minimum-Q theorem

Let Q be the connected, triangle-supported, single-edge-resilient, defect-one minimum unknown support outside C12 inside fixed minimum-CS G. Suppose Q consists of a graph J containing triangle A={a,b,c}, together with two wholly fresh vertices x,y, each adjacent precisely to A and to the other. Thus D=Q[A union{x,y}] is K5, and x,y have no other neighbors. Every proper edge-subgraph used below satisfies CS. No triangle-completion property of J is assumed.

Then this configuration is impossible in Q. More precisely, deleting ONE private vertex y produces a connected, triangle-supported, single-edge-resilient defect-one graph P with

    nu(Q)=nu(P)+1,    tau(Q)=tau(P)+2.

Its strictly smaller support is named by the minimum-Q choice, and explicit named reconstruction then makes Q named as well, contradiction. This is an actual paid region with boundary A union{x}, not an unbounded response table.

## 1. Exact leaf formulas force packing gain one

Put p=nu(J), K=J−E(A), and b=max_{e in E(A)}nu(J−e). Every A edge deletion loses at most one packing unit, so b is p or p−1. The exact triangle-leaf formulas are

    nu(Q)=max(p+1,2+b),
    tau(Q)=4+tau(K).

For the cover identity, every Q-cover uses at least four D edges, while its non-D part covers K, whose triangles contain no A edge. Conversely use the minimum D cover E(A) union{xy} and a minimum K cover. This covers every actual old and new triangle, including every J page on A edges.

For packing, Q contains at most two pairwise edge-disjoint triangles using x or y. Two such triangles use exactly one A edge in total, whereas one can be the triangle xya and use no old edge. Thus a packing with at most one new triangle has size at most p+1; with two new triangles it has size at most2+b. Both bounds are attained by the standard choices. All actual triangles using x/y lie in D because their neighbor sets are specified exactly.

Also nu(K)<=p−1, since any K packing can be augmented by the old triangle A. If Q gained two packing units over J, defect one would give tau(K)=2p−1, contradicting proper CS and nu(K)<=p−1. Hence

    nu(Q)=p+1, tau(Q)=2p+1,
    b=p−1: EVERY A edge is critical in J,
    nu(K)=p−1, tau(K)=2p−3.

The last packing equality follows from proper CS and the displayed cover value. K may be fragile; the proof below does not need to decide.

## 2. J has defect two, and deleting y leaves exact defect one

Every J-cover uses at least one A edge to cover A, and its non-A edges cover K. Thus tau(J)>=tau(K)+1=2p−2. Criticality of any A edge and proper CS give tau(J)<=2p−1.

If tau(J)=2p−1, the accepted adjacent-critical-edge lemma forces A to be a whole isolated K3 triangle component of J, with all other triangle components literal K4/K5. Adding x,y turns exactly A into K5; the other triangle families are unchanged and edge-disjoint. Thus B(Q), contrary to Q's defect one. Therefore tau(J)=2p−2.

Let P=Q−y. It is J plus the fresh degree-three simplicial vertex x on A. Since all A edges are critical,

    nu(P)=max(p,1+b)=p.

A J-cover hits an A edge, and adding one suitable x-spoke covers the remaining x-pages, so tau(P)<=tau(J)+1=2p−1.

Conversely adding y to P onto the literal K4 A union{x} costs at most two cover edges. Indeed a P-cover contains some edge uv of that K4. Add the y-spokes to the other two K4 vertices; the uv-page is already covered, and every other new y-page has one of those two spokes. Hence tau(Q)<=tau(P)+2, giving tau(P)>=2p−1. Consequently

    nu(P)=p, tau(P)=2p−1, delta(P)=1,
    nu(Q)=nu(P)+1, tau(Q)=tau(P)+2.

This is exact payment, not merely the generic four-spoke bound.

## 3. Resilience descends through this specific paid deletion

Suppose an actual P edge g is packing-critical. Then nu(P−g)=p−1. Cover extension and proper CS force tau(P−g)=2p−2 and B(P−g).

Let D0 be the literal K4 on A union{x}. If g belongs to E(D0), the surviving K4−g diamond has two actual triangles sharing an edge and supporting all four vertices. They must lie in one old literal B clique, which then contains both endpoints of the missing g and forces g present. Contradiction.

Thus g is outside E(D0), and the intact D0 lies in one literal old component Z of P−g, where Z is K4 or K5. All new y-triangles lie inside Z union{y}; no other old triangle component changes.

- If Z=K4, adjoining y turns exactly Z into K5. Packing increases by exactly one over nu(P−g)=p−1, so nu(Q−g)=p. This contradicts Q's single-edge resilience, since nu(Q)=p+1.
- If Z=K5, adjoining y adjacent to the four D0 vertices gives K6 minus one edge (y to Z's fifth vertex). This graph has a five-edge triangle cover, only one more than the old K5's four. Explicitly put y, the fifth old vertex, and one D0 vertex on one side of a 3+3 cut; the missing edge lies inside that side, leaving five actual within-side edges. Every triangle meets those edges. Hence tau(Q−g)<=tau(P−g)+1=2p−1; restoring g costs at most one, giving tau(Q)<=2p, contrary to tau(Q)=2p+1.

Both possibilities fail. Therefore P is single-edge packing-resilient. This argument controls arbitrary old background and shared vertices through the literal B triangle components and the actual prescribed y-neighborhood. It does not assert unconditional resilience descent for arbitrary clique additions.

## 4. Support connectivity, strict measure and named reconstruction

Every old J edge outside A was triangular already in J: x/y can only occur in triangles whose old edges lie in A. Every A edge remains triangular in the K4 A union{x}; every x-spoke is triangular there. Thus P remains triangle-supported.

Any old J triangle component joined to the K5 leaf in Q meets it through an A edge. The surviving K4 contains all A edges and has connected triangle family, so these connections all remain. Consequently P has connected nonempty triangle support. Its supported-edge count strictly decreases, by the four removed y-edges, and it remains an actual proper edge-subgraph inside fixed G.

P therefore qualifies for Q's wider minimum class and must belong to C12. It has a degree-three simplicial vertex x and nu(P−x)=nu(P).

The exact twelve-model descriptions now suffice:

- W5 has no degree-three simplicial vertex.
- Two K5s sharing an edge have minimum degree at least four.
- A degree-three vertex in K5-e is a missing-edge endpoint; deleting it leaves K4 and lowers packing from two to one. This contradicts nu(P−x)=nu(P).
- In each of the nine central-K4 star models, every degree-three simplicial vertex lies either in a private K4 leaf or in the central K4 at a vertex untouched by all attachments. Its closed neighborhood is exactly that literal K4 construction piece.

Adding y to this closed K4 neighborhood simply replaces that K4 piece by K5. The remaining pieces and their attachment edges stay unchanged, and y is fresh with no outside edges. Thus Q is still literally in the fresh K4/K5 edge-gluing construction class. Its given defect one invokes the archived all-size classification and makes Q one of the ten fresh C12 models, contradiction.

This final step explicitly proves a valid fresh construction. It does not infer freshness solely from a triangle boundary or classify an arbitrary cone.

## General resilience lemma isolated by the proof

Section3 proves a reusable statement: if P contains a literal K4 D0, Q adds one fresh vertex adjacent precisely to D0, both P,Q have defect one, nu(Q)=nu(P)+1, Q is single-edge resilient, and every proper edge-subgraph P−g satisfies CS, then P is single-edge resilient. The proof uses only the diamond confinement and the exact K4/K5/K6-e responses above. No K4-completion of all P triangles is required.

For the present K5-on-triangle leaf, Sections1–2 establish this lemma's numeric premises rather than assuming them.

## Role in the all-size route and remaining availability

The local deletion is Q -> P=Q−y, with the complete boundary A union{x}, all other vertices/edges retained, exact cover cost2 and packing gain1, and a strictly decreasing supported-edge measure inside fixed G. It removes predecessor completion and handles a genuine minimum-degree-four leaf: both private vertices originally have degree four.

The root's boundary programme must still prove that a surviving adjacent-blocker tight component with three boundary edges actually has this triangle-leaf form. This theorem does not prove that geometry or guarantee any K5 leaf in an arbitrary higher-degree unknown core. The disjoint-blocker opposite-edge K4 boundary and the no-blocker branch also remain separate.

Implication chain: conditional minimum-CS framework -> Q is CONDITIONAL on archived profile/strict restoration; supplied literal K5-on-triangle leaf -> paid smaller resilient defect-one P is this ordinary candidate awaiting review; minQ -> P in C12 is PROVED by explicit fixed-G minimality; named degree-three structure -> Q in fresh class -> C12 is an ordinary reconstruction using the archived exact fresh-edge classification; availability of such a leaf or another paid region in EVERY remaining Q is OPEN; universal CS -> unrestricted Tuza is PROVED logically.

Controls: two K5s sharing an edge provide a sharp example of this local payment but are excluded from the unknown class. Generic TUZA25 resilience-descent failures have different defects/numeric shifts and remain valid counterexamples to unconditional descent. The W5 wedge has a different neighbor interface. No new census, model enlargement, external computation, or Lean verification is part of the theorem.
