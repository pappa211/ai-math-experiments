> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual tree-edge repetitions in anchored residual implication paths

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. This is an obstruction lemma, not an anchored-cover theorem. It was developed by the challenger from the joint residual parity/exchange mechanism, 2026-11-16 UTC.

## Setup and exact representation

Let C be a forest triangle-edge cover of H. Choose a maximum triangle packing P minimizing the number p2 of its members with two C-edges. Let P1 be its p1 members with one C-edge, put S=C intersect E(P), and let R=H-S. Fix a bipartition of each component of C; if C is disconnected, extend it arbitrarily to all vertices. For the statements using parity below, assume C is a spanning tree on V(H), or more generally that every edge of H has its endpoints in the same C-component. The anchored internal application has a spanning tree and meets this hypothesis.

Each triangle has one or two C-edges. A one-C triangle has a C-base joining opposite tree parts, one non-C edge with endpoints in the same part (its even edge), and one non-C edge with endpoints in opposite parts (its odd edge). A two-C triangle has just one non-C edge, and that edge is even. For i in P1 write its two non-C edges as e_i (even) and o_i (odd). All these literal graph edges are distinct, since P is a packing.

The established residual exposure lemma says every R-triangle contains at least one of these 2p1 literal edges. A triangle cannot contain three literal edges, because every triangle meets C. It cannot contain both e_i and o_i: their closing edge is the packed C-base of i, which belongs to S and has been deleted. If it contains two literals, they are necessarily e_i and o_j for distinct i,j; its third edge is a C-edge outside S. Call this a binary triangle. If it contains exactly one literal, call it a unit triangle. An odd-unit triangle contains o_i and is necessarily one-C; its remaining non-C edge is even. An even-unit triangle contains e_j and may be one-C or two-C. In the one-C case its remaining non-C edge is odd.

Thus a proposed residual cover choosing exactly one literal from every pair corresponds to a Boolean choice: flip i means choose o_i, and leave i unflipped means choose e_i. A binary triangle e_i,o_j gives the implication flip i implies flip j. An odd unit forces its index flipped, and an even unit forces its index unflipped. This representation describes precisely the one-literal-per-pair restriction; arbitrary actual residual covers may also use unused C-edges or other edges.

## Repeated-tree-edge lemma

Suppose distinct indices i_0,...,i_k form a directed simple implication path. Choose an actual odd-unit triangle U_0 at o_(i_0), an actual binary triangle U_(r+1) on e_(i_r),o_(i_(r+1)) for each r=0,...,k-1, and an actual even-unit triangle U_(k+1) at e_(i_k). Then two of these k+2 actual residual triangles share an edge of C outside S.

In particular, every contradiction to the restricted one-literal-per-pair choice contains a simple contradictory path whose actual triangles reuse an unused tree edge. This does not say that selecting those repeated edges globally stays within the p1 cover budget.

### Proof

Assume instead that the C-edges used by U_0,...,U_(k+1) are pairwise distinct. Their literal non-C edges are all distinct: along the path they use each o_(i_r) and e_(i_r) exactly once. The only possible nonliteral non-C edges occur at the two unit ends. Neither belongs to the literal set, by the definition of a unit. The first is even, whereas the last, if it exists, is odd. They are therefore distinct. Consequently the selected U triangles are an actual edge-disjoint packing Q of size k+2.

The only P1 members met by Q are the k+1 indexed path members. The binary triangles have no other non-C edges. The even-unit end cannot meet a two-C P member: if it is one-C, its nonliteral edge is odd; if it is two-C, it has no nonliteral non-C edge. The odd-unit end can meet at most one two-C P member, on its one additional even edge; a graph edge occurs in at most one member of the packing P. No Q member can meet P on a C-edge because it lies in R.

If that extra two-C P member does not exist, replace the k+1 path members by Q. This increases the packing size, contradicting maximal cardinality.

If the extra member exists and the even-unit end is one-C, replace the k+1 path members and this extra two-C member by Q. The size is unchanged, and every Q member is one-C. Hence p2 decreases, contradicting the secondary extremality of P.

Finally suppose the extra two-C P member exists and the even-unit end is two-C. The actual P-versus-Q conflict component is then a path with both endpoints two-C, all internal vertices one-C, and every non-C edge of every triangle on the path used in a conflict. Taking the symmetric difference of their triangle edge sets cancels every non-C edge. Their C-edges are all distinct: within P this is packing disjointness, within Q it is our assumption, and between P and Q the sets lie in S and outside S. The result is a nonempty even-degree subgraph of the forest C, impossible. This is the exact parity argument of challenger_tree_anchor_residual_packing_v2.md, reproduced here at the required scope. All three cases contradict the assumption. QED.

## Token-graph interpretation

There is a precise useful auxiliary representation, without any new minmax assertion. Represent an actual non-C graph edge uv by the unordered pair {u,v}. A one-C triangle on uv,uw,vw with C-base vw joins the auxiliary vertices {u,v} and {u,w}; this moves one endpoint along the tree edge vw and labels the auxiliary edge by vw. Thus the graph of one-C triangles on non-C-edge vertices is a subgraph of the two-token graph of C. It is bipartite by even versus odd endpoint parity. A two-C triangle is a single even auxiliary vertex equipped with its unique length-two C path.

The actual triangle packing constraints retain BOTH auxiliary matching disjointness and disjoint C-edge labels. An ordinary auxiliary matching may reuse a C-label and need not be an actual triangle packing. Likewise an actual edge cover may choose either auxiliary vertices (non-C edges) or tree-edge labels. Omitting these label costs would change the problem.

K4 with a selected spanning path is the smallest repair control: a failed pair of literal unit choices can share the unused opposite C-edge, and that edge covers both. The lemma identifies why such a physical tree edge must occur on every forced implication contradiction. It does not yet prove compatible repairs for multiple paths, tau(R)<=p1, or the weighted TREE target.

## Inputs and verification scope

Inputs are ordinary graph definitions, the residual exposure argument in challenger_tree_anchored_cover_target_v1.md, and the maximum-packing/minimum-p2 hypotheses. The needed even-degree forest contradiction is proved above. No computation, external theorem, or minimum-cover assumption on C is used. No statement of universal residual perfection or ordinary packing-cover equality is inferred.
