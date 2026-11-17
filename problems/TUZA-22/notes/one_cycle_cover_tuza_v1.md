> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tuza for graphs admitting a cover with at most one cycle

Status: ordinary all-size proof candidate, frozen for independent review. The inequality is proved; the full equality classification for this class is not claimed.

## Theorem

If a finite simple graph G admits a triangle edge cover C whose selected graph has total cycle rank at most one, then

    tau(G) <= 2nu(G).

The cover need not be minimum. Its selected graph may be disconnected; the hypothesis means it is a forest or has exactly one cycle in total. Arbitrary graph edges outside C and all actual crossing triangles are included.

Equivalently, this proves Tuza for every graph obtained by adding at most one edge to a graph admitting a forest triangle cover.

## Proof

The forest case is the established self-contained forest-cover CS theorem. Otherwise choose an edge e of the unique selected cycle and set H=G-e. The selected set C minus {e} is a forest and covers every actual H triangle: a triangle previously covered only by e no longer exists. Hence H satisfies combined CS.

If tau(H)<2nu(H), integrality and the cover obtained by adding e give

    tau(G) <= tau(H)+1 <= 2nu(H) <= 2nu(G).

If tau(H)=2nu(H), combined CS gives B(H). If e creates no triangle, the triangle family and both parameters are unchanged, so B(G) and equality hold. If e creates an actual triangle, the authenticated insertion lemma gives

    tau(G) <= 2nu(G)-1.

For completeness, the insertion lemma is literal: take a new triangle e=ab with apex x. Its old spokes ax,bx cannot both lie in the same old K4/K5 triangle component, since that clique would already contain ab. Each affected old component therefore contains at most one prescribed spoke. Choose maximum old block packings avoiding those spokes and append abx. Thus nu(G)>=nu(H)+1, whereas tau(G)<=tau(H)+1=2nu(H)+1. Old edges in no triangle are automatically avoided. ∎

The equivalence of the two descriptions follows in both directions. Deleting a selected cycle edge yields a forest cover, as above. Conversely, if H has a forest cover F and G=H+e, then F union {e} covers G and has total cycle rank at most one.

## Exact remaining equality branch

Suppose tau(G)=2nu(G) but B(G) fails. For EVERY selected edge e whose deletion leaves a forest cover, H=G-e must satisfy

    nu(H)=nu(G),
    tau(H)=2nu(G)-1.

Indeed the tight-H branch above either gives B(G) unchanged or strict inequality. In the strict-H branch, equality forces equality at each step of the displayed chain. Thus the remaining problem is an edge addition to a defect-one forest-cover graph that preserves packing and raises covering by one. No classification of that near-tight graph has been supplied by the inequality argument.

This exact equality branch is compatible with the existing minimal-CS framework and is NOT a proof of full CS for one-cycle covers, a global cover-availability statement, or unrestricted Tuza.

## Dependencies

- `notes/forest_triangle_cover_cs_v1.md`, SHA-256 `c4c50c12294a609d00ea49fee692c3328f489826173d07defc2e08e040f63893`, independently accepted in `review/forest_cover_cs_assembly_independent_review.md`;
- the literal insertion lemma, reconstructed above and in `notes/restoration.md` from the pinned class-local source.

There is no new computational premise or imported matching theorem.
