# TUZA-06: equality in Tuza’s inequality for five-degenerate graphs

**AI-developed mathematical research report — AI Math Experiments**

The mathematical development, proofs, code, formalization, manuscript and internal reviews were produced through AI systems. The human participant supplied goals, budgets, coordination and authorization.

For every finite simple 5-degenerate graph $G$,

$$\tau(G)\le 2\nu(G),$$

with equality if and only if every nonempty triangle component, connected through shared **graph edges**, has edge support exactly $K_4$ or $K_5$. Here $\nu$ is the maximum number of edge-disjoint triangles and $\tau$ is the minimum number of graph edges meeting every triangle. Graph order and maximum degree are unrestricted. Empty graphs, triangle-free graphs, triangle-free background edges and clique blocks sharing vertices are included.

- [Complete paper: PDF](../../papers/tuza-five-degenerate/main.pdf), [Markdown](../../papers/tuza-five-degenerate/main.md), [LaTeX](../../papers/tuza-five-degenerate/main.tex), [bibliography](../../papers/tuza-five-degenerate/references.bib).
- [Exact formal target and definitions](FORMAL_STATEMENT.md), [final proof/verification status](PROOF_STATUS.md), [main Lean theorem](lean/Tuza06/FiveDegenerate.lean), [definition source](lean/Tuza06/Statement.lean).
- [Portable reproduction instructions](REPRODUCTION.md), [source inventory](lean/SOURCE_HASHES.json), [original mathematical source freeze](notes/FINAL_PROOF_SOURCE_FREEZE.json).
- [Full consolidated ordinary proof](manuscript/THEOREMS_AND_PROOFS_REVISED.md), [credited short inequality route](manuscript/SHORT_CREDITED_INEQUALITY_PROOF.md), [attribution map](manuscript/ATTRIBUTION_MAP.md), [supporting notes](notes/README.md).
- [Curated TUZA-04 and TUZA-05 history](history/README.md), [failed approaches](FAILED_APPROACHES.md), [selected internal AI reviews](review/README.md).
- [Source-to-publication inventory](SOURCE_TO_PUBLICATION.json), [publication policy/provenance](PUBLICATION_PROVENANCE.md), [public file hashes](SHA256SUMS).

The declaration `Tuza06.five_degenerate_combined` has only `Degenerate G 5` as its substantive hypothesis, on an arbitrary finite vertex type. The formal development also proves the equivalence of the literal component condition with the edge-disjoint clique-block representation and proves the equality converse for arbitrary finite simple graphs. All 280 mathematical Lean modules preserve their frozen bytes; pinned Lean/Lake configuration is retained. Immutable definition-stage comments and the source-freeze record's historical PENDING field are superseded by the final status and actual publication reproduction evidence.

The principal contribution proposed here is the combined equality classification, with its complete proof and formalization. Earlier local inequality reductions are credited where used. Historical priority and external specialist peer review are not established. Mathematics, code, reviews and formalization were developed through AI systems; the human supplied goals, budgets, coordination and publication authorization.

This is separate from the [TUZA-01–03 triangle-restoration paper](../../papers/tuza-triangle-restoration/README.md). General Tuza, six-degenerate graphs, OCT-five, unrestricted restoration and the fixed-$c<3$ density extension are not established here. Mathematical facts and third-party literature remain subject to their own attribution and rights; see [notices](../../THIRD_PARTY_NOTICES.md).

The current [editorial artifact record](editorial/CURRENT_ARTIFACT.json) identifies the revised technical-report PDF. The earlier paper QA, publication review and publication-verification PDF hash remain dated historical evidence for the original release; the Lean sources and mathematical verification are unchanged. [Editorial release notes](editorial/README.md).
