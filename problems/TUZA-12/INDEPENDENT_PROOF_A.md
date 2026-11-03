# Independent proof reconstruction: A

**Initial independent verdict: VERIFIED_ORDINARY, with FINITE_CHECKED local ingredients.**

Both the base all-orders obstruction and the strengthening with connected full triangle-conflict graph survive this reconstruction. The proof is a finite probabilistic existence proof. No explicit enormous graph was enumerated, no simulation of its random scaffold was performed, and no Lean or independent kernel verification is claimed. Historical originality is outside this component audit.

## 1. Exact conventions and the two statements

For a finite simple graph G, let T(G) be the full family of three-vertex cliques. The actual-edge triangle incidence hypergraph has ground set E(G), with one three-edge hyperedge E(t) for every t in T(G). Its matching and transversal optima are denoted nu(G) and tau(G). A matching consists of pairwise edge-disjoint actual triangles; a transversal is an actual graph-edge set meeting every actual triangle.

Given a total vertex order pi, the ordered lift L_pi(G) has resources E(G) × {low, high, outer}. Every actual triangle a <_pi b <_pi c contributes exactly the resource triple

    {(ab, low), (bc, high), (ac, outer)}.

The values nu(L_pi(G)) and tau(L_pi(G)) refer to disjoint resource triples and resource transversals. Different roles of one actual edge are different resources. Isolated resources do not affect either optimum. For every hypergraph, tau >= nu: distinct members of a matching require distinct transversal resources.

The first statement is that a finite simple F exists for which every edge belongs to at most two triangles, every triangle-incidence component is the C9-square triangle system, and every total vertex order has a strict lifted gap. The second statement is that another finite simple G+ exists with connected full triangle-conflict graph X(G+) and the same all-orders strict lifted gap, while satisfying the ordinary Tuza inequality. The connected augmentation is **not** claimed to retain the first statement's at-most-two-triangles condition or its exact ordinary optima.

The source's conjectured mechanism required an order with both tau(L)=nu(L) and nu(L)<=2nu(G). A graph with no order satisfying the first condition refutes that mechanism regardless of the second condition. This does not refute Tuza or every possible use of an ordered lift.

## 2. The full C9-square block

Use cyclic labels 0,...,8, with an edge whenever cyclic distance is one or two. There are eighteen edges. To identify its full triangle family analytically, rotate any triangle to contain vertex 0. Its other two vertices must be in {1,2,7,8}. Among these four neighbors, the only pairs adjacent in C9-square are {1,2}, {1,8}, and {7,8}. Thus every triangle containing 0 is one of the three consecutive cyclic triples containing 0. Rotating gives exactly

    T_i = {i, i+1, i+2}, i modulo 9.

This is a full-closure argument, not a choice of nine useful triangles inside a larger family. The independent checker separately enumerates all 84 vertex triples and obtains precisely these nine.

Write e_i={i,i+1} for a distance-one edge, and f_i={i,i+2} for a distance-two edge. The edge e_i lies in exactly T_(i-1) and T_i. The edge f_i lies in exactly T_i. Two distinct block triangles share an actual edge if and only if their indices are consecutive modulo nine. The full triangle-conflict graph is therefore C9.

A packing corresponds exactly to an independent set in C9. If k vertices of a cycle are chosen independently, every chosen vertex has a distinct unchosen successor, so 2k<=9. The triangles T_0,T_2,T_4,T_6 give a packing of four. Hence nu(B)=4.

Every actual edge meets at most two of the nine triangles, so a cover has at least ceil(9/2)=5 edges. The edges e_0,e_2,e_4,e_6,e_8 cover all nine triangles: each T_i contains e_i and e_(i+1), and the complement {1,3,5,7} has no consecutive cyclic pair. Thus tau(B)=5. These explicit certificates are independently validated in the receipt.

## 3. Exactly 1296 sufficient order patterns

The classes C_j={j,j+3,j+6}, j=0,1,2, give a proper three-coloring of B, and every block triangle contains exactly one vertex from each class. Consider an order that places each class consecutively, in any permutation of the three classes, with arbitrary internal orders.

For any edge joining two classes, its role in a triangle is determined solely by the positions of those two classes among the three class blocks: first/second is low, second/third is high, and first/third is outer. Every triangle containing the edge has the remaining class as its third vertex. Consequently each actual edge has one fixed role across every incident triangle. Sending e to its unique active resource (e,role(e)) is a bijection from actual edges to non-isolated lift resources and preserves every triangle incidence. Thus for each of these orders the lift has exactly (nu,tau)=(4,5).

