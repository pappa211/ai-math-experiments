> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# An anchored packing-cover theorem for every forest triangle cover

Status: ORDINARY_PROOF_CANDIDATE, frozen for adversarial reconstruction. Challenger, 2026-11-16 UTC. This is an existential anchored theorem; it does not assert the stronger residual inequality for every maximum packing minimizing its two-cover-edge members.

## 1. The theorem

Let H be a finite simple graph and let C be a forest subgraph whose edges meet every actual H-triangle. Then there exist an edge-disjoint triangle packing I in H and an actual triangle-edge cover D of H such that

    C intersect E(I) is contained in D, and |D| <= 2|I|.

The forest may be disconnected, need not span H, and need not be a minimum cover. D may use any actual edges of H. The packing I is existential and is not claimed maximum. Every actual triangle, including crossing triangles, is included.

The proof uses leaf induction and the pointed apex-forest matching lemma below. No minimal-CS, equality classification, finite enumeration, or external matching theorem is an input.

## 2. Elementary forest matching facts

For a forest F, its minimum vertex-cover size equals its matching number. A self-contained leaf induction proves this: if x is a leaf with neighbor y, a minimum cover can be chosen to contain y and omit x (replace x by y if necessary), and a maximum matching can be chosen to contain xy (replace the edge matching y if necessary). Both optima are one plus the corresponding optimum after deleting x,y. Edgeless forests have both parameters zero.

We also need a precise alternating-reach decomposition. Fix a maximum matching N in a forest F. Let U be the vertices reachable from an N-unmatched vertex by an even alternating path starting with a nonmatching edge, including paths of length zero; let A be those reachable by an odd such path, and Z the unreached vertices.

These sets are disjoint and partition V(F). If a vertex were reached at both parities from different unmatched roots, uniqueness of paths in a forest allows their common final subpath to be removed, giving an alternating augmenting path between two roots. The same root cannot have two different paths to that vertex. Thus the two reached sets are disjoint.

Every neighbor of U belongs to A. A matching neighbor is the predecessor on an even alternating path, and a nonmatching edge extends such a path to odd length. Such an extension cannot revisit an earlier path vertex, since that would create a cycle in F. Conversely every A vertex has a predecessor in U. Hence A=N_F(U), U is independent, and no U-Z edge exists.

Every A vertex is matched, or its odd alternating path would augment N, and its matched partner belongs to U. Each matched U vertex has its partner in A. Every Z vertex is matched within Z, since an unmatched vertex would be a root and a matching edge to a reached vertex would make it reached as well. Consequently N consists of |A| edges from A to U and a perfect matching N_Z in F[Z], with

    r := |N| = |A| + |Z|/2.

Every u in U can be missed by a maximum F-matching: flip the even alternating path from an unmatched root to u. We need only this direction, not the full Gallai--Edmonds theorem.

If Z is nonempty, its induced forest has at most |Z|-1 edges. After deleting its perfect matching N_Z, at most |Z|/2-1 edges remain. Selecting one endpoint of each remaining edge gives a vertex cover B_Z of F[Z]-N_Z with

    |B_Z| <= |Z|/2-1.

This elementary edge count is sufficient; no unique-perfect-matching theorem is used.

## 3. Pointed apex-forest matching lemma

Let L be any finite simple graph with a specified vertex w such that F=L-w is a forest. There exist a matching M in L and a vertex cover Q of L-M such that

    |Q| <= |M|,
    if M has an edge incident with w, then w belongs to Q.       (*)

Here L may be disconnected and may have isolated vertices. The second condition is the anchor-preservation property.

Apply the preceding decomposition to F, writing r=nu_match(F), and distinguish three exhaustive cases.

**Case 1: w has a neighbor u in U.** Choose a maximum F-matching N' exposing u, as supplied by the alternating path flip. Put M=N' union {wu}. Let B be a minimum vertex cover of F-N'. Its size is at most r by forest matching-cover equality, since F-N' is a subgraph of F. Put Q={w} union B. Then Q covers every remaining edge of L, |Q|<=r+1=|M|, and w belongs to Q as required.

**Case 2: w has no neighbor in U, and Z is nonempty.** Use the original maximum matching M=N, which avoids w. Put Q={w} union A union B_Z. Every edge of F-M not entirely inside Z has an endpoint in A, because U is independent and has no Z-neighbor. Edges within Z are met by B_Z. Edges incident with w are met by w. Therefore Q covers L-M, and

    |Q| <= 1+|A|+(|Z|/2-1) = r = |M|.

Condition (*) is vacuous because M avoids w.

**Case 3: w has no neighbor in U, and Z is empty.** Then every neighbor of w belongs to A. Put M=N and Q=A. The set A covers F because U is independent, and it covers the edges incident with w because their other endpoint is in A. Thus Q covers L-M (indeed all of L), and |Q|=|A|=r=|M|. Again M avoids w.

