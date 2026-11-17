> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent ordinary cover lower bound for the 2K2 cycle witness

TUZA-22 restoration role, 2026-11-15 UTC. This proof was reconstructed after inspecting the literal boundary edges; it does not use the 16-entry conditional optimization table as a proof input. It uses declared Clebsch facts already ordinarily proved in TUZA-21. This note establishes the cover lower bound only; private-packing optimality, full maximality, all actual triangles, and the D quantifiers require their separate checks.

## Declared input and notation

The Clebsch link L has16 vertices, alpha(L)=5, and every independent five-set is a neighborhood N(v). Every vertex outside N(v) has at least two neighbors in it. These facts have the ordinary bit-mask proof in copied `sources/tuza21/PROOFS_AND_OBSTRUCTIONS.md` §1.

For any W subset V(L), put

    s(W)=5-|W|+e(L[W]).

Then s(W)>=0: choosing one endpoint per induced edge leaves an independent set of size at least |W|-e(W).

Moreover, if e(W)>0, then s(W)>=1. Here is the archived equality argument explicitly. If s(W)=0 and L[W] has adjacent edges, a vertex cover of size at most e(W)-1 gives an independent set of at least6, impossible. Thus L[W] is a matching plus isolates. Choosing one endpoint per matching edge leaves an independent five-set I. Any omitted matching endpoint has only one neighbor in I, contradicting the declared outside-neighborhood property. Hence equality s(W)=0 requires W independent. Integrality proves the asserted strict bound for e(W)>0.

If L[W] contains a C4, then s(W)>=2. Cover the four cycle edges by two opposite vertices, and choose one endpoint of every other induced edge. This is a vertex cover of size at most e(W)-2. Its complement is independent, so |W|-e(W)+2<=5.

## The exact four-edge boundary

In local even-mask coordinates the incoming edges are

    i1=(5,27), i2=(9,23),

and outgoing edges

    o1=(10,20), o2=(12,18).

They form a matching of four edges. Every incoming/outgoing pair lies on a C4 made from those two edges and the following old cross edges:

| Pair | Two cross edges |
|---|---|
| i1,o1 | (5,10), (27,20) |
| i1,o2 | (5,18), (27,12) |
| i2,o1 | (9,20), (23,10) |
| i2,o2 | (9,18), (23,12) |

Each displayed cross pair has XOR respectively15,23,29,27, all of weight4, so these are literal Clebsch edges. Consequently the endpoints of **any three** boundary edges contain a C4: three edges among two incoming/two outgoing include an incoming/outgoing pair.

## Local half-penalty inequality

Let D be any triangle cover of one Clebsch cone. Let F be the selected subset of its four boundary rim edges, q=|F|. Let W be the link vertices whose apex spokes are absent from D, and let r be the number of F edges induced by W.

Every rim edge induced by W must be selected. The q-r selected boundary edges outside W are additional. Thus, without assuming D is normalized or minimum,

    |D| >= 16-|W|+e(W)+q-r
         = 11+s(W)+q-r.

We have s(W)>=r/2 for every r in {0,1,2,3,4}:

- r=0: s>=0;
- r=1 or2: W contains an edge, so s>=1;
- r=3 or4: the selected induced boundary edges force a C4 inside W, so s>=2.

Therefore

    |D| >= 11 + q - r/2 >= 11 + q/2.              (*)

This is the desired structural lower bound on the **total local cover size**, including the selected boundary edges. The JSON `conditional_cover_h` uses a different convention, excluding selected boundary-edge cost; for that h the corresponding inequality is h(F)>=11-|F|/2. Do not confuse these two conventions.

## Global summation for the four-cone graph

Use the separately verified literal gluing: each graph triangle lies in one cone, each nonshared edge belongs to one cone, each selected shared rim edge belongs to exactly two consecutive cones, and these are the only repeated edges. For any global cover D, let D_i be its restriction to cone i, let q_i count its selected local boundary edges, and let q_global be the number of selected shared edges.

Then

    sum_i |D_i| = |D| + q_global,
    sum_i q_i = 2 q_global.

Summing (*) for the four cones yields

    |D| + q_global >= 44 + (1/2)(2q_global),

hence |D|>=44. The literal union of the four eleven-spoke covers has44 distinct edges and covers every triangle, so tau(G)=44.

This argument generalizes to any validated cycle gluing of r cones with this exact local boundary geometry and no extra triangle/edge-overlap incidence: tau=11r follows from the same sum and a union of r eleven-spoke covers. It does not authorize those incidence assertions for a different gluing without verification.

## Evidence scope

This is an ordinary argument using explicitly declared, previously proved Clebsch facts, plus four displayed literal C4 checks. The finite conditional table can independently corroborate it, but is not necessary for its lower-bound logic. The graph is not a Tuza counterexample; this proof only certifies its ordinary cover optimum for the separately quantified C21-D witness.
