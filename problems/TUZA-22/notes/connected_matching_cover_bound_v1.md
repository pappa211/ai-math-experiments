> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Connected triangle support with a matching cover

Status: ordinary proof candidate, frozen for independent reconstruction.

## Theorem

Suppose a matching M of graph edges meets every actual triangle of G. Remove from M any edge lying in no triangle, and put r=|M|. If the nonempty shared-edge triangle support of G is connected, then

    nu(G)>=r-1,    tau(G)<=nu(G)+1.

More generally, if the triangle support has c nonempty shared-edge components, then tau(G)<=nu(G)+c.

## Proof

A triangle contains exactly one M edge: it contains at least one because M covers, and at most one because any two edges of a triangle meet at a vertex. Partition the actual triangles into books, one for each active base edge in M. Within one book every triangle shares that base.

Define the book interaction graph on the r bases, joining two bases when some triangle in one book shares a graph edge with some triangle in the other. The interaction graph is connected precisely when the triangle support is connected, since each individual book is already shared-edge connected.

The key restriction is that a fixed page of one book can share a graph edge with triangles of AT MOST ONE other book. To see this, write its base as ab and its apex as x. A shared edge with another book must be ax or bx: sharing ab would put that other triangle in the same book. Since matching bases are vertex-disjoint, the other book's base cannot contain a or b; it must contain x. There is at most one M edge containing x. In particular, whenever a page witnesses interaction with a chosen target book, it cannot conflict with a chosen page from any different book.

If r=1, every triangle contains the unique base, so tau=nu=1 and the assertion holds. For r>=2, choose an edge ij of a spanning tree of the connected interaction graph. Orient the remaining tree edges toward that root edge: i targets j, j targets i, and every other vertex targets its next neighbor on the unique path to the root edge.

For each book choose one actual page witnessing interaction with its target. Such a page exists by the definition of the interaction graph. If selected pages from two books conflict, the key restriction forces each book to target the other. The only reciprocal targets are the root pair i,j. Thus all selected pages except possibly that pair are mutually edge-disjoint. Discarding one of the two root pages leaves at least r-1 edge-disjoint triangles.

The matching M itself is a triangle cover, so tau<=r<=nu+1. For several triangle components, restrict to each component's active bases and add the inequalities, using exact packing and cover additivity over shared-edge triangle components.

## Defect-one consequence

Let J have connected nonempty triangle support and tau(J)=2nu(J)-1. If J admits ANY matching triangle cover, then

    2nu(J)-1 <= nu(J)+1,

so nu(J)<=2. In particular a connected defect-one residual with packing number at least3 cannot have a matching triangle cover. No packing-edge-resilience hypothesis is needed for this conclusion.

Applied to a minimum-CS triangle residual J=G-E(T), this rules out the matching-cover representation once nu(G)>=4. It does not prove that some minimum cover has this form, and it does not handle covers with adjacent edges.

Dependencies: elementary matching incidence, a spanning tree, and triangle-component additivity only. All triangles and all shared edges are actual. No external theorem or computation is used.
