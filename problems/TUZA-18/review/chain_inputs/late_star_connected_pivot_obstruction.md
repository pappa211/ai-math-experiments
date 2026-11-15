# Connected role-collision chains refute bounded Hall-deficiency descent

Status: ordinary proof with an independent literal N=3 certificate. For every fixed radius r, this construction refutes the assertion that a minimum support-contained cover with positive Hall deficiency has a strictly improving equal-cost change replacing at most r selected support edges. The graph has ONE actual shared-edge triangle component, and the specified packing is genuinely maximum and all-type1. Existential star gluing, PK and Tuza remain intact.

## Fixed block and literal local states

Use G0, P0, B0, R and C0 from late_star_gluing_obstruction.md:

  G0=K_{0,1,2,3,4,5,7} minus {05,57,13,24},
  P0=(T1,T2,T3,T4)=(237,012,147,345),
  R={37,12,47,34},
  C0=R union {01,02,14,23}.

The full block has17 edges,16 triangles and nu=4. Every packed member is type1; B0-contained covers have minimum8, with exactly nine minimum states. The local selected counts of C0 are(2,3,2,1). Thus the only heavy member is H=T2=012 and the only light member is L=T4=345; they are disjoint.

The edges07 and15 both lie OUTSIDE B0 and are vertex-disjoint. Vertex0 belongs only to T2 among the packed members; vertex7 belongs to T1,T3; vertex1 belongs to T2,T3; vertex5 belongs only to T4. The block's actual triangles form one shared-edge component.

## The edge-glued chain and all actual triangles

For N>=2 take copies G_i of G0. For every i<N identify edge07 of copy i with edge51 of copy i+1, meaning

  0_i=5_(i+1),   7_i=1_(i+1).

There are no other identifications or new edges. In an interior block its incoming edge15 and outgoing edge07 are vertex-disjoint, so nonadjacent blocks have disjoint vertex sets. Adjacent blocks intersect exactly in the displayed edge, which is outside both packed supports.

Every actual triangle lies in exactly one block. A triangle using vertices from both sides of a two-vertex clique sum would need a nonexistent edge between the two exclusive sides. No triangle lies wholly in the two-vertex intersection. Applying this along the chain gives exactly16N actual triangles. There are5N+2 vertices and16N+1 graph edges.

Every shared edge07_i=51_(i+1) lies in actual triangles on both sides. Since each block's triangle family is shared-edge connected, the full actual triangle family has ONE shared-edge component.

The union P of all P_i is a packing of4N triangles. Any packing has at most4 triangles assigned to each block, by the literal block's parity upper bound; hence nu(G)=4N. Every original private page remains private relative to the global B: there is no cross-block triangle and the shared edges are outside B. Thus every member remains type1, there are no private K4 completions, and A(P)=B. The B_i edge sets are disjoint.

A B-contained cover must restrict to a B_i-contained cover in each block, because no B edge from another block belongs to a local triangle. Therefore the exact B-constrained minimum is8N, and every minimum is a product of the nine local minimum states. This conclusion does not assert additivity of unrestricted tau across the shared outside-B edge.

## Initial deficiency is exactly one

Let C be the union of C0 in all N blocks. It is a minimum B-contained cover of size8N. Its heavy members are H_i=012_i and its light members are L_i=345_i.

The heavy/light intersection graph has exactly the N-1 edges

  H_i -- L_(i+1), i=1,...,N-1.

The first identified endpoint0_i=5_(i+1) gives this edge. The second endpoint7_i=1_(i+1) belongs only to balanced packed members on its left side, so supplies no further heavy/light edge. There are no other shared vertices. These N-1 edges form a matching, so delta(C)=N-(N-1)=1.

## A compatible minimum cover must change at least ceil(N/2) blocks

Let C' be any minimum B-contained cover with delta(C')=0. Each block has four packed members and exactly eight selected support edges. Since each packed member uses one, two or three selected edges, each block separately has equal numbers of heavy and light members.

A matching saturating all heavy members therefore also saturates all light members. Across any prefix/suffix cut of the block chain, the numbers of matched edges crossing in the two directions (heavy-prefix to light-suffix and heavy-suffix to light-prefix) must be equal, because the prefix has equal heavy and light counts.

Suppose two adjacent blocks i,i+1 both retain C0. Across that cut there is exactly the single heavy/light edge H_i--L_(i+1), as in the initial state. Equal crossing counts force that edge not to be used. But L_(i+1) has no other heavy neighbor: it is disjoint from its own H_(i+1), its only intersection with the preceding block is at5_(i+1)=0_i, and it avoids the outgoing vertices0_(i+1),7_(i+1), so it meets no packed member in the following block. Nonadjacent blocks are disjoint. This is impossible in a perfect heavy/light matching. Therefore no adjacent pair of blocks may both remain unchanged.

Block1 also cannot remain unchanged: its L1 has no preceding block, is disjoint from H1 and avoids the outgoing edge07, so it would be isolated regardless of all other states.

Consequently the set of changed blocks contains1 and meets every edge of the path on N block indices. Such a set has size at least ceil(N/2): besides1, it must meet the disjoint pairs(2,3),(4,5),... . Every changed block replaces at least one selected edge, because its minimum size remains8. Thus

  |C symmetric_difference C'| >= 2 ceil(N/2).

Since delta(C)=1, any strict decrease must reach0. For any prescribed radius r, take N=2r+1. Then no equal-cost support-cover change replacing at most r selected edges strictly lowers delta. The case N=3 already refutes PIV1 within one shared-edge triangle component.

## Exact repair attaining the bound

In every ODD block perform the local one-edge pivot

  remove23, add35.

Its selected counts become(1,3,2,2): its heavy member is still T2=012, and its light member is now T1=237. Leave every even block at C0.

For each odd/even pair i,i+1, match the odd heavy T2_i to the even light T4_(i+1) at0_i=5_(i+1), and match the even heavy T2_(i+1) to the odd light T1_i at1_(i+1)=7_i. If N is odd, match the final block's T2_N to T1_N at its internal vertex2_N. These pairs saturate every heavy and light member. Hence the repaired cover has deficiency0 and differs from C in exactly2ceil(N/2) edges.

This is an explicit nonlocal compatible selection. The construction refutes bounded strict descent of the chosen potential, not the existence of compatible covers.

## Scope and relation to earlier gates

The first vertex-sum chain in late_star_pivot_obstruction.md had separate shared-edge triangle components, so summing deficiencies over those components repaired its potential failure. The present edge-sum chain has one such component, so that particular repair is insufficient.

The graph still has two-vertex separators at its gluing edges. A strategy using those actual clique separators and a richer boundary state may handle the chain; no theorem excluding such a strategy is claimed. Nor does this construct an actual minimal Tuza violation, which would require much stronger criticality properties. The explicit minimum B-cover has size2nu, and unrestricted Tuza is already certified by that cover.

The50 two-block outside-B edge identifications were checked before this chain was derived: every one admitted a one-pivot decrease when required. The connected N=3 construction explains why that finite survival was insufficient. The exact unbounded lower bound above, rather than a higher parameter census, is the result.

Evidence: checks/late_star_connected_chain_verify.py and evidence/late_star_connected_chain_verified.json independently reconstruct the17-vertex N=3 instance, all48 actual triangles, the original12-packing, all729 minimum support-cover products, all one-edge pivots from C, and the exact distance4 to a compatible minimum cover. The ordinary proof handles every N without a solver theorem.
