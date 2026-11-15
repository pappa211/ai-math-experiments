# Triangle-free rainbow matching / mixed-cover gate

Frozen 2026-11-15, TUZA-19 original clock. Requested review/research controls: Astra / Ultra; exact serving identity and reasoning effort are not independently exposed. This is ordinary mathematical work plus bounded native SAT computation, not Lean or human verification.

## Statement and current decision

Let F be a finite simple triangle-free graph with a proper edge coloring, with each color occurring at most twice. A mixed cover is a set of ordinary vertices and colors such that every edge either has a selected endpoint or a selected color. Write tau_mix(F) for its minimum size, and nu_r(F) for maximum rainbow matching size.

The proposed all-size statement is tau_mix(F) <= 2 nu_r(F). It is **unresolved in this investigation**. We have an elementary proof when nu_r <= 1 and a complete reduction of a possible nu_r = 2 counterexample to 28 finite SAT domains; all 28 returned UNSAT. Those UNSAT results are solver-only, without independently checked proof traces. We did not expand the test to nu_r = 3. A published example refutes one stronger induction proposed below, while satisfying the target inequality with substantial slack. No assertion of literature novelty is made.

For bipartite F the statement is elementary: tau_mix <= tau_vertex = mu(F) by Konig's theorem, while an ordinary maximum matching contains at most two edges of each color, so nu_r >= mu(F)/2. No 3-partite hypergraph theorem is needed for this subcase.

## Exact transfer from actual triangles

Suppose the edges of an actual finite simple graph G are partitioned into R and L, every actual triangle has exactly two R edges and one L edge, and each L edge lies in at most two actual triangles. Define F with vertex set R; each actual triangle gives an edge between its two R edges, colored by its L edge. Two graph edges determine at most one triangle, so F is simple. Two triangles with the same L edge cannot share an R edge, so its coloring is proper, and each color occurs at most twice.

F is triangle-free without any assumption that the graph formed by R is bipartite. Three pairwise adjacent resource edges would correspond to three pairwise incident R edges in G. Such edges either form an all-R triangle, forbidden, or a three-edge star. In the star case all three closing edges must lie in L, producing an actual all-L triangle, also forbidden. Thus both cases are excluded.

A rainbow matching in F is exactly an edge-disjoint triangle packing in G: endpoints represent R conflicts and colors represent L conflicts. Likewise a mixed cover is exactly a triangle edge cover, after disregarding edges belonging to no triangle. Hence nu_r(F)=nu(G) and tau_mix(F)=tau(G). The proposed resource lemma would prove Tuza for this exact-one-L class. It does not establish that such an edge partition is available for every relevant G, nor even every TF graph with a light edge in every triangle. Actual endpoints impose further constraints not assumed by the abstract lemma: cross adjacency between the two pairs belonging to one repeated color forces the complementary adjacency of a bichromatic square. We do not claim every abstract F is realizable by actual triangles of G.

## The case nu_r = 1

If the ordinary matching number is one, pairwise intersecting edges in a triangle-free graph form a star and one vertex covers them. Otherwise choose disjoint edges ab and cd. They must have the same color gamma. Every other edge has a different color, since gamma occurs only twice, and must meet both ab and cd to avoid a rainbow pair. It is therefore a cross edge between their endpoint pairs. Two cross edges sharing an endpoint would form a triangle together with ab or cd. Thus the cross edges form a matching of size at most two. If there are two, they must share a second color delta. Selecting gamma and delta covers everything. If there is one, select gamma and one endpoint of that edge. This proves tau_mix <= 2. The empty graph is immediate.

## Necessary structure of a minimal counterexample

Choose an edge-minimal counterexample and discard isolated vertices and unused colors. Put k=nu_r(F). Deleting resources means deleting all incident or corresponding-color edges; the remaining graph stays in the class.

For an edge e=uv of color gamma, delete the three resources u,v,gamma. A residual rainbow matching can be extended by e, so its size is at most k-1. Minimality gives a residual cover of size at most 2k-2; reinserting those three resources gives tau_mix(F) <= 2k+1. Thus a counterexample has tau_mix=2k+1, and equality throughout shows that a minimum cover contains all three resources of every specified edge.

Deleting any set of at most two resources preserves nu_r. Otherwise a residual cover of size at most 2k-2, together with the deleted resources, would contradict tau_mix=2k+1. Every resource has degree at least two: a degree-one resource would be redundant in a minimum cover containing all three resources of its unique edge. Consequently every color occurs exactly twice and every ordinary vertex has degree at least two.

For an ordinary vertex v, take a rainbow k-matching avoiding v. Triangle-freeness permits at most one endpoint of each matching edge to be a neighbor of v. At most k incident edges of v are therefore blocked by matching endpoints; proper coloring allows at most k further incident edges blocked by used colors. Any other incident edge could extend the matching. Hence Delta(F) <= 2k. Also mu(F) <= 2k, by retaining at least one edge of each color in an ordinary matching.

These are only necessary conditions. In particular two-resource resilience alone will not lead to a contradiction; the source-based obstruction below shows this explicitly.

## Complete nu_r = 2 kernel

A hypothetical edge-minimal counterexample with nu_r=2 has tau_mix=5, delta>=2, Delta<=4, and mu<=4. For any S subset V(F), let q be the number of odd components of F-S and q1 the number of singleton components. Every singleton has at least two neighbors in S, whereas S sends at most 4|S| incident edges outward. Thus q1<=2|S|. Every nonsingleton odd component has size at least three; even components only help, so

