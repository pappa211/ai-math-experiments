> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Isolated cover edges and the size of the adjacent part

Status: ordinary proof candidate; extension of `connected_matching_cover_bound_v1.md`.

Let G have connected nonempty shared-edge triangle support. Let C be a triangle-edge cover, with every selected edge triangle-bearing. Suppose the graph formed by C has r components that consist of a single edge, and let s>0 be the number of its remaining edges. Then

    nu(G)>=r.

The r isolated cover edges form vertex-disjoint bases, also vertex-disjoint from the endpoints of all other C edges. Every triangle using one such base contains no other C edge, since two cover edges from different cover-graph components would need four distinct endpoints. Its family is therefore an actual book. Group all remaining triangles into one root family R; it is nonempty because the nonisolated selected edges are triangle-bearing and cannot occur in a matching-base triangle.

Form the interaction graph on those r books and the root family, joining families when actual triangles share a graph edge. Collapsing triangle families preserves connectedness, so this graph is connected even if the root family itself has several triangle components before the collapse. Choose a spanning tree rooted at R. Each book chooses one page witnessing interaction with its parent.

As in the matching-cover proof, a chosen page can conflict with a different matching-base book only if its apex belongs to that book's base. Thus if it targets another book, it cannot conflict with any third book. If it targets R, it cannot conflict with ANY matching-base book: the outside triangle witnessing that interaction has a C edge from the nonisolated part; its shared spoke forces the page apex to be an endpoint of that C edge, whereas all matching bases have disjoint endpoints from that part. Since the directed tree toward R has no reciprocal book pair, the r chosen pages are pairwise edge-disjoint. This proves the bound.

For a minimum cover, triangle-bearingness is automatic. If tau(G)=2nu(G)-1 and C is minimum, then r+s=2nu-1 and r<=nu imply

    s>=nu-1.

For a tight graph with tau(G)=2nu(G), the same argument gives s>=nu whenever s>0. The all-matching case s=0 is handled separately by the preceding connected matching-cover theorem.

Thus any unbounded family of connected defect-one graphs must have an unbounded adjacent-edge part in EVERY minimum cover; a fixed nonmatching cover core plus arbitrarily many isolated cover edges cannot produce such a family. No claim is made that this necessary condition is sufficient or that a general minimum cover can be transformed to the required small-core form.

Dependencies: elementary graph incidence, a rooted spanning tree, and the page-conflict argument already independently reviewed for matching covers. No external theorem or computation is used.
