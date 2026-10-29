> Curated source from TUZA-03/alternative/ADJACENT_APEX_MAXIMAL_COST.md. Original SHA-256: `09d3626c745c277abfca4ce71969ad84498fe36f856a5cc641be76732182dd05`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Maximal cover cost forces an adjacent apex edge to be packing-essential


## Statement

Let H be a finite simple graph with 3-partite triangle hypergraph and

    nu(H)=h,    tau(H)=2h−1.

Let U={a,b,c} be independent in H, let T=abc, and put J=H+E(T). Suppose the full new triangle family F consists exactly of T and its six pages at two distinct apices p,q, each adjacent to all of U. Assume

    tau(J)=tau(H)+3.

If pq is an H-edge, then it is packing-essential:

    nu(H−pq)=h−1.

There is no assumption on h, the order of the defective component, or nu(J). In particular, for a packing-edge-stable slack-one remainder, an exact two-apex restoration of maximal cover cost must have nonadjacent apices.

## Row-pair cover preservation

Fix u∈U, write {v,w}=U−{u}, and let A_u={up,uq}. The three edges up,uq,vw cover F. A minimum cover of H−A_u together with those three edges covers J, because A_u also meets every old triangle absent from H−A_u. Therefore

    tau(J)≤tau(H−A_u)+3.

The assumed maximal cover increase and monotonicity imply

    tau(H−A_u)=tau(H)=2h−1.

This is a cover equality, not an unsupported combination of packing-avoidance witnesses.

## Deleting one old book triangle exposes equality

Assume pq∈E(H). Let Q=pqu, an old triangle, and put K=H−E(Q). Since K is obtained from H−A_u by deleting the single edge pq,

    tau(K)≥tau(H−A_u)−1=2h−2.

Any K-packing can be appended to Q, so nu(K)≤h−1. Aharoni applies to K and forces

    2h−2≤tau(K)≤2nu(K)≤2h−2.

Thus

    nu(K)=h−1,    tau(K)=2(h−1).

By the established graphical HNS equality consequence, choose h−1 edge-disjoint K4 witnesses in K. The three vertices V(Q) are independent in K. Selecting a face avoiding V(Q) from every witness gives a fixed maximum K-packing compatible with every H-triangle absent from K: such a triangle contains an edge of Q, so all its edges touch V(Q).

Let L be the full family of H-triangles absent from K. The compatibility gives

    h=nu(H)≥(h−1)+nu(L).

Since Q∈L, it follows that nu(L)=1. Hence L is pairwise edge-intersecting.

## Three independent book pages force a common edge

The family L contains all three triangles pqa,pqb,pqc, because each uses pq. Every member of L therefore contains pq.

Here is a direct verification, avoiding any unproved equality classification. Suppose a graph triangle Z did not contain pq but intersected all three of those pages in graph edges. It would have to contain, for each x∈{a,b,c}, one of px,qx. These are three distinct required edges. All lie in the bipartite graph with sides {p,q} and {a,b,c}, which contains no triangle. Since Z has exactly three edges, this is impossible.

Thus every H-triangle absent from K contains pq. Deleting pq from H removes all such triangles, and the remaining triangle family is contained in that of K. Consequently

    nu(H−pq)≤nu(K)=h−1.

Deleting one graph edge can reduce a packing number by at most one, so the reverse inequality holds. Hence nu(H−pq)=h−1, proving the claim. QED.

## Consequence for the full two-triangle problem

An actual critical two-triangle counterexample forces each individual intermediate graph Ji to satisfy tau(Ji)=tau(H)+3. The previously settled essential-edge branch excludes packing-essential old edges. Therefore, whenever an individual new family has packing number at most two (and thus is the exact two-apex family by the elementary classification), its apices are nonadjacent.

This removes the adjacent-apex case from the genuine maximal-cost obstruction for arbitrary-size cores. It does not prove the stronger assertion that every induced independent three-page book in an arbitrary stable slack-one graph is impossible. Nor does it settle nonadjacent apices or the individual-family packing-three branch.
