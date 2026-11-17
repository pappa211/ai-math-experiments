> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Original H-D: the two-singleton survivor state is excluded

Frozen ordinary assembly, 2026-11-16. Source_audit. This closes the remaining one-defect book states at q=k-2. It does not establish a lower bound on the blue-deletion survivor packing number and therefore is not an unrestricted H-D proof.

Assume the ORIGINAL H-D premises

    nu(G)=k>=2,
    nu(G-E(T))=k-1 and tau(G-E(T))=2k-2
    for EVERY actual triangle T,

and additionally the strict branch tau(G)=2k-1. Fix ANY minimum cover C and ANY maximum packing P. All actual triangles have exactly one C-edge; call C red and the other edges blue. Then

    nu(G-B(P)) <= k-3.                                  (1)

For k=2, the negative right side says that this strict branch is impossible. The earlier frozen ordinary lemmas exclude survivor sizes k and k-1. Here we exclude size q=k-2.

## 1. Exact residual states after the two singletons

Suppose Q is a survivor packing of size q=k-2. Pair it with P on red spines, leaving singleton triangles T0,T1. Their edges are disjoint from every paired book support. Let O be the set of distinct unused-red opposite edges of paired books, and g=|O|.

The ordinary count hd_wang_book_defect_count_v1.md gives q-g<=1. If g=q, all paired books are good and have distinct opposites. Deleting T0,T1 leaves B by hd_distinct_good_books_residual_reduction_v1.md. Restoring T1 gives CS for G-E(T0); its H-D tightness forces B, and the accepted one-classified-residual H-D theorem contradicts the strict branch.

Otherwise g=q-1. Put H=G-E(T0)-E(T1). The exact count gives

    nu(H)=q, tau(H)=2q-1,

with minimum exact-one cover consisting of paired spines and the q-1 opposite edges. There are precisely two alternatives: one repeated unused opposite pair, or one bad paired book with all other books good and opposite-distinct.

In the repeated-opposite alternative, H consists of old B blocks and one literal component formed by two K4s sharing an edge. The newly independently reviewed ordinary theorem two_edge_glued_k4_triangle_restoration_v1.md makes restoration of T1 STRICT, contradicting the H-D tight parameters of G-E(T0). Thus only the one-bad-book alternative remains.

## 2. Description of the one bad book

Write its red spine as b=uv and its displayed pages as uvx and uvy. The other q-1 paired books are good, with distinct unused opposites, so they supply pairwise edge-disjoint literal K4 supports.

Every triangle of H with an unused-red opposite is an opposite page of its unique good book. Every third page on a GOOD spine, by the elementary all-choice Wang exchange, is an opposite page of the one bad book: all singleton blue edges have been deleted, and no other good book can have a used red opposite. Thus there are no unaccounted good-spine pages except possibly xy u and xy v when xy is a surviving good spine.

The edge xy, if present in G, is red: ux and uy are blue and actual triangle uxy cannot be all blue. Because the book is bad, xy is not an unused red opposite. It is therefore a used red edge. It cannot be b itself because the four book vertices are distinct. Consequently in H either xy is absent (it was absent in G or was a deleted singleton spine), or xy is the spine of one of the good books. These are exhaustive cases.

## 3. Absent opposite: apply triangle-and-edge restoration

Suppose xy is absent in H. Deleting b destroys every bad-spine page, and the preceding all-triangle description leaves exactly the q-1 good K4 components. Thus B(H-b).

The edge b creates a triangle in (H-b)+b, since its displayed pages exist. It is distinct from all edges of T1, which are still missing in H-b. Therefore

    G-E(T0)=(H-b)+b+E(T1)

fits the exact hypotheses of the accepted ordinary theorem triangle_and_edge_restoration_v1.md. That theorem gives CS. H-D supplies nu=k-1 and tau=2k-2, so equality forces B(G-E(T0)). The ordinary one-classified-residual H-D theorem then classifies G as k literal K4 components, contradicting tau(G)=2k-1.

This use of triangle-and-edge restoration includes every extra bad-spine page and arbitrary outside attachments; no bounded-page assumption is made.

## 4. Opposite equal to a good spine: no third bad page survives

Suppose c=xy is a good spine. Let that good book have unused opposite d=zw, so its literal K4 is on x,y,z,w. Its full support is edge-disjoint from every other good K4. The bad K4 on u,v,x,y shares exactly the edge xy with it. The six vertices u,v,x,y,z,w are distinct: any additional coincidence would share a blue edge between the paired book supports or identify distinct red roles.

Suppose there were a third bad-spine page uvt in H, with t distinct from x,y. The following THREE actual triangles are edge-disjoint:

    uvt,  xyu,  xzw.                                    (2)

Their respective red edges are b, c, d. This remains true when t equals z or w; only edge-disjointness is needed.

For any other good K4, both endpoints u,v cannot lie in its vertex set, since then its actual edge uv=b would belong to that K4, whereas b is neither its red spine, its unused red opposite, nor a blue edge. Thus the complete footprint of uvt in that K4 has at most ONE edge. The other two triangles in (2) use only edges of the two designated books and their one unused opposite; their supports are disjoint from every remaining good K4.

Choose a triangle from each of the q-2 other good K4s avoiding that possible one-edge footprint. Their supports are pairwise edge-disjoint, so these choices are simultaneous. Appending (2) gives q+1 disjoint triangles in H, contrary to nu(H)=q.

Hence the bad spine has exactly its two displayed pages in H. The complete triangle description now shows that H consists of the other good K4 components and precisely two K4s sharing edge xy. The strict restoration theorem two_edge_glued_k4_triangle_restoration_v1.md again contradicts the H-D tightness of G-E(T0).

All q=k-2 cases are excluded. Together with the prior k and k-1 exclusions this proves (1).

## Dependency and global boundary

The argument uses the independently reconstructed elementary Wang exchange/book geometry, the exact singleton cover count, accepted ordinary one-/two-triangle and triangle-and-edge restoration, the new ordinary two-edge-glued-K4 restoration, and the accepted ordinary one-classified-residual H-D transfer. No finite-certificate, GE, Kotzig, external general bound, or formalization is a premise.

The universal ORIGINAL H-D hypotheses are retained where restoration equality is transferred back to G. No universal triangle-deletion identity is imported into the intermediate defect-one graph H. The remaining regime q<=k-3 is real: no argument here shows that an H-D graph must possess a maximum packing with more survivors, nor does the bound itself provide a two-edge blocker.
