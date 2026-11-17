> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: triangle of doubled branch pairs

2026-11-16. **ACCEPT as an ordinary all-size proof using the stated ordinary q=0 input.** Source: `notes/four_branch_triangle_doubles_ordinary_exclusion_v1.md`, SHA256 `f34a13d77e679b77083b48970da521e97fd3688bafe826d3198ba9ada8bb235e`.

I independently checked the path indexing. Each cyclically oriented even thread uses its initial branch vertex and all its interiors exactly once, while omitting its terminal branch vertex. Thus the three thread matchings use a,b,c once each without collision. Each odd nondirect d-thread uses only its even number of internal vertices. The matching is therefore valid at every allowed length, including length2 even threads and length3 odd threads.

After deletion of that matching, an even thread has t−1 interior residual edges and its terminal edge, and an odd nondirect d-thread has s−1 interior residual edges and its two end edges. The four branch vertices in Q cover all direct edges and all terminal edges. The remaining selected interior vertices are distinct, so |Q|=|P|+1−q holds exactly.

For q>=2 the strict closed-link deletion covers every lost outside triangle on its deleted P base; there is no omitted footprint condition. For q=1 the surviving direct triangles abc and bcd form a literal residual diamond with absent ad, so B is impossible regardless of path length or outside attachments. For q=0 the stated ordinary K4-bearing four-branch theorem applies; no finite four-branch assembly is silently substituted.

The exact-shape availability is a separate declared input. This proof eliminates one of the three remaining shapes only and does not claim the other two shapes are resolved ordinarily.
