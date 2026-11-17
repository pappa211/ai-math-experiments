> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-triangle restoration — independent adversarial reconstruction

Reviewed frozen source: `notes/two_triangle_restoration_v1.md`; hash and timestamp below. Reviewer: TUZA-22 source-audit / independent verifier. This reconstruction did not rely on a finite test or producer correctness conclusion.

**Verdict: ACCEPT as an ordinary all-size proof of CS for B(H) plus two edge-disjoint missing triangles.** No unresolved mathematical objection found after reconstructing the disjoint and shared-vertex lower/upper branches. This is internal AI review, not Lean verification or a priority determination.

## Main structure independently checked

For a single independent terminal triple abc, all new triangles are abc and pages on its three bases. The apex/base bipartite graph has each apex degree one or three, by actual edge closure. Edge-disjoint page families are precisely matchings in that incidence graph. A maximum new family has old footprint at most two edges, incident to the unique terminal in each old clique component; K4 star avoidance and K5 two-edge avoidance therefore show exact packing additivity, nu(H+T)=nu(H)+q_T. This remains valid for a three-page packing because each terminal belongs to only two of the three bases.

The q=1 classification is a common-base book or a complete four-face K4. The q<=2 classification is a new-family cover of size at most two, except for the exact seven-triangle K5-e family with two full apices and no other pages. The latter requires three cover edges; every spoke belongs to a three-edge cover {opposite base, matching spokes to the two apices}. Both classifications include empty-page and single-base cases and all actual crossing pages.

Restoring two edge-disjoint triangles gives packing at least m+2 and cover at most2m+6. If the packing is m+2, exact single-triangle additivity plus appending the other central triangle forces q_T=q_U=1. An intermediate tight graph is B by R1 and permits a second R1 step. Otherwise one intermediate has a cover at most2m+1; adding the other's three edges proves the inequality. Packing at least m+3 makes the six-edge cover adequate directly. Equality can consequently occur only at (nu,tau)=(m+2,2m+4) or(m+3,2m+6).

## Lower equality branch

For disjoint central vertex sets, no triangle uses edges from both restorations. A minimum H-cover extendible by one edge for the first strict intermediate, together with a two-edge cover of the second new family, gives2m+3 and excludes equality. This uses a deliberately chosen minimum H-cover; the proof correctly establishes its existence for both book and supported-spoke K4 intermediates.

For central triangles abc andade sharing a, every old clique contains at most one of b,c and at most one of d,e, and cannot contain a with any of these four vertices. It thus contains at most one old cross edge J between{b,c} and{d,e}. If a core two-packing avoids a restored base, an outside page on that base is edge-disjoint from it. A component footprint consists of at most one J edge and at most one page spoke; coexistence forces their shared terminal endpoint. Nonincidence would require one of the six edges absent in H. This proves the star-of-size-at-most-two footprint bound for arbitrary outside attachments, rather than extrapolating from the five-vertex core.

The six cross-graph types are exhaustive under the stated symmetries. I checked the exceptional steps:

- One cross edge bd, two K4 page families: acx,dey,abd remain edge-disjoint when x=y. Among supported old edges ax,cx,dy,ey,bd, the only possible two-edge same-block footprint is bd withdy; all other pairs require an absent old terminal edge.
- Two adjacent cross edges bd,be: the internal page bde forces the U family to be a de-book under q_U=1, since ab is absent in H. The supplied three-edge covers are complete.
- Two disjoint cross edges bd,ce: core triangles abd,ace avoid bc,de. Therefore their outside pages are excluded by the proved compatibility fact; internal pages on these bases are absent literally. Both families are spoke-base books, and three edges cover their pages and mixed triangles.
- Three cross edges: each listed core two-packing is literal and avoids the claimed base(s). Thus all outside pages are excluded. In K5-ce, {ab,de,cd} indeed meets all seven actual triangles.
- Four cross edges: K5 two-edge avoidance (in particular one-edge avoidance) excludes all outside pages. Any supported cross edge belongs to a minimum old cover and a minimum K5 cover, saving one added edge. If none is supported, every core edge is disjoint from old triangle support, so the new K5 is a separate triangle component. All mixed and ordinary new triangles have already been accounted for.

