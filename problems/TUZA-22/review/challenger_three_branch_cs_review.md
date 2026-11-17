> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: at least four branch vertices in every closed link

Decision: ACCEPT USING DECLARED INPUTS. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Frozen primary: notes/three_branch_cs_link_exclusion_v1.md, SHA256dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4.

The suppressed-core classification is complete under the already reviewed loop and parallel-thread exclusions. With three branches there are at most six paths and at least five. Five gives degrees4,3,3 and cycle rank3, contradicting the reviewed rank-versus-maximum-degree inequality. Six forces exactly the displayed doubled triangle, with a direct edge and an even nondirect path on each pair. Cases with zero, one, or two branches are excluded as stated.

The outer cycle is even and all three branch vertices have the same cyclic parity. Its complementary perfect matching has exactly three distinct edges incident with the branch vertices, so the displayed Q has size s and covers all residual outer edges plus the entire branch triangle. On any outer path of length at least four, the selected perfect matching has a safe internal edge. Neither endpoint can participate in a link triangle, and the external-page footprint together with the complementary matching has at most a two-edge star in each literal residual block.

For the shortest three-ear shape, I checked the entire surviving rim graph and every footprint pairing explicitly. A residual clique cannot contain two alternate matching legs because that would require an absent edge between tips. The page axq has q outside the entire hub neighborhood; the listed absent edges ax,ay,xy exclude every disjoint pair between its spokes and alternate legs. The cyclic variants are identical. Therefore the no-outside-page conclusion holds for every removed rim edge, not just for selected witnesses.

The replacement set {ab,bc,ca,hx,hy,hz} covers all lost hub and ear triangles. Closedness excludes lost hub triangles outside the link, and the preceding no-page conclusion excludes all other lost triangles on P. Since abc survives in K, its edge ab belongs to a literal residual B-block and can be included in an optimum K-cover, providing the claimed one-edge overlap and strict inequality.

The theorem is an available all-size minimum-CS restriction. It does not classify the four-branch kernels or convert their historical WKE inequality certificates into equality reductions. No computational or external matching input was introduced by this argument.
