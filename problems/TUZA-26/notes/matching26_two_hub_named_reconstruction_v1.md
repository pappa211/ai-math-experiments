> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-hub neighborhoods: complete resilient-residual reconstruction

Frozen ordinary candidate v1, TUZA-26, 2026-11-17. Independent review required. This is an all-size actual-vertex operation, not a census or a general higher-degree classification. The source of the supplied neighborhood remains a separate availability question.

## Scope and exact interface

Work in the accepted conditional minimum-Q universe inside fixed minimum-CS G. Use triangle support, two-edge packing resilience, triangle codegree at least two, minimum degree at least four, whole-triangle minimum-cover eligibility, and the accepted paid boundary exclusions specified below. Write nu(Q)=k and tau(Q)=2k-1.

Suppose c has precisely the neighbors A={x,y} union U, where U is independent, |U|=t>=3, each leaf is adjacent to both x,y, and the only optional additional edge in A is xy. Put J=Q-c. Fix distinct u,v in U, M={xu,yv}, and R=J-M. The neutral interface from apex_two_hub_neighborhood_fragile_v1.md gives

    nu(J)=k, tau(J)=2k-3;
    every A link edge is packing-critical in J;
    nu(R)=k-2, tau(R)=2k-5.

This note assumes R is resilient. It proves a contradiction for BOTH statuses of xy and EVERY t>=3. The separate fragile-R repair is not used. Proper CS and the explicit minimum-Q choice give exactly one active C12 triangle component C of R, with all remaining triangle components literal K4/K5 pieces. Every old background edge and every shared vertex is retained.

For clarity, the neutral interface itself uses only actual deletions. Q-{cx,cy} has J's triangle family, so nu(J)=k. Adding cx,cy to a J cover gives tau(J)>=2k-3. A minimum Q cover containing all of cxu has exactly two c-spokes, cx and cu; otherwise its old part would violate that lower bound. Its old part contains xu and every yw with w!=u, proving tau(J)=2k-3 and joint eligibility of M. Appending the two disjoint c-pages cxu,cyv to R shows nu(R)<=k-2, with equality by two-edge deletion. Joint eligibility gives tau(R)=tau(J)-2. Appending any one c-page shows its old link edge critical in J. No forbidden two-edge cover pair from the two-leaf case is imported when t>2.

## Common boundary facts

Every Q triangle not already in R is either an ordinary page on one of the disjoint bases xu,yv, or a c-page. No triangle contains both M edges. A literal old clique D has at most one edge in the WHOLE ordinary-page footprint of a fixed base. Indeed, if D contains a base endpoint a and two page apices p,q, the old spokes bp,bq and clique edge pq form an R triangle merging b into D, forcing the missing base ab to be old. If D contains neither endpoint, that base has no D footprint.

The boundary below always means ALL D edges used by actual Q triangles not wholly in D. This accounts for arbitrary crossings and background. We use the accepted exclusions of: a tight K4/K5 with at most two adjacent boundary edges; any literal K4 with at most three boundary edges under whole-triangle eligibility; a K5 with a three-edge P4 boundary; a genuine fresh K5 triangle leaf; and a degree-four simplicial vertex. The final two exclusions are independently established without this two-hub argument.

Every frozen C12 has a universal vertex. Therefore every actual R edge whose endpoints lie in C belongs to C: its triangle with the universal vertex supplies the assertion unless it is already incident with that vertex. In particular a distinct old clique D shares at most one vertex with C. We use this conclusion only after proving the vertices in question lie in C.

## 1. No hub edge: all t>=3 are excluded

Suppose xy is absent. Every ordinary M-page has its apex outside the FULL set A: another leaf would require an edge inside independent U, and the other hub would require xy. Hence no new J page uses a retained A link edge. If such a retained edge were background in R, its sole Q triangle would be its c-page. This contradicts triangle codegree at least two. Thus EVERY retained A link edge is old-supported.

A clique D contains at most one hub and at most one leaf. If it has no A link edge, it contains at most one A vertex and has boundary at most one. If it contains xw for an unmarked leaf w in U-{u,v}, its complete boundary consists of xw from the c-page and at most one xu footprint xp. The yv family has no endpoint in D. These at most two edges are adjacent. The same argument applies to yw. The paid boundary exclusion therefore puts all unmarked spokes xw,yw in C.

If t>=4, two unmarked leaves give an induced C4 x-w-y-w'-x in C, impossible for frozen C12. An ordinary verification of that named fact is given below. It remains to consider t=3, with sole unmarked leaf w. We now know x,y,w lie in C, without assuming the marked leaves do.

Only old tight pieces containing xv or yu can remain. For a piece D on xv, its complete boundary is contained in

    {xv, xp, vq},

