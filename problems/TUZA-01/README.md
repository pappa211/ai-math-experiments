# TUZA-01: a triangle-deletion criterion for Tuza's conjecture

**Outcome: unrefereed proof manuscript; conditional Lean checking; novelty unconfirmed.** No external specialist review has occurred. The general Tuza conjecture remains open.

Read the complete paper: **[A Triangle-Deletion Criterion for Tuza's Conjecture via Equality in Ryser's Bound](manuscript/README.md)**. The archive provides [LaTeX](manuscript/TuzaTriangleDeletion.tex), [BibTeX](manuscript/references.bib), [Lean sources](lean/), and [reproduction instructions](reproduction/README.md). Generated PDFs are deliberately excluded from this text-only repository.

## Statement and source

Graphs are finite, simple, and undirected. A packing uses pairwise **edge-disjoint triangles**; a cover consists of **graph edges** meeting all triangles. Let their extremal sizes be $\nu(G)$ and $\tau(G)$. The vertices of the triangle hypergraph $\mathcal D(G)$ are graph edges; its hyperedges are the edge sets of graph triangles.

The principal manuscript theorem is:

> Let $T$ be a triangle of $G$ and $H=G-E(T)$. If $\mathcal D(H)$ is 3-partite, then $\tau(G)\le2\nu(G)$.

Three-partiteness means three edge labels, rainbow on every triangle. It requires no ordinary four-coloring. The ordinary proof uses [Aharoni's published bound](https://doi.org/10.1007/s004930170001) and the [Haxell–Narins–Szabó equality characterization](https://doi.org/10.1016/j.jcta.2018.04.004), with the full extraction and graphical translation explained in the manuscript.

Consequences in the manuscript:

- If the **vertex** odd-cycle transversal number is at most four, then $\tau(G)\le2\nu(G)$.
- Adapting [Liu–Zeng, arXiv:2610.15539v1](https://arxiv.org/abs/2610.15539v1), for each **fixed real** $c<5/2$ there is $N(c)$ such that every $n\ge N(c)$ and every $n$-vertex graph with $e(G)\ge n^2/4-cn$ satisfies the inequality. The endpoint $c=5/2$ is not established. This derived corollary depends on that preprint's argument and published fractional-packing approximation; it is **not Lean-formalized**.

## Open-status check

The [source comparison](reference/README.md), [historical novelty findings](research-notes/NOVELTY_REVIEW.md), and [publication version/search check](reference/PREPUBLICATION_CHECK.md) record the sources, dates, and limitations. No exact prior equivalent was found in the bounded searches. This is not a certification of originality, priority, or worldwide bibliographic completeness. Known triangle-3-colorable and four-colorable results, the intersecting-family lemma, and earlier graphical/fractional equality arguments are explicitly attributed.

## Frozen mathematical definition

The Lean theorem files, root import file, toolchain, Lake configuration, and transitive lockfile are byte-identical to Validation V1. [Source provenance](reproduction/SOURCE_PROVENANCE.json) records original hashes and every publication transformation; the [publication manifest](reproduction/PUBLICATION_MANIFEST.md) explains the selection.

`triangles G` is the full finite set of three-cliques. `nu` and `tau` are attained finite extremal parameters. `Tuza.graph_min_cover` proves that a minimum cover can consist entirely of actual graph edges. `deleteTriangle G U` removes exactly the three edges of the assumed three-clique. `OCTAtMostFour` means deletion of at most four vertices leaves a two-colorable induced complement.

## Research sessions and model configuration

Phase 1 and Validation V1 were AI-assisted investigations on 27–28 October 2026 UTC. This publication preparation on 28 October produced a scholarly manuscript and independently assigned mathematical and publication/reproduction critics. The [sanitized research findings](reports/) preserve the evidence and limitations; [critical reviews and failed routes](research-notes/) preserve distinctions and rejected shortcuts. Agent agreement does not replace a proof. No unsupported model or reasoning configuration, human byline, affiliation, or expert reviewer is asserted.

## Formal proof status

`Tuza.triangle_deletion` and `Tuza.oct_four` are kernel-checked **conditional deductions**. Both take explicit `AharoniInput` and `HNSInput` hypotheses. The latter includes the home-base extraction and graphical loose-cycle-to-$K_4$ consequence, which are justified in ordinary mathematics but remain outside the Lean proof boundary. The deep input theorems themselves have not been formalized or discharged here.

The new face selection, simultaneous packing compatibility, arbitrary-family two-edge cover, strict/equality case split, and OCT-four reduction are proved. Axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`; this does **not** discharge parameterized hypotheses. No density formalization, independent proof kernel, or external specialist verification is claimed. See the [executed checks](reproduction/VERIFIED_RESULTS.md) and [exact declaration output](reproduction/lean-declarations.txt).

## Computational evidence

[Small exact checks](experiments/) reproduce $K_4:(\nu,\tau)=(1,2)$, $K_5:(2,4)$, and $C_5:(0,0)$, plus a rainbow-label witness for a triangle-deleted remainder that is not four-colorable. These corroborate definitions and examples; they do not prove the infinite theorem or certify novelty. Broad Phase 1 enumeration is not repeated ceremonially.

## Mathematical observations and rejected approaches

The useful equality consequence is a packing of edge-disjoint $K_4$ copies. A face of each avoids the independent set formed by the deleted triangle's vertices; the same fixed packing avoids every new triangle simultaneously. Fractional equality cannot be inferred from integer equality, arbitrary old maximum packings need not work, and a finite-mask optimization is not a finite kernel. See [limitations and failed routes](research-notes/LIMITATIONS_AND_FAILED_ROUTES.md).

## Reproduction

Follow the [clean-checkout guide](reproduction/README.md). It records exact pins, commands, resource limits, cache reuse, source checks, PDF preparation, and the actual scope of repetition. No SSH access to private research infrastructure is needed.

## Final outcome

The archive presents an ordinary mathematical deduction from named published inputs, a detailed preprint-dependent density adaptation, and conditionally checked Lean deductions. It is an unrefereed research manuscript with unconfirmed originality, not a resolution of the general conjecture. No external specialist review, journal/arXiv submission, or GitHub Release accompanied this publication.
