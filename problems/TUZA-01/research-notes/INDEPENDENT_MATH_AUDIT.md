# Independent Validation V1 mathematical criticism (sanitized extract)

This historical internal review independently reconstructs the proof. It does not certify external specialist review, novelty, or full formalization. Later support-trimming and OCT Lean additions were checked in Validation V1 and preserved in the current source package.

## Verdict

**CONFIRMED as an ordinary deduction from Aharoni's tripartite inequality and Haxell–Narins–Szabó's equality theorem.** I reconstructed the elementary argument and checked the formal home-base definitions against the original author manuscript before comparing the main validation audit. I found no counterexample, missing hypothesis, or invalid deduction in the primary theorem or the OCT-four corollary. The conclusion rests on the actual argument below, not on agreement between agents.

The Phase 1 discussion of a stronger equality classification is also defensible, but it is unnecessary and should not be made an extra dependency of the lifting proof. The graph must be finite, simple and undirected. Packing and covering use graph edges. The equality hypothesis applies to the full triangle hypergraph; the auxiliary intersecting-family lemma does not require a full triangle family.

## Sources and imported content

The controlling Phase 1 source is identified by hash in the publication provenance manifest.

1. Ron Aharoni, *Ryser's conjecture for tripartite 3-graphs*, Combinatorica 21 (2001), 1–4, [DOI](https://doi.org/10.1007/s004930170001). Imported content: every finite 3-partite 3-uniform hypergraph has vertex-cover number at most twice its matching number. I did not independently retrieve the original theorem numbering. The exact assertion and a rederivation are accessible in the next source, Section 3, Proposition 3.2 and the following paragraph on manuscript p. 9. In the trivial case where a vertex class has size equal to the matching number, that class already gives a cover of that size.
2. Penny Haxell, Lothar Narins and Tibor Szabó, *Extremal hypergraphs for Ryser's conjecture*, JCTA 158 (2018), 492–547, [DOI](https://doi.org/10.1016/j.jcta.2018.04.004), [18 March 2018 author manuscript](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf). Imported content: Theorem 1.1, manuscript p. 3, identifies equality hypergraphs as home-base hypergraphs. Definitions 7.1–7.4, pp. 19–20, specify their partition and three auxiliary saturating matchings. Proposition 7.5's proof, p. 21, constructs disjoint supports. The manuscript permits multiplicities; simple hypergraphs are included. Its archived SHA-256 is `27938a622b0c28d867c2c61500da606ee319a069f39967e5076afcd35ea060f5`, independently recomputed here.

The reasoning below derives the needed consequence from those definitions rather than treating the introductory picture as a substitute for a theorem.

## Equality: the possible compatibility obstruction does not occur

Write the three hypergraph classes as A1,A2,A3 and a home-base partition as (F,R,W). The members of F, the members of R, and W partition the hypervertices; |F|+|R| is the matching number h. A member R has vertices r1,r2,r3 in the three classes. For each i, choose a matching saturating all of R in the auxiliary graph with right side W intersect Ai. Denote the chosen neighbor of R by wi(R).

For each R the three hyperedges

    {r2,r3,w1(R)}, {r1,r3,w2(R)}, {r1,r2,w3(R)}

exist. These form a loose 3-cycle on six distinct hypervertices. The w's are outside R and distinct because they belong to different classes. For different R's, the same-class w's are distinct by the auxiliary matching; different-class w's are distinct by the partition. No chosen w can be a central vertex of another R or belong to an F piece, because every chosen w is in W. Thus there is no missing simultaneous-matching assumption. Each F piece supplies one loose cycle by taking three distinct faces of its truncated Fano configuration. All these supports are disjoint, giving h cycles in total. Isolated hypervertices do not interfere. When h=0 no structural theorem is needed.

This explicitly checks the strongest apparent vulnerability in the draft: three separately chosen matchings really do yield globally disjoint cycle supports.

## Graphical conversion: all six K4 edges are present

Suppose three graph triangles form such a loose cycle. Name two triangles uvx and uvy, where the four vertices are distinct. The third triangle shares an edge other than uv with each. Its two shared edges therefore come from {ux,vx} and {uy,vy}. The cross choices ux/vy and vx/uy have four endpoints and cannot both belong to a triangle. The remaining choices force the third triangle to be uxy or vxy. In either case the union is exactly

    {uv, ux, vx, uy, vy, xy},

the six edges of a K4. This deduction does not assume the fourth graph triangle was one of the three original hyperedges; it follows because the ambient object is a graph. Disjoint hypervertex supports mean disjoint six-edge sets, so the resulting K4 copies are edge-disjoint. They can share graph vertices, which causes no problem later.

The optional stronger classification can be justified as follows. If a home-base R piece occurs in a full graphical triangle hypergraph, its three central graph edges are pairwise incident, hence form a triangle or a three-edge star. A triangle cannot have its pair-completions in W, because completing two edges forces the third central edge. A star has three pair-completions in W forming the leaf triangle. That triangle is a hyperedge wholly in W, contrary to the edge-home property. Therefore R pieces do not occur in this graphical setting. The lifting proof needs only the disjoint K4 consequence and should retain that shorter dependency.

