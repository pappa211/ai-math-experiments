> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: opposite-pair resilience without K4 completion

Verdict: PASS, PROVED_ORDINARY for notes/apex_simplicial_four_opposite_resilience_v1.md, SHA-256 677563a9299442b16f4dd53b61df8a51eab6177b39b3f377b6b0fec9c47144f0. Every opposite-pair residual in the stated neutral simplicial degree-four setting is resilient. Subsequent named-component reconstruction remains separate and OPEN. No computation or Lean verification was needed.

## Accepted setup and cover restriction

The previously reviewed exact leaf response supplies nu(Q)=nu(J)=k, tau(J)=2k-3, all six K4-neighborhood edges critical in J, and opposite-pair residuals of packing k-2 and cover2k-5. The hypothesis that every actual Q triangle lies in a minimum Q cover is used to obtain the joint opposite-pair cover response; it is not an inherited property of arbitrary predecessors.

A minimum J cover containing an entire A triangle would extend by the c-spoke to its fourth vertex, covering Q with2k-2 edges. Thus no such minimum cover exists. This is a literal cover saving and needs no exchange axiom.

If R=J-{ab,de} has a critical edge f, proper CS gives S=J-{ab,de,f} in B with packing m=k-3 and cover2m. Every maximum J packing then consists of exactly m old S triangles and three new triangles. Each new triangle uses exactly one restored edge: three edge-disjoint new triangles exhaust the three available new edges. They are therefore ordinary pages, and the old packing is maximum in each literal S component.

Each S clique contains at most one old A-cycle edge ad,ae,bd,be: adjacent ones force an absent opposite edge, and opposite ones put all four A vertices in the clique and again force absent pairs. Thus supported cycle edges lie in distinct S components and can be chosen simultaneously in minimum S covers. Every such cover plus{ab,de,f} is a minimum J cover.

For f outside A this forces the supported cycle edges to form a matching. For f=ad, supported bd or ae would complete an A triangle with the restored edges, so both are background. These restrictions are complete actual-edge statements, not an assumption that all A-cycle edges are bare.

## Disjoint and internal placements of f

If f has no A endpoint, its ordinary page uses no A-cycle edge. At most one of the ab/de pages has an internal A apex, since two such pages share their reciprocal cross edge. Thus the three new pages use at most two cycle edges, and a two-edge footprint is adjacent. There are at least two background cycle edges, and when exactly two they are opposite. At least one background edge is therefore absent from every old and new packed triangle. Appending its c-page gives k+1 triangles.

If f=ad, the only possible internal ab-page is abe, and the only possible internal de-page is deb. They share be and cannot both be selected. The ordinary ad-page has no internal apex, because either candidate requires another restored edge. Thus at least one of the forced-background edges ae,bd is unused and again accepts a c-page. This is a direct proof for the gainnu3/cover3 restoration, with no appeal to the earlier gainnu2 theorem.

## One-endpoint placement and supported-edge repairs

Normalize f=at with t outside A, preserving the opposite matching by relabeling. Its ordinary page uses at most one cycle edge, only at apex d or e. If neither ab nor de has an internal page, at most one cycle edge is used and a background edge is free.

If the ab-page is abd, the de-page must be deq with q outside A. Without an A-cycle edge on the f-page, the adjacent unused pair ae,be contains a background edge. Otherwise the f-page must be ate, since ad is already occupied. The only unused cycle edge is g=be. If it is background, augment directly. If supported, its clique D_g contains b,e and excludes a,d. Matching of supported cycle edges makes bd,ae background. Page abd has no D_g spoke. Page deq cannot have dq in D_g; if eq were in D_g, then bq is an old clique edge and bdq is an old S triangle containing background bd, contradiction. Page ate has only possible D_g footprint te, incident to g. Replacing the old D_g maximum by one avoiding g and te is possible in both K4 and K5. It preserves every new page and every other old triangle, keeps the J packing maximum, and frees g for its c-page.

If the de-page is dea, it uses ad,ae, so the f-page cannot use either and the ab-page has no internal apex. The adjacent unused edges bd,be include a background edge.

If the de-page is deb, write the ab-page abq with q outside A. Without an f-page cycle edge, one of ad,ae is free background. Otherwise exchange d,e if needed to make the f-page atd. The only unused edge is g=ae. If supported, its clique contains a,e and excludes b,d; ad,be are background. Page deb has no D_g spoke, and atd has none because td has excluded endpoint d. For abq, bq cannot belong to D_g; if aq did, old eq together with bq would make beq an old triangle containing background be. Thus every new page avoids D_g entirely. Rotate its old maximum to avoid g and append the corresponding c-page.

The forbidden old triangles in these two hard cases are actual: their required page spokes lie in S by ordinariness, their other edges are forced by the literal clique, and their background edge is an actual S edge. This justifies the footprint exclusions even with arbitrary shared vertices and outside apices. The old packing is maximum inside D_g, so the local replacement preserves its size. No opposite-edge avoidance in K4 is assumed; the only two-edge avoidance used is the valid incident pair g,te.

## Exhaustiveness and final scope

A critical f of R cannot be either deleted opposite edge. It consequently has zero A endpoints, one A endpoint, or is one of the four cycle edges. The preceding cases exhaust these placements. Within the one-endpoint case, the internal ab-page and the two possible internal de-pages exhaust the page choices up to relabeling. All cases yield a maximum J packing avoiding a declared critical A edge, equivalently a direct k+1 packing of Q. Therefore R is resilient for EVERY opposite matching.

The proof keeps all actual pages, old vertices and background. It uses no outside-triangle K4-completion, no graph-order bound, no unproved fresh attachment, and no defect-two naming. Proper CS and explicit Q minimality now legitimately name the smaller active defect-one component of each residual, with possible tight pieces and background still present.

That enabled descent is the accepted conclusion. The archived next boundary/confinement step used stronger completion hypotheses and is not imported here. Complete restoration from the named active residual remains OPEN. Together with the separately accepted positive-gain deletion, this is substantial progress on the simplicial degree-four interface, not yet a universal exclusion of such vertices or a proof of unrestricted Tuza.

Frozen UTC: 2026-11-17T00:05:23.511130+00:00
