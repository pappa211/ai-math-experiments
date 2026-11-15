# A single triangle component does not rescue pruned packing-guided cuts

Status: complete ordinary proof draft, fresh independent review requested. Originality unestablished. This is a counterexample to a precise cover-construction architecture. Every graph constructed here satisfies the ordinary Tuza inequality by an explicit certificate.

## The exact theorem and quantifiers

For a maximum triangle packing P in a finite simple graph G, let B be its edge support. A vertex cut s selects every noncrossing edge in B, and also every noncrossing edge outside B that is the unique noncrossing edge of at least one actual G triangle. Call the selected set C(P,s). The permitted pruning removes selected B edges only; selected outside-B edges must remain. A retained set is acceptable only if it covers every actual G triangle.

There exists a finite simple graph G such that:

1. G has one nonempty shared-edge triangle component, and every graph edge has triangle codegree at least three.
2. G satisfies tau(G)<=2nu(G), by the explicit construction below.
3. For **every** maximum triangle packing P, **every** cut s, and **every** permitted pruning that still covers all actual triangles, the retained cover has more than 2nu(G) edges.

Thus neither existential PC nor the stronger PC-all survives the proposed restriction to a single triangle component, even with the stated positive codegree condition. The graph is not an actual Tuza violation. No assertion of the genuine criticality package, including one/two-edge packing resilience, is made.

## 1. Robust incidence blocks exist

For a finite 4-uniform hypergraph A, let

    chi(A) = min over all vertex two-colorings
             #{hyperedges not split exactly 2+2}.

There exists a connected, nonempty 4-uniform hypergraph A with n vertices and b hyperedges such that distinct hyperedges intersect in at most one vertex, A has no Berge triangle, and

    chi(A) > 3n/2.                                      (1)

Here connected means its bipartite incidence graph is connected after excluding isolated vertices. A Berge cycle of length l consists of distinct hyperedges and distinct cyclic hypervertices, with consecutive hypervertices lying in the corresponding hyperedge.

### Elementary probabilistic construction

For sufficiently large N choose every 4-subset of [N] independently with probability p=N^(-3+1/4). Write

    mu = p * binom(N,4).

For every fixed two-coloring with class sizes r and N-r, the number of exactly 2+2 four-sets is binom(r,2)binom(N-r,2). For N>=9 this is at most half of binom(N,4). Indeed

    binom(r,2)binom(N-r,2)
        <= N^2(N-2)^2/64,

and its ratio to binom(N,4) is at most

    3N(N-2) / (8(N-1)(N-3)) <= 1/2.

The last inequality is equivalent to N^2-10N+12>=0, valid for N>=9. Consequently the random number X_s of bad hyperedges for any fixed coloring s has mean mu_s>=mu/2.

For a binomial variable X of mean z, the elementary exponential-Markov bound gives

    Pr[X<=z/2] <= 2^(z/2) E[2^(-X)]
                <= exp(-(1-log 2)z/2) <= exp(-z/8).

The expectation inequality uses (1-p/2)^M<=exp(-Mp/2) for M independent trials. Hence

    Pr[there exists s with X_s<=mu/4]
        <= 2^N exp(-mu/16) -> 0,

because mu is asymptotic to N^(5/4)/24.

For l=2,3, describe a Berge l-cycle by its l cyclic hypervertices and the two additional vertices of each 4-edge. There are at most N^(3l) descriptions. Restricting to descriptions with distinct hyperedges, each occurs with probability p^l; duplicate descriptions only increase the upper bound. Thus the expected total number Y of Berge 2- and 3-cycles is at most

    N^(1/2)+N^(3/4).

