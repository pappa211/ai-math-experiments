# AI math experiments

A personal experiment in whether a non-mathematician can use commercially accessible frontier AI models, computational mathematics, and formal verification to investigate open mathematical questions.

The method is to identify a problem and check its reported open status, let AI systems investigate it, test proposed arguments with computation and Lean where useful, and preserve critical reviews alongside successful and failed approaches. Evidence is labelled by what was actually checked. Unverified claims are not presented as discoveries.

## Triangle restoration and Tuza’s conjecture

The TUZA-01–03 program studies when restoring one or two deleted triangles preserves the inequality $`\tau(G)\le 2\nu(G)`$ and how near-equality remainders behave. The canonical paper, **[Triangle Restoration and Packing–Covering Stability in Tuza’s Conjecture](papers/tuza-triangle-restoration/main.md)**, integrates the complete selected proofs in logical order.

- **[Read the complete paper (PDF)](papers/tuza-triangle-restoration/main.pdf)**
- **[Read the paper on GitHub (Markdown)](papers/tuza-triangle-restoration/main.md)**
- **[LaTeX source](papers/tuza-triangle-restoration/main.tex)** and **[BibTeX bibliography](papers/tuza-triangle-restoration/references.bib)**
- Research archives: **[TUZA-01](problems/TUZA-01/README.md)** · **[TUZA-02](problems/TUZA-02/README.md)** · **[TUZA-03](problems/TUZA-03/README.md)**
- **[Lean verification](problems/TUZA-03/LEAN_VERIFICATION.md)** and **[reproduction instructions](problems/TUZA-03/reproduction/README.md)**

The results include one-triangle restoration, OCT-four, the fixed-$`c<5/2`$ density consequence, specified two-triangle restoration classes, closed-boundary deletion and stability, and exact parameterized compression. Selected deductions have conditional Lean verification with explicit Aharoni, graphical HNS and, where applicable, classical bipartite König inputs. The inherited graphical HNS conversion remains an assumed Lean interface. The flat, star-core, mixed/shared-apex bowtie, qualified four-spoke and compression arguments and the density consequence have audited ordinary proofs without full Lean formalization.

**Unrestricted two-triangle restoration, OCT-five, and the fixed-$`c<3`$ density extension remain unproved.** These results do not resolve Tuza’s general conjecture. External specialist peer review and historical originality are not claimed.

The original [TUZA-01](problems/TUZA-01/README.md), [TUZA-02](problems/TUZA-02/README.md) and [TUZA-03](problems/TUZA-03/README.md) archives retain their proof sources, experiments, reviews, Lean files and reproduction evidence. [Editorial provenance and scope](papers/tuza-triangle-restoration/README.md) distinguish the canonical paper from those historical records.

## Tuza’s inequality and equality for five-degenerate graphs

Every finite simple **5-degenerate** graph $G$ satisfies $\tau(G)\le 2\nu(G)$, with equality if and only if every nonempty triangle component connected through shared graph edges has edge support exactly $K_4$ or $K_5$. Here $\nu$ counts edge-disjoint triangles and $\tau$ counts graph edges hitting all triangles. Graph order and maximum degree are unrestricted; empty and triangle-free graphs, background edges and blocks sharing vertices are included.

- **[Read the complete paper (PDF)](papers/tuza-five-degenerate/main.pdf)** · **[Markdown](papers/tuza-five-degenerate/main.md)** · [LaTeX](papers/tuza-five-degenerate/main.tex) · [bibliography](papers/tuza-five-degenerate/references.bib).
- **[TUZA-06 research and Lean archive](problems/TUZA-06/README.md)**, including [curated TUZA-04–05 ordinary proofs/history](problems/TUZA-06/history/README.md), [precise formal statement](problems/TUZA-06/FORMAL_STATEMENT.md), [verification coverage](problems/TUZA-06/PROOF_STATUS.md) and [portable reproduction](problems/TUZA-06/REPRODUCTION.md).

The exact combined theorem is formalized without additional unproved mathematical inputs in all 280 frozen mathematical modules. Publication reproduction rebuilds those modules, audits all 618 public theorem types/transitive axioms and replays the fresh local objects using the standard Lean kernel, against reused pinned compiled dependencies. It is not a cold Mathlib rebuild or a separate kernel implementation. Published local inequality reductions are credited; historical priority and external specialist peer review are not claimed. The combined equality classification is the principal contribution proposed here.

