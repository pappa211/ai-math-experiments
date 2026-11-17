> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent coordinator review: exact-codegree-two exclusion

Verdict: PASS as an ordinary theorem, conditional only on the explicitly stated standard Brooks and Tutte–Berge theorems. No numerical or formal-verification claim.

Reviewed source: reviews/opening_exact_codegree_two_exclusion.md
SHA256: 9eb3562275131db2813631eabbd6448af4989dfa85e50fa7d6f3e1d394544fd1

The actual-triangle dual is simple cubic: distinct primal triangles share at most one edge, and exact codegree two gives distinct neighbors at the three edges of each triangle. Packing is independent set; physical-edge triangle cover is a vertex edge cover in this dual. The elementary edge-cover identity is justified by the star components of an inclusion-minimal edge cover. Background edges play no role.

The three mutually adjacent dual vertices necessarily generate all four actual faces of a primal K4; exact codegree two isolates that entire component. Thus every other connected dual component is triangle-free cubic and eligible for the stated Brooks application.

I independently checked the Tutte–Berge accounting. For every S, small odd components contribute at least three boundary edges, other odd components at least one, and their orders are at least five. The two inequalities 3q+r<=3s and n>=s+q+5r imply n-8(q+r-s)>=9s-7q-3r>=2q. Hence matching size is at least7n/16. Together with alpha>=n/3 this gives integer defect at least two for even n>=10. The n=8 integer rounding and n=6 K3,3 cases are correct; order four is K4. Additivity gives the stated componentwise result.

Consequently the conditional minimum Q has some edge of codegree at least three. This does NOT establish any edge of codegree exactly two, exclude a mixed codegree distribution, or classify arbitrary larger books. The theorem is independent of minimum-Q naming, proper CS, and the new release compression. Its proof uses only ordinary finite graph facts; no external search or computation was needed.
