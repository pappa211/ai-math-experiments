> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Third-triangle failure: disjoint restoration with zero or one peripheral

Frozen ordinary lemma v1, TUZA-26, 2026-11-17. Independent review requested. No computation. This supports the exact failure interface in matching26_actual_parent_triple_extension_v1.md; it does not assert the unfinished two-peripheral case.

Let B satisfy the tight-component property, nu(B)=m, tau(B)=2m. Let V=abc and U be vertex-disjoint missing triangles. The complete new V-family is the bare K5-e support C on abcxy with missing xy: all six spokes from {a,b,c} to {x,y} are background in B. Put H=B+V+U. Assume nu(H)=m+3, tau(H)=2m+5 and that the complete individual U-family has packing number q_U=2. Arbitrary old background and shared old-clique vertices remain.

Every pair of edge-disjoint ordinary U-pages appends to a maximum B packing: its footprint in each old clique is a star of at most two edges, since an old clique contains at most one U terminal. Such a footprint can be avoided by a maximum packing of K4 or K5. The C edges are disjoint from all supported B edges. If the U pair's C footprint has size at most one, a maximum C packing avoids it by the explicit resilience of K5-e. We would obtain m+4 triangles, a contradiction.

## No peripheral in U

If U contains neither x nor y, all its vertices are outside C (it is disjoint from abc). Every U-page then has at most one C vertex, so its C footprint is empty. A two-page U packing therefore gives the preceding contradiction. This branch is impossible.

## Exactly one peripheral in U

Write U=xde with d,e outside C. The edge xy is absent from B. Thus a U-page has a C edge only if it is xdz or xez with z in {a,b,c}, and then its unique C edge is xz. Every two-page packing must therefore consist of xda and xeb for DISTINCT a,b in {a,b,c}, relabeling the three core vertices as needed. Fix such a pair.

No de-page dez exists: it pairs with xda if z!=a, and otherwise with xeb, making at most one C edge in the resulting pair. Every xd- or xe-page has apex in {a,b,c}: an apex outside this set pairs with the fixed page on the other base and again has at most one C edge.

Let A and D be the nonempty sets of core apices of the xd- and xe-books respectively. They are disjoint, since a common apex z would give the forbidden de-page dez. These are disjoint nonempty subsets of a three-element set, so one is a singleton. Suppose A={a}; the other case is symmetric. Choose a minimum three-edge C cover containing xa; for example {xa,ya,bc}. Add xe. This covers the complete U-family: xa hits its only xd-page, while xe hits the central U and every xe-page. It also covers C. There are no triangles mixing a V edge and a U edge, because the terminal triples are vertex-disjoint. All remaining triangles are old B triangles.

Together with a minimum B cover, these four edges give tau(H)<=2m+4, contradicting the supplied value 2m+5. Hence the exactly-one-peripheral case is impossible.

## Exact remaining scope

Any remaining vertex-disjoint restoration has U=xyd, containing BOTH peripherals. It completes C to a literal K5, and it can be admissible at the local H scope: K5 edge-glued with K4 is a named control. A separate complete-family classification and actual-parent strict restoration are required; this note does not replace them.

In the actual parent application, H=G-T and B=G-T-U-V arise from failure of V to extend in a defect-one double residual. The required q_U=2 follows from archived simultaneous extension of V,T. No minimum-Q premise or classification of a defect-two graph is used. The present payment needs no resilience of the double residual itself.
