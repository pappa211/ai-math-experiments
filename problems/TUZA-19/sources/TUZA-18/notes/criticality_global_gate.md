# Criticality arithmetic does not repair finite incidence abstraction

Status: ordinary proof draft. Internal independent review pending. Historical originality unestablished. This is an obstruction to a specified proof architecture, not a graph counterexample or a proof of Tuza.

## Exact statement

For every integer q>=1 there exists a finite 3-uniform hypergraph K such that:

1. K is an actual hypervertex-minimal violation of tau<=2nu: tau(K)>2nu(K), while every proper induced hypervertex subhypergraph satisfies tau<=2nu.
2. Every induced subhypergraph K[U] on at most q hypervertices is isomorphic to the **full** triangle-edge hypergraph T(G_U) of some finite simple graph G_U. The representing graph may depend on U; no consistent global graph representation is asserted.
3. K satisfies every incidence/arithmetic assertion of the published criticality package listed below, with hypervertices playing the role of graph edges and hyperedges the role of graph triangles.

Consequently no contradiction can be obtained merely from those criticality assertions plus any fixed finite collection of forbidden induced incidence patterns absent from all full graph triangle hypergraphs. Any successful use of this architecture needs an additional hypothesis that excludes these K, such as a globally consistent graph-edge endpoint representation. Unbounded graph vertex links and global graph transformations are not ruled out.

## Declared mathematical dependency

The self-contained theorem in `notes/global_finite_incidence_gate.md` supplies, for every q and epsilon in (0,1), a finite 3-uniform H with tau(H)>(3-epsilon)nu(H)>0 and every induced <=q-hypervertex subgraph a Berge forest with a full graph-triangle realization.

Draft read and independently checked at SHA-256
`7ec106efb669f729e89d312b174be339474db93b1292945f56e01fec55ab8ac6`.
Its elementary probabilistic proof, rather than any external published theorem or downloaded PDF, is the dependency. That draft's external-source provenance paragraph was separately flagged for correction; the self-contained theorem does not use it.

## Extraction

Choose epsilon=1/2, so H violates tau<=2nu. Among subsets W of V(H) whose induced hypergraph H[W] violates the inequality, choose one of minimum cardinality; set K=H[W]. This is possible because H is finite and W=V(H) qualifies. For every proper subset Z of V(K), K[Z] satisfies Tuza by the choice of W. Property 2 is inherited: K[U]=H[U]. No graph-realizability assumption is introduced in the extraction.

Here deleting hypervertices removes every incident hyperedge; it does not shorten hyperedges. Thus all surviving hyperedges remain 3-element sets. This is the exact analogue of graph-edge deletion in T(G).

## Complete arithmetic package for K

Put k=nu(K). The standard elementary deletion facts are that deleting one hypervertex lowers tau by at most one and nu by at most one.

For every x in V(K), if nu(K-x)<=k-1, minimality would give

    tau(K) <= tau(K-x)+1 <= 2nu(K-x)+1 <= 2k-1,

contradicting tau(K)>2k. Therefore nu(K-x)=k. Minimality and tau(K)<=tau(K-x)+1 then imply

    tau(K)=2k+1,  tau(K-x)=2k.

There are no isolated hypervertices: deleting one would preserve both parameters and leave a smaller violation. There is one nonempty incidence component: otherwise each component is a proper induced subhypergraph satisfying Tuza, and additivity of both parameters gives the inequality for K.

For every nonempty S subset V(K), minimality gives

    2k+1-|S| <= tau(K-S) <= 2nu(K-S),

hence

    k-nu(K-S) <= floor((|S|-1)/2).

In particular any deletion of one or two hypervertices preserves nu, and any hypervertex set meeting every maximum packing has at least three members.

Let P be p disjoint hyperedges, p=1 or p=2, and write E(P) for their 3p-element union. Appending P to a maximum packing of K-E(P) gives

    nu(K-E(P)) <= k-p.

The general deletion bound gives the reverse inequality because floor((3p-1)/2)=p for p=1,2. Therefore every such prescribed packing extends to a maximum packing. For p=1, its residual has nu=k-1 and tau=2k-2: the lower cover bound is tau(K)-3=2k-2 and minimality supplies the equal upper bound. For p=2, the residual has nu=k-2 and tau in {2k-5,2k-4}, with impossible negative values automatically excluded.

For a hyperedge T={x,y,z}, put J=K-x. Then

    nu(J)=k, tau(J)=2k;
    nu(J-{y,z})=k-1, tau(J-{y,z})=2k-2;
    nu(J-y)=nu(J-z)=k,
    tau(J-y)=tau(J-z)=2k-1.

The middle cover equalities follow because deleting all three members of T lowers tau by exactly three and each single deletion lowers it by at most one. Every maximum J packing meets {y,z}, or it could be augmented by T.

Finally every hypervertex has degree at least two. If x lies only in hyperedge {x,y,z}, then after deleting y,z no surviving hyperedge contains x. Every packing in K-{y,z} is disjoint from {x,y,z} and can be augmented by it. Hence nu(K-{y,z})<=k-1, contradicting two-deletion resilience.

These are exactly the generic criticality deductions needed for the stated obstruction. They use neither graph endpoint geometry nor an equality classification. Q also holds: every hyperedge is contained in a minimum transversal, since deleting its three members drops tau by three.

## Scope of the obstruction

Suppose a proposed proof uses a finite collection F of finite induced incidence patterns, each absent from every full T(G), and the arithmetic package above. Take q at least the largest hypervertex count in F. Every induced <=q patch of K is a full T(G_U), so K avoids F. Yet K satisfies the arithmetic hypotheses and violates tau<=2nu. The enlarged-class theorem required by that proof architecture is therefore false.

This does not claim that graph-specific criticality is useless. For example a genuine graph vertex v supplies a single globally consistent link G[N(v)], a spoke for each link vertex, and a remainder G-v. Those labels and their interaction with all old triangles are not supplied by separately realizable finite hypergraph patches. The prior apex nonsaturation deduction at such an actual graph interface is not refuted.

Nor does this rule out a finite algorithm using graph endpoints, unbounded neighborhoods, global consistency, or repeated graph-realizable operations. It rules out only replacing full graph geometry by finitely many bounded induced incidence exclusions, even after importing the complete generic criticality package.
