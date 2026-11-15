# K5 triangle-page overlaps cannot refute the parity gate

Ordinary TUZA-19 result, frozen for review. Requested Astra/Ultra; actual precise serving identity not independently exposed. Original start `2026-11-15T01:53:58Z`, research cutoff `09:23:58Z`, hard deadline `09:53:58Z` retained. Local Darwin only. This proof has not yet received a separate fresh AI review or Lean verification. No historical originality claim is made.

## Exact structural gate and its role

Root asked whether cyclic or inhomogeneous K5 overlaps could keep cover criticality and two-edge packing resilience while producing pi(G)>2nu(G), after the full-two-per-block cut bound ceased to apply because packing capacity was lost.

The following substantial overlap class always satisfies the stronger parity-cover inequality, regardless of criticality or resilience. It includes the shared-triangle book and arbitrary cyclic overlaps among base triangles, and explicitly allows the packing number to be less than twice the number of K5 blocks.

**Theorem.** Let J be any finite simple graph. Choose a finite indexed family T_1,...,T_b of actual triangles of J, with repetitions allowed, whose edge union is E(J). For each i add two fresh vertices d_i,e_i and all edges making T_i union {d_i,e_i} a K5. Different pages have disjoint fresh vertex sets, and there are no other new edges. Call the resulting graph W. Then

    pi(W)<=2nu(W).

More concretely, write m=|E(J)|. Form the bipartite incidence graph between the b pages and the m core edges, joining a page to its three base edges. Let M be the size of ANY maximal matching in this incidence graph. There is an explicit odd triangle cover of size m+b and an explicit triangle packing of size b+M, and

    m+b <= 2(b+M).

If at least one core edge belongs to two different indexed base triangles, the displayed cover is strictly smaller than twice the displayed packing. Thus these overlaps supply positive slack in this certificate, rather than producing a parity obstruction.

This does not cover arbitrary K5 edge-gluings: a K5 block whose vertices are identified with four or five nonprivate core vertices need not have the private pair required here. Nor does it cover arbitrary additional core edges outside the chosen base-edge union. Those are explicit remaining escapes, not cases covered implicitly.

## Complete ordinary proof

**All actual triangles.** Every fresh vertex has all its neighbors in its own K5. Hence a triangle containing a fresh vertex lies entirely in that K5. Its fresh-containing triangles have either one fresh vertex and a core base edge, or both fresh vertices and one base vertex. Every triangle without a fresh vertex is an actual triangle of J, whether or not it was chosen as a base. This is the complete triangle family. Sharing original vertices or edges among arbitrarily many pages creates no other fresh-containing triangles.

**Odd cover.** Select every edge of J and every fresh-pair edge d_i e_i. A core triangle contains three selected edges. A local triangle with one fresh vertex contains its single selected core edge. A local triangle with two fresh vertices contains its single selected fresh-pair edge. Therefore every actual triangle is met oddly, and the cover has m+b edges.

**Packing.** For an unmatched page with base {a,b,c}, take the single triangle a d_i e_i. For a matched page whose assigned core edge is ab, take the two triangles

    a b d_i,    c d_i e_i.

Their edge sets are disjoint. They use only one core edge, namely the assigned ab. Different matched pages have different assigned core edges. All other used edges touch fresh vertices private to their own page. Thus the complete collection is an edge-disjoint packing with b+M triangles. Shared core vertices are harmless, since packing requires edge disjointness rather than vertex disjointness.

**Counting.** Every core edge lies in the neighborhood of a matched page. A matched core edge lies in its matched page. An unmatched core edge must have no unmatched page neighbor, since that pair would extend the matching by one; it has some page neighbor by the edge-union hypothesis, so that neighbor is matched. The M matched pages each have exactly three distinct core-edge neighbors. Hence

    m<=3M,    M<=b.

It follows that

    m+b <= 3M+b <= 2M+2b = 2(b+M) <= 2nu(W).

Combining with the explicit odd cover proves the theorem. No exact matching optimization or maximum packing computation is needed: any greedy maximal incidence matching certifies the bound.

For strictness, if M<b, then 3M+b<2M+2b. If M=b and an edge is repeated among the indexed bases, then m<3b=3M, so the first inequality is strict. This covers every case with an overlap of base edges. For b=0 the edge-union hypothesis forces m=0, and the empty cover and packing prove the statement, with arbitrary isolated core vertices allowed.

## Exact cover profile: how criticality constrains these overlaps

The following formulas remain valid even if some core edges are not in the chosen base union. They explain why dense shared-triangle controls lose criticality.

For a cover D of the actual triangles of J, let r_i=|D intersect E(T_i)|, so r_i is 1,2 or3. The minimum number of added edges needed to cover page i is

    beta(1)=3,    beta(2)=3,    beta(3)=1.

For r_i=3, the fresh-pair edge alone suffices and at least one added edge is needed. For r_i=1, a balanced 2+3 cut-complement cover of K5 extending that red base edge has total size four, so three added edges suffice; fewer would violate tau(K5)=4. For r_i=2, three added edges suffice: if ab and ac are selected while bc is not, choose d_i e_i, c d_i, c e_i. Two added edges would give a four-edge cover of K5 with exactly two selected edges on a triangle, impossible because every four-edge cover of K5 is a balanced-cut complement.

