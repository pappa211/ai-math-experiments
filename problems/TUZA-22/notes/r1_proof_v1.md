> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# R1: arbitrary triangle equality restoration — frozen proof v1

Author role: TUZA-22 restoration agent. Frozen 2026-11-15 UTC. Status: ORDINARY_PROOF_CANDIDATE pending fresh AI reconstruction. No Lean or historical-priority claim.

## Statement

Let B(H), and let a,b,c be distinct pairwise nonadjacent vertices of H. Set G=H+{ab,ac,bc}. If tau(G)=2nu(G), then B(G). More precisely, equality forces all new triangles to be exactly the four faces of a K4 on {a,b,c,x} for one outside vertex x; its three old spokes ax,bx,cx are triangle-free edges of H. Thus one new K4 triangle component is added, with disjoint edge support from all old triangle components.

## Inputs and proof

Use actual-triangle component additivity and elementary clique facts: K4 has (nu,tau)=(1,2), and a maximum packing avoids a star; K5 has (2,4), and a maximum packing avoids any two edges. Every edge of either clique occurs in some minimum triangle cover. These are the pinned public `papers/tuza-five-degenerate/main.md`, Lemmas2/2A.

Put m=nu(H), so tau(H)=2m. The newly inserted triangle T=abc has no old edge, so nu(G)>=m+1. A minimum H-cover plus all three new edges gives tau(G)<=2m+3. Tightness therefore forces

    nu(G)=m+1, tau(G)=2m+2.                         (1)

Every new triangle other than T has exactly one new edge: it is a **page** abx, acx or bcx for an apex x outside {a,b,c}. A triangle using exactly two new edges would have vertex set {a,b,c} and hence would use the third new edge too.

Any two edge-disjoint pages can be appended simultaneously to a maximum H-packing. Indeed, each old clique component contains at most one of the independent terminals a,b,c. Consequently the ENTIRE old footprint of the two selected pages within that component is a star with at most two edges, even if the pages have different outside apices or arbitrary outside incidence. K4 star avoidance and K5 two-edge avoidance give the required maximum block packing. Thus by (1), every pair of pages must intersect in an edge.

If there are no pages, any one edge of T covers all new triangles and gives tau(G)<=2m+1, contradiction. If all pages have the same base, that base again covers all new triangles, contradiction.

Therefore pages occur on at least two different bases. Relabel them abx and acy. They share an edge if and only if x=y: their bases differ, both apices are outside the terminal triple, and their only possible common old edge is the spoke from the common terminal a to their common apex. Thus x=y. Every page on ab must intersect the fixed page acx and therefore has apex x; every page on ac similarly has apex x. Any page on bc must intersect abx (or acx), so also has apex x. Actual edge closure supplies bcx, since bx,cx are old edges. Hence the ENTIRE new triangle family is precisely

    abc, abx, acx, bcx,

the four triangles of the literal K4 on {a,b,c,x}.

If any old spoke is supported by an H triangle, say ax, choose a minimum H-cover containing ax and add its opposite K4 edge bc. The pair {ax,bc} covers all new triangles, giving tau(G)<=2m+1, contradicting (1). Therefore ax,bx,cx are all background edges of H. The new K4 is edge-disjoint from old triangle support. Because there are no other new triangles, it forms one new triangle component and all old K4/K5 components remain unchanged. Thus B(G). QED.

## Consequence for the CS route, conditional on the existing M0 reduction

Let G be a minimum failure of unrestricted CS, with k=nu(G), as in M0. For every actual triangle T, standard deletion accounting gives nu(G-E(T))=k-1 and tau(G-E(T)) in {2k-2,2k-3}, discarding negative values. If the residual is tight (tau=2k-2), proper-subgraph CS yields B of that residual. R1 then yields B(G), contradiction. Hence every triangle residual must instead satisfy

    nu(G-E(T))=k-1, tau(G-E(T))=2k-3.

In particular k>=2. This removes the tight-triangle-residual branch; it does not classify the remaining defect-one residuals and does not prove the two-edge blocker. Original H-D has different hypotheses and is unchanged.

Equivalently, every actual triangle T of such a minimum CS failure is contained as a three-edge subset in some minimum G-cover: take a residual cover of size2k-3 and add all three edges of T. This is a necessary condition, not a contradiction (K5 also has it).
