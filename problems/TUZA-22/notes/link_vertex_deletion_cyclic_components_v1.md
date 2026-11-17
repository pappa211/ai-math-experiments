> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every component left by deleting a link vertex contains a cycle

Status: ordinary all-size proof candidate, frozen for fresh review. This is an available restriction on a minimum combined-CS failure. The perfect-tree and nonperfect-tree arguments remain separate; a cover tuple omitting the boundary vertex is never localized.

## Theorem

Let G be a minimum-edge failure of combined CS, globally or within an edge-subgraph-hereditary class, with isolates discarded. Use the authenticated class-local M0/codegree/robustness conclusions and the accepted two-edge packing resilience from R2. For every vertex v and every neighbor w of v, EVERY nonempty connected component of

    G[N_G(v) minus {w}]

contains a cycle.

Equivalently, deleting any vertex from a link of G leaves no tree component. The whole link need not be connected. This strengthens exclusion of an entirely apex-forest closed link: other cyclic components and arbitrary outside attachments are permitted throughout.

Put L=G[N_G(v)]. Suppose, toward a contradiction, that a component F of L-w is a tree. Every vertex of L has degree at least two. Hence F has no isolated vertex, and every leaf of F is adjacent to w. Write U=V(F) union {w} and L'=L[U]. Then L' is connected, L'-w=F, and no F vertex has a link neighbor outside U. The boundary vertex w may have arbitrarily many outside link neighbors.

## 1. Perfect F: apply the defect-one residual theorem

If F has a perfect matching, set H=G-vw. M0 and two-edge resilience give

    nu(H)=nu(G), tau(H)=2nu(G)-1,
    nu(H-e)=nu(H) for every remaining edge e.

Every proper edge-subgraph of H satisfies CS by minimum choice of G. Its link at v is exactly L-w, so F is a CLOSED perfect-matchable tree component in H. This contradicts `defect_one_perfect_tree_link_exclusion_v1.md`.

This branch does not localize the perfect apex-forest proof: that proof sometimes uses a cover tuple omitting w, which would not automatically cover outside pages on vw. The defect-one theorem resolves the perfect branch directly.

## 2. The boundary-cover reduction for nonperfect F

A tuple P,Q on L' consists of a matching P, a vertex cover Q of L'-P, and

    w in Q, |Q|<=|P|=s.

Delete all spokes vu with u in U and all rim edges P, obtaining K. The s hub triangles on P append to any K-packing. The selected set

    P union {vq : q in Q}

covers EVERY removed triangle:

- a triangle using a removed rim edge is covered by that edge of P;
- a triangle using vu with u in F has its other link vertex in U, since F is a component of L-w, and is covered by P or by a spoke to Q;
- a triangle using vw whose third vertex lies outside U is covered by vw, because w belongs to Q.

Thus all lost outside pages are accounted for. Minimum-CS accounting forces |Q|=s, B(K), and nu(K)=nu(G)-s; strict |Q|<s is already contradictory.

The graph L' contains no K4, because deleting w leaves a tree. Thus any residual K4/K5 block contains at most three U vertices, and any matching in L' contributes at most one surviving edge per block. A larger L' matching than P would therefore augment the residual packing after one-edge avoidance.

The two augmentation forms in the established nonperfect proof also localize exactly:

- **Internal form.** If f=ab lies in P, wab is an L' triangle, and L'-E(wab) has an s-matching, append its hub triangles and wab. The rim triangle contributes at most one surviving edge per residual block because f was deleted; the matching contributes at most one. A disjoint pair would require four U vertices, impossible. The complete footprint is a star of at most two edges.
- **Safe external form.** If f=ab lies in P, neither endpoint is in any L' triangle, and L'-f has an s-matching, codegree supplies a page abz other than vab. Its apex is outside the ENTIRE N_G(v): an apex in N_G(v) but outside U would connect a vertex of F to another component of L-w, while an apex within U would form an excluded L' triangle on f. The selected hub triangles and this page are edge-disjoint. Each residual block contains at most one page spoke, and a block containing one of its F endpoints cannot contain three U vertices. Hence its matching edge and page spoke cannot be disjoint, again giving a star of at most two edges.

