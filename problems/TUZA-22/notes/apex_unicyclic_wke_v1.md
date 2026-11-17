> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex-unicyclic links: an ordinary WKE theorem and the exact exception

Frozen ordinary proof candidate, 2026-11-16. The matching theorem is self-contained. Its minimum-CS triangle-free corollary uses the separately accepted triangle-free WKE exclusion, with that note's declared Kotzig input. No finite census is used here.

## Statement

Let L be a finite simple graph, let w be a vertex, and suppose F=L-w is connected and unicyclic, while every vertex of L has degree at least two. Then L is WKE unless F is an even cycle and two neighbors of w are adjacent in F. The exceptional description is an uncovered case of this theorem, not an assertion that every graph in that description is non-WKE.

Here WKE means there is a graph matching P and a vertex set Q covering every edge of L-P, with |Q|<=|P|.

In particular every TRIANGLE-FREE apex-unicyclic L under these hypotheses is WKE. Consequently no such L is a closed link component of a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class.

The exceptional case is real for this proof architecture: an apex joined to all four vertices of a four-cycle is not WKE (the previously checked five-wheel boundary). It must not be discarded by treating the unicyclic remainder as a forest.

## 1. Maximum-matching complement cover in a pseudoforest

For every finite pseudoforest R and EVERY maximum graph matching M of R, the graph R-M has a vertex cover of size at most |M|.

Prove this by induction, additively over connected components. Isolates cost zero. If a component has a leaf u with neighbor v, then v is matched by M: otherwise uv augments M. Remove u and v, and remove the unique M-edge incident with v. The remaining matching M' has size |M|-1 and is maximum in R'=R-{u,v}; a larger R'-matching together with uv would contradict maximal cardinality of M. The induction hypothesis supplies a cover Q' of R'-M' of size at most |M|-1. Then Q' union {v} covers R-M. This remains valid when M matches v to a vertex other than u: that vertex becomes exposed in M', and the removed M-edge was not required to be covered.

A nonempty connected pseudoforest with no leaves or isolates is a cycle. On an even cycle of length 2r, a maximum matching is perfect and its complement is a matching of r edges, covered by r vertices. On an odd cycle of length 2r+1, a maximum matching leaves one vertex exposed; its complement consists of one two-edge path and r-1 isolated edges, covered by r vertices. These are all terminal cases, proving the lemma.

The assertion is about a cover of the matching complement, not a vertex cover of the original pseudoforest.

## 2. A nonperfect unicyclic graph exposes an original leaf

For a connected pseudoforest R with no perfect matching, the following holds: either R is an isolated vertex, or R is an odd cycle, or R has a maximum matching exposing an original leaf of R.

Induct on order. If there are no leaves, the connected pseudoforest is an isolate or cycle; its nonperfect cycle is odd. Otherwise suppose, for contradiction, that every original leaf is saturated by every maximum matching. Choose an original leaf u and its neighbor v. Since u has just one incident edge, uv belongs to EVERY maximum matching.

Delete u,v. A maximum matching of R has the form {uv} plus a maximum matching of R'=R-{u,v}. Conversely any maximum matching of R' together with uv is maximum in R: deleting u,v from one maximum R-matching gives size nu(R)-1, and an R'-matching of size nu(R) could be enlarged with uv. Because R is nonperfect, at least one component K of R' has no perfect matching.

If the induction hypothesis gives an exposed leaf z of K, choose such a component matching and maximum matchings in the other components. If z was already an original leaf of R, adjoining uv contradicts the assumed saturation of all original leaves. Otherwise the only deleted neighbor z can have is v (u had only neighbor v); thus zv is an original edge. Replacing uv by vz exposes the original leaf u, again a contradiction. This also handles an isolated K: its only vertex z must be adjacent to v by connectedness of R, so the same replacement applies.

If K is an odd cycle with no leaves, connectedness of R supplies a cycle vertex z adjacent to v. Every vertex of an odd cycle is exposable by a maximum cycle matching. Choose that matching and apply the same replacement uv to vz. This exhausts the induction cases and proves the assertion.

Thus, when F is connected unicyclic and nonperfect, either F is an odd cycle or some original F-leaf z is exposed by a maximum matching M. In the latter case the degree-two lower bound in L forces wz to be an edge. In the odd-cycle case w has a neighbor z (indeed its L-degree is at least two), and a maximum F-matching can expose that z.

## 3. Constructing the WKE witnesses

### Nonperfect F

Use Section2 to choose a maximum F-matching M exposing a neighbor z of w. Set P=M union {wz}. This is a matching of size nu(F)+1. Section1 supplies a cover Q0 of F-M with size at most nu(F). Set Q=Q0 union {w}. It covers every F-edge outside P and every remaining edge incident with w, and |Q|<=|P|.

This case permits triangles in L and places no bound on F's order, degrees, attached trees or number of branches.

### Perfect F that is not a cycle

Write |V(F)|=2r and take any perfect matching M. Since F is connected unicyclic, |E(F)|=2r, so F-M has exactly r edges. As F is not a cycle, some vertex has degree at least three in F; after its one matching edge is removed it remains incident with at least two edges. Cover that adjacent pair by its common vertex, and cover each of the other r-2 edges by one endpoint. This gives a cover Q0 of F-M with size at most r-1.

Now P=M and Q=Q0 union {w} are WKE: |Q|<=r=|P|. Again triangles in L are allowed in this witness construction.

### F is an even cycle and N_L(w) is independent in F

Choose either alternating perfect matching M of F; its complement N is also a perfect matching. For each edge of N select one endpoint, requiring that endpoint to be its w-neighbor if it has one. This requirement is consistent because independence ensures no edge of N has two w-neighbor endpoints. The selected set Q has |Q|=|M|, covers N, and contains every neighbor of w. Hence P=M,Q are WKE.

The only case not covered by these constructions is an even-cycle F containing adjacent neighbors of w. This proves the theorem.

## 4. Triangle-free CS consequence and remaining question

If L is triangle-free, N_L(w) is independent in F, so the exceptional description cannot occur. The ordinary construction therefore supplies WKE for every triangle-free apex-unicyclic link in this entire unbounded family. The accepted `triangle_free_wke_link_exclusion_v1.md` then excludes it with arbitrary outside attachments; that transfer retains its declared Kotzig theorem dependency. The current note itself uses only elementary maximum-matching swaps and induction.

For a minimum-CS graph admitting a one-cycle triangle cover, an actual cover leaf v with selected parent w has the proved property that L_G(v)-w is connected unicyclic. Therefore the remaining such leaf link must contain a triangle. The four-branch theorem additionally gives deg_L(w)>=4, but no bounded-order or bounded-degree availability is claimed.

The next question is the triangle-bearing apex-unicyclic interface. WKE existence in the first two cases above alone does NOT settle it. Its residual literal clique blocks may contain three or four link vertices, and a valid equality augmentation or cover-overlap saving remains necessary. The even-cycle exceptional case also needs a different reduction, because even wheels genuinely need not be WKE.

Dependencies for the corollaries: `triangle_free_wke_link_exclusion_v1.md` (SHA 32a847bf9d8514b514d7f7f3cee7e193a8387528137ad678697d5a4238763a65); `link_excess_and_one_cycle_leaf_v1.md` (SHA 46d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b); and the accepted finite/declared-input all-size assembly `four_branch_cs_link_exclusion_v1.md` (SHA 63073280de746c6925b4765d2dad2e5a52c8749827889c0831e174db59dd4d91), only for the optional degree-four consequence. No source is mutated and no new computation is a proof premise.
