# Quantitative triangle-local amplification and sublinear universal-clique normalization

Frozen ordinary proof candidate, 2026-11-15. Producer: global_routes, independently reconstructing the root's quantitative proposal. No Lean, no graph census, and no original-construction claim. The classical incidence input is attributed below; the deductions for integral triangle packing and covering are stated separately. The original mission cutoff remains 09:23:58Z.

## 1. Statements and unrestricted implication

Write nu(G) for the maximum number of edge-disjoint actual triangles, tau(G) for the minimum number of graph edges meeting every actual triangle, and delta(G)=tau(G)-2nu(G).

**Theorem A (power-saving additive equivalence).** Fix any epsilon in (0,2). If constants C and n0 exist such that every finite simple graph G with n>=n0 vertices satisfies

    tau(G) <= 2nu(G) + C n^(2-epsilon),

then unrestricted Tuza holds. The converse is immediate (C=0). Constants are uniform over graphs; they may depend on the fixed epsilon.

**Theorem B (growing universal-clique equivalence).** For each fixed epsilon in (0,1), unrestricted Tuza is equivalent to its restriction to graphs G of order n having at least n^(1-epsilon) universal vertices.

**Theorem C (growing triangle-codegree equivalence).** For each fixed epsilon in (0,1), unrestricted Tuza is equivalent to its restriction to graphs G of order n in which every edge belongs to at least n^(1-epsilon) actual triangles. The counterexample transfer used below simultaneously has the universal vertices in Theorem B and this codegree property.

These statements do not settle Tuza. Their precise use is to turn any proposed uniform fixed-power additive improvement, or a proof on the specified normalized class, into a proof for arbitrary graphs. No triangle-full-cover (TF), packing resilience, or edge-minimality is asserted for the transformed graph.

## 2. Classical incidence input, with explicit parameters

For each fixed r>=3 there is an unbounded sequence of integers N and linear r-uniform hypergraphs on at most N vertices, with no Berge triangle, having

    b >= N^2 exp(-C_r sqrt(log N))

hyperedges, after enlarging a constant C_r. This is the classical Behrend/Erdos-Frankl-Rodl construction. A Berge triangle means three distinct hyperedges meeting cyclically at three distinct vertices. The following parameter reconstruction makes the bound and exact needed incidence properties explicit.

Take an integer d tending to infinity, set D=2^d, B=2rD, and M=B^d. Among the D^d vectors in {0,...,D-1}^d, one squared-norm level contains at least

    D^d / (d(D-1)^2+1)

vectors. Encode that level in base B to obtain A subset {0,...,M-1}. If positive integers u,v satisfy u+v<=r and

    u a + v b = (u+v)c,    a,b,c in A,

each base-B digit on either side is smaller than B, so there are no carries. The corresponding vectors x,y,z satisfy u x+v y=(u+v)z. Their common squared norm gives

    u||x-z||^2 + v||y-z||^2
      = u||x||^2 + v||y||^2 - (u+v)||z||^2 = 0.

Thus x=y=z and a=b=c. Moreover

    log M = d^2 log 2 + d log(2r),
    |A|/M >= (2r)^(-d) / (d(D-1)^2+1),

