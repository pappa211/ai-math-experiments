# Sparse incidence amplification and universal-clique reduction

Status: complete ordinary proof draft. A genuine unrestricted availability reduction, not a proof or refutation of Tuza. Independent review is requested; no Lean verification or originality claim. The probabilistic existence lemma is proved below, so no hypergraph existence theorem is imported.

Write tau(G) for the minimum number of graph edges hitting every actual triangle, nu(G) for the maximum number of pairwise edge-disjoint actual triangles, and delta(G)=tau(G)-2nu(G). All graphs and hypergraphs are finite, and all graph constructions below are simple.

## Main equivalences

For EVERY fixed integer q>=1, each of the following universal assertions is equivalent to unrestricted Tuza:

1. Every finite simple graph G has delta(G)<=0.
2. Every finite simple graph containing a clique of q universal vertices has delta(G)<=0.
3. Every finite simple graph in which each edge belongs to at least q actual triangles has delta(G)<=0.

Moreover, statement1 is equivalent to Tuza restricted to graphs that simultaneously have a universal vertex and have the property TF: every actual triangle is contained in some minimum triangle edge cover.

The reductions preserve a strictly POSITIVE defect of a hypothetical counterexample. They do not assume that a graph with large codegree is a minimal counterexample, nor that criticalization preserves universal vertices. No two-edge packing resilience is claimed for the constructed graphs.

## 1. Elementary dense-enough high-girth incidence systems

Fix an integer r>=3 and a real D>0. There exists a linear r-uniform hypergraph F on N vertices with b>D N hyperedges and no Berge triangle. Here linear means that two distinct hyperedges meet in at most one vertex. A Berge triangle consists of three distinct hyperedges E1,E2,E3 and three distinct vertices x12,x23,x31 with xij in Ei intersect Ej.

Proof. Choose every r-subset of an N-element set independently with probability

    p=c/N^(r-1),       c=8 r! (D+1),

where N tends to infinity and is large enough that p<=1. Let Y count chosen hyperedges. For all sufficiently large N,

    E[Y]=binom(N,r)p >= cN/(2r!).

Since Y is a sum of independent Bernoulli variables, Var(Y)<=E[Y]. Chebyshev's inequality therefore gives

    P(Y<E[Y]/2) <= 4/E[Y] -> 0.

Let Z2 count pairs of distinct chosen hyperedges meeting in at least two vertices. Every such pair can be specified by two common vertices and at most 2r-4 further vertices. Bounding ordered specifications above by N^(2r-2) gives E[Z2]<=c^2. This overcounts configurations and is only an upper bound.

Let Z3 count ordered Berge-triangle configurations with three distinct hyperedges. Specify its three distinct intersection vertices, then at most r-2 further vertices in each hyperedge. There are at most N^(3r-3) specifications, each of probability p^3 because its hyperedges are distinct. Thus E[Z3]<=c^3. Again overcounting is harmless.

For Z=Z2+Z3, Markov's inequality gives

    P(Z>sqrt(N)) <= (c^2+c^3)/sqrt(N) -> 0.

Hence for sufficiently large N an outcome has BOTH Y>=cN/(4r!) and Z<=sqrt(N). Delete one hyperedge from each surviving forbidden configuration, at most Z deletions. Deletion creates no new forbidden configuration. The remaining hypergraph is linear and Berge-triangle-free, with

    b >= cN/(4r!) - sqrt(N)
      = 2(D+1)N - sqrt(N) > DN.

This proves the lemma. The size N can be taken arbitrarily large. The density assertion is only b/N>D for arbitrary FIXED D; no positive quadratic edge density is claimed.

## 2. Exact integral amplification of arbitrary graph copies

Let G be any fixed finite simple graph without isolated vertices, on r>=3 vertices. In every hyperedge E of the preceding incidence system, choose an arbitrary bijection V(G)->E and place a copy G_E of G. Let H be the union of the copied graph edges. Remove unused isolated vertices from H, if there are any, and let n=|V(H)|<=N.

