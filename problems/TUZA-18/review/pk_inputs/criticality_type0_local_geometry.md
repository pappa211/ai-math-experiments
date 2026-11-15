# Type0 local geometry and the product-construction failure

Status: ordinary deductions and explicit local augmentation. They do not settle the maximum-packing type0 support-cover claim.

## Pair-constraint graph

Let P be a packing whose support B meets every actual triangle in at least two edges, and let N=E(G) minus B. Form D with vertex set B: two B edges are adjacent exactly when they occur together in an actual triangle whose third edge lies in N. Color that D edge by its N edge. Each color class is a matching, since the triangles on a fixed N edge uv have distinct third vertices w and use the disjoint B-edge pairs {uw,vw}.

D is triangle-free. Three pairwise incident graph edges either form a graph triangle or share a common graph vertex. In the former case, the closing edge of each pair lies in B, so they cannot form a D triangle. In the latter case, the three closing edges would form a triangle entirely in N, excluded by the premise.

The three edges of each packed member are pairwise nonadjacent in D and have no common D-neighbor in pairs. For example, a common neighbor of ab and ac must either be their third packed edge bc (which cannot be D-adjacent), or an edge ax. The latter would require bx,cx in N, making the actual triangle bcx have only the one B edge bc. This is forbidden.

These abstract properties are insufficient for an independent transversal. Take D to be three disjoint copies of the Clebsch graph and group the three copies of each corresponding vertex into a part of size three. The parts have no internal adjacency or common-neighbor pair, and D is triangle-free. An independent transversal would assign one of three colors to each Clebsch vertex, with every color class independent. Each such class has at most five vertices, so three classes cannot cover all sixteen vertices. In fact alpha(D)=15<16. This incidence object has not been realized as the relevant D of an actual maximum graph-triangle packing; it is only an obstruction to dropping global endpoint realizability and the additional colored-packing constraints.

A rainbow matching in D gives an actual edge-disjoint triangle packing: its B resources are disjoint and its N colors are distinct. In a maximum-P setting, q such triangles cannot use B edges from fewer than q packed members, since otherwise they would augment P. This is a genuine additional constraint and cannot be replaced by uncolored independence arithmetic.

## An actual product realization fails maximal cardinality locally

A tempting realization uses two anchor sets L,R and a private tip x_ab for every base edge ab of a complete bipartite base graph. Pack all triangles abx_ab. Add triangle-free N graphs within L and R, and connect tips in each row/column according to those N graphs. This is the Cartesian-product design that attempts to impose difficult constraints on all three packed-edge roles.

Whenever the left and right N graphs each contain an edge, select their endpoints a0,a1 and b0,b1. The four packed triangles are

    a0 b0 x00, a0 b1 x01, a1 b0 x10, a1 b1 x11.

The relevant N edges are a0a1, b0b1 and the four tip-square edges x00x01, x10x11, x00x10, x01x11. The following five actual triangles are pairwise edge-disjoint:

    a0 x00 x01,
    a1 x10 x11,
    b0 x00 x10,
    b1 x01 x11,
    a1 b0 b1.

The first four use each of the eight packed spokes exactly once and four distinct N tip edges. The last uses two still-free base edges and the N edge b0b1. They meet the prescribed packing only within the displayed four members, so replacing those members increases its size by one. This is a 5-for-4 augmentation at every order, not a finite nonfinding.

Consequently the product construction cannot furnish a counterexample to the exact type0 claim retaining maximum P. It illustrates why that hypothesis is a global packing condition with substantial force. The stronger claim without maximum P is already independently refuted by the literal 48-vertex construction in `criticality_type0_gate.md`.

## Remaining gap

The Hall certificate giving an ordinary matching of one omitted edge per packed triangle is sufficient. Its failure produces a dense packed subcollection, but neither the D facts above nor the N-neighborhood independence condition yields a cover-saving operation on that dense core. No such operation or availability theorem is claimed. This route was stopped at that exact missing theorem rather than extended by another graph-order census.
