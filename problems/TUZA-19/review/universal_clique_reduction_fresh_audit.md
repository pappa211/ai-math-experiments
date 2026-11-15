# Fresh audit: universal-clique and high-codegree reductions

Verdict: PASS as an ordinary conditional reduction, with the scope below. I found no material mathematical error in the frozen proof. This does not prove Tuza, exhibit a counterexample, establish originality, or constitute human or Lean verification.

## Frozen input and independence

Input: `notes/global_routes_universal_clique_reduction.md`.

SHA256: `83d9549aae898656b2d09871c5f87c481d6b36116f7ac37d23f534df92f527a1`.

The hash was checked before reconstruction. The audit read this complete statement and proof, plus the mission/clock instructions. It did not read producer code, a prior favorable audit, or producer search output. No checker was needed: all steps reduce to explicit finite counting, triangle ownership, elementary K5 facts, and parameter inequalities. This review independently supplies the elementary K5 facts below.

Local host: Darwin. Original mission start 2026-11-15T01:53:58Z; research cutoff 2026-11-15T09:23:58Z; hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving model and effort are not exposed.

## 1. Exact claims accepted

For every fixed integer q>=1, unrestricted Tuza is equivalent to its restriction to graphs containing at least q universal vertices. It is also equivalent to its restriction to graphs in which every edge lies in at least q actual triangles. The construction in fact meets both conditions simultaneously and is connected.

Separately, unrestricted Tuza is equivalent to its restriction to graphs having a universal vertex and TF, where TF means that every actual triangle is contained in some minimum triangle edge cover.

For any absolute constant C>=0, a universal bound tau(G)<=2nu(G)+C|V(G)| would imply exact unrestricted Tuza. No inference from an o(n^2) additive error is asserted.

These are contraposition statements: a hypothetical positive-defect graph produces another positive-defect graph in each stated class. They do not manufacture a counterexample without that hypothesis. They do not claim preservation of minimality or two-edge packing resilience. In the clique statement, “containing q universal vertices” means at least q, not exactly q.

## 2. Independent reconstruction of the incidence lemma

Fix r>=3 and D>0, then fix c=8r!(D+1). Only N tends to infinity. Select r-subsets independently with p=cN^{-(r-1)}. For sufficiently large N, p<=1 and

    E Y >= cN/(2r!),    Var(Y)<=E Y.

Thus P(Y<E Y/2)<=4/E Y tends to zero.

For a bad pair of distinct hyperedges, designate two distinct common vertices and then the remaining r-2 vertices of each edge. There are at most N^{2r-2} ordered specifications. Restricting to specifications yielding distinct hyperedges makes their joint selection probability p^2, so the expected number of bad pairs is at most c^2. A pair sharing more than two vertices is still counted; duplicate specifications only enlarge the upper bound. One can alternatively make the encoding injective by using the two least common vertices and sorted remainder lists.

For a Berge triangle, designate three distinct pairwise intersection vertices and then r-2 further vertices per hyperedge. There are at most N^{3r-3} specifications. The three designated hyperedges must be distinct, so the probability is p^3 and the expected number of ordered configurations is at most c^3. The distinctness restrictions matter and are present in the frozen statement.

Markov gives P(Z_2+Z_3>sqrt(N))<=(c^2+c^3)/sqrt(N). A union bound with the preceding Chebyshev estimate proves that, for every sufficiently large N, some outcome has at least cN/(4r!) selected hyperedges and at most sqrt(N) forbidden configurations. Delete an edge from each surviving forbidden configuration. No deletion creates a new one, and at most the original count of configurations is deleted. Hence

    b >= 2(D+1)N-sqrt(N)>DN.

This establishes exactly the required linear density with arbitrary fixed coefficient D. It does not assert positive quadratic density. The large constants and possibly enormous required N cause no logical problem, since this is a finite existence reduction rather than a small-instance construction.

## 3. Ownership and additivity after identification

Remove isolated vertices from the fixed input graph G before choosing r=|V(G)|. A counterexample has a triangle, so r>=3 and G has at least one edge. Place one labeled copy of G on each incidence hyperedge.

Linearity implies that different copies share no graph edge and that each copy remains induced on its own vertex set. It also implies uniqueness of the owner of each copied edge.

For an actual triangle xyz in the union, either two of its edges have the same owner or all three owners differ. In the first case that hyperedge contains x,y,z, and linearity forces the third edge to have the same owner. In the second case x,y,z are distinct pairwise intersection vertices of three distinct hyperedges, a forbidden Berge triangle. Thus every actual graph triangle is owned by one copy. This argument covers all triangles created by the identifications, not merely the specified triangles of the copies.

Because edges are disjoint across copies, restrictions of a global cover give a cover of each copy. Because triangles have unique owners, a packing has at most nu(G) members per copy. Conversely optimal local covers and packings can be united; vertex intersections do not violate edge-disjointness. Therefore

    tau(H)=b tau(G),    nu(H)=b nu(G),    delta(H)=b delta(G).

Unused incidence vertices may be removed. The resulting order n is at most N; removing them strengthens b/n>D. Since G has no isolated vertices, every vertex used by a copied hyperedge has a graph neighbor. In fact n>=r>=3. Copy connectivity is immaterial: neither G nor H needs to be connected for the proof. The subsequent join with a nonempty clique is connected.

