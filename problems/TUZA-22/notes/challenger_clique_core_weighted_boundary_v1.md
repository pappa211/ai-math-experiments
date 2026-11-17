> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A literal K4 minimum cover defeats the weighted local packing extension

Status: ORDINARY_COUNTEREXAMPLE_CANDIDATE; fresh review required. This refutes the weighted local inequality for arbitrary connected minimum-cover components. The conjectured TREE-component version is not refuted.

## Literal graph and objective

Let A={0,1,2,3} span K4. Add four independent vertices b0,b1,b2,b3, where bi is adjacent to exactly A minus {i}. There are no other edges. Set C=E(G[A]), so |C|=6. The graph has8 vertices,18 edges, and16 actual triangles: the four internal K4 triangles and three pages at each of the four outside apices.

For an edge-disjoint triangle packing P, assign weight2 to a triangle entirely in A and weight1 to a triangle using an outside apex. We prove

    tau(G)=6, nu(G)=4, maximum private packing=4,
    maximum weighted packing=5<|C|=6.

Thus even a literal clique component of a minimum ordinary cover need not satisfy the proposed local weighted payment bound. This is not a Tuza counterexample:6<2*4.

## Ordinary cover optimum is six

Consider any triangle-edge cover D, and write S=C minus D for its unselected internal edges. S must be triangle-free, or its internal triangle would be uncovered. The selected internal part costs6-|S|. At apex bi, the selected spokes must form a vertex cover of the graph S[A minus {i}], so their cost is at least

    h(S)=sum_(i=0)^3 vertex_cover_number(S[A minus {i}]).

Spokes at distinct apices are distinct graph edges. Every triangle-free graph S on four vertices has at most four edges. Its possible nonempty types give the following exact values:

- One edge: h=2.
- Two adjacent edges: h=3; two disjoint edges: h=4.
- Three-edge star: h=3; three-edge path: h=4.
- Four edges: S is C4 and h=4.

For S empty, h=0. These types exhaust the possibilities, and in every case h(S)>=|S|. Hence |D|>=6-|S|+h(S)>=6. The displayed C covers every actual triangle, so tau(G)=6.

## Packing optima

All pages at one apex bi have bases in its induced K3, so no two are edge-disjoint. Thus every all-private packing has size at most four. The four pages with bases12 at b0,23 at b1,03 at b2,01 at b3 are edge-disjoint, proving private packing number four.

A packing contains at most one internal K4 triangle. If it contains one, that triangle consumes three C-edges, leaving only three possible base edges for outside pages. Consequently its ordinary size is at most1+3=4 and its weighted size is at most2+3=5. If there is no internal triangle, its size and weight are at most four by the apex bound above.

Take the internal triangle012 and the outside pages03b1,13b2,23b0. They are edge-disjoint and attain ordinary size4 and weighted size5. Hence both stated optima are exact.

## Mechanism and scope

Ordinary minimum-cover optimality controls triangle-free subsets of C. It permits the K4 core because every such subset has at most four edges and the four face apices provide enough spoke-cover cost. A packing can use each face apex only once; one internal triangle improves its weighted value by one but leaves three base slots. This is the exact obstruction to extending the weighted TREE hypothesis merely to arbitrary clique or connected cover components.

All actual triangles have been listed by structural type; there are no triangles involving two outside vertices because they are independent. No solver verdict, census, or external theorem is a premise. The candidate TREE inequality remains open beyond the proved star case and the separate finite P4/P5 test.
