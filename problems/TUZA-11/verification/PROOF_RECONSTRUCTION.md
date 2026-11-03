# Primary independent reconstruction

This is the primary analyst's reconstruction of the actual source proof, not adoption of its prior ACCEPT summaries. Source references below are line numbers in TUZA11 arguments/FLAT_GLUING_AND_KERNEL.md at commitfrozen-packet-11d. The original BLIND_B post-freeze argument and prior review were compared. FROZEN_STATEMENTS.md was committed before this audit. External statements were freshly inspected; complete HKT and Parker proofs are cited conventional mathematics, not independently formalized.

## Dependencies and elementary interfaces

**D1 (source7).** HKT Theorem2 applies to finite K4-free flat graphs with their full triangles, without a planarity premise. It gives τ≤3ν/2. Its equality proof in Section2 gives a disjoint union of C5 components in the triangle graph; Claim5 converts these to literal five-wheel supports. Isolated triangle-dual vertices have strict ratio1 and cannot occur in nonempty equality. Background edges lying in no triangle are explicitly allowed. Thus equality atν4 yields exactly two edge-disjoint five-wheel triangle components, not a guessed general equality classification.

**D2 (source8).** Parker Corollary1.3 applies to any graph with no four edge-disjoint triangles, exactlyν≤3. No degeneracy, flatness or vertex-count hypothesis is added. It cannot be applied toν4. The explicit arXiv v3 header is19March2025; retrieved PDF title date is21March2025, while generated HTML body says24August2026. These dates are recorded separately in PRIOR_ART.md.

**D3 (source9).** A pairwise edge-intersecting triangle family has a two-edge cover. Choose abc,abd. If all members contain ab, use ab. Otherwise a triangle meeting both and avoiding ab is acd or bcd. Once acd occurs, any further triangle must be among the K4 faces: an ab-page with another apex misses acd in edges. Opposite edges ab,cd cover all four possible faces. A FULL graph family with this nonbook pattern necessarily includes all four faces. A selected subfamily need not; the cover bound still holds for it.

**D4 (source24,84).** For any flat full triangle family, form dual D on triangles, with a dual edge for each original edge in exactly two triangles, and singleton options for degree-one edges. Distinct triangles share at most one edge, so D is simple. A maximum matching of size m covers2m triangles at cost m; each unmatched triangle can be covered at one more actual edge. Thus τ≤t−m, including isolated dual vertices. Conversely, normalize any inclusion-minimal chosen cover. Its selected dual edges form a star forest: cycles and a path of length3 have redundant edges, and singleton choices at already covered vertices are redundant. One dual matching edge from each nontrivial star shows m≥t−|C|. Hence τ=t−m. This is an independent derivation of the isolated-vertex extension of the usual edge-cover identity.

## A. Boundary composition, source15–26

Fix A⊆B. Every global cover with boundary part A decomposes uniquely into its private parts C_i⊆E(G_i)\B, since private edges have unique owners. Restricting covers gives |C|≥|A|+Σc_i(A). Conversely A together with feasible private minimizers covers EVERY global triangle because of triangle separation. Repeated checking of a triangle entirely in B adds no edge cost. An all-boundary triangle not met by A makes the state infeasible; an unchosen boundary edge cannot be used as a private option. Taking minima proves the cover identity.

For packings, choose for each global triangle one containing piece and assign it there once. Restrictions give edge-disjoint local packings and pairwise disjoint actual B-occupancy sets. Conversely such local packings have no private edge conflicts and no boundary conflicts; they combine. An all-boundary triangle has a nonempty three-edge mask, so two copies cannot enter a legal combination. This proves the packing identity. These arguments use actual edge identities, not just mask cardinalities.

For flat forced-cover states, delete dual vertices already hit by A and use only private original edges as dual edges/singletons. If a remaining triangle has no available private edge, the state is infeasible; otherwise D4 applies. No induced-piece assumption is needed. Shared vertices cause no edge conflict. Triangle-free background edges are retained in the graph and all triangles are recomputed; they may become relevant after boundary restoration.

A three-edge triangle split into three singleton-edge pieces with B empty violates ONLY separation among the relevant hypotheses. The advertised identities predict0,0 while actualν=τ=1. This refutes dropping separation from the composition identities, not Tuza itself.

## B. Flat residual and globally isolated K4 supports, source36–48

Every e∉B belongs to exactly one piece. A full G-triangle containing e must be in that same piece, by separation and unique ownership. Piece flatness therefore bounds GLOBAL triangle degree of e by2. In particular H=G−B is flat. Every H-triangle belongs to exactly one B-deleted piece (it has only private edges), so triangle families and edge supports separate; both optima add over those pieces.

If K4⊆H, each of its six nonboundary edges already occurs in two H-triangles. A further G-triangle using any one of those edges would give global degree≥3, impossible. Thus its four faces are an entire triangle component even in G. Two such K4 supports cannot share an edge unless they coincide: otherwise a triangle chain would leave an isolated support. Shared vertices are harmless. Delete ALL their support edges, not their vertices. Each component hasν1,τ2, so removing h components subtracts(h,2h) from BOTH G and H.