## Independent-set choice and the simultaneous packing

Let U be the three vertices of T and H=G−E(T). The simplicity assumption ensures U is independent in H: all possible edges on U are exactly the three removed edges. Every K4 in H consequently meets U in at most one vertex. It has a triangle face avoiding U. Selecting one such face from each of the h edge-disjoint K4 copies gives h pairwise edge-disjoint triangles, hence a maximum H-packing P. Every edge of P has both endpoints outside U.

Let Fnew be all triangles of G absent from H. Every member contains a removed edge, so it has at least two vertices in U. A triangle with at least two vertices in U has every edge incident to U. Therefore every triangle of Fnew is edge-disjoint from every member of the single fixed packing P. This is a universal assertion about the entire family, not a separately chosen packing for each new triangle. A maximum edge-disjoint subfamily of Fnew can be added to P, giving

    nu(G) ≥ nu(H) + nu(Fnew).

An arbitrary maximum H-packing need not have this property. For example, H may consist of a K4 on {a,d,e,f} together with bd, and T=abc may be added. The old triangle ade intersects the new triangle abd, whereas def avoids every new triangle. The proof supplies the necessary choice through the equality structure; it does not assert that all old packings work.

## Intersecting-family cover lemma

For a nonempty family of pairwise edge-intersecting triangles, a singleton is immediate. Otherwise choose distinct abc and abd from the family. Any member avoiding ab must contain an edge from {ac,bc} and an edge from {ad,bd}. The two disjoint cross choices are impossible in a triangle, so such a member is acd or bcd. If no member avoids ab, the one edge ab covers the family. If some member avoids ab, cd is an actual graph edge, and {ab,cd} covers every member. Thus the cover has at most two edges of the ambient graph. No completion of the family by other graph triangles is used.

In particular, matching number one for a nonempty family is exactly the pairwise edge-intersection condition. The proof applies even if only three of the four K4 faces are included.

## Complete case split and boundary cases

Set h=nu(H). Appending T to any maximum H-packing gives nu(G)≥h+1. Aharoni gives tau(H)≤2h. If tau(H)<2h, integrality gives tau(H)≤2h−1. A cover of H together with the three edges of T covers all triangles of G, and hence tau(G)≤2h+2≤2nu(G).

If tau(H)=2h, take the packing P constructed above and put r=nu(Fnew). Since T belongs to Fnew, r≥1. If r=1, the family lemma gives tau(Fnew)≤2. If r≥2, the three edges of T give tau(Fnew)≤3≤2r. Union of a minimum H-cover and a minimum Fnew-cover covers G, so

    tau(G) ≤ 2h + 2r ≤ 2nu(G).

When h=0, H is triangle-free, tau(H)=0, P is empty, and the same argument applies without HNS. A triangle-free G cannot satisfy the premise that T is a triangle; this is not an omitted case. Extra isolated vertices, edges not contained in triangles, shared graph vertices among K4 copies, and repeated use of a graph vertex in a triangle packing do not affect any step.

Only the tripartite structure of D(H) is assumed. It is equivalent to assigning three labels to graph edges so that each triangle has three different labels. Nothing requires distinct labels on other adjacent edges, and no ordinary four-coloring of H is used in the primary argument. A triangle-free graph of chromatic number greater than four can be attached by a bridge without changing this distinction.

## OCT-four

Choose S with |S|≤4 and G−S bipartite. If G[S] is bipartite, two colors on S and two different colors on its complement give a proper four-coloring. Otherwise an odd cycle in G[S] must have length three. Let T be that triangle. After deleting E(T), all remaining edges inside S are incident to the possible fourth vertex, so H[S] is a subgraph of a star. Both H[S] and H−S are bipartite, and H is four-colorable.

A proper four-coloring induces a tripartition of the triangle hypergraph: use colors in the four-element vector space over F2, labeling an edge by the nonzero sum of its endpoint colors. On each triangle the three sums are distinct. Apply Aharoni directly in the first case and the triangle-deletion theorem in the second. The argument covers every graph on S, including K4, diamond, paw, triangle plus isolated vertex, and all bipartite possibilities; no further structural assumption on cross edges is made.

## Limits and recommendations to the main validator

No new defect was found. The imported HNS theorem itself was accepted as a published theorem, not re-proved or formally verified in this subtask. I did not rerun Phase 1 enumeration, because finite repetition would add little to these directly checked deductions. The original Aharoni theorem number remains a bibliographic detail to resolve or transparently report, with the exact accessible HNS rederivation already identified. The density audit and novelty search must remain independent. A conditional Lean proof must expose the two deep inputs and still prove the independent-set selection and simultaneous packing rather than assume a statement equivalent to the final lifting theorem.
