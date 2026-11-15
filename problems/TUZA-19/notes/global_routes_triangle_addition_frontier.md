# Exact three-edge frontier of an actual minimal violation

Status: ordinary exact normalization, with a genuinely unresolved exchange step. This is a refinement of the H-E setup, not a proof or a new independent equivalent theorem advertised as progress. No new census, Lean verification, or independent fresh review is claimed.

Let G be an edge-minimal counterexample to Tuza, with nu(G)=k and tau(G)=2k+1. Every proper edge-deletion subgraph satisfies Tuza. Fix an actual triangle T=abc, write H=G-E(T), and put h=k-1. The previously established exact minimality arithmetic gives nu(H)=h and tau(H)=2h. The marked vertices a,b,c are independent in H.

For e=uv among ab,bc,ca, its new page family consists exactly of triangles uvx with ux,vx in E(H). For R contained in {ab,bc,ca}, define f(R) as the minimum size of an OLD-edge set D contained in E(H) which covers every old H-triangle and also contains at least one of ux,vx for every page based on an edge uv in R. In particular f(empty)=2h.

Every actual triangle of H+T is either an H-triangle, one such page, or T itself. A new triangle cannot use exactly two new edges, because the third pair is the third edge of T. Consequently every cover selects a nonempty set Q of new base edges and an old cover satisfying the page constraints on T-Q. Therefore the exact identity is

    tau(G)=min{2h+3,
               2+min_e f({e}),
               1+min_{e!=f} f({e,f})}.                    (1)

This allows arbitrary old covers, including ones larger than a minimum H-cover; it does not discard the nonminimum-old-cover repair states exposed in the earlier apex archive.

The actual obstruction tau(G)=2h+3 forces

    f({e})>=2h+1 for each base edge e,
    f({e,f})>=2h+2 for each pair of base edges.             (2)

There is further packing information absent from the weak H-E premises. Deleting two base edges from G and applying the elementary one-edge cover Lipschitz bound gives tau(H+e)>=2h+1. The minimum H-cover together with e gives the reverse inequality. Similarly tau(H+e+f)=2h+2. Because these are proper subgraphs of G and hence satisfy Tuza, while their packing numbers are at most k=h+1, one gets EXACTLY

    (nu,tau)(H+e)=(h+1,2h+1),
    (nu,tau)(H+e+f)=(h+1,2h+2).                           (3)

In particular EVERY page family contains a page uvx whose two old spokes ux,vx can be avoided by some maximum h-packing of H: a packing of size h+1 in H+e must contain exactly one new page, since all its new pages share e; all its other h triangles are old.

However, for ANY two edge-disjoint new pages on distinct bases, their combined four old spokes cannot be avoided by a maximum H-packing. Otherwise those two pages augment it to h+2, exceeding nu(G). Since the bases share one marked vertex, such pages are edge-disjoint exactly when their tips differ.

Thus the remaining nonlocal problem has three individually available augmentation states, while every compatible pair of pages blocks every maximum old packing. Simultaneously, every one-family cover repair costs at least one above the old optimum, and every two-family repair costs at least two. Endpoint consistency must rule out this entire joint configuration, or produce a cover through a larger old state with total cost at most2h+2. No theorem here performs that step.

## Exact closed control and decision

If the new pages contain no edge-disjoint pair, the new pages together with T are a pairwise edge-intersecting actual triangle family. Such a family is contained in a book or the faces of a K4, and has an edge cover of size at most two. This immediately extends any old minimum cover by at most two, contradicting the assumed obstruction.

If every old triangle component is a literal K4 or K5, any two edge-disjoint new pages leave a full old maximum packing: each such block contains at most one of a,b,c, so their four old spokes delete at most two edges from a block, and any two deleted edges in that block are adjacent. A K4 has a face avoiding its one marked vertex; a K5 retains its two-packing after any two edge deletions. Triangle-free background edges do not affect the old packing. This is the root's already recorded block closure, not an expanded terminal-class claim.

Beyond that closed case, the statement still requires an availability/exchange theorem for arbitrary tight H. Recasting the four-spoke blocker as a minimum-cover change returns to the earlier nonlocal forced-edge and all-red-triangle constraints. Neither the fixed small atlas nor the present exact state identity supplies the missing theorem. This lane is frozen with the gap explicit; no larger census or further standard gadget repair is justified by the present evidence.
