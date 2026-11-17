> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# One-edge insertion into a classified resilient defect-one component

Frozen ordinary corollary,2026-11-16. Let J have ONE nonempty shared-edge triangle component, tau(J)=2nu(J)-1, single-edge packing resilience, and B(J-F) for some |F|<=2. Let e be a nonedge of J.

Then J+e satisfies strict Tuza except for the following exact equality case:

    the old triangle support is K5-f,
    e=f is its unique missing pair,
    and e creates no triangle outside those five vertices.

In that case the old component completes to K5 and equality holds. Arbitrary triangle-free background edges are permitted; the explicit outside-page condition is necessary.

Proof. Put p=nu(J). Cover extension gives tau(J+e)<=2p, while nu(J+e)>=p, so the inequality itself is immediate. If it is not strict, both quantities equal2p and p respectively. The graph J+e is B plus at most three restored edges, so the full R3 theorem gives B(J+e).

The entire old J triangle family is one shared-edge component. Its support must therefore lie inside ONE literal K4 or K5 block of J+e. In the exact two-edge-B classification, every root-K4-with-attachments form has at least six support vertices, so none can fit. The only remaining form is K5-f. Its five old vertices already occupy the entire possible K5 block, and the only absent pair needed to complete that support is f. Hence e=f, and no new triangle may have an outside vertex: it would share e with the new K5 and enlarge that triangle component beyond five vertices.

Conversely, completing the missing pair with no outside new triangle makes the unique nonempty triangle component a literal K5; background edges remain irrelevant. Thus equality holds. All other cases are strict.

This closes the unchanged-packing/one-unit-cover-increase insertion interface on the supplied two-edge-B representation. It does not prove that arbitrary connected resilient near-tight residuals admit that representation.

Dependencies: full ordinary R3, `three_edge_restoration_full_cs_v1.md`, SHAfba3658d1e537bd0a382f87a72971186fab892a1ba8772598de6b809d0f961e4; and the exact shared-edge classification, `resilient_defect_one_two_edge_B_classification_v2.md`, SHA95cc1d7859c32dc275e7766bfd139336a501b90513c16edac60b9e4615b53124. No new computation is used.
