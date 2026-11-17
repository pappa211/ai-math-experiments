> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Closed links with at most three branch vertices are excluded by CS

Status: ordinary all-size proof candidate, frozen for fresh review. A branch vertex has link degree at least three. This is an intermediate structural result toward the four-branch equality target, not a substitute for it.

## Theorem

Every nonempty closed link component of a minimum combined-CS failure has at least FOUR vertices of link degree at least three.

Use the authenticated minimum-link-degree-two and robustness conclusions, together with the newly accepted link-deletion and parallel-thread exclusions. No finite WKE certificate is used.

## 1. The only remaining suppressed shape

Let L be such a connected component with at most three branches. With no branches, L is a cycle, excluded as an apex-forest link. Otherwise suppress its maximal degree-two paths. Returning paths are excluded by link-vertex deletion. Between two distinct branches, the parallel-thread theorem permits at most one nondirect path; if a direct edge also occurs, that nondirect path must have even length.

One branch is therefore impossible. Two branches would each need at least three incident paths, giving at least two nondirect parallel paths, impossible.

With three branches, each pair supports at most two paths. Let p be the number of suppressed paths. The branch degrees are at least three, so p is5 or6. The cycle rank is mu(L)=p-2. If p=5, the degree sequence is(4,3,3), contradicting mu>=Delta from the accepted link-excess corollary. Therefore p=6. Every branch pair has two paths: one direct edge and one even nondirect path.

Write the branches a,b,c. They form a triangle. There is an even-length nondirect path between each pair, with all interiors disjoint and of link degree two. These three nondirect paths together form an even outer cycle C. No other link edges exist.

## 2. A long outer path supplies a safe page augmentation

Let |C|=2s and take either perfect matching P of C. Since each branch-to-branch outer path has even length, all three branches have the same cyclic parity. The complementary perfect matching has three distinct edges incident with a,b,c. Select those three branch vertices in Q, and one endpoint of each of its remaining s-3 edges. Then |Q|=s and Q covers every edge of L-P, including the branch triangle.

Delete all hub spokes to L and all edges P, obtaining K. Balanced minimum-CS accounting gives B(K) and nu(K)=nu(G)-s.

If an outer path has length at least four, P contains an edge f between two of its degree-two interior vertices. Neither endpoint belongs to any L triangle, and any extra page on f supplied by codegree has apex outside the entire hub neighborhood. The complementary perfect matching of C avoids f. Every residual block contains at most three L vertices, since L has clique number three; a block containing a page endpoint contains at most two. Thus the complete matching-plus-page footprint is a star of at most two edges per block. The accepted safe-page argument appends s+1 triangles, contradiction.

It remains that all three outer paths have length two.

## 3. The three-ear triangle link

Let x be the degree-two vertex on the a-b path, y on b-c, and z on c-a. The full link consists of core triangle abc and legs ax,bx,by,cy,cz,az. Denote the hub by h. Use

    P={ax,by,cz}, Q={a,b,c}.

After deleting P and all six h-spokes, balanced accounting gives B(K) and nu(K)=nu(G)-3. The surviving link edges are

    ab,bc,ca,bx,cy,az.                                     (1)

We first show that no edge of P has an outside page, meaning a triangle on that edge whose apex is neither h nor the other endpoint of its branch pair. For example, any such page axq has q outside the entire N_G(h), because x has only a,b as link neighbors.

Use the alternate outer matching P'={bx,cy,az}. Its three hub triangles and axq are pairwise edge-disjoint. In a residual block, at most one of bx,cy,az can occur: their degree-two tips are pairwise nonadjacent. The page contributes at most one spoke because ax was deleted. A disjoint pair consisting of a page spoke and one of these matching legs cannot occur in a block. For aq with bx, the required ax is absent; for aq with cy, the required ay is absent; aq with az shares a. For xq with cy or az, respectively xy or xa is absent; xq with bx shares x. Thus every complete footprint is a star of at most two edges, and the four triangles augment K, contradiction.

The same argument applies cyclically to by and cz. Hence every actual triangle on any removed rim edge is its hub page or its displayed ear triangle abx,bcy,caz.

Now replace the six-edge balanced cover extension by

    X={ab,bc,ca,hx,hy,hz}.

This covers EVERY lost triangle: the branch core edges cover hub triangles on core bases and the three ear triangles; each tip spoke covers both hub triangles at that tip. There are no other pages on P by the preceding paragraph, and closedness of L accounts for all removed hub spokes.

The triangle abc survives in K, so in B(K) a minimum cover can be chosen containing ab. It overlaps X. Therefore

    tau(G)<=tau(K)+|X|-1=2nu(K)+5<2(nu(K)+3)=2nu(G),

contradiction. This excludes the final shape and proves the theorem. ∎

## Dependencies and remaining four-branch target

- `notes/link_vertex_deletion_cyclic_components_v1.md`;
- `notes/link_excess_and_one_cycle_leaf_v1.md`;
- `notes/parallel_thread_link_exclusion_v1.md`;
- authenticated class-local M0/codegree/robustness, one-/two-star clique avoidance, and minimum-cover edge containment in literal B blocks.

The exact suppressed-shape argument and all arbitrary outside-page footprints are supplied above. The historical four-branch WKE theorem concerns an inequality reduction only. The irreducible FOUR-branch shapes still require separate CS mechanisms; this note does not promote their finite WKE certificates to equality proofs. No computation or imported matching theorem is a premise.
