> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Active triangle-restoration kernel and peeling of tight components

TUZA-22 restoration role, 2026-11-15 UTC. Frozen ORDINARY_PROOF_CANDIDATE for fresh review. This is a symbolic all-size mechanism, not a classification of arbitrary defect-one components.

## General interface

Let H be a finite simple graph and let a,b,c be independent in H. Restore T=abc to form G. Select any collection of actual triangle components of H whose literal supports are K4 or K5; call their union B_0, and put m=nu(B_0), so tau(B_0)=2m. Let J be the union of the edge supports of all other old triangle components, which can have arbitrary structure or be empty. Let N be the entire new triangle family in G.

Define A to be the literal support subgraph with edge set

    E(A)=E(J) union (union over Q in N of E(Q)).

Background edges not appearing in N can be omitted. No triangle is omitted from the accounting: every G triangle is either an old selected-block triangle, an old J triangle, or a new N triangle.

Then:

1. Every selected old block meets E(A) in a star of at most two edges.
2. The actual triangle family of A is exactly the old J triangles together with N.
3. nu(G)=m+nu(A).
4. tau(G)<=2m+tau(A).
5. If A satisfies CS, then G satisfies CS. Equality requires A to be B and to have edge support disjoint from every selected old block; in this case B(G).

Thus the selected tight components can be removed from the main induction problem, with their full effect accounted for. The claim permits arbitrarily many selected blocks, outside vertices, pages, and background edges.

## 1. Entire new-family footprint in one old block

Fix a selected old block K. It contains at most one terminal from {a,b,c}, since the three terminal pairs are nonedges of H.

For any one new base uv in {ab,ac,bc}, all ordinary pages uvx together contribute at most one old spoke to K. Indeed, K cannot contain both u,v. If two different spokes ux,uy were in K, then xy is an old clique edge and vxy is an actual old H triangle sharing xy with K. It therefore lies in the same actual triangle component as K, which would force v into the literal clique and force uv present, contradiction. The symmetric case with two v-spokes is identical. This argument needs only that K itself is a literal old component; it does **not** assume every component of H is B.

If K contains no terminal, it has no new-page footprint. If it contains one terminal, say a, only bases ab and ac can contribute, at most one edge each. The central new triangle T contributes no old edge. Therefore the ENTIRE new-family footprint in K is a star centered at a, of size at most two. Old J support is edge-disjoint from K by the actual-component definition. This proves (1).

## 2. Exact triangle and packing accounting

Every edge of A is an actual G edge, so every actual A triangle is an actual G triangle. Every old J triangle and every N triangle is present by construction. A cannot contain an old selected-block triangle, since it contains at most two edges of that block. These cases exhaust all G triangles, proving (2).

Choose a maximum packing in each selected K4/K5 block avoiding its **entire** A footprint. K4 star avoidance and K5 two-edge avoidance permit this simultaneously, independently in every block. Their union has m triangles and is edge-disjoint from all of A. It therefore appends to an arbitrary maximum A-packing, giving nu(G)>=m+nu(A).

Conversely partition any G-packing into triangles of selected old blocks and triangles of A, using (2) and the exact old/new partition. The first group has at most m triangles, and the second at most nu(A). Therefore nu(G)<=m+nu(A), proving (3).

The union of minimum covers of A and the selected old blocks covers every G triangle, yielding (4). Overlap of cover edges can only lower the union's size.

## 3. Transfer of CS through the kernel

Assume A satisfies CS. Then

    tau(G)<=2m+tau(A)<=2m+2nu(A)=2nu(G),

so G satisfies Tuza.

If equality holds for G, equality holds in the chain, and A is tight. Thus CS for A gives B(A). Suppose A and one selected old block share an edge e. This edge is supported in A: every A edge was included as part of an old J triangle or a new N triangle. In B(A), a minimum cover can be chosen to contain e. The selected old clique block also has a minimum cover containing e. Choose these covers, and arbitrary minimum covers for all other selected blocks. Their union has size at most

    tau(A)+2m-1=2nu(G)-1,

contradicting equality. Therefore there is no such shared edge.

With no shared support edge, the full G triangle family is an edge-disjoint union of the literal K4/K5 components of A and the selected old K4/K5 blocks. Every G triangle was already counted in these families. Hence B(G). The reverse B=>equality is universal. This proves (5).

## 4. Consequence: every triangle residual of a minimum CS failure is indecomposable

Let G be a minimum-edge failure of universal CS, with k=nu(G). Reviewed M0 gives tau(G)=2k and proper-subgraph CS. Reviewed R1 gives, for every actual triangle T,

    nu(H)=k-1, tau(H)=2k-3,

where H=G-E(T). Thus H has defect1. Proper-subgraph CS and component additivity imply that exactly one of its actual triangle components has positive defect, exactly1; call it J. Every other triangle component is tight, hence B by proper-subgraph CS, and therefore a literal K4 or K5. Background edges are irrelevant to this decomposition.

Suppose any such tight component exists. Apply the general interface, selecting **all** these tight components. The active graph A is a proper edge-subgraph of G: each selected old K4/K5 block has at least six edges, but A retains at most two of them. Consequently A satisfies CS by minimum-edge induction. Part(5) then supplies CS for G, contradiction.

Therefore there are no tight components. For every actual triangle T of a minimum CS failure, G-E(T) has **one nonempty actual triangle component**, which has defect1; any remaining edges are triangle-free background. The remaining packing number is k-1. This is connectedness of triangle support through shared edges, not ordinary graph block connectivity.

This removes all disjoint or vertex-sharing tight attachments from the defect-one residual problem. It does not classify the sole active component J, produce a two-edge blocker, or prove that a minimum CS failure cannot exist.

## Dependencies and checks

The general interface uses only exact actual-component accounting, the one-base whole-page footprint argument, elementary clique avoidance, and minimum clique covers containing a prescribed edge. Its CS transfer is conditional only on CS for the proper active graph A.

The minimum-obstruction corollary additionally uses reviewed M0 and R1, plus proper-subgraph induction. No sparsity, bounded graph order, fixed number of pages, finite core census, ordinary-block decomposition, or global equality classification is silently assumed.
