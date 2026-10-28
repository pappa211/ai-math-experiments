# Validation V1: sanitized findings

Validation V1 independently reconstructed the fixed Phase 1 argument and added a conditional Lean proof. It did not reprove the deep published inputs, obtain specialist review, certify novelty, or formalize density. The original private record is preserved; hashes and publication transformations are in [SOURCE_PROVENANCE.json](../reproduction/SOURCE_PROVENANCE.json).

| Question | Finding and scope |
|---|---|
| Triangle-deletion proof | No gap found in the ordinary deduction from Aharoni and HNS. The exact theorem is the principal result in the manuscript, with no vertex-coloring or graph-order restriction. |
| Equality input | The HNS home-base partition and three saturating auxiliary matchings supply `nu` disjoint loose-cycle supports. Three graph triangles in each support give all six edges of a $K_4$. Copies are graph-edge-disjoint, not necessarily graph-vertex-disjoint. |
| Crucial packing step | The deleted triangle's vertices are independent in the remainder. A face of each $K_4$ avoids this independent set, yielding one maximum packing compatible simultaneously with every new triangle. |
| Auxiliary cover lemma | Valid for arbitrary pairwise edge-intersecting triangle subfamilies, not just full triangle hypergraphs. It is a known result and is not claimed as new. |
| Boundary cases | Strict slack uses integrality; equality uses the compatible packing; zero old packing uses the empty packing. OCT-four includes all configurations of a transversal of size at most four. |
| Density adaptation | The audited proof supports every fixed real $c<5/2$ and sufficiently large order depending on $c$. Small packing is `nu ≤ n^(2/3)`, including equality. No endpoint or uniform threshold claim. |
| Lean | `Tuza.triangle_deletion` and `Tuza.oct_four` are proved conditionally on `AharoniInput` and `HNSInput`. Actual graph packing/covering parameters and the full elementary deduction are checked. |
| Axioms | The audited declarations use only `propext`, `Classical.choice`, `Quot.sound`. Named external hypotheses remain mathematical obligations despite this report. |
| Novelty | No exact predecessor or subsuming theorem was found in bounded source-based searches. Originality remains open; lack of external specialist review is explicit. |

The exact deep sources are Aharoni (2001) and HNS (2018). For HNS use the 18 March 2018 author manuscript, Theorem 1.1, Definitions 7.1–7.4 and Proposition 7.5; the earlier structural arXiv text uses different numbering. The ordinary audit derives the home-base-to-loose-cycle and graphical conversion. These remain included in external `HNSInput` in Lean. No stronger equality classification is required.

The density argument uses the Liu–Zeng v1 preprint, finite LP duality, and published fractional-packing approximation, with Yuster Theorem 1.2 supplying an accessible alternative to Haxell–Rödl. The manuscript retains the unchanged large-packing branch, verifies the new middle-case estimate, and derives the explicit small-case bound

$$
(s/2-c)n\le104,029,803n^{2/3}+200\sqrt{10n}+1,034,950.
$$

For each fixed $c<5/2$, this eventually forces $s\le4$ in the reduced graph. The edge-count hypothesis alone does not imply small OCT in the original graph.

The compiler is Lean 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`; Mathlib is `0df444a360eaa60ab8c11dca51a86af692955474`. The exact toolchain/configuration/lockfile and eight Lean files are retained unchanged. Public build wrappers replace private cache and executable defaults with local Lake resolution and portable Python timeouts. [Fresh publication reproduction](../reproduction/VERIFIED_RESULTS.md) is separate from historical Validation V1 success.

Exact sanity checks include $K_4:(\nu,\tau)=(1,2)$, $K_5:(2,4)$, $C_5:(0,0)$; the Lean checks use kernel `decide`, not native evaluation. The Python Mycielski example corroborates that the remainder need not be four-colorable. Earlier enumeration checked four-colorable remainders and thus only a subclass of the full hypothesis. No finite experiment is a premise of the infinite theorem.

The archives remain unchanged. This public selection omits private infrastructure details, raw logs, application metadata, third-party full texts/images, cache artifacts, and private Git history. Historical recommendations for further work are not presented as completed review.
