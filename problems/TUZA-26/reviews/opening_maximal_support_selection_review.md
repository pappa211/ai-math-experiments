> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent maximal-residual-support triangle selection review

Status: ACCEPTED ORDINARY at the stated full-triangle minimum-cover hypothesis. This is a valid finite extremal selection rule on one fixed actual graph. No minimum-Q naming, numerical search or Lean check is used.

Let T=abc maximize supported-edge count in X-T, and suppose its ordinary page bcp has two residual-background spokes. Replacing T by bcp deletes only those two background edges and restores ab,ac. Hence every old residual triangle and every old supported edge survive. A new residual triangle using either restored edge makes at least one genuinely new supported edge, yielding the required strict increase; the count is over actual support, so ambient isolated or background vertices do not affect it.

If no triangle through ab or ac survives, every original triangle using one of those edges must meet the removed page edges bc,bp,cp. The exact incidence list is abc,abp,acp: a triangle cannot contain the disjoint edges ab,cp or ac,bp. A minimum X cover containing all of T can therefore delete ab,ac, retain bc and add ap if present. The retained bc hits abc; ap hits the only other possible affected triangles. If ap is absent those faces are absent too. This saves at least one edge and contradicts minimality. The proof therefore excludes every bare ordinary page of the maximally selected triangle.

The G application is legitimate because the archived single-residual cover decrement is exactly three. The Q application is legitimate because its independently accepted triangle-residual cover decrement is likewise three. Neither application names the resulting residual support or inherits further properties for it.

The common-center cube application has the stated containment restriction. If the globally selected T belongs to that cube and an opposite-base bare page has apex outside all seven core vertices, both old spokes have no endpoint among the restored U/V terminals. They cannot belong to a newly restored H triangle, because any new edge in a triangle must share an endpoint with its old spoke. Thus B-background remains H-background for those two spokes, and the selection rule excludes the page. This does not select a failing triple containing T, exclude core-apex bare pages, or make all three page families bare-free.

K4 fails the full-triangle cover hypothesis, while K5 satisfies it and its deleted-triangle ordinary spokes remain supported, as the source states. The selection mechanism is proved; its composition with a paid global reduction remains open.

Bound source: notes/maximal_support_triangle_selection_v1.md, SHA-256 cd0d1a5ca470a8cdd30ae77dfb9d4c0a78d40d659924941fb88f6107046a1e3d.
