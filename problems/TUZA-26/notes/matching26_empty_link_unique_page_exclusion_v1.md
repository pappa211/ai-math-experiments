> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Empty-link defect-two descent: the unique extendable page is impossible

Frozen ordinary/verified-finite paid exclusion v1, TUZA-26, 2026-11-17. Independent review required. This completes the resilient-residual branch at EXACT outside defect two. The higher-defect outside graph and global availability remain separate.

## Exact interface and genuine extendability

Use the accepted full minimum-Q codegree-two outside-packing interface: uv has common neighbors exactly x,y; W=Q-{u,v} has nu(W)=m=nu(Q)-1; Q has the independently established minimum degree at least five and every edge has triangle codegree at least two. The elementary critical-degree arguments below need only degree four; the invoked resilient-component theorem uses the established degree-five premise. Every endpoint rim except xy is critical in W. Assume EXACTLY tau(W)=2m-2.

The accepted direct-B exclusion makes every critical W edge eligible. Fix one such edge r and put

    R=W-r, nu(R)=m-1, tau(R)=2m-3.

Suppose R resilient. Its support has one active frozen C12 component C and otherwise old B pieces, with all background retained. An r-page is EXTENDABLE if a maximum R packing avoids its two old spokes; equivalently it occurs in a maximum W packing. The already accepted multiple-page reduction excludes two distinct extendable pages. Thus assume there is a UNIQUE extendable page T. Every maximum W packing consists of T plus a maximum R packing avoiding its spokes.

Any NONextendable r-page has BOTH old spokes in C. Each old tight piece avoids its at-most-one footprint at full size, while the resilient C avoids any footprint of size at most one. A page with at most one C spoke would therefore append to an old maximum packing. In particular the existence of a nonextendable page puts both endpoints of r inside C.

We split by the number of old T spokes belonging to C. Every actual page, including nonextendable pages, remains in the argument.

## 1. Two C spokes: literal internal insertion

If both T spokes lie in C, its three vertices and both r endpoints lie in C. Every other actual r-page is nonextendable and hence also lies wholly in C. No r-page meets an old B piece. Every old B edge is resilient in W: vary its local maximum packing while retaining the unique extendable T and its compatible C packing. Its COMPLETE Q boundary is consequently contained in {xy}, because endpoint rims other than xy are critical. The accepted small-boundary reduction removes every B piece.

An old R-background edge lies in no r-page, so is also W-background. Q support forces any such edge except xy into an endpoint page, contradicting criticality of all such rims. Thus only xy could remain as background. Any vertex outside C would then have only u,v and possibly the other endpoint of xy as Q neighbors, violating minimum degree four. If both x,y lie in C, universality of the named C forces their actual old edge into C. Consequently the actual graph is

    W=C+r,

with r an internal missing edge of the exact frozen support.

The independently accepted complete210 internal-insertion table applies with no K4-completion prefilter. Its only defect-two cases are the double-K4 support0123,0145 plus one of24,25,34,35. In the representative insertion24, BOTH new pages are extendable:

    page024 extends over old packing123,145;
    page124 extends over old packing023,045.

The old packings have full size two and avoid the respective page spokes. Symmetry covers all four insertions. This contradicts unique extendability. The table's finite scope is licensed only after the preceding complete actual-graph confinement.

## 2. Zero C spokes with a nonextendable page: an actual K5 payment

Suppose T has zero C spokes and another, nonextendable page exists. Both r endpoints are in C. T therefore has an apex outside C, and every INTERNAL r-page is nonextendable. Hence

    nu(C+r)=nu(C):

any gain in this one-base insertion would use one internal page over a maximum C packing, making that page extendable over R as well. The insertion is triangle-bearing because the assumed nonextendable page is internal.

Apply the independently accepted named neutral-insertion theorem to this ACTUAL internal graph C+r. It forces C=K5-e and D=C+r=K5. No defect-two graph has been named; C was already the legitimate resilient defect-one residual component.

Every old C edge is resilient in W. The external T has zero C footprint, so for a queried C edge one may choose a maximum C packing avoiding it, choose the old tight-component packings avoiding T's footprints, and append T. All old C edges are therefore ineligible as endpoint rims except possibly xy, by the marked critical-rim rule.

The COMPLETE outside-Q boundary of the literal K5 D is contained in {r,xy}. All old R triangles using C edges belong to C and lie inside D. Every new internal r-page is inside D; the sole external r-page T uses the edge r. Triangles containing u or v can use an old C edge only if it is xy; any use of r is already counted. Arbitrary other old components and background contribute no uncounted D edge. The accepted K5 at-most-two-boundary payment excludes D.

This is a concrete paid region; no preliminary deletion of all old B pieces is required.

## 3. Zero C spokes with no other page: an unchanged resilient component

If T has zero C spokes and there is no nonextendable page, it is the only actual r-page. It shares no old edge with C. Thus C remains an unchanged resilient W triangle component, even if vertices are shared with T or other components. This contradicts the independently accepted all-total-defect resilient-component exclusion at this same outside-packing interface.

## 4. One C spoke: exact marked critical geometry

