> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent triple selection: exact profiles and a sharp cover control

Status: ordinary derivations, submitted for independent review. This note does not prove the existence of a defect-one double residual. No computation, no new model, and no naming of defect-two graphs is used.

## 1. Exact scope

Let G be the literal minimum-CS failure of the current actual-parent programme, with nu(G)=k and tau(G)=2k. Proper edge-subgraphs satisfy CS. The archived actual-parent extension theorem gives, for any two edge-disjoint actual triangles T,U,

    nu(G-E(T)-E(U)) = k-2.

The archived B-plus-two-triangle restoration excludes a tight double residual. Consequently its defect is 1 or 2. The new critical-double-residual theorem supplies single-edge resilience in the defect-one branch; it does not select that branch.

Here we examine the remaining possibility that EVERY edge-disjoint actual pair T,U has defect two, equivalently

    tau(G-E(T)-E(U)) = 2k-6.                         (A)

All background edges and all crossing triangles remain literal. No minimum-Q properties are assumed.

For any actual edge set F, the minimum size of a triangle cover of G required to contain F is exactly

    |F| + tau(G-F).                                 (1)

Indeed its part outside F covers G-F, and conversely F together with any cover of G-F covers G. Thus (A) says that every pair of edge-disjoint actual triangles is jointly contained in some minimum G cover. It does not prescribe a common minimum cover for three triangles.

## 2. The exact triple-residual alternatives

Fix three edge-disjoint actual triangles T,U,V and put S=G-E(T)-E(U)-E(V). They need not be vertex-disjoint.

Appending the three prescribed triangles gives nu(S)<=k-3. Adding their nine edges to a cover gives tau(S)>=2k-9. Proper CS then gives nu(S)>=k-4. No simultaneous extension of all three triangles has been assumed or proved.

There is also a useful strict cover bound. Every cover of S+V must use at least one edge of V to hit the actual triangle V; its remaining edges cover S. By (A),

    tau(S)+1 <= tau(S+V)=2k-6,

so tau(S)<=2k-7. The complete numerical possibilities are therefore:

| nu(S) | tau(S) | defect(S) | surcharge for requiring all nine triangle edges in a minimum-size G cover |
|---|---|---|---|
| k-3 | 2k-9 | 3 | 0 |
| k-3 | 2k-8 | 2 | 1 |
| k-3 | 2k-7 | 1 | 2 |
| k-4 | 2k-9 | 1 | 0 |
| k-4 | 2k-8 | 0, hence B | 1 |

The surcharge column is 9+tau(S)-2k by (1). These are necessary profiles, not existence assertions. In particular, the defect-one rows concern a TRIPLE residual and do not inherit the newly proved resilience theorem for DOUBLE residuals.

## 3. Actual-graph control: pairwise coeligibility does not select a common cover

Take G0=K9. Then tau(G0)=16. To see this directly, a triangle cover is the complement of a triangle-free spanning subgraph. For a triangle-free graph on n vertices with m edges, each edge ij has d(i)+d(j)<=n. Summing and applying Cauchy gives 4m^2/n<=sum_i d(i)^2<=nm, hence m<=n^2/4. A complete 4-by-5 bipartite graph attains 20 edges, proving tau(K9)=36-20=16.

Every edge-disjoint pair of actual K9 triangles is contained in a minimum cover. If the triangles share one vertex, place their five-vertex union in the five-vertex part of a 4+5 partition. If they are vertex-disjoint, place one triple in each part and distribute the remaining three vertices to obtain sizes 4 and 5. In each case the 16 within-part edges are the required cover.

Now choose three triangles ca1b1, ca2b2, ca3b3, with all seven displayed vertices distinct, and let p,q be the other vertices. Write F for their nine edges. The minimum K9 cover containing F has size EXACTLY 18.

Equivalently, the largest triangle-free subgraph of K9 avoiding F has 18 edges. First, any nonbipartite triangle-free graph on nine vertices has at most 17 edges. Take a shortest odd cycle, which is induced. For length 5 there are five cycle edges, at most eight edges from its four outside vertices to the cycle, and at most four edges among the outside vertices, totalling 17. For length 7 the analogous bound is 7+6+1=14. For length 9 there are only the nine cycle edges.

For a bipartite graph avoiding F, put c in part A and write b=|B|. If b is neither 4 nor 5, there are at most b(9-b)<=18 edges. If b is 4 or 5, B contains at least two of the six leaves ai,bi, since only p,q lie outside the windmill. Each leaf pair with at least one vertex in B contributes exactly two crossing edges of F: either the two center-leaf edges, or one center-leaf edge and its leaf-pair edge. At least one pair is represented, so at least two of the 20 possible cross edges are forbidden. Again the bound is 18.

It is attained by the bipartition A={c,a1,b1,a2,b2}, B={a3,b3,p,q}, taking all cross edges except ca3,cb3. Thus the constrained cover has size 36-18=18, a surcharge of two despite eligibility of EVERY edge-disjoint pair.

For completeness, nu(K9)=12: label the vertices by F_3^2 and take the three vertical affine lines and the nine affine lines y=mx+d, m,d in F_3. Each line is an actual triangle and each pair of vertices lies on exactly one line, so these twelve triangles partition all 36 edges. The edge count also proves the upper bound twelve.

This is a cover-side countercontrol only. K9 has defect 24-16=8, is not tight, and deletion of any edge prevents a twelve-packing. It does not refute a selection theorem using the full actual-parent hypotheses.

## 4. A parent-specific remaining discriminator

The low-packing tight row has an exact restoration cube. If S is B with nu(S)=m=k-4 and tau(S)=2m, then for each of the three restored triangles A,

    (nu(S+A), tau(S+A)) = (m+2, 2m+2),

by (A) and pair extension. For each pair A,B,

    (nu(S+A+B), tau(S+A+B)) = (m+3, 2m+5),

by the actual single-triangle-residual profile of G. Finally G has (m+4,2m+8). Thus the one-, two-, and three-triangle gains over B are exactly (2,2), (3,5), and (4,8).

Whether these simultaneous literal restorations force a cover overlap or a larger packing is OPEN here. The known theorem for B plus TWO triangles supplies CS but does not by itself exclude the intermediate gain (3,5). This is an actual-parent discriminator, not a licence to name the intermediate defect-two supports.

## 5. Provenance and implication boundary

Relied archived identities: TUZA-25 sources/tuza22_initial/9_two_triangle_extension_minimal_v1.md and its independently reviewed actual-parent extension; TUZA-22 notes/two_triangle_restoration_v1.md and review/two_triangle_restoration_independent_review.md. These paths are already in the scoped apex source manifest. The current critical-double-residual composition is used only for the statement that the defect-one DOUBLE branch is resilient; none of the profile or control derivations depends on that composition.

PROVED in this note: equivalence (A), the five necessary triple profiles, and the sharp actual K9 cover countercontrol. OPEN: selection of a defect-one double residual, simultaneous extension of every prescribed triple, and a paid contradiction for the restoration cube in Section 4. None is inferred from the control.
