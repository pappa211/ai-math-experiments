> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS localizes to the high-triangle-codegree five-core

Frozen assembly, 2026-11-16. Status: PROOF_USING_FINITE_CERTIFICATES_AND_DECLARED_INPUTS. This upgrades the earlier four-core localization using the independently accepted four-branch link theorem; it does not replace that theorem's evidence labels or claim unrestricted core availability.

Let J(G) retain exactly the edges of G belonging to at least three actual triangles. Let U_5(G) denote the VERTEX SET of its graph-theoretic five-core, obtained by repeatedly deleting vertices of degree at most four.

The accepted notes/four_branch_cs_link_exclusion_v1.md proves that every nonempty closed link component in a class-minimum CS failure has at least five branch vertices. These correspond exactly to incident edges of J(G). Thus a minimum CS failure has

    delta(J(G)) >= 5, and U_5(G)=V(G).

Consequently every G whose J(G) is four-degenerate satisfies CS: that class is hereditary, while a smallest failure would contradict the displayed minimum degree. Equivalently, empty high-codegree five-core is a sufficient condition for full combined CS. Equality retains literal K4 AND K5 triangle components. Unlike the earlier empty-four-core class, a literal K5 now has empty five-core since J is K5 and has degree four.

More generally, let A be any edge-subgraph-hereditary class with an established CS theorem. Then every G whose induced graph G[U_5(G)] lies in A satisfies CS. Proof: for H subset G, J(H) subset J(G), and U_5(H) subset U_5(G); any minimum-degree-five subgraph of J(H) survives peeling in J(G). Hence H[U_5(H)] is a subgraph of G[U_5(G)], so the lifted class is hereditary. A minimum failure in it has U_5(G)=V(G), placing G itself in A, contradiction.

This proof is the same general monotone-core argument already independently reviewed in notes/high_codegree_core_cs_v1.md. Valid base examples include the authenticated mad<7 CS class, forest triangle-cover CS, packing-number-at-most-four CS, perfect or claw-free actual triangle-intersection CS, and rainbow triangle-edge-three-color CS. Each retains its own declared dependencies. The base class must be hereditary; knowing CS for a single nonhereditary family is not enough.

The five-core restriction can also be alternated with the centered-three-sun induced restriction of notes/centered_three_sun_core_localization_v1.md. Both operators are subgraph-monotone and fix every minimum CS failure. Their finite alternating fixed graph supports the same hereditary-base localization. No bound or classification of that surviving graph is asserted.

## Verification boundary

New finite premise: all363 remaining fixed parity profiles have literal STRICT or RIM witnesses. Independent validator scripts/coordinator_four_branch_cs_validator.py regenerated all46,656 state tuples, found7,113 eligible labelled profiles and363 orbits, and checked every actual edge, triangle and required tuple relation. Four negative controls were rejected. Evidence: evidence/four_branch_cs_independent_validation.json. The new finite certificate is not Lean or a general graph census.

Ordinary all-size bridge: exact suppressed-shape reduction, DE2/DE4 distinction preserving all actual rim triangles, simultaneous matching/cover lift, and complete residual K4/K5 footprints were freshly accepted in review/challenger_four_branch_cs_assembly_review.md. The triangle-free branch retains the historical four-branch WKE finite domain and the declared Kotzig input; local M0/codegree/robustness inputs remain authenticated historical premises.

This establishes a broad sufficient class and a precise remaining core, not a proof that arbitrary G satisfies CS. No publication, human verification or novelty claim is made.
