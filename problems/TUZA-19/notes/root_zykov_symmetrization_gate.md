# Zykov defect monotonicity: precise new reduction screen

Status during04:57–04:59Z: hypothesis under a bounded decisive attack, not a theorem. This differs from frozen degree-directed compression and vertex identification: a source false-twin class is replaced wholesale by copies of a nonadjacent target class.

Write d(G)=tau(G)-2nu(G). Partition vertices by identical open neighborhoods. For nonadjacent distinct classes A,B, Z(A to B) deletes all edges incident with A and gives every vertex of A exactly the old neighborhood of B. No edges are added within A or between A and B. Other old twin classes stay intact and A,B merge; hence the number of classes strictly decreases.

The unconditional claim that some direction preserves d already fails on two K4 blocks sharing one vertex (all nonedges join private vertices of the two blocks). This does not test a reduction that first splits the triangle hypergraph into its components. The sharper falsifiable gate is:

    Every graph whose triangle-edge incidence hypergraph is connected,
    with every edge in a triangle, and which is not complete multipartite,
    has distinct nonadjacent false-twin classes A,B and a direction
    such that d(Z(A to B))>=d(G).

Its intended role is an exact structural reduction: at a positive-defect graph, split triangle components and discard zero-triangle edges; otherwise merge such classes without losing positive defect. Vertex deletion or triangle-component restriction reduces the order/edge domain, and a wholesale class merge reduces the twin-class count. A complete proof of termination across alternating restrictions would need a stated lexicographic measure; a proof of Tuza on the complete-multipartite terminal family would also need to be supplied or sourced. Neither is silently assumed here. A universal gate is substantially stronger than preserving only positive defects, and a nonpositive witness can refute this proposal without refuting Tuza.

Weakest link: the displayed defect monotonicity. First test the fixed graph atlas, stopping at its first triangle-connected failure; then reconstruct that small graph ordinarily. No larger census is warranted if it fails.

The first literal wording allowed isolated vertices and immediately returned K4 plus an isolate, the already known trivial failure. That output is preserved as evidence/root_zykov/literal_first_gate_isolate.json. The meaningful remaining screen explicitly excludes isolated vertices, as required when restricting to the vertex set of a triangle component; this scope repair is recorded before rerunning the same bounded discriminator.

## Decisive no-isolate counterexample: the five-wheel

The sharpened gate is false on the cone W over a five-cycle 012340, with apex5. It has no isolates, every edge lies in a triangle, and its five actual triangles form a connected cyclic overlap family. Its six false-twin classes are singletons. Every nonadjacent vertex pair consists of two rim vertices at distance two, and all directed choices are automorphic.

For a cone over any triangle-free rim R, triangles correspond exactly to rim edges; an edge-disjoint triangle packing corresponds to a matching of R. A cover can be changed to a spoke-only cover without increasing its size: replace a selected rim edge by either endpoint's spoke. Thus nu(cone R)=matching(R) and tau(cone R)=vertex-cover(R). For C5 these values are2 and3, hence d(W)=-1.

Clone rim vertex0 to rim vertex2. The new rim has edges01,03,12,23,34: a four-cycle0-1-2-3-0 with pendant edge34. It has a matching of size2, cannot have size3 on five vertices, and has vertex cover{1,3} of size2. Its cone therefore has nu=tau=2 and defect-2. By the directed-pair symmetry this holds for EVERY permissible cloning operation. All ten directed operations, their literal edge lists, and exact values are preserved in evidence/root_zykov/gate.json. The no-isolate pass stopped at atlas187 after thirteen qualifying graphs, rather than enlarging the search.

The original wheel is even edge-cover-critical: deleting a rim edge leaves the path's cover number2, and deleting a spoke leaves a three-edge path's cone triangles with cover number2. It is neither triangle-full nor two-edge packing-resilient. Thus this refutes the universal and edge-critical versions of the proposed monotonicity, but says nothing about a variant expressly restricted to all genuine minimal-violation conditions. There is no established mechanism for such a variant, so this lane is stopped; no special-case weakening is promoted.

No proof of the complete-multipartite terminal case, no termination theorem, no external theorem import, no new formal check and no Tuza counterexample are claimed. Reproduce with `python checks/root_zykov_symmetrization.py` in the pinned native environment. The ordinary cone/matching calculation supplies the mathematical witness independently of the finite recursion.
