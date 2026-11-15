# Triangle-full minimum covers as a stronger global gate

Status: exploratory exact global hypothesis, with one finite falsifier of its universal-cover strengthening. This is not a proof of Tuza. All research uses the original TUZA-19 clock. No novelty or formal-verification claim.

## Exact property and implication

Call the following property TF:

    For every actual triangle T, tau(G-E(T))=tau(G)-3.

Equivalently, every triangle's three edges are contained in SOME minimum triangle cover. The equivalence follows by adjoining E(T) to a minimum cover of the deletion, and conversely by removing E(T) from a containing minimum cover. Arbitrary triangle-free edges are irrelevant to TF and should be removed when imposing edge-criticality.

An edge-minimal violation of Tuza, with nu(G)=k, satisfies tau(G)=2k+1. For any nonempty proper edge deletion, induction gives Tuza on the remaining graph. In particular deleting at most two edges preserves nu, because tau can fall by at most two. For an actual triangle T, every packing in G-E(T) extends by T, so nu(G-E(T))<=k-1; the deletion cover lower bound and Tuza on the remainder give equality nu=k-1 and tau=2k-2. Thus every minimal violation has TF, in addition to two-edge packing resilience and edge-cover-criticality.

The useful open strengthened gate is therefore:

    TF plus two-edge packing resilience implies pi(G)<=2nu(G).

This has the same global implication as H-O2 but a stronger premise. A separate discriminator is TF implies pi=tau, equivalently the existence of a minimum odd cover. That equality alone would not prove Tuza; it would identify a structural normalization available at a minimal violation. Its universal strengthening, EVERY minimum cover is odd, is false.

## Bounded discriminator and explicit failure of the universal strengthening

`checks/root_triangle_full_critical.py` checked the 1253 NetworkX graph-atlas representatives through seven vertices, separating triangle-free vacuous cases. It reconstructed every triangle, used exact deletion recursion for tau and nu, enumerated all minimum covers on TF qualifiers, and solved the triangle parity equations by exhaustive kernel enumeration. Output: `evidence/root_triangle_full/atlas.json`.

There are16 nonvacuous TF qualifiers in that finite domain. All have pi=tau. This is not evidence of an all-size theorem or justification for a larger census. One qualifier has nonodd minimum covers; many qualifiers, including K6, fail two-edge packing resilience. Thus TF neither implies universal minimum-cover parity nor implies two-edge resilience.

The nonodd witness is G=K2 join C5, with apex vertices a,b. This is the literal atlas graph1227 in the receipt (apices0,1; rim cycle2,5,4,3,6,2). It has16edges,15triangles, tau=pi=6 and nu=4. Exactly31 minimum covers were enumerated, including the nonodd six-spoke cover in the receipt.

Here is an ordinary proof of the relevant values and TF property, independent of the enumeration. A cover omitting ab must choose at least one spoke over each rim vertex. Five spokes alone would assign opposite choices across every rim edge, impossible on C5; hence such a cover costs at least6. A cover including ab needs at least5 further edges to cover the two copies of the rim's cone triangles: if r rim edges are selected, each apex needs a vertex cover of C5 minus those r edges. For r=0,1,2,3,4,5 the least possible r+2 times that vertex-cover number is respectively6,5,6,5,6,5. Thus tau>=6. A balanced partition of the rim into2 and3 with exactly one monochromatic rim edge, and opposite apex colors, gives an odd cover of five spokes plus one rim edge, proving tau=pi=6.

A four-triangle packing is obtained by deleting one rim edge and alternately assigning the four remaining path edges to the two apices. Five triangles would use15 of16 graph edges. Every vertex of G has even degree, whereas deleting one edge gives two odd degrees, impossible for an edge-disjoint union of triangles. Thus nu=4.

For TF on a triangle abv, select ab, av, bv, and the three rim edges not incident with v. These six edges cover all triangles and contain abv. For TF on a triangle auv over a rim edge uv, select uv and exactly one spoke per rim vertex, alternating the apex choice along the four-edge path C5-uv, with both endpoints assigned to a. This six-edge cover contains auv. The same construction works for b. These exhaust all actual triangles.

Finally, omit ab and choose both spokes at one rim vertex; choose one spoke at each of the other four vertices by alternating along their induced path. This is a six-edge cover, but triangle abv at the doubly selected vertex contains exactly two cover edges. It is a concrete nonodd minimum cover.

## Structural observations and next decision

TF forces every triangle edge to belong to at least two triangles: if e appeared only in T, a minimum cover containing all of T could discard e. This necessary condition is also implied by two-edge packing resilience, so it supplies no new global reduction by itself.

For a minimum cover containing a triangle T=abc, its three red edges have private triangles. If every such private triangle had the same outside apex w, replacing the three edges of T by ab and cw would still cover all triangles affected by the removal, contradicting minimum cardinality. Hence there are private triangles on two different bases with different apices, and these two private triangles are edge-disjoint. This local two-for-one packing fact does not yet coordinate across many triangles or minimum covers. It is not a proof of the global gate.

The current next step is structural: determine whether TF can preserve a genuine pi-tau gap, rather than enlarging the atlas. Independent multi-cone and double-cover work may provide an exact counterexample construction or a normalization lemma. The universal-cover and resilience implications are closed as false; the existential odd-cover statement and the combined parity gate remain open.

## One triangle-transitive discriminator

The single graph KG(7,2), with105edges and105triangles, was tested because triangle transitivity reduces TF to one forced triangle. Exhaustive enumeration of its20-dimensional parity kernel produced pi=35. Every graph edge belongs to exactly three triangles, so every cover has size at least35. Hence tau=pi=35; every minimum cover must meet every triangle exactly once by summing triangle incidences. TF is therefore false. The solver independently rejected a35-edge cover containing the fixed triangle, but this negative conclusion also has the preceding ordinary counting proof. This is one targeted graph, not an expanded census. Artifact: evidence/root_triangle_full/kneser_7_2.json; checker checks/root_triangle_full_kneser.py.

More generally, if every edge has triangle codegree at most d and TF holds in a graph with t triangles, a minimum cover containing any fixed triangle gives d*tau>=t+2. This is only an elementary necessary condition, not a global reduction.
