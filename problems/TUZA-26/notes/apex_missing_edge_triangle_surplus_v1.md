> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Where a full-triangle cover loses one unit after deleting the marked edge

Frozen supporting discriminator, TUZA-26. This is an exact arbitrary-codegree comparison and a literal cover-saving criterion. The criterion's global availability is OPEN; this note does not promote another defect-two profile into a reduction.

## Full-profile interface

Work in the accepted conditional minimum Q. Write nu(Q)=k, tau(Q)=2k-1. Fix ANY actual edge e=uv and put K=Q-e. The proved core profile gives nu(K)=k, tau(K)=2k-2 and resilience of K. Every Q triangle T has

    nu(Q-E(T))=k-1, tau(Q-E(T))=2k-4.

Take an actual triangle T whose vertices avoid u,v. No assumption on the number of common neighbors of u,v is made. Every uv-page survives deleting E(T), because all its other edges are incident with u or v. Put

    H=Q-E(T), R=Q-E(T)-e=K-E(T).

The triangle T is wholly contained in a minimum K cover exactly when

    tau(R)=tau(K)-3=2k-5.

This follows from the exact constrained-cover identity: the smallest K cover containing E(T) has size 3+tau(K-E(T)). Since a minimum Q cover contains T, the same identity for Q gives tau(H)=2k-4.

## Exact three-way discriminator

Single-edge deletion from H gives

    nu(R) in {k-2,k-1}, tau(R) in {2k-5,2k-4}.

The combination (nu(R),tau(R))=(k-2,2k-4) would make R a B graph by proper CS. Then Q=R+E(T)+e has packing gain two and cover gain three over B, while e is triangle-bearing in R+e (all its original pages survived). This is precisely the independently accepted minimum-Q triangle-plus-critical-edge B exclusion. It is therefore impossible.

Only these three alternatives remain:

| R packing and cover | Defect of R | Full T cover in minimum K? | Response when e is restored to R |
|---|---:|---|---|
| k-1, 2k-4 | 2 | No | packing and cover both unchanged |
| k-1, 2k-5 | 3 | Yes | packing unchanged, cover increases one |
| k-2, 2k-5 | 1 | Yes | packing and cover both increase one |

In particular the one-unit obstruction from matching26_one_unit_cover_exchange_v1.md is EXACTLY the first row. It is not automatically a critical edge: in that row e is packing-neutral AND cover-ineligible in H. Both H and R have defect two.

The two orders of restoration then have the exact responses

    R -> R+e=H:       (packing gain,cover gain)=(0,0),
    R -> R+E(T)=K:    (1,2),
    H -> Q:           (1,3),
    K -> Q:           (0,1).

This identifies a literal noncommuting cover increment. No smaller defect-two graph is named by minimum-Q reasoning.

## A physical cover-saving criterion, retaining all crossings

Assume the first row. Let F be any minimum H cover; it has size 2k-4. Since e is ineligible in H, F omits e. Thus F is also a minimum R cover and hits EVERY uv-page, including all additional pages at arbitrary codegree.

For an edge a of T, define its ordinary T-page family to be ALL actual K triangles using a and no other T edge. A triangle using two T edges is necessarily T itself, so there is no uncounted two-base crossing triangle outside T.

If F hits the whole ordinary family of even ONE edge a of T, then

    F union (E(T)-{a})

is an actual Q cover of size at most 2k-2. It covers R by F; every uv-page by F; ordinary T-pages on the other two bases by their bases; the a-pages by the supplied condition; and T itself by either retained T edge. This is a literal saving with the entire outside cover retained.

Therefore a surviving first-row obstruction forces the following precise statement: for EVERY minimum H cover F, each of the three T bases has an ordinary page whose two old spokes avoid F. These are actual uncovered pages relative to F, not B-bare pages and not necessarily appendable to any old packing. The distinction is essential: R has defect two, and its arbitrary triangles remain present.

## What the global constraints do and do not pay here

The accepted full-triangle cover profile and the paid B exclusion eliminate the apparent zero-defect/critical alternative. They do NOT prove that one of the three ordinary page families is wholly hit by a suitable F. The minimum-Q naming rule applies to smaller resilient defect-one supports; it does not apply to the first row's defect-two R. The known minimum degree five and absence of two-hub neighborhoods have not yet forced the displayed criterion, nor has the cover implication matching supplied an actual triangle packing.

The preserved double-cone C5 control illustrates the original lost unit but does not satisfy the hypotheses here: its Q has defect two, its marked predecessor has defect three and is fragile, and Q is not two-edge resilient. The star555 control likewise fails the universal triangle-residual profile. Neither control refutes this stronger arbitrary-codegree discriminator. Conversely, their failure is not a proof that the first row is impossible.

This focused attempt therefore ends at a precise open bridge: force, from the full Q profile, a minimum H cover that hits one entire ordinary T-base family, or exhibit an actual packing switch using the three necessarily missed families. The row classification alone is supporting information, not an enabled global reduction. No census, numerical computation, private-region inference, or codegree-two assumption was used.

Relied sources: the accepted all-triangle defect-two core theorem; notes/apex_triangle_edge_B_exclusion_v1.md and reviews/opening_triangle_edge_B_review.md; notes/matching26_one_unit_cover_exchange_v1.md; notes/matching26_outside_hub_repair_v1.md; notes/matching26_release_set_compression_v1.md. The latter two clarify why a cover matching or larger release set is not already a packing repair.