This is a separate canonical work from the TUZA-01–03 restoration paper above. It establishes no general Tuza, six-degenerate, OCT-five, unrestricted restoration or fixed-$c<3$ density theorem. [Attribution, provenance and publication scope](papers/tuza-five-degenerate/README.md).

## Experiments

| Experiment | Outcome | Read |
|---|---|---|
| A113010: digit-count fixed points | Original conjecture unresolved; partial Lean results and finite evidence | [Archive](problems/A113010/README.md) |
| TUZA-01: one-triangle restoration | One-triangle criterion, OCT-four, and the fixed-c < 5/2 density result | [Research archive](problems/TUZA-01/README.md) |
| TUZA-02: two-triangle restoration | Exact-equality, essential-edge and flat-remainder restoration; selected star cores | [Research archive](problems/TUZA-02/README.md) |
| TUZA-03: boundary and stability | Closed-boundary deletion and stability, restricted bowtie restoration, and compression | [Research archive](problems/TUZA-03/README.md) |
| TUZA-04–06: five-degenerate graphs | Tuza inequality and literal K4/K5 triangle-component equality; full Lean proof | [Paper](papers/tuza-five-degenerate/main.md) · [Archive](problems/TUZA-06/README.md) |

Exact-equality restoration is a pre-TUZA-02 follow-up integrated with the later two-triangle results; the paper retains this provenance.

## A113010: digit-count fixed points

Take an integer's number of decimal digits, and raise that count to the sum of its digits. Which integers return themselves? For example, 32 has two digits summing to five, and `2^5 = 32`. The known fixed points are 1 and 32.

**The original conjecture remains unresolved.** The investigation did not prove that these are the only fixed points and did not find another one.

- In-session Lean checks establish intermediate results excluding additional fixed points with at most **10,004 digits** or digit sum at most **2,500**, and at most two fixed points per prescribed digit sum.
- Finite computations found no additional fixed point among candidates with up to **five million decimal digits**. This is computational evidence, not the formal bound.
- A second, independently reviewed exploration retained two informal observations about sparse multiples and polynomial divisibility. They do not constitute a solution or an externally established novelty claim.

Successful in-session Lean checks are **not the same as independent external proof verification**. Publication reproduction and its exact limitations are recorded separately.

[Read the A113010 archive](problems/A113010/README.md), including actual Lean sources, experiments, reports, rejected approaches, and reproduction instructions.

## TUZA-01: triangle-deletion criterion

The [TUZA-01 manuscript](problems/TUZA-01/manuscript/README.md) proves the following criterion: for a finite simple graph $G$ and a triangle $T$, if the triangle hypergraph of $G-E(T)$ is 3-partite, then $\tau(G)\le2\nu(G)$. Its ordinary mathematical proof derives this result from [Aharoni's published bound](https://doi.org/10.1007/s004930170001) and the [Haxell–Narins–Szabó equality characterization](https://doi.org/10.1016/j.jcta.2018.04.004). The key step selects a maximum packing in the remainder that is compatible with every triangle introduced by restoring $T$.

Two consequences follow: Tuza's inequality holds when deleting at most four vertices leaves a bipartite graph; and, by a detailed adaptation of [Liu–Zeng's proof](https://arxiv.org/abs/2610.15539v1), for every fixed real `c < 5/2` there is `N(c)` such that every `n ≥ N(c)` and every `n`-vertex graph with `e(G) ≥ n²/4 − cn` satisfies the inequality. The endpoint `c = 5/2` is not established.

**Verification and provenance.** This is AI-assisted research with no external specialist review. Recorded searches found no prior equivalent, but originality is not established. Lean checks the new triangle-deletion and OCT-four deductions with the published Aharoni/HNS inputs represented by explicit theorem parameters; their deep proofs, the graphical HNS extraction, and the density corollary are not formalized. The general Tuza conjecture remains open. [Reproduction scope](problems/TUZA-01/reproduction/README.md).

## Further experiments

Each investigation will have its own folder under `problems/`, keeping statements, sessions, evidence, and outcomes separate. Start from the [problem template](templates/PROBLEM_TEMPLATE.md). Corrections and additional results are welcome through ordinary issues and pull requests; see [CONTRIBUTING.md](CONTRIBUTING.md).

Newly authored material is offered under [Apache-2.0](LICENSE). Retained third-party notices and dependency licensing are described in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). The public Git history starts with sanitized files; private operational history, credentials, application transcripts, and binary backups are not included.
