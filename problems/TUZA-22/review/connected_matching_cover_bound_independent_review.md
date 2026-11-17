> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Connected matching-cover bound — independent review

**ACCEPT** `notes/connected_matching_cover_bound_v1.md`, SHA-256 `911a973ba32088a0c472891554d7ce62f9ee1dba77034836b2771502c4e6b3dd`. This is an ordinary all-size theorem based on actual triangle incidence. No computation, external theorem or residual-resilience premise is needed.

Every triangle has exactly one matching-cover base. The full triangle family therefore partitions into nonempty books after inactive bases are removed. A book is internally connected through its base edge, so contracting books preserves the connected-component structure of the actual shared-edge triangle family.

For a page abx based at matching edge ab, any intersection with another book must use ax or bx. A triangle in that other book sharing ax cannot have its matching base incident with a, since a is already matched to b. Its base must contain x. The same argument holds for bx. Thus there is at most one possible other book, the one whose matching base contains x. A page chosen to witness interaction with a target book cannot conflict with pages from any different book. This handles the complete book families, not merely the selected pages.

Orienting a spanning tree toward a root edge gives a reciprocal target only at the root pair. Choosing a witnessing page for each target may or may not cause an actual conflict at that pair, but no other pair of chosen pages can conflict: actual conflict would require reciprocal targets by the preceding unique-target property. Deleting one root page therefore gives a packing of r-1. The matching cover itself has size r, so tau<=r<=nu+1. The one-book case has tau=nu=1 and is separately correct.

An active base belongs to only one actual triangle component, because all its pages share it. Applying the connected argument componentwise and using exact packing/cover additivity gives tau<=nu+c. Triangle-free background edges are irrelevant and do not affect the component count.

For a connected defect-one graph, combining tau=2nu-1 with tau<=nu+1 forces nu<=2. Thus a connected minimum-CS triangle residual with packing at least3 cannot admit any matching triangle transversal. The conclusion rules out a representation; it does not assert its availability or handle general covers with adjacent edges.

As a compatible consequence, equality tau=2nu in a graph with a matching cover forces every nonempty triangle component to have packing1; the ordinary actual-triangle intersection classification then gives literal K4 components in the tight case. This agrees with the previously reviewed matching-cover classification.

Completed2026-11-15 UTC.
