# A wheel refutes universal integral-defect identification

Status: complete ordinary control, with a separate tiny literal certifier. This refutes the proposed identification availability premise, not Tuza.

## Exact candidate and operation

For a finite simple graph G, put d(G)=tau(G)-2nu(G). Identifying distinct vertices x,y means mapping both to one vertex, discarding loops, and simplifying parallel edges. Every actual quotient triangle, including a newly created one, counts toward both parameters.

The initial VI candidate in `coordinator_identification_gate.md` says that every G outside the class whose nonempty shared-edge triangle components have literal supports K3, K4, or K5 has a pair x,y with d(G/(x=y))>=d(G). The following six-vertex graph disproves that statement.

## Original graph

Let G be the cone over the five-cycle 0-1-2-3-4-0, with hub5. Its five actual triangles are exactly the hub with each rim edge. They form one shared-edge triangle component with the entire six-vertex wheel as support, so G is outside the stated terminal class.

Two disjoint rim edges give two packed triangles. Every packed triangle consumes two distinct hub spokes, and there are only five spokes, so nu(G)=2. Every graph edge belongs to at most two of the five triangles, so two edges cannot cover all five. The three spokes50,52,54 cover all triangles. Hence tau(G)=3 and d(G)=-1. This graph itself satisfies Tuza.

## Every quotient has defect minus two

There are exactly three symmetry types of identified pairs, each occurring five times.

1. **Adjacent rim vertices.** Identifying0 and1 gives the cone over a four-cycle. Its four actual triangles have a two-packing on opposite rim edges and a two-cover consisting of opposite spokes. Thus tau=nu=2.
2. **Nonadjacent rim vertices.** Identifying0 and2 gives a K4 on the hub, the merged vertex q, and rim vertices3,4, with the extra triangle hub-q-1 sharing the edge hub-q. These are all five actual triangles. The extra triangle and the old face q34 form a two-packing. The edges hub-q and34 form a two-cover. Thus tau=nu=2.
3. **Hub and rim vertex.** Identifying5 and0 gives the cone over the path1-2-3-4. Its three actual triangles have a two-packing using the two end edges of that path and a two-cover using the two middle-vertex spokes. Thus tau=nu=2.

The displayed packing and cover witnesses prove both equalities in every case, since any triangle packing has size at most any triangle cover. Consequently every one of the fifteen simple quotients has

    d(G/(x=y))=2-2*2=-2 < -1=d(G).

The quotient descriptions include all new actual triangles. In particular the nonadjacent-rim case creates the old face q34 and hence a literal K4; it is not legitimate to track only images of the original wheel triangles.

## One substantive repair and its remaining obligation

The new common-vertex maximum-packing theorem supplies a larger proven terminal class S: graphs having a maximum triangle packing all of whose members share a vertex. The wheel belongs to S, since every one of its triangles contains its hub. Therefore enlarging the terminal class from the old clique-block class to its union with S removes this exact obstruction for a mathematically justified reason.

For a finite graph with at least one vertex, membership in S is equivalently

    max_v matching_number(G[N(v)]) = nu(G).

The left side is exactly the largest packing constrained to have a common vertex: apex triangles at v correspond to matchings in its link. This is an exact characterization, not a proposed efficient algorithm for computing nu.

The repaired VI availability statement would require, for EVERY graph outside that union, a pair identification with nondecreasing integral defect. If true, induction on vertex count would again prove unrestricted Tuza, since both terminal classes now have proved covers. The present wheel control neither proves nor refutes that repaired statement. In particular the positive-defect-only availability variant remains an unproved global claim. The star theorem gives a justified terminal class, not a vertex-identification transfer theorem.

## Independent literal certificate

`checks/criticality_identification_wheel.py` uses only the Python standard library. It constructs this one literal wheel, independently reconstructs all actual triangles of all fifteen quotients, enumerates every triangle subset for the packing optimum and edge subsets in increasing size for the cover optimum, and saves the full graphs, triangles, optimum witnesses, and symmetry counts to `evidence/criticality_identification_wheel.json`. There is no graph-corpus or graph-order extension in this certificate.
