> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A conditional internal packing interface for a minimum tree cover component

Frozen v1, 2026-11-16. Status: ORDINARY_PROOF_CANDIDATE with an explicit counterexample to universal availability. No general TREE weighted theorem or PK statement is asserted.

## Exact conditional statement

Let C be a minimum ordinary triangle-edge cover of a finite simple graph G, let T be one connected component of its selected-edge graph, and suppose T is a tree on vertex set A. Assign every actual triangle to the unique C-component containing its selected edges. Let G_T be the edge support of the family assigned to T, and L=G_T[A].

Suppose an internal edge-disjoint triangle packing I in L and a set D⊆E(T) satisfy:

- D meets every actual triangle in L;
- D contains E(T)∩E(I);
- |D|≤2|I|.

Then the assigned family has an edge-disjoint triangle packing P whose weighted value, counting internal members twice and outside pages once, is at least |E(T)|. More exactly, one can keep I and append |E(T) minus D| outside pages.

D is allowed to contain selected edges unused by I. Its asserted availability is false in general, as the explicit boundary below proves.

## Proof by exact forest Hall selection

Every assigned external triangle has a unique base in T and one apex outside A. There are no edges with both endpoints outside A in G_T. For each outside vertex b, the possible page bases are exactly the edges of T induced by N_{G_T}(b). A nonselected internal edge cannot be the base of an outside triangle: that triangle would meet no edge of C.

Put F=T minus D. For every R⊆E(F), keep all original cover edges C minus R. These already cover all internal assigned triangles, because D is retained. To cover the external triangles whose bases lie in R, choose at each outside apex b a spoke vertex cover of R[N(b)]. The spoke families at different apices have distinct edges. Minimum cardinality of C therefore forces

    sum_b tau_vertex(R[N(b)]) ≥ |R|   for every R⊆E(F).

All the induced graphs here are forests, so their vertex-cover and matching numbers agree by the elementary leaf recurrence. Regard each outside apex as an allowed color on a forest base edge precisely when it completes that page. For each R the sum of maximum sizes of color matchings is at least |R|. The exact forest Hall list-edge-coloring lemma proved in `notes/one_sided_forest_exact_packing_v1.md` now supplies a proper choice of colors for every edge of F.

Translate these colors to actual outside pages. Distinct bases never share a base edge. Pages at different outside apices have disjoint spokes, while pages at the same apex have disjoint spokes because their bases form a matching. Thus this is an edge-disjoint packing of |E(F)| pages. Its spokes leave A and cannot meet I, and its bases avoid every T edge of I because E(T)∩E(I)⊆D. Every edge of an outside page lying entirely in A is its T base, so the remaining nonselected internal edges of I cause no conflict. The weighted total is therefore

    2|I|+|E(F)| = |E(T)|+2|I|−|D| ≥ |E(T)|.

This is ordinary reasoning using the already proved exact forest Hall lemma; no solver or deep external matching theorem is a premise.

## Literal minimum-tree-cover boundary to certificate availability

Take five core vertices a,c,d,x,y with precisely the seven core edges

    ac, ad, dc, ax, cx, ay, cy.

The internal graph is a three-page book with base ac and page vertices d,x,y. Select the four-edge tree

    T={ad,dc,ax,ay}.

For each e∈T add one distinct outside vertex b_e adjacent to exactly the two endpoints of e, and add no other edges. The literal graph has nine vertices, fifteen edges and exactly seven triangles: adc,acx,acy and the four pages on the selected tree bases. Every triangle meets T. The four outside pages are edge-disjoint, so ν≥4; since T is a cover of size four, ν≤τ≤4. Therefore ν=τ=4 and T is a minimum ordinary cover.

All internal triangles share ac, so an internal packing has size at most one. A cover of these internal triangles restricted to T must contain ax and ay and at least one of ad,dc; hence it has size at least three. Thus no pair I,D satisfying the conditional statement exists: I empty cannot admit a covering D of size zero, and |I|=1 permits only two edges. The extra requirement that D contain the selected edges used by I cannot repair this failure.

The weighted local target nevertheless holds, using all four outside pages and no internal member. This example refutes universal availability of this particular internal certificate, not the TREE weighted target, ordinary Tuza, or CS. It also shows why a method must allow the outside Hall capacity to pay for internal triangles without first assigning all of them to an internal packing.

## A separate useful endpoint restriction

Every internal triangle uses one or two tree edges. Two distinct two-tree-edge triangles cannot share their nonselected chord, because a tree has a unique path between its endpoints. Moreover, a one-tree-edge triangle can share a nonselected edge with at most one two-tree-edge triangle. To see this, write its selected base ab and other vertex c. In the bipartition of T, a and b lie on opposite sides, so exactly one of ac,bc has endpoints on the same side. Only that same-side edge can be the chord of a length-two tree path, and such a path is unique. This is a geometric restriction for a possible alternative selection argument; it does not imply the unavailable I,D certificate.
