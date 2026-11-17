> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# An exact cover exchange that pays a one-edge surplus

Frozen ordinary operation v1, TUZA-26, 2026-11-17. Independent review required. This consumes the one-unit gap between a minimum K cover and a minimum Q cover omitting the inserted edge; it does not pretend the latter is already minimum in K.

## Full actual disagreement graph with one surplus vertex

Let Q=K+uv have exactly two new pages, with apex set {x,y}, and tau(Q)=tau(K)+1. Let F be a minimum K cover containing P_x={ux,vx}. Since no minimum K cover covers Q, F misses P_y={uy,vy} entirely. Let E be a minimum Q cover OMITTING uv. Thus E is an actual K cover of size tau(K)+1 and hits both page pairs. Put

    D=F intersection E, A=F-D, B=E-D,
    |A|=n, |B|=n+1.

For EVERY actual K triangle missed by D, join each of its A edges to each of its B edges. This defines a bipartite graph H on actual cover edges. Both intersections are nonempty. Any vertex cover Z of H gives an actual K cover D union Z, by exactly the full-family argument used in the accepted balanced exchange lemma.

Consequently the minimum vertex-cover size in H is n: A itself has size n, and a smaller H cover would contradict minimum size of F. Hall's condition saturates A. Explicitly, a set S subset A with |N(S)|<|S| would give the H cover (A-S) union N(S) with fewer than n vertices. Choose a matching

    {(a_i,b_i):1<=i<=n}

saturating A; exactly one B vertex b_0 is unmatched. This is an auxiliary COVER matching, not a triangle packing.

Every size-n H cover selects exactly one endpoint of each matched pair and MUST omit b_0. Set z_i=true when selecting a_i, and false when selecting b_i. Edges a_i b_j give implications z_j -> z_i. Each edge a_i b_0 forces z_i=true. Let I_0 be the set of these forced indices, and let Z_0 be their forward closure in the implication digraph. These forced choices and implications describe ALL size-n H covers exactly. The always-true assignment recovers F, so consistency is automatic.

## Literal saving operation

For each book page, D already covers it or its available A/B spokes give a clause in the variables. A spoke in A is a positive literal; a matched spoke in B is a negative literal; the unmatched b_0 is unavailable; and a spoke outside F union E is unavailable. Find an assignment satisfying the implication constraints, the forced true variables, and BOTH page clauses. Then D together with the chosen matched endpoints covers K, hits both new pages, and covers Q with tau(K) edges. This pays the entire extra unit and contradicts tau(Q)=tau(K)+1.

The criterion has a simple exact form in this codegree-two full-page setup. Every available y-spoke belongs to B because F misses P_y.

* If D already hits P_x, the saving exists exactly when some y-spoke is a matched b_j with j outside Z_0. Choose true exactly Z_0, leaving that b_j selected.
* If D misses P_x, both x-spokes belong to A. The saving exists exactly when some x-spoke a_i and some matched y-spoke b_j satisfy j not in Z_0 and there is no directed path i -> j. Choose true exactly the forward closure of I_0 union {i}.

Necessity follows by implication propagation, including zero-length paths; sufficiency is the stated closed true set. Thus the operation either constructs a literal cover saving, or gives a precise obstruction: every usable y-spoke is the unmatched B vertex, is forced away by the surplus vertex, or is forced away by every admissible marked x choice.

This can be applied to a minimum Q cover E containing a whole actual triangle T, when E omits uv. However T is necessarily HIT BY D because F already covers it and E contains all of it. The triangle T therefore supplies NO H edge. Its other selected edges can be B vertices, but it is invalid to treat the whole T as an unhit disagreement triangle.

## Preserved control: the surplus component can absorb the page repair

Use the exact double-cone control from matching26_outside_hub_repair_v1.md. Q is the join of edge23 with rim cycle0-1-6-4-5-0, uv=01, x=2, y=3. Its displayed covers are

    F={02,12,24,35,36},
    E={24,25,45,03,12,36}.

Here F is a minimum K cover of size5 containing P_2; E is a minimum Q cover of size6 containing all of T=245 and omitting01. The preceding note supplies ordinary optimality proofs. The exact decomposition is

    D={12,24,36}, A={02,35}, B={03,25,45}.

The FULL disagreement graph has exactly the five edges

    02--03 from triangle023,
    02--25 from triangle025,
    35--03 from triangle035,
    35--25 from triangle235,
    35--45 from triangle345.

Every other K triangle is hit by D. In particular T=245 is hidden by the common edge24.

Choose matching02--03 and35--25. Its unmatched vertex is45, which forces35 to be chosen. The two off-matching edges in the K2,2 core impose implications in both directions between the two matched variables. Thus both A vertices are forced. The unique size-two H cover is A, yielding F again; the only available y-spoke03 is excluded. The D edge12 already covers the x-page, so this is precisely the first obstruction in the criterion, not an issue about satisfying the x-page simultaneously.

This ordinary five-edge certificate shows that one surplus cover edge can be absorbed by a forced unbalanced component even when the new cover comes from full-triangle eligibility. It is not a full-profile counterexample: this control has Q defect2, K defect3, and K is fragile, as already certified. The required minimum-Q packing resilience and defect2 predecessor assumptions remain available but have not yet been turned into a proof that this absorption cannot occur.

## Scope and concrete remaining task

The operation genuinely uses a minimum Q cover one edge larger than a minimum K cover, and either saves that edge or records exactly where it is forced. It is stronger than merely comparing cover distances. Its universal availability is OPEN. To finish the proposed discriminator, one needs a paid argument linking a forced surplus component to an actual jointly releasing triangle or to an outside-packing exchange such as the accepted endpoint repair or the candidate third-hub repair. No cover-edge matching is identified with edge-disjoint triangles, and all common-cover-hidden triangles remain actual constraints.

Sources: notes/matching26_book_exchange_v2.md; notes/apex_full_disagreement_cover_operation_v1.md; notes/matching26_outside_hub_repair_v1.md; evidence/codegree_two_cover_falsifier_n7.json. Root proposed the one-surplus Hall/implication operation; matching_geometry checked the exact page criterion and independently reconstructed the full five-edge control graph. No numerical computation or graph search was used.
