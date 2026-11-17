> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A pure-external cycle cover component packs all its bases in the strict H-D branch

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Source_audit, 2026-11-16 UTC. This is a packing conclusion using the original cover-deletion quantifier and the absence of a two-edge packing blocker. It is not an unrestricted H-D proof and does not automatically combine the resulting local packings.

## Exact hypotheses

Assume original H-D with nu(G)=k: every actual triangle T satisfies nu(G-E(T))=k-1 and tau(G-E(T))=2k-2. Work in the strict branch tau(G)=2k-1, and suppose G has no packing blocker consisting of at most two actual graph edges.

Fix any minimum cover C. Every actual triangle has exactly one C-edge by the previously proved cover-intersection identity. Let one connected component C_i of the selected-edge graph be a cycle Z of length m. Let A=V(Z). Assume that every actual triangle whose selected base lies in C_i has its third vertex OUTSIDE A. Thus this assigned family consists entirely of external pages; no internal triangle is discarded. Since C itself cannot contain a triangle, m>=4.

Then the ENTIRE assigned family has an edge-disjoint packing of m triangles, one on each selected cycle base.

## 1. Local cover-deletion equality is inherited

Write F_i for the actual assigned triangle family. Its cover number is m: its bases cover it, and a smaller cover combined with C minus C_i would improve the global minimum cover.

For every T in F_i, let c be its unique selected base. The cover C_i minus {c} covers F_i after deletion of all three actual edges of T, so the residual family cover number is at most m-1. If it were smaller, combine that smaller cover with C minus C_i. Those outside selected edges survive deletion of T, because T has exactly one selected edge. This would cover G-E(T) with fewer than (2k-1)-1=2k-2 edges. Hence

    tau(F_i after deleting E(T)) = m-1                    (1)

for every T in F_i. This is a statement about complete actual families; no induced-graph or cover-additivity assumption is needed.

Every actual triangle edge of G has codegree at least two. Otherwise, for an edge f occurring only in T, deleting the other two edges of T would destroy the same triangle family as deleting all of T, giving the forbidden two-edge packing blocker. In particular each cycle base has at least two distinct page apices.

## 2. Exact list-coloring model

For each cycle edge e let L_e be its set of external page apices. A choice of one page on every base is an edge-disjoint packing precisely when it is a proper list edge-coloring of Z with apex names as colors. Different bases and different apices give disjoint triangle edges. Pages with the same apex intersect exactly when their cycle bases are incident. The external-apex hypothesis is essential to these statements.

Every list has size at least two. The elementary cycle-list lemma says that such a coloring exists unless the cycle is odd and every list is the same two-element set. To verify it, if adjacent lists differ, orient their boundary so that the first list has a color absent from the last. Choose that color first and greedily color along the path: the final list cannot use the initial color, so closure is automatic. If all lists coincide, two colors suffice for an even cycle and any three colors suffice for an odd one. Only a common two-color odd cycle remains.

## 3. The sole obstruction violates the actual deletion equality

Suppose the exception occurs: m=2r+1 and every base has exactly the same two apices a,b. These are outside A. Number the cycle vertices 0,1,...,m-1 and delete the actual triangle T=a01.

Among this assigned family, all surviving a-pages have bases in Z-{0,1}, a path on m-2=2r-1 vertices. They are covered by r-1 a-spokes at an ordinary alternating vertex cover of that path. All surviving b-pages have bases in Z-01, a path on m=2r+1 vertices. They are covered by r b-spokes. There are no other assigned triangles, because the lists are exactly {a,b}.

These actual graph edges cover the residual family with

    (r-1)+r=m-2

edges, contradicting (1). The obstruction is impossible, and the desired m-page packing exists.

## Scope and next gap

This eliminates the complete external-page list-coloring obstruction on a selected cycle in a surviving strict-H-D candidate. It also explains why the C6 induced-list counterexample and the two-apex odd-cycle example do not transfer: the former has a singleton base list, while the latter loses at least two cover edges after the displayed triangle deletion.

The statement has not been extended here to unicyclic selected components with attached trees or to internal one-base triangles among their core vertices. Nor is simultaneous compatibility of full local page packings across different cover components asserted. The minimum-C quantifier, original H-D cover equality, no-two-edge-blocker premise, and complete-family external condition remain explicit. No finite search, abstract matroid union, fractional integrality, or external theorem is used.
