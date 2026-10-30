# Equality in Tuza's Inequality for 5-Degenerate Graphs

**AI-developed mathematical research report — AI Math Experiments**  
Technical report · Editorial revision, 30 October 2026

The mathematical development, proofs, code, formalization, manuscript and internal reviews were produced through AI systems. The human participant supplied goals, budgets, coordination and authorization.

- [Read the revised technical report (PDF)](main.pdf) · [complete Markdown](main.md).
- [Self-contained LaTeX](main.tex), [bibliography](references.bib) and [labelled vector core diagram](final-core.svg).
- [Research and formal-verification archive](../../problems/TUZA-06/README.md), [exact theorem](../../problems/TUZA-06/FORMAL_STATEMENT.md), [verification status](../../problems/TUZA-06/PROOF_STATUS.md), [reproduction](../../problems/TUZA-06/REPRODUCTION.md).
- [Current artifact identity and editorial checks](../../problems/TUZA-06/editorial/CURRENT_ARTIFACT.json), [release notes and historical-artifact boundary](../../problems/TUZA-06/editorial/README.md).

The report characterizes equality in Tuza's inequality for every finite simple **5-degenerate** graph: $\tau(G)\le2\nu(G)$, with equality if and only if every nonempty triangle component connected through shared graph edges has literal edge support $K_4$ or $K_5$. Here $\nu$ counts edge-disjoint triangles and $\tau$ graph edges hitting every triangle. Order and maximum degree are unrestricted; empty/triangle-free graphs, background edges and blocks sharing vertices are included.

The inequality has a short deduction from published local reductions. The equality characterization needs the additional block-packing compatibility and strict-cover arguments. The revised exposition states their accounting once, preserves every local witness and arbitrary-outside-attachment argument, and retains the thirteen-versus-fourteen cover saving. A star footprint suffices for $K_4$; every $K_5$ application still explicitly verifies at most two forbidden edges. The new ordinary lemma names are mapped to existing declarations without claiming new standalone formalizations.

Puleo's reducible-set framework/local reductions, Botler–Fernandes–Gutiérrez Lemma 3.3 and Cui–Haxell–Ma's planar equality theorem are credited where used. The bibliography includes Tuza's original published article. Primary full texts support the limited comparison with Gupta's maximum-degree-seven result and Question 12.3, and with Liu–Zeng's edge-count theorem. The five-degenerate and maximum-average-degree-below-seven classes are incomparable, as the report's explicit ten-vertex example and $K_7$ show. Historical priority remains unestablished.

The exact combined theorem is `Tuza06.five_degenerate_combined`. All **280 mathematical Lean source files** and pinned configuration retain their accepted bytes. Existing verification rebuilt all 280 modules, audited 618 public theorem types/transitive axioms and replayed all 280 fresh local objects, using only `propext`, `Classical.choice`, `Quot.sound`. Compiled pinned dependencies were reused, and replay used the same standard Lean kernel. There was no cold Mathlib rebuild or independently implemented kernel. This editorial release does **not** claim a new Lean build/replay. Detailed coverage, hashes and provenance are in Appendix C and the linked verification record; original paper QA hashes identify the earlier PDF, while the current artifact record identifies this revision.

This remains an explicitly AI-developed research experiment, with internal AI review and no external specialist peer review or human mathematical authorship claim. The [triangle-restoration report](../tuza-triangle-restoration/README.md) remains separate. No theorem for arbitrary graphs, unrestricted restoration, strictness, the entire class with a five-vertex odd-cycle transversal, or a density-defined class follows from this revision.

To typeset the self-contained LaTeX source, use a TeX installation with the listed packages, including TikZ, or run `tectonic main.tex`. The vector graphic in the PDF is generated from the same certified 23-edge set as the editable SVG. Temporary TeX products, page images, downloaded tooling and third-party full texts are excluded from publication.

The revised PDF has **22 pages**. Every final page was rendered and visually inspected; no missing glyph, undefined reference, material overfull box or private identifier was found.