For completeness, the last local classification is elementary. A four-edge cover of K5 has a triangle-free six-edge complement. Such a graph has maximum degree three: degree at most two would give at most five edges, while degree four would leave an independent neighborhood and at most four edges. At a vertex of degree three its independent neighborhood accounts for three edges, and the only remaining vertex can supply at most three more. Equality forces K2,3. Thus every minimum four-edge K5 cover is indeed a balanced-cut complement.

Fresh edges belong to only one page. Hence

    tau(W)=min_(D a triangle cover of J)
      [ |D|+3b-2 #{i: E(T_i) subset D} ].                 (C)

**Every minimizing D meets each selected base triangle oddly.** If some base has r_i=2, add its missing core edge. The core cost rises by one. The page's added-edge cost drops by two. Every other page cost either stays the same or also drops: the only transitions are 1->2 with no change, or 2->3 with a decrease. This gives a smaller global cover, a contradiction.

Consequently all minimum covers restrict to one-red or three-red states on every chosen base, and their optimal local extensions are odd. If the F2-span of the chosen triangle boundaries contains every actual triangle boundary of J, every minimum cover of W is itself an odd cover, and pi(W)=tau(W). This span observation is not needed for the main packing certificate.

**Exact criticality criterion.** Let the minimizers in (C) be the optimal core states. Then W is edge-cover-critical if and only if both conditions hold:

1. Every core edge occurs in at least one optimal core state.
2. For each indexed page i, at least one optimal core state has r_i=1.

To justify this, an edge is cover-critical exactly when it belongs to some minimum cover. Every fresh-pair edge can occur in a local minimum extension for either allowed base state. For r_i=3, the unique one-edge extension is the fresh-pair edge, so no cross spoke occurs. For r_i=1, every specified cross spoke can occur in some balanced-cut minimum extension with that fixed single selected base edge. Thus all six cross spokes of a page are allowed precisely when some optimal core state gives that page a one-red base. Local choices extend independently. Together with condition 1 for original edges, this proves necessity and sufficiency.

This characterization does not assert that criticality alone forces the main theorem's edge-union hypothesis. It only identifies the exact minimum-cover state requirement inside the stated construction.

## Exact packing profile and the shared-triangle control

Let Q be any packing of actual core triangles in J. Let mu(Q) be the maximum matching size between pages and the unused core edges E(J) minus E(Q). Then

    nu(W)=b+max_Q [ |Q|+mu(Q) ].                         (P)

The lower bound follows by combining Q with the packing construction above on the remaining edges. For the upper bound, take a maximum packing of W. Every page has at least one local triangle: if it had none, a triangle a d_i e_i using no core edge could be appended. A page has at most two local triangles, since K5 has packing number two. If it has one, replace it by a triangle using the fresh-pair edge and no core edge. If it has two, at least one core edge is used, since two triangles both avoiding core edges would share d_i e_i. Retain one used core edge ab and replace the local pair by ab d_i and c d_i e_i. This frees all other core resources and preserves disjointness. The pages with two triangles now assign distinct unused core edges, producing the required incidence matching. Core triangles form Q. This proves (P).

There is also an exact formula after deleting fresh-pair edges. For D a set of page indices, let mu_D(Q) be the maximum bipartite matching with core-edge capacity one, page capacity two for pages in D, and page capacity one otherwise, again avoiding E(Q). Then

    nu(W-{d_i e_i:i in D})
      = b-|D| + max_Q [ |Q|+mu_D(Q) ].                  (P-D)

A deleted page has no triangle avoiding core edges and can use one or two assigned distinct base edges, realized with its two different fresh vertices. A nondeleted page retains its free fresh-pair triangle and at most one extra matched core edge. This gives both directions just as in (P). Therefore resilience to one or two fresh-pair deletions requires the optimized bracket to increase by exactly the number of deleted pairs. This is a necessary and sufficient test for those particular deletions, not for every edge deletion.

For b>=1 pages all sharing the same core triangle,

    tau(W)=pi(W)=b+3,
    nu(W)=b+min(b,3).

Indeed (C) compares a one-red core of cost 1+3b with the all-red core of cost 3+b; (P) uses a matching of size min(b,3), while using the core triangle itself contributes only one. For b>=2 the all-red core is the unique optimal core state, so none of the cross spokes belongs to any minimum cover: the graph is not edge-cover-critical. For b=2 deleting the two fresh-pair edges leaves packing number at most three, below nu=4. For b>=3 even deleting one fresh-pair edge lowers the packing upper bound to b+2, below nu=b+3. Thus the shared-triangle books with multiple pages fail both required hypotheses, in addition to satisfying the parity inequality with slack.

## Decision and remaining escape

This closes arbitrary triangle-page K5 overlap networks whose base edges cover the core, including cyclic and inhomogeneous networks with packing loss. The proof supplies explicit cover and packing certificates and does not rely on a bounded census, on criticality, or on the disputed availability of a global decomposition.

The H-O2 gate itself remains unresolved. A gluing counterexample must escape this private-pair class (for example, through K5 blocks with at least four shared vertices), or contain relevant core edges outside the base-edge union. No theorem says every edge-critical, two-edge-resilient graph admits this representation. The exact cover and packing profiles above identify that availability gap and prevent treating the restricted closure as a general proof.

Earlier edge-decoration proof remains unchanged at `notes/parity_gadget_constraints.md`, SHA-256 `dedde7192372fba54e8f1f5aa7a4bb38ad8d42192fced30e4f1ab902208cc321`. Its all-edge K4/K5 decoration result was reconstructed by root as an ordinary proof; no formal verification is claimed.
