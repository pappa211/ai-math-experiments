> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: cover leaves see selected cycles

Decision: ACCEPT as an ordinary corollary of the reviewed local apex-forest exclusions.

Frozen source: notes/cover_leaf_cycle_corollary_v1.md
SHA256: 4e2dc4572615de4074508588bfc4d4290e448cb577f5aa6b844b9b14466874a5

For a selected leaf v with selected neighbor w, every link edge xy avoiding w is selected, because neither v-spoke can cover vxy. Conversely every selected edge with endpoints in N(v) minus {w} is an actual link edge. Thus the source's equality L-w=C[N(v) minus {w}] is exact. If it were a forest, the minimum link degree excludes every component away from w and the remaining closed apex-forest component contradicts the two reviewed exclusions. No optimality of the cover C was used.

When C has one cycle Z, that entire cycle must lie in N(v) minus {w}, so w is outside Z and the leaf is adjacent in G to every cycle vertex. For two leaves u,v, pick any a in Z. The edges ua and va are unselected, because neither selected parent lies in Z. An actual edge uv must therefore be selected to cover uva. Since both endpoints have selected degree1, this is precisely an isolated selected K2 component. Thus the selected leaves induce only the permitted isolated K2 edges and isolated vertices in G; in the connected unicyclic case the leaf set is independent.

The class-minimality and codegree/robustness assumptions remain explicit. This does not prove existence of a unicyclic cover or exclusion of all such covers. No new computation or external matching result is used.
