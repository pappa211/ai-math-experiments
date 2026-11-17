> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: full combined CS after at most three restored edges

Verdict: ACCEPT, ORDINARY PROOF. Reviewer challenger,2026-11-16 UTC.

Sources: notes/three_disconnected_path_edge_restoration_v1.md SHAccbce9b980ff4d8ad99de45001d0299a1411d7c5e03d165fa5a4aaf62a63e476; notes/three_edge_restoration_full_cs_v1.md SHAfba3658d1e537bd0a382f87a72971186fab892a1ba8772598de6b809d0f961e4. The other three new shapes were freshly accepted in review/challenger_three_edge_restoration_partial_review.md. I additionally reread the complete frozen R1 and R2 proofs to check the stronger premise audit.

## Final P3+K2 shape

I independently derived the same closure before receiving the frozen source. The source's reordered version is sound. If the two-new triangle abc exists, every disjoint-base page must use the opposite edge to bc in its unique old K4 block. The third-base family is therefore a singleton dez. An adjacent-base page cannot be obstructed by dz (the required opposite spoke would use a missing restored edge), nor by ez: either it shares an already supported old edge with that same block or its two block edges and the other old page spoke make an actual old triangle joining the blocks. Thus no adjacent ordinary page remains, and the old opposite cover already meets both new triangles.

When the two-new triangle is absent, both adjacent active families have one common apex u. If u is outside the disjoint base, each third-base page is disjoint from both and requires two K4 obstructions sharing the old apex-joining edge; the common selected spoke must be au. Its unique old block and unique opposite edge cover the entire new family. If u is an endpoint of the disjoint base, compatibility forces the third page's apex to be the adjacent bases' common endpoint, so all pages share one old edge. Both alternatives are strict. Therefore one restored edge is triangle-free and R2 applies.

All vertices used in old-triangle closure are distinct precisely in the opposite-spoke obstruction cases. No arbitrary outside page is omitted.

## Full inequality, not merely equality restoration

The stronger audit is valid. A new triangle always appends to a maximum old B packing, and the three restored edges give tau(G)<=2m+3. If nu(G)>=m+2 the result is strict. Otherwise nu(G)=m+1, and only tau(G)>=2m+2 needs attention.

After their preliminary counting, every shape proof uses ONLY this packing equality and cover lower bound. All packing contradictions give m+2; every cover contradiction gives at most2m+1 (or2m). No step uses equality tau=2m+2 in a way that would fail at2m+3. In the inactive-edge cases, the two-edge upper bound then forces tau=2m+2 before R2 is invoked. In the remaining cases the literal B classification itself supplies tau=2nu=2m+2. Thus the potential Tuza violation2m+3 is excluded, not silently ignored.

R1's independent-terminal proof has the same stronger scope: pairwise page intersection follows from nu=m+1, and every contradictory cover has cost2m+1. R2 gives both its usual two-edge inequality and its exact equality classification.

The five restored-edge shapes are exhaustive: triangle, star, P4, P3+K2, and three-edge matching. The assembled equality outcomes are exactly one new K4 with old complementary edges background, or a star completion of an old K4 to a K5 with its fourth old spoke background. All other old triangle supports remain disjoint, while vertex sharing/background edges are permitted subject to all actual triangles.

The final global consequence is stated correctly: no minimum-CS failure becomes B after at most three edge deletions. This does NOT imply preservation of packing under every three-edge deletion, existence of a two-edge blocker, or unrestricted CS. The residual of an actual triangle deletion can remain defect one. No finite computation, CS induction, GE, Kotzig, outside-attachment restriction or claimed all-size formal proof enters this restoration theorem.