Distinct copies share at most one vertex and therefore have disjoint edge sets. Every copy is also induced on its own vertex set: an extra graph edge with both endpoints there would require another hyperedge meeting it in two vertices, contradicting linearity.

Every actual H-triangle lies in a single copy. To prove this, assign each of its three edges to its unique copy. If two edges have the same owner, that owner's hyperedge contains all three triangle vertices; the third edge cannot have another owner by linearity. If the three owners are distinct, the triangle vertices are three distinct intersections witnessing a forbidden Berge triangle. These exhaust the possibilities.

Consequently both integral parameters are EXACTLY additive:

    tau(H)=b tau(G),          nu(H)=b nu(G),
    delta(H)=b delta(G).                                  (1)

The lower cover bound follows by restriction to each edge-disjoint copy; the matching upper bound follows because every packed triangle belongs to one copy. The reverse bounds follow by taking optimal local covers or packings in all copies. Vertex identification causes no conflict for edge-disjoint packing. Crucially, the argument enumerates the possible owners of ALL graph triangles rather than retaining only a prescribed triangle family.

It follows that delta(H)/|V(H)| can be made arbitrarily large whenever delta(G)>0. Indeed b/n>=b/N>D and D is arbitrary. Isolated vertices of an initial graph G can always be removed before this construction without changing tau or nu.

## 3. Adding a fixed universal clique without losing positive defect

Let U be a new clique of q vertices and let J=K_q join H. Its q vertices are universal. The new edge set consists of the qn cross edges and binom(q,2) clique edges. Every triangle not wholly in H uses at least TWO new edges: a triangle with one universal vertex uses two cross edges; one with two universal vertices uses two cross edges and one clique edge; one with three universal vertices uses three clique edges.

Thus every edge-disjoint triangle packing in J contains at most nu(H) old triangles and at most half the number of new edges in new triangles. Also every triangle cover of J restricts to a triangle cover of H. Hence

    tau(J) >= b tau(G),
    2nu(J) <= 2b nu(G) + qn + binom(q,2),
    delta(J) >= b delta(G) - qn - binom(q,2).              (2)

If delta(G)>0, choose the incidence ratio D so that b delta(G)>qN+binom(q,2); this is possible by Section1, for example by taking D>(q+binom(q,2)+1)/delta(G). Since n<=N, equation(2) gives delta(J)>0.

Therefore any counterexample produces a counterexample with a prescribed fixed-size universal clique. This proves statement2=>statement1. The opposite implication is immediate.

## 4. Arbitrarily high FIXED minimum triangle codegree

The same J has every edge in at least q actual triangles. Each type is checked separately:

* An old edge xy of H has all q universal vertices as common neighbors.
* A cross edge ax with a in U and x in H has q-1 other universal common neighbors and every old neighbor of x. Since H has no isolated vertices, this is at least q.
* A clique edge aa' has all n old vertices and q-2 other universal vertices as common neighbors. The amplification is nonempty and has n>=2, so this count is at least q. When q=1 there are no edges of this type.

Thus a hypothetical counterexample yields one whose EVERY edge has triangle codegree at least any prescribed fixed q. It also has minimum degree at least q+1: every old vertex has an old neighbor and all q universal neighbors; universal vertices have n+q-1>=q+1 neighbors.

This proves statement3=>statement1, with its converse immediate. In particular the positive-defect graph can already be entirely inside an arbitrarily high fixed ordinary core of its high-codegree edge graph. A theorem localizing defect to a fixed codegree/core threshold remains valid and useful, but that threshold cannot by itself constitute a terminal class known to satisfy Tuza. This is a scope calibration, not a criticism of the reduction.

The quantifier FIXED q matters. No claim is made that the same construction preserves positive defect when q grows with n; the explicit budget qn in (2) must then be paid.

## 5. Universal vertex together with triangle-full minimum covers

