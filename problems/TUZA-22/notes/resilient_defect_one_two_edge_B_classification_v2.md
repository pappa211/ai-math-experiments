> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A resilient defect-one graph with a two-edge B deletion has packing at most five

Frozen clarified ordinary proof candidate v2, 2026-11-16. The v1 wording used "connected triangle support" without explicitly distinguishing shared-edge connectivity from vertex connectivity; this v2 makes the load-bearing convention explicit and preserves v1 unchanged. This classifies one exact representation of a near-tight residual. It is NOT a bound for all connected defect-one graphs.

## Theorem

Let the ENTIRE actual triangle family of J be nonempty and connected under SHARING A GRAPH EDGE (one shared-edge-connected triangle component), with tau(J)=2nu(J)-1, and nu(J-e)=nu(J) for every actual edge e. Suppose H=J-F satisfies B for a set F of at most two edges. Then one of the following holds, allowing arbitrary triangle-free background:

1. The entire triangle support is K5-e, with packing number two.
2. The triangle family consists of one literal K4 C together with one or two old literal K4/K5 components. Each old component meets C in exactly one edge, and if there are two shared edges they are ADJACENT edges of C. There are no other actual triangles.

Consequently nu(J)<=5. The bound is attained by a K4 with two fresh K5s attached along two adjacent edges. No proper-subgraph CS assumption or finite computation is needed.

## 1. Accounting and whole-pair compatibility

Put m=nu(H), p=nu(J). A new triangle exists, else J would have defect zero. Elementary insertion over B gives p>=m+1. Cover extension gives

    2p-1=tau(J)<=2m+2,

so p=m+1 and tau(J)=2m+1. A one-edge restoration would have all new triangles on that edge, making its deletion packing-critical. Thus |F|=2.

For ordinary pages, the union of all spokes of one missing base meets each old block in at most one edge. Two disjoint pages therefore append to a maximum H packing unless some old K4 contains opposite spokes from the two pages. K5 avoids any two edges; K4 avoids every two-edge star.

For pages on two adjacent missing bases, even that opposite obstruction is impossible: in a block containing the common endpoint all spokes form a star; in a block not containing it, disjoint spokes put two of its old neighbors into the clique and the old triangle on those neighbors forces the common endpoint into the same block. Therefore disjoint ordinary pages on adjacent bases always append.

These are the exact whole-footprint facts proved in the R3 case arguments; the proof here uses them for deficit one, not equality.

## 2. Adjacent restored edges give only K5-e

Write F={ab,ac}. Both ordinary page families must be nonempty. If only one were nonempty, deleting that family's restored base would remove every new triangle, including the possible two-new-edge triangle abc, and leave packing at most m, contrary to resilience. The same applies if both are empty.

The compatibility rule forces every pair of opposite ordinary pages to intersect. Their apices must coincide, and fixing one page on each base shows the entire families are exactly abx,acx for one x outside {a,b,c}.

If bc is absent, deleting the common old spoke ax removes both new triangles and lowers packing, impossible. Therefore bc is old. The actual old triangle bcx lies in one old clique component B. The complete new family consists of the three faces abx,acx,abc of a K4, with old face bcx in B.

If B is K5, it has a minimum four-edge cover containing all three bcx edges (that triangle plus the complementary pair). That old minimum cover already hits every new triangle, giving tau(J)<=2m, contradiction. Therefore B is K4, say on {b,c,x,y}.

The edge ay is absent in H: if it existed, the actual old triangle axy would share xy with B and force a into B, contrary to the missing ab. The old K4 and the new faces therefore form a literal K5-ay core C. The only C edge outside B that could be old supported is ax. If ax belongs to another old block, choose that block's minimum cover through ax and the three-edge C cover

    {ax,bc,xy}.

The latter is the old K4 opposite cover bc,xy plus ax, and covers every C triangle. Replacing the old B cover costs one, but the overlap on ax saves one, giving tau(J)<=2m, contradiction. Hence ax is old background.

All actual new triangles have been listed. The K5-e core has support disjoint from every other old block, so connectedness of the triangle support forces there to be no other old component. Thus the support is exactly K5-e and p=2.

## 3. Disjoint restored edges require an intersecting page pair

Write F={ab,cd}. Both families are nonempty by resilience; otherwise deleting the active restored base removes every new triangle.

Suppose EVERY page on ab is edge-disjoint from EVERY page on cd. Choose abx,cdy. They require an old K4 opposite-spoke obstruction. Relabel endpoints so it is

    B on {a,x,c,y}, with opposite edges ax,cy.

