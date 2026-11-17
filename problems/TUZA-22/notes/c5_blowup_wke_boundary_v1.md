> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A nine-vertex triangle-free non-WKE boundary

Status: ordinary proof candidate; this refutes only the tentative claim that every triangle-free graph of matching number at most four is WKE. It is not a CS counterexample.

Let L be the independent-part blowup of a five-cycle, in cyclic order A,B,C,D,E, with part sizes 2,2,1,2,2. Consecutive parts are completely joined and there are no other edges. Write A={a1,a2}, B={b1,b2}, C={c}, D={d1,d2}, E={e1,e2}.

The graph is connected and triangle-free. Its matching number is four: the order bounds it by four and a matching of size four is

    a1b1, a2b2, cd1, d2e1.

Its independence number is four. The parts met by an independent set are nonconsecutive on C5, so at most two parts are met, each of size at most two. Conversely A union C has size three, and A union D has size four.

More strongly, every vertex set S for which L[S] has maximum degree at most one has size at most four. If L[S] has no edge this is the independence bound. Otherwise an edge joins some two consecutive parts P_i,P_(i+1). Each of those two parts contributes exactly one selected vertex, because two vertices in either part would give degree at least two at the selected vertex in the other. The two neighboring parts P_(i-1),P_(i+2) contribute no vertices. The sole remaining part P_(i+3) contributes at most two vertices. Thus |S|<=1+1+2=4.

Suppose (M,Q) were a WKE witness: M is a matching, |Q|<=|M|, and Q covers L-M. Since |M|<=4, the remaining vertex set S=V(L) minus Q has at least five vertices. All edges of L[S] belong to M, hence its maximum degree is at most one. This contradicts the preceding paragraph. Therefore L is not WKE.

The cone over L is far from tight: its triangle packing number is four and its triangle covering number is five. Every cone triangle contains the hub and corresponds to a link edge, so edge-disjoint triangle packings correspond exactly to link matchings. For any cone triangle cover, let Q be the base vertices whose hub spokes are selected. Every edge of L-Q must then be selected as a base edge. Replacing each such selected base edge by one endpoint gives a vertex cover of L of size no larger than the cone cover. Conversely any vertex cover of L gives a cone triangle cover of the same size by selecting its hub spokes. Thus tau(cone L)=tau_vertex(L)=9-alpha(L)=5.

The obstruction therefore closes the proposed bounded-matching WKE shortcut while leaving the main CS problem untouched. It is also smaller than the Petersen non-WKE example. The degree profile is four vertices of degree three and five of degree four, so it lies outside the at-most-two degree-three / at-most-two degree-four profile in Tsujimura's Lemma4.1.

Dependencies: definitions and elementary matching/independent-set facts only. No finite enumeration or external theorem is used.
