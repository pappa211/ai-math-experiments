# Fresh independent audit: CP5 clique-plus-link polytope obstruction

Verdict: **PASS for the mathematical obstruction and its amplification, with two minor wording corrections recorded below.** This is ordinary proof reconstruction and an independent positive-certificate check, not human review or Lean. Requested model controls: Astra / Ultra; actual serving identity and effort are not independently exposed. The original TUZA-19 clock remains unchanged.

## Frozen targets and independence

Main input: `notes/global_routes_clique_link_polytope_obstruction.md`, SHA256 `58a6165eb965c00ae7c0fc711b9bdaf22a99809c616b2e8e04447bafccb32b07`.

Literal certificate data: `evidence/global_routes/clique_link_control.json`, SHA256 `a27c52c171bb0dcade1ce16678484c61e90dc1e5679643bd606feb7b911e6156`.

Explicit all-size dependency: `notes/global_routes_quantitative_amplification.md`, SHA256 `4ddc162df0ceb5072b948d64cf7d09df1e2e7641d66dceb038aecce6cbb48d53`.

Snapshots are retained under `evidence/clique_link_fresh/`. The producer checker was hashed as supplied (`2670f99e67cfa7da5e6e4c28fcf78fa68f66c2cb577109e111245cdd1976925d`) but neither read nor imported as proof. The checker `checks/fresh_clique_link_audit.py` was written from the statement and literal data; it uses only Python's standard library. No SAT, optimization package, Lean process, graph census or remote computation was used. The mathematical reconstruction preceded the literal replay; the replay checks fixed positive certificates only.

## Reconstruction of the exact fixed control

For G=K_(2,2,2,2,2), choosing two different parts and one vertex in each gives 40 edges; choosing three parts and a vertex in each gives 80 triangles. Every degree is eight and every edge belongs to six triangles.

A packing of 13 triangles would use 39 of the 40 edges. Subtracting triangles changes every degree by an even number, so the leave must have even degree at every vertex. A one-edge leave is impossible. Thus nu<=12. Each of the three stated literal rows is a valid 12-packing; this proves nu=12 with no solver upper bound.

There are exactly three four-cycle patterns according to multiplicities of twin pairs: 2+2, 2+1+1, and 1+1+1+1. Repeated twins must occupy opposite cycle positions. The pair-permutation and within-pair-swap automorphisms are transitive on each pattern, and the three supplied packings realize all three representative leaves. Counting directly gives 10, 120, and 240 cycles, totaling 370.

Every pair of edges belongs to an actual four-cycle. Adjacent edges can be completed with a vertex from a part different from all three used parts. For disjoint edges, if both cross pairings fail then one missing edge from each pairing identifies twin parts in a way that forces one of the original edges to be a nonedge. Hence one pairing works. The transported 12-packing avoids both selected edges. This proves preservation of nu after every deletion set of size at most two. The smaller deletion sets follow by extension to an edge pair or directly from the original packing number.

For the cover lower bound, a triangle-free ten-vertex remainder has at most 25 edges by Mantel. Equality implies K_(5,5). Such a subgraph cannot exist here: both vertices of every missing twin edge must be on the same side, making both side sizes even. Thus a triangle-free remainder has at most 24 edges, and tau>=16. A cut separating two whole twin pairs from three whole twin pairs has 24 crossing edges; its complement is a cover of size 16. Placing the three twin pairs occupied by any specified triangle on the six-vertex side yields a minimum cover containing all three triangle edges. This is exactly TF. The cut complements also meet each triangle oddly, giving pi=tau=16 if that auxiliary parameter is recorded.

## Full polytopes, not only size inequalities

The vertex link is K_(2,2,2,2). The three perfect matchings of its four part-labels, each expanded in two ways using simultaneous straight or crossed pairings, partition its 24 edges into six perfect matchings. Uniform averaging supplies link-edge marginal 1/6, so the corresponding triangle vector is in every full star packing polytope.

Every clique has at most five vertices. For clique orders 3, 4 and 5, the supplied valid packing sizes are 1, 1 and 2. Uniformly permuting the chosen packing makes all clique triangles equiprobable. Mixing with the empty packing with respective nonempty weights 1/6, 2/3 and 5/6 gives marginal exactly 1/6. This proves feasibility in each full clique packing polytope directly as a convex combination. The word 'maximum' is unnecessary for this feasibility proof; validity of the listed packings suffices.

Consequently x_T=1/6 is feasible and has value 80/6=40/3. Every edge capacity follows from an endpoint's full star polytope. Summing those capacities gives 3 sum x_T<=40, proving rho_cl=40/3 exactly. Thus floor(rho_cl)=13>nu=12. These local convex combinations are separate distributions and are not claimed to have any jointly consistent higher moments or common global coupling.