These cases include r=0 and edgeless L. This proves the lemma with no degree or closed-component assumptions.

## 4. Leaf induction proves the anchored theorem

Induct on the number of edges of C. If C is empty, H has no triangles; take I=D=empty.

Otherwise choose a leaf v of a nontrivial component of C, and let vw be its unique incident C-edge. Let L be the full induced link H[N_H(v)], with w as the specified vertex. Every edge ab of L-w belongs to C: the actual triangle vab must meet C, and neither va nor vb is in C because v is a C-leaf and a,b differ from w. Therefore L-w is a subgraph of the forest C and is itself a forest.

Apply the pointed lemma to get M,Q. Define H' by deleting ALL edges incident with v and all rim edges in M. Put C'=C intersect E(H'). This is still a forest triangle-edge cover of H', and it has fewer C-edges because vw was deleted. Induction gives a packing I' and a cover D' of H' with C' intersect E(I') contained in D' and |D'|<=2|I'|.

Append to I' the |M| triangles vab for ab in M. They are mutually edge-disjoint because M is a matching; they use only deleted edges, so are disjoint from I'. Call the resulting packing I.

Let

    X = M union {vq : q in Q}, and D = D' union X.

Every lost triangle using a rim edge of M is met directly by that edge, regardless of its third vertex. Every other lost triangle contains v and corresponds to an edge ab of the FULL link L. If ab belongs to M it is covered by M; otherwise a or b belongs to Q and its v-spoke covers the triangle. Thus X covers every lost triangle, including all outside pages on M. The cover D meets every actual H-triangle and has

    |D| <= |D'|+|M|+|Q| <= 2|I'|+2|M| = 2|I|.

It remains to check the anchor. Selected C-edges used by I' lie in C' and therefore in D'. In an appended hub triangle, a rim edge belonging to C lies in M and hence in X. Its only possible selected spoke is vw. Such a spoke is used exactly when M meets w, in which case condition (*) puts w in Q and therefore vw in X. Every C-edge used by I is consequently in D. This completes the induction. QED.

No optimality of the resulting packing is asserted. The induction preserves the exact existential anchor property, which is all that the weighted application requires.

## 5. Consequence: weighted packing for a minimum tree cover component

Let C_global be a minimum actual triangle-edge cover of G, and let C_i be one of its connected components, assumed to be a tree with vertex set A. Assign to it all triangles meeting C_i. A triangle cannot meet two different components of C_global: two edges of a triangle share a vertex, so if both were selected they would lie in the same component. Thus this is an exact partition of the triangle family.

An assigned triangle is either entirely within A or is an outside page on a base in C_i. In the latter case neither spoke can belong to C_global, since that would connect its outside vertex to C_i. Every internal triangle in H=G[A] meets C_i, so apply the anchored theorem to H and its tree cover C_i. Obtain an internal packing I and an internal cover D with C_i intersect E(I) contained in D and |D|<=2|I|.

Let q be the maximum packing number of the outside-page subfamily with bases in C_i minus D. The independently proved forest external-family minmax (challenger_forest_external_minmax_v1.md) gives an actual edge cover of that outside subfamily of size q. Together with D, it covers every triangle assigned to C_i. Minimum optimality of C_global therefore implies

    |C_i| <= |D|+q.

The q outside pages are disjoint from I: their selected bases are outside D, while every C_i base used by I belongs to D, and their other edges are not internal to A. Hence they and I form an assigned-family packing with

    2*(number of internal triangles) + (number of outside pages)
       = 2|I|+q >= |C_i|.

This proves the full weighted TREE target, using the separately accepted external-family minmax. The anchored theorem itself is self-contained. It closes the earlier general-tree availability gap for this local weighted target, but does not assert that every graph has a minimum forest cover or resolve unrestricted Tuza.

## 6. Quantifiers, former obstructions, and dependencies

The K4/path control remains consistent: some one-C triangle has an anchored two-edge cover, while a prescribed two-C triangle may not. The theorem chooses its own packing. The stronger claim that EVERY maximum packing minimizing p2 satisfies tau(H-(C intersect E(P)))<=p1 remains unproved and is no longer needed for weighted TREE. The residual realization and odd-wheel guardrails remain valid at their stated universal-choice scopes.

The only prior mathematical input needed for the weighted corollary, beyond the self-contained theorem, is challenger_forest_external_minmax_v1.md and its accepted independent review. The elementary alternating-reach decomposition was adapted from the already reconstructed proof in apex_forest_nonperfect_branch_v2.md; it is included above, so no Gallai--Edmonds, Konig, Kotzig, CS, or finite-certificate premise is hidden. No novelty claim is made for these standard forest matching facts.

Fresh review should prioritize: the three pointed cases, the full link rather than a restricted triangle list, lost triangles on rim edges with arbitrary outside apex, and the selected spoke vw when the matching meets w.
