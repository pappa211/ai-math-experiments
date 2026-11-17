> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A leaf of any triangle cover must see a selected cycle

Status: ordinary corollary of the self-contained apex-forest link exclusions; frozen for fresh review. This is a restriction on a class-minimum combined-CS failure, not an availability theorem for covers.

## General any-cover statement

Let G be an edge-minimum failure of combined CS, either globally or in an edge-subgraph-hereditary class. Assume the established class-local M0, codegree and closed-link robustness conclusions. Let C be ANY triangle edge cover of G; C need not be minimum. If v has degree one in the selected-edge graph C, and vw is its unique selected edge, then

    C[N_G(v) minus {w}] contains a cycle.

Here the induced selected-edge graph keeps exactly those edges of C whose endpoints lie in the displayed vertex set.

Proof. Every actual triangle vxy with x,y different from w must be covered by its rim xy, because neither spoke is selected. Thus the entire link L=G[N_G(v)] satisfies

    L-w = C[N_G(v) minus {w}].

If this graph were a forest, any link component not containing w would be a nonempty forest with minimum degree at least two, impossible by the codegree conclusion. Hence the entire link would be one closed connected apex-forest component containing w. It has at least five vertices by robustness. The perfect and nonperfect self-contained apex-forest exclusions then give a contradiction. This proves the statement, including arbitrary outside edges and pages. ∎

## Exactly one selected cycle

Suppose C has exactly one cycle Z in total; other selected components may be trees. Then every selected leaf v, with selected parent w, satisfies

1. w is not a vertex of Z;
2. every vertex of Z belongs to N_G(v).

Indeed the cycle supplied by the general statement must be the unique cycle Z, so all its vertices lie in N_G(v) minus {w}.

For two distinct selected leaves u,v, any edge uv of G must belong to C. To see this, choose a vertex a of Z. Both ua and va are actual G edges, and neither belongs to C because the selected parents of the leaves lie outside Z. If uv were also unselected, uva would be an uncovered actual triangle. When uv belongs to C, the leaves' unique selected edges are both uv, so {u,v} is an isolated K2 component of the selected graph.

Consequently the graph induced by all selected leaves consists only of the isolated K2 components already present in C. In particular, if the selected graph C is connected and unicyclic, its leaves form an independent set in G. The connectedness qualification matters: without it an isolated selected K2 is permitted, and its two leaves can be adjacent.

These conclusions hold for an arbitrary one-cycle triangle cover of a minimum failure, not only an optimum cover. They do not show that such a cover exists, that its cycle has any fixed length, or that all graphs with a one-cycle cover satisfy CS.

## Dependencies

- `notes/apex_forest_perfect_link_exclusion_v2.md`, SHA-256 `e82d2ea2eaeb42b3a91b67ddc4a52a30ce83e01f8e065a208f341d1cbf3052a6`;
- `notes/apex_forest_nonperfect_branch_v2.md`, SHA-256 `c587035bea6883c1a5f80d0fc261be3e02144c84dae1678a50a6dc82d67fec47`;
- authenticated class-local M0/codegree/robustness from `sources/public/papers/tuza-five-degenerate/main.md`, Sections 1–4.

The hereditary-class interface is explicitly assembled in `notes/forest_triangle_cover_cs_v1.md`; this corollary uses the local exclusions, without assuming the forest theorem applies to G itself. No computation or external matching theorem is a new premise.