Its vertices are distinct and b,d lie outside B. Consider another ab-page abz. It must also be obstructed against cdy. If the selected cd-page spoke is cy, its block is B and the opposite edge is ax, so z=x. If the selected spoke is dy, an obstruction using az would share the old edge ay with B and hence force d into B. An obstruction using bz puts b,y in a block B'; the old triangle bxy, using bx from the fixed ab-page, xy in B and by in B', merges B and B' and forces the missing ab. Both are impossible.

Hence abx is the only ab-page. Symmetry gives cdy as the only cd-page. A minimum old B cover can be the opposite pair ax,cy and already covers both pages, contradicting tau(J)=2m+1.

Therefore an intersecting opposite pair exists. Relabel it as abc,cda, sharing ac.

## 4. The whole new family is a K4

An ordinary ab-page abx outside the four terminals would be disjoint from cda, whose apex a is an endpoint of its base. Such two pages are compatible: any disjoint pair of old spokes in one block would put a and b into that clique, contradicting missing ab. Thus every ab-page must have apex c or d. Similarly every cd-page has apex a or b.

All new triangles lie on {a,b,c,d}. The intersecting pair supplies at least three of the old cross edges ac,ad,bc,bd. If there are only three, the complete new family consists of two triangles sharing an old cross edge. Deleting that shared edge removes every new triangle and leaves packing at most m, contradicting resilience. Hence all four cross edges exist, and the new family is exactly the four faces of the literal K4 C on those terminals.

Every old block meets C in at most one edge: it cannot contain both a,b or both c,d, so has at most two C vertices. Let S be the subset of C edges supported in H. These are among the four old cross edges.

The set S is nonempty. Otherwise C and the old triangle supports are edge-disjoint actual triangle components, giving defect zero instead of one. It cannot contain an opposite pair of C edges: those two edges lie in different old blocks, so one minimum H cover can contain both, and they already cover C. That would give tau(J)<=2m.

A subset of the cross four-cycle containing no opposite pair has at most two edges; if two, they are adjacent. Each supported edge belongs to a distinct old block. Since all new triangles are in C and the whole triangle support of J is connected, every old block must meet C. Therefore there are exactly one or two such blocks and no others. This proves the classification in the theorem and

    p=m+1<=2+2+1=5.

## 5. Ordinary sharp construction and its resilience

Take a root K4 on {a,b,c,d}. Attach one fresh K5 along ab and another fresh K5 along ac, using three fresh vertices for each and no further edges. All actual triangles lie in the three displayed cliques. Delete the opposite root edges ad,bc. The remaining root cross four-cycle has no triangle, so H has exactly the two literal K5 triangle components and is B.

The full graph has packing five: choose two triangles from each K5 avoiding its attachment edge, then one root triangle. Conversely assign any packed triangle to its K5 or the root K4, giving at most2+2+1=5. Its cover number is nine. A root opposite-pair cover overlaps one chosen old minimum cover and gives4+4+2-1=9. A cover of size eight would have to be a minimum cover of the two old K5 components and use no old-background root edge. Its root edges would then lie only in {ab,ac}, which does not cover the root face bcd. Thus eight is impossible.

It is edge-packing-resilient. If the deleted edge belongs to one attached K5, choose a root triangle avoiding that K5's attachment edge, a maximum packing of that K5 avoiding the deleted edge, and a maximum packing of the other K5 avoiding its possible root overlap. If the deleted edge is a root edge outside the attachments, choose a root triangle avoiding it and maximum K5 packings avoiding their respective possible shared root edges. Each case supplies five triangles. The same argument handles deletion of an attachment edge by choosing a root triangle avoiding it. Hence nu remains five after every single-edge deletion.

## Exact residual role

The theorem supplies a new finite structural bound ONLY when a two-edge deletion of a resilient defect-one graph with ONE SHARED-EDGE TRIANGLE COMPONENT is already known to be B. Merely requiring the union of triangle-support edges to be vertex-connected would be insufficient: extra literal K4/K5 components may be glued at vertices and would increase packing arbitrarily without changing the defect. It neither asserts that such a deletion exists nor bounds arbitrary near-tight graphs. In particular it does not contradict the previously constructed unbounded near-tight families outside this representation.

Dependencies are elementary literal clique properties, actual triangle-component additivity and closure, and the whole one-base footprint lemma. No global CS assumption, external matching theorem or finite solver certificate is used.
