# TUZA-15: Sparse equality and restoration

For every finite simple G with every nonempty subgraph of average degree strictly below seven, tau(G) <= 2 nu(G), with equality iff each nonempty full shared-edge triangle component has literal K4 or K5 support. Empty/triangle-free cases, background edges and vertex sharing are included. Puleo previously proved the inequality. The equality classification is an ordinary computer-assisted proof with separate internal AI verification; no new Lean result or historical novelty certification. Locally bipartite graphs with a triangle satisfy tau <= 2 nu - 1 without a sparsity restriction. General Tuza/equality, S/E and seven-regular equality remain open.

Evidence: full ordinary proofs and exact finite checks, with external inputs attributed individually. Internal AI review is not external human peer review. No new Lean declaration is claimed.

## Full proofs and evidence

- [Full symbolic proof, finite-to-unbounded interface and discharging](PROOFS_AND_OBSTRUCTIONS.md)
- [Complete degree-seven donor and adjacent-six case arguments](notes/SCOUT_B_RESULTS.md)
- [Complete degree-eight donor exclusion, arbitrary outside pages](notes/SCOUT_B_DEGREE8.md)
- [Separate mathematical reconstruction](verification/INDEPENDENT_PROOF_AUDIT.md)
- [Complete supporting and optional hypotheses](verification/FROZEN_TARGETS.md)
- [Every audited claim and dependency category](verification/STATUS_MATRIX.json)
- [Authenticated exact finite certificate](evidence/six_link_certificates.json)
- [Byte-identical frozen independent checker](checks/independent_six_links.py)

## Reproduce

See the [public reproduction guide](REPRODUCTION.md), the [ordinary-proof ledger](../../ORDINARY_PROOF_INDEX.md), and the [source/transformation manifest](../TUZA-11-15-SOURCE_MANIFEST.json). Scripts run in fresh output copies, so historical data remain unchanged.

Development-stage pending/open labels in preserved notes describe their original stage. The later audited scope is summarized above; retained mathematical failures are not Tuza counterexamples.
