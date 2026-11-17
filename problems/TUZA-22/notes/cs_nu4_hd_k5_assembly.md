> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# CS through packing four and original H-D through packing five

TUZA-22 coordinator assembly of reviewed lemmas. Status: PROOF_USING_DECLARED_INPUT. This is a scoped theorem, not an unrestricted solution or a claim of historical novelty.

## Theorems

1. Every finite simple graph with triangle-packing number at most four satisfies CS: tau<=2nu, with equality exactly for B (literal K4/K5 actual triangle components).
2. Original H-D holds for packing number at most five. At k=1 the triangle family is a book or K4; at2<=k<=5 it consists of exactly k literal K4 triangle components. Thus an opposite-edge pair in one component lowers packing by one.

## Restricted minimality and proof of theorem1

The class K4={G:nu(G)<=4} is subgraph-closed. If CS fails in it, choose a failure with the fewest actual edges, discarding isolates. Every proper subgraph remains in K4 and satisfies CS. The class-independent M0 reduction therefore gives tau=2nu, and the class-independent M3/SIX local conclusions apply. No universal CS premise is being assumed.

Reviewed CS for nu<=3 (notes/hd_small_k_corollaries.md with review/coordinator_small_k_transfer_review.md) forces the chosen failure to have nu=4, hence tau=8. R1 and elementary triangle-deletion accounting give, for every actual triangle T, a residual minimum cover of size5. Its union with E(T) is an eight-edge minimum cover C containing T.

The eight-edge cover kernel (notes/k4_cover_kernel_proof_v1.md; review/coordinator_k4_kernel_review.md), under the explicitly declared M3/SIX link hypotheses, puts every graph vertex in V(C), so n<=13. If n=13, equality in the endpoint bound forces C to be one triangle and a vertex-disjoint five-edge matching. The reviewed triangle-plus-matching minimum-cover theorem excludes such a CS failure. Thus n<=12.

The elementary density reduction (notes/k4_dense_bipartite_interface_v1.md) shows that a subgraph of average degree at least7 would force the whole graph to have12 vertices, at least42 edges, and a maximum triangle-free complement H=G-C with at least34 edges. A shortest-odd-cycle count proves H bipartite. Its parts are6+6 with at most two missing cross edges, or5+7 with at most one; minimum-cover optimality makes C precisely the eight internal edges.

The ordinary five-packing lemma (notes/challenger_near_bipartite_five_packing_v1.md) supplies five edge-disjoint triangles in that interface, contradicting nu=4. Both this lemma and the density interface were freshly reconstructed in review/k4_density_and_five_packing_independent_review.md (the density interface also has a separate challenger review). Hence mad(G)<7.

Only now apply the archived TUZA15 theorem T0, at its exact mad<7 hypothesis, to obtain CS for G. This contradicts its choice and proves theorem1.

## Original H-D transfer

Let G satisfy every original H-D triangle-deletion premise, with k<=5. For any triangle T, its residual H has nu(H)=k−1<=4 and tau(H)=2k−2=2nu(H). Theorem1 supplies B(H). Apply the independently reviewed one-classified-residual theorem (notes/hd_one_classified_residual_v1.md; review/coordinator_hd_classified_review.md), retaining all original H-D premises. It gives the asserted book/K4 description at k1 and all-K4 component classification for k>=2, and hence the blocker.

This transfer uses exact original-H-D tight residuals. It is not a theorem about H-D-CS-min or broad, whose premises differ.

## Dependency and verification boundary

Current ordinary lemmas: R1, two-triangle restoration, k3 and k4 cover kernels, elementary density arguments, triangle-plus-matching minimum-cover theorem, near-bipartite five-packing lemma, and one-classified-residual H-D theorem. Each has a fresh AI review in this workspace.

Declared historical inputs: M0 and M3 at class-independent local scopes; SIX at its class-independent local scope; T0 only for mad<7. Their pinned source records were authenticated and selectively read. The complete historical proof suite has not been rebuilt or newly formalized here. No finite historical census, Gyori large-order theorem, external solver verdict, or unproved general equality classification enters this assembly.

The new consequence for the global campaign is that any minimum CS failure must have packing at least5. Its triangle residual has a connected noncone defect-one component with no packing-critical edge (additional reviewed reductions), still an unclassified global state. Universal CS, H-D-CS-min/broad, original H-D above k5, D-some-choice, and PK remain open.