The class order has 3! choices and the three independent internal orders have (3!)^3 choices. Their concatenations are distinct, so the count is 3!(3!)^3=1296. Conditional on a fixed nine-element set in any fixed ambient order, a uniform bijection of the nine cyclic labels induces a uniform member of the 9! relative orders. Therefore the probability of this sufficient event is

    p = 1296/9! = 1/280.

This is not a count of every order with a lifted gap. The checker verifies all 1296 incidence isomorphisms, and independently solves their exact matching and cover problems. It also verifies the natural order 0<...<8 has (nu,tau)=(7,7), so one copy of B alone does not refute the existential-order target.

## 4. Probability space and simultaneous quantifiers

Set N=2^96 and M=2^128. The probability space consists of M independent random injections from the nine cyclic labels into [N]. Equivalently, for each block index i choose a uniform nine-element set S_i, then independently choose a uniform bijection from labels to S_i. Blocks are indexed objects: two samples with identical vertex sets are still different samples at this stage. No graph union or duplicate-identification is performed before deletion.

Fix one total order sigma on [N]. Let I_(i,sigma) indicate that block i has consecutive color classes in its relative sigma order. Conditional on **any** S_i, the independent uniform labelling gives probability p=1/280. The entire samples are independent across i, so the indicators are independent across i, even though the vertex sets may overlap. Thus X_sigma=sum_i I_(i,sigma) has Binomial(M,p) distribution.

There is no assertion that X_sigma and X_rho for distinct total orders are independent. None is needed. First prove a fixed-order failure bound; then take a union over the finite set of all N! orders. Only afterward choose a single realization. This order of quantifiers yields

    there exists one sampled scaffold such that every total order has many bad blocks,

rather than the weaker statement allowing the scaffold to depend on the order.

For completeness, the stated Chernoff estimate has a direct elementary derivation. Let mu=Mp. By Markov applied to exp(-X_sigma/2),

    P[X_sigma < mu/2]
      <= exp(mu/4) E[exp(-X_sigma/2)]
       = exp(mu/4) (1-p+p exp(-1/2))^M.

Since exp(1/2)>1+1/2+1/8=13/8>8/5, we have exp(-1/2)<5/8. Using 1-u<=exp(-u), the last expression is at most

    exp(mu/4) exp(-3Mp/8) = exp(-mu/8).

Here mu/2=M/560 and mu/8=M/2240. The union-bound failure probability is therefore at most N! exp(-M/2240).

All numerical estimates can be certified without floating point. Since log 2<1,

    log(N!) <= N log N = 96N log 2 < 96N < 2^103.

Also M/2240>2^116 because 4096>2240. Hence

    log(N!) - M/2240 < 2^103 - 2^116 < -2^115.

Finally exp(3)>1+3+9/2>8 and 2^115>3, so exp(-2^115)<1/8. With probability greater than 7/8, **every** total order has at least M/560 sufficiently bad block indices. The rational threshold need not be an integer: the displayed inequalities are inequalities between an integer count and a rational number.

## 5. Defect counting, including duplicate sets and repeated witnesses

Let D_2 count unordered pairs of distinct block indices with |S_i intersection S_j|>=2. For one fixed first block, there are 36 pairs of vertices that could be contained in a second block. A uniform nine-set contains a fixed pair with probability

    q = C(N-2,7)/C(N,9) = 72/[N(N-1)].

A union bound gives probability at most 36q=2592/[N(N-1)]. Thus

    E[D_2] <= C(M,2) 2592/[N(N-1)]
            <= 2592 M^2/N^2.

For the last step use C(M,2)<=M^2/2 and N/[2(N-1)]<=1. Identical sampled nine-sets are included in this count; they are not exempt or presumed improbable enough to ignore.

For D_3, fix an unordered triple of distinct block indices and write its indices in canonical increasing order i<j<k. It is defective if there exist three distinct vertices x,y,z with

    x in S_i intersection S_j,
    y in S_j intersection S_k,
    z in S_k intersection S_i.

For each ordered witness (x,y,z), the three independent blocks must contain respectively {x,z}, {x,y}, and {y,z}. Its probability is q^3. There are (N)_3=N(N-1)(N-2) ordered distinct witnesses, so the triple's defect probability is at most (N)_3 q^3. No extra factor of six is missing: the block order was fixed, and every Berge triangle has a witness for that canonical block order by assigning the vertex from each of its three pair intersections. A triple with several witnesses is counted once in D_3 but may be counted several times by the upper bound, which is harmless.

It follows that

    E[D_3] <= C(M,3) (N)_3 q^3
            <= 124416 M^3/N^3.

Indeed 72^3=373248 and

    (N)_3 q^3 = 373248 (N-2)/[N^2(N-1)^2]
              <= 746496/N^3,

