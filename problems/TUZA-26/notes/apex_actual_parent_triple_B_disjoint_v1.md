> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent all-double-defect-two branch: a disjoint-pair payment

Status: ordinary proof candidate, sent for independent review. No numerical work. This is an exact exclusion inside the triple-residual alternatives of apex_actual_parent_triple_selection_v1.md, not a claim that a defect-one double residual is available.

## 1. A reusable six-edge restoration lemma

Let B have literal K4/K5 triangle components, nu(B)=m and tau(B)=2m, retaining all old background and vertex intersections. Let T,U be vertex-disjoint missing triangles. The following exact interface is impossible:

    nu(B+T)=nu(B+U)=m+2,
    tau(B+T)=tau(B+U)=2m+2,
    nu(B+T+U)=m+3,
    tau(B+T+U)=2m+5.                              (1)

This follows from the same complete ordinary-family payment as apex_actual_parent_disjoint_restoration_v1.md, now without its additional restored edge. The proof is included to make that change of interface explicit.

The exact one-triangle packing theorem says the complete new triangle families N_T,N_U have packing number two. Each has a two-edge cover unless it is precisely K5-e on its restored triangle and two full apices. In either case it can be covered at incremental cost two above some minimum B cover. For the exceptional family, the assumed tau(B+T)=2m+2 forces a supported old spoke; choosing an old minimum cover through that spoke and a minimum three-edge family cover through the same spoke gives the two-edge increment.

If one family has a two-edge cover, choose the old minimum B cover needed for the other's two-edge increment. Add those two covers. Their total size is at most 2m+4. Every new triangle belongs to one of these two families, because no triangle can contain one T edge and one U edge when their terminal triples are vertex-disjoint. This contradicts (1).

Thus both families are exceptional, with nonempty supported-spoke sets S_T,S_U. If some s in S_T and t in S_U belong jointly to a minimum B cover, use the corresponding two incremental edges for each family, again giving 2m+4.

Otherwise every cross pair s,t consists of distinct adjacent edges of the same old K4. This is the only jointly ineligible supported-edge pair in literal B: components choose covers independently, opposite K4 edges form a minimum cover, and any two K5 edges extend to a minimum four-edge cover.

An old clique contains at most one spoke of an exceptional family. It contains at most one restored terminal, as the three terminal bases are absent; and at most one of the two full apices, since an old edge between those apices together with their full spokes would force missing terminal bases inside one old clique. Fixing t and then s therefore forces

    S_T={s}, S_U={t},

where s,t are adjacent in one K4. Every other spoke of both families is background.

The archived four-page construction supplies two pages from each family with all four edge-disjoint even under reciprocal terminal/apex identifications. Explicitly label terminals a0,a1,a2 and b0,b1,b2 so that a T apex lying in U is x_i=b_i and a U apex lying in T is y_j=a_j; take

    a0a1x1, a0a2x2, b0b2y1, b0b1y2.

Across the families, a common edge would require both reciprocal identifications. The T page uses that edge only for i=j and the U page only for i!=j, so none occurs. The total supported old footprint lies in the adjacent pair {s,t}. A maximum packing of its old K4 avoids that pair; all other old cliques use unrestricted maximum packings. The four pages append to give m+4, contradicting (1). This proves the lemma with all crossing pages retained.

## 2. Exact actual-parent consequence

Assume the actual minimum-CS parent G has nu(G)=k,tau(G)=2k and every double-triangle residual has defect two. Fix three edge-disjoint actual triangles T,U,V and put S=G-T-U-V.

If S has nu(S)=k-4 and defect zero, proper CS makes S literal B. With m=k-4, each single restoration S+A has parameters (m+2,2m+2), by pair extension and the all-double-defect-two assumption. Each two-triangle restoration S+A+B is an actual single-triangle residual of G, with parameters (m+3,2m+5).

Consequently no two of T,U,V can be vertex-disjoint: they would satisfy the impossible interface (1). The low-packing tight row is therefore excluded whenever the prescribed triple includes a vertex-disjoint pair.

For a surviving triple in this row, each pair intersects in exactly one vertex. There are only two possible intersection patterns (not two classified restoration graphs):

1. all three triangles share one common vertex, with their other six vertices distinct;
2. their three pairwise intersections are distinct, giving three triangles on six vertices, such as abx,bcy,caz.

This elementary dichotomy follows because a triangle containing two of the pairwise intersections has exactly one remaining vertex, and edge-disjointness forbids any additional identification.

No assertion about the complete old cross graph or outside pages in those two patterns is made. Their B restoration cube, and the other four triple profiles, remain OPEN here. In particular this payment does not select a defect-one DOUBLE residual and does not transfer minimum-Q hypotheses.

## 3. Dependencies and precise progress

The one-triangle family classification and four-page construction are TUZA22 notes/two_triangle_restoration_v1.md, Sections1 and6 (SHA12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7), with its archived independent review. The exact old K4/K5 cover facts are elementary and used explicitly above. The current disjoint critical-square source supplied the proof pattern, but its extra-edge hypotheses are not assumed.

The proved operation is an actual cover saving to 2m+4 OR a packing augmentation to m+4 in the displayed six-edge interface. Its application removes one exact triple-residual row when a disjoint pair is supplied. Global selection and the two remaining intersection patterns are not proved.
