> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# M0 formal interface and ordinary-source correspondence

The new `Tuza23/M0.lean` compiled successfully in `operations/m0-full-fixed-20261116T090835704021Z` (2.708 seconds, peak sampled process-tree RSS 1,603,059,712 bytes). Final clean build and actual theorem-level axiom reports remain required for mission acceptance. The independent reviewer has separately examined its semantics in `review/accounting_m0_semantic_review.md`.

`MinimalCS G` means `¬ CS G` and `∀ H : SimpleGraph V, H < G → CS H`. The finite vertex type V is arbitrary; strict subgraphs use the same type, with removed vertices represented as isolates. The bridge `minimalCS_iff_minimalObstruction` identifies this with the existing edge-count minimality predicate. `exists_minimal_cs` uses the existing Nat.find proof among subgraphs of a particular finite graph. `exists_minimal_cs_in_class` carries an arbitrary class predicate through an explicit subgraph-heredity hypothesis. No global ordering of graph types is assumed.

The theorem `minimal_cs_package` yields:

- a nonempty actual triangle family;
- for every two actual triangles s,t, `TriangleConnected G s t` under shared-edge adjacency;
- every actual graph edge belongs to actual triangle support;
- tau(G)=2nu(G);
- for every actual graph edge e, nu(G-e)=nu(G) and tau(G-e)+1=2nu(G).

The only mathematical hypothesis is `MinimalCS G`. This is a complete conditional reduction, not a proof of universal CS or unrestricted Tuza. In particular, it does not assume R2, a blocker, a restoration property, sparsity, bounded degree, or a bound on graph order.

The principal new supporting argument is actual component realization. `TriangleClosed G F` requires F to contain actual triangles and be closed under sharing an actual graph edge. `supportGraph G F` retains exactly graph edges supported by F. `triangles_supportGraph` proves its entire actual triangle family equals F; a crossing triangle cannot be lost from the proof. `closed_component_preserved` proves original shared-edge components rooted inside F are unchanged. The complement family is also closed and has disjoint edge support. `good_of_closed_split` uses the existing proved packing/cover additivity, proves tightness of both parts before using their equality implications, and reconstructs B of the original graph through component preservation. A purported disconnected minimal failure would make both realized pieces proper, so minimality supplies the contradiction.

The reused minimality/critical modules already prove the no-background-edge and per-edge numerical conclusions at the class-independent scope. The new assembly does not import the separate degree-conditioned published theorem. The formal work exposed no mathematical change in the ordinary M0 source. Initial compile failures concerned finset/set coercions, an overbroad rewrite, and retaining a destructed witness; they did not require a stronger hypothesis or a weaker conclusion.
