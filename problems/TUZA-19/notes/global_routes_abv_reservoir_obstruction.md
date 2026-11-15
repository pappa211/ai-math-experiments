# A K5 reservoir on the apex triangles: exact profile and obstruction

Status: ordinary all-size proof closing a genuinely different proposed resilient envelope. No Tuza proof, counterexample, or new terminal-class theorem is claimed. This was the finite-reservoir alternative in the focused even-factor pass beginning 2026-11-15T05:33:09Z. Root independently suggested the same path-component accounting while the calculation was in progress; a fresh independent review is not yet attached.

## Exact global purpose and construction

The selective-decoration reduction in global_routes_resilient_envelope.md would refute the auxiliary gate H-O2 if an edge-cover-critical cone H could occur as an induced subgraph of a two-edge packing-resilient graph B with pi(H)>2nu(B). Critical triangle-free cones have pi(H)/|V(H)| unbounded. Therefore an envelope with an absolute O(|V(H)|) packing cost would suffice. This does not itself refute Tuza.

Here is a candidate with precisely that cost. Let R be ANY finite simple triangle-free graph on n vertices. Start with J=K2 join R, with adjacent apices a,b. For each v in R introduce two private vertices p_v,q_v and make {a,b,v,p_v,q_v} a K5. Different pages share ab; pages for u,v also share the apex vertices but no other edge. Denote the resulting graph B(R). The original cone on a and R remains induced. This differs from the earlier K5 pages on rim triangles auv: no rim edge lies in a new page.

Every actual triangle is either a rim triangle auv or buv with uv in E(R), or lies in one of the displayed K5 pages. A private vertex has neighbors only in its page. The triangle-free hypothesis on R excludes all other triangles. The apex triangles abv belong to their pages, so the partition of triangle types is unambiguous.

## Exact deleted-spoke profile

For U subset V(R), let B_U=B(R)-{av:v in U}. Define

    m_U = maximum matching size of R-U,
    epsilon_U = 1 if SOME maximum matching of R-U exposes a vertex
                   x outside U with positive degree in the ORIGINAL R,
                0 otherwise.

Then

    nu(B_U) = 2n + m_U + epsilon_U.                       (1)

Isolated vertices of R still have pages and contribute two; epsilon uses original degree deliberately. A vertex isolated in R-U but adjacent to U can supply the extra unit.

### Local page calculation

A page has packing number two. If ab is unavailable and at most one of av,bv is unavailable, it still has a two-packing. If ab,av,bv are all unavailable, every remaining triangle contains the private edge p_v q_v, so its capacity is one. If av,bv are unavailable but ab is available, a two-packing is {abp_v, v p_v q_v}. Thus reserving both apex spokes costs exactly one local triangle, unless this page uses ab. At most one page globally can use ab. Deleting only av causes no intrinsic local loss.

These assertions are literal K5 statements. For example, when av and ab are unavailable use {a p_v q_v, b v p_v}; this also proves the easier cases by symmetry and monotonicity.

### Reduction to two disjoint matchings

Fix the rim triangles of a packing. Their a-colored and b-colored rim edges form edge-disjoint matchings A and C, with A avoiding U. Conversely every such pair is a legitimate set of rim triangles. Write F=A union C. Its nontrivial components are paths and even cycles. Let d(F) be the number of degree-two vertices, and let s(F) be the number of vertices of U covered by C. These sets are disjoint, since vertices of U have degree at most one in F.

Exactly d(F)+s(F) pages have both apex spokes unavailable. The local calculation gives the EXACT extension size

    2n + |E(F)| - max(0,d(F)+s(F)-1).                   (2)

When the penalty is positive, choose one deficient page to use ab and give each other deficient page one triangle. All nondeficient pages have two-packings avoiding ab; hence these local optima coexist. When there is no deficient page, all pages simply avoid ab.

Let p(F) count nontrivial PATH components, ignoring cycles. Since |E(F)|-d(F)=p(F), the score after 2n in (2), when d+s>0, is

    p(F)-s(F)+1.                                        (3)

### Upper bound in (1)

If d+s=0, F is a matching in R-U and its score is at most m_U.

Otherwise let p_0 be the number of path components wholly outside U. A path touching U has one or two U endpoints; it contributes respectively zero or minus one to p-s. Cycles avoid U. Hence p-s<=p_0<=m_U, proving the preliminary bound m_U+1.

Suppose equality m_U+1 occurs. Then p_0=m_U, and no path has two U endpoints. Choose one edge from each of the p_0 paths. This is a maximum matching of R-U. There can be no even-cycle component: its edge could augment this chosen matching. There can be no path touching U of length at least two: an edge of this path wholly outside U would do the same. Likewise a good path cannot have four or more vertices, since it would supply two disjoint edges instead of one.

Therefore the only possible components are K2 or P3 wholly outside U, and K2 with exactly one endpoint in U. Since d+s>0, either a P3 or such a U-to-outside K2 exists. In the P3 case, choosing its terminal edge exposes its other endpoint, a nonisolated vertex of R. In the latter case its outside endpoint is exposed by the maximum matching already chosen and is adjacent to U in R. Thus epsilon_U=1. This proves the upper bound m_U+epsilon_U, including when epsilon_U=0.

### Lower bound in (1)

A maximum matching M of R-U, all colored a, together with two triangles in every page avoiding ab gives 2n+m_U triangles.

