> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# A short credited proof of the 5-degenerate inequality

This ordinary proof reconstructs the shorter inequality route explicitly. It establishes only tau(G) <= 2 nu(G); the equality classification requires the further arguments in THEOREMS_AND_PROOFS_REVISED.md. No Lean verification is claimed by this document.

Throughout, all triangles of the graph are used, packings are edge-disjoint, and covers consist of graph edges. Every graph is finite and simple. Background edges in no triangle are permitted.

## Published inputs and exact scope

Puleo, [arXiv:1308.2211v3](https://arxiv.org/pdf/1308.2211v3), Definition 2.1 and Lemma 2.2, supplies the reducible-set framework. Lemma 2.6 gives robustness for a minimal inequality counterexample. In a robust graph with no reducible set, Lemma 2.7(a),(b), equivalently Propositions 5.1 and 5.2, implies that degree-five links are K5 or K5 minus one edge, and vertices of degree at most six form an independent set. Here robustness means that every component of every vertex link has at least five vertices. Complements in Proposition 5.1 are essential; plain PDF text extraction can lose their overbars.

Botler–Fernandes–Gutierrez, [arXiv:2002.07925v2](https://arxiv.org/pdf/2002.07925v2), Lemma 3.3, applies to irreducible robust graphs. For two degree-five vertices with at least three common neighbors it forces exactly three common neighbors and both links K5. This is the published antecedent used below. Their theorem concerns treewidth; it is this local lemma that is used here.

## Reduction accounting

A nonempty vertex set U is reducible if there are r edge-disjoint triangles P and a graph-edge set X, with |X| <= 2r, such that X hits every triangle incident with U and contains all P-edges with both ends outside U. Put K=(G-X)-U. Any packing of K combines with P, and any K-cover combines with X to cover G. Therefore

    nu(G) >= nu(K)+r,
    tau(G) <= tau(K)+|X| <= 2nu(K)+2r <= 2nu(G)

whenever tau(K) <= 2nu(K). The balance |X|=2r is sufficient; no strict saving is required for the inequality.

Assume for a contradiction that a 5-degenerate counterexample exists. Choose one with the fewest edges, discard isolated vertices, and, if necessary, minimize the number of vertices among equal edge counts. Every proper subgraph satisfies the inequality: it is still 5-degenerate. Hence the published robustness lemma applies, and no reducible vertex set exists. Denote this graph by G. Robustness gives minimum degree at least five. The published low-degree facts above give:

- every degree-five vertex has link K5 or K5 minus one edge;
- degree-five vertices are independent and all their neighbors have degree at least seven;
- two degree-five vertices have at most three common neighbors, and if they have three then both links are cliques.

These are uses of inequality irreducibility. They are not asserted for a combined equality obstruction without further proof.

## Degeneracy peeling

Let L be the set of degree-five vertices. It is nonempty by 5-degeneracy and minimum degree five. It is independent. G-L is nonempty because a vertex in L has neighbors outside L. Choose u in G-L with degree at most five in G-L, and set

    A=N(u)-L,  r=|N(u) intersect L|,  d=d_G(u).

Then |A|<=5, r=d-|A|>=d-5, and d>=6 because u is outside L. Thus r>=1. A neighbor in L forces d>=7, so r>=2. The second use of degeneracy bounds degree in G-L, not degree in G.

For each v in N(u) intersect L, let A_v=N(v) intersect A. Because L is independent, every neighbor of v other than u lies outside L. If the link at v is a clique, u dominates v and |A_v|=4. If that link misses an edge not incident with u, the same conclusion holds. If its missing edge is up_v, then |A_v|=3 and p_v is the unique neighbor of v outside N[u]. These exhaust the cases. In all cases |A_v|>=3.

For distinct low neighbors v,w of u, suppose |A_v intersect A_w|>=2. The common neighbors of v,w include u and those two vertices, so the published overlap lemma makes both links cliques and gives exactly three common neighbors. But then A_v and A_w are both four-subsets of the at-most-five-element set A, so they meet in at least three vertices. Together with u this gives at least four common neighbors, a contradiction. Hence the sets A_v have pairwise intersections at most one.

There are at most two subsets of a set of size at most five, each of size at least three and pairwise intersecting in at most one element. Indeed, any two must be three-sets meeting in one point and covering all five points; a third three-set cannot meet each of the first two in at most one point. Since r>=2, it follows that r=2, d=7, |A|=5, and the two sets A_v,A_w are triples meeting in one point.

Label

    A={a,b,c,d,e},
    N(v)={u,p,a,b,c},
    N(w)={u,q,a,d,e},
    N(u)={v,w,a,b,c,d,e}.

The overloaded letter d in this display is now a vertex label; the degree of u is seven. Both low links are near-cliques, missing up and uq respectively. The vertices p,q lie outside N[u]. They are distinct, because otherwise v,w would have common neighbors u,a,p while their links were not cliques. The sets {a,b,c} and {a,d,e} are triangles, and p joins a,b,c while q joins a,d,e.

## The final reduction

If a cross edge between {b,c} and {d,e} is missing, swap labels within the two pairs so that ce is absent. In the link at u use the matching

    M={vc,we,ab}

and Q={a,b,d}. The link after removing Q has vertices v,c,w,e and only edges vc,we: the other possible edges are absent from the displayed neighborhoods or by ce being missing. Therefore the three triangles

    uvc, uwe, uab

and the six edges

    X={vc,we,ab,ua,ub,ud}

make {u} reducible. Every u-triangle either has a neighbor in Q, or uses a matching edge outside Q. The noncentral edges of all three packed triangles lie in X. This contradicts irreducibility. Thus all four cross edges exist and A is K5.

Let B be the local graph on {u,v,w,a,b,c,d,e}. Its edges are the ten A-edges, all seven edges from u to the other local vertices, va,vb,vc, and wa,wd,we. The following seven triangles exist and are pairwise edge-disjoint:

    vua, vbc, wud, wae, uce, acd, bde.

Take U={u,v,w} and

    X=E(A) union {uv,uw,vp,wq}.

There are fourteen edges in X. Every triangle at u is wholly in B and either uses uv, uw, or an A-edge. Every triangle at v or w either uses the corresponding outside-neighbor edge vp or wq, or is local; its local case uses uv, uw, or an A-edge. Thus X meets every triangle incident with U. Every edge of the displayed seven-packing outside U is an A-edge and belongs to X. Hence this is a balanced seven/fourteen reduction, again contradicting irreducibility.

No minimal inequality counterexample exists, proving tau(G)<=2nu(G) for every finite simple 5-degenerate graph G. Empty and triangle-free graphs have both parameters zero and satisfy the assertion directly.

## What this does and does not establish

The short proof uses published local lemmas, an explicit peeling deduction, a three/six reduction if a cross edge is absent, and the seven/fourteen reduction otherwise. It uses no finite graph census and makes no assumption about outside attachments beyond the displayed exact neighborhoods of u,v,w.

For a minimal failure of the combined inequality/equality statement, the balanced reductions need not themselves be contradictions. The longer manuscript proves the required residual equality and compatibility facts, including a symbolic outside-page augmentation and a cover saving from fourteen to thirteen. Those steps remain necessary in that submitted proof of equality rigidity. The short deduction is not a historical-priority certificate.
