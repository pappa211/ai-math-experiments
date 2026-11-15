# Exact clique and link packing polytopes still fail to synchronize

Status: complete ordinary obstruction with literal fixed-graph certificates. Fresh independent review is requested. No Tuza counterexample, cover inequality, higher-moment hierarchy claim, novelty claim, or Lean verification is asserted.

## 1. Exact relaxation and global role

For a finite simple graph G, let T(G) be all its actual triangles. For any subfamily F of T(G), write P(F) for the convex hull of the incidence vectors of edge-disjoint triangle subfamilies contained in F. For a vertex v, let T_v be the triangles containing v. For an induced complete subgraph Q, let T(Q) be its internal triangles. Define

    L_cl(G)={x>=0 : x|T_v belongs to P(T_v) for every vertex v,
                    x|T(Q) belongs to P(T(Q)) for every clique Q},
    rho_cl(G)=max {sum_T x_T : x in L_cl(G)}.

The first constraints are the FULL matching polytopes of the vertex links, including all their valid inequalities. The second constraints are the FULL triangle-packing polytopes of every induced complete subgraph, not just the cardinality inequalities sum_(T subset Q)x_T<=nu(Q). Thus the obstruction below also defeats the weaker system adding only those cardinality inequalities.

Every actual global packing is feasible, so rho_cl>=nu. A proposed Tuza route might try to combine a cover inequality tau<=2rho_cl with synchronization floor(rho_cl)<=nu. No such cover inequality is proved here. The synchronization step is false even for TF, two-edge-packing-resilient graphs whose every link component is non-WKE.

**Fixed control.** Let G be K_(2,2,2,2,2), the ten-vertex complete multipartite graph with five twin pairs. Then

    nu(G)=12, tau(G)=16, rho_cl(G)=40/3.

G is TF and two-edge packing resilient; every vertex link is connected and non-WKE. Therefore floor(rho_cl)=13>12. The witness is x_T=1/6 on every actual triangle.

**Amplified obstruction.** For every C>=0 there are graphs with all the same structural properties and rho_cl>nu+C|V|. More strongly, for each fixed epsilon in (0,2) and C>=0 there are arbitrarily large such graphs with

    rho_cl > nu+C |V|^(2-epsilon).

These are failures of packing synchronization, not failures of Tuza: the constructed graphs have tau=16b and nu=12b, hence substantial slack in tau<=2nu.

## 2. The fixed graph and exact packing number

Label the vertices 0,...,9; pair 2i with 2i+1 for i=0,...,4. Distinct vertices are adjacent exactly when they are in different pairs. There are40 edges and80 triangles. Every vertex has degree8; every edge belongs to6 triangles. Every clique has at most5 vertices, one from each pair.

Any triangle packing has at most13 triangles by edge count. A13-packing would leave one edge uncovered. Removing edge-disjoint triangles preserves each vertex degree modulo2, whereas one remaining edge has two odd endpoints. Hence nu<=12.

The following three explicit12-packings leave the displayed four-cycles. A string abc denotes the triangle on a,b,c; the labels here are single digits.

* Leave cycle 0-2-1-3-0, with pair pattern2+2:
  046,058,079,147,168,159,248,257,269,349,356,378.
* Leave cycle 0-2-1-4-0, with pair pattern2+1+1:
  036,058,079,156,139,178,357,259,247,268,348,469.
* Leave cycle 0-2-4-6-0, with pair pattern1+1+1+1:
  034,058,079,149,478,127,268,138,156,259,357,369.

Every listed triangle is actual, and the36 used edges in each row are distinct. Literal checking gives the claimed leave. In particular nu=12.

## 3. All two-edge deletions preserve12

Every actual four-cycle has exactly one of the three pair patterns above. Repeated vertices from a pair must occupy opposite positions; no pair can occur more than twice. Permuting the five pairs and swapping the two vertices within any pair maps the corresponding displayed cycle onto any cycle of its pattern. Transporting its packing gives a maximum packing whose leave is that prescribed cycle.