so |A| >= M exp(-C'_r sqrt(log M)) along this sequence.

Use r disjoint parts indexed i=0,...,r-1, each with coordinates 1,...,rM. For x in {1,...,M} and a in A put

    E(x,a) = {(i,x+i a): 0<=i<r}.

The ambient vertex count is N=r^2 M and the number of distinct hyperedges is b=M|A|. All coordinates are in the stated interval. Parts 0 and 1 recover x and a, so the edges are distinct. Two common vertices in different parts would force equal slopes and then equal initial coordinates; hence the hypergraph is linear.

For completeness, a Berge triangle has its three intersection vertices in distinct parts: two intersections in the same part of one hyperedge would be the same vertex. Suppose its three edges have parameters (x,a),(y,b),(z,c), and intersections occur respectively in parts i,j,k. Summing the three intersection equalities yields

    (i-k)a + (j-i)b + (k-j)c = 0.

The nonzero coefficients sum to zero. Isolating the term with its sign occurring once expresses one slope as a weighted average of the other two, with positive integer weights whose sum is at most r-1. The property of A forces a=b=c, and the intersection equations then force x=y=z. This contradicts three distinct hyperedges. Thus there is no Berge triangle.

Absorbing the fixed factor r^4 and the shift between log M and log N into C_r proves the claimed b bound. In particular, for every fixed eta>0,

    b / N^(2-eta) --> infinity.

Only an unbounded explicit sequence is needed in the applications. No assertion of these exact parameters for every integer N is required.

## 3. Exact integral copy amplification

Fix any finite simple graph G with r>=3 vertices and no isolated vertices. Put one role-labelled copy of G on every hyperedge of the incidence system, using its r parts for the roles, and let H be the union. Delete unused ambient vertices. Let n_H=|V(H)|.

Linearity ensures that distinct copies share at most one vertex, so their graph-edge sets are disjoint. Every actual triangle of H lies in one copy. Indeed, if two edges of an actual triangle have the same owner, their three endpoints lie in that copy; a different owner for the third edge would violate linearity. If the three owners are different, those owners and the three triangle vertices form a Berge triangle. Both alternatives to a single owner are impossible.

Consequently the integral parameters add exactly:

    tau(H)=b tau(G),    nu(H)=b nu(G),    delta(H)=b delta(G).

These equalities count every actual triangle, including potential interface triangles, which the preceding argument excludes. They are not merely fractional or asymptotic identities.

For any fixed a in A, the M choices of x occupy M distinct vertices in each of the r parts. Because G has no isolated vertices, these vertices are nonisolated in H. Therefore

    N/r = rM <= n_H <= N,

so n_H tends to infinity and is of order N for fixed G.

To prove Theorem A, suppose G is a counterexample and remove its isolated vertices. Then delta(G)>0 is fixed. The assumed additive estimate applied to H gives

    b delta(G) <= C n_H^(2-epsilon) <= C N^(2-epsilon).

This contradicts the last limit in Section 2. Hence no counterexample exists.

## 4. Adding a growing universal clique

Fix epsilon in (0,1) and a hypothetical counterexample G as above. For each amplifier H with ambient parameter N, set

    q = ceil((2N)^(1-epsilon)),    J = K_q join H.

For all sufficiently large N, q<=N and n_J=n_H+q<=2N. The q added vertices are universal, and

    q >= n_J^(1-epsilon).

There are

    L = q n_H + binom(q,2)

new edges. Any triangle of J that is not an old triangle of H uses at least two new edges: a triangle with one apex uses two cross edges, one with two apices also uses two cross edges, and one wholly in the clique uses three new edges. Thus every packing of J has at most nu(H) old triangles and at most L/2 other triangles. Restriction of a triangle cover of J to E(H) still covers all old triangles. It follows that

    tau(J) >= tau(H),
    nu(J) <= nu(H) + L/2,
    delta(J) >= b delta(G) - L.

Since q=O(N^(1-epsilon)),

    L = O(N^(2-epsilon)) = o(b).

Therefore delta(J)>0 for sufficiently large N. J is a counterexample satisfying Theorem B's universal-vertex condition. This proves the nontrivial direction of Theorem B; the converse is restriction.

All edge types of J have triangle codegree at least q. An old edge has all q apices as common neighbors. A cross edge av has q-1 other apices plus deg_H(v)>=1 old common neighbors. An apex-clique edge has n_H+q-2 common neighbors, at least q because n_H>=2. Thus Theorem C follows from the same construction. The graph J is also connected, although connectedness is not needed for either statement.

## 5. Scope, attribution, and what remains unavailable

The incidence construction is classical, not a discovery of this mission. The equal-norm digit construction originates in F. A. Behrend, *On Sets of Integers Which Contain No Three Terms in Arithmetical Progression*, PNAS32(12)(1946),331-332, DOI10.1073/pnas.32.12.331. The bounded-weight equation and arithmetic-progression hyperedges used here appear in P. Erdos, P. Frankl and V. Rodl, *The Asymptotic Number of Graphs not Containing a Fixed Subgraph and a Problem for Hypergraphs Having No Exponent*, Graphs and Combinatorics2(1986),113-121, Theorem1.7 and Section5 Lemma5.1, DOI10.1007/BF01788085.

Primary EFR PDF: https://www.renyi.hu/~p_erdos/1986-17.pdf . The exact source was independently checked by packing_critic and saved at sources/efr_power_saving/erdos_frankl_rodl_1986.pdf, SHA25681e2c6b4b8fd3378bc7139f90ce64b2aa0bf8d3dac5bcef470dcfcf4ff6f5ba9. Primary Behrend article: https://pmc.ncbi.nlm.nih.gov/articles/PMC1078964/ . No originality claim is made for Theorems A-C without further prior-art investigation.

This addendum strengthens the fixed-ratio amplification and fixed-q normalization in notes/global_routes_universal_clique_reduction.md, whose frozen proof and hash remain unchanged. It does not assert resilience under joining a clique; notes/global_routes_universal_join_saturation.md already disproves a uniform preservation claim. It does not assert linear-in-n many universal vertices, nor a positive quadratic density of independent copies.

The construction has b=N^(2-o(1)), but b/N^2 tends to zero along these explicit parameters. Thus it does not contradict the earlier quadratic-density washing obstruction. The method absorbs every fixed power-saving additive error. It cannot automatically absorb an unspecified o(n^2) error: for example, N^2/log N is larger than the displayed lower scale N^2 exp(-C sqrt(log N)) for any fixed C>0. This comparison limits this argument; it is not a claim that an o(n^2) theorem logically cannot imply exact Tuza by some other argument.

The unresolved step is still a proof on one of the equivalent classes, or an actual counterexample. No such proof or counterexample is supplied here. Verification at freeze: independent parameter reconstruction by global_routes and root, primary-source audit by packing_critic; a fresh audit of this complete frozen Tuza deduction is requested separately. No computational, SAT, or Lean certificate is needed for the asymptotic statements.
