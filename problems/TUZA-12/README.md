# TUZA-12: Matching roots and realizability obstructions

The exact labelled loopless matching-root/weighted-cover theorem assumes the full actual triangle-conflict graph is claw-free. Isolated K5/K5-e supports are treated separately; cost-two K4 hubs are independent. Arbitrary forced boundary-state equality and a general matching root are not proved. The all-orders non-Konig lift existence proof and the neutral-restoration witness refute auxiliary mechanisms. They do not refute Tuza.

Evidence: full ordinary proofs and exact finite checks, with external inputs attributed individually. Internal AI review is not external human peer review. No new Lean declaration is claimed.

## Full proofs and evidence

- [Full probabilistic all-orders obstruction and connected strengthening](INDEPENDENT_PROOF_A.md)
- [Full labelled root, two-way cover normalization and restricted inequality](INDEPENDENT_PROOF_B.md)
- [Independent-heavy-set weighted matching lemma](notes/WEIGHTED_ROOT_LEMMA.md)
- [Exact eight-vertex neutral restoration counterexample](notes/FOUR_PORT_RESTORATION_COUNTEREXAMPLE.md)

## Reproduce

See the [public reproduction guide](REPRODUCTION.md), the [ordinary-proof ledger](../../ORDINARY_PROOF_INDEX.md), and the [source/transformation manifest](../TUZA-11-15-SOURCE_MANIFEST.json). Scripts run in fresh output copies, so historical data remain unchanged.

Development-stage pending/open labels in preserved notes describe their original stage. The later audited scope is summarized above; retained mathematical failures are not Tuza counterexamples.
