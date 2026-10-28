# AI math experiments

A personal experiment in whether a non-mathematician can use commercially accessible frontier AI models, computational mathematics, and formal verification to investigate open mathematical questions.

The method is to identify a problem and check its reported open status, let AI systems investigate it, test proposed arguments with computation and Lean where useful, and preserve critical reviews alongside successful and failed approaches. Evidence is labelled by what was actually checked. Unverified claims are not presented as discoveries.

## Experiments

| Experiment | Outcome | Read |
|---|---|---|
| A113010: digit-count fixed points | Original conjecture unresolved; partial Lean results and finite evidence | [Archive](problems/A113010/README.md) |
| TUZA-01: triangle deletion and Tuza | Unrefereed proof manuscript; conditional Lean checking; novelty unconfirmed | [Paper and archive](problems/TUZA-01/README.md) |

## A113010: digit-count fixed points

Take an integer's number of decimal digits, and raise that count to the sum of its digits. Which integers return themselves? For example, 32 has two digits summing to five, and `2^5 = 32`. The known fixed points are 1 and 32.

**The original conjecture remains unresolved.** The investigation did not prove that these are the only fixed points and did not find another one.

- In-session Lean checks establish intermediate results excluding additional fixed points with at most **10,004 digits** or digit sum at most **2,500**, and at most two fixed points per prescribed digit sum.
- Finite computations found no additional fixed point among candidates with up to **five million decimal digits**. This is computational evidence, not the formal bound.
- A second, independently reviewed exploration retained two informal observations about sparse multiples and polynomial divisibility. They do not constitute a solution or an externally established novelty claim.

Successful in-session Lean checks are **not the same as independent external proof verification**. Publication reproduction and its exact limitations are recorded separately.

[Read the A113010 archive](problems/A113010/README.md), including actual Lean sources, experiments, reports, rejected approaches, and reproduction instructions.

## TUZA-01: triangle-deletion criterion

The [TUZA-01 manuscript](problems/TUZA-01/manuscript/README.md) derives Tuza's inequality when deleting the edges of one triangle leaves a 3-partite triangle hypergraph, and consequently when deleting at most four vertices leaves a bipartite graph. A detailed adaptation of Liu–Zeng's preprint gives a fixed-deficit density corollary for each fixed real `c < 5/2` and sufficiently large order depending on `c`; the endpoint is not established.

**This is an AI-assisted, unrefereed manuscript.** No external specialist review occurred; novelty remains unconfirmed. Lean checks the new triangle-deletion and OCT-four deductions conditionally on explicitly named published Aharoni/HNS inputs, whose deep proofs and graphical HNS extraction are not formalized. The density corollary is not Lean-formalized. The general Tuza conjecture remains open. [Reproduction and trust boundary](problems/TUZA-01/reproduction/README.md).

## Further experiments

Each investigation will have its own folder under `problems/`, keeping statements, sessions, evidence, and outcomes separate. Start from the [problem template](templates/PROBLEM_TEMPLATE.md). Corrections and additional results are welcome through ordinary issues and pull requests; see [CONTRIBUTING.md](CONTRIBUTING.md).

Newly authored material is offered under [Apache-2.0](LICENSE). Retained third-party notices and dependency licensing are described in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). The public Git history starts with sanitized files; private operational history, credentials, application transcripts, and binary backups are not included.
