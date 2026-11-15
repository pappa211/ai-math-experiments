# An unbounded link certificate for the first matching frontier

Joint coordinator/scout argument, 4 November2026. This is a structural certificate for AC, not a new version of AC. It packages the low-budget proofs without claiming that the certificate exists for every triangle-free link.

## Theorem

Let (H,X) be eligible for the literal AC target. Let L=H[X], G=H+zX, p=nu(G), b=2p-tau(H), and m=matching(L). Suppose m=b-1. Write R_L for the intersection of ALL maximum ordinary matchings of L. Assume

1. some maximum matching M of L satisfies vc(L-M)<=b; and
2. |R_L|<=m-2.

Then AC holds.

An equivalent usable form of the first hypothesis is an explicitly given F subset M with vc(L-F)<=b. The matching must actually be maximum; no assertion that an arbitrary prescribed graph-edge matching extends is assumed. This is ordinary matching data on the LINK, not a prescribed triangle packing in H.

## Complete proof

Assume AC fails. No minimum H triangle-edge cover can contain M, because such a cover C would leave

    vc(L-C)<=vc(L-M)<=b.

The exact minimum cover containing M has size m+tau(H-M). Indeed its restriction outside M must cover H-M, and M plus any residual cover covers every H triangle. Since this cover is not minimum,

    tau(H-M)+m>=tau(H)+1.

Set J=H-M and k=p-m. Frontier arithmetic b=m+1 gives

    tau(J)>=tau(H)-m+1=2p-b-m+1=2k.

On the other hand J inherits the rainbow triangle edge-colouring, and M's apex pages append to any J packing. Aharoni therefore gives

    tau(J)<=2nu(J)<=2(p-m)=2k.

Equality holds throughout. The declared HNS graphical equality extraction and TUZA-03 exhaustion give k edge-disjoint actual K4 blocks containing every J triangle.

We next show every edge f in M that belongs to an H triangle belongs to R_L. Suppose instead that Q is an H triangle containing f and a maximum L matching N avoids f. Q contains exactly one L edge, f, by induced triangle-freeness. It meets each J K4 in at most one edge: two shared edges would put all Q vertices in that complete block and force f into J. Its possible block edge has exactly one endpoint in X. Each block contains at most one N edge, whose two endpoints are in X. If both edges occur in a block, their X endpoints force them to be adjacent: opposite edges would place three X vertices in the block, contradicting H[X] triangle-free. Select a face in each block avoiding both possible edges. Such a face exists for two adjacent forbidden edges, and certainly for zero or one.

These k faces, Q, and the m apex pages of N form an edge-disjoint G packing: block edges are mutually disjoint; Q avoids N because its sole L edge f is absent from N; all selected faces avoid Q and N; and the new spokes are distinct because N is a matching. This gives p+1 triangles, contradiction. Hence every old-supported M edge is in R_L.

Cover all J block faces with two edges per block and add the old-supported M edges. Every H triangle outside J contains one of those edges, so this covers H at size at most2k+|R_L|. But

    tau(H)=2p-b=2k+m-1,

forcing |R_L|>=m-1, contrary to hypothesis2. Thus AC holds. QED.

The positive theorem uses Aharoni/HNS only for the justified tight J. The final inequality uses an arbitrary H cover only to bound tau(H); it does not silently promote that cover to a minimum compatible cover. The contradiction began with the exact all-minimum-cover failure assertion.

## Example of an application

For L=3C5, m=6 and vc(L)=9. At b=7, choose a maximum matching containing one chosen edge in each of two cycles. Deleting those two edges lowers vc to7; hence deleting the entire matching also has vc at most7. No edge belongs to every maximum L matching, so |R_L|=0. The theorem therefore proves AC for this link shape at b=7, regardless of old outside incidence. A bare3C5 link is consequently not an uncovered AC discriminator at that budget.

## Exact limitation: the link certificate is not universally available

Define P, the Petersen graph, with vertices u_i,v_i for i modulo5 and edges

    u_i u_(i+1),  v_i v_(i+2),  u_i v_i.

It is cubic and triangle-free. It has no4-cycle: a mixed4-cycle would use two spokes and require the same index pair to be adjacent in both the outer5-cycle (difference1) and inner5-cycle (difference2), impossible; a single layer is a5-cycle. The five spokes give a perfect matching, so mu(P)=5.

Every maximum matching M is perfect, and P-M is a2-factor. Girth5 implies it is either a10-cycle or two5-cycles. P has no Hamilton10-cycle, as the following elementary spoke count shows. A Hamilton cycle must use an even positive number of spokes, hence2 or4. With2 spokes, the outer and inner horizontal edges must each form a spanning5-vertex path, whose endpoints must be adjacent in its respective5-cycle; the two spoke indices would have to differ both by1 and by2, impossible. With4 spokes, rotate so the omitted spoke is u_0v_0. Horizontal degrees force outer edges u_4u_0,u_0u_1,u_2u_3 and inner edges v_3v_0,v_0v_2,v_1v_4. Together with spokes1,2,3,4 these form two5-cycles, not a Hamilton cycle. Thus every P-M is exactly2C5 and

    vc(P-M)=6.

No edge is forced in every maximum P matching. The all-spoke matching avoids every horizontal edge. To avoid a prescribed spoke i, choose a different spoke j and perfect matchings of each layer after deleting index j; their union with spoke j is a perfect matching avoiding i.

Now take L to be the disjoint union of q copies of P, q>=2. It is a literal triangle-free graph with m=5q and R_L empty. Every maximum L matching is perfect on each component, so

    vc(L-M)=6q>5q+1=m+1

for every such M. Therefore hypothesis1 of the frontier theorem can fail even though hypothesis2 is as strong as possible.

This is a limitation on the LINK-ONLY certificate. It is NOT an AC counterexample and does not construct an eligible H with budget b=m+1. Taking H=L is eligible but has budget2m, a different regime. The example prevents extending the certificate to all triangle-free links merely because a finite small-link test passed.

Evidence: frontier theorem PROVED_USING_PUBLISHED_INPUT; the Petersen-family limitation PROVED_ORDINARY. Historical originality UNESTABLISHED. Full AC unresolved; independent_final_verification NOT_RUN.

## Supplemental complete finite certificate

`checks/b_petersen.py` independently reconstructs the literal10-vertex graph, enumerates all SIX perfect matchings by pairing the least remaining vertex with each available neighbor, and verifies that every complement has exactly two5-cycle components. This recurrence is complete: every perfect matching has exactly one possible partner for that least vertex and then restricts to a perfect matching on the remaining vertices. The output `evidence/b_petersen.json` lists every matching and complement, verifies empty intersection, and independently enumerates the maximum independent4-sets (hence vc(P)=6). A10-second/128MiB external watchdog bounded the completed tiny check. The ordinary non-Hamilton proof above remains available, so the unbounded disjoint-union conclusion does not depend on an unexplained finite verdict. This is FINITE_CHECKED supplemental evidence, not independent_final_verification.
