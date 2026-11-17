> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Having a forest cover does not make an optimum cover a forest

Status: ordinary explicit counterexample family. This refutes an auxiliary availability statement, not Tuza or combined CS.

For an integer t>=3 let G_t have a core triangle on a,b,c and an independent set X={x1,...,xt}; join every x_i to all three core vertices. There are no other edges. Its actual triangles are abc and, for each i, abx_i, acx_i, bcx_i. Thus there are3t+1 triangles.

Every triangle uses at least one of the three core edges. Consequently nu(G_t)<=3; the three triangles abx1,acx2,bcx3 pack, so nu(G_t)=3. The core triangle is a cover of size3, and a cover of size at most2 cannot cover all3t leaf pages: with no selected core edge two spokes cover at most4 pages, while with one selected core edge one remaining spoke covers at most2 of the2t remaining pages, and with two selected core edges all t pages on the third base remain uncovered. Hence tau(G_t)=3.

In fact the unique minimum cover is {ab,ac,bc}. A three-edge cover with no selected core edge misses abc. With exactly one selected core edge, the two remaining spokes cover at most4 of the2t pages on the two omitted bases; since t>=3 this fails. With exactly two selected core edges, the one remaining spoke covers at most one of the t pages on the omitted base. This also fails.

Nevertheless G_t has a forest cover:

    {ab} union {cx_i : 1<=i<=t}.

Its selected graph is a star plus an isolated edge and it has t+1 edges. This is the minimum possible forest-cover size. Any cover must select a core edge to hit abc. A forest cover cannot select all three core edges. If it selects exactly one, then for each apex x_i it needs a spoke to meet pages on the two omitted bases, costing at least t additional edges. If it selects exactly two core edges, it again needs a separate spoke for each apex to meet the omitted-base page, costing at least t+2 in total. Therefore

    minimum forest-cover size = t+1,
    ordinary tau = 3,
    nu = 3.

The gap between forest-cover optimization and ordinary cover optimization is unbounded, even with a fixed ordinary packing and cover number. Thus neither the existence of a forest cover nor the forest-cover CS theorem permits replacing an arbitrary minimum cover by a forest minimum cover. In particular, a forest cover inherited after deleting a selected cycle edge need not have size tau of the residual.

This family has packing-critical core edges and is not a connected edge-packing-resilient defect-one example: its deficit2nu−tau is3. It therefore leaves the actual near-tight resilient residual question untouched. No computation or outside theorem is used.
