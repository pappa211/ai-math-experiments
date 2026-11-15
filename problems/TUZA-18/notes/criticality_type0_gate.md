# Type0 packing gate: maximal cardinality is essential

Status: ordinary explicit counterexample to the strengthened claim that drops maximum-packing. The exact maximum-packing case remains unresolved. This is not a Tuza counterexample.

## Exact claims under investigation

For a triangle packing P, write B=E(P), N=E(G) minus B, and p=|P|. The type0 condition is that every nonpacked actual triangle meets B in at least two edges. Equivalently there are no private pages of any packed member (and no triangle disjoint from B).

The proposed type0 PK bridge retains the hypothesis that P is a **maximum** packing and asks for a triangle cover C contained in B with |C|<=2p. The stronger version removes that hypothesis. The stronger version is FALSE by the following literal graph, even though every actual triangle meets B in two or three edges.

## The graph and prescribed packing

Let F be the Clebsch graph on F_2^4={0,...,15}, with xy an edge exactly when x xor y belongs to {1,2,4,8,15}. It is triangle-free, has 40 edges, and has independence number five. These facts have the complete ordinary proof in frozen public commit d4029fbafc3dffc250b50ed237ad81c3206cd1a0, `problems/TUZA-11/arguments/CLEBSCH_PRIVATE_OBSTRUCTION.md`; the targeted 65536-subset independence check was also freshly rerun here.

Take three disjoint copies A,B,C of F. Add every edge between different copies. To avoid overloading the edge-support notation, call the set of all cross-copy edges B0 and the union of the three Clebsch edge sets N0. Thus

    |V(G)|=48, |B0|=3*16^2=768, |N0|=3*40=120.

For x,y in F_2^4, pack the triangle

    (A_x, B_y, C_(x xor y)).

These 256 triangles partition all B0 edges: every cross-copy pair occurs in a unique such triangle. Let P denote this packing, so its support B is exactly B0 and p=256.

An actual graph triangle is either a three-copy triangle (three B0 edges) or has two vertices in one copy and the third in another (two B0 edges and one N0 edge). There is no triangle within one copy. Therefore every actual triangle has at least two packed-support edges, precisely the strengthened type0 premise.

## Every B0-only cover is too expensive

Suppose D is a triangle cover contained in B0. Then J=G-D is triangle-free and contains all of N0. Every vertex neighborhood in J is independent in J, hence independent in its subgraph N0. Since N0 is a disjoint union of three copies of F, alpha(N0)=15. Consequently every degree of J is at most 15, and

    |E(J)|<=48*15/2=360.

The retained N0 already contributes 120 edges, so at most 240 B0 edges remain. Thus

    |D|>=768-240=528>512=2p.

This is an ordinary bound for **all** B0-contained covers, not the output of a restricted cover search.

## The prescribed packing is provably not maximum

The missing maximum-packing hypothesis is not left ambiguous. In each copy restrict to the four indices U={0,1,2,3}. The induced Clebsch graph on U is a C4, with missing pairs {0,3},{1,2}. Across the twelve selected vertices, G is K12 with a perfect matching of six edges removed. The prescribed XOR packing uses exactly sixteen triangles there, covering all cross-copy edges.

This twelve-vertex graph decomposes into twenty triangles. An explicit certificate comes from the 26 cyclic translates modulo 13 of the triples {0,1,4} and {0,2,7}. Their nonzero pair-differences, with signs, partition {1,...,12}; hence every edge of K13 lies in exactly one translated triple. Remove vertex 12 and the six triples containing it. The remaining twenty triples partition K12 minus the perfect matching formed by the six deleted opposite pairs. Relabel that matching to the six missing pairs of the selected twelve-vertex graph.

Replacing the sixteen old local packed triangles by these twenty gives a packing of size 260. All outside prescribed triangles remain edge-disjoint from the replacement because the original cross-edge partition assigned every internal twelve-vertex cross edge to those sixteen local triangles. The new within-copy C4 edges were previously unused. Therefore P is not maximum.

The exact relabeling, all twenty replacement triples, the 260-packing and all graph edges are in `evidence/criticality_type0_nonmaximum.json`, checked by `checks/criticality_type0_nonmaximum.py`.

## Ordinary Tuza status and remaining mechanism

All 120 N0 edges together with all 256 cross edges between copies B and C form a triangle cover of size 376. Every three-copy triangle uses a B-C edge, and every other actual triangle uses an N0 edge. Together with the displayed 260-packing this certifies

    tau(G)<=376<=2*260<=2nu(G).

The counterexample therefore isolates the global maximum-packing premise. The exact type0 PK claim for a maximum P is not refuted. The local facts that N is triangle-free and every N-neighborhood is independent in the full G hold here too; by themselves they cannot prove the desired support-cover bound.

For the genuine maximum-P route, a separate useful sufficient certificate is a choice of two distinct graph vertices from each packed triangle, all choices disjoint across P. The corresponding p omitted edges form an ordinary matching; no actual triangle contains two of them. Since every actual triangle meets B in at least two edges, B minus that matching is a 2p-cover. By Hall this certificate exists exactly when every subcollection Q of packed triangles has |V(Q)|>=2|Q|. Dense packed subcollections can fail this condition (for example a Steiner triple packing of K7), so it is not an unconditional proof. No additional graph-order search is used to conceal that missing step.
