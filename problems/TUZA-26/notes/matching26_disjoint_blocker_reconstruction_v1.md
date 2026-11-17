> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Disjoint resilient-blocker reconstruction from a named support

Frozen ordinary/finite theorem candidate v1, 2026-11-16. Independent review REQUIRED. The reconstruction theorem has an explicit minimum-degree-four hypothesis; its application to the conditional minimum Q depends on the separately reviewed completion-free degree-three reductions. No unfinished degree-three argument is silently assumed.

## Modular reconstruction theorem

Let Q be a finite simple triangle-supported graph with one nonempty shared-edge-connected triangle family. Assume Q is three-vertex-connected, has minimum degree at least four, and is single-edge packing resilient. Let S={e,f} be two vertex-disjoint edges, each cover-eligible in Q. Put R=Q-S. Suppose the entire triangle support of R is one frozen C12 graph C; arbitrary R background remains permitted. Write r=nu(C), so tau(C)=2r-1. Assume

    nu(Q)=r+1, tau(Q)=2r+1.

Then no such Q exists.

This is the exact remaining disjoint resilient-blocker interface after the old tight pieces have been eliminated. The proof below makes no new minimum-Q comparison and needs eligibility only for e,f, not every Q edge.

## 1. Complete confinement and inducedness

Every new triangle is an ordinary page on exactly one restored base. Call a page R-bare if neither old spoke lies in C. A maximum packing of Q-e has size r+1 by resilience and consists of r old C triangles plus one f-page. Every R-bare e-page must meet that f-page; otherwise it appends and gives r+2. Matching-base pages intersect only with reciprocal endpoint apices. Consequently every R-bare e-page has its apex among the endpoints of f, and conversely for f. The assertion holds for every maximum one-base-deletion packing.

Every nonisolated vertex of Q lies in V(C) union the four S terminals. Indeed a vertex outside that union can only occur as the apex of a new page; both spokes then lie outside C, making it bare with a forbidden nonterminal apex. Since Q is triangle-supported and three-connected, there are no further vertices.

C is induced in R on its own vertices. Every C12 has a universal support vertex z. An extra old edge ab between C vertices would make an old triangle abz using C edges, forcing ab into C, contrary to its definition. Any outside vertex x has an independent R-neighbor set in C, since an adjacent pair of its C-neighbors would create an old triangle outside C.

If no S terminal is in C, no new triangle uses a C edge. Then the old C triangle family cannot be joined to any new triangle through a shared edge, contradicting triangle connectivity. At least one S terminal lies in C.

## 2. Exactly one S terminal lies in C

Write e=ux with u in C and x outside; f=yz has both endpoints outside. Every f-page is R-bare. Triangle connectivity requires some new page touching a C edge, and the only possibility is an e-page uxw with w in C, whose unique C footprint is uw. Choose any actual f-page, which exists because f is supported. Its apex is u or x by bare confinement, and its edges are disjoint from uxw. A maximum C packing avoids uw by C's single-edge resilience. Appending the two pages gives r+2, contradiction.

## 3. Exactly two S terminals lie in C, on the same base

Write e=uv internal to C and f=xy outside. For every frozen C12 other than K5-e, adding an internal nonedge uv increases packing by one. For the ten fresh edge-glued models, every particular new page appends to an old maximum packing by the accepted independent-star avoidance lemma. For W5, adding a rim chord gives the explicit three-triangle packing from the accepted named insertion lemma. Thus C+uv has packing r+1 unless C=K5-e. Any f-page is bare and has no edge in C+uv, so it appends to that packing and gives r+2.

The only remaining case is C=K5-e and uv is its unique missing edge. Bare confinement gives f-page apices only u,v. Every Q edge incident to x or y must lie in a new page. Such pages can only connect x,y to u,v or to each other: an edge xw with w in C minus{u,v} could occur neither in an e-page (whose two old spokes at x go to u,v) nor in an f-page (whose apex must be u,v). Hence removing{u,v} separates{x,y} from the other three C vertices. This contradicts three-connectivity.

## 4. Exactly two S terminals lie in C, on different bases

Write e=ux,f=vy with distinct u,v in C and x,y outside. Let I=N_R(x) intersect V(C), J=N_R(y) intersect V(C); both are independent.

Suppose xy is old. Because Q is triangle-supported and R has no outside triangle, xy occurs in either the bare page uxy or the bare page vxy. Assume uxy; the other case is symmetric. Any f-page vyz with z in C minus{u} is disjoint from uxy and has only one C footprint vz. C resilience would allow these two pages to append, giving r+2. Such a page is impossible. Every old edge yz with z in J must occur in a new Q triangle; if z is not u, its only possible new triangle is the forbidden f-page vyz. Thus J is contained in{u}. Vertex y has degree at most three: its neighbors are v,x and possibly u. This contradicts the minimum degree hypothesis. Therefore xy is absent.

Now every edge xz with z in I can only be supported by the e-page uxz, so I is a subset of N_C(u); similarly J is a subset of N_C(v). Their sizes are at least three because x,y have only their one restored edge beyond their old C neighbors. Thus TWO distinct vertices u,v have independent triples in their C neighborhoods.

