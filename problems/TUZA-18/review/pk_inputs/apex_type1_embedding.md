# Arbitrary residual cores inside all-type1 maximum packings

Status: ordinary proof candidate with a literal K6 implementation check. This refutes automatic residual two-colorability and canonical multicover splitting, NOT the pure-type1 residual-cover bound, PK, or Tuza. Historical originality is unestablished; the Ramsey obstruction itself is standard.

## Exact construction and maximum-packing proof

Let J be ANY finite simple graph with ordered vertex set{1,…,r}, and put m=|E(J)|. For each edge e=ij with i<j introduce a distinct fresh vertex x_e. For each j with an incoming edge introduce a distinct fresh vertex z_j. All x and z vertices are outside V(J) and mutually distinct.

Retain all J edges. Add ix_e and jx_e for every e=ij. Add jz_j and z_jx_e for every e=ij headed at j. Add no other edges. Let

    T_e=ijx_e, P={T_e:e∈E(J)}, R={jx_e:e=ij,i<j}.

The edge sets of the m packed pages T_e are disjoint. Every actual graph triangle is exactly one of:

1. a core triangle of J;
2. a packed page T_e=ijx_e;
3. a private page Q_e=jz_jx_e.

Indeed there are no edges between tips or between apices. Each z_j has only the one core neighbor j. A tip x_e has exactly the three neighbors i,j,z_j; among those, only ij and jz_j are edges. This accounts for every triangle containing a fresh vertex; all remaining triangles are core triangles.

P is a MAXIMUM packing of size m. For an arbitrary packing, let q be its number of core triangles and let S be their3q distinct core edges. For each e outside S, at most one of T_e,Q_e can be used, because they share jx_e; these edges account for at most m−3q pages. For e∈S, T_e is unavailable. The selected Q_e among S have distinct heads j, since two pages with the same head share jz_j. Each ordered core triangle has only two possible heads among its three edges, so S has at most2q distinct heads. Hence the packing size is at most

    q+(m−3q)+2q=m.

The displayed P attains the bound.

## Every packed member is genuinely type1

With B=E(P), Q_e meets B only in its designated base jx_e. All core triangles meet B in three distinct core edges; no other actual triangles exist. Consequently Q_e is the unique private page of T_e, and every packed member is type1. There are no private K4 completions, so A(P)=B.

Any B-contained cover must contain ALL of R because Q_e has no other B edge. After deleting R, the only remaining triangles are the triangles of J: the other nonbase B edges ix_e are pendant edges. Therefore the EXACT constrained optimum is

    min{|C|:C⊆B and C covers G}=m+τ(J).

Since τ(J)≤m trivially, this packing satisfies PK. The construction embeds arbitrary residual triangle geometry while retaining enough budget to cover every core edge. It does not reduce unrestricted Tuza to an unproved assertion about J; m is the number of J edges, not its packing number. Thus one cannot infer a general hardness equivalence from this embedding.

## K6 obstructs canonical splitting even in the all-type1 class

Take J=K6. Then m=15, G has26 vertices,65 edges and50 actual triangles, and ν(G)=15. Give multiplicity2 to each of the15 private bases R and multiplicity1 to each of the30 other packed edges U=B\R; all remaining edges have multiplicity0. Every triangle has load at least2, and the total multiplicity is60=4ν(G).

If this canonical multicover split into two triangle covers, the single copies of the15 core K6 edges would receive two colors so that no core triangle were monochromatic. This is impossible: at any K6 vertex, at least three incident edges have one color; either an edge among their other endpoints has that color, yielding a monochromatic triangle through the vertex, or all three connecting edges have the other color and form a monochromatic triangle. Thus universal splitting is false even when EVERY packed member is type1.

The cheap-cover claim survives. A six-edge core cover is given by the edges inside two disjoint three-vertex parts. It is optimal because nine cross edges remain triangle-free and a triangle-free graph on six vertices has at most nine edges (an elementary exhaustive check is also supplied in the literal certifier). Thus the constrained optimum is15+6=21≤30=2ν(G). Failure of splitting does not imply failure of a one-cover budget. No exact value of unrestricted τ(G) is asserted.

## Evidence and source relation

`checks/apex_type1_embedding_verify.py` reconstructs all26 vertices and65 graph edges, enumerates every three-vertex set, verifies the exact50-triangle list, all15 private-page types, the explicit15-packing and21-edge B-contained cover, and the elementary core cover optimum. The packing upper bound is the ordinary head-count argument above, not a large exact-packing solver. Evidence is `evidence/apex_type1_embedding_verified.json`, with a full literal graph in `evidence/apex_type1_embedding_graph.json`.

The multiplicity assignment is the standard initial type1 charging pattern in the CKSU primary source already recorded in `apex_private_k4_gate.md`. This note gives its explicit all-type1 nonsplitting realization without importing an integral rounding conclusion. The old frozen TUZA09 K5/K6 nonsplitting results remain distinct controls, and no historical novelty claim is made here.
