> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion of three P4 doubled branch pairs

Frozen 2026-11-16 before the research cutoff. Ordinary proof candidate.

Use the exact four-branch reduced domain: underlying simple K4, doubled pairs ab,bc,cd, each a direct edge plus an even thread of length2t_i. All single paths ac,ad,bd are direct or odd nondirect of length2s_j+1. Let q count the nondirect single paths.

Orient the three even threads a to b, b to c, and d to c. Their starting branch endpoints a,b,d are distinct. Select the alternating t_i-edge matching beginning at the starting endpoint of each thread, leaving its terminal endpoint unmatched on that thread. Select the s_j-edge internal perfect matching on each odd nondirect single path. These selections form a matching P of size sum t_i+sum s_j.

Select all four branch vertices in Q. On each even thread its residual terminal edge is covered there; select one endpoint of each of the other t_i-1 residual interior edges. On each odd nondirect single path both residual end edges are covered; select one endpoint of each remaining s_j-1 interior edge. Thus Q covers all L-P and

    |Q|=4+sum(t_i-1)+sum(s_j-1)=|P|+1-q.

For q>=2 this is strict. For q=1 it is balanced; no direct core edge was deleted, so L-P contains the literal diamond K4 minus the unique missing single pair. Its two edge-sharing actual triangles cannot lie in literal B residual support because the absent diagonal would be forced present. For q=0 the branch vertices span an actual K4, excluded by the ORDINARY `four_branch_k4_link_exclusion_v1.md`, not by the finite assembly.

This proves the whole P4-double family for arbitrary thread lengths and outside graph attachments. Closed-link deletion covers every lost outside triangle on a deleted P edge by that same edge, and every lost hub triangle via P or Q. No finite certificate or compiler is used. This is the same fully explicit counting mechanism as `four_branch_triangle_doubles_ordinary_exclusion_v1.md`, with the starting endpoints now a,b,d.