## 4. Universal clique: the exact overhead is valid

In J=K_q join H, the new edges number qn+binom(q,2). Every triangle meeting the new clique uses at least two new edges. This includes all three types: one new vertex, two new vertices, and three new vertices. If a packing contains s new triangles, then 2s<=qn+binom(q,2); its old triangles form a packing in H. Restricting any J-cover to E(H) covers H. Consequently

    delta(J)>=b delta(G)-qn-binom(q,2).

For delta(G)>0, the frozen choice D>(q+binom(q,2)+1)/delta(G) is more than sufficient: b>DN and N>=1 imply b delta(G)>qN+binom(q,2). Since n<=N, positive defect survives. No rounding or parity assumption is needed; the packing bound deliberately uses a valid real-valued upper bound.

Every edge then has at least q triangle neighbors:

* old xy: all q new vertices;
* cross ax: the q-1 other clique vertices and at least one old neighbor of x;
* clique aa': n old vertices and q-2 other clique vertices, totaling n+q-2>=q.

For q=1 the last edge type does not exist. This is precisely why isolated old vertices are removed. The minimum-degree assertion q+1 also holds. For q>=3 all edges are already heavy in the codegree-at-least-three sense; the stated fixed core calibration follows.

The quantifiers cannot silently change: q is fixed before the incidence system is chosen. If q depends on the output order, the term qn must be reanalyzed. The proof makes no such assertion.

## 5. TF universal-vertex reduction

Take a hypothetical counterexample with the fewest edges and remove isolated vertices. With k=nu(G), any actual triangle T can be added to a packing of G-E(T), so nu(G-E(T))<=k-1. Minimality and the elementary cover extension give

    2k+1<=tau(G)<=tau(G-E(T))+3<=2(k-1)+3=2k+1.

All quantities are integral, so tau(G)=2k+1 and tau(G-E(T))=tau(G)-3. This proves TF. A triangle-free graph edge would be removable without changing either parameter, contrary to minimality; hence every graph edge lies in a triangle. TF then implies that every edge belongs to some minimum cover, equivalently tau(G-e)=tau(G)-1. This is the cover-criticality needed later, not an assumption that criticalization retains an apex.

Exact ownership in H transfers these cover properties copy by copy. Add an apex a, then attach one K5 along each spoke av, with three private new vertices.

The elementary K5 facts used by the draft are all valid:

* tau(K5)=4: three edges cover at most nine of its ten triangles, while the edges of any triangle together with the edge on the opposite two vertices form a four-cover.
* That four-cover contains the full prescribed triangle. A four-cover containing any prescribed root edge is obtained by choosing a triangle containing it.
* nu(K5)=2: three packed triangles would use nine of its ten edges, leaving a single edge. But K5 has even degrees and a union of edge-disjoint triangles has even degrees, so the leftover degrees must be even, which a single edge cannot satisfy.
* Two triangles avoid any prescribed edge by relabeling: for root 12, use 134 and 235. They share only vertex 3 and avoid 12.

The old H edges and the complete attached K5 edge sets partition E(W). Every triangle containing a fresh vertex lies in its unique attachment. The remaining actual triangles are exactly the old H triangles and apex triangles over old H edges. These facts prove

    tau(W)=tau(H)+4n,
    nu(W)=nu(cone(H))+2n.

For the first equality, restriction gives the lower bound; a minimum H-cover plus root-containing four-covers in all attachments attains it and covers every crossing apex triangle. For the second, partition a packing into old cone triangles and attachment triangles for the upper bound; extend an optimal cone packing by two root-avoiding triangles per attachment for the lower bound.

TF is checked without a compatibility gap. An H triangle is handled by an H minimum cover containing it. An apex triangle auv is handled by an H minimum cover containing uv and all roots. For a triangle in one attachment, use its containing four-cover, choose all other attachment roots, and take any minimum H-cover. If the special root av is absent, each crossing apex triangle auv is still covered by its other root au, whose attachment is distinct. Thus every actual triangle is contained in a global minimum cover. The apex is adjacent to every old vertex and all three fresh vertices of every attachment, so it remains universal.

Finally,

    delta(W)=tau(H)-2nu(cone(H))>=b delta(G)-n,

which is positive after choosing D>1/delta(G). The decoration cancels exactly in the defect; the cone overhead is the only loss. The construction neither claims nor needs packing resilience.

## 6. Additive error and final limits

If a universal constant C satisfies tau(X)<=2nu(X)+C|V(X)| for every finite simple X, apply it to H. Exact additivity would give b delta(G)<=Cn. Choosing D>C/delta(G) contradicts b/n>D. This proves the stated implication. The dependence on a universal constant is essential; a graph-dependent coefficient is not covered.

No unresolved proof objection remains for these reductions. The historical comparison to TUZA-16 Route C was not separately re-audited; the present argument itself explicitly uses only arbitrary fixed linear copy density, so it makes no quadratic-density or fractional-integrality-transfer claim. Originality and comprehensive literature attribution remain outside this fresh reconstruction.