because N(N-2)<=2(N-1)^2. Multiplying by C(M,3)<=M^3/6 yields the stated coefficient 124416. The bound is deliberately loose; there is no need to sharpen the source's constants.

Let D=D_2+D_3. Using M/N=2^32,

    E[D] <= 2592*2^64 + 124416*2^96
          = 9857251067422525786677419282792448
          < 2^114.

Put delta=M/1120. Since 2048>1120, delta>2^117. Markov gives

    P[D>=delta] <= E[D]/delta < 1/8.

The exact rational checker obtains the stronger coarse-bound ratio

    (2592*2^64 + 124416*2^96)/delta
      = 584459149642515 / 18014398509481984 < 1/8.

No independence between the order event and the low-defect event is asserted. Their failure probabilities sum to less than 1/4, so the desired conjunction has positive probability (in fact greater than 3/4). Fix one realization satisfying both.

## 6. One deletion, valid for every order

For every defective indexed pair and every defective indexed triple in this fixed realization, choose one member to delete; for example choose the least block index in that configuration. Delete the union R of the chosen indices. Its cardinality d is at most the number D of configurations, even when one block is chosen repeatedly. Any original bad configuration contains a chosen member, so none survives. Removing indices cannot create a new pair intersection or a new Berge-triangle witness among remaining blocks.

Thus the surviving nine-set system is linear (any two distinct surviving sets meet in at most one vertex) and Berge-triangle-free. In particular duplicate nine-sets cannot both survive. This deletion is one fixed operation on the scaffold and is not chosen separately for each order.

For each sigma, at most d bad blocks were deleted, so the surviving bad-block count b_sigma satisfies

    b_sigma >= M/560 - d > M/560 - M/1120 = delta.

The statement holds simultaneously for all sigma because the original bound did and the same d bounds the number lost for each. Let r=M-d be the number of surviving blocks; then r>M-delta>M/2.

## 7. Full triangle closure and additive optima

Put the labelled C9-square edges on every surviving block and take their simple graph union F, retaining all N ambient vertices, including isolated vertices if any. Linearity makes the blocks' actual edge sets pairwise disjoint: a common edge would give two common vertices.

Consider an arbitrary actual triangle xyz of F. Assign each of its three edges to its unique source block.

* If exactly two source blocks appear, one contains two edges of the triangle and hence contains x,y,z. The other contains the endpoints of the remaining edge, giving an intersection of at least two vertices. This contradicts linearity.
* If three source blocks appear, the three distinct triangle vertices give a Berge-triangle witness among those three blocks. This contradicts the deletion outcome.
* Therefore all three edges have the same source block. Since the block's graph is exactly C9-square, the triangle is one of its nine consecutive triples.

Conversely each block triangle survives as an actual triangle. The full actual triangle family is therefore exactly the union of the block families. Each edge lies in at most two triangles; the triangle-incidence components are the block systems. Blocks can share original graph vertices, but their triangle resources are actual edges and are disjoint.

For hypergraphs on disjoint ground sets, matching numbers add: any global matching restricts to a matching in each component, and component optima can be united. Cover numbers add by the same two directions: restricting a cover to each ground set gives a cover of that component; unioning optimal component covers gives a global cover. Thus

    nu(F)=4r,    tau(F)=5r.

For any sigma, the resource sets E(B_i)×{low,high,outer} are also disjoint. Full triangle closure says the lift is precisely the disjoint union of the block lifts, so both lifted optima add as well. Every block contributes nonnegative tau-minus-nu by weak duality, and each sufficiently bad block contributes exactly one. Consequently

    tau(L_sigma(F)) - nu(L_sigma(F)) >= b_sigma > delta > 0

for every total order sigma on the N vertices. This is the strict quantitative gap required for the connected strengthening, not merely existence of one bad block. The ordinary values give tau(F)=5r<=8r=2nu(F).

## 8. Connected full-conflict strengthening

Choose any old vertex v and add all missing star edges vx to the old graph. This adds at most N-1 actual edges and produces a connected base graph J on all N vertices, including formerly isolated vertices. Add a new vertex z adjacent to all N base vertices. Denote the final graph by G+ and the set of all newly added actual edges by A. Its cardinality a satisfies

    a <= (N-1)+N = 2N-1.

Fix an arbitrary total order pi on V(G+), and let sigma be its restriction to the old vertex set. Relative orders among the vertices of any old F triangle have not changed. Its three actual edges and their roles are therefore exactly those in L_sigma(F). The old lift occurs as a subhypergraph on the same old resources.

A cover of L_pi(G+) restricted to old resources still covers every old triangle, because added-edge resources occur in no old triangle. Hence

    tau(L_pi(G+)) >= tau(L_sigma(F)).

