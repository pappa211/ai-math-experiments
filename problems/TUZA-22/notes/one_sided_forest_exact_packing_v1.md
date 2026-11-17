> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A minimum cover consisting of an entire forest core is packable exactly

Status: ORDINARY_PROOF_CANDIDATE; frozen for independent review. This is a scoped theorem, not a proof of Tuza or an availability statement. The ordinary argument below uses Hall's marriage theorem and the elementary forest vertex-cover/matching identity. The Hall-list lemma is known; no novelty claim is made.

## Scope and conclusion

Let a finite simple graph G have a vertex partition A ∪ B, with B independent and L = G[A] a forest. Suppose C = E(L) is a minimum triangle edge cover of G; put m = |C|. Then all m edges of C admit mutually edge-disjoint private triangles, one per edge. Consequently

    private packing number = ν(G) = τ(G) = m.

For m > 0 this implies strict Tuza inequality. Isolates, disconnected forests, and arbitrary neighborhoods of vertices of B are allowed. The hypothesis is that the ENTIRE induced graph G[A] is a forest. A forest-shaped subset C of G[A] does not suffice for this proof when additional internal edges remain.

## 1. Elementary Hall lemma for clique blocks

Let F be a graph each of whose blocks is a clique. Give each vertex x a finite list L(x) of colors. For U ⊆ V(F) and color b, let a_b(U) be the largest independent set in F[U] among vertices whose lists contain b. Assume

    sum_b a_b(U) ≥ |U|       for every U ⊆ V(F).                 (H)

Then F has a proper coloring from these lists.

Proof by induction on |V(F)|. Disconnected components separate, and a clique is exactly Hall's marriage theorem. Otherwise take an end block K and its unique cut vertex v; put X = V(K) minus {v}. The vertices in X have no neighbors outside K. For Y ⊆ X put N(Y) = union_{x in Y} L(x). Because X is a clique, (H) implies |N(Y)| ≥ |Y| for all Y ⊆ X.

Call Y tight when equality holds. The union of two tight sets is tight: the set function |N(Y)| − |Y| is nonnegative and submodular, so equality at both sets forces equality at their union and intersection. Let X0 be the union of all tight subsets of X, including the empty set. It is tight. Write U0 = N(X0), so |U0| = |X0|.

For any color c, the lists on X have a system of distinct representatives avoiding c if and only if c is not in U0. Indeed deleting c destroys Hall precisely when some Y ⊆ X has |N(Y)| = |Y| and c ∈ N(Y). This equivalence uses integrality and the fact that deleting one color lowers |N(Y)| by at most one.

Remove X from F, and replace the list at v by L(v) minus U0; leave every other list unchanged. We verify (H) in the smaller graph. It is immediate for test sets S not containing v. If v ∈ S, test the original condition on S ∪ X0. For each color c ∈ U0, X0 contains a vertex supporting c, and that vertex is adjacent to v and to no vertex of S minus {v}. Therefore

    a_c(original S ∪ X0) = 1 + a_c(reduced S).

The lower bound selects one such X0 vertex and a maximum independent color-c set in S minus {v}. For the upper bound, any independent set uses at most one X0 vertex; if it instead uses v, deleting v leaves at most the same maximum on S minus {v}. For c outside U0 there is no supporting vertex in X0 and the lists on S did not change, so the two capacities are equal. Summing gives

    sum_c a_c(original S ∪ X0) = |X0| + sum_c a_c(reduced S).

Original (H) now yields reduced (H). By induction color F−X. Its color at v lies outside U0, so the SDR characterization extends this coloring over X. This proves the lemma. ∎

## 2. Forest edge lists

Let L be a forest and give each edge e a finite list B(e). For S ⊆ E(L), write S_b for the subgraph with the edges of S whose lists contain b. If

    sum_b ν_matching(S_b) ≥ |S|       for every S ⊆ E(L),      (EH)

there is a proper edge coloring φ with φ(e) ∈ B(e).

To see this, the line graph F of a forest is a clique-block graph: every clique of incident forest edges is a star, and such star cliques are joined only through the vertex representing their shared forest edge. Deleting leaves gives the same clique-block decomposition. Independent sets in F[S] supported by color b are exactly matchings in S_b. Thus (EH) is precisely (H), and Section 1 applies. This is a genuine list-coloring argument; matchings are not being treated as matroids.

