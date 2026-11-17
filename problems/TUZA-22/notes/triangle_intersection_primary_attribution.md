> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Primary attribution and exact scope of triangle-intersection mechanisms

Frozen 2026-11-16. Provenance supplement; this does not change frozen proofs or their dependency labels. No novelty claim.

## Perfect triangle graphs

Aparna Lakshmanan S., Csilla Bujtás and Zsolt Tuza, *Induced cycles in triangle graphs*, Discrete Applied Mathematics 209 (2016), 264–275, DOI [10.1016/j.dam.2015.12.012](https://doi.org/10.1016/j.dam.2015.12.012). The authenticated author manuscript is [arXiv1410.8807v3](https://real.mtak.hu/39565/1/1410.8807v3.pdf), updated17October2015, 27pages. Printed p24 Theorem18 proves Tuza for perfect actual triangle-intersection graphs by a minimum clique cover: common-edge cliques cost one edge, K4 cliques cost two. The theorem itself does not state the equality classification. Thus the inequality mechanism of `perfect_triangle_intersection_cs_v1.md` is already published. Our directly reconstructed overlap saving supplies its stated equality conclusion, without claiming historical novelty. The same paper notes Puleo's broader odd-wheel-free inequality class.

Preserved PDF `literature/triangle_intersection_primary/lakshmanan_bujtas_tuza_1410.8807v3.pdf`, SHA256 `3c9ee73727a51a4de70c82326291f0d5cb151a4eb719083ac276138347534633` (237129bytes). The frozen ordinary proof remains self-contained through the reviewed elementary perfect-graph minmax; it does not import the paper's strong-perfect-graph characterization.

## Flat graphs, not just planar graphs

Penny Haxell, Alexandr Kostochka and Stéphan Thomassé, *Packing and Covering Triangles in K4-free Planar Graphs*, Graphs and Combinatorics28 (2012), 653–662; published online11August2011, DOI [10.1007/s00373-011-1071-9](https://link.springer.com/article/10.1007/s00373-011-1071-9). The [author-hosted accepted manuscript](https://kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf) is dated21April2011. Printed p2 Theorem2 explicitly proves tau<=3nu/2 for K4-free flat graphs, where flat means each actual edge belongs to at most two triangles. Equality consists of edge-disjoint 5-wheel triangle components and triangle-free background. This hypothesis is distinct from the planar hypothesis in Theorem1.

Printed pp2–5 derive the triangle-intersection matching representation, actual K4/C5 closure, and the bound using Tutte decomposition and the 5n/14 independence theorem. The exceptional eleven-vertex graph Q is excluded by actual 5-wheel geometry. The appendix uses a finite Ramsey-extremal classification; that classification has not been independently regenerated here. We authenticate the exact theorem and inspect its mechanism, without promoting the entire theorem to a newly reconstructed ordinary proof.

Preserved PDF `literature/triangle_intersection_primary/haxell_kostochka_thomasse_plan_ht.pdf`, SHA256 `a6f0d975820a34ace112bb5db41bae0c77d5bc9f4c2da590ea612b2ba3d465b4` (150722bytes,10pages). Download receipts and extracted text are alongside both PDFs. No source file was modified.

## Quantitative consequence at the declared-input boundary

For any flat graph G, every literal K4 triangle support is isolated: each of its edges already has its two internal triangles. Remove all these supports, leaving H. Write b for their number and p=nu(H). Actual triangle components are additive, so

    nu(G)=b+p, tau(G)=2b+tau(H), d=2nu(G)-tau(G)=2p-tau(H).

The exact HKT flat theorem gives d>=p/2, hence p<=2d. This is a quantitative bound on the total non-K4 packing, for any defect d, without planarity. At d=1 it gives p<=2, an alternate shortcut to the accepted codegree-two defect-one classification. The existing proof `codegree_two_defect_one_classification_v1.md` remains unchanged and retains only its explicitly declared Staton and Tutte–Berge inputs; its small terminal classification was directly reconstructed and does not depend on HKT's Q appendix.

This result does not imply flatness of an unrestricted graph or of its near-tight residual. It supplies a scoped quantitative structural input, not the missing global decomposition.
