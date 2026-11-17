> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Weighted component compatibility and an internal-triangle strictness gain

Frozen v1, 2026-11-16. Status: ORDINARY_PROOF_CANDIDATE; fresh review requested. The coordinator supplied the principal strictness mechanism; this note records the verifier's independent reconstruction. The more general unused-internal-triangle formulation below is the same argument.

## Supplied data and scope

Let G be any finite simple graph, and let C be an actual triangle-edge cover. Write C_i for the nonempty connected components of its selected-edge graph and A_i for their pairwise disjoint vertex sets. Assign each actual triangle to the unique C_i containing its C edges. For each i, supply an edge-disjoint packing P_i from its assigned triangles. A selected triangle is internal if all its vertices are in A_i and external otherwise. Let I and E be the total numbers of selected internal and external triangles.

If 2I+E≥|C|, then τ(G)≤2ν(G). In addition, τ(G)<2ν(G) holds if either:

1. the cross-conflict graph of selected external triangles has an odd-order path component, including an isolated vertex; or
2. for some i there is an actual triangle U inside A_i edge-disjoint from every internal member of P_i.

A useful special case of condition 2 is that C_i is a literal triangle and P_i consists of three edge-disjoint external pages, one on each base. Arbitrary other selected-cover components are permitted if their supplied packings make the total weight reach |C|. The stronger per-component bounds 2I_i+E_i≥|C_i| suffice but are not logically required.

No claim is made that the required local packings exist for general minimum-cover components. The accepted K5-minus-edge and K4-face-apex boundaries prevent such a promotion.

## Exact actual-triangle conflict representation

The C edges of any actual triangle belong to one C component: any two of them have a common endpoint. An external i-triangle consequently has exactly one C edge, with both endpoints in A_i, and a single apex outside A_i. An internal i-triangle cannot conflict with any j-triangle for j≠i: its edges have two endpoints in A_i, whereas a j-triangle has two vertices in A_j and at most one in A_i.

Two external triangles assigned to different components i,j can share an edge only if each triangle's apex belongs to the other component. Their shared edge then joins A_i to A_j. Thus each nonisolated cross-conflict component involves one fixed unordered pair {i,j}, with bipartition by the assigned family. Each external triangle has at most two conflicts, one per spoke: a given spoke can occur in at most one triangle of the already edge-disjoint P_j. Hence the cross-conflict graph is a disjoint union of paths and even cycles, including isolated vertices.

Keep all I internal members. In each conflict component choose an independent set of maximum size. An even cycle or even-order path contributes half its vertices; an odd-order path contributes half plus one half. If o denotes the number of odd-order path components, this gives an actual packing of size

    I + (E+o)/2.

Therefore 2ν(G)≥2I+E+o≥|C|+o≥τ(G)+o. This proves the inequality and strictness when o>0.

## Balanced components and an unused internal triangle

Suppose now that o=0. Every conflict component has two bipartition classes of equal size. Fix the distinguished i and its triangle U from condition 2. In every conflict component that contains an i-triangle, choose the opposite bipartition class. Each such component has the fixed core pair {i,j}, so this excludes every selected external i-triangle and still retains exactly half its vertices. In every other component choose either class. The resulting external selection has exactly E/2 triangles. It is edge-disjoint from all selected internal members.

Append U. It is edge-disjoint from the internal members of P_i by hypothesis; from all internal members assigned elsewhere by the disjoint A sets; and from all external members assigned elsewhere because each such triangle has at most one vertex in A_i. No external i-member remains. Consequently

    ν(G)≥I+E/2+1,
    2ν(G)≥2I+E+2≥|C|+2≥τ(G)+2.

This proves condition 2, independently of any matching or topological theorem. If o>0 we already had strictness, so no balanced assumption is part of its statement.

## Concrete corollaries and trust boundary

If every C component is a literal triangle with three supplied edge-disjoint private pages, set I=0 and E=3t=|C|. Condition 2 proves strictness for t>0. This is a shorter proof of the configuration theorem in `notes/three_private_pages_triangle_cores_v1.md`, preserving the indispensable pairwise vertex-disjointness of the selected triangle cores.

More generally, suppose C is minimum, each component is either a star or a literal triangle, every triangle component has a three-page private packing, and there is at least one triangle component. The declared-Gallai–Edmonds saturation theorem in `notes/challenger_minimum_vertex_cover_matching_v1.md` supplies each star's weighted packing with weight |C_i|. The present ordinary lemma gives τ(G)<2ν(G). This corollary has that external input solely through local star availability; the compatibility proof itself is elementary.

The statement does not assert that an arbitrary minimum cover can be changed to this shape while preserving all hypotheses. In particular, a two-page triangle normalization can alter neighboring cover components. Larger components and general local availability remain open.
