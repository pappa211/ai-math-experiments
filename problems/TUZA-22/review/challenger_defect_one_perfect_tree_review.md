> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent reconstruction: defect-one perfect-tree link exclusion

Decision: ACCEPT at the exact stated hypotheses. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Frozen primary: notes/defect_one_perfect_tree_link_exclusion_v1.md, SHA256179c8f06cbb351fd4668aa6e022fa1dae47f2b1577bb6d578e731099493fe443.

I reconstructed the reduction and the upper bound for arbitrary packings after deleting the claimed critical edge. No gap was found.

Deleting the full rim tree and its hub spokes loses only triangles on rim edges because the link component is closed. The r matching pages supply the packing lower addition; all2r-1 rim edges cover every lost triangle. Defect one is exactly what makes the proper residual tight, so B(K) is justified before any clique avoidance is used.

An external page apex cannot be a hub neighbor: its two rim incidences would either connect it into the closed component and create a tree triangle, or contradict component closure. A residual clique contains at most one rim vertex because every actual edge between rim vertices was deleted. Thus a page on a nonmatching rim edge has at most one residual edge per block and augments the full hub matching. This forces all external bases into the unique perfect matching.

For an arbitrary subset S of those external bases, the chosen pages are pairwise edge-disjoint even if apices coincide. Each residual block contains at most one rim vertex, and that vertex occurs in at most one selected page; the simultaneous footprint is therefore at most ONE edge per block, not merely one edge per page. This establishes the displayed matching identity for every S.

Finally, every triangle outside K is either a hub triangle on this closed rim component or an external page on a rim edge. The partition in Section4 is exhaustive even when K contains other hub-link components or triangle-free background edges. In H-f, external bases form S excluding f, and hub bases form a matching of F-(S union {f}); applying the established identity to that entire set yields the required p-1 upper bound. When no external bases exist, uniqueness of the tree's perfect matching supplies the same drop.

The minimum-CS consequence is accepted using the separately declared M0 and two-edge-resilience inputs. The theorem itself assumes only the displayed near-tight parameters, edge-packing resilience, and proper-subgraph CS. It does not classify arbitrary defect-one graphs or require their whole triangle support to be connected. No computation or external matching theorem is a new premise.
