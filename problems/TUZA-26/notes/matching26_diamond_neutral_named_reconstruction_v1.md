> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Neutral degree-four diamond: resilient named predecessor is impossible

Frozen ordinary reconstruction candidate, TUZA-26. This owns only the RESILIENT predecessor branch of the neutral diamond case; the fragile predecessor is a separate obligation. All actual triangles and background edges are retained until the proof excludes them. No graph census or defect-two naming is used.

## Actual neutral diamond profile

Let Q be the conditional minimum unknown support, with nu(Q)=k,tau(Q)=2k-1. Use the accepted global properties: minimum support degree four, every edge in at least two actual triangles, whole-triangle minimum-cover eligibility, proper-subgraph CS, the fixed-G minimum-Q naming rule, and the complete small-boundary exclusion.

Suppose c has degree four with

    N_Q(c)={u,x,y,z},

inducing the diamond with hub edge xy and missing pair uz. Put J=Q-c and assume the NEUTRAL branch nu(J)=k. Set

    M={xu,yz}, R=J-M.

Every diamond edge is critical in J: a maximum J packing avoiding an edge ab could be augmented by cab, contradicting nu(Q)=k. An arbitrary J cover extends over c by adding cx,cy, so tau(J)>=2k-3. A minimum Q cover containing the full triangle cxy has cx,cy and leaves a J cover of size at most2k-3. Thus

    tau(J)=2k-3.

No minimum Q cover can contain three c-spokes, since its remaining J cover would then have size at most2k-4.

The two c-pages cxu and cyz are edge-disjoint. Hence nu(R)<=k-2, while deleting the two M edges loses at most two, so nu(R)=k-2. Choose a minimum Q cover containing all three edges of cxu. It contains exactly the two c-spokes cx,cu; therefore it must select yz to cover cyz. Removing cx,cu gives a minimum J cover containing BOTH M edges. The usual deletion bounds then give

    tau(R)=2k-5, delta(R)=1.

Assume in this note that R is single-edge packing-resilient.

## 1. Name only the defect-one active support

Proper-subgraph CS and component additivity give exactly one active defect-one triangle component C of R and otherwise literal tight K4/K5 components. Resilience passes to C. Its supported edge count is strictly smaller than Q, and it lies in the same fixed-G universe. The explicit minimum-Q rule therefore places C in the frozen C12. No naming of J or another defect-two graph is made.

The old graph on A={u,x,y,z} in R is the induced path

    u-y-x-z.

An old tight clique contains at most two A vertices, since any three contain one of the missing edges xu,yz,uz. If it contains two, they form one of the three old path edges.

## 2. Every old tight component has a complete boundary of at most two

Restore M and the four c-spokes to R. An old clique sees at most one old edge in the entire ordinary-page family of each fixed restored base. The internal pages force the following sharper footprints.

* If D contains xy, the internal xu-page xuy already uses D edge xy, so this is the WHOLE xu footprint. The internal yz-page yzx likewise forces its WHOLE footprint to be xy. The only c-page old edge in D is xy. Thus the boundary is at most {xy}.
* If D contains yu, the internal xu-page xuy forces the WHOLE xu footprint to be yu. The yz footprint has at most one further edge incident with y. The c-pages add only yu. Thus the complete boundary has at most two adjacent edges.
* If D contains xz, the symmetric argument gives at most two adjacent edges at x.
* If D contains only one A vertex, it lies on only one of the two disjoint restored bases, so the boundary has at most one edge. With no A vertex it has no boundary.

The two M edges are disjoint and cannot occur together in one triangle. A c-triangle has its two c-spokes plus either an old diamond edge or an M edge; the former old edge was included above, and the latter gives no old D edge. Thus all actual multiple-restored-edge triangles are included. No hidden crossing/background case remains.

The accepted complete-boundary theorem excludes every old tight clique. Consequently R has only C as triangle support, with arbitrary background still retained.

## 3. External ordinary pages have both spokes inside C

