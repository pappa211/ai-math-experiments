> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Empty-link defect-two descent: a resilient residual has only one extendable page

Frozen ordinary/verified-finite candidate v1, TUZA-26, 2026-11-17. Independent review required. This is a precise subcase reduction after the genuine defect-one descent. It does not close the unique-page case or the larger-defect outside graph.

## Exact hypotheses

Use the empty-endpoint-link interface: uv has exactly common neighbors x,y; Q has minimum degree at least four and every Q edge has triangle codegree at least two; W=Q-{u,v} has nu(W)=m and tau(W)=2m-2. Every u/v-link rim other than xy is critical in W. Let r be a critical edge. The preceding direct-B exclusion proves r eligible, so

    R=W-r has nu=m-1, tau=2m-3.

Assume R resilient. Its actual triangle support has one active C12 component C and otherwise old tight K4/K5 pieces, by proper CS and explicit minimum-Q naming. Background is retained. Call an r-page EXTENDABLE if its two old spokes can be avoided by a maximum R packing. Equivalently, it occurs in a maximum W packing. At least one exists, because W gains one packing unit over R.

We prove there cannot be TWO distinct extendable r-pages. No assertion is made about whether other, nonextendable actual pages exist.

## Two extendable pages make every nonactive old edge resilient

Fix an old tight piece D. The whole one-base footprint property says all r-pages use at most one D edge; that edge, together with r, determines a unique page. Thus at least one of the two extendable pages avoids D completely. Start with a maximum R packing avoiding that page and change only its D packing to avoid any prescribed old D edge g. Tight-clique one-edge resilience preserves its full local size, and the page still appends. Hence EVERY old B edge is resilient in W.

Likewise any old R-background edge belongs to at most one r-page and to no old packed triangle. Choose an extendable page avoiding it and append that page to a compatible old maximum packing. Hence EVERY old background edge is resilient in W. This argument uses extendability explicitly and does not assume an arbitrary r-page appends over C.

## Remove old tight pieces by their complete actual boundaries

Every actual Q triangle outside R is an r-page or contains u or v. A triangle containing exactly one endpoint uses one old W rim. If that rim is an old B edge, it would be critical in W unless it is xy. All old B edges were just proved resilient, so the ONLY possible u/v-page footprint in any old B clique is xy. A triangle containing both u,v has no old W edge and gives no clique footprint.

Thus each old B clique has COMPLETE outside-Q boundary of size at most two: its whole r-family footprint, and possibly xy. The accepted full at-most-two boundary exclusion removes every such clique, including the opposite-edge K4 case. No inducedness, fresh vertex assumption, or omission of an outside page is used here. Consequently R has only C triangle support plus background.

## Eliminate the old background using actual codegrees

Let g be an old R-background edge distinct from xy. It is resilient in W by the two-page argument. If g is in no r-page, it has no W triangle; Q support forces it into a u/v-page, making it a critical endpoint rim, contradiction. If g lies in an r-page, that is its UNIQUE W triangle. Q triangle codegree at least two again forces a u/v-page through g, with the same contradiction. Therefore the only possible old background edge in Q is xy.

At most one r-page can use xy, since r and a spoke determine a unique page. With two distinct extendable pages, at least one therefore has both old spokes in C, placing both r endpoints in C. Any r-page with an outside-C apex would then require TWO old background spokes, impossible when xy is the sole possible background edge. Thus every r-page lies entirely in C.

An endpoint of the remaining possible background edge xy outside C could have no W neighbor except the other endpoint: r and every supported W triangle are already inside C, and there is no other old background. Its only additional Q neighbors are u,v. It would have degree at most three, contradiction. If x,y both belong to C, universality of C forces their actual old edge xy into C rather than the background. Thus all background is absent and

    W=C+r

as an actual triangle-supported graph, with r an internal nonedge of frozen C12. No external vertex or crossing triangle remains hidden from this finite domain.

## Exact named insertion contradiction

The independently accepted complete210 internal-insertion table, evidence/opening_checks.json with reviews/opening_dependency_review.md and reviews/apex_disjoint_reconstruction_review.md, has exactly four defect-two presentations. They all start with the two-K4 model on0123 and0145 and add one of24,25,34,35. This table ranges over EVERY internal nonedge of EVERY frozen C12, without a K4-completion prefilter. Its current application is legitimate because the preceding ordinary proof has established W=C+r literally.

By symmetry take r=24. The only critical edge of W is24. Its deletion leaves C with packing2, while W has packing3. For completeness, all old edges are resilient by the following actual three-packings for representatives of their four symmetry orbits:

    avoid01: 024,123,145;
    avoid02: 124,013,045;
    avoid03: 024,123,145;
    avoid23: 024,013,145.

The automorphisms 0<->1 and simultaneously 2<->4,3<->5 cover all old edges. Every listed packing is directly edge-disjoint. No new solver or numerical run is needed for this old-edge assertion.

But minimum degree at least four gives a u-exclusive neighbor a. The edge ua belongs to at least two Q triangles; because a is not adjacent to v, these give two distinct u-link rims incident to a. Both are different from xy and hence critical in W. This contradicts Crit(W)={r}.

Therefore the resilient residual R can have ONLY ONE extendable r-page. Nonextendable actual pages and their boundaries remain part of the unique-page obligation; they have not been discarded.

## Scope and next branch

This excludes the multiple-extendable-page resilient branch using an actual paid boundary removal, literal confinement, and the previously verified exact insertion domain. Together with the direct-B exclusion, exact-defect-two W now has two remaining forms of descent: a fragile defect-one residual gives B+two edges with gains(2,2); a resilient residual has a unique extendable restored page. Neither is classified here. The broader empty-link case with tau(W)<2m-2 also remains OPEN.

Sources: notes/matching26_canonical_outside_packing_v1.md; notes/matching26_empty_link_defect_two_descent_v1.md; notes/two_edge_tight_boundary_v2.md; notes/matching26_opposite_boundary_closure_v1.md and its independent review; inputs/C12_frozen.json; evidence/opening_checks.json; reviews/opening_dependency_review.md; reviews/apex_disjoint_reconstruction_review.md. No new numerical computation or graph search was used.
