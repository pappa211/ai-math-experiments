> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Low-gain two-triangle residual: empty and one-edge cross graphs

Frozen ordinary classification lemma, TUZA-26. This is an exact supplied residual representation, not minimum-Q naming. Independent review requested.

## Hypotheses and application

Let S satisfy B with nu(S)=m,tau(S)=2m. Restore the edge-disjoint triangles T=abc and U=ade, with b,c,d,e distinct, and put H=S+T+U. Assume

    nu(H)=m+2, tau(H)=2m+3,
    H is single-edge packing-resilient,
    its nonempty triangle support is connected.

Arbitrary triangle-free background is retained. Exact one-triangle additivity, followed by appending the other central triangle, forces both complete new-family packing numbers to be one. Each new family N_T,N_U is therefore a common-base book or a literal four-face K4 with one full apex. A full apex lies outside the five-vertex core, since a has no S edge to b,c,d,e.

Let J be the old cross graph on {b,c} versus {d,e}. This note handles J empty and J={bd}. The conclusions concern the ACTUAL triangle support; extra triangle-free edges are not discarded from a later restoration argument.

In the selected actual-parent application, H=G-E(E0) for a bare ordinary critical-edge page E0. Deleting its two old background spokes preserves S's B triangle family. The parent residual equations give exactly the displayed parameters and resilience. No two-edge resilience of H is assumed.

## 1. Empty cross graph: an actual fresh-clique construction

If N_T were a book with common restored base f, deleting f would remove that entire family. There are no mixed triangles, and N_U has packing one, so nu(H-f)<=m+1, contradicting resilience. The same applies to N_U. Thus the two new families are K4s

    C_T=K4 on {a,b,c,x}, C_U=K4 on {a,d,e,y}.

Every old clique can contain at most one spoke from each family, because its terminal triple is independent in S. Triangle connectivity implies every old clique is touched by one of these new families; otherwise it remains an isolated triangle component. We now derive, rather than assume, fresh attachment structure.

### Equal apices x=y

The two new K4s share exactly edge ax. Every old clique is attached along one of the old spokes ax,bx,cx,dx,ex. All such old cliques contain x, and no clique contains two of a,b,c,d,e: every pair is absent in S because J is empty and both triangle triples are independent. Distinct old cliques share no further vertex, or they would share an edge and be one component. Their other vertices are outside the two new K4s.

Start with C_T, attach C_U freshly along ax, and attach the old cliques along their respective spokes. Repeated attachment along ax is permitted by the construction definition. This gives exactly the entire triangle support, with no extra support edge, since every actual new triangle was already included in N_T or N_U.

### Distinct apices x!=y

The two new K4s share only a vertex and hence not a triangle-family edge. Some old clique D must touch BOTH new families to connect their triangle supports: old components cannot connect directly to one another through old edges. Its two spoke edges must be ax and ay. Any other choice would put a together with a missing T/U terminal, or put one of b,c together with one of d,e, whose J edge is absent.

Thus D contains a,x,y and the old edge xy. It is unique because ax and ay each lie in a unique old component. It contains none of b,c,d,e. Every remaining old clique is attached along one of bx,cx,dy,ey. It shares no additional vertex with D, since it already contains x or y. Same-arm cliques share only their hub x or y. Two cliques on opposite arms cannot share a private vertex p: their old edges xp,yp and the old central edge xy would form a triangle joining the purportedly distinct old components.

There are no hidden intersections with the other new K4: for example an old clique on bx cannot contain a or c (missing ab or bc), d or e (missing J edges), or y (it would share central edge xy with D). The other cases are symmetric.

Start with D, attach C_T and C_U freshly on ax,ay, then attach each remaining old clique freshly along its designated spoke. This is a literal fresh K4/K5 edge-gluing construction of the complete triangle support.

### Named conclusion, with its justified source

The independently archived exact classification of the LITERAL fresh edge-gluing class applies to this constructed support. Its defect is one, so it belongs to the frozen fresh C12 forms. This is a constructive representation followed by a proved class theorem, not naming by proper CS. The archived strict triangle-restoration theorem for this class explicitly permits arbitrary triangle-free background; consequently such H cannot be an actual triangle residual of the minimum-CS parent G.

## 2. One cross edge J={bd}: K4 families are impossible