where xp is the whole xu footprint and vq is the whole yv footprint, when present. The page apices p,q lie outside A. Boundaries of size at most two are adjacent or a subset of this path; if the two nonincident footprint edges occur without xv, xv is nevertheless an actual c-page boundary, so that case cannot arise. A K4 with at most three boundary edges is excluded. A K5 with three distinct edges and p!=q has P4 boundary p-x-v-q and is excluded. The only possible remaining piece is consequently a K5 D_x with triangle boundary {xv,xp,vp}. Similarly, the only possible piece on yu is a K5 D_y with triangle boundary {yu,yq,uq}. There is at most one of each, because an old edge belongs to only one old triangle component.

We prove D_x would be a GENUINE K5 triangle leaf. It shares exactly x with C, since x is in C and distinct old components cannot share another C vertex. Its two vertices a,b outside the boundary triangle are outside A and outside C. They cannot belong to D_y: if, say, a did, the old edge ua in D_y and old edge xa in D_x would make the actual restored page xua. This outside-D_x triangle uses the private edge xa, contrary to the COMPLETE boundary {xv,xp,vp}. No other old component remains.

Nor can a or b gain an outside supported background edge. Such an edge must belong to a new M-page, since a,b are outside A and no c-page uses them. An xu-page with apex a uses private xa; a yv-page with apex a uses private va. Both enlarge the complete boundary and are impossible. The same applies to b. Q is triangle-supported, so a and b have exactly their four D_x neighbors. The accepted fresh K5 triangle-leaf reduction excludes D_x. The symmetric argument excludes D_y. This explicitly disposes of the possible vertex sharing between the two exceptional pieces.

Thus R has only C support. All retained link edges were proved supported, so u and v also lie in C. The five vertices v,x,w,y,u induce precisely the path

    v -- x -- w -- y -- u.

The missing chords are xy, xu, yv and all leaf-leaf pairs. Frozen C12 has no induced P5, as verified below. This excludes the remaining t=3 case.

## 2. Present hub edge: the old book lies in C

Suppose xy is present, and put W=U-{u,v}. All old triangles xyw, w in W, lie in one old component Z. If |W|>=2, their independent apices prevent Z from being a literal clique, so Z=C.

We justify the same conclusion when t=3. If Z were a tight piece D, it would contain x,y,w but neither u nor v. Both internal restored pages xuy and yvx already use the old D edge xy. The whole-family footprint lemma therefore forces BOTH M-family footprints to be exactly xy. The c-pages contribute precisely xy,xw,yw. Thus D's COMPLETE boundary is triangle xyw.

Every other old tight piece E has at most two adjacent boundary edges. If E contains yu, the internal xu-page xuy forces that whole family's footprint to be yu; the yv footprint is at most one edge incident to y, and the c-page adds only yu. The case xv is symmetric. An old piece containing any other A link edge would meet the book component Z in an edge, so would equal Z. With no A link edge, a clique contains at most one A vertex, hence has boundary at most one. These statements include all old background and shared vertices. The accepted small-boundary theorem removes every such E.

The piece D cannot be K4, by its three-edge boundary. If D=K5, its two vertices outside triangle xyw lie outside A. Since D shares at most one vertex with C, at least one of these private vertices, say a, lies outside C. No other old tight piece remains. A new xu- or yv-page with apex a would use private xa or ya, enlarging D's complete boundary; no c-page uses a. Thus triangle support forces a to have exactly its four D neighbors. It is a degree-four simplicial vertex, excluded by the independent general simplicial-degree-four theorem. This argument does not infer that both private vertices are fresh merely from a triangle boundary.

Therefore Z=C for every t>=3: x,y and all unmarked leaves lie in C.

## 3. Present hub edge: remove other pieces and confine all terminals

The same boundary calculation just given removes every old B piece now that the book is C. In particular, a piece on yu or xv has at most two adjacent boundary edges by the actual internal M-page; a piece with any unmarked spoke or xy would already be part of C; a piece with no A link edge has boundary at most one. Thus R has only C triangle support plus arbitrary background.

Every external M-page, meaning one with apex p outside A, has BOTH old spokes in C. If an old spoke were background, its only Q triangle would be this M-page: the other disjoint base shares neither endpoint of that spoke, and c is not adjacent to p. Triangle codegree at least two forbids this. Hence the old spokes are supported, and C is the sole old component.

If u were outside C, it could have no neighbor outside A union{c}. An old-supported such edge would put u in C, while a background such edge could become Q-supported only in an external xu-page, which also puts u in C. Among A, u has only neighbors x,y. It would therefore have degree three, contradicting the minimum-degree premise. So u belongs to C, and the same argument puts v in C. All of A now lies in C; this was proved rather than assumed.

For t>=4, the adjacent pair x,y has two independent common neighbors in C, namely two unmarked leaves. In every frozen C12, such an edge has a universal endpoint. But x misses u and y misses v in R, while u,v are both C vertices. Neither endpoint is universal. Contradiction.

## 4. The present-hub three-leaf case gives an actual cover saving

