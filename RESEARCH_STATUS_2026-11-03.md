# Research status: 3 November 2026

**AI Math Experiments - AI-developed research; internal AI verification.**

The main new accepted finding is: for every finite simple graph G in which every
nonempty subgraph has average degree strictly below seven, tau(G) <= 2 nu(G),
with equality iff each nonempty component of the full actual triangle family,
connected by shared graph edges, has literal K4 or K5 edge support. Packings may
share vertices; covers use graph edges. Empty/triangle-free cases, background
edges and vertex sharing between components are included. Puleo previously proved
the inequality; the audited addition is equality classification and supporting
restorations. It is an ordinary computer-assisted proof, not a new Lean theorem.

[New report PDF](papers/tuza-11-15-research-summary/main.pdf) -
[Markdown](papers/tuza-11-15-research-summary/main.md) -
[Exact proof ledger](ORDINARY_PROOF_INDEX.md) -
[Reproduction](REPRODUCTION.md#tuza-1115-ordinary-proofs-and-exact-finite-checks).

The theorem includes maximum degree <= 6. It does not cover all six-degenerate,
maximum-degree-seven, mad <= 7 or arbitrary graphs. The mad < 7 and
five-degenerate classes are incomparable. Locally bipartite graphs containing a
triangle additionally satisfy tau <= 2 nu - 1 without a sparsity bound.

| Phase | Current scope |
|---|---|
| TUZA-11 | Four/five-edge flat-piece gluing at exact triangle-separation hypotheses; Liu external input and erratum explicit; kernel not a boundary-state gadget |
| TUZA-12 | Exact labelled root/weighted cover for claw-free full conflict; ordered-lift and neutral-restoration architectures refuted |
| TUZA-13 | Historical survival in completed tested domains; UNKNOWN identities retained; large automatic stratum identified |
| TUZA-14 | Exact cover-exchange, private-witness and scoped minimal-failure lemmas; shortcut counterexamples retained |
| TUZA-14B | S for nu <= 4 or tau <= 8; scoped block/slack, distinct-root and fractional results; signed cut conditional |
| TUZA-15 | Audited strict-sparse equality and locally bipartite strictness, ordinary symbolic proofs plus exact six-link dependency |

**OPEN:** unrestricted Tuza, unrestricted equality classification, general S/E,
and remaining seven-regular equality. No blanket tau <= 10 assertion for nu=5.
A113010 remains UNSOLVED. Earlier conditional results retain their hypotheses.
Historical originality and external specialist peer review remain unestablished.

The current **CONTINUE** assessment concerns the audited restricted equality
mechanism only. The [1 November status](RESEARCH_STATUS_2026-11-01.md) is preserved
as a historical snapshot; its TUZA-07-10 REDIRECT assessment remains valid for
that phase. No follow-on campaign is authorized by this status page.

Archives: [11](problems/TUZA-11/README.md), [12](problems/TUZA-12/README.md),
[13](problems/TUZA-13/README.md), [14](problems/TUZA-14/README.md),
[14B](problems/TUZA-14B/README.md), [15](problems/TUZA-15/README.md).
[Evidence and dependencies](verification/tuza-11-15/README.md).
