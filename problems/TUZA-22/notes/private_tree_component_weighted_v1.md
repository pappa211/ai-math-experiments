> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Weighted packing when a tree cover component has only private triangles

Frozen ordinary proof candidate, 2026-11-16. Fresh reconstruction requested. This is a sufficient local case of the open weighted TREE target; it does not assert that every minimum-cover component satisfies its hypotheses.

Let C be a minimum actual triangle-edge cover of G, and let T be a tree component of its selected-edge graph, with vertex set A and m edges. Assign triangles to their unique selected component. Suppose every triangle assigned to T contains exactly ONE edge of C. Equivalently, no internal triangle contains two T edges. Then there is an assigned edge-disjoint packing P such that

    2 |{internal members of P}| + |{external members of P}| >= m.

Here internal means all three vertices lie in A. Outside pages have their third vertex outside A. Arbitrary other cover components and all actual triangles are retained.

## 1. A full private-page selection

Give each base e in T the list of all apices completing an assigned triangle. For any S subset E(T), remove S from C and cover the lost pages separately at their apices by spokes. No two-selected-edge triangle exists, so these are all lost triangles. At each apex b the relevant base graph S_b is a forest, and its vertex-cover number is its matching number. Duplicate physical spokes across different apex choices only reduce replacement cost. Minimum cardinality of C therefore implies

    sum_b matching_number(S_b) >= |S| for every S.

The self-contained forest Hall list-edge-coloring lemma from notes/one_sided_forest_exact_packing_v1.md supplies one apex on every base, with the bases assigned a common apex forming a matching. Retain these m selected actual triangles for the following conflict analysis; they need not yet be a packing.

## 2. The remaining conflict graph is a union of paths

The m bases are distinct. A private triangle's two spokes are not in C, so no selected base can meet another selected triangle as a spoke. Pages with the same apex are disjoint by proper list coloring.

If two selected pages with different apices x,y meet, their common spoke is xy. Their bases contain y and x respectively. For a fixed spoke of a page there is at most one such conflicting selected page: two would have the same opposite apex and incident tree bases, violating proper list coloring. Thus the conflict graph has maximum degree two.

An external page is isolated. Indeed a reciprocal conflicting page would need its tree base to contain the original outside apex, which is not a vertex of A. Hence every nontrivial conflict component consists of internal pages.

There can be no cycle of conflicts. Suppose a cycle has pages P_i with apices a_i, indexed modulo r>=3. At P_i the two distinct conflicts use its two different spokes, so its tree base is exactly

    e_i = {a_(i-1), a_(i+1)}.

All e_i are distinct since one page was selected on each base. Traverse the apex indices in steps of two. If r is odd this is one closed trail using all e_i; if r is even it gives a closed trail using one parity of the e_i. In each case the trail is nonempty and has no repeated edge, although vertices could repeat. A forest has no nonempty closed trail of distinct edges: removing any one traversed edge separates its endpoints and a return traversal would have to cross that same cut edge again. Contradiction.

Thus the conflict graph consists only of paths and isolated vertices.

## 3. Weighted selection

Keep every isolated external page. In every internal path component on p vertices, keep an independent set of ceil(p/2) pages. Each retained internal page has weight two. This gives a genuine packing, and its total weight is

    number of external pages + sum_internal_paths 2 ceil(p/2)
    >= number of all selected pages = m.

More precisely, the surplus is the number of internal path components of odd order, including isolated internal pages. This proves the local weighted assertion with no external theorem beyond the already self-contained Hall lemma.

## Remaining obstruction and relation to the general target

When two-tree-edge internal triangles exist, the mixed matching/Hall selection still covers every tree base in its accounting. A selected private page may then share the nonselected chord of a selected two-base triangle. Two such private pages and that triangle can form a three-page book, which is not a reciprocal cycle of the present private-page conflict graph. The argument above therefore does not remove that remaining obstruction or establish universal weighted TREE availability.

The result combines with notes/weighted_component_internal_strictness_v2.md whenever the other selected components have their own weighted packings. In particular a supplied unused internal triangle elsewhere can then give strictness. No normalization preserving this collection of hypotheses is assumed.
