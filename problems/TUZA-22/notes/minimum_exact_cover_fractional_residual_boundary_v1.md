> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Petersen double cone: the cover endpoint-deletion condition also survives

Status: ORDINARY_PROOF_CANDIDATE, frozen separately for fresh review. Source_audit, 2026-11-16 UTC. This strengthens the boundary in `minimum_exact_cover_fractional_boundary_v1.md` without claiming original H-D.

Let G be the Petersen graph P joined to two independent apices a,b. The preceding frozen proof establishes tau(G)=11, fractional tau(G)=10, and exact-one incidence of every minimum cover with every actual triangle. I now prove

    tau(G-E(T))=10 for EVERY actual triangle T.             (1)

Thus the cover endpoint-deletion inequalities (R) from `hd_minimum_cover_colored_interface_v1.md` also hold for every choice of minimum C. The missing original-H-D near-tight relation tau(G)=2nu(G)-1 is essential to any proposed fractional consequence: it does not follow from the exact-one and cover-residual facts alone.

## Proof of the residual optimum

Fix T=a uv, where uv is any Petersen edge. Set L=P-{u,v}. The residual triangles at a correspond exactly to the edges of L; those at b correspond exactly to the edges of P-uv. No other actual triangles exist. L has eight vertices and ten edges, and maximum degree at most three.

A residual cover consists of d selected surviving Petersen edges D, s spokes aQ_a, and t spokes bQ_b. We may discard irrelevant spokes, so Q_a is a subset of V(L), while Q_b is a subset of V(P). The set D must contain every edge of P-uv not covered by Q_b. Cubic regularity gives

    d >= 14-3t+e(P[Q_b]).                                  (2)

Covering L also requires

    10 <= d+3s.                                            (3)

Suppose d+s+t<=9.

If t<=3, (2) and (3) yield

    10 <= d+3s <= 27-3t-2d <= 3t-1 <= 8,

a contradiction.

If t=4, (2) gives d>=2. Since d+s<=5, (3) forces d=2 and s=3. Equality in (2) forces Q_b to be independent, hence it is a Kneser star I. It also forces uv to be an edge of P-I and D to consist exactly of the other two edges of the three-edge matching P-I.

Now L-D is bipartite between I and the other four remaining vertices. Every remaining vertex outside I has exactly two neighbors in I. Each vertex in I had three neighbors outside I, and exactly one of these is u or v: the disjoint pairs u,v partition the four symbols other than the center of I. Thus L-D is 2-regular, bipartite, and has four vertices on each side. Its even cycles have a perfect matching of four edges, so three spokes cannot cover it. Contradiction.

If t=5, every five-vertex subset of P induces at least two edges. This follows from the preceding proof: |Q|-e(Q)<=4, and equality can occur only for independent four-sets. Therefore (2) gives d>=1. Since d+s<=4, (3) forces d=1 and s=3. But a three-vertex cover of L-D would leave an independent five-set in L-D. Such a five-set induces at most the one edge D in P, contradicting the same two-edge fact.

If t>=6, then d+s<=3 and d+3s<=9, contradicting (3).

These cases exclude every cover of size at most nine. Conversely, any minimum cover C of G meets T exactly once, and C minus that one edge covers G-E(T) with size ten. This proves (1). The proof applies to every Petersen edge directly; no unproved automorphism or computational classification is required.

## Exact colored consequence and limit

For every minimum C of G and every actual T={c,p,q} with c in C, C-{c} is a minimum cover of G-E(T). The same exact colored cover identity as in the earlier H-D note therefore gives

    vc(J_S-{p,q}) >= |S|

for every color set S subset C-{c}. Thus this unit-cost actual graph satisfies all the cover-side residual inequalities (R), as well as the exact-one property for every minimum cover, while tau_fractional(G)<tau(G).

It still fails original H-D: the explicit nine-packing in the preceding note gives 2nu(G)-2>=16, whereas its residual cover value is ten. No assertion about the exact ordinary packing optimum or about all triangle-deletion packing equalities is needed. No census, solver, weighted model, or external theorem is a premise.
