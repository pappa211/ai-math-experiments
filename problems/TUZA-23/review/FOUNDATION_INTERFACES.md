> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-23 new clique and block choice interfaces

Status at initial handoff: `CliqueChoice` and the minimum-cover portion of `BlockChoice` compiled successfully; the appended maximum-packing wrapper awaits its next compile. This is an implementation progress note, not final acceptance. Final clean build and theorem-level axiom reports are required.

`Tuza23.clique_min_cover_containing` takes only a finite vertex set of size 4 or 5 and an actual edge of that clique. It supplies a minimum cover containing the edge and consisting solely of clique edges. The finite certificate is explicit: take the prescribed edge together with every edge on the complementary vertices. There are no assumed parameter values; the proved `Tuza06.k4_parameters` and `k5_parameters` supply optimality. A generic injective transport lemma proves the result for arbitrary labels.

`Tuza23.clique_max_packing_avoiding` wraps the existing all-size footprint API for one prescribed actual clique edge. It outputs a maximum packing that omits that edge from its union of triangle edges.

`Tuza23.clique_min_cover_footprint` handles any prescribed finite family whose intersection with clique edges has cardinality at most one. Empty footprints use a supported minimum cover; nonempty footprints use the edge-choice theorem.

`Tuza23.blocks_min_cover_footprint` takes an exhaustive actual clique decomposition and the ≤1 footprint condition separately in every block. It supplies C with all four properties:

1. C covers the entire actual triangle family of H.
2. |C| = tau(H).
3. C lies in actual triangle support.
4. Every prescribed supported edge lies in C.

The global proof chooses local covers, unions them, uses edge-support disjointness to compute cardinality exactly, and uses the existing proved component additivity. Arbitrarily many components and shared vertices are allowed. No attempt is made to force background edges into a minimum cover.

`Tuza23.blocks_max_packing_footprint` uses the same per-component ≤1 hypothesis and supplies a maximum old packing avoiding the full prescribed family. Every nonempty local footprint has one edge and hence a common endpoint; an empty footprint obtains an endpoint from the nonempty K4/K5. The existing `blocks_avoid_edges` then assembles the packing. This avoids requiring an unproved simultaneous choice rule.

The component footprint hypothesis is explicit here: these are assembly lemmas, not proofs of the whole-page-footprint geometry. The R2 source's geometry must establish that hypothesis for all ordinary pages before using the assembly. No graph-order, page-count, degree, or sparsity restriction is introduced.

Initial successful receipts:
- `operations/clique-choice-unfold-20261116T085819920996Z`: 1.500 seconds, peak sampled process-tree RSS 1,664,712,704 bytes, exit 0.
- `operations/block-choice-fixed-20261116T085932771444Z`: 1.503 seconds, peak sampled process-tree RSS 1,572,421,632 bytes, exit 0 (before appended packing wrapper).

Initial failures were Lean elaboration/API issues: Covers needed unfolding to synthesize finite decidability, and Finset.card_le_one needed explicit element arguments. Neither failure changed the mathematical claim or revealed a source proof gap.

Update: the appended maximum-packing wrapper in BlockChoice was also compiled successfully by the coordinator before the M0 work. Independent semantic review is in review/foundation_semantic_review.md. Final clean build and axiom audit remain separately required.
