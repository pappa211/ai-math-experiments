> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh restoration-role review of the ten-edge WKE theorem

Decision: ACCEPT within the declared mixed symbolic/computer-assisted dependency scope.

Reviewed frozen source: `notes/sparse_triangle_free_wke_v1.md`, SHA-256 `524cc2e9b240a45f99620fa94487071c79f57ad93a234ce5d78c948d78c91c26`.

I reconstructed the argument directly from the note before reporting this conclusion. No graph enumeration, producer script, or external classification was used in this review. The Tsujimura degree-profile theorem remains a separately verified finite-premise dependency; this review does not relabel it ordinary-only.

The degree>=5 branch is sound: independence of N(v) means edges incident with that set are counted exactly once by its degree sum; minimum degree2 gives at least2d edges. With the ten-edge budget, all edges meet the independent five-set, giving a bipartition.

The matching lemma was checked step by step. Distinct unmatched neighbors at the two ends of a matching edge give the length-three augmentation; a common unmatched neighbor gives a forbidden triangle. Thus n<=3r. In the eight-vertex r=3 case, the common neighbor a of the two unmatched vertices is forced by two subsets of size at least2 in a three-element matching index set. Its mate a' has a neighbor in a different matched pair. Each subsequent forbidden neighbor in the note was checked literally: the displayed length-seven and length-five augmenting paths alternate correctly and have distinct vertices. The last forced adjacency gives four neighbors of c, contradicting subcubicity. This proves the claimed perfect matching without a hidden connectivity or bridge assumption.

For the four-degree-three branch, the residual after removing the selected matching has at most four possible odd-cycle vertices except when the unmatched vertex has degree2. In that exception an odd cycle would be a five-cycle through that vertex and all four degree-three vertices. Its other four vertices cannot be matched internally: adjacent pairs are already surviving cycle edges, and nonadjacent pairs would be triangle-forming chords. Two outside vertices cannot supply four matching partners. Hence the residual is bipartite and Konig's cover theorem supplies the WKE cover.

The remaining small-order cases are exhaustive. At order7 an induced five-cycle leaves two vertices whose cycle neighborhoods are independent sets of size at most2. The xy-present and xy-absent cases cover all possibilities. The last 2+2 case has the explicitly displayed Hamiltonian cycle, and all seven degrees meet the subcubic hypothesis. The shortest odd-cycle-seven case has no chord because every chord creates a triangle or shorter odd cycle. At orders8 through10, the excess-degree budget leaves precisely the stated four-degree-three exception, which can occur only at order8.

Finally, the minimum-cover consequence follows from the literal rim-edge inclusion in C for a vertex outside V(C). Every component has minimum degree2 and, by the separately declared M3 input, at least five vertices. A triangle-bearing such component uses at least six edges. Therefore at most one component fits the ten-edge budget; its order is at most9. The conclusion that the vertex lies in an actual K4 uses the actual triangle in its link, not a surrogate neighborhood graph.

Accepted scope: every triangle-free graph of minimum degree at least2 with at most10 edges is WKE, using the declared verified finite premise; consequently every vertex outside the endpoint set of a <=10-edge triangle cover of a minimum CS failure has one connected triangle-bearing link of order at most9. No unrestricted non-WKE classification or global CS conclusion is inferred.