For t=3, C induces a bull on {x,y,w,u,v}: triangle xyw, pendant u adjacent only to y within these five vertices, and pendant v adjacent only to x. The only frozen C12 models admitting this induced bull are central-K4 stars with at least two leaves. More precisely, their universal root r is outside the bull, x,y,w are the other three central vertices, u lies privately in the leaf attached on ry, and v lies privately in the leaf attached on rx.

Here is the full placement proof. The universal root cannot belong to an induced bull. After removing it from a central star, the graph consists of the central K3, with a private clique attached at each of some central vertices. A triangle inside a leaf clique has at most one vertex with neighbors outside that clique; a pendant vertex cannot be inside that same clique. Such a triangle cannot support two pendants attached to distinct triangle vertices. Hence the bull triangle is the central K3, and the two pendants occupy the corresponding distinct attached leaf cliques. In the two-K5 shared-edge model, deleting the universal vertices leaves two disjoint cliques, so no bull occurs. W5 minus its universal hub is triangle-free. K5-e is not a bull on its five vertices. This exhausts frozen C12.

Choose the two-edge central K4 cover {rx,yw}. In the leaf D_x on rx, choose a minimum clique cover containing rx, so that leaf adds tau(D_x)-1 edges. In the leaf D_y on ry, choose ANY minimum clique cover containing yu; every clique edge is eligible, and this leaf adds tau(D_y) edges because ry was not selected centrally. If there is a third leaf on rw, choose any minimum cover, adding its full tau. The union F is an actual C cover of size

    2 + sum_D tau(D) - 1 = 1 + sum_D tau(D) = tau(C),

using the exact frozen central-star parameters (central packing one plus each leaf's packing). There is no extra saving from overlap: only rx was selected centrally, and distinct leaves share no edges. F contains yu and yw.

Now F union {xu,yv,cx} covers ALL Q triangles. All R triangles are covered by F; every restored M-page is hit by its base; every c-page through x is hit by cx; and the remaining c-pages cyu,cyv,cyw are hit by yu,yv,yw respectively. This is valid even if arbitrary external M-pages or background edges are present. Its size is at most

    tau(C)+3 = 2(k-2)-1+3 = 2k-2,

contrary to tau(Q)=2k-1. This is the literal cover repair completing the three-leaf hub case.

## Ordinary frozen-family facts used above

The central-K4 stars have one universal root r. After deleting r they are a central K3 with pairwise disjoint private cliques attached at individual central vertices. An induced path can use at most two central vertices, and at most one private vertex at each end; hence no induced P5 occurs. No induced C4 occurs either: a cycle entering a private clique must return through its unique central attachment, and the central clique has no induced four-cycle. The two-K5 shared-edge model has universal endpoints; after deleting them it is two disjoint cliques, which gives the same exclusions. In W5 any induced P5 or C4 must omit the universal hub, but its five-vertex rim is C5 and has neither. K5-e has too many edges on any four/five vertices to induce either graph.

For the adjacent-pair fact, an edge of a central star not incident with r has its common neighbors in the clique consisting of r and the one relevant construction clique. Thus two independent common neighbors force an edge incident with the universal root. In the two-K5 shared-edge model, only the shared edge can have common neighbors from the two different private cliques, and both its endpoints are universal. In W5, only a hub-rim edge can have two common neighbors, and the hub is universal. In K5-e, the only independent common-neighbor pair is the missing-edge pair, whose common neighbors are all universal. These are exact assertions about the frozen twelve models, not an enlarged family.

## Result, controls and remaining scope

Under the displayed neutral interface, NO opposite residual R can be resilient when the supplied c-link is K2,t plus optional xy and t>=3. Combined with the separate absent-hub fragile repair once independently accepted, this excludes every actual no-hub K2,t neighborhood for t>=3. In the present-hub case, the fragile residual cases t=3,4 remain outside this note; the separate apex note handles t>=5. This proof supplies no general source for such a two-hub neighborhood in an arbitrary minimum Q.

The bare local neighborhood alone is not enough: the graph consisting of c, the two hubs and t independent leaves has nu=tau=2 without xy (t>=2), and nu=tau=3 with xy (t>=3). Deleting cx,cy destroys all c-triangles and lowers packing in both controls. Thus they fail the neutral/two-edge-resilience premise. No enumeration, optimizer or numerical experiment is used here.

Relied-on current sources: notes/apex_two_hub_neighborhood_fragile_v1.md (neutral interface only); notes/two_edge_tight_boundary_v2.md and reviews/apex_boundary_review.md; notes/apex_k4_triangle_boundary_v1.md; notes/k5_three_edge_path_boundary_v1.md and reviews/opening_k5_path_boundary_review.md; notes/apex_k5_triangle_leaf_v2.md; reviews/opening_simplicial_final_review.md (independent general degree-four simplicial exclusion); inputs/C12_frozen.json; notes/eligibility_saturation_v1.md and the accepted global core profile. Root suggested the exceptional-piece and bull reconstructions; matching_geometry checked the complete boundaries, shared-private-vertex exclusion, named placement and exact cover cost.