3q - (n-|S|) <= 2q1 <= 4|S|,

and therefore 3(q-|S|)<=n. Tutte--Berge gives n-2mu=max_S(q-|S|)<=n/3, hence n<=3mu<=12. On the other hand a triangle-free graph on at most seven vertices has a vertex cover of size at most four: for seven vertices an independent triple follows from the elementary six-vertex Ramsey argument, and smaller orders are immediate or follow by restriction. So n>=8.

If c is the number of colors, then m=2c. The degree bounds give n<=2c<=2n, and tau_mix=5 implies c>=5. The complete set of domains is

- n=8: c=5,6,7,8;
- n=9: c=5,6,7,8,9;
- n=10: c=5,6,7,8,9,10;
- n=11: c=6,7,8,9,10,11;
- n=12: c=6,7,8,9,10,11,12.

There are exactly 28 domains. This reduction concerns a least counterexample with k<=2; the preceding proof excludes k<=1, so all proper edge-deleted subgraphs satisfy the needed bound.

### Encoding and symmetry

`checks/fresh_rainbow_resource_gate_search.py` gives each color two edge positions, each selecting exactly one unordered vertex pair. Capacity-one clauses make F simple; incidence variables define endpoints; degree constraints are 2 through 4; triangle clauses forbid ordinary triangles; the two positions of each color are disjoint. For every three positions of distinct colors, an intersection clause requires some pair to share a vertex, excluding rainbow triples. Every set of four mixed resources must miss an edge. A fixed rainbow pair occupies edges 01 and 23 in the first and second color classes. This is harmless because nu_r=2 permits such a pair and vertices/colors can be renamed. For the remaining color classes only, their two edges and then the color classes are lexicographically ordered; these restrictions are also obtainable by edge-position and color permutations and do not disturb the pinned pair.

`evidence/fresh_rainbow_resource_gate/kernel_receipt.json` records all 28 UNSAT results, return codes 20, CNF hashes, variable/clause counts and times. Every case finished in under one second, well inside the requested five-minute process budget. The CNF helper is the existing `checks/global_routes_sat.py`; it is not a proof oracle, and its cardinality encoding is part of the trusted implementation. Native CaDiCaL 2.1.2 was used. No DRAT checking and no Lean formalization were done. Thus the finite result is a complete encoded search with solver trust, not a kernel-certified theorem.

Two literal semantic controls were SAT and independently recomputed from their edge lists:

1. Removing triangle-freeness admits a properly colored K4 together with a bichromatic C4: nu_r=2 and tau_mix=5, exactly the target obstruction outside the hypothesis.
2. Keeping triangle-freeness and lowering the mixed-cover threshold to four admits two disjoint bichromatic C4s: nu_r=2 and tau_mix=4.

Their literal graphs, all ordinary triangles, covers and solver hashes are in `semantic_controls.json`. Adding the optional control parameters changed the checker hash after the main run; all default CNF hashes were then regenerated and verified unchanged, as recorded in the receipt. The supplied replay driver checks exactly these 28 domains and has a 300-second overall budget; it does not enlarge the search.

## The two-resource deletion induction is false

A tempting stronger assertion would say that every nonempty F in this class has two resources whose deletion lowers nu_r. That would immediately give an induction for the desired mixed-cover bound, but it is false even for bipartite 2-regular F.

Primary input: Alexander Clow, Penny Haxell and Bojan Mohar, *A Counterexample to a Conjecture of Lovasz*, arXiv:2505.05339v2, Theorem 2.1 and Lemma 2.2, https://arxiv.org/pdf/2505.05339v2. They establish the needed facts for the cubic 102-vertex Biggs--Smith graph B: alpha(B)=43, B is Hamiltonian, and for any two B edges a maximum independent set avoids all their endpoints. The independence-number input uses computer assistance in their paper. We have not independently replayed that proof or their finite classifications.

Here is the ordinary translation, proved independently from those stated inputs. A Hamilton cycle of the even cubic B, alternately colored A and D, and its complementary perfect matching C give three perfect-matchings of 51 edges each. Define an ordinary graph F whose vertices are A union D. Every vertex v of B creates one edge between its incident A-edge and its incident D-edge, colored by its incident C-edge. This F is simple, bipartite and 2-regular; its coloring is proper and each of its 51 colors occurs exactly twice. Its 102 edge triples, as sets of two endpoints and one color, are precisely the incidence triples of B vertices. Consequently rainbow matchings in F are independent sets of B, so nu_r=43. Deleting any two resources in F deletes the incidence triples at the endpoints of the corresponding two B edges. The quoted Lemma 2.2 supplies a maximum independent set avoiding those endpoints, so nu_r remains 43.

Finally tau_mix=51: every resource covers exactly two of the 102 F edges, requiring at least 51, and all 51 colors attain this. Therefore this is an obstruction to the two-resource blocker induction, not to tau_mix<=2nu_r. No realization of this F as the triangle resource graph of some original G is asserted or needed for the stated abstract induction counterexample.

## Endpoint and verification scope

The general mixed-cover inequality remains open here. The complete nu_r<=2 screen and necessary counterexample structure supply a precise finite boundary, but no all-size induction has been found. The published deletion-resilience example rules out replacing the missing induction by an unconditional two-resource blocker. We stop this lane without expanding the census. No Tuza counterexample, no all-size Tuza proof, and no new formal theorem is claimed.
