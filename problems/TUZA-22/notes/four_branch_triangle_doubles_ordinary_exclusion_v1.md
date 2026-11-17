> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion when three doubled branch pairs form a triangle

Frozen 2026-11-16. Ordinary all-size proof candidate for fresh review. This resolves one of the three exact shapes isolated by the new apex-pseudoforest boundary; it does not claim the other two shapes are resolved without finite premises.

Let L be a closed connected link component of a minimum CS failure. Suppose its four branch vertices are a,b,c,d, its underlying branch graph is K4, and precisely ab,bc,ca are doubled. Each double consists of its direct edge and an even thread, of lengths2t_ab,2t_bc,2t_ca with t_i>=1. Each of the other three branch paths, from d to a,b,c, is either direct or odd of length2s_j+1 with s_j>=1. All interiors have link degree two, and no other link edges occur.

This exact family is excluded by an ordinary matching/cover argument for arbitrary thread lengths and arbitrary outside attachments.

## 1. The matching and cover

Orient the even paths cyclically a to b, b to c, c to a. On an oriented path v0,...,v_(2t), put in P the t edges

    v0v1, v2v3, ..., v_(2t-2)v_(2t-1).

Each of a,b,c is used exactly once among these three path matchings; every even-path interior is also matched. On every nondirect d-path u0,...,u_(2s+1), put in P its s internal matching edges

    u1u2, u3u4, ..., u_(2s-1)u_(2s).

No direct branch edge is selected. These choices form a matching, with

    |P| = sum_i t_i + sum_j s_j.

Let q be the number of nondirect d-paths. Select a,b,c,d in Q. On each even path its final residual edge is covered by its terminal branch vertex; its other t_i-1 residual edges are disjoint interior edges, so select one endpoint of each. On each odd nondirect d-path both residual end edges are covered by the selected branch endpoints; its s_j-1 remaining residual interior edges are disjoint, so select one endpoint of each. All selected interior vertices are distinct. This covers every edge of L-P, including the direct core triangle and all direct d-edges, and gives

    |Q| = 4 + sum_i(t_i-1) + sum_j(s_j-1)
        = |P| + 1 - q.

## 2. Exhaustive q cases

If q>=2 then |Q|<|P|. The standard closed-link deletion of the P edges and hub spokes gives a strict reduction, impossible in a minimum CS failure. This argument covers all lost outside pages by selecting every deleted P edge, while Q covers every remaining lost hub triangle.

If q=1, rename so only the a-d path is nondirect. The tuple is balanced, so the residual K has literal B triangle support. No direct branch edge was deleted. Thus the actual residual triangles abc and bcd share bc, while ad is absent from the original link and remains absent in K. In a B residual, the two edge-sharing triangles must belong to the same literal K4/K5 and force ad present. This contradiction excludes q=1. The lengths of the paths have no effect on this actual diamond.

If q=0, a,b,c,d span an actual K4 in L. The already reviewed ordinary four-branch K4-link exclusion applies (its remaining ears are precisely among the allowed arbitrary even threads). This excludes the last case.

The three cases exhaust the family. No enumeration, parity compiler or finite certificate is used. The proof uses only the standard ordinary balanced-deletion consequence and the ordinary K4-bearing four-branch theorem in the q=0 case.

Dependencies: `notes/four_branch_after_pseudoforest_boundary_v1.md` for availability of this exact shape; `notes/four_branch_k4_link_exclusion_v1.md` for q=0; ordinary M0/proper-subgraph CS and literal B support. The q>=1 proof above is independent of the four-branch finite assembly.