Every actual G+ triangle absent from F contains an edge of A; if all three edges were old, the full-family convention would already make it a triangle of F. In any matching of L_pi(G+), partition the matched hyperedges into old and new triangles. The old part has at most nu(L_sigma(F)) members. Choose one added-edge role resource in each new member. Distinct matching hyperedges use disjoint resources, so the choices give an injection from the new members into A×{low,high,outer}. Therefore the new part has at most 3a members and

    nu(L_pi(G+)) <= nu(L_sigma(F)) + 3a.

This argument counts resources, not actual added edges; three different roles of one added edge could occur in a lifted matching. Subtracting the two inequalities yields

    tau(L_pi(G+)) - nu(L_pi(G+)) > delta - 3a.

Now delta>6N is equivalent to 2^32>6720, which is true, while 3a<=6N-3<6N. Hence the last gap is positive for every enlarged order, regardless of the position of the apex.

For connectedness of the **full** triangle-conflict graph, first consider all apex triangles zxy, one for each actual edge xy of J. Two such triangles share an actual graph edge exactly when the two corresponding base edges share an endpoint: their common edge is then the corresponding apex spoke. Thus their induced conflict graph is L(J). A connected graph J with at least one edge has connected line graph; an endpoint-to-endpoint path in J produces a chain of incident edges between any two edges. Here J has N>1 vertices and is connected, so this applies. Every triangle contained entirely in J shares any chosen one of its base edges xy with the apex triangle zxy. Every G+ triangle is either an apex triangle or a base triangle. Thus all actual triangles, including triangles created by the connecting star, belong to one connected conflict graph.

Finally there is a direct ordinary Tuza certificate. In each old block retain the four exhibited packed triangles; their union is an actual packing of size 4r in G+. Retain the five exhibited covering edges in each block and add every edge of A. Old triangles are covered by their block covers; every newly created triangle has an edge of A. This is a full actual graph-edge cover of size 5r+a. Since

    r > M-delta > M/2,    a < 2N,    2N < 3(M-delta) < 3r,

we have a<=3r and

    tau(G+) <= 5r+a <= 8r <= 2nu(G+).

The source's looser route via 2N<3M/2 gives the same conclusion. No equality for either enlarged optimum is claimed. The construction proves ordinary Tuza for this particular graph while refuting the proposed order-dependent equality mechanism.

## 9. Independent computation and controls

`checks/check_a.py` is freshly written standard-library Python. It imports no author or reviewer solver and does not execute historical scripts. Its exact optimum procedures use exhaustive combinatorial recurrences: for packing, include or exclude one triangle and delete its resource-conflict neighborhood when included; for covering, branch over the three resources of an uncovered triangle. The returned witnesses are separately checked directly against the full hypergraph. These recurrences exhaust all possibilities and use only integer set/bit operations.

The successful receipt `evidence/check_a.json` records:

* all eighteen C9-square edges and all nine actual triangles;
* exact ordinary optima (4,5), packing and covering witnesses, edge multiplicities and the C9 conflict graph;
* all 1296 sufficient orders, all actual-edge-to-role-resource incidence isomorphisms, and exact lifted values (4,5) for each;
* the natural-order (7,7) negative control;
* twenty exact integer/rational checks covering inclusion probabilities, every displayed constant, Chernoff arithmetic, the order union bound, Markov, surviving block counts, the apex gap and ordinary certificate allowance;
* a two-block assembly sharing one vertex, plus an isolated ambient vertex: exactly eighteen triangles and ordinary optima (8,10); after star/apex augmentation, all 85 actual triangles are enumerated, the full conflict graph is connected, every new triangle uses an added edge, and the old lift is unchanged in 38 insertion/reversal order controls;
* a three-block, pairwise-linear Berge-triangle negative control: twenty-seven block triangles but twenty-eight full graph triangles, with the extra triangle {0,1,2}. This confirms that the Berge-triangle deletion serves a real closure obligation beyond linearity alone.

The small augmented control is used only to check closure, coverage, connectivity and resource restriction; its number of blocks is too small for the enormous-construction slack inequalities, and it is not presented as a separate all-orders counterexample or as a Tuza proof via that particular cover.

The finite tests do not establish the global quantifier; Sections 4–8 do. No complete enumeration of all 9! block orders is needed or claimed. No large construction, remote compute, mathematical package installation, literature-priority conclusion, new conjecture investigation, or formalization is part of this audit.

Reproduction command (all output stays inside the new workspace):

Publication adapter: from the repository root, use a new output directory.
The original private launcher is replaced here; mathematical arguments and
historical result counts are unchanged.

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```