The sole mixed triangle is V=abd. Suppose first one new family is K4, say N_T=abc x. If the other is also K4, choose its ordinary page dey. The three actual triangles

    acx, dey, abd

are edge-disjoint, even when x=y. Their old footprint is {ax,cx,dy,ey,bd}. In a single old clique the only possible two-edge footprint is {bd,dy}, which is adjacent. All other pairs require one of the absent edges ab,ac,ad,ae,bc,de,be,cd,ce. Thus old clique maxima avoid the whole footprint and these three pages append, contradicting nu(H)=m+2.

If N_U is a book, resilience rules out common base ad: deleting ad would remove both N_U and V, leaving at most m+1 triangles. Hence its base is ae or de. There must be an ordinary U-page; if the family were only U, ad would also be a common base and the same contradiction would apply. Every such ordinary apex y lies outside the core.

For base de, the preceding witness acx,dey,abd works verbatim. For base ae use instead

    bcx, aey, abd.

These are again disjoint even for y=x. Their old footprint is {bx,cx,ay,ey,bd}; now its sole possible two-edge same-clique footprint is the adjacent pair {bd,bx}. The same elementary absent-edge checks exclude every nonincident pair. This again gives m+3 triangles. Symmetry handles a K4 U family. Therefore BOTH families must be books.

## 3. One cross edge, both books: exactly W5 support

Let their common bases be f and g. Resilience forces

    f in {ac,bc}, g in {ae,de},

because f=ab or g=ad would delete that entire book and V simultaneously. Each family has at least one ordinary page, for otherwise its central triangle alone could be regarded as a book on the forbidden base. Every ordinary apex is outside the core, by the absent T/U/J edges.

The old edge bd is background. If it were supported, choose a minimum S cover containing it; adding f,g would cover both books and V with only 2m+2 edges, contradiction.

Take arbitrary ordinary pages P on f and Q on g. Each is disjoint from V. If P,Q are also edge-disjoint, all three append over old clique maxima: bd is background; each individual page has at most one spoke per old clique; any cross-family old footprint can only be a two-edge star at the common terminal a. Other cross-footprint pairs require an absent edge between their core terminals, or the background edge bd inside an old clique. Thus a maximum old packing avoids the entire footprint. This would give m+3 triangles.

Consequently EVERY pair P,Q must intersect. The only actual way is

    f=ac, g=ae,

with identical apices: two pages on these adjacent bases meet on their a-spoke exactly when their apices agree. For all other f,g choices their bases are disjoint or the relevant reciprocal core apices are impossible. Since both ordinary families are nonempty, each therefore has exactly one apex x and the two apices coincide.

The full new family is precisely

    abc, acx, ade, aex, abd,

the five triangles of W5 with hub a and rim b-c-x-e-d-b. Every W5 edge belongs to some minimum three-edge wheel cover. If any old wheel edge were supported in S, choose a minimum old cover through it and a wheel minimum cover through it; this would cover H with at most 2m+2 edges. Therefore every old wheel edge is background. The wheel family is edge-disjoint from all old triangle components, so connected triangle support forces m=0 and the support of H is exactly W5.

W5 is an ADMISSIBLE intermediate, not a contradiction at this modular scope. Its separately established strict actual triangle restoration excludes the final minimum-CS G. This preserves the sharp W5 control demonstrating that single-edge resilience plus every-triangle extension does not force the earlier two-edge-resilient K5-minus-edge kernel.

## Scope and next branch

The J0 support is in the literal fresh C12 class; the J1 support is W5. Arbitrary old background remains for the actual outer-triangle restoration, whose archived strict theorems explicitly account for it. The J2 adjacent/disjoint cross patterns are not proved here. The new residual is classified from its complete low-gain representation, not from a generic defect-one label. No computation, fixed-order census, private-vertex shortcut, or minimum-Q premise was used.

Relied sources: TUZA22 notes/two_triangle_restoration_v1.md, the exact one-triangle interface and old-footprint facts; notes/defect_one_fresh_clique_tree_classification_v1.md; TUZA25 sources/tuza22_initial/5_fresh_clique_defect_one_triangle_restoration_v1.md. Root independently supplied the J1 both-book reduction; apex_challenger checked the fresh representation and both one-K4 page payments.
