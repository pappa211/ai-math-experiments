> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# C21-C: private-witness packing from a minimum ordinary cover
Status: provisional serious challenger; exact statement frozen before testing.

For every finite simple graph G and EVERY minimum ordinary triangle cover C, let F_C consist of ALL actual triangles T with |E(T) intersection C|=1. Claim: 2 nu(F_C) >= |C|. A weaker existential-over-C version is separate.

Unrestricted implication: nu(G)>=nu(F_C), so the claim implies tau(G)<=2nu(G). No PK confinement, type hypothesis, or unchanged chosen subgraph cover is used.

Graph-specific basis: G-C is triangle-free. Every e in C has an actual private witness with two edges in G-C. Literal triangles sharing two endpoints generate further triangles, which might make a cover-exchange obstruction yield a packing augmentation. Minimum cardinality of C, unlike mere inclusion minimality, forbids a globally cheaper cover.

Reasons to pursue: (1) changes the starting optimization from maximum packing to minimum ordinary cover, permitting every graph edge; (2) exact minimality supplies replacement inequalities and actual blue graph geometry beyond irredundant incidence.
Reasons against: (1) hitting all one-C triangles does not hit triangles with two/three C edges, so a local replacement can fail; (2) privately witnessed red edges need not have disjoint blue resources, and the proposed bound could be a much stronger unproved conjecture.

Cheapest sufficient falsification: a literal small G, a cover C with independently certified |C|=tau(G), and exact maximum packing in F_C below ceil(|C|/2). Test K4/K5, switched-four-cycle, twelve-vertex mandatory-gain control, clique overlaps, and bounded structured blue-base perturbations. A single C refutes only the every-C version.

First nontrivial lemma sought: for a maximum F_C packing M, if |C|>2|M|, endpoint geometry supplies a smaller cover C' of the ENTIRE triangle family. This requires explicit handling of two-/three-C triangles; asserting the smaller cover exists is not a mechanism. A fully specified exchange is required before proof promotion.

Continuation: pursue only if a concrete exchange survives controls. Retire on certified counterexample; do not silently patch to existential C or simply enlarge a census. If no controlled exchange emerges, retain as unsupported hypothesis, not progress.