For non-WKE, fix any matching M in a link. Every triple of link vertices originally contains either a triangle (three parts) or a two-edge path (two parts). Neither edge set can be wholly contained in a matching. Therefore L-M has no independent triple, every vertex cover Q has at least six vertices, and |M|<=4. This proves non-WKE for every matching, not just for those in the marginal certificate.

## All-size copy ownership and strengthened constraints

I reconstructed the explicit digit/norm incidence construction in the quantitative dependency. Base B=2rD prevents carries for every weighted equation with positive weights summing to at most r. A common squared-norm level then excludes nonconstant weighted averages by strict convexity. For arithmetic hyperedges E(x,a)={(i,x+ia)}, two shared vertices force equal parameters, so the incidence hypergraph is linear. A Berge triangle would yield a nontrivial weighted average among three slopes, with positive weights summing to at most r-1; hence no Berge triangle occurs. The size estimate b>=N^2 exp(-C_r sqrt(log N)) follows from the displayed norm-level count and log M=d^2 log 2+O_r(d). These facts were checked from the supplied ordinary proof; no fresh claim of originality or new incidence theorem is made.

For copies of CP5 placed on those 10-element hyperedges, graph edges have unique owners. If two edges of an actual triangle share an owner, its third edge cannot have another owner without violating linearity. If all three owners differ, they form a Berge triangle. Hence every actual triangle is copy-local. Copies are induced because a new edge between two vertices of one copy would also violate linearity. It follows that nu=12b and tau=16b exactly. TF and two-edge resilience pass by choosing minimum covers or surviving maximum packings separately in the affected blocks.

A vertex link is a disjoint union of its block links. Their neighbor sets are disjoint by linearity, and a cross-block link edge would create a nonlocal actual triangle. Therefore every connected link component is a copy of K_(2,2,2,2), hence non-WKE. Taking the product of the independent six-state matching distributions yields a valid matching distribution for the full link, retaining every marginal 1/6.

Every clique of size at least three has a unique owner. Begin with one of its triangles. For an additional clique vertex, its triangle with two original vertices shares an owned edge, so its owner is the same block; hence that vertex is in the block. All clique constraints are therefore already covered by the local mixtures. Smaller cliques have no triangle coordinates. Thus rho_cl=40b/3, with gap 4b/3, for the amplified graph as well.

The quantitative incidence estimate implies b/N^(2-epsilon) tends to infinity for every fixed epsilon>0. Removing isolates only decreases the graph order, and the dependency's fixed-slope argument gives |V(H)|>=N/10, so these graphs are arbitrarily large. Therefore for every fixed epsilon in (0,2) and fixed C>=0, sufficiently large members have rho_cl>nu+C|V(H)|^(2-epsilon). The linear-additive statement follows in particular. No arbitrary o(n^2) absorption is inferred.

## Literal replay and negative controls

The independent checker returned PASS on Darwin / Python 3.12.12, exit code zero. It reconstructs G and its actual triangles directly from the twin-pair definition, rather than trusting the producer's enumerated graph. It checked:

- all three literal 12-packings and their exact leaves;
- all 370 cycle certificates against independently generated actual cycles;
- all 780 unordered edge pairs and their containing certified leaves;
- all 80 TF cover witnesses, including size, containment, coverage and oddness;
- all ten six-state full-link distributions, with exact rational marginals;
- all clique mixtures, including the 80, 80 and 32 actual cliques of sizes 3, 4 and 5;
- the triple-edge observation needed for the all-matchings non-WKE proof.

A duplicated triangle is rejected by the packing validator, and the altered probability 1/5 fails the six-state probability-normalization equation. Receipt: `evidence/clique_link_fresh/independent_receipt.json`. This finite check verifies positive data, while optimality and amplification remain the ordinary arguments above.

## Objections retained and precise scope

1. In frozen Section 5, a K5 two-packing is said to match the edge-count upper bound. The edge-count bound is three, not two. Parity excludes a three-packing because K5 has even degrees and a three-packing would leave one edge. Alternatively remove the maximality assertion entirely: the convex-mixture proof only uses a valid two-packing. This wording defect does not invalidate the certificate or claimed rho value.
2. The phrase 'all the same structural properties' in the amplified statement can be read as including the fixed control's connected links. Amplification generally creates disconnected links. The correct preserved property, stated explicitly in Section 7, is that every connected link component is non-WKE (and hence the full link is non-WKE). Connectedness of every link is not established and should not be claimed.

No substantive mathematical gap remains for the corrected, explicit component-wise statement. This refutes the stated exact clique-plus-link packing synchronization step, even with TF and two-edge resilience. It does not refute Tuza: tau=16b<24b=2nu. It proves no cover inequality tau<=2rho_cl, no statement about unions of multiple vertex stars combined with clique polytopes, no global moment consistency or SDP claim, and no impossibility result for other rounding arguments using the substantial cover slack.