If epsilon_U=1, choose an exposed vertex x outside U having a neighbor y in R. If y is in U, add the b-colored edge xy to M. There is one deficient page (at y), which uses ab to retain two triangles; the score increases by one. If y lies outside U, it is matched by M (otherwise xy augments M). Add xy colored b; together with the a-colored M-edge at y it forms P3. Now the single deficient page is at y again, and the same rescue supplies the extra unit. This proves equality.

## Every rim edge gives a two-spoke blocker

Let uv be any edge of R and put U={u,v}. Always

    m_U <= m_empty-1,

since uv can be adjoined to every matching of R-U.

If epsilon_empty=1, equation(1) immediately gives

    nu(B_U) <= 2n+m_empty = nu(B(R))-1.

If epsilon_empty=0, every vertex of positive degree in R is covered by a maximum matching; thus the subgraph obtained by removing isolated vertices has 2m_empty vertices and a perfect matching. After deleting u,v it has 2m_empty-2 vertices. If m_U=m_empty-1, every original nonisolated remaining vertex is covered, so epsilon_U=0. Otherwise m_U<=m_empty-2 and epsilon_U<=1. In both cases

    m_U+epsilon_U <= m_empty-1,
    nu(B_U) <= nu(B(R))-1.

Thus for EVERY nonempty triangle-free rim R the pair {au,av}, for ANY rim edge uv, lowers the triangle packing number. The reservoir has the desired linear packing cost but NEVER the required two-edge resilience. It cannot supply the H-O2 envelope. The edgeless case contains no cone parity obstruction and is irrelevant to that purpose.

## Focused primary-literature screen and remaining condition

Zamfirescu, *K2-Hamiltonian Graphs: I*, SIAM J. Discrete Math.35(2021),1706-1728, DOI10.1137/20M1355252, studies graphs whose deletion of any adjacent vertex pair leaves a Hamiltonian graph. The author PDF's abstract, opening structural results and generalized-Petersen subsection were read: https://backoffice.biblio.ugent.be/download/8724976/8724977 . For even-order rims this gives a sufficient source for adjacent-deletion even 2-factors. However the paper explicitly has cubic 3-edge-colorable non-Hamiltonian examples: non-Hamiltonicity does not exclude an even 2-factor. Neither induced embedding of an arbitrary high-chromatic rim nor all spoke-deletion states follows.

Goedgebeur, Renders and Zamfirescu, *Generation and New Infinite Families of K2-hypohamiltonian Graphs*, arXiv2311.10593v2, Discrete Math.347(2024),113981, DOI10.1016/j.disc.2024.113981: https://arxiv.org/html/2311.10593 . The amalgam section and Theorem4 proof were inspected. The amalgam starts with graphs already satisfying special K2-hypohamiltonian gadget conditions; it is not an arbitrary induced embedding theorem. The displayed unbounded-maximum-degree family has n vertices and 2n-5 edges. Its cone has at most (3n-5)/2 uncut edges under some vertex cut, by averaging. Therefore it cannot meet pi(cone R)>2(n-1). Large maximum degree alone supplies no relevant parity margin.

Rizzi, *Indecomposable r-graphs and some other counterexamples*, J. Graph Theory32(1999),1-15, DOI10.1002/(SICI)1097-0118(199909)32:1<1::AID-JGT1>3.0.CO;2-B, primary author PDF https://profs.sci.univr.it/~rrizzi/papers/pdf/example.pdf , introduces poorly matchable r-graphs, where every two perfect matchings intersect. The publisher abstract and the search-rendered author-PDF excerpt containing Figure10 and its parity conditions were inspected. A direct full-PDF fetch timed out; the full construction proof was not read. This is the correct obstruction to an even 2-factor, unlike non-Hamiltonicity. The inspected constructions do not establish the needed simple triangle-free induced embedding with resilient deletion states; no such consequence is imported.

Pap, *Hypo-matchings in directed graphs*, EGRES2005-14: https://egres.elte.hu/tr/egres-05-14.pdf . The primary abstract and introduction were read. Its directed even factors allow directed paths and even cycles in odd-cycle-symmetric digraphs. Bidirecting an undirected edge permits a directed 2-cycle, so this is not the edge-disjoint two-perfect-matching problem required here. No min-max theorem is transferred across that distinction.

For an even-order triangle-free rim with nu(K2 join R)=n-1, resilience after deleting au,av on a rim edge uv forces two disjoint matchings, one perfect on R and one perfect on R-{u,v}. The perfect matching on R must use uv, since otherwise auv could augment the original packing to n. Removing uv leaves an even 2-factor of R-{u,v}. Conversely, an even 2-factor of R itself gives n packed triangles and hence violates two-edge resilience by the spoke count. These are necessary adjacent-deletion requirements; nonadjacent same-apex deletions and other edge pairs impose additional states. The screen found no construction giving all these states together with an arbitrary high-chromatic induced rim. It does not prove such a construction impossible.

## Bounded verification receipt

checks/global_routes_abv_reservoir.py passed all eight local K5 base-edge reservation states and six fixed full-graph states: rims K2, P3 and C5, each with no deletion and with the two a-spokes at endpoints0,1 deleted. Every actual graph triangle was enumerated. Each predicted optimum has a checked literal SAT packing and a solver-level UNSAT result one above it. These finite controls corroborate, but do not replace, the ordinary proof. Evidence: evidence/global_routes/abv_reservoir_controls.json. No larger census or Lean process was used.