K4 and K5 maximum packings avoid such stars. Both forms therefore append s+1 triangles to a maximum K-packing, contradicting nu(G).

## 3. Nonperfect F of order at least four

Apply the purely forest matching selection proved in `apex_forest_nonperfect_branch_v2.md`, Sections1 and3–5, to F and its leaf-neighbor w. Its hypotheses are exactly that F is a forest without isolates, has no perfect matching, every F leaf is adjacent to w, and |U|>=5. All hold here.

That selection supplies one of the following alternatives, with r=nu_matching(F):

1. P=M for a maximum F matching, Q={w} union a cover of F-M, |Q|<=r, while L' has a matching of size r+1;
2. P=M union {wx}, where x is an exposed original F leaf, Q={w} union a cover of F-M, |Q|<=r+1, and an internal triangle with an edge in M admits the matching-preserving augmentation described in Section2;
3. the same form of P,Q, together with a safe edge in M admitting the external-page augmentation described in Section2.

Every one of these tuples contains w in Q. The underlying proof uses the elementary forest matching/cover identity, the two exposed-leaf facts, and the proved alternating-reach decomposition. It uses closedness only in the accounting and augmentation interfaces, which Section2 has now replaced by the explicit boundary-cover audit. Its only small-order exclusion was F=P3, handled separately below. No perfect-branch tuple with w omitted is used.

Alternative1 is contradicted by the larger matching; alternatives2 and3 by their complete-footprint augmentations. Thus this case is impossible.

## 4. The remaining nonperfect small tree F=P3

Let F have path a-b-c. Its leaves a,c are adjacent to w. The only possible additional link edge within U is wb, so L' is either a four-cycle or a diamond.

In both cases use

    P={ab,wc}, Q={w,b}.

The set Q covers L'-P and contains w, so Section2 gives B(K) after deleting these two rim edges and all four spokes from v to U.

### Four-cycle case: wb is absent

The alternate matching {wa,bc} avoids ab. Codegree at least two gives an actual page abz other than vab. Its apex is outside N_G(v), by the component condition and wb absent. Since L' is triangle-free, each residual block contains at most two U vertices. The two alternate hub triangles plus abz have footprint at most a two-edge star in every residual block: a page spoke disjoint from the matching edge would require three U vertices. Appending them to a maximum K-packing gives one too many triangles.

### Diamond case: wb is present

If w has no link neighbor outside U, then L' is a closed diamond component of L, excluded by the authenticated robustness lemma. Otherwise choose a link neighbor d of w outside U. The following THREE actual triangles are pairwise edge-disjoint:

    vab, wbc, vwd.

Their surviving K-edge footprints are respectively empty, {wb,bc}, and {vd,wd}. A residual block cannot contain both wb and bc, because wc was deleted; it cannot contain both vd and wd, because vw was deleted. Across the two pairs, the only possible pair in one block is {wb,wd}, which is a star at w:

- wb with vd would require the deleted vb and vw;
- bc with vd would require deleted vb or vc;
- bc with wd would require deleted wc.

Thus the complete three-triangle footprint in every residual block is a star of size at most two. Maximum block packings avoid it, and the three displayed triangles augment the balanced two-triangle reduction, contradiction.

This excludes F=P3 and completes the proof. ∎

## Dependencies and global role

- `notes/defect_one_perfect_tree_link_exclusion_v1.md`, SHA-256 `179c8f06cbb351fd4668aa6e022fa1dae47f2b1577bb6d578e731099493fe443`, fresh challenger review accepted;
- `notes/apex_forest_nonperfect_branch_v2.md`, SHA-256 `c587035bea6883c1a5f80d0fc261be3e02144c84dae1678a50a6dc82d67fec47`, used only for its ordinary forest matching selection with w in every cover tuple;
- authenticated class-local M0, codegree, robustness, R2/two-edge resilience, and literal clique avoidance.

No computation or external matching theorem is a premise. The theorem supplies an actually available local restriction on any minimum CS obstruction; it does not assert that such an obstruction has a tree component after a link-vertex deletion. Establishing further link structure or another available reduction remains necessary for unrestricted CS or Tuza.