This never occurs in frozen C12. In a central K4 with two or three leaves on edges sharing center a, only a can have an independent triple in its neighborhood: a private leaf vertex has a clique neighborhood; any other central vertex has its neighbors covered by at most two cliques (the remaining root vertices and its own leaf private vertices). All other named models have global independence number at most two. This model-by-model structural fact is also exhaustively checked by scripts/matching26_disjoint_named_facts.py, which tests all1192 vertex triples across the twelve exact frozen graphs. At most one vertex per model has an independent neighborhood triple, and that vertex is universal. Contradiction.

## 5. Exactly three S terminals lie in C

Write e=uv internal to C and f=wx with w in C, x outside. Put I=N_R(x) intersect V(C). This set is independent and has size at least three, since x has only the restored edge wx beyond I.

If both u,v belong to I, there is an R-bare e-page uvx. Choose z in I minus{u,v}. The old edge xz is supported in Q and cannot belong to an old triangle or the e-page at x. Its only possible triangle is the f-page wxz, with wz a C edge. This f-page is disjoint from uvx because its apex z is not an e endpoint. C resilience avoids wz, and the two pages append to give r+2. Hence I does not contain both u,v.

It follows that deleting f leaves exactly the triangle family of J=C+uv: the sole outside vertex x cannot be an e-page apex. Since f is cover-eligible and Q is resilient,

    tau(J)=tau(Q-f)=tau(Q)-1=2r,
    nu(J)=nu(Q-f)=nu(Q)=r+1.

Thus J has defect two. The complete independently accepted210-internal-insertion table (reviews/opening_dependency_review.md, evidence/opening_checks.json) was optimized for EVERY internal nonedge of EVERY frozen C12, without first imposing K4-completion. Exactly four presentations have defect two. They all start from central_K4_star_4, the two K4s on0123 and0145 sharing01, and insert one of24,25,34,35. This C has independence number two. That contradicts the independent set I of size at least three.

No K4-completion or diamond-confinement hypothesis is used here. The new ordinary argument has already confined every actual triangle of Q-f to the internal graph C+uv, which is exactly the accepted finite table's domain.

## 6. All four S terminals lie in C

Confinement and inducedness give Q=C+e+f exactly. Deleting either restored edge preserves packing and lowers cover by one, so BOTH internal single insertions C+e and C+f have defect two. The same complete210 table forces C to be the double-K4 model, with e,f among24,25,34,35. Since e,f are disjoint, there are only two possibilities.

For S={24,35}, Q contains the four edge-disjoint triangles

    023,045,124,135.

For S={25,34}, it contains

    023,045,125,134.

Both are directly verified in evidence/matching26_disjoint_named_facts.json. But r=2 for this C, so the required profile is nu(Q)=3. The four-packings contradict it.

This exhausts all placements of the four S terminals and proves the modular reconstruction theorem.

## Exact finite scope, costs and integrity

The new computation checks only1192 vertex triples in the twelve frozen graphs, verifies that the accepted210 rows have exactly the four reported defect-two insertions without filtering on K4-completion, and checks the two explicit four-packings. It does NOT re-solve those210 optima; their independent opening verification is a distinct accepted premise. There is no new broad graph enumeration, solver, or installation. Source hashes and local runtime are recorded in evidence/matching26_disjoint_named_facts.json.

Relied sources: inputs/C12_frozen.json; evidence/opening_checks.json and reviews/opening_dependency_review.md; notes/eligibility_saturation_v1.md / reviews/opening_saturation_review.md (named insertion facts); TUZA25 notes/residual_independent_star_avoidance.md for its full exact scope. The older TUZA25 evidence/mixed_named_interface_verification.json was read to locate the existing domain, but the accepted TUZA26 opening table is the numerical premise.

## Application and remaining OPEN arrow

At the conditional minimum unknown Q, a blocker pair has a defect-one residual. If the residual is resilient, its active component is C12 by minimum-Q choice, with tight components otherwise. For DISJOINT restored edges, every tight component has complete boundary at most two, so the accepted boundary reduction together with notes/matching26_opposite_boundary_closure_v1.md removes all those pieces. This supplies the named-support premise above. Saturation supplies eligibility, and the separate completion-free degree-three reductions must supply minimum degree at least four. Once all those independently reviewed premises hold, no disjoint blocker pair exists in Q.

Dependency order is essential: three-edge-B shape results -> completion-free degree-three exclusions -> minimum degree four; three-edge-B results plus saturation -> opposite-boundary closure -> removal of tight pieces; then this named reconstruction. This proof is NOT used to establish its own minimum-degree or tight-piece hypotheses.

The final application remains CONDITIONAL while any listed profile/degree-three review is pending. The no-blocker branch and adjacent-blocker reconstruction are separate obligations. Excluding all disjoint blockers is a concrete reduction of the global failure pattern, not a proof of availability, global R, universal CS, or unrestricted Tuza.
