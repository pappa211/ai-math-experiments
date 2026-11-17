> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# All minimum covers exact-one: a triangle-free cone has a one-edge blocker

Frozen ordinary observation,2026-11-16. Source_audit. This uses the ALL-minimum-cover quantifier directly; it does not establish the proposed global survivor lower bridge.

Let J=h+A be a cone over a triangle-free graph A with at least one edge. Its actual triangles are exactly the hub pages huv for uv in E(A). Therefore

    nu(J)=mu(A), tau(J)=vc(A).

The packing identity is literal: disjoint hub pages correspond to a matching of A. For the cover identity, a vertex cover of A gives a triangle cover of its hub spokes. Conversely, from any J triangle cover replace each selected rim edge uv by either endpoint u or v, and each selected hub spoke hx by x. The resulting vertex set covers A and has size no larger than the original cover.

Assume EVERY minimum ordinary triangle cover of J meets EVERY actual triangle exactly once. Choose any minimum vertex cover Q of A. Its hub spokes form a minimum triangle cover of J, so each A edge has exactly one endpoint in Q. Since V(A) minus Q is independent by the cover property, Q is independent as well, and A is bipartite.

Finite bipartite matching-cover equality gives |Q|=mu(A)=r. Every maximum matching of A saturates every Q vertex: its r edges require r distinct endpoints in the r-vertex cover Q. Hence for any q in Q,

    mu(A-q)=r-1,
    nu(J-hq)=r-1.

The lower bound follows by deleting the unique q-edge from a maximum matching; the upper bound follows from Q minus {q} covering A-q. Thus hq is an actual ONE-edge packing blocker.

If J is one actual triangle component of a larger graph G, global minimum covers restrict to minimum covers of that component and any component minimum cover extends with arbitrary minima on the other components. Consequently global ALL-minimum-cover exactness implies the local hypothesis above. The one-edge blocker then lowers the total packing number by component additivity, even when triangle components share vertices or have triangle-free background between them.

This applies in particular to the strict original H-D branch, whose universal residual-cover equality implies every minimum cover is exact-one. It excludes a triangle-free-cone component from a blocker-free candidate. It does not assume or prove that any such component is available. A cone with actual rim triangles is outside the argument.

No asymptotic construction or literature attribution is needed for this elementary observation. It uses only the displayed actual identities and ordinary bipartite matching-cover equality. Near-factor-two examples obtained from cones over triangle-free graphs with small independence ratio necessarily fail the ALL-minimum-cover exactness hypothesis: an optimum spoke cover then double-hits some hub triangle. No general 3/2 bound for K4-free graphs is asserted.
