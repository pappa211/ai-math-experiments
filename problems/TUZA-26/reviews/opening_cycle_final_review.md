> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: complete induced-C4 degree-four reconstruction

Verdict: PASS, PROVED_ORDINARY for notes/degree_four_cycle_named_reconstruction_v1.md, SHA-256 4612022b3f03b0200fbce63f1085b59e2789a5ec135e11567513fa18b693ee61, with its new boundary dependencies now independently accepted. This completes the exclusion of degree-four C4-link vertices in the conditional minimum unknown Q. It is independent of the separate new full simplicial-degree-four exclusion. No new numerical replay or Lean verification was needed.

## The exact active footprint

The prior cycle-link review supplies resilient defect-one R=J-{ab,de}, its named active C, and a maximum R packing avoiding BOTH retained opposite edges N={bd,ea}. For an ordinary restored page, N together with its old spokes blocks every maximum R packing, since that page and both c-pages on N would append three triangles.

If such a page had no C spoke, choose a maximum C packing avoiding its portion of N, which exists by the supplied joint N-avoidance witness. All tight components can avoid their portions of N plus the page footprint: at most one N edge and one incident page spoke, or just one page spoke. Combining these maxima contradicts the combined obstruction. Thus each page has at least one C spoke. The proof needs that joint avoidance; it does not infer the conclusion from C single-edge resilience alone, and it does not assert that both spokes lie in C.

## Complete tight-piece boundaries

For each tight R component, each whole restored-base family contributes at most one edge, and at most one N edge can be inside the clique. These are all possible complete Q boundary edges: old R triangles outside the component share no edge with it; J adds only ordinary pages on the disjoint bases; c adds only its four rim pages. Hence the boundary has at most three edges, and without N at most two.

All boundaries at most two are already paid. K4 boundaries at most three are excluded by the newly reviewed full-triangle-cover replacement lemma. For a remaining K5 with N edge ea and three distinct boundary edges, it excludes b,d and its other footprints have the forms ap,eq. Distinctness from ea makes p,q different from a,e. If p differs from q, the complete boundary is a P4 and the independently reviewed K5 path payment applies.

If p=q, the boundary is triangle eap. Actual pages abp and dep supply the two footprints. Since their D spokes ap,ep are not in C and every page has a C spoke, bp and dp belong to C. Thus b,d,p lie in C, and inducedness through the universal vertex puts bd in C. D and C share exactly p: a second shared vertex would force a supported edge in both old triangle components.

There is then no other tight component. Any component without N is already paid; a component with N would need ea, already in D, or bd, already in C. The two D vertices outside eap are neither A vertices nor vertices of C or another old component. An outside Q triangle through either cannot be old. An ordinary ab/de page with that vertex as apex would use a private D edge from a or e and enlarge the COMPLETE boundary beyond eap; a c-page cannot use it because it is outside A. Therefore every incident Q edge stays inside D by triangle-supportedness. Both vertices have precisely their four D neighbors, giving the genuine K5 triangle leaf already excluded by the earlier independent leaf theorem. This establishes freshness from actual triangle bookkeeping rather than assuming it.

All old tight pieces are consequently absent.

## Exact remaining graph and cover payment

Every maximum J packing has k-2 old C triangles and two ordinary restored-base pages. Neither page can have an A apex, because an absent diagonal would be needed, so neither uses an N edge. Both N edges are critical in J and must occur in the packing; therefore both lie in old C support. All four A vertices belong to C and induce exactly2K2, since the restored matching and both diagonals are absent in R.

Any support vertex outside C,A,c could only be an ordinary page apex. Its neighbors lie in A and are independent in N; otherwise an old R triangle would put it in C. Thus it has at most two neighbors, and no c edge because c's exact neighborhood is A. Minimum degree four excludes it. Universal-vertex inducedness excludes every internal background edge on C. Hence the full support is exactly J=C+{ab,de}, then Q adds the fresh degree-four vertex c on A.

The already accepted C12 ineligibility fact gives a literal final cover. An ineligible edge has a universal endpoint, impossible for either edge of an induced2K2. Choose a minimum C cover containing bd, add ab,de, and add one c-spoke meeting the remaining page cea. This covers all old triangles, every restored-base page, and all four c-pages. Its size is tau(C)+3=2(k-2)-1+3=2k-2, contradicting tau(Q)=2k-1.

## Dependency order and conclusion

This proof uses the previously accepted cycle-link positive/neutral reductions, the early at-most-two tight-boundary and genuine K5-leaf theorems, the later K4 private-edge matching lemma and K5 P4-boundary payment, and the already independently checked named eligibility property. The latter two boundary reviews are opening_k4_private_matching_review.md and opening_k5_path_boundary_review.md. It does not use the new complete simplicial K4-neighborhood exclusion, so those two degree-four branches are independent after their common core prerequisites.

The completed conclusion excludes EVERY supplied degree-four vertex whose neighborhood induces C4. Combined with the separate simplicial closure, a degree-four vertex in the current minimum-Q universe, if one exists, can only have a diamond neighborhood. Existence of a degree-four vertex, the remaining diamond case and higher-degree availability are not established here. No unrestricted Tuza conclusion or new C12 member is asserted.

Frozen UTC: 2026-11-17T00:22:09.428490+00:00
