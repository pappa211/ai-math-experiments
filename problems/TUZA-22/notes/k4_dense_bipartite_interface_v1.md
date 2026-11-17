> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Packing-four density reduction to a near-complete bipartite core

Coordinator ordinary proof candidate, 15 November 2026. This supplies the density reduction; the separate near-bipartite packing lemma completes the proposed contradiction. No Gyori asymptotic result or historical finite census is used.

## 1. Mantel bound, used explicitly

A triangle-free graph F on n vertices has at most floor(n^2/4) edges. For completeness, for every edge uv its endpoint neighborhoods are disjoint, so d(u)+d(v)<=n. Summing over edges gives sum_v d(v)^2<=nm. Cauchy gives sum_v d(v)^2>=(2m)^2/n, and hence m<=n^2/4 (the edgeless case is immediate).

## 2. Twelve-vertex triangle-free graphs with at least32 edges are bipartite

Suppose F is triangle-free, nonbipartite, and has12 vertices. Let Z be a shortest odd cycle, of length l in{5,7,9,11}. It is induced: a chord divides an odd cycle into an even cycle and a strictly shorter odd cycle. Each vertex outside Z has at most floor(l/2) neighbors on Z, since two consecutive neighbors would make a triangle. Its outside-induced subgraph is triangle-free and satisfies Mantel. Therefore

    e(F) <= l + ((l-1)/2)(12-l) + floor((12-l)^2/4).

For l=5,7,9,11 these bounds are respectively31,28,23,16. Thus e(F)<=31, contradiction. This is an elementary proof for this exact finite order, with no sufficiently-large qualification.

## 3. Reduction for an eight-edge minimum cover

Let G have at most12 vertices and a minimum triangle cover C of size8. Suppose some subgraph J has average degree at least7. It must have at least8 vertices. The restriction C∩E(J) is a triangle cover of J of size at most8. Hence its complement in J is triangle-free and has at least ceil(7|V(J)|/2)−8 edges.

For |V(J)|=8,9,10,11 these lower bounds are20,24,27,31, respectively, greater than the Mantel bounds16,20,25,30. These orders are impossible. Therefore G has exactly12 vertices and at least42 edges.

Put H=G−C. This triangle-free spanning subgraph has at least34 edges. Section2 forces it to be bipartite, with a bipartition A,B. Since |A||B|>=34 and |A|+|B|=12, the part sizes are either6+6 or5+7. In the balanced case at most two cross edges are missing; in the unbalanced case at most one is missing.

Every edge of C lies within a part. Indeed, if an actual G edge across A,B were omitted from H, adding it would preserve bipartiteness and triangle-freeness, contradicting that C was a minimum cover. Thus G has exactly eight internal edges, namely C, and its cross graph is K6,6 minus at most two edges or K5,7 minus at most one edge.

The separate near-bipartite packing lemma shows that such G has at least five edge-disjoint triangles, using minimum-cover optimality to control internal stars. Once that lemma is reviewed, the conclusion is:

    n(G)<=12, tau(G)=8, nu(G)<=4  => mad(G)<7.

The minimum-cover hypothesis belongs to the statement; we do not assert the same density conclusion from n<=12 and nu<=4 alone.

## 4. Proposed CS and original-H-D consequence, pending density-lemma review

Choose a minimum CS failure inside the subgraph-closed class nu<=4. Existing reviewed CS for nu<=3 forces nu=4, and M0 gives tau=8. M3/SIX plus the eight-edge-cover kernel give n<=13. The reviewed triangle-plus-matching minimum-cover theorem excludes n=13, so n<=12. The density reduction above and the separate five-packing lemma force mad<7. Only then does declared TUZA15 T0 give CS, contradiction.

This would prove CS for all graphs with nu<=4, using precisely M0/M3/SIX/T0 and the current reviewed ordinary lemmas. It would imply original H-D for k<=5 by applying restricted CS to its tight triangle residual of packing k−1 and the reviewed one-classified-residual theorem. It would not prove H-D-CS-min, universal CS, or unrestricted Tuza. These corollaries remain pending until the separate near-bipartite lemma and this interface receive fresh review.