## 3. Minimum ordinary cover supplies all Hall inequalities

Return to G. An actual triangle has exactly one edge in C: there is no triangle within the forest A and none using two vertices of the independent set B. For each base e = uv ∈ E(L), put

    B(e) = {b ∈ B : bu,bv ∈ E(G)}.

Fix arbitrary S ⊆ E(L). Replace the edges S of C by spokes as follows. For every b ∈ B, take a minimum vertex cover Q_b of the forest S[N_G(b) ∩ A] and select the edges bx for x ∈ Q_b. Along with C minus S, these spokes cover every triangle. Different apices give distinct spokes, and no spoke is in C. Minimum optimality of C implies

    sum_b τ_vertex(S[N_G(b) ∩ A]) ≥ |S|.

A forest has equal vertex-cover and matching numbers. For completeness, if xy is a leaf edge with x a leaf, a minimum vertex cover can be chosen to contain y and a maximum matching can be chosen to contain xy. Removing {x,y} reduces both optima by one; induction proves their equality, componentwise. Therefore the displayed inequalities are (EH).

A proper edge-list coloring φ supplies triangles uvφ(uv), one per base. Bases differ. If two pages share a spoke, they have the same apex b and incident bases, contradicting proper edge coloring. Thus all m pages are edge-disjoint. Conversely every triangle uses a distinct C edge in any packing, so no packing exceeds m. ∎

## 4. Exact literature interface and attribution

The unit-weight clique-block Hall theorem is attributed to A.J.W. Hilton and P.D. Johnson Jr., *Extending Hall's Theorem*, in *Topics in Combinatorics and Graph Theory* (1990), pp.359–371, DOI [10.1007/978-3-642-46908-4_41](https://link.springer.com/chapter/10.1007/978-3-642-46908-4_41). The original publisher metadata was inspected; the original chapter's full proof was not retrieved. Its first page is sometimes cited as360 in later references; publisher metadata gives359.

The directly inspected primary author-hosted paper M. Cropper, A. Gyárfás and J. Lehel, *Edge List Multicoloring Trees: An Extension of Hall's Theorem*, J. Graph Theory42 (2003),246–255, DOI [10.1002/jgt.10093](https://doi.org/10.1002/jgt.10093), proves the stronger weighted tree version and explicitly credits Hilton–Johnson for the unit case. Its theorem3.3 also contains the clique-block unit case. [Author PDF](https://users.renyi.hu/~gyarfas/Cikkek/105_listmultihall.pdf).

D.G. Hoffman and P.D. Johnson Jr., *Extending Hall's Theorem into List Colorings: A Partial History*, IJMMS2007, article72168, DOI [10.1155/2007/72168](https://doi.org/10.1155/2007/72168), theorem3.1, confirms the original attribution and exact clique-block statement. Its bibliography distinguishes the1990 theorem from the1996 forbidden-subgraph characterization. [Full paper](https://www.maths.tcd.ie/EMIS/journals/HOA/IJMMS/Volume2007/072168.pdf).

Retained PDF SHA256:

- Cropper–Gyárfás–Lehel: aa463cfaab2c6ad59e4a454925cbf33626cad018b4aa0a560a1e8c2edd37f027.
- Hoffman–Johnson: 7660f64b9789e18900fb1b3f28ccab96042864a5767925f58ea72454f974804b.

Download provenance is in literature/hall_forest/download_receipts.json. Section1 is a self-contained reconstruction, not a claim of independent discovery; the full weighted theorem is not needed or independently reproved here. No finite computation is used.

## 5. Global role and remaining bridge

This supplies an exact conversion from full minimum-cover optimality to private packing for a nontrivial all-size class. It removes the factor-two loss entirely in that class. The reason it works is that every core subset is triangle-free, each apex link obeys vertex-cover/matching equality, and the list conflict graph has clique blocks. None of these properties has been shown available for an arbitrary minimum cover or a minimum CS obstruction. The previously retained Fano/color and ordinary/private-cover obstructions are unaffected outside this scope.
