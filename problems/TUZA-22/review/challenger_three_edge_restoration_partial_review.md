> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: three-edge restoration reductions and three shapes

Verdict: ACCEPT, ORDINARY PROOFS at the stated shapes. Reviewer challenger,2026-11-16 UTC.

Frozen sources:
- notes/three_edge_restoration_boundary_v1.md, SHAbab074f216f8dfc641e02182f7bf2dfed8e69156093deef4c54c4b12e6166798;
- notes/three_star_edge_restoration_v1.md, SHAd5ceac18fb352cecf785237ca3c7d88a8c446730f2ee92b93a1e814941ebccb6;
- notes/three_path_edge_restoration_v1.md, SHAc3b4e1ad977eae97a1849a3812dd32e37f34533eeddfcef9b7ec77f8c7fdeaad;
- notes/three_matching_edge_restoration_v1.md, SHAebfa415056ec7cb38f4beb3a357b13dee4242c90066e12892eb722431a677f01.

I independently checked whole old-block footprints and the final actual-triangle audits. No finite computation or CS induction is used.

## Preliminary reductions

A new triangle appends to an old maximum B packing according to whether it has one, two or three restored edges. Tightness and the three-edge cover extension therefore force nu=m+1,tau=2m+2. For a pure new triangle, removing its edges leaves the same old B triangle support plus at most two nonedges; an additional new triangle there would append to an m-packing, contradicting the disjoint original triangle. The residual is therefore B, and the accepted R1 theorem applies literally. The two-edge intermediate argument also has the correct quantifiers: each is defect one if the final tight graph is non-B; no classification of arbitrary defect-one graphs is inferred.

## Star shape

Two disjoint ordinary pages on adjacent restored bases have a whole old footprint that is a two-edge star. A mixed pair can fail avoidance only in one old K4 on the three restored leaf endpoints and the ordinary apex. The pairwise-intersecting family reduction to a star or triangle of opposite old rims is exact, and the old-triangle case permits the stated one-edge cover extension.

Once the old K4 is present, the K5 two-edge-avoidance argument excludes every outside ordinary page while avoiding the only potentially shared old core edge au. If au is supported, prescribed minimum covers overlap on au and save one. Thus equality leaves exactly a new literal K5 replacing that K4, with all other old support separate. All new triangle types are included.

## P4 shape

I checked adjacent-base compatibility, the two mixed-pair restrictions, and the full elimination of ordinary middle pages, including all possible two-new-edge triangles. Both end families must be nonempty.

For disjoint end pages, the only possible opposite-spoke K4 is on{a,d,x,z}. The other three spoke pairings either force the missing middle base or trigger a mixed-pair restriction making the spokes incident. A subsequent end page's obstructing block contains the same supported edge ad, so it is the same old block. The WHOLE one-nonedge footprint property then forces that family's apex to be unchanged. This is stronger than a per-page footprint claim and is used correctly: two distinct page spokes in the same old clique would create an old triangle joining the missing endpoint to that clique. The resulting opposite old cover already covers both pages and contradicts tightness.

Hence every end-page pair intersects, forcing exactly abd and cda, plus the two actual two-new-edge faces. Any supported old K4 edge yields the stated cover saving; all three old edges must therefore be background. This gives precisely a new K4 with no outside new pages.

## Three-edge matching

The pair obstruction is exactly an opposite pair in an old K4. Three pairwise disjoint pages would require three distinct obstruction blocks; their distinct apices form an old triangle joining those blocks, impossible. The argument that two obstructions cannot coincide uses the unique opposite edge correctly.

For an intersecting pair abc,cda and a third page efx, all four possible selected-spoke combinations were checked. Shared-vertex combinations merge the blocks through the shared vertex and x; the disjoint bc/ad combination merges them through the old triangle acx. Only the common old edge ac survives, with opposite edge ex in one K4. Old triangle closure and the whole-base footprint then force every new family to be a singleton. The old opposite pair{ac,ex} covers all three new pages. Thus one restored base has no page, and removing it gives the accepted R2 situation.

These proofs cover the triangle (R1), star, P4 and three-edge matching shapes. They do not cover the disconnected P3+K2 shape, which remains separate until its own proof is supplied. All clique facts and R1/R2 are retained as their declared elementary/previously reviewed inputs.
