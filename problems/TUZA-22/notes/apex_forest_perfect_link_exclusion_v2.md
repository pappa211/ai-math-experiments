> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Excluding an apex-forest link with a perfect forest matching

Status: frozen ordinary proof candidate v2, using the established class-local minimal-CS inputs. This revision supplies a direct triangle-free augmentation and removes the prior triangle-free WKE/Kotzig dependency. Fresh review of the revision is required. No unrestricted WKE-to-CS implication is asserted.

Let G be a minimum-edge failure of CS and let L be a closed component of the link at v. Suppose there is w in V(L) such that F=L-w is a forest with a perfect matching. Then this configuration is impossible.

We use M0 balanced accounting and M3 (edge codegree at least two, and each link component has minimum degree two and at least five vertices). These hold for an edge-minimum CS failure in any subgraph-closed class. A balanced reduction for a link matching P and a vertex cover Q of L-P deletes all v-spokes to L and all P edges. Its lost triangles are covered by P together with {vq:q in Q}. If |Q|<|P| it is strict and impossible. If equality holds, the residual K satisfies B and nu(G)=nu(K)+|P|.

Write |V(F)|=2r, let M be its perfect matching, and let c be the number of tree components of F. Every component has at least two vertices. The forest F-M has r-c edges. Choosing one endpoint of each, together with w, covers L-M with at most r-c+1 vertices. Therefore c>=2 gives a strict reduction. If c=1 and two edges of F-M are adjacent, one common endpoint covers both and again gives at most r-1 vertices in the link cover. Thus the only remaining case is that F is connected and both M and F-M are matchings. It follows that F is the path on vertices 1,...,2r in order, with

    M={12,34,...,(2r-1)(2r)},
    N=F-M={23,45,...,(2r-2)(2r-1)}.

Here r>=2 by the lower bound on the link component order. Both path endpoints 1 and 2r are adjacent to w, since they must have link degree at least two.

If L is triangle-free, use the balanced tuple consisting of M and the cover Q={w} plus one endpoint of each N edge. Choose any f in M. Codegree at least two supplies an actual page on f other than its v-page; its apex z lies outside L and differs from v, since L is triangle-free. The matching N union {w1} has size r and avoids f. Its r hub triangles, together with that extra f-page, are edge-disjoint. In a residual clique block there are at most two L vertices, so the surviving matching contributes at most one edge, the f-page at most one spoke, and if both occur they meet. The whole footprint is therefore a star of at most two edges. Appending this r+1 packing to a maximum residual packing contradicts balanced accounting. This closes the triangle-free branch directly.

Hence assume L has a triangle. Every L triangle is wxy for an edge xy of F.

## Case 1: some edge f of M has both endpoints adjacent to w

Use initial matching M and Q={w} together with one endpoint per N edge. Their sizes are r, so balanced accounting gives B(K) after deleting the v-spokes and M. Choose t in {1,2r} outside the two endpoints of f; this is possible since r>=2. The matching

    M''=N union {wt}

has size r and avoids f. The r hub triangles on M'', together with the rim triangle wf, are pairwise edge-disjoint. Indeed M'' is a matching, f is not a member, and t is outside f.

## Case 2: no edge of M forms a triangle with w

There is an edge f in N that does form such a triangle. Use the initial matching

    M'=N union {w1},

of size r. For each edge of M choose one endpoint, including every neighbor of w other than 1. This is possible because no M edge has both endpoints adjacent to w. The resulting r-vertex set Q covers all remaining M edges and every surviving w-spoke in L-M'; thus it is a vertex cover of L-M'. Balanced accounting again gives B(K), now deleting the v-spokes and M'.

Use the r hub triangles on M together with the rim triangle wf. These are pairwise edge-disjoint because f is in N, not M, and no hub triangle based on M uses w.

## Entire residual footprint in both cases

A residual clique block contains at most two vertices of F, since F is a forest. If it contains two, they must be adjacent by a surviving F edge. It can additionally contain w, but no fourth L vertex. Thus its intersection with L is contained in either one surviving F edge, or the triangle formed by that edge and w.

The augmented rim triangle has deleted base f in each case, so at most one of its two w-spokes can lie in a residual block. The new hub packing contributes surviving rim edges from a matching. If a surviving matching edge and a rim-triangle spoke lie in the same block, they meet: otherwise they would require four L vertices. The only possible additional matching edge is the w-edge in Case 1, and a matching never contains both that edge and an F edge incident with its endpoint. A block with w plus a surviving F pair cannot contain a disjoint additional w-edge endpoint. Consequently the entire footprint of all r+1 selected triangles in each old block is a star of at most two edges.

A maximum packing in every residual K4/K5 block can avoid that whole footprint. Appending all r+1 triangles gives nu(G)>=nu(K)+r+1, contradicting balanced accounting. Both cases are impossible, completing the proof.

## Role and remaining obligation

For a minimum triangle cover C that is a forest, a leaf v of C with its unique cover neighbor w has L_v-w a forest: every link edge not incident with w must itself belong to C. This observation motivates the lemma. The lemma treats the branch where that forest has a perfect matching. The complementary branch is treated separately in `notes/apex_forest_nonperfect_branch_v2.md`. No claim is made here that every minimum-CS obstruction has a forest cover, or that all apex-forest links have already been excluded.
