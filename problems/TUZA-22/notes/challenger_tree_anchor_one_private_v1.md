> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Anchored cover when an extremal packing has at most one one-C triangle

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh reconstruction. TUZA-22 coordinator/challenger simultaneous endpoint reconstruction, 2026-11-16 UTC. This is a scoped case of the open anchored TREE target; no general bound on the number of one-C packing members is asserted.

## Theorem

Let H be a finite simple graph whose triangles are covered by a spanning tree C. Choose a maximum triangle packing P minimizing the number p2 of its members containing two C-edges, and let p1 be the number containing one C-edge. Put S=C intersect E(P).

If p1<=1, then

    tau(H-S)<=p1.

Consequently H has an internal triangle cover D containing S with |D|<=2|P|. The same proof works for a forest C, allowing different components and isolated selected vertices; the spanning-tree formulation is sufficient for the current weighted-component application.

## 1. Residual triangles meet the one-C members

Every actual triangle has one or two C-edges. Two different two-C triangles cannot share their non-C chord: they would supply two distinct length-two paths in the forest between its endpoints.

A one-C triangle has one non-C edge joining vertices on the same side of the forest bipartition (an even chord) and one joining opposite sides (an odd edge). Only its even chord can be the non-C edge of a two-C triangle, and uniqueness of a forest path permits at most one such completion.

Let R=H-S. A triangle of R cannot meet P in a C-edge. If it has two C-edges, it cannot meet a two-C P-member in a chord either, by uniqueness; since P is maximum, it must meet a one-C P-member. If it has one C-edge and misses every one-C P-member, it meets at most one two-C P-member. With no such intersection it augments P; with one it replaces that two-C member by a one-C triangle, preserving packing size and decreasing p2. Both are impossible.

Therefore every R-triangle meets a non-C edge of a one-C P-member. In particular, when p1=0, R is triangle-free and the theorem is immediate.

## 2. The unique one-C triangle and two hypothetical residual pages

Assume p1=1. Write the unique one-C packed triangle as abc, with ab in C. Orient the forest bipartition so a,c are on the same side. Thus ac is its even non-C chord and bc its odd non-C edge. Section1 gives the residual triangle cover {ac,bc}.

Suppose tau(R)>1. Then R has two edge-disjoint triangles. To justify this implication without a packing-cover conjecture, a pairwise edge-intersecting actual triangle family is a book or has literal K4 support: writing two faces abc,abd, a face avoiding their common edge must be acd or bcd, and literal closure gives K4. A book has cover number1, whereas two adjacent edges cannot cover all four faces of K4. Since {ac,bc} covers R and these edges are adjacent, the pairwise-intersecting case is impossible.

The two edge-disjoint residual triangles must therefore have the form

    A=acd, B=bce.

A uses ac but not bc; B uses bc but not ac. Their extra vertices are distinct, because d=e would give a common edge cd. Neither residual triangle contains a C-edge of P.

Triangle A is disjoint from every two-C member of P. Its even edge ac is already an edge of the one-C packed triangle, and therefore cannot also be a packed two-C chord. If A has one C-edge, its other non-C edge is odd and cannot be a two-C chord. If A has two C-edges, ac is its only non-C edge. In either case A has no intersection with the two-C packed family.

Triangle B has exactly one C-edge, since its non-C edge bc is odd and cannot be the unique non-C chord of a two-C triangle. It can meet at most one two-C P-member U, through B's even non-C chord.

If B meets no such U, replace abc by A,B. They are compatible with all remaining P-members and increase packing size, contradiction.

If B meets U and A has one C-edge, replace abc,U by A,B. Packing size is unchanged but two one-C triangles replace a one-C and a two-C triangle. This decreases p2, contradiction.

## 3. The remaining two-C case creates a forest cycle

It remains that A has two C-edges ad,dc and B meets a two-C packed member U. There are two possible C-bases of B.

- If be belongs to C, B's even chord is ce. Write the two-C triangle U as cfe, so cf,fe belong to C. Then

      a-b-e-f-c-d-a

  is a closed trail of C-edges.

- If ce belongs to C, B's even chord is be. Write U=bfe, so bf,fe belong to C. Then

      a-b-f-e-c-d-a

  is a closed trail of C-edges.

In each case the six traversed edges are distinct. The three edges from A and B are distinct because these residual triangles are edge-disjoint and lie outside S. The other three are the selected edge ab of the one-C packed triangle and the two selected edges of U; they lie in S and are distinct because P is edge-disjoint. Thus the two groups are disjoint as well. Possible repeated vertices do not matter: a forest has no nonempty closed trail with distinct edges.

This contradiction eliminates the remaining case. Hence tau(R)<=1 as claimed.

## 4. Anchored cover and exact role

Choose a cover D_R of R of size at most p1 and set D=S union D_R. Any H-triangle either meets S or survives in R, so D covers H and contains every C-edge used by P. Since |S|=2p2+p1,

    |D|<=2p2+2p1=2|P|.

Together with the exact outside-page minmax, this proves the weighted TREE conclusion whenever the internal graph has a maximum packing minimizing p2 with p1<=1. It gives no availability theorem for that condition. The open general case has multiple one-C packing members, whose residual page families can interact through distinct even and odd spokes.

No finite computation or external matching theorem is a premise. The proof uses actual triangle-family closure, extremal packing exchange, and the impossibility of a closed distinct-edge trail in a forest.
