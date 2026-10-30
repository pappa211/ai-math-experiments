# Five-degenerate Tuza theorem: canonical paper

**Tuza's Inequality and Equality Characterization for 5-Degenerate Graphs**  
AI Math Experiments · 30 October 2026

- [Read the finished paper (PDF)](main.pdf)
- [Read the complete paper on GitHub (Markdown)](main.md)
- [LaTeX source](main.tex) and [BibTeX bibliography](references.bib)
- [Public mathematical and formal-verification archive](../../problems/TUZA-06/README.md)
- [Exact formal target](../../problems/TUZA-06/FORMAL_STATEMENT.md), [final proof status](../../problems/TUZA-06/PROOF_STATUS.md), and [portable reproduction](../../problems/TUZA-06/REPRODUCTION.md)

The paper proves that every finite simple **5-degenerate** graph satisfies $\tau(G)\le2\nu(G)$, with equality if and only if every nonempty triangle component, connected through shared **graph edges**, has literal edge support $K_4$ or $K_5$. Here $\nu$ is maximum edge-disjoint triangle packing and $\tau$ is minimum graph-edge triangle covering. Graph order and maximum degree are unrestricted. Empty and triangle-free graphs, triangle-free background edges and clique blocks sharing vertices are included.

The complete ordinary proof includes all small-link and pair-overlap cases, exact equality accounting, a second degeneracy/peeling argument, the final eight-vertex core, and a symbolic argument for arbitrary outside attachments. The last cover uses thirteen edges where balanced accounting allows fourteen. Appendix A gives the shorter credited inequality route, for which balanced reductions suffice; Appendix B gives the small-link reorganization used in Lean. The paper proves the equivalence between the literal component condition and the clique-block representation, rather than treating a supplied decomposition as the original target.

Puleo's reducible-set framework and relevant local inequality reductions, Botler–Fernandes–Gutiérrez Lemma 3.3, and Cui–Haxell–Ma's planar equality result are credited at their points of use. The extra compatibility arguments for minimal failures of the combined statement are retained in full. The equality classification is the principal contribution proposed here; historical priority remains unestablished.

The exact combined theorem is `Tuza06.five_degenerate_combined`. All **280 mathematical Lean source modules** are preserved byte-for-byte, with pinned Lean 4.33.1 and Mathlib revision `0df444a360eaa60ab8c11dca51a86af692955474` and all nine package revisions. The source record includes all **618 public theorem type/axiom audits**. Only `propext`, `Classical.choice` and `Quot.sound` occur in those transitive-axiom reports. The main theorem has no unproved external mathematical input; unrelated conditional interfaces in reused files are not its premises. See the reproduction record for the exact fresh public-tree build/replay evidence and its limits: compiled pinned dependencies were reused, no cold Mathlib rebuild is claimed, and replay uses the same standard Lean kernel rather than an independently implemented kernel.

The research strategy, mathematics, code, internal reviews and formalization were developed through AI systems. The human supplied goals, budgets, coordination and authorization and is not named as a mathematical author. No affiliation, external specialist endorsement or external peer review is claimed.

This is a separate canonical work from [Triangle Restoration and Packing–Covering Stability in Tuza's Conjecture](../tuza-triangle-restoration/README.md). That paper and the TUZA-01–03 archives retain their own chronology and verification boundaries. This work does not establish general Tuza, the six-degenerate case, OCT-five, unrestricted restoration or the fixed-$c<3$ density extension.

To typeset the self-contained LaTeX source in this directory, use an existing TeX distribution with the packages listed in its preamble, or Tectonic:

```sh
tectonic main.tex
```

The publication PDF was built on the research host using isolated Tectonic 0.17.0 tooling. The bibliography is rendered in `main.tex`; `references.bib` provides the same entries for reuse. No temporary TeX files, downloaded TeX dependencies, full third-party articles, page-render images or private review archive are part of this paper directory. The PDF has **20 pages**; every final page was rendered and visually inspected, and its text, hyperlinks, title/author metadata and build diagnostics were checked.