Consider an ordinary M-page with apex p outside A. Suppose one of its two old spokes is background in R. Its only possible new Q triangle is this ONE M-page. The other M base has disjoint endpoints, all in A, and cannot form a triangle containing that spoke when p is outside A. No c-page can contain it because c has neighbors only in A. There was no old R triangle by the background hypothesis.

That spoke would therefore lie in exactly one Q triangle, contradicting the accepted codegree-at-least-two property. Hence BOTH spokes are old supported edges, and therefore both belong to C. In particular any external ordinary page forces both endpoints of its restored base, and its apex, to be C vertices.

The same argument rules out an old edge from a terminal a outside C to a vertex outside A: it would be background in R and could be activated only by the unique ordinary page on a's restored base, giving Q codegree at most one. Thus a terminal outside C has Q neighbors only among A union{c}.

The peripheral terminals u,z have degree two within the diamond, so each would have total Q degree at most three if outside C. Therefore u,z belong to C.

## 4. The two hubs also belong to C

A maximum J packing has two ordinary M-pages, one per base, because nu(J)=nu(R)+2. The only internal ordinary pages are xuy and yzx, and they share xy. Thus at least one of the two pages is external. By Section3, at least one hub belongs to C. Suppose, without loss of symmetry, that x belongs to C but y does not.

Then xy and yu are background in R. No external yz-page exists, since Section3 would force y into C. Hence yzx is the ONLY ordinary yz-page, and every maximum J packing must contain it.

But yu is critical in J. Since it is background in R, a J triangle containing yu must be created by M. The only such triangle is xuy: a yz-page with apex u would require the absent edge uz. Thus every maximum J packing must also contain xuy. These two triangles share xy, contradiction.

Therefore y also belongs to C. The symmetric case is identical. All four diamond vertices lie in C.

## 5. Complete literal reconstruction and a one-edge cover saving

Every C12 support has a universal support vertex. Hence every R edge whose endpoints lie in C already belongs to C: the universal vertex completes an old triangle, or is itself one endpoint. Thus C induces the old P4 u-y-x-z on the four terminals.

Every ordinary M-page now lies inside C by Section3 or by its internal apex. All c-pages lie on c and the four terminals. Therefore every Q triangle is contained in

    C + {xu,yz} + the four c-spokes.

Since Q is triangle-supported, no other background edge or support vertex remains. This is the complete actual reconstruction, with c fresh.

Use the independently accepted named-family eligibility fact: every ineligible C12 edge has a universal endpoint. Neither endpoint of the end-path edge uy is universal in C, since u misses x,z and y misses z. Thus uy belongs to a minimum C cover F.

Now

    F union {xu,yz,cx}

covers Q. It covers all old C triangles by F, all M-pages by their restored bases, and the five c-pages as follows: cyu is covered by uy, cyz by yz, while cxy,cxu,cxz are covered by cx or xu. Its size is at most

    tau(C)+3 = [2(k-2)-1]+3 = 2k-2,

contrary to tau(Q)=2k-1.

This excludes the neutral diamond branch whenever R is resilient.

## Status and dependencies

Neutral degree-four diamond -> exact smaller defect-one R (ordinary, above) -> if R resilient, C12 plus tight pieces by explicit fixed-G minimum -> complete boundary removal -> all-terminal confinement via actual edge codegree -> explicit cover saving. The FRAGILE R branch remains separate and is owned by the apex worker. No general degree-four exclusion is claimed from this note alone.

Relied sources: notes/two_edge_tight_boundary_v2.md and reviews/apex_boundary_review.md for the accepted complete boundary and universal-endpoint eligibility facts; frozen inputs/C12_frozen.json for the unchanged named family; accepted minimum-Q global profile and fixed-G naming convention. The external-page confinement and final cover operation are ordinary and require no new finite check. The coordinator supplied the sharper internal-page boundary footprint and terminal-confinement idea, independently reconstructed here.
