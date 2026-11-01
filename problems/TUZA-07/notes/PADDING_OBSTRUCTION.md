> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# A/B bridge obstruction: connected diamond padding

Status: PROVED ordinary elementary gadget identity. No Lean check. Novelty unassessed.

## Exact gadget

Let X be any finite simple graph with an edge ad. Introduce two fresh vertices b,c and add exactly ac,bc,bd,cd. The old edge ad together with these four edges is the diamond on a,b,c,d with missing edge ab. Call the resulting graph X+.

The ONLY new triangles are acd and bcd. Fresh b has neighbors c,d, and fresh c has neighbors a,b,d; ab is absent. There are no triangles involving a fresh vertex and another old vertex.

Then:
nu(X+)=nu(X)+1;
tau(X+)=tau(X)+1;
sigma(X+)=sigma(X)+1.

Packing lower bound: append bcd to any X packing, since all three edges of bcd are new. Packing upper bound: the two new triangles share cd, so a packing contains at most one new triangle; the remaining triangles form an X packing.

Cover upper bound: add cd to a minimum X cover. Cover lower bound: every cover restricts on E(X) to an X cover, and the new triangle bcd has no old edge, so at least one additional edge is required.

Let F={ac,bc}. This is an induced two-edge star: the endpoints a,b are nonadjacent. Deleting F removes both new triangles and leaves exactly X's old triangle family, hence
nu(X+-F)=nu(X),
tau(X+-F)=tau(X).

If ad lies in an X triangle component, both new triangles lie in that same component: acd shares ad with it and bcd shares cd with acd. Thus if X has one nonempty triangle component, so does X+. Ordinary graph connectedness is also preserved whenever X is connected.

## Consequence for open-wedge candidates

Suppose a graph X violates Tuza, with d=tau(X)-2nu(X)>=1. Repeating the gadget d times along an old edge gives a graph H with sigma(H)=0 and an induced two-edge star F whose deletion lowers nu by one.

If X is an edge-minimal actual counterexample, it has one nonempty triangle component and every edge belongs to a triangle. The padded H retains one nonempty triangle component. Therefore the proposed universal statement

'Every tight graph with one nonempty triangle component has no induced two-edge star that blocks all maximum triangle packings'

would still exclude ALL Tuza counterexamples by padding. Restricting to ordinary connectedness or to a single triangle component does not remove this hidden generality.

Likewise the universal strict-slack statement
'If an induced two-edge star lowers nu in a one-triangle-component graph H, then tau(H)<=2nu(H)-1'
would imply Tuza for every one-triangle-component X directly after one gadget attachment.

These are hardness reductions, NOT counterexamples to the proposed statements: no actual Tuza counterexample X is known.

## What the actual-criticality setting adds

Every proper edge-subgraph of an actual edge-minimal counterexample G satisfies Tuza. In particular its tight residual H=G-e and every subgraph of H satisfy Tuza. A padded graph H built from a violating X fails this hereditary premise because it still contains X.

Thus a potentially meaningful inductive bridge must use hereditary Tuza, or a concrete stronger reservation/cover invariant, rather than merely equality or triangle-component connectedness. We have not proved the corresponding hereditary-tight induced-wedge lemma.
