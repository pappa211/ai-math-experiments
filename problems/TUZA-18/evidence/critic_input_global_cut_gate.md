# Packing-controlled cut repair: exact global gate and obstruction

Status: ordinary proof draft, independent review PENDING. This is a refuted proposed sufficient mechanism, not a Tuza counterexample or a statement about genuine minimal Tuza counterexamples. Historical originality unestablished.

## Quantifiers and implication, frozen 14 November 2026

For every finite simple graph G, candidate GC asserts that there exist a maximum triangle packing P and a vertex bipartition s such that the following explicitly constructed cover has size at most 2|P|. Put B=E(P). Select every noncrossing B edge, and every noncrossing edge outside B which is the unique noncrossing edge of a triangle whose other two edges cross the cut. Call this C(P,s).

C(P,s) is always a triangle cover. A monochromatic triangle meets B by maximality of P, and its B edge is selected. A nonmonochromatic triangle has exactly one noncrossing edge; if that edge belongs to B it is selected by the first rule, and otherwise by the second rule. Consequently GC would prove unrestricted Tuza directly. Its only missing existence assertion is the simultaneous payment |C(P,s)|<=2|P|. It does not assume an apex or a low-degree vertex and does not discard arbitrary monochromatic outside-B edges.

## Universal failure on a cone family

Let H be a triangle-free graph of even order n with a perfect matching and alpha(H)<n/6. Form G by adding a universal apex z. Every triangle of G is zxy for an edge xy of H. Packing corresponds exactly to matching in H, so nu(G)=n/2; EVERY maximum packing corresponds to a perfect matching M. Its support B consists of ALL n spokes plus the n/2 matching edges.

For any cut, let S be the rim vertices on the side opposite z. The selected spokes are precisely the n-|S| spokes to V(H)\S. All H edges within S are selected: matching edges by the first rule, nonmatching edges by the apex triangle and second rule. Among H edges within V(H)\S only matching edges are selected. No crossing edge is selected. H has no triangles of its own, so this list is exact. Therefore

    |C(P,s)| = n-|S| + e_H(S) + e_M(V(H)\S)
             = 3n/2 - 2|S| + e_H(S) + e_M(S).

For every finite graph J, alpha(J)>=(2|V(J)|-|E(J)|)/3. Elementary proof: induct on order. If a vertex has degree d>=2, remove it and use alpha(J)>=alpha(J-v); the induction RHS changes by (d-2)/3>=0. If every degree is at most one, J is a matching and isolated vertices, and the bound follows componentwise (equality on each edge). This argument is simpler than a degree-two classification and includes empty J.

Apply this to J=H[S]. Since alpha(H[S])<=alpha(H),

    |C(P,s)| >= 3n/2 - 3 alpha(H) > n = 2nu(G).

Thus GC fails simultaneously for EVERY maximum P and EVERY cut, with arbitrary optimization over both allowed. By contrast all n spokes already give a triangle cover of size 2nu(G), so this is not a failure of Tuza.

## Self-contained existence of the rim family

There are triangle-free finite graphs B with alpha(B)/|B|<1/6. Here is a direct probabilistic proof; no uninspected Ramsey theorem is required. For integer N tending to infinity divisible by 20, sample the simple random graph with p=N^(-2/3). Expected triangle count is <N/6. Markov gives probability at most 2/3 of having more than N/4 triangles. The probability of an independent set of size k=N/10 is at most

    binom(N,k)(1-p)^(k(k-1)/2)
    <= exp(N log2 - p k(k-1)/2),

which tends to zero. For all sufficiently large N, some graph has at most N/4 triangles and no independent k-set. Delete one vertex from each triangle, choosing the vertices from the original triangle list (the union has size at most N/4). The induced remainder B is triangle-free, has order at least 3N/4, and alpha(B)<N/10, hence alpha(B)/|B|<2/15<1/6.

Now H=B square K2 (Cartesian product). Its two B layers and vertical perfect matching define a triangle-free graph: a triangle cannot switch layers twice and still have a third distinct vertex because the cross-layer edges form a matching. Each independent set intersects either layer in at most alpha(B), so alpha(H)<=2alpha(B), while |H|=2|B|. Thus H meets the required strict independence ratio and has a perfect matching.

Indeed this construction ensures alpha(H)/n<2/15 and hence every proposed cut cover has size >11n/10, exceeding the desired n budget by a linear margin. Disjoint unions give an unbounded family after any one such B exists; connecting is not needed for the assertion. No explicit huge edge list or exact optimum cover is asserted.

## Scope and next gate

This strengthens the fixed-palette failure only for this different, packing-controlled cut implementation. It does not eliminate all signed-cut or nonlocal cover repair methods. It does not refute any claim restricted to actual minimal Tuza counterexamples: the cone has an immediate cover within budget, and its spoke structure fails deletion resilience. New progress would require a repair that can deliberately select all spokes at once without paying for irrelevant packed rim edges, or a separate proof that the forbidden cone-like pattern cannot arise in the exact critical object.
