> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Coordinator independent ordinary reviews — 03:20 UTC

## Outside-page residual clique certificate

Source: notes/external_page_clique_footprint_certificate_v3.md, SHA256 556b9e18f700c80736f05f5cf62e9c5c044a3269df29b9af17cb1a19bbd80088.
Status: ACCEPTED ordinary sufficient certificate, after independent reconstruction.

Balanced WKE deletion leaves B(K) with packing number decreased by r. An edge f=ab of P with no L triangle has an additional page abx by minimum-CS codegree at least two; x is outside the hub neighborhood. A matching Z of size at least r avoiding f gives edge-disjoint hub triangles, also disjoint from that page. Every old block's intersection with L is a clique in R=L-P, of size at most five. It cannot contain both a,b, since f is absent. Thus the page contributes at most one surviving spoke in that block. The literal all-cliques test bounds Z's contribution by one edge and requires it to meet the page's endpoint whenever one is present. The entire old footprint is therefore at most two incident edges, including blocks with at most one L vertex. The accepted K4/K5 avoidance property permits all old maximum packings simultaneously; append r+1 triangles, contradiction. All actual R cliques must be checked. No finite outside-vertex bound or unexamined attachment assumption is used.

The corrected example has residual edges abc,xy,wx,wz,wt. Q={w,a,b,x} covers all of these. P and Z are matchings of four actual edges; f=ax has no L triangle. In abc the only selected Z edge is ab, incident with a. Other cliques have size two. The example passes by direct inspection. Earlier v1/v2 example errors remain superseded and unaccepted.

## Cover-drop-one unicyclic packing

Source: notes/unicyclic_cover_drop_one_packing_v2.md, SHA256 309cd21ce46cb7adf5e3bfbed952b09ceb2233ecb6ef4c5433af9bc86e104926.
Status: ACCEPTED ordinary theorem at its stated hypotheses.

Exact-one selected edges and minimum global C force assigned-family cover cost m, by literal replacement. The deletion equality similarly forces residual cost m-1 after any assigned triangle deletion; all outside selected bases survive. The family graph obtained by deleting outside-outside edges has precisely the assigned actual triangles, because no selected edge crosses selected components. Removing a triangle on a cycle base leaves a forest cover. Apply the existential forest anchor to its internal induced graph, and external-forest packing-cover equality to bases outside the anchor cover. Anchor inclusion makes the two packings disjoint. Their weighted cost is at least m-1; appending the deleted triangle yields weight at least m, or m+1 when it is internal. In the entirely external case minmax yields m-1 pages, then the chosen cycle-base page restores a full m-page packing. This does not assert extension of an arbitrary partial packing, compatibility across components, or availability of unicyclic minimum covers. The original near-tight H-D equation is not used here.
