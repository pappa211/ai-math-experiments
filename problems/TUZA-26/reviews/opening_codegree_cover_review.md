> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: codegree-two cover repair

Verdict: PASS, PROVED_ORDINARY at the stated conditional-operation scope. Reviewed notes/apex_codegree_two_cover_exchange_v1.md, SHA-256 2784d72dbb82ac389d70af37fc7a7b7dad963aac75c0c5031468d42223573922. No finite check or Lean verification is required for this proof.

Let uv have exactly two common neighbors x,y, K=Q-uv, tau(K)=t and tau(Q)=t+1. For minimum K covers F_x containing both x spokes and F_y containing both y spokes, F_x misses both y spokes and F_y misses both x spokes; otherwise it would already cover all Q triangles. Their outside parts therefore both have size t-2 and avoid all four spokes.

If the outside parts coincide, every triangle missed by their common part meets both spoke pairs. Two disjoint spokes cannot lie in one triangle, so the only possibilities are uxy,vxy. Either opposite-spoke pair covers both side triangles and both uv pages. Replacing the original pair by that opposite pair gives a Q cover with t edges, a genuine one-edge saving.

For one outside exchange, write the two covers as A union P_x union{p} and A union P_y union{q}, with |A|=t-3. The marked sets are disjoint. Every K triangle missed by A contains a pair of edges, one from each marked set, so the four listed classes (two spokes, p with a y spoke, q with an x spoke, or p and q) are exhaustive. All outside triangles not in this exact family are already hit by A.

Unless q=xy, at most one actual triangle contains q and an x spoke. Two distinct such triangles require q to meet both ux and vx. Their only possible edge configurations are q=uv, forbidden, or q=xz. The latter requires both uz and vz; exact codegree two then forces z=y. This justifies the collapse using actual graph incidence, including fresh endpoints, rather than an arbitrary triangle set system.

Choose the opposite-spoke pair containing the x spoke of that sole triangle, if present, and add p. The resulting A union M union{p} covers both uv pages, both possible side triangles, all q-plus-x-spoke triangles, and every remaining missed triangle through p. It has exactly t edges. If q=xy, p differs from xy, so interchange the two marked families, select the appropriate opposite pair and add q. Thus neither a zero-exchange nor a one-exchange pair of outside covers can occur under the positive cover-gap hypothesis. No edge absent from Q is put into a cover.

The finite missed-region observation (at most eight endpoints) is also sound, but no enumeration is used: every missed triangle contains two specified incident edges, whose endpoints are all its vertices.

## Packing-context checks

At the accepted minimum Q, each minimum Q cover containing uvx yields a minimum K cover containing P_x after removing uv. The original core's two-edge resilience makes every cross pair, one spoke from each page, a nonblocker in K, since deleting that pair kills all uv pages. A maximum K packing avoiding such a pair must use each of the two remaining spokes, or it would avoid a whole blocking page pair. Opposite remaining spokes belong to different triangles. This is an exact packing profile, not a proved packing exchange.

For L=K-(P_x union P_y), a maximum Q-P_x packing must use the sole surviving uv page uvy. Removing that page leaves k-1 triangles in L. The reverse bound follows from L subset K-P_x, giving nu(L)=k-1. Outside cover parts give tau(L)<=2k-4. A minimum L cover plus all four spokes covers Q, including every uv page, giving tau(L)>=2k-5. Hence L has defect two or three; deleting the four spokes is not by itself a paid reduction.

The accepted new operation is conditional: if a close pair exists, the explicit repair contradicts tau(Q)=2k-1. No availability of such a pair, matroid exchange property, classification of L, or contraction response has been proved. In a surviving interface, all admissible outside-cover pairs must have exchange distance at least two, equivalently the full covers have symmetric difference at least eight. The independently checked double-cone control demonstrates that cover-only assumptions can leave distance three, but its predecessor is fragile defect three and is not a counterexample to the required minimum-Q scope.

Frozen UTC: 2026-11-16T22:59:46.470482+00:00
