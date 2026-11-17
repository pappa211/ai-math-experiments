> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: nonperfect apex-forest closed links, v2

Decision: ACCEPT at the stated class-minimal CS scope. This is an ordinary argument using the established class-local M0, edge-codegree and closed-link robustness consequences. The new argument does not require Gallai–Edmonds, Konig or Kotzig as external premises.

Frozen source: notes/apex_forest_nonperfect_branch_v2.md
SHA256: c587035bea6883c1a5f80d0fc261be3e02144c84dae1678a50a6dc82d67fec47

This review independently reconstructs both the replacement matching lemma and the entire reduction, including arbitrary external pages and residual clique blocks. It is an AI mathematical review, not a formal proof or an external human review.

## Independent matching reconstruction

I first used a different description valid for every bipartite graph: orient nonmatching edges X to Y and matching edges Y to X; forward reachability from unmatched X and reverse reachability from unmatched Y are disjoint, since an intersection yields an augmenting path. The even reachable sides are precisely the vertices exposed by some maximum matching, by symmetric difference. Their neighbors are the odd reachable sides. The even set D is independent, the fixed matching pairs A to D, and the unreached set C is perfectly matched. A maximum matching with k A-D edges has size at most k+(|A|-k+|C|)/2, forcing k=|A|. Thus all maximum matchings use the asserted structure.

The source's undirected forest version gives the same facts. Different-parity paths from unmatched roots cannot meet: after their common tail is removed, the two path portions form an augmenting path in the forest. An even reached vertex's nonmatching neighbor is reached at odd distance; its matching neighbor is its predecessor. These observations justify D independent, A=N(D), and no D-C edge. Symmetric-difference paths certify that D is exactly, rather than merely a subset of, the exposable vertices. Hence the later use that EVERY maximum matching saturates A and C is justified. Its edge-type count excludes A-A and A-C matching edges. No general matching-decomposition theorem is hidden here.

The leaf recurrence for forest vertex cover and matching is valid: an optimum cover may contain the neighbor y and omit the leaf x, and an optimum matching may contain xy. Removing both vertices reduces each optimum by exactly one. Disconnected and edgeless cases separate.

## Leaf witnesses and universal maximum-matching quantifier

A nonperfect tree's alternating exploration reaches at least two original exposable leaves. Odd reached vertices have a forward matched edge; nonleaf even vertices have a forward unmatched edge; acyclicity prevents collisions. If the unmatched root is a leaf, count it as one endpoint and explore the other branch.

Fact A is valid because deletion of the endpoints of an allowed edge preserves the positive deficiency and each remaining component has at most one changed attachment vertex. A nonsingleton deficient component has two exposable leaves, so one is original. A singleton has original degree one.

Fact B uses d>=2 essentially. Deleting a matching-avoidable edge preserves deficiency. Every nonsingleton deficient component has an exposable original leaf away from the deleted edge endpoints. If only singleton deficient components remained, there could be at most one: two isolated endpoints would mean a K2 component and a decrease in matching number. That contradicts d>=2.

Section3 correctly turns failure of the smaller WKE reduction into the assertion for EVERY maximum forest matching M that nu(F-M)=r. This supplies avoidance of every forest edge and excludes perfect tree components. If total deficiency were one, there would be exactly one tree component; its edge count forces the union of two matchings to be an odd path. The indicated maximum matching leaves two adjacent complement edges, contradicting the asserted complement matching size unless F=P3. Robustness excludes the latter. Thus d>=2 is proved before Fact B is used.

## Actual triangle accounting and residual block footprints

Removing all hub spokes into the closed link L and the matching P gives a proper subgraph K. The selected edges P plus the hub spokes at Q cover every removed triangle. In particular, a triangle using a deleted rim edge is covered regardless of where its third vertex lies. A triangle using a deleted hub spoke has its other link vertex in L by closedness. The s hub triangles on P append to any packing of K. The class-local minimality inequalities consequently force a tight B residual, or give an immediate contradiction if |Q|<s.

Every residual clique block contains at most three L vertices, because an induced apex-forest link has no K4. Therefore a matching in L has at most one surviving edge per block. This proves the larger-matching augmentation.

For the internal triangle augmentation, deleting its forest edge prevents any residual clique from containing both remaining rim edges. The rim footprint and matching footprint have at most one edge each; if disjoint they require four L vertices, impossible. The full footprint is a star of at most two edges, so the established K4/K5 avoidance lemma applies to the ENTIRE chosen family.

For the external page augmentation, codegree gives a third vertex outside L because the selected edge belongs to no triangle in L. A residual block has at most one surviving page spoke, since its base was deleted. A block containing a page endpoint cannot have three L vertices when that endpoint belongs to no L triangle. Hence a matching footprint cannot be disjoint from the page spoke. This is the exact stronger safe-endpoint condition used by v2, and it is verified in both later applications. The selected hub triangles cannot conflict with the external page on an unnoticed edge: their bases lie in L, their hub is v, the page's third vertex lies outside L and differs from v, and the page base is excluded from the new matching.

## Final branch

If C in the forest decomposition were nonempty, its unique forest perfect matching would occur in every maximum forest matching, contradicting edge avoidance. Thus C is empty. Swapping a matched A-D edge into a maximum matching missing its D endpoint proves every A-D edge is allowed and every A vertex has at least two D neighbors.

An unallowed triangular forest edge therefore lies within A. In the A-D forest, a path from one of its endpoints to a D leaf has odd length; that D leaf is an original forest leaf and hence adjacent to w. The endpoint labels for adjacency to w are both1. Allowed edges cannot have labels11, so this odd path contains00. Its two endpoints are not in any L triangle, furnishing exactly the safe edge required above.

The triangle-free branch also uses a safe edge directly, with no invocation of the older triangle-free WKE/Kotzig theorem. All hypotheses needed for the two augmentation forms have been checked. No gap or additional finite-domain premise was found.

## Provenance, not a dependency

For historical authentication of superseded v1, the original Gallai1964 paper is openly available at https://real.mtak.hu/189486/ with its published PDF; its introduction Satz(E.1) states the decomposition using Ms, Mu and Mb. A primary research-paper restatement is Busch et al., *Packing of Graphic n-tuples*, author-hosted https://dwest.web.illinois.edu/pubs/degpack.pdf, theorem3.6 on PDF page9. Its notation(A,B,C) equals the present(D,A,C). Those documents were inspected online; they are not needed for v2, and no complete revalidation of the general Gallai–Edmonds proof is claimed.