Restrict every original piece to remaining edges. Flatness and private-edge disjointness persist. Any retained full triangle was an original full triangle in a piece and all its edges remain, so triangle separation also persists. Boundary B is disjoint from removed supports and stays actual. This justifies using the piece argument again on F, rather than tacitly assuming it survives.

Now H0=F−B is flat and K4-free. Put k=ν(H0), s=2k−τ(H0), r=ν(F)−k. Nonnegativity of r follows from containment. HKT yields s≥k/2≥0, hence k≤2s. The cover B∪C_H0 gives τ(F)≤b+2k−s, b=|B|. This bound covers every full triangle: it either avoids B and belongs to H0, or contains a chosen B edge.

## C. Four-edge cases, source52–58

**r=0, the material piece-dependent step.** For reduced pieces F_i put k_i=ν(F_i−B); additivity gives Σk_i=k. If ν(F_j)>k_j for some j, combine that packing with maximum packings of every other F_i−B. Each latter packing avoids B and its private edges have a different owner, hence the combined packing has size≥k+1, contradiction. Thereforeν(F_i)=k_i for EVERY i. Each flat F_i satisfies Tuza: strip its isolated K4 components and apply HKT to the K4-free rest. Union its covers to get a global cover costing at most2Σk_i=2k. This is why a mere bound on nonboundary triangle degrees cannot replace the piece hypotheses in r=0.

**r≥2.** Since b≤4 and s≥0, τ(F)≤4+2k−s≤2(k+r).

**r=1,s≥2.** τ(F)≤4+2k−s≤2k+2.

**r=1,s≤1.** k≤2s≤2, soν(F)=k+1≤3. Invoke Parker on F. These cases exhaust nonnegative integral r,s. Add back h isolated K4 covers at cost2h and packings at gain h. This proves T1 under its frozen hypotheses.

**Auxiliary slack-one classification.** If s=1, then1≤k≤2. For k1,τ1 all triangles share a cover edge; flatness permits only one/two pages, i.e. K3/diamond support. For k2,τ3 equality in HKT forces one five-wheel support. This is correct but not required by the Parker-based T1 proof.

## D. Five-edge table and wheel reservations, source62–78

Use the direct bound when b−s≤2r; otherwise use Parker whenever k+r≤3. With b≤5:

|Case|Reason|
|---|---|
|r=0|Same exact piece-cover argument as above.|
|r≥3|5−s≤2r.|
|r=2,s≥1|5−s≤4.|
|r=2,s=0|k≤2s=0, soν(F)=2; Parker.|
|r=1,s≥3|5−s≤2.|
|r=1,s≤1|k≤2, soν(F)≤3; Parker.|
|r=1,s=2,k≤2|Parker again.|
|r=1,s=2,k=3 or4|Only unresolved numerical entries. A genuinely unclosed entry needs b=5; b≤4 was T1.|

For k4,τ(H0)=6=3k/2. D1's equality statement gives two full five-wheel triangle components. This is the only external equality use.

For a literal odd wheel of rim length2a+1≥5 in H0, spokes already have triangle degree2 and cannot occur in a NEW F-triangle. Two rim edges in one triangle would be adjacent; their third edge would be a new rim diagonal. The hub and that diagonal would then create an actual new triangle on saturated spokes, contradiction. Therefore EACH new triangle has at most one old rim edge per wheel and no old spokes. Completeness of the full triangle family is essential here.

A maximum old wheel packing has size a and corresponds to an independent set of its triangle cycle C_(2a+1). Avoiding two designated rim edges deletes two designated vertices of this cycle. Its residual paths have2a−1 vertices total, so the sum of their independence numbers is at least ceil((2a−1)/2)=a. Fewer forbidden rims are easier. Hence two edge-disjoint new triangles can append to simultaneous old maximum packings, one for each wheel, without old-edge conflicts. This would give r≥2. Under r1 the new family is pairwise edge-intersecting; D3 supplies a two-edge cover. Thus τ(F)≤τ(H0)+2≤2k+2. This proves the inequality in the two-W5 case and every old-wheel-only case, including a seven-wheel. It does not assert such graphs cannot exist.

The surviving core is exactly the T2 display. It does not imply that allν4 instances or general Tuza have been reduced to this class. No proof ofτ(F)≤8 is obtained here.

## E. Closed-instance kernel, source84–110

**E1 Old count.** D4 gives4=t−m(D), with m(D)≤floor(t/2); hence t≤8. If d=|E(D)|, every old support edge has triangle degree1 or2 and3t=a+2d. Since d≥m(D)=t−4, a≤t+8≤16. This uses dual EDGE COUNT d, not matching number m.

