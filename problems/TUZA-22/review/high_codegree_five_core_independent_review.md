> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: high-codegree five-core assembly

Verdict: ACCEPT USING THE STATED FINITE AND DECLARED INPUTS. Reviewed2026-11-16 by source_audit. Frozen source `notes/high_codegree_five_core_cs_v1.md`, SHA256 `d9db0b2422cb1d5b11b5f72cb5d48153c669211f9e5220fc06f064cdf4d58eef`.

The new all-size four-branch theorem has separate symbolic review `review/challenger_four_branch_cs_assembly_review.md`; the literal finite certificate has separate coordinator validation `evidence/four_branch_cs_independent_validation.json`. I inspected both, including the actual receipt:363canonical profiles,193RIM,170STRICT,7113eligible labelled profiles from46656tuples, all four negative controls rejected, zero UNKNOWN. I did not rerun or claim a third independent finite audit. The historical triangle-free WKE and Kotzig dependencies remain declared.

The assembly itself is correct. A link branch at neighbor u corresponds exactly to a hub edge vu lying in at least three actual triangles. At least five branches in every nonempty closed link component implies minimum degree at least five in J for a class-minimum CS failure, after discarding isolates as prescribed by M0. Thus its five-core contains every vertex.

For H contained in G, actual codegrees can only fall, so J(H) is a subgraph of J(G). Every minimum-degree-five subgraph of J(H) survives degree-at-most-four peeling in J(G), proving U_5(H) contained in U_5(G). Therefore H[U_5(H)] is a subgraph of G[U_5(G)]. This proves the hereditary closure required for the arbitrary-base localization; class minimality then gives the stated contradiction with a proved hereditary CS base.

The equality update is essential and correct: K5 has J=K5 of degree four and hence EMPTY five-core, so both K4 and K5 equality components must be retained. No K4-only equality restriction transfers from the earlier empty-four-core class.

The centered-three-sun operator is also subgraph-monotone and fixes every minimum CS failure. Alternating these two induced restrictions terminates and is monotone: apply the same two operators in the same order to nested graphs at each stage. Once both sequences stabilize, the smaller final graph is a subgraph of the larger. Thus any hereditary CS base at the alternating fixed graph supplies the same valid class-minimality argument. No numerical packing/cover preservation under an individual peeling step is assumed.

The label PROOF_USING_FINITE_CERTIFICATES_AND_DECLARED_INPUTS must remain attached to the five-core and combined-kernel conclusions. This assembly is not a new census, a proof of unrestricted kernel emptiness, or an ordinary proof that eliminates the imported finite theorem.
