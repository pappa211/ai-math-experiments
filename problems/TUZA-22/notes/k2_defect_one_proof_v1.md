> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Packing-two defect-one residual: endpoint classification — frozen v1

Developed by the TUZA-22 independent verifier after the R1/R2 reviews. Status: **ORDINARY_PROOF_CANDIDATE**, awaiting fresh review by another role. This is not a transfer of original H-D's nu<=2 theorem, and no novelty or Lean claim is made.

## Exact scoped theorem

Let G be a finite simple graph such that every actual edge belongs to at least two actual triangles. Suppose nu(G)=2 and tau(G)=4. If some actual triangle T satisfies tau(G-E(T))=1, then G, after removing isolated vertices, is exactly K5.

The assumptions include every actual triangle and permit vertex-sharing packings. No graph-order bound, CS induction or degree/sparsity bound is used in this scoped classification.

## Proof

Write T=abc and H=G-{ab,ac,bc}. Since tau(H)=1, H has at least one triangle and there is an actual edge de belonging to every H-triangle. Thus H's triangle support is a book on de. Any non-base edge of this book belongs to exactly one H-triangle: a triangle containing both de and a spoke, say dx, must be dex.

An edge whose two endpoints lie outside {a,b,c} has the same triangle codegree in H as in G. Indeed, a triangle containing that edge has at most one terminal vertex and so cannot use any of the three deleted terminal edges. Such an edge therefore cannot be a non-base book spoke: that would give codegree one in G, contradicting the assumed lower bound two.

Every H-triangle contains at most one terminal because the terminal triple is independent in H. If it contained no terminal, both non-base spokes would be wholly outside the terminals, impossible by the preceding paragraph. If its base contained the single terminal, its opposite non-base spoke would again be wholly outside, impossible. Consequently d,e both lie outside T, and every H-triangle is dex with x in{a,b,c}. Let A be this nonempty set of common terminal neighbors. The base de also has unchanged codegree on deleting T, so |A|>=2.

There is no other outside-outside edge in G. Any triangle containing such an edge would avoid the deleted terminal edges and hence be an H-triangle; the only outside-outside edge in any H-triangle is de. An additional outside-outside edge would therefore have codegree zero, contrary to the hypothesis.

Every nonisolated outside vertex f other than d,e now has neighbors only among a,b,c. If af is one incident edge, its triangle codegree equals the number of the other terminals adjacent to f. Codegree at least two forces both bf andcf. Thus every such f is adjacent to all three terminals, and has no other neighbors. Let X be the set of these extra vertices.

There are at most one of them. If distinct f,g belong to X, relabel the terminals so a belongs to A. Then the three triangles

    ade, abf, bcg

are pairwise edge-disjoint, contradicting nu(G)=2.

Suppose first X={f}. If A={a,b,c}, the three triangles

    abf, acd, bce

are pairwise edge-disjoint, again a contradiction. Otherwise relabel so A={a,b}. The terminal c cannot be adjacent to both d,e. If cd exists, the three triangles

    abe, acf, bcd

are pairwise edge-disjoint. If ce exists, use instead

    abd, acf, bce.

Thus neither cd norce exists. The entire graph then consists of K4 on{a,b,d,e}, triangle abc, and the three f-spokes af,bf,cf. The three actual edges {ab,de,cf} meet every actual triangle: ab/de meet every triangle of that K4, ab meets abc andabf, and cf meets acf andbcf. This gives tau(G)<=3, contradiction. Hence X is empty.

Only the five nonisolated vertices a,b,c,d,e remain. If A={a,b}, then c is adjacent to at most one of d,e. The edges ab,de, together with that one c-spoke if it exists, cover all triangles, again giving tau(G)<=3. Therefore A={a,b,c}, so all six terminal-to-{d,e} spokes exist, together with abc andde. These are all ten edges of K5. QED.

## Conditional consequence for a minimum CS failure

M0 and accepted R1 imply that a minimum CS failure with k=2 would have tau(G)=4 and tau(G-E(T))=1 for every actual triangle. The already archived, class-independent M3 package gives codegree at least two for every actual edge. The scoped theorem therefore forces G=K5 (isolates already discarded), contradicting its failure of CS. Alongside R1's exclusion of k=1, this yields:

    Any minimum unrestricted CS failure has nu(G)>=3.

This is a new consequence within the current proof architecture only if the scoped endpoint proof survives fresh review. It does not prove original H-D at a new scope, classify all defect-one graphs, or provide a blocker for k>=3. The codegree condition is a declared existing input to the minimum-CS corollary; it is not inferred from arbitrary tight cover-criticality alone.

## Motivation, limits and cheap challenge

Reasons to pursue: (1) a defect-one residual at k=2 has a literal common-edge triangle cover; (2) the actual endpoint/codegree distinction prevents arbitrary outside attachments from surviving. Risks: (1) this mechanism depends on tau(H)=1 and does not automatically extend to larger residual covers; (2) source M3 must retain its class-independent hypothesis package, with no illicit sparse-class substitution.

Cheapest challenge: find a graph satisfying all three numerical/codegree premises and a triangle residual of cover number one, yet whose support is not K5; or identify an H-triangle/book-spoke whose codegree increases after restoring T despite having both endpoints outside T. Every explicit three-triangle packing and three-edge cover in the proof should be checked literally.
