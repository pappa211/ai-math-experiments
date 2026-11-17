> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-triangle closure in home-base hypergraphs

Frozen candidate v1; 2026-11-16. Status: PROOF_USING_DECLARED_INPUT, pending fresh review. The short transfer below is an ordinary argument. The deep hypergraph inequality and equality theorem are imported, not independently reproved here.

## Exact graph scope

Let G be any finite simple graph admitting a map c:E(G)→{1,2,3} for which every actual triangle has three distinct edge colors. No restriction is placed on triangles crossing a proposed decomposition. Then τ(G)≤2ν(G). Moreover, equality holds precisely when every nontrivial component of the triangle hypergraph is the four triangles on the six actual edges of a literal K4. Thus the proposed CS statement holds for this class, with only K4 blocks. Different K4 blocks may share graph vertices; their edge sets are disjoint and no triangle crosses blocks. Edges in no triangle are harmless background.

This is a scoped consequence of published results, with no novelty claim for the resulting graph theorem. It does not supply such an edge coloring for an arbitrary graph.

## Declared external theorem and definitions

The triangle hypergraph H has vertex set E(G), and one three-element hyperedge for every actual triangle of G. Its matching and vertex-cover numbers are exactly ν(G),τ(G). The color classes make it 3-partite and 3-uniform. Aharoni's theorem gives τ(H)≤2ν(H). Haxell–Narins–Szabó Theorem 1.1 says that equality is equivalent to a home-base partition.

Definitions 7.1–7.4 specify a partition of V(H) into six-sets F, three-sets R, and a remainder W. Each F induces a truncated multi-Fano plane; each R has one vertex per part; the number of F and R sets is ν(H). For each part, the auxiliary bipartite incidence graph between R sets and W vertices has a matching saturating R: incidence means that the W vertex together with the other two vertices of R is a hyperedge. Finally, every hyperedge is contained in an F set or contains two vertices of an R set. Here H is simple, so parallel hyperedges do not occur.

## Ordinary closure lemma

Suppose three distinct graph edges r1,r2,r3 have, for every pair, an actual triangle whose third edge lies outside {r1,r2,r3}. The three edges are pairwise incident. Three distinct pairwise incident edges of a simple graph either form a triangle or have a common endpoint. In the triangle case the unique triangle completion of a pair is the third edge of the set, contrary to the hypothesis. Therefore write them ab,ac,ad with a,b,c,d distinct. Their unique pair completions are bc,bd,cd. These three completion edges themselves form the actual triangle bcd. In particular, the six edges are exactly a literal K4.

## Eliminating R blocks

Take any R={r1,r2,r3} in a home-base partition. Matchability, separately in each of the three parts, supplies a W completion for every pair of R vertices. Apply the closure lemma, viewing H vertices as actual graph edges. Its three completion edges bc,bd,cd all lie in W. Consequently H contains the hyperedge {bc,bd,cd} entirely in W. This violates the edge-home property: the hyperedge is neither contained in an F set nor contains two members of any R set. Hence R is empty. Notice that this argument uses genuine triangle closure, not just linearity of a hypergraph.

## Identifying F blocks

A simple truncated Fano plane has four triples on six vertices, every two meeting in one vertex. Any three of its triples form a loose 3-cycle: their three pairwise-intersection vertices are distinct, and the three remaining vertices are distinct. For an F block, take three of its actual graph triangles. Their pairwise-intersection graph edges are r1,r2,r3, and the remaining edges complete the pairs outside that triple. The closure lemma identifies all six edges of F with a literal K4. The fourth actual face is forced, and F contains precisely its four triangles.

Since R is empty, edge-home says that every actual triangle is contained in one of these disjoint F edge sets. The nontrivial triangle components are therefore exactly these K4 blocks. Conversely, if all triangle components are literal K4 blocks, each contributes packing one and cover two, and both optima add across disjoint edge sets. The triangle-free case has both optima zero and the classification is vacuous.

## Consequences and boundaries

Any nonclassified graph in this class satisfies the integer strict bound τ(G)≤2ν(G)−1. Hence a global minimum CS obstruction cannot admit a rainbow three-coloring of its triangle edges.

Every vertex-4-colorable graph is in the class: label the four vertex colors by the group Z2×Z2, and color an edge by the nonzero difference of its endpoint labels. The three differences on a triangle are distinct. The independent-hub class in `notes/independent_hub_fiber_cover_v1.md`, when every whole hub link is bipartite, is also in this class: color nonhub edges 1 and use colors 2,3 on each hub's spokes according to its link bipartition. Independence of the hubs prevents any conflict between these prescriptions. Its factor-two inequality therefore has this prior published antecedent; the separate ordinary essential-base saving is a local mechanism, not evidence of a new inequality class.

K4 has the required edge coloring. K5 does not: any two incident edges belong to an actual triangle, so its four edges at a vertex would need distinct colors. More generally, a cone over a triangle-free graph L requires a proper three-coloring of L on its spokes in any rainbow edge-three-coloring. Thus a triangle-free non-3-colorable L gives a cone with a star triangle cover outside this class. No containment of the entire accepted forest-cover class is claimed.

## Source receipt and verification boundary

Author-hosted combined paper: Penny Haxell, Lothar Narins, Tibor Szabó, *Extremal Hypergraphs for Ryser's Conjecture*, dated 18 March 2018, 56 pages: https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf . Journal metadata authenticated on the author's publication page https://page.mi.fu-berlin.de/szabo/honpub.html : JCTA 158 (2018), 492–547. DOI 10.1016/j.jcta.2018.04.004 is consistent with the arXiv publication metadata; the publisher DOI URL failed in this intake. The combined author file, rather than a differently numbered earlier split arXiv paper, controls the theorem numbers above.

Local source: `literature/haxell_narins_szabo_2018/ryser_20180318.pdf`, 590464 bytes, SHA256 27938a622b0c28d867c2c61500da606ee319a069f39967e5076afcd35ea060f5. Receipt and selected text pages are beside it. Inspected Theorem 1.1 (printed page 3), definitions 7.1–7.4 (printed pages 19–20), and the explicit Aharoni inequality deduction following Proposition 3.2 (printed page 9). The source's whole topological proof was not independently reconstructed.

Original inequality attribution: Ron Aharoni, *Ryser's Conjecture for Tripartite 3-Graphs*, Combinatorica 21 (2001), 1–4, DOI 10.1007/s004930170001. Publisher metadata inspected at https://link.springer.com/article/10.1007/s004930170001 ; the original full paper is subscription-only in this intake and its abstract's formula is absent from the text extraction. The precise inequality is authenticated through the later primary paper's explicit restatement and deduction, not a claim of having read Aharoni's original proof.

No census, numerical solver, generic hypergraph-to-graph realization assumption, or historical source replay is a premise.
