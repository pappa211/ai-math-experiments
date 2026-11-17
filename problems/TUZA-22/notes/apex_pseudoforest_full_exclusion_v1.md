> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion of apex-pseudoforest closed links

Frozen 2026-11-16. Status: ordinary assembly of independently reviewed all-size results. This strengthens the link-excess inequality; it does not establish unrestricted CS or a global cover representation.

## Theorem

In a proper-subgraph-minimum combined-CS failure G, let L be a nonempty connected closed component of an induced link. For every vertex w of L, the graph L-w is NOT a pseudoforest. Arbitrary outside attachments and other closed components of the same hub link are allowed.

Here a pseudoforest means that every connected component contains at most one cycle. The claim concerns the actual induced link, including all its edges.

## Assembly

The accepted link-vertex-deletion theorem first gives that every component of L-w contains a cycle. If L-w were a pseudoforest, each component would consequently be unicyclic.

The ordinary apex-pseudoforest boundary theorem reduces this exact state to at least two components, each a four-cycle, with w adjacent to three or four vertices in every component. Its proof includes the one-component case through ordinary apex-unicyclic exclusion, mixed perfect/nonperfect components, all attached-tree cases, and arbitrary optional apex neighborhoods.

The retained-boundary full-four-cycle theorem excludes any component in which w has four neighbors. It keeps hw and every outside page on that edge; the entire old-block footprint argument explicitly handles a residual block containing hw.

Thus every component is a four-cycle with exactly three w-neighbors. The newly reviewed bouquet theorem excludes this final state. In that theorem a balanced reduction packs three triangles per component, leaves the residual paths w-c_i-d_i, and uses simultaneous minimum old covers through every supported c_i d_i to reduce the cover increment from6t to5t+1. This is strict for t>=2. It uses no WKE availability assertion.

These alternatives exhaust every pseudoforest L-w, proving the theorem.

## Strict link excess

Put n=|V(L)|, m=|E(L)| and mu=m-n+1. Every component of L-w is cyclic by the earlier theorem; the new theorem says at least one has at least two independent cycles. Therefore

    m-deg_L(w) >= (n-1)+1 = n,
    deg_L(w) <= m-n = mu-1.

Since w was arbitrary,

    mu >= Delta(L)+1.

Minimum link degree is at least two. A connected link with maximum degree two would be a cycle and would contradict the earlier cyclic-component deletion theorem. Thus Delta(L)>=3, and

    mu>=4,                 m>=n+3.

Only AT LEAST ONE component of each L-w is asserted to be multicyclic. The proof does not say that every component is multicyclic, that L has a bounded size, or that all its triangle-bearing states are excluded.

## Frozen dependencies

* `notes/link_vertex_deletion_cyclic_components_v1.md`, SHA-256 `1369c2ed436c3d3f166e5dc2b27df57dd9d98ccd08ac60a07eef47310b629791`.
* `notes/apex_unicyclic_full_exclusion_ordinary_v2.md`, SHA-256 `3adee37d0c9badaeec2b57088b694816bd811eef727dbcf2d5d9f4576c4e43c4`.
* `notes/apex_pseudoforest_boundary_v1.md`, SHA-256 `0750e728630749164c766aef4c2b4f85ea3917e325a7a49617cbeb12ba995b1e`; fresh review `review/challenger_apex_pseudoforest_boundary_review.md`, SHA-256 `cd9c636d1be04fb1af2e3aa1633046e8219b838884bbf341948d3e7e4f629f9b`.
* `notes/full_four_cycle_pseudoforest_component_exclusion_v1.md`, SHA-256 `f2c204751a2b038b94d7bcf5d76b5152e0904d71935f2f0822c489c24bfa3945`; fresh review `review/challenger_full_c4_retained_boundary_review.md`, SHA-256 `1001c4d48b88c45d545b2dc0baa5249166662557a315bdf37530c5a9c752b758`.
* `notes/challenger_three_neighbor_four_cycle_bouquet_exclusion_v1.md`, SHA-256 `c75c92699a9fea6b1b6588b8cf89e2e89b4322e802bf9ecd81263b8423019017`; fresh review `review/restoration_three_neighbor_bouquet_review.md`.

The full-four-cycle input uses the authenticated ordinary good-page endpoint proof in pinned TUZA-15 `sources/public/papers/tuza-five-degenerate/main.md` section5.3, SHA-256 `6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f`. No finite certificate, external matching structure theorem, or computation is a premise of this assembly. The earlier374-state computation remains independent corroboration of a predecessor, not a dependency here.
