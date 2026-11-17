> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh adversarial reconstruction of the equal-matching residual exclusion

Reviewer: restoration agent, 2026-11-16. Result: ACCEPT at the stated scope.

Reviewed `notes/coordinator_TF_residual_equal_matching_exclusion_v1.md`, SHA1c40a0c8be58ca926e7f35175448dc80c0d891c22128a6596af9a379775d88b6. I reconstructed the argument from the accepted cone interface and checked the following potential failure points.

An r-matching in R avoids EVERY deleted P base, so its hub packing contradicts cone packing-criticality for any outside page. The proper-cone cover union then legitimately forces G=A; no induction on A occurs once A=G. If a P-unmatched vertex u exists, its entire link really is h joined to a matching: its L neighbors are R neighbors, and an edge between them cannot lie in R by triangle-freeness. This is a closed connected apex-forest link, so that exclusion forces P perfect.

For a P edge uu', codegree supplies a genuine rim third vertex after G=A. Every perfect R matching must hit every rim triangle, since otherwise that triangle appends to all its hub triangles. Thus all common R neighbors W must be assigned to u,u', giving one or two neighbors. The exact link at u has no omitted R edge within D=N_R(u), and every D-minus-W vertex needs an internal P mate by minimum link degree.

The delicate two-neighbor case checks: when v,w are common neighbors, switching the two cross matching edges is always available. If v had a P mate z in D other than w, select the switched perfect R matching with u matched to w. It avoids BOTH uv and uz, and cannot contain the P edge vz. Hence it misses the actual rim triangle uvz, contradiction. This removes all possible extra branches in the nonmate case. In the mate case, the whole remaining D set is paired internally, so the link is exactly h joined to K3 plus t disjoint K2s. The displayed matching and two-vertex cover give strictness for t>=2; t=1 leaves an actual diamond with its missing edge deleted, and t=0 is excluded by robustness.

Every new link used is the whole actual link in G=A, connected through h. All imported exclusions are ordinary at closed-component scope. No external source or finite evidence is used by the new proof. The bipartite corollary uses only ordinary matching-cover equality after vc(R)=r; no existence of a WKE tuple is inferred. The nonbipartite triangle-free residual boundary remains open.