Markov gives Pr[Y>N]<=N^(-1/2)+N^(-1/4)->0. For sufficiently large N choose an outcome with every coloring having more than mu/4 bad edges and with at most N short Berge cycles. Delete one hyperedge from each short cycle, taking the union of those choices. At most N edges are removed, no cycle is created, and every coloring of the remaining hypergraph A' has more than mu/4-N bad edges. Choose N still larger so that mu>10N. Then

    chi(A') > mu/4-N > 3N/2.

Absence of Berge 2-cycles means linearity (two distinct edges share at most one vertex); absence of Berge 3-cycles is the other required incidence condition.

Decompose A' into incidence components, including isolated vertices. The invariant chi is additive over those components because their vertex sets are disjoint and their colorings can be optimized independently. If every component A_i satisfied chi(A_i)<=3|V(A_i)|/2, summing would contradict the preceding strict bound. Therefore at least one nonempty connected component satisfies (1). Retain that component as A. This proves existence with exact quantifiers and no external hypergraph existence theorem.

## 2. Full graph construction and every actual triangle

Make each hyperedge of A a K4 on its four vertices, adding no other edges; call the resulting graph H. Each H edge belongs to exactly one block by linearity. Every actual H triangle lies in one block: if two of its edges share a block then all three vertices lie there and edge uniqueness places the third edge there; if its three edges have different blocks, their endpoints form a prohibited Berge triangle.

Thus H has exactly 6b edges and 4b triangles, and its triangle-edge components are the separate K4 blocks. Its graph vertex set is connected because A is incidence-connected. Isolated vertices are absent.

Adjoin one new universal vertex a to H, obtaining G. The actual G triangles are **exactly** the old K4 faces and the apex triangles axy for xy in E(H). There are no other possibilities because only one vertex was added.

Every old edge xy now belongs to its two old K4 faces and to axy, so its triangle codegree is exactly three. A spoke ax belongs to deg_H(x) apex triangles. Since every x belongs to at least one K4 block, deg_H(x)=3 deg_A(x)>=3. This proves the codegree assertion.

All apex triangles belong to one shared-edge triangle component: H is connected, and apex triangles based on incident H edges share a spoke. Every old K4 face shares each of its rim edges with an apex triangle. Hence G has one nonempty shared-edge triangle component.

## 3. Maximum packings perturb at most n/2 blocks

Any G triangle packing contains at most b old triangles, one per K4 block. Its apex triangles have pairwise-disjoint spoke endpoints and hence form an ordinary matching of H, of size at most floor(n/2). Therefore

    nu(G) <= b+floor(n/2),    2nu(G)<=2b+n.              (2)

Fix an arbitrary maximum packing P. Call a K4 block exceptional if P contains an apex triangle whose base edge lies in that block. The number e(P) of exceptional blocks is at most the number of packed apex triangles, so e(P)<=floor(n/2).

Every nonexceptional block contains exactly one old packed face. It contains at most one because any two K4 faces share an edge. If it contained none, none of its six edges would be used by P at all: old triangles in other blocks use disjoint rim edge sets, and no packed apex triangle has a base there. Appending any of its old faces would increase P, contradicting maximality. Thus its packed support inside the block is exactly one face.

## 4. The retained-cover lower bound

Fix any cut s and any allowed retained cover C obtained by pruning C(P,s). Count C only on the old block edge sets, which are pairwise disjoint. Every block requires at least two retained edges because all four K4 faces must be covered.

For a nonexceptional block whose cut is not 2+2, at least three retained old block edges are necessary:

- For a 3+1 split, the three edges inside the majority side are the only noncrossing block edges. Each is the unique noncrossing edge of the old face obtained by adjoining the minority vertex. All selected edges everywhere are noncrossing, so each of these three edges is individually necessary in any retained cover.
- For a monochromatic block, its packed support is one face T. If a is on the same cut side, no outside-T block edge is selected: old faces and apex triangles based there are all monochromatic. Hence all three edges of T must remain, since each is the only available edge of a different old face through the fourth vertex.
- For a monochromatic block with a on the opposite side, every old block edge is the unique noncrossing edge of its apex triangle. The three outside-T block edges are selected outside B and cannot be pruned, so already contribute three edges. In fact the old face T forces at least one more retained edge, but only the weaker lower bound three is needed.

This last case is important: adding the apex can select extra nonpacked edges, so the old block formula is a lower bound, not always an equality.

At least chi(A) blocks are not 2+2 under the restriction of s to V(H). Discarding every exceptional block from that count loses at most e(P). Therefore

    |C| >= |C intersect E(H)|
        >= 2b+chi(A)-e(P)
        >= 2b+chi(A)-n/2
        > 2b+n
        >= 2nu(G),

using (1) and (2). P, s, and the allowed pruning were arbitrary. This proves the universal PC failure.

## 5. Explicit ordinary Tuza certificate

This short argument is the K4-only specialization of the accepted ordinary one-apex theorem in frozen public commit
`d4029fbafc3dffc250b50ed237ad81c3206cd1a0`,
`problems/TUZA-07/notes/CONSTRUCTIVE_AND_STAR_THEOREMS.md`.
It is reconstructed here so the graph's positive Tuza status does not depend on an opaque citation. Historical originality of that ingredient is not claimed as new.

Choose an inclusion-maximal ordinary matching M of H subject to using at most one edge from each K4 block. Let m=|M| and U its 2m endpoints. This means maximal by inclusion, not necessarily maximum; a greedy finite procedure suffices.

In each used K4 block choose an old face avoiding its M edge; in each unused block choose any old face. These b old triangles are edge-disjoint and avoid every M edge. Append all m apex triangles based on M, whose spoke endpoints are disjoint. Thus

    nu(G)>=b+m.

For each used K4 block choose the opposite pair of edges containing its M edge. In each unused block choose any opposite pair. These 2b edges cover every old triangle. Add all 2m spokes au for u in U.

If an apex triangle axy were uncovered, xy would avoid U and would not lie in the chosen old cover. If its block were unused by M, adding xy would enlarge M while preserving both defining constraints, impossible. Hence its block is used; since xy avoids U, it is disjoint from the block's selected M edge, and in a K4 it is that edge's opposite. But this opposite edge was included in the old cover, again a contradiction. The displayed set is therefore a G triangle cover of size at most 2b+2m. Consequently

    tau(G)<=2b+2m<=2nu(G).

## Limits and consequence for the mission

The obstruction uses real global graph endpoint consistency and one shared-edge triangle component. It is not an abstract incidence-only counterexample, and no finite search or unverified graph atlas supplies its existence. It defeats the proposed cut/pruning architecture under those explicit relaxed hypotheses while retaining a separate constructive Tuza proof.

It does not establish that a genuine edge-minimal Tuza violation could have these block/apex features. In fact the one-apex certificate proves this entire class satisfies Tuza. No assertion that all prescribed one/two-triangle packings extend, that deleting every one/two edges preserves nu, or that the graph is an actual critical object is made. A further repair restricted to genuine criticality would need a new theorem using those additional hypotheses and supplying its global availability; the connectedness repair alone is now ruled out.
