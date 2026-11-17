> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the double-K4 triangle restoration module

Reviewer: restoration agent, 2026-11-16. Result: ACCEPT the ordinary strict-restoration theorem at its exact stated hypotheses.

Reviewed `notes/two_edge_glued_k4_triangle_restoration_v1.md`, SHA20324b2731aa35b53f95699be4f62eb77da49ca8c32afca4d0662d9f436f7fd4.

I independently reconstructed the lower/upper bounds and the complete incidence-to-core reduction. Three incidence-matched pages have at most a two-edge star in each old clique and in either chosen D petal; choosing ONE petal triangle therefore really gives m+4. The accepted q<=2 page-incidence classification then supplies the exact K5-e family, since a two-edge family cover is too small. Prescribing one old B spoke in both covers produces the recorded saving and cleanly separates all old B supports from the active D+N graph. Every actual triangle in that support is audited.

The two full apices cannot be adjacent, because their three old triangles would put the independent terminal triple into one old component, while D has independence number two and each B clique has independence number one. With at most one apex in D, an outside-D terminal exists and the selected two N pages have at most one entire D-edge footprint; the direct D two-packing avoiding any prescribed single edge checks. With both apices in D, nonadjacency places them in opposite petals, their common D-neighbors are exactly the shared-edge endpoints, and independence permits at most one terminal there. The displayed four-edge D cover and three-edge N cover overlap in exactly the needed two spokes and give five, contradicting six.

No finite small-packing theorem is needed. The proof establishes strict Tuza for the entire stated B-plus-D-plus-missing-triangle class, including all outside attachments and background edges.

I also checked the invocation of my `triangle_and_edge_restoration_v1.md` in `hd_two_missing_survivors_exclusion_v1.md` Section3. Under that assembly's supplied exact book-state description, deleting the bad spine leaves B, the bad spine already creates its displayed triangles before the singleton triangle is restored, and it is distinct from the singleton's missing edges. Thus that use satisfies the theorem's explicit triangle-creating-edge hypothesis; there is no automatic transfer from a differently quantified H-D premise. This paragraph is a scope check of that invocation, not an independent rereview of every earlier Wang/book decomposition dependency.
