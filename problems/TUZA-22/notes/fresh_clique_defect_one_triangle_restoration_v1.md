> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict triangle restoration from every fresh-clique defect-one component

Frozen ordinary proof candidate, 2026-11-16. This extends the two-edge-B residual theorem to the complete literal fresh K4/K5 edge-gluing class. No representation availability is asserted.

## Theorem and exact construction scope

Let the nonempty actual triangle support of H be obtained by starting with one K4 or K5 and repeatedly attaching a fresh K4 or K5 along an existing edge, with every other vertex of that attached clique new and no additional crossing edges. Permit extra edges and vertices only when they belong to NO actual triangle. Suppose

    tau(H)=2nu(H)-1.

For any triangle T with all three edges absent from H, put G=H+E(T). Then

    tau(G)<=2nu(G)-1.

The exact fresh-clique defect-one classification already proved in `defect_one_fresh_clique_tree_classification_v1.md` says H has either two K5s sharing an edge, or one central K4 with one, two or three clique leaves on distinct edges of a star. Its triangle family contains exactly the displayed clique triangles, and every such graph is single-edge packing-resilient.

The one-/two-leaf cases are already covered by `classified_two_edge_B_residual_triangle_restoration_v2.md`: deleting an appropriate opposite pair of central K4 edges leaves B, as can also be seen directly from that theorem's root-clique proof. One K4 leaf is the independently accepted double-K4 theorem. We give ordinary arguments for the TWO remaining forms.

## 1. A cover-eligibility mechanism

Put p=nu(H). Restoring T gives nu(G)>=p+1 and tau(G)<=2p+2. Only

    nu(G)=p+1, tau(G)=2p+2                              (*)

could fail strictness.

Assume that (a) every triangle-supported edge of H occurs in some minimum H cover, and (b) any three pages on distinct T bases with distinct apices can be combined with p-1 old triangles. Under(*), (b) excludes an incidence matching of size three. The accepted ordinary page-incidence classification then gives a two-edge cover of the entire new family N, unless it is exactly K5-e on T and two full apices. A two-edge cover would give tau(G)<=2p+1, so the K5-e family is forced.

Every old N spoke lies in a three-edge cover of N. If any such spoke were triangle-supported in H, hypothesis(a) would supply an old minimum cover through it, and the overlap would again give2p+1. Therefore EVERY old spoke of N is triangle-free in H. A maximum H packing automatically avoids all those background spokes, while a two-packing of the new K5-e uses only new T edges and those spokes. Appending it gives p+2, contradicting(*).

Thus (a),(b) suffice, with arbitrary background edges and outside apices. The footprint is explicitly triangle-supported; old background spokes are allowed and automatically avoided by old triangle packings.

## 2. Three star leaves on a central K4

Write the central K4 as abcd and the three attachments as ab,ac,ad. Let m be the sum of the leaf packing numbers, so p=m+1. The existing exact eligibility classification proves that EVERY edge of this graph belongs to some minimum cover; the root opposite face requires one nonattachment edge, and choosing a root opposite pair through any desired star edge realizes the minimum. Leaf edges are eligible by choosing another attachment for the root-cover overlap when necessary. Thus (a) holds.

For (b), the independent T terminals meet each leaf clique in at most one vertex. Three incidence-matched pages therefore have a whole star footprint of at most two edges in each leaf. Maximum leaf packings avoid those stars. The leaf supports are pairwise edge-disjoint, so the union contains m=p-1 old triangles disjoint from all three pages. This proves (b) and strictness for this form.

## 3. Two K5s sharing an edge

Here p=4 and tau(H)=7. Every supported edge is eligible: a minimum cover has the form of two four-edge K5 covers both containing the common edge, with that edge counted once. Any edge in either K5 can be included together with the common edge in a minimum K5 cover, so hypothesis(a) holds.

Take three incidence-matched pages. In each K5 their entire old footprint is a star of at most two edges. In the first K5 choose a maximum two-packing avoiding that footprint. In the second choose ONE triangle avoiding its at-most-two-edge footprint AND the shared edge. These are at most three forbidden edges.

Deleting at most three edges from K5 always leaves a triangle. An elementary check is: a triangle-free graph on five vertices with maximum degree at most two has at most five edges; with maximum degree three, the three neighbors are independent and the fifth vertex adds at most three further edges, giving at most six; with maximum degree four it is a star. Thus no triangle-free five-vertex graph has seven edges. K5 minus at most three edges has at least seven.

The chosen triangle in the second K5 avoids the only shared edge, so it is disjoint from the two-packing in the first. All three old triangles avoid the whole new-page footprint. This supplies p-1=3 old triangles for(b), proving strictness in the final form.

All classified fresh-clique defect-one graphs are covered, proving the theorem.

## Minimum-CS consequence and exact limitation

For every actual triangle T in a minimum CS failure G, its residual H=G-E(T) has deficit one and a single shared-edge triangle component. That component CANNOT admit the literal fresh K4/K5 edge-gluing construction above, even with arbitrary triangle-free background. Otherwise the theorem would make G strict.

This excludes a whole previously identified near-tight construction class; it does not show that an arbitrary near-tight component has such a construction. Attachments involving more old vertices, extra crossing triangles, or a different triangle-support architecture remain outside the theorem. No global blocker or unrestricted Tuza conclusion follows automatically.

## Dependencies

- Exact fresh-clique classification and eligibility: `notes/defect_one_fresh_clique_tree_classification_v1.md`, SHA65537b924e3f2b2e4a97ecadf08ccc0f79a6c2c97e173b651fb0394ff7dd6310.
- One-/two-leaf strict restoration: `notes/classified_two_edge_B_residual_triangle_restoration_v2.md`, SHAcfb4a6bc6ce6bf8fd136982a8b997359293db0b14ce9aa32ba74220fd69b92c4.
- Ordinary page-incidence cover classification from `two_triangle_restoration_v1.md` and elementary K4/K5 avoidance.

No finite certificate, external matching theorem, GE, Kotzig or formalization is a premise.