Every pair of distinct graph edges lies in an actual four-cycle. For adjacent edges u-v and v-w, choose a fourth vertex x from a pair different from the pairs of u,v,w; at most three of five pairs are excluded. Then u-v-w-x-u is a cycle. For disjoint edges uv and xy, at least one of the two cross pairings {ux,vy} or {uy,vx} is present. If both failed, selecting one same-pair obstruction from each would force either u,v or x,y to belong to the same pair, contrary to their being edges. The valid cross pairing closes the desired cycle.

Choose a maximum packing leaving such a cycle. It avoids the given two edges. Hence nu(G-D)=12 for every |D|<=2. This is actual two-edge packing resilience, not merely a state-count or parity heuristic.

The fixed checker independently verifies all370 actual four-cycles under the displayed automorphism action and explicitly associates all780 edge pairs to a certified leave. The all-size conclusion here uses the ordinary three-pattern argument, not an inferred census pattern.

## 4. Exact cover number and TF

A triangle-free ten-vertex graph has at most25 edges by the elementary Mantel degree-sum argument. Equality forces the complete bipartite graph K_(5,5): Cauchy equality makes every degree5, and the two independent neighborhoods of any edge partition the ten vertices. A K_(5,5) cannot be a subgraph of G, because each of the five missing twin edges would have to lie within a bipartition class; both classes would then have even size, contradicting size5. Thus at most24 graph edges can remain after a triangle cover is deleted, and tau(G)>=40-24=16.

Putting two whole twin pairs on one side and the other three on the other side gives a4-by6 cut containing24 graph edges. Its complement is a16-edge triangle cover, proving tau=16.

Any actual triangle uses three distinct twin pairs. Put those three entire pairs on the6-vertex side of this cut. All three triangle edges belong to the16-edge cover. This proves TF, and also puts every edge in some minimum cover. These covers are odd on every triangle. In fact pi=tau=16, if pi denotes the minimum odd triangle cover; no parity-cover obstruction is claimed.

## 5. Full link and clique feasibility

Fix v. Its link is K_(2,2,2,2) on the other four pairs, with24 edges. There are six perfect matchings whose edges partition this link: first take the three perfect matchings of the four pair-labels; for each one, take the two simultaneous straight/cross matchings between its paired two-element parts. Each of these six ordinary matchings has four edges. The uniform distribution on them gives every link edge marginal1/6. Adjoining v to the matching edges produces an edge-disjoint triangle family in T_v. Thus the uniform triangle vector belongs to the full polytope P(T_v), with an explicit six-state distribution, for every v.

Now let Q be a clique of size s. For s<=2 there is no triangle constraint. For s=3,4,5 the maximum packing sizes are respectively1,1,2: a single triangle suffices for the first two, and012,034 is a2-packing in K5, matching its edge-count upper bound. Uniformly permuting one such maximum packing makes each of the binom(s,3) triangles have marginal nu(K_s)/binom(s,3). Mix this distribution with the empty packing, using nonempty probability

    lambda_s=binom(s,3)/(6nu(K_s)).

The three values are1/6,2/3,5/6, all at most1. The resulting marginal is exactly1/6 for every clique triangle. Hence the vector belongs to the FULL P(T(Q)) for every clique, irrespective of its description by inequalities.

The common vector therefore belongs to L_cl, and has objective80/6=40/3. Conversely, each graph-edge capacity inequality follows from either endpoint's star polytope. Summing over40 edges gives3sum_T x_T<=40. Thus rho_cl=40/3 exactly.

The separate local distributions are not a common global distribution. Their failure to synchronize is the result proved here; no joint-moment consistency is claimed.

## 6. Every link is non-WKE

For clarity, a graph L is WKE if some matching M and some vertex cover Q of L-M satisfy |Q|<=|M|. Here L=K_(2,2,2,2).

Deleting a matching cannot create an independent triple in L. A triple in three parts originally spans three edges, which cannot all be a matching. A triple in two parts spans two edges with a common endpoint, which again cannot both be deleted by a matching. A triple in one part is impossible. Consequently every vertex cover of L-M has at least8-2=6 vertices, while every matching M has at most4 edges. Thus every link is connected and non-WKE.

