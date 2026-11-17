> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Prior art — live

2026-11-15 primary-source intake:

- Gupta, arXiv2608.06538v1 (6August2026), https://arxiv.org/pdf/2608.06538 . PDF accessible this run. Section12 Question12.3 asks for degree<=7 equality and whether any7-regular equality graph exists. This is scoped context, not a proof input for R2/R1 or unrestricted equality. Earlier drafting PDF access failure no longer applies to this retrieval.
- Haxell,Kostochka,Thomasse, Packing and Covering Triangles in K4-free Planar Graphs, author manuscript dated21April2011, https://perso.ens-lyon.fr/stephan.thomasse/liste/packplanar.pdf . Introduction explicitly attributes the prior planar equality characterization to reference3, Cui,Haxell,Ma. Planarity remains essential to the attributed result.
- Original cited paper located at https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf ; reading its mechanism next. Do not replace actual triangle ownership by arbitrary edge-disjoint clique unions.
- Bibliographic DOI correction verified at https://crossmark.crossref.org/dialog/?doi=10.1007%2Fs00224-018-9860-7 and https://scholars.cityu.edu.hk/en/publications/covering-triangles-in-edge-weighted-graphs/ . Authors Chen,Diao,Hu,Tang. Metadata is not an inspected proof.

No historical originality claim for current restoration arguments. Further primary proof comparison remains active.

## Forest edge-list mechanism

The new independent-side forest packing application uses a self-contained unit-weight clique-block Hall argument. Its known source is Hilton–Johnson, *Extending Hall's Theorem* (1990), DOI10.1007/978-3-642-46908-4_41 (original publisher metadata inspected, original full chapter unavailable). The directly inspected author-hosted Cropper–Gyárfás–Lehel paper, *Edge List Multicoloring Trees: An Extension of Hall's Theorem*, JGT42 (2003),246–255, DOI10.1002/jgt.10093, states the unit case and proves a stronger weighted result: https://users.renyi.hu/~gyarfas/Cikkek/105_listmultihall.pdf . Exact hashes and attribution checks are in `notes/one_sided_forest_exact_packing_v1.md` and `literature/hall_forest/`. No novelty claim is made for Hall's lemma, and the weighted theorem is not an admitted new proof here.

Targeted searches for a Tuza theorem specifically phrased as a forest triangle-edge cover found no authenticated direct antecedent at this stage. This is an access/search record, not evidence of originality. The developing general forest-cover theorem uses a different, broader hypothesis than an induced forest core; its local proof must finish and receive review before admission.


Nomoto and van der Pol, *Tuza's conjecture for binary geometries*, arXiv:2112.06385v2 (23 May 2022), https://arxiv.org/pdf/2112.06385v2, supplies a cographic weighted theorem and credits Tuza's earlier crown method. Inspected Section3/Claim7.5 for the alternating reduction. No cographic-to-arbitrary-graphic implication is used. The local primary PDF is hashed in literature/nomoto_vanderpol_2112.06385v2/receipt.json. The current crown residual note is an ordinary unweighted reconstruction with a separate simultaneous-footprint boundary; it makes no novelty claim.

## Newly inspected colored-family exchange — 2026-11-16

Primary pages directly inspected: [Yi, arXiv2608.23010v1](https://arxiv.org/html/2608.23010v1), section2, and [Wang, arXiv2609.13831v1](https://arxiv.org/html/2609.13831v1), section2. Wang Lemma2.1 uses completeness of the actual one-red triangle family: a second surviving page and an unused opposite red edge create a two-for-one packing exchange. This is relevant to strict H-D's exact-one minimum-cover coloring. Its stated colored bound is8/3; the article reports a Lean formalization, which this mission has not reproduced or authenticated. Neither article supplies unrestricted Tuza or the mission's equality classification. Yi's2-colorable-family setup is broader than a complete induced one-red family; the distinction matters for the exchange. These are inspected mechanisms, not automatically imported global conclusions. No novelty claim follows from this targeted literature check.
