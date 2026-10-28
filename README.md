# AI math experiments

A personal experiment in whether a non-mathematician can use commercially accessible frontier AI models, computational mathematics, and formal verification to investigate open mathematical questions.

The method is to identify a problem and check its reported open status, let AI systems investigate it, test proposed arguments with computation and Lean where useful, and preserve critical reviews alongside successful and failed approaches. Evidence is labelled by what was actually checked. Unverified claims are not presented as discoveries.

## Experiments

| Experiment | Outcome | Read |
|---|---|---|
| A113010: digit-count fixed points | Original conjecture unresolved; partial Lean results and finite evidence | [Archive](problems/A113010/README.md) |
| TUZA-01: triangle deletion and Tuza | Triangle-deletion criterion for Tuza's inequality; OCT ≤ 4 and fixed c < 5/2 density corollaries | [Paper and archive](problems/TUZA-01/README.md) |

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
