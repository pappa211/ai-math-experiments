# Frozen K4-free star-packing support-cover lemma

Frozen 14 November 2026. Ordinary proof; no Lean, external human review, or historical novelty claim. Research stop: 21:00:10 UTC.

## A K4-free star-packing barrier to counterexample synthesis

The following theorem was reconstructed while trying to refute PK using a high-chromatic cone with added private rim pages. It explains why that natural attack fails. It is not asserted to provide a globally available packing in an arbitrary graph.

**Theorem.** Let G be a finite simple K4-free graph and let P be a maximum edge-disjoint triangle packing such that every member contains a fixed graph vertex v. Put k=|P|. Then G has a triangle cover contained in B=E(P), of size at most 2k. More precisely, the cover below has size 2k-s, where s is the number of packed rim edges supporting an actual triangle avoiding v.

If k=0, G is triangle-free and the empty cover suffices. Assume k>0. Write each packed triangle as vab, and let M be the corresponding matching of rim edges ab. Let U be the set of its 2k endpoints. All these endpoints lie in N(v), and

    B = M union {vu : u in U}.

Let S be the subset of M consisting of edges that belong to some triangle avoiding v, and put W=V(S), so |W|=2s. The proposed cover is

    C = S union {vu : u in U minus W}.

It is contained in B and has exactly s+(2k-2s)=2k-s edges.

First, any actual triangle Q avoiding v must meet B by maximality of P. Its intersection with B can contain only rim edges from the matching M, and a triangle cannot contain two vertex-disjoint edges. Therefore Q contains exactly one edge e in M, which by definition lies in S. All triangles avoiding v are covered by C.

For every e=ab in S, choose one triangle Q_e=abx_e avoiding v. K4-freeness implies x_e is not adjacent to v, since otherwise {v,a,b,x_e} would be an actual K4. Thus every chosen tip is outside N(v), whereas every M endpoint lies in N(v). The chosen Q_e are pairwise edge-disjoint: their base edges are disjoint, and a shared outside edge would require a common base endpoint or a tip equal to another base endpoint, both impossible. Sharing just a tip does not share an edge. Each Q_e avoids the support of every packed triangle except its own base e.

Replace all packed triangles based in S by the Q_e. This is still a k-packing. If G[W] contained an edge xy not in M, then vxy would be edge-disjoint from this replacement packing: its spokes belong to removed packed triangles, and its base joins two vertices of N(v), so it is neither an outside edge of any Q_e nor a retained matching base. It could be appended, contradicting maximality. Consequently

    E(G[W]) is a subset of S.

It remains to cover an apex triangle vxy. If x or y belongs to U minus W, its selected spoke covers it. Otherwise x,y lie in W union (N(v) minus U). If both lie outside U, the triangle avoids B entirely, contradicting maximality of P. If both lie in W, the preceding induced-edge conclusion makes xy an edge of S, so it is covered.

In the remaining case, say x lies in W and y lies in N(v) minus U. Let xx' be the S edge containing x, and let Q=xx'z be its chosen old triangle, with z outside N(v). The triangle vxy is private on the packed spoke vx: vy is not in B, and xy cannot be a matching rim edge because y is unmatched. The old Q is private on the packed rim xx'. Their outside tips y and z are distinct because y is in N(v) and z is not. Directly, Q and vxy are edge-disjoint and avoid every other packed triangle. Replacing vxx' by both yields a (k+1)-packing, contradiction. This exhausts all triangles and proves the theorem.

**Scope.** No assumption that every graph triangle contains v was made. The theorem needs the specified maximum packing to have that common vertex, and no theorem supplies such a packing globally. It rules out the attempted cone/private-page counterexample construction in its K4-free form. It does not prove PK for non-star maximum packings or for graphs with K4s.