Suppose T has exactly one C spoke f. The other endpoint of r is outside C: if both base endpoints and the apex were C vertices, the actual second old spoke would also belong to C by its universal-vertex property. Hence no nonextendable page can exist, since such a page would place both base endpoints in C. T is the only actual r-page.

Its second old spoke cannot be supported in an old B piece. A minimum cover of that piece containing the spoke, combined with arbitrary minimum covers of C and all other pieces, would already cover the sole new triangle T at cost tau(R), contradicting tau(W)=tau(R)+1. Likewise f must be INELIGIBLE in C, or a minimum old cover containing f would cover T at unchanged cost. The second old spoke is consequently background.

Every old B component is untouched by T, so none of its edges is critical in W. Every maximum W packing uses T and an old maximum C packing avoiding f. Therefore the entire critical-edge set of W is

    E(T) union Crit(C-f).

Here nu(C-f)=nu(C), by C resilience. Background outside T is never used, and the old tight components can vary independently. We now verify the precise named fact needed to identify Crit(C-f).

### Exact ineligible-edge partner fact, from the accepted twelve-model list

For EVERY ineligible edge f in frozen C12, C-f has exactly ONE critical edge: the edge opposite f in its K4 construction piece. This is not assumed from the universal-endpoint property alone.

The complete ineligibility lists were independently verified in evidence/apex_boundary_checks.json and reviews/apex_boundary_review.md. They leave exactly these cases:

1. In the two-K4 shared-edge model, f is one of the eight nonshared hub-private spokes. It lies in just one K4. Deleting it leaves a diamond in that K4. Every full packing still needs one triangle from that piece, and the diamond's two triangles share precisely the edge opposite f. That edge is forced. Every other edge can be avoided: choose the diamond triangle avoiding the queried affected edge; or, for an edge in the other piece, choose the diamond triangle avoiding the shared attachment and vary the other clique's full packing. Full packings avoiding a single attachment always exist.
2. In a root K4 with one K5 leaf on01, only the four root spokes02,03,12,13 are ineligible. The identical diamond argument applies in the root. For a query in the leaf, use the root triangle avoiding01 and a maximum K5 packing avoiding the queried edge. Thus again only the root opposite edge is forced.
3. In a two-leaf central star on01,02, with either leaf size4 or5, the sole ineligible edge is03. Deletion leaves root triangles012 and123, forcing12. For any leaf edge, choose123, which avoids BOTH attachment edges, and vary the corresponding full leaf packing to avoid the query. For root edges13 or23, choose012 and avoid one attachment edge in each leaf. The root attachment edges01,02 themselves can be avoided by123 and the appropriate leaf packing. Hence only12 is critical.

There are no ineligible edges in the other named models. In each case the displayed full packings achieve the sum of the individual construction-piece packing bounds, so the forced-edge and avoidance statements are exact. No optimizer or new finite search is used.

Let g be this unique opposite edge. It is vertex-disjoint from f. The third vertex of T is outside C, so g is disjoint from ALL vertices of T. Thus

    Crit(W)=E(T) union {g},

a triangle and one isolated edge.

Minimum degree at least four gives a u-exclusive neighbor a, since u already has only v,x,y among its nonexclusive neighbors. Every Q triangle on ua supplies a u-link rim incident to a; v cannot be its third vertex. Q codegree at least two supplies two distinct such rims. Neither is xy, so both are critical in W. Thus a has critical degree at least two and must lie on T. Its only two critical neighbors are the other T vertices, so ALL T vertices belong to N_Q(u). The same reasoning at v puts all three in N_Q(v), contradicting exactly two common neighbors. This excludes the one-C-spoke case.

## Conclusion and remaining branch

All possibilities for the unique extendable page are excluded. Together with matching26_empty_link_multiple_page_reduction_v1.md, NO critical-edge defect-one residual R=W-r can be resilient in the exact outside-defect-two branch.

The direct-B exclusion already proved that such a residual has genuine defect one. It is therefore fragile, and a further critical deletion f gives

    B=W-{r,f}, nu(B)=m-2, tau(B)=2m-4,
    W=B+{r,f} with gains(2,2).

The independently accepted critical-envelope note supplies its complete bounded domain but does NOT yet pay every member. Components with higher outside defect, and global availability of a codegree-two edge with nu(Q-{u,v})=nu(Q)-1, remain OPEN. This note contains no new numerical computation or enumeration.

Sources: notes/matching26_empty_link_defect_two_descent_v1.md and its opening review; notes/matching26_empty_link_multiple_page_reduction_v1.md and its opening review; notes/matching26_outside_resilient_component_exclusion_v1.md and reviews/opening_outside_resilient_component_review.md; notes/eligibility_saturation_v1.md (accepted neutral insertion); notes/two_edge_tight_boundary_v2.md; evidence/apex_boundary_checks.json and reviews/apex_boundary_review.md; evidence/opening_checks.json, reviews/opening_dependency_review.md, and reviews/apex_disjoint_reconstruction_review.md for the exact210 insertion scope; inputs/C12_frozen.json. Root supplied the branch split and opposite-partner target; matching_geometry checked the full page families, direct K5 boundary payment and every named ineligible-edge case.
