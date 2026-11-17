> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Closed odd-cycle link components are excluded

TUZA-22 restoration role, frozen2026-11-15 UTC. ORDINARY_PROOF_CANDIDATE pending independent review. No external matching theorem or finite enumeration is needed for this result.

Let G be a minimum CS failure, with k=nu(G). Use the reconstructed class-independent M0, balanced-reduction accounting, codegree>=2, and elementary block compatibility. Suppose a connected component of the link at v is exactly the chordless cycle on vertices0,1,...,2r, in cyclic order, where r>=2. No outside attachment restriction is imposed beyond this exact closed-link condition.

Take the matching

    M={01,23,...,(2r-2)(2r-1)}

and the vertex set

    Q={1,3,...,2r-3,2r}.

Q has r vertices and covers every edge of the cycle not in M: these are12,34,...,(2r-3)(2r-2), together with(2r-1)(2r), (2r)0.

Form K by deleting all2r+1 spokes from v to this link component and all r rim edges in M. Other hub-link components and all other edges remain. The r hub triangles on M use only deleted edges. The set X=M union {vq:q in Q} has2r edges and meets every lost triangle. Indeed, a triangle through a deleted spoke has its rim edge in this closed cycle; an M rim edge hits it directly, or a Q spoke does. Any other lost triangle uses a deleted M edge and is hit by it. Thus this is a valid balanced tuple, and M0 accounting yields

    B(K), nu(K)=k-r, tau(K)=2k-2r.

The rim edge01 lies in at least two actual G triangles. Besides v01, choose01x. Its apex x is outside the cycle, because the cycle is triangle-free, and x!=v. Rotate to the r-edge matching

    M'={12,34,...,(2r-1)(2r)}.

It avoids01. The r hub triangles on M', together with01x, are pairwise edge-disjoint. Their surviving K footprint consists of the M' rim edges and the page spokes0x,1x.

An old K4/K5 block contains at most two cycle vertices, since the cycle has no clique of order3 even before deletion. It contains at most one M' edge. It contains at most one of0x,1x, since01 is absent from K. If it contains both a surviving matching edge and a page spoke, they share a cycle endpoint; otherwise the block would contain three cycle vertices. Thus its complete footprint is a star of at most two edges. A maximum K4/K5 packing avoids it, so the r+1 displayed triangles append to a maximum K-packing. This gives k+1 triangles, contradiction.

Therefore no minimum CS failure has such an odd-cycle link component, for any r>=2 and arbitrary outside pages. The r=2 case recovers the prior C5 exclusion; r>=3 is the new unbounded cycle scope. Even cycles were already excluded by the accepted bipartite-link theorem. This does not assert that every triangle-free link is WKE or that every link contains an excluded component.