Thus the lower branch yields only B graphs.

## Upper equality branch

The cover value2m+6 forces each restored edge to have a bare ordinary page relative to H. If one had none, the all-page footprint lemma would give a minimum H-cover hitting all of its ordinary pages, and adding the other five restored edges would cover every remaining new triangle. This includes mixed triangles and triangles containing multiple restored edges.

Exact additivity forces q_T,q_U<=2. Choosing a bare page on each of three bases cannot yield three distinct apices; otherwise those pages form a three-matching. Repetition across two bases gives a full apex with all three old spokes background. This is a valid all-size conclusion.

For disjoint central triples, equality forces both new families to be the exceptional K5-e family and every old spoke to be background; a supported spoke could be shared between a minimum old cover and a three-edge new-family cover to save one. The four-page packing with labels a0,a1,a2 andb0,b1,b2 works even when full apices belong to the opposite central triple. A shared cross-family edge would require the same indices for its inclusion in the A page and opposite indices for its inclusion in the B page. Those requirements cannot both hold. Shared apices outside both triples cause only vertex intersections. Thus all four pages append to an old maximum packing, contradicting m+3.

For a shared central vertex and no cross edge J, the corresponding four pages abx1,bcx2,dey1,ady2 are edge-disjoint after choosing y2!=x1. The only possible cross-family old-edge collision is the a-spoke of the first and fourth pages. All four apex vertices lie outside the five-vertex core because the common terminal has no old edge to the four others.

For nonempty J, the full bare apices x,y are distinct: equality would create an old triangle along a cross edge and two allegedly background spokes. Fixing bd, an extra outside U page aez ordez with z!=y gives the displayed four-packing with a mixed triangle abd and bare pages at x,y. The old supported footprint reduces to bd and the two spokes atz. It is at most a star of two edges in each old block: bd can coexist only withdz, and page spokes cannot coexist because their base is absent. These packings are still valid when z=x.

Therefore all extra outside U pages must use base ad for the fixed cross edge bd. Applying that fact to all J edges either confines extra pages to one spoke base, covered with the opposite bare spoke, or excludes all extra pages and leaves only bare pages plus internal de-pages, covered by{de,ay}. In either case the U family has a two-edge cover. Adding all three T edges and a minimum H-cover covers every G-triangle with2m+5 edges. This excludes the upper equality branch.

## Scope and additional exact corollary

The theorem applies to two actual edge-disjoint restored triangles, which may share a vertex. It does not apply to arbitrary six added edges or to triangles sharing an edge. It has no bounded-order, sparsity, minimum-CS or finite-census hypothesis.

A direct corollary is **CS for every graph with nu<=2**. Delete the support of a maximum packing: the residual is triangle-free, since any residual triangle would extend that packing. For a two-packing, apply the reviewed two-triangle restoration theorem to this triangle-free B residual. For a one-packing, apply the reviewed single-triangle theorem; the triangle-free case is vacuous. Consequently a tight graph with nu=2 has either one K5 triangle component or two K4 triangle components, with permitted vertex sharing/background subject to all actual triangles. This corollary is different from archived original H-D at nu<=2; the latter imposes its separate universal triangle-deletion premises. Historical priority remains unassessed.

The minimum-CS consequence is also valid: deleting two members of a maximum packing cannot leave a tight proper subgraph, since proper-subgraph CS would supply B and the theorem would restore CS. No theorem guaranteeing a tight residual has been proved. The global blocker/defect-one obligations remain open.

Reviewed frozen source SHA-256: `12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7`.
Review completed UTC: 2026-11-15T22:11:26.166992+00:00.
