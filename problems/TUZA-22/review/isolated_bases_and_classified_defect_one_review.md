> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Isolated cover bases and classified defect-one residuals — fresh review

**ACCEPT both ordinary proofs at their stated interfaces.** Neither assumes that an arbitrary near-tight graph has a classified residual or a bounded nonmatching cover core.

For the isolated-cover-edge bound, each isolated base has endpoints disjoint from every other cover edge, so every triangle on it has exactly that one cover edge. These books and the grouped remaining triangle family partition all actual triangles. The root family is nonempty because a nonisolated triangle-bearing selected edge cannot occur in an isolated-base book. Contracting families preserves connectivity even if the root family was disconnected before contraction.

A selected page targeting another isolated book can only conflict with that book, by the unique-base-at-apex property. For a page abx targeting the root family, an intersecting root triangle must share ax or bx. Its selected cover edge cannot meet a or b, whose sole cover edge is ab, so its cover edge contains x and belongs to the nonisolated part. Thus x cannot belong to any isolated base. The selected page consequently conflicts with no other selected book. The rooted spanning tree has no reciprocal book pair; all r chosen pages are disjoint. Hence nu>=r and the stated bounds on the adjacent part of a minimum cover follow. The all-matching case is correctly delegated to the previously reviewed theorem.

For the classified-residual theorem, exact one-triangle additivity gives p=m+q, while the cover upper bound and defect1 force1<=q<=2. At q=1, the book alternative has a packing-critical common base: deleting it removes all new triangles and leaves exactly the old packing number m. In the K4 alternative each old clique contains at most one terminal, so it can share at most one of the three old spokes. Shared-edge connectedness forces every old block to share a spoke, and distinct old blocks cannot share the same supported edge. Thus at most three blocks contribute, each with packing at most2, yielding p<=7.

At q=2 the target cover number forces the exceptional K5-e new family. Any supported spoke would permit a one-edge cover overlap and contradict that target. Therefore all its spokes are background in H, and its entire triangle support is disjoint from the old components. Exact triangle accounting and connectedness force H to have no triangles; p=2 follows. This closes all cases without an unbounded-attachment assumption.

## The bound seven is attained

Take a root K4 on {x,a,b,c}. Attach a fresh K5 along each of xa, xb and xc, using three private new vertices for each attachment and no other edges. The resulting graph has13 vertices,33 edges and34 actual triangles. Every triangle lies in the root K4 or one attached K5. The three K5 supports are pairwise edge-disjoint; the triangle abc uses none of their edges.

The three attached K5s each admit a two-packing, and their six packed triangles together with abc give a seven-packing. Conversely at most one root-K4 triangle and at most two from each attached K5 can occur, so nu=7. Every triangle cover needs at least four edges from each attached K5 support, twelve distinct edges in total, and one further edge for abc. Choose minimum covers of the attached K5s containing xa,xb,xc and add ab; this covers all root triangles as well. Thus tau=13=2nu-1.

Every edge deletion preserves the seven-packing. If the deleted edge is outside abc, use abc and two-triangle packings in the attached K5s avoiding the deleted edge where necessary; these supports are otherwise disjoint. If the deleted edge belongs to abc, choose a different root face avoiding it, and use maximum packings in all attached K5s that avoid their attachment spokes. Deleting all three edges of abc leaves exactly the three literal K5 triangle components, so that triangle residual is B.

This is a connected packing-edge-resilient defect-one graph attaining the bound7. It is not a minimum-CS failure: it satisfies strict Tuza, and its new clique vertices have degree4. Its existence shows that resilience and one classified triangle residual do not imply a bound below7. The accepted two-triangle restoration theorem separately excludes such a graph from being a minimum-CS triangle residual.

Reviewed `notes/isolated_cover_edges_bound_v1.md` SHA-256: `bb238f43b4e883f73763e487725fc17a667bec0caca0a29b059f64a42c402bbd`.

Reviewed `notes/resilient_defect_one_classified_residual_v1.md` SHA-256: `29ac3ad4478060701a0eda4e86d0faf9027ec6dd7b2bc727a777f83ffee0d003`.

Completed UTC: 2026-11-15T23:25:07.814659+00:00.