Assume a Tuza counterexample exists. Choose one G with the minimum possible number of edges, deleting isolated vertices. Put k=nu(G). Every proper edge-deleted subgraph satisfies Tuza. For any actual triangle T,

    nu(G-E(T)) <= k-1,
    tau(G) <= tau(G-E(T))+3 <= 2(k-1)+3 = 2k+1.

Since G violates Tuza, all inequalities are tight. Thus tau(G)=2k+1 and tau(G-E(T))=tau(G)-3. A minimum cover of G-E(T), together with the three edges of T, is a minimum cover of G containing T. This is exactly TF. Every edge of G belongs to a triangle (otherwise it could be deleted without changing either parameter). Consequently every edge belongs to some minimum cover as well.

Construct the copied graph H from Section2. TF and edge-cover-criticality both pass to H by choosing minimum covers separately on its edge-disjoint triangle components/copies. Add one universal apex a, obtaining B=cone(H). For every old vertex v attach a private K5 along the edge av, with three fresh vertices belonging only to that attachment. Let W be the result. The vertex a remains universal, because it is adjacent to all old vertices and all newly attached vertices.

The selective K5-decoration identities are

    tau(W)=tau(H)+4n,
    nu(W)=nu(B)+2n.                                      (3)

Here is a complete reconstruction. Every new triangle lies wholly in its attached K5, since a fresh vertex has no neighbors outside that K5. The old H edges and the complete K5 edge sets partition E(W). Each K5 needs four cover edges; hence every W-cover costs at least tau(H)+4n. Choose a minimum H-cover and a minimum four-cover of each K5 containing its root av. This covers every old apex triangle auv as well, attaining the lower bound. For packing, each K5 contributes at most two triangles in addition to the old B triangles, while a maximum B-packing extends by two triangles in every K5 avoiding its root. This proves (3).

TF holds for W, checked by triangle type. For a triangle wholly in H, take a minimum H-cover containing it and use root-containing four-covers in all attachments. For an old apex triangle auv, take a minimum H-cover containing its rim edge uv, and again include all roots. For a triangle in one attached K5, choose a minimum four-cover there containing the full triangle (the triangle and the opposite edge give such a cover); choose root-containing four-covers in every other attachment, and any minimum H-cover. Even if the special attachment omits its root av, every old apex triangle through av has its other root selected. Thus this is still a global minimum cover containing the prescribed triangle. These types cover every actual W-triangle.

Finally, the one-apex case of (2) and (3) yield

    delta(W)=tau(H)-2nu(B) >= b delta(G)-n >0

when the incidence ratio is chosen sufficiently large. Therefore a counterexample exists with BOTH a universal vertex and TF. This proves the additional equivalence in the main statement.

No claim of two-edge packing resilience, no-WKE links, or retained minimality is made for W. In particular, the new universal vertex must not be silently retained after arbitrary criticalization.

## 6. Relation to the frozen amplification obstruction

The frozen TUZA-16 RouteC notes rule out the specified quadratic-density/integrality-transfer interfaces; they do not prohibit this construction. Here the copied triangle components remain exactly independent in edge resources, but their number only has to exceed an arbitrary fixed multiple of the total number of vertices. The apex overhead is linear in that vertex count. The proof claims no fixed positive quadratic copy density and no asymptotic equality to a fractional optimum.

A further immediate consequence is that an all-graph bound tau(G)<=2nu(G)+C|V(G)| for ANY absolute constant C would already imply unrestricted Tuza: apply it to the exact amplification H and take b/|V(H)|>C/delta(G). Thus a universal linear additive error cannot be viewed as an essentially weaker target. The classical o(n^2) asymptotic statement does not contradict this observation.

Verification scope: ordinary elementary counting and exact triangle-ownership arguments; classical Chebyshev and Markov inequalities only. No finite census, SAT certificate, Lean job, or novelty determination. The entire construction uses local mathematical reasoning; no external computation or publication occurs.
