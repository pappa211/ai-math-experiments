> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: parallel-thread exclusion and link excess

Decision: ACCEPT USING DECLARED INPUTS. Reviewer: TUZA-22 challenger, 2026-11-16 UTC.

Reviewed immutable primary notes:

- notes/parallel_thread_link_exclusion_v1.md, SHA2566eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4;
- notes/link_excess_and_one_cycle_leaf_v1.md, SHA25646d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b.

I independently reconstructed all parity cases, including their shortest permitted lengths. The boundary cover always includes both u and v, so every removed hub triangle extending outside the selected thread interiors is covered. Internal degree two prevents any extra induced edge involving a thread interior; the only possible additional induced edge is uv.

For odd/odd lengths, the interior matching has N/2-1 edges, while Q consists of the two endpoints and N/2-3 remaining interior choices. A full cycle matching is larger. For even/odd lengths, the displayed matching and cover both have (N-1)/2 elements; the selected interior edge in the odd path exists even at lengths2 and3, and deleting it leaves an odd-order path with the same matching size. For even/even with one length at least4, the complementary perfect cycle matching avoids a selected internal edge. The shortest C4 and direct-plus-length3 cases also have valid balanced tuples and alternate matchings.

The safe-page argument has the required stronger endpoint property: a degree-two interior endpoint of a selected safe edge belongs to no triangle of the chosen induced graph. The additional codegree page apex lies outside the entire hub neighborhood, not just outside the chosen U. Its whole footprint together with the alternate matching is at most an adjacent pair in each residual clique. The triangle-free one-interior-endpoint variant is valid for C4.

The diamond's explicit three triangles are edge-disjoint. The missing rim and hub edges exclude every two-footprint pairing except the stated star at u. Thus arbitrary outside link neighbors do not create an omitted opposite-edge K4 obstruction. Closed diamonds use exactly the declared robustness input.

The loop and multiplicity conclusions after suppression follow from the already reviewed link-deletion theorem and the two newly excluded parallel configurations. No claim about the remaining finite WKE certificates is made.

For the quantitative corollary, every component of L-w has at least as many edges as vertices, giving deg(w)<=m-n+1 for every w. Summing gives m(n-2)>=n(n-1), and n>=5 makes the integer lower bound m>=n+2. Equality of a vertex degree with the cycle rank forces all deletion components unicyclic. In the one-cycle cover-leaf application, all those deletion edges are selected, so there can be only one cyclic component and it must be unicyclic. Connectivity, mu(L)=deg(w)=Delta(L), deg(w)>=3, and the four degree-three vertices when deg(w)=3 follow exactly as stated.

These are available necessary restrictions on a minimum combined-CS obstruction. They neither assert that a forbidden thread occurs nor promote inequality-only WKE kernels to CS. No finite computation or external matching theorem is a premise.