**E2 Crossing count.** S⊆E(H0) is disjoint from B. A new triangle meeting S cannot use a degree-two old edge (global saturation). Every degree-one old edge can support at most ONE new triangle. Assign each crossing triangle any such old edge; distinct crossing triangles cannot receive the same one. Thus count≤a≤16. Every new triangle contains B, otherwise it was already in H0. Consequently a crossing triangle has at most ONE edge outside S∪B.

**E3 Outside support.** N=F−S hasν≤1: two disjoint N-triangles append to an old maximum packing of size3. Its full triangle family is empty, a common-edge book, or all K4 faces, by D3 and full closure. Nonbook cases have at most4 triangles, so total≤28. A book spine outside B has global triangle degree≤2, so only a boundary spine needs compression.

**E4 Marks.** Let f∈B be that spine. Nonspine edges are private to one book page. At most b−1≤4 pages have another B edge. Among other pages, a nonspine edge in a crossing triangle lies outside S∪B, and each crossing triangle supplies at most one such edge. Thus≤16 more pages are marked. Marks need not be disjoint; this is an upper bound.

**E5 Global privacy.** Every F-triangle is old, crossing, or in N. An unmarked page's nonspine edges are not in S, not in B, not in a crossing triangle and not in another N-page. Hence EACH belongs to exactly that one FULL F-triangle. This is stronger than private within N or a piece.

**E6 Deletion andν.** If q>2 unmarked pages exist, retain two and delete one globally private leaf edge per other unmarked page. Otherwise delete none. Only those pages disappear. A packing contains at most one N-page; replace a discarded page by a retained unmarked page. Its leaves occur nowhere else and its spine was already occupied by the replaced page. There is no conflict. Subgraph monotonicity gives the reverse inequality, henceν preserved.

**E7 Deletion andτ.** When pages were discarded, any reduced cover avoiding f selects one private leaf per retained generic page, hence at least two globally private edges. Replace those two edges by f: their only respective triangles remain covered, every other covered triangle stays covered, and cardinality drops. Therefore EVERY minimum reduced cover contains f and covers all discarded pages. Together with subgraph monotonicity,τ is preserved. With q≤2, no deletion occurred. Retaining two is necessary for this particular forcing proof; “at most two” is interpreted as min(q,2), as the original paragraph's q≤2 clause requires.

**E8 Scope and cleanup.** No deleted edge lies in B or S, so all old labeled triangles survive. Edge deletion cannot create triangles. Induced piece restrictions keep all hypotheses. At most8+16+(4+16+2)=46 triangles remain. Remove globally triangle-free edges outside B, then isolated vertices; every retained vertex is in a triangle or is a B endpoint, so |V|≤3·46+2·5=148. This cleanup preserves the old triangle family, not its irrelevant background graph or isolated vertices. Isolated original vertices have no effect on either optimum. B endpoints remain even if B edges are triangle-free.

**E9 Explicit nonextension.** A q-page book with spine forbidden has forced avoidance cost q; after retaining two generic pages that cost becomes2. Thus the kernel is a CLOSED-instance equivalence for ordinary optima and stated core hypotheses, not equality of all response signatures or arbitrary-future-gluing equivalence. The independent nonvacuous test changes a marked book's forbidden-spine cost8→6 while global(ν,τ) stays(4,5).

## F. T4 and other saved ordinary claims

Clebsch was reconstructed using infinity, five singletons and ten pairs. Incidence joins singletons to containing pairs; disjoint pairs are adjacent; infinity joins the singletons. This is isomorphic to the frozen xor model by mapping its five generators to singletons and their pairwise xor to pairs. Triangle-freeness follows directly from this construction. Exhaustive evaluation of all2^16 canonical cone cover states independently establishesα5, cost11, precisely16 minima, all independent neighborhoods. For ANY cone cover, redundant base edges can be removed; after its spoke set is fixed, exactly the base edges induced by the unselected spoke vertices must remain. Thus the state enumeration exhausts ALL minimum covers, not only an arbitrarily selected class. An eight-matching attainsν8 and16 spokes bound it above; each private family has a five-matching and a five-vertex-side bound. Original stored cover/private/matching rows are checked under the explicit isomorphism.

The elementary original all-minimum-cover proof is also valid: equality |U|−e(U)=5 forces induced matching+isolates; an omitted matching endpoint would have exactly one neighbor in a maximum independent neighborhood, while the Clebsch property permits only two or five. This is an ordinary finite obstruction, not a Tuza counterexample.

The new checker also independently verifies the nine-vertex threshold witness, the16-vertex parity cone, the no-tightness petal example, and the three-book classification on its entire five-vertex fixed-base domain. The missing T-present premise was already explicitly corrected in the frozen original append; the correction is retained, not silently repaired here. Link-component splitting preserves original edge labels and exactly lifts/projects triangles. The K4/K5 two-star reservation is valid by opposite-face/two-triangle choices. The binaryν1 tetrahedral argument uses simple binary representations and a Fano RESTRICTION exclusion, not a contraction argument. Its broad generalization remains a pre-existing conjecture, not a proved bridge. Old atlas survival totals are not premises and are not re-enumerated in this verification.