This uses the full quantifier over all matchings, rather than only over the six matchings used for the marginal certificate.

## 7. Amplification preserves the complete strengthened system

Use the accepted linear, Berge-triangle-free incidence construction to place b copies of this fixed G on an ambient N-vertex set, and discard unused isolates. Call the union H. All actual triangles and all edges are copy-local, and copies are induced. Therefore

    nu(H)=12b, tau(H)=16b, |E(H)|=40b.

TF passes by taking a containing minimum cover in the specified triangle's block. Two-edge resilience passes by choosing resilient maximum packings separately in every affected block; at most two edges were deleted in total. Every H-link is a disjoint union of the corresponding K_(2,2,2,2) links, so each connected component is non-WKE.

Give every copied triangle weight1/6. At any vertex, the independent product of the six-state distributions in its incident copies is an actual matching distribution on its full link. Therefore all full vertex-star constraints hold.

Every clique of size at least3 lies in one copy. Choose three of its vertices; their triangle has one owner. Any further vertex makes a triangle with two of them, sharing an owned graph edge, so that triangle has the same owner and the further vertex lies in the copy. Cliques of size at most2 have no triangle coordinates. Thus all full clique packing polytopes also hold, using the same local mixtures from Section5. There is no newly created cross-copy clique constraint.

The edge-capacity sum gives the matching upper bound on the relaxation, so

    rho_cl(H)=40b/3, rho_cl(H)-nu(H)=4b/3.

The fixed-ratio incidence lemma allows b/N arbitrarily large, proving the linear-additive obstruction. For a fixed power-saving error, the classical quantitative construction in notes/global_routes_quantitative_amplification.md gives an unbounded sequence with

    b>=N^2 exp(-C_10 sqrt(log N)).

For each fixed epsilon in(0,2), b/N^(2-epsilon) tends to infinity. Since |V(H)|<=N, the stated amplified obstruction follows. No claim about absorbing an unspecified o(N^2) error is needed.

The incidence construction is classical Behrend/Erdos-Frankl-Rodl, with primary attribution and independent review in the quantitative note and review/efr_power_saving_source_audit.md. There is no new incidence-existence or originality claim here.

## 8. Evidence, decision, and exact limits

Checker: checks/global_routes_clique_link_control.py. Evidence: evidence/global_routes/clique_link_control.json. Reproduction on the authorized Mac:

    source LOCAL_ENVIRONMENT
    python3 checks/global_routes_clique_link_control.py

The three packings were initially found by a tiny exact-cover backtracking construction, each requiring13 recursive nodes; only the resulting literal positive certificates are used in the frozen proof. The retained checker imports only the standard library and no producer mathematics code. It verifies all actual edges and triangles, the three12-packings, all370 cycle images, all780 two-edge deletion certificates, all80 TF cover witnesses, all ten six-state link distributions, and the exact rational clique mixtures for sizes3,4,5. No solver UNSAT result or exhaustive graph search is used. Upper bounds and the all-size amplification are ordinary mathematical arguments. Fresh independent review is separate and pending at freeze.

Decision: the exact clique-plus-link synchronization gate is refuted, including under TF, two-edge resilience, and non-WKE link components. Adding all clique packing inequalities to exact link matching polytopes does not repair the earlier bounded-star obstruction. This result does not assert that adding larger vertex-union stars together with all clique polytopes also fails; that is a different hierarchy. It makes no statement about semidefinite or higher-order moment systems, global parity/leave inequalities, or arbitrary weighted packing polytopes.

The controls have large cover slack, tau=16b<24b=2nu. A direct rounding/cover proof that uses that slack is not excluded. In particular, the obstruction only closes the specified synchronization step; it proves neither a counterexample to Tuza nor impossibility of a different global argument.

All computation was local on Darwin. No Lean process was run. Original mission start01:53:58Z, research cutoff09:23:58Z, hard deadline09:53:58Z on2026-11-15 remain unchanged.
