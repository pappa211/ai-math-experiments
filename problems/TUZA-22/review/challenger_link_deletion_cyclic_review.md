> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction: no tree component after deleting a link vertex

Decision: ACCEPT USING DECLARED INPUTS at the global or hereditary-class minimum-CS scope. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Primary frozen note: notes/link_vertex_deletion_cyclic_components_v1.md, SHA2561369c2ed436c3d3f166e5dc2b27df57dd9d98ccd08ac60a07eef47310b629791.

I read the entire frozen argument and its nonperfect-forest v2 selection dependency. The new localization is valid; the boundary vertex is present in every cover tuple actually imported.

For a component F of L-w, codegree at least two rules out singleton F and forces every F-leaf adjacent to w. No F-vertex has a link neighbor outside U=V(F) union {w}. The perfect branch correctly passes to G-vw and invokes the newly reviewed defect-one closed-tree theorem, rather than applying a closed-link cover tuple across an uncontrolled boundary.

In the nonperfect branch, deleting all v-spokes to U includes vw. A lost triangle using vw can extend outside U, but the selected spoke vw covers it because w belongs to Q. All other removed-spoke triangles stay in U, and a deleted rim edge covers all its outside pages. The residual is therefore genuinely balanced and tight before B is inferred.

The complete block footprints in both augmentation forms survive localization. A literal residual block has at most three U-vertices because L' has no K4. An internal rim triangle contributes at most one surviving edge, as its deleted matching edge prevents a clique from containing the other two. A matching contributes at most one; if these were disjoint there would be four U-vertices. For a safe external page, its apex is outside the entire hub neighborhood: outside-U link neighbors of its F endpoints are prohibited. A block containing a page endpoint cannot contain three U-vertices because that endpoint belongs to no L' triangle. The complete footprint is consequently an adjacent pair or smaller, as required.

The v2 forest proof supplies the listed alternatives using only the forest and leaf-neighbor conditions. Its sole use of small closed-link order in the relevant selection is the P3 case, now treated separately. Every imported tuple explicitly has Q containing w.

I checked both P3 cases literally. For the four-cycle, the alternate matching avoids the deleted base and an external page has a two-edge-star footprint because residual cliques contain at most two U-vertices. For the diamond with an outside link neighbor d, the three triangles vab,wbc,vwd are edge-disjoint. Their surviving footprints are empty, {wb,bc}, {vd,wd}; the missing edges wc,vw,vb,vc exclude every simultaneous pair except {wb,wd}. Thus no opposite K4 pair or larger footprint is overlooked. If d does not exist, the diamond is a closed four-vertex link component and the declared robustness input applies.

The conclusion is exactly that every nonempty component of L_G(v)-w contains a cycle. It does not assert that such a component must be present in an arbitrary link, and no unrestricted-CS conclusion follows without an availability bridge. Dependencies remain M0/codegree/robustness, two-edge resilience, the reviewed defect-one theorem, and the self-contained nonperfect forest selection. No computational evidence is a premise.
