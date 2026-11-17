> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tuza's inequality from a minimum cover of disjoint triangles and matching edges

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh review. Coordinator construction, independently reconstructed and written by the challenger, 2026-11-16 local date. Scope: the inequality only. No equality classification, universal cover-shape availability, or unrestricted CS conclusion is claimed.

## Theorem

Let G be a finite simple graph with a minimum triangle-edge cover C whose nonempty edge-components are t vertex-disjoint triangles and r single matching edges, all mutually vertex-disjoint. Then

    tau(G)=3t+r <= 2nu(G).

The numbers of cores, outside vertices, pages, and reciprocal core interactions are unrestricted. If C is empty the result is immediate, so assume otherwise.

## 1. Assigned families and private pages

Every actual triangle has all its C-edges in exactly one cover component, because two edges of a triangle share a vertex. For a matching component, its assigned family is a book on that base, and it has a private page because a minimum cover is inclusion-minimal.

For a triangle component T, its assigned family is T itself together with all pages on its three edges. Every page has exactly one C-edge. The assigned family has cover number3: otherwise a smaller family cover together with C outside T would improve the ordinary cover of G. Every T-edge has a private page.

A pairwise edge-intersecting actual triangle family is a book or lies in a K4, and has a two-cover. For completeness, two distinct triangles may be written abc,abd. A triangle avoiding their common edge ab but meeting both must be acd or bcd. Once such a third triangle exists, any triangle meeting all three must have all its vertices in {a,b,c,d}; otherwise it could contain only one edge on those four vertices, and no single edge meets all three. If no triangle avoids ab, the family is a book.

Consequently the assigned T-family has a two-packing. Since T meets every page, a two-packing consists entirely of private pages. A private packing here has at most3 members, one per T-base. Thus its maximum size is either2 or3.

## 2. The exact two-page case

Suppose the private packing number at T is2. Let P_e be the nonempty apex set for each of its three base edges. An apex appearing in two sets is adjacent to all three core vertices, and appears in all three sets. Distinct representatives from the three sets would give three private pages with distinct bases and distinct apices; those pages are edge-disjoint.

Since no such representatives exist, the three-set Hall alternatives give either two sets with union of size1, or a total union of size at most2. The first alternative would make the two sets both {x}; selecting the third T-edge and the spoke from x to the common terminal of the first two edges gives a two-cover of the assigned family, impossible. Hence the total union consists of exactly two vertices x,y. Both are full apices: one must occur on at least two bases and hence all three; if the other appeared only on one base, the other two sets would again be the same singleton. Thus all three apex sets are exactly {x,y}.

There are therefore precisely two full apices and no other pages in the two-page case. This is a statement about the assigned family; the actual apex edge xy may exist in another cover component.

Choose a private two-packing at each such core. It uses both full apices. At every other triangle core choose a private three-packing. At every matching core choose one private page.

## 3. The potential mutual-target graph

Let the chosen local packing size be q_i=2 or3 at a triangle core and q_i=1 at a matching core. Its external pages each have a base in their own core and an apex outside that core.

Two pages from different vertex-disjoint cores can share an edge only reciprocally: the first apex lies in the second core, the second apex lies in the first core, and their common edge joins those two apices. A base cannot equal another core's base or spoke. An internal triangle core T_i never conflicts with another core's page, because that page has at most one vertex in T_i.

Define the simple graph J on all n=t+r cores by joining i,j whenever at least one chosen i-page has its apex in core j AND at least one chosen j-page has its apex in core i. This records POTENTIAL reciprocal conflicts, regardless of whether the particular excluded endpoints actually create a shared edge. Each neighbor consumes an outgoing apex slot, so

    degree_J(i)<=q_i.

Give each triangle core baseline1 and weight w_i=q_i−1, and each matching core baseline0 and weight w_i=1. All weights are1 or2, every degree3 vertex has weight2, and matching-core vertices have degree at most1.

For an independent set I in J, select all q_i chosen pages at cores in I; at every triangle core outside I select its internal core triangle; at matching cores outside I select nothing. The complete conflict accounting above makes this a packing, of size

    t + sum_(i in I) w_i.

## 4. Weighted independent-set lemma

Let J have maximum degree3, vertex weights1 or2, and every degree3 vertex of weight2. Delete any components that are odd cycles with all weights1. In the remaining graph,

    alpha_weight(J)>=|V(J)|/2.

Proof by induction. If a degree3 vertex v exists, take v and delete its closed neighborhood, which has exactly4 vertices. The gain is w_v=2. No new all-weight1 odd-cycle component can appear: every vertex on such a cycle already has its two cycle neighbors, while its ORIGINAL degree was at most2 because its weight is1. It therefore had no neighbors outside that cycle originally, so the cycle would have been an originally excluded component. Apply induction to the remainder and obtain2+(n−4)/2=n/2.

If no degree3 vertex exists, components are paths and cycles. Paths and even cycles have an independent set of at least half their vertices, using only that every weight is at least1. An odd cycle in this remaining graph contains a weight2 vertex. A maximum-cardinality independent set containing that vertex has floor(n/2) vertices and weight at least floor(n/2)+1>n/2. Summing over components proves the lemma.

## 5. Exceptional odd cycles are handled by full-apex compatibility

An all-weight1 odd-cycle component of J contains no matching core, whose degree is at most1. All its vertices are triangle cores with private packing number2 and exactly two full apices.

The ordinary lemma notes/challenger_two_full_apices_packing_v1.md supplies two compatible private pages per core in such a component. It permits apices in other cores or outside, and handles all reciprocal interactions simultaneously. Its choices use exactly the same two full apices at each core; only the excluded terminal of each page changes.

These replacement pages cannot conflict with the local choices at cores outside this J-component. Any possible conflict would require a reciprocal apex target, and these targets are unchanged by the replacement and would already be an edge of J crossing the component boundary. Internal triangle choices outside are also harmless. Different exceptional components are compatible by the same reasoning.

If an exceptional component has s vertices, it thus contributes2s pages, exceeding the required3s/2. On the remaining cores the weighted lemma and independent-core selection give at least t_remaining+(t_remaining+r)/2. Adding the exceptional contributions yields

    nu(G) >= (3t+r)/2.

Since tau(G)=|C|=3t+r, the theorem follows. QED.

## Evidence level and limitations

The proof is ordinary and all-size. It uses the elementary intersecting-triangle lemma, three-set Hall, the weighted graph induction, and the already independently reviewed two-full-apex compatibility lemma. No census, numerical optimization, or asymptotic theorem is used.

Minimum ordinary-cover optimality is essential to the local three-cover condition and the exact two-apex classification. The proof does not say that an arbitrary minimum cover decomposes into these cores. It proves Tuza's inequality for this cover shape but does not classify equality, and therefore does not by itself rule out a minimum CS failure with this shape. The existing one-triangle-plus-matching CS theorem remains a separate stronger equality result at its narrower scope.
