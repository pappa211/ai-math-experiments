> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh challenger review: nonperfect apex-forest link branch

Verdict: ACCEPT conditional on the explicitly declared Gallai–Edmonds, Konig, triangle-free WKE, and minimal-CS inputs. This review checks the ordinary derivations and whole-footprint augmentations; it does not independently authenticate the external Gallai–Edmonds source.

The alternating-tree exploration in the first leaf fact is sound: every odd-distance vertex is matched or gives an augmenting path; every nonleaf even-distance vertex has a forward nonmatching edge; acyclicity prevents merging or revisits. An internal exposed root has two branches, while an exposed leaf supplies itself plus the other branch endpoint. Thus two original tree leaves are exposable.

Fact A correctly preserves an allowed edge ab. Removing its endpoints lowers matching number exactly by1 and retains deficiency d. A component cannot attach twice to the deleted adjacent pair without creating a cycle, so at most one leaf in each nontrivial component is new. A singleton has original degree1. The resulting exposed original leaf is distinct from a,b.

Fact B correctly handles both changed components after deleting ab. Any nontrivial nonperfect component has two exposable leaves and at most one new leaf; an original-leaf endpoint of ab becomes isolated and cannot be the selected nontrivial-component leaf. If only singleton deficient components existed, there could be at most one: two isolated endpoints would make ab a K2 component and lower matching number. This contradicts the retained deficiency>=2. Thus the stated exposed leaf outside a,b exists.

The reduction using a maximum F-matching with residual matching<r is valid even when that matching exposes no w-neighbor: it supplies a WKE tuple of size r, and the separately established link matching number r+1 gives a larger hub augmentation. Since L is K4-free, a residual clique block contains at most one edge of any link matching, so simultaneous avoidance is legitimate. The d=1 argument and the internal-vertex-exposing path matching are correct.

In the Gallai–Edmonds specialization, factor-critical forest components are singletons, C must be empty because a perfect forest matching is unique and would create essential edges, and every A-D edge is allowed by swapping from a maximum matching missing its D-endpoint. Every A-vertex therefore has at least two D-neighbors. The A-D component has a D-leaf which is an original forest leaf. The odd path between the triangular A-vertex and that leaf has1-labeled endpoints and no11 edge; absence of00 would force alternating labels and contradict its odd length. The safe00 edge is therefore supplied exactly as claimed.

For the internal augmentation, the deleted rim base prevents two surviving edges of its triangle in one residual clique. A matching supplies at most one other rim edge; disjointness would require four L-vertices in a clique, contradicting K4-freeness. For the external augmentation, each page endpoint is in no L-triangle because it is not adjacent to w and F is a forest. A residual block containing such an endpoint cannot contain three L-vertices, so its matching edge cannot be disjoint from its one possible page spoke. Both whole footprints are stars of size at most2. Outside page apices are explicitly handled, rather than assumed absent.

No objection remains to the stated nonperfect branch. The result does not assert availability of a forest cover or exclude arbitrary WKE links.

Reviewed source SHA256: b56dfa6252fbe9a6b78c98552319e439e3c6b58c5cc344dedcc9f06294c7a5dc
UTC: 2026-11-15T23:42:08.521779+00:00
