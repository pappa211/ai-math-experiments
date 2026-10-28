# TUZA-01: a triangle-deletion criterion for Tuza's conjecture

TUZA-01 proves a triangle-deletion criterion for Tuza's inequality: **if removing the three edges of a triangle leaves a 3-partite triangle hypergraph, then the original graph satisfies $\tau(G)\le2\nu(G)$.** It also establishes the OCT-at-most-four consequence and, by adapting Liu–Zeng's proof, a density corollary for each fixed $c\lt5/2$.

Read the complete paper: **[A Triangle-Deletion Criterion for Tuza's Conjecture via Equality in Ryser's Bound](manuscript/README.md)**. The archive provides [LaTeX](manuscript/TuzaTriangleDeletion.tex), [BibTeX](manuscript/references.bib), [Lean sources](lean/), and [reproduction instructions](reproduction/README.md). Generated PDFs are deliberately excluded from this text-only repository.

## Statement and source

Graphs are finite, simple, and undirected. A packing uses pairwise **edge-disjoint triangles**; a cover consists of **graph edges** meeting all triangles. Let their extremal sizes be $\nu(G)$ and $\tau(G)$. The vertices of the triangle hypergraph $\mathcal D(G)$ are graph edges; its hyperedges are the edge sets of graph triangles.

The principal manuscript theorem is:

> Let $T$ be a triangle of $G$ and $H=G-E(T)$. If $\mathcal D(H)$ is 3-partite, then $\tau(G)\le2\nu(G)$.

Three-partiteness means three edge labels, rainbow on every triangle. Tuza's inequality is known for triangle-3-colorable graphs, including four-colorable graphs. The criterion extends those cases by allowing the three edges of a triangle to be restored to such a remainder; no ordinary four-coloring is required by its hypothesis.

The ordinary proof derives the criterion from [Aharoni's published bound](https://doi.org/10.1007/s004930170001) and the [Haxell–Narins–Szabó equality characterization](https://doi.org/10.1016/j.jcta.2018.04.004). In the critical equality case, HNS supplies edge-disjoint $K_4$ copies in the remainder. Selecting a face of each outside the deleted triangle's vertices gives one maximum packing compatible simultaneously with every triangle introduced by restoring $T$. The manuscript proves the extraction, graph translation, and lifting argument in full.

Consequences in the manuscript:

- If the **vertex** odd-cycle transversal number is at most four, then $\tau(G)\le2\nu(G)$.
- Adapting [Liu–Zeng, arXiv:2610.15539v1](https://arxiv.org/abs/2610.15539v1), for each **fixed real** $c\lt5/2$ there is $N(c)$ such that every $n\ge N(c)$ and every $n$-vertex graph with $e(G)\ge n^2/4-cn$ satisfies the inequality. The endpoint $c=5/2$ is not established. This derived corollary uses that preprint's argument and published fractional-packing approximation.

## Frozen mathematical definition

The Lean theorem files, root import file, toolchain, Lake configuration, and transitive lockfile are byte-identical to Validation V1. [Source provenance](reproduction/SOURCE_PROVENANCE.json) records original hashes and publication transformations; the [publication manifest](reproduction/PUBLICATION_MANIFEST.md) explains the selection. The later [editorial revision](reproduction/EDITORIAL_REVISION.md) changes presentation while preserving the mathematical content and earlier evidence.

`triangles G` is the full finite set of three-cliques. `nu` and `tau` are attained finite extremal parameters. `Tuza.graph_min_cover` proves that a minimum cover can consist entirely of actual graph edges. `deleteTriangle G U` removes exactly the three edges of the assumed three-clique. `OCTAtMostFour` means deletion of at most four vertices leaves a two-colorable induced complement.

## Formal proof status

`Tuza.triangle_deletion` and `Tuza.oct_four` are kernel-checked **conditional deductions**. Both take explicit `AharoniInput` and `HNSInput` hypotheses. The latter includes the home-base extraction and graphical loose-cycle-to-$K_4$ consequence, which are justified in ordinary mathematics but remain outside the Lean proof boundary. The deep input theorems themselves have not been formalized or discharged here.

The new face selection, simultaneous packing compatibility, arbitrary-family two-edge cover, strict/equality case split, and OCT-four reduction are proved. Axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`; this does **not** discharge parameterized hypotheses. The density corollary is not Lean-formalized. See the [executed checks](reproduction/VERIFIED_RESULTS.md) and [exact declaration output](reproduction/lean-declarations.txt) for the precise verification scope.

## Computational evidence

[Small exact checks](experiments/) reproduce $K_4:(\nu,\tau)=(1,2)$, $K_5:(2,4)$, and $C_5:(0,0)$, plus a rainbow-label witness for a triangle-deleted remainder that is not four-colorable. These corroborate finite definitions and examples; the theorem is established by the manuscript's mathematical proof.

## Mathematical observations and rejected approaches

The archive explains why fractional equality cannot be inferred from integer equality, why arbitrary old maximum packings need not work, and why a finite-mask optimization is not a finite kernel. See [limitations and failed routes](research-notes/LIMITATIONS_AND_FAILED_ROUTES.md).

## Verification, attribution, and research provenance

This is AI-assisted research that has not undergone external specialist review or peer review. Recorded searches found no exact prior equivalent; originality and priority are not established. The general Tuza conjecture remains open. The [source comparison](reference/README.md), [historical novelty findings](research-notes/NOVELTY_REVIEW.md), and [publication search record](reference/PREPUBLICATION_CHECK.md) preserve the search scope and limitations. Known coloring results, the intersecting-family lemma, and earlier graphical/fractional equality arguments are attributed in the paper.

Phase 1 and Validation V1 took place on 27–28 October 2026 UTC. Manuscript preparation included separate mathematical and publication/reproduction critics. The [sanitized findings](reports/) and [critical reviews](research-notes/) preserve that internal evidence; no human author, affiliation, expert reviewer, or unsupported model configuration is asserted. The editorial revision relocates and consolidates these disclosures without changing the proof or the Lean trust boundary.

## Reproduction

Follow the [clean-checkout guide](reproduction/README.md). It records exact pins, commands, resource limits, cache reuse, source checks, PDF preparation, and the actual scope of repetition. No SSH access to private research infrastructure is needed.
