> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: critical-wedge descent after a degree-four cap

Verdict: PASS, PROVED_ORDINARY for notes/degree_four_cap_critical_wedge_v1.md, SHA-256 1c30d689d579447b7e365760c85f6a2070eea19fd292aa8d2eac42ca0719b716, using only the already independently checked exact210 insertion fact in its stated internal branch. No new computation or Lean verification was needed. The resulting two-edge restoration over B is not yet paid.

## Actual defect-two graph and defect-one deletion

The input is the remaining codegree-two degree-four cap, with L of defect three, compulsory triangle xyc and N_Q(c)={u,x,y,z}, uz absent. All L triangles through c are the three c-triangles of K4[cxyz]; uc is background. For A=L-c and r=k-2, removing the compulsory triangle from a maximum L packing supplies an r-packing of A avoiding xy. A larger A packing would be a maximum L packing omitting the compulsory triangle. Therefore nu(A)=nu(A-xy)=r.

An r-packing of A avoiding xz could append cxz, producing a maximum L packing without xyc; similarly for yz. Thus xz,yz are critical in A. Every A cover meets xyz, and the c-spoke opposite one selected triangle edge covers the other two c-triangles, giving tau(A)>=tau(L)-1=2r-2. Proper CS after critical-edge deletion gives tau(A)<=2r-1.

Suppose tau(A)=2r-1, so A-xz is B. For any noncentral xz-page xzp, p different from y, every old tight clique receives at most one page spoke. The clique containing yz can receive only zp as an additional spoke: it cannot contain x because xz is absent. Its two forbidden edges yz,zp are adjacent, so its full K4/K5 packing can avoid both. Every other clique avoids at most one page spoke. Appending the page gives an r-packing of A avoiding critical yz, contradiction. Hence xyz would be the sole new page, forcing every r-packing of A to use xy, contradicting its noncriticality. Thus tau(A)=2r-2.

Applying the same B contradiction to R=A-xz excludes its tight alternative. Criticality and cover extension therefore give nu(R)=r-1,tau(R)=2r-3,defect one. Only this actual defect-one graph is considered for naming; A itself remains an unnamed defect-two graph.

## Resilient-R branch and tight-piece avoidance

Assume R resilient. Proper CS and fixed-G minimum-Q choice name its unique active defect-one support C as C12, retaining all tight pieces and background. Put e=xz, f=yz, g=xy.

For any noncentral e-page, a full C packing avoiding its C spokes together with f would combine with tight-piece maxima and append that page, giving an r-packing of A avoiding critical f. The tight-piece avoidance is valid for the same reason as above: only the f-clique can receive a second forbidden edge, and it is adjacent to f. Hence the C forbidden set has at least two edges, by single-edge resilience of C. Some noncentral page exists because an r-packing avoiding g cannot be wholly in R and cannot use central page xyz.

If f is outside C, both spokes of every noncentral page lie in C, so x,z are in C and inducedness forces y outside. Any internal insertion packing gain in C+e would combine with tight maxima avoiding f and contradict f-criticality. The exact named neutral-insertion response therefore makes C=K5-e. Its completion preserves packing. All noncentral pages lie in that completed C; an r-packing avoiding g cannot use the central page and consequently has at most nu(R)=r-1 triangles, contradiction.

If f lies in C and x also lies in C, any apex outside C would supply no C spoke, leaving only the one forbidden edge f and contradicting the avoidance obstruction. Thus every page is internal, and A is C+e plus unchanged tight pieces. Defect(A)=2 implies defect(C+e)=2, while f is critical there. This is EXACTLY an internal missing-edge insertion from the frozen210 domain. Its four defect-two cases have only the inserted edge critical, contradicting f different from e.

If f lies in C but x is outside, every noncentral page has zp in C, while xp is outside C. Its apex set I, including y, is independent in C: a C edge between two apices would make an old triangle with x and merge x into C. The avoidance obstruction says each pair{zy,zp} is a blocker of C. It is an induced wedge because y,p are independent.

## Independent named induced-wedge proof

In a fresh central-K4 model, the two edges of an induced wedge cannot lie in the same literal clique piece. At most one is a root K4 edge. A leaf containing a forbidden wedge edge can avoid both that edge and its attachment: the wedge center lies at a shared root vertex, so those edges are adjacent (or identical). Full K4/K5 packings avoid that pair. Choose every leaf packing to avoid its attachment; the root then freely chooses a maximum triangle avoiding its at most one forbidden edge. Their union is a full named packing avoiding the wedge. Shared attachment edges cause no double-counting, since the leaves avoid them. This covers all nine central-K4 star models.

For two K5s sharing an edge, an induced wedge must be centered at a shared endpoint with its two ends in different private triples. In each K5 the wedge edge is adjacent to the shared attachment. Maximum packings avoid both, and their union is a full four-packing. Thus none of the ten fresh models has an induced-wedge blocker.

In W5, a rim-centered induced wedge removes the two incident rim edges and leaves a four-vertex rim path with a two-edge matching, preserving packing two. A hub-centered induced wedge removes spokes to two nonadjacent rim vertices, leaving exactly one rim edge whose two hub spokes survive, so packing falls to one. The two removed spokes extend to a three-spoke minimum cover by choosing a minimum rim vertex cover containing those two vertices.

In K5-e, the only nonadjacent pair is its peripheral pair, so an induced wedge has a universal center and peripheral ends. Deleting its two spokes leaves all triangles through the edge joining the other two universal vertices, reducing packing to one. Those two spokes together with that opposite edge give a minimum three-cover.

Both exceptional models have independence number two. Hence I contains exactly y and one other apex, and a minimum C cover can contain all page spokes zp. Together with arbitrary minimum tight-piece covers, this is a minimum R cover already covering every new e-page. It contradicts tau(A)=tau(R)+1. The resilient-R branch is therefore impossible.

## Exact conclusion and remaining payment

R is fragile. A critical edge h then gives B=A-{xz,h}, with nu(B)=r-2 and tau(B)=2r-4 by proper CS and cover extension. The restoration adds exactly two actual edges, raises packing by two and cover by two, and retains critical yz, noncritical xy and the actual triangle xyz in A. These properties do not classify arbitrary defect-two supports and are not an automatic application of the earlier three-edge gain-two/cover-three theorem.

The W5-chord control is consistent: removing its compulsory rim vertex leaves a four-wheel A of defect two, and deleting the specified critical spoke leaves a fragile defect-one book. Thus resilience of R was correctly disproved rather than asserted. Payment of the final B restoration and cap availability remain OPEN. The eligible-hub input is used only to identify this remaining cap branch; no extra eligibility inference is made in the descent itself.

Frozen UTC: 2026-11-16T23:57:54.784909+00:00
