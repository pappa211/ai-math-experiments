# Finite incidence tests: frozen global-route obstruction

Status: ordinary proof draft, independent review PENDING. Classical probabilistic ingredients; historical originality UNESTABLISHED. Unrestricted Tuza is unresolved.

## Exact route gate

T(G) has graph edges as hypervertices and actual graph triangles as 3-element hyperedges. Its vertex-cover and matching numbers are exactly graph tau and nu. A proposed route chooses a finite family F of incidence patterns absent from every T(G), then proves tau(H)<=2nu(H) for every H avoiding F. The implication to Tuza is valid; the new asserted inequality on the enlarged class is false, even for induced-pattern exclusions.

## Theorem

For every integer q>=1 and real epsilon in (0,1), there is a finite 3-uniform H with nu(H)>0 such that every induced H[U], |U|<=q, is isomorphic to the FULL triangle hypergraph of some simple graph G_U, while tau(H)>(3-epsilon)nu(H). The graph G_U may depend on U; no consistent global representation is asserted.

Consequently any finite list of finite induced incidence patterns absent from every full T(G) fails to imply tau<=2nu: take q at least the largest hypervertex count in that list. This is an abstract hypergraph obstruction, never a graph counterexample.

## Lemma 1: Berge forests have full graph realizations

A Berge cycle of length l>=2 consists of distinct hypervertices v_1,...,v_l and distinct hyperedges e_1,...,e_l with {v_i,v_(i+1)} contained in e_i cyclically. Having no Berge cycle is equivalent to the bipartite incidence graph being a forest.

Root each incidence-tree component at a hypervertex and represent that root by one isolated graph edge uv. Process hyperedge nodes away from the root. Each has one already represented parent hypervertex, say graph edge ab, and two new child hypervertices. Introduce one fresh graph vertex w and edges aw,bw to represent those children. This creates exactly one new actual triangle abw: w has exactly two older neighbors a,b, and no old graph edges are added. Induction gives bijections between graph edges/hypervertices and FULL graph triangles/hyperedges. Disjoint incidence components use disjoint graph vertex sets. An isolated hypervertex is an isolated graph edge; the empty case is included. Thus every 3-uniform Berge forest is exactly T(G) for a finite simple G.

## Lemma 2: arbitrarily high girth and small independence ratio

Put g=max(q,2), a=1/(2g), rho=epsilon/12. For a large integer N select each 3-subset of [N] independently with probability p=N^(-2+a), obtaining J.

For a Berge cycle of length l in {2,...,g}, there are at most N^l choices for its cyclic hypervertices and at most N^l choices for the third vertices of its l edges. Restrict to descriptions with DISTINCT hyperedges; each such description occurs with probability p^l. Therefore the expected number of short cycles is at most

    sum_(l=2)^g N^(2l)p^l = sum_(l=2)^g N^(a l) <= g sqrt(N).

Duplicate descriptions only increase this upper bound. The distinct-edge restriction is essential for p^l. Markov bounds the probability of more than N/2 short cycles by 2g/sqrt(N).

For k=floor(rho N), the probability of an independent k-set is at most

    binom(N,k)(1-p)^binom(k,3)
    <= exp(N log 2 - p binom(k,3)) -> 0,

since p binom(k,3)=Theta(N^(1+a)). For sufficiently large N both bad-event probabilities sum to less than one. Choose J with at most N/2 short cycles and alpha(J)<k<=rho N.

Choose one hypervertex from each short cycle and delete the union. Its size is at most N/2. The induced remainder H has order n>=N/2, no Berge cycle of length <=g, and alpha(H)<=alpha(J)<rho N<=2rho n. Since tau(H)=n-alpha(H) and nu(H)<=n/3,

    tau(H)>(1-2rho)n >= 3(1-2rho)nu(H)
          =(3-epsilon/2)nu(H)>(3-epsilon)nu(H).

Also alpha(H)<n implies an edge exists and nu(H)>0.

For every U of size <=q, any Berge cycle of H[U] has length at most |U|<=g, impossible. Hence H[U] is a Berge forest; Lemma 1 yields its full simple-graph realization. This finishes the theorem.

## Published source: distinct containment scope

Venkatesan Guruswami and Sai Sandeep, Approximate Hypergraph Vertex Cover and generalized Tuza's conjecture, arXiv:2008.07344, ECCC Report 2020/167. Primary PDF: https://eccc.weizmann.ac.il/report/2020/167/download/ . The inspected introductory Theorem 3 gives a near-t gap, including a fractional gap, for any finite list of t-uniform configurations absent from all (t-1)-blown-up hypergraphs. This attributed theorem is not re-proved here. Download/provenance: evidence/global_sources/.

The primary theorem uses ordinary SUBHYPERGRAPH containment, not induced containment. Its non-induced application to full graph triangle systems is valid: any triple family K has pair-blow-up K^(2) embedded via the identity on pairs into T(shadow K). The shadow graph consists of all pairs in K. Extra actual triangles may appear, so the embedding need not be induced. Thus any pattern forbidden non-induced in all full T(G) is absent from all pair-blow-ups, meeting the primary theorem's premise.

Failure of induced transfer is explicit: let K consist of faces abc,abd,acd. Its pair-blow-up has all six K4 pairs as hypervertices and only those three hyperedges. Its shadow is K4 and T(K4) additionally contains bcd. One cannot infer the induced claim from this embedding. The independent high-girth argument above proves the induced claim instead.

## Limits and provenance

This rules out finite lists of fixed bounded incidence patterns as a sufficient abstraction. It does NOT rule out infinite obstruction lists; a finite formula encoding global pair labels; graph-vertex geometry; unbounded neighborhoods; criticality/arithmetic assumptions; or bounded local operations iterated while preserving global graph realizability. No claim that every local proof is impossible is made. No Lean verification, explicit huge edge list, or originality claim.

Recent Wang/Tsujimura preprint statements were read only for orientation and are NOT dependencies of either lemma or this theorem. The entire induced-incidence theorem is proved above with elementary finite probability, graph construction, and counting.
