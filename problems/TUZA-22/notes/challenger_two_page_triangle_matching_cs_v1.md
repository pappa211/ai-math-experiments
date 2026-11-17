> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Equality when every triangle cover component has exactly two private pages in a maximum packing

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger reconstruction of the coordinator's equality lead, 2026-11-16 local date. This treats the all-two-page subclass; it does not classify equality when some triangle cover components have private packing number3.

## Theorem and local inputs

Let C be a minimum triangle cover whose components are vertex-disjoint triangles and single matching edges. Suppose every triangle component has maximum private packing number exactly2. Then G satisfies CS: tau(G)<=2nu(G), with equality only when its actual triangle components are literal K4/K5 blocks. In this cover shape the blocks obtained below are vertex-disjoint; triangle-free background edges are irrelevant.

By the local classification in notes/matching_and_triangle_cover_tuza_v1.md, each triangle core has exactly two distinct full apices and no other pages. Choose one private page for each matching core, arbitrarily. Keep the two full-apex slots at each triangle core, with freedom to choose their excluded terminals injectively.

Build the POTENTIAL mutual-target graph J on cores: i,j are adjacent when a page slot of each points into the other core. Triangle vertices have degree at most2 and book vertices at most1. The two full-apex slots are retained under every subsequent page resampling, so absence of a J-edge between components prevents every possible cross-component conflict. Internal core edges cannot equal spokes from another core. Reciprocal apex targets are the complete conflict mechanism.

## 1. At most one conflict in each component

For triangle-to-triangle reciprocal slots, the conflict is avoided when at least one slot excludes the opposite apex. A2,2 edge is isolated and is satisfied by complementary permutations, as in the two-full-apex lemma. A triangle with two slots pointing into a neighboring triangle is a leaf; eliminating it imposes a two-element allowed set on the neighbor's reciprocal excluded label, after which that leaf can be completed without conflict.

For a book-to-triangle reciprocal pair, the book page uses both endpoints of its base. Thus avoiding its conflict requires the triangle slot to exclude the book page's apex: this is one fixed label. If both triangle apices are the book's two endpoints, the component consists of this triangle and this book. The two triangle slots cannot both exclude the same fixed label, but one can; exactly one conflicting page pair remains. A book/book component also consists of two vertices and has at most one conflicting page pair.

After the isolated cases and double triangle leaves are removed, the remaining triangle vertices form paths or cycles. Removed book leaves impose fixed labels at path ends; removed double triangle leaves impose two-choice label sets. At most two endpoint conditions occur in a path.

A cycle has no endpoint conditions and is satisfied by cyclically orienting its reciprocal edges, making each vertex's incoming slot exclude the opposite apex, and filling its other slot differently.

For a path, orient its internal edges consistently toward an endpoint whose condition is free or has two choices, if such an endpoint exists. The other endpoint's condition is chosen first; every internal vertex has one fixed incoming label and one free slot. At the final endpoint a two-choice condition can avoid its one incoming fixed label. Thus every constraint is satisfied. If both ends have fixed book labels, orient consistently from left to right; only the right endpoint may have two identical required labels. In that event violate just one of those two constraints and choose distinct local labels. If the path has a single triangle vertex, the same assertion follows directly: two two-element sets have distinct representatives; one such set can avoid a fixed label; two equal fixed labels require only one violation.

All removed double triangle leaves can now be completed, since their two-choice conditions were retained. Hence each original component has at most one conflicting pair of selected pages. Deleting one page of that pair gives a packing of size at least

    2t_component + r_component − 1.

For a component with n=t_component+r_component>2, this is STRICTLY larger than (3t_component+r_component)/2, because the difference is n/2−1. Single-core components are also strict: a triangle gives2 pages for cover cost3, and a book gives1 for cost1. A two-triangle component is strict by the two-full-apex lemma, which gives4 pages for cover cost6.

The only possibly tight components are consequently a triangle/book pair or a book/book pair. A triangle/book pair with only one full-apex slot pointing into the book is also strict: satisfy its one fixed excluded label and fill the other slot differently, retaining all3 pages. Thus a tight triangle/book pair requires both full apices to be precisely the two book endpoints.

These component packings combine, by potential-target isolation. In particular they prove the inequality in this subclass.

## 2. Equality forces the pairings for every choice of book pages

Assume tau(G)=2nu(G). The book page choices above were arbitrary. For EVERY such choice, J must consist solely of possibly tight two-core components of the two types just identified; any other component gives a strict global packing.

Consider a triangle/book pair. The triangle's two full apices are the book endpoints x,y. If the book had a private page with apex outside the triangle core, choosing that page would leave the triangle isolated in J: its only possible mutual neighbor is this book, because both of its slots point there. This would give strictness. Hence every book page has apex in the triangle core. All three such pages exist because x,y are full apices. The two assigned families are therefore exactly the triangles of a literal K5.

Now consider a book/book pair, with bases ab and cd. Fix a page of the first whose apex is an endpoint of cd. That chosen first page can have only this second core as a mutual target. Varying the second book's page arbitrarily therefore forces every second-book apex to lie in {a,b}; otherwise the first core is isolated and gives strictness. Fixing any such second page and varying the first similarly forces every first-book apex into {c,d}.

At least one page on each base exists, forcing at least three of the four cross edges between {a,b} and {c,d}. If exactly three exist, the two assigned triangles share the one common cross spoke. Replacing both cover bases by that spoke covers both assigned families and improves C, impossible. Hence all four cross edges exist and the two assigned families are exactly a literal K4.

## 3. Literal equality classification

The resulting pairs partition all cover components. Their core vertex sets are disjoint, and their complete assigned triangle families have just been identified as the actual K4 or K5 families on those vertices. Every G triangle is assigned to a cover component because C is a cover. Therefore no additional triangle lies outside these patches or joins them through a shared edge. The actual triangle components are exactly the literal K4/K5 blocks, giving B(G).

Conversely B implies equality by the elementary block parameters. This completes the scoped CS theorem. QED.

## Limits and dependencies

The proof uses only minimum ordinary-cover optimality, the exact two-apex local classification, literal reciprocal-edge geometry, and the independently reviewed two-full-apex compatibility lemma. The universal quantifier over book-page choices is essential to support isolation in the equality step. The argument does not replace potential targets by the conflicts of one fixed page selection.

This extends the equality result to arbitrary numbers of triangle components ONLY when all of them have private packing number2. The general mixture theorem remains an inequality theorem; its weight2/q3 equality configurations require a separate argument. No availability of a triangle-and-matching minimum cover is asserted.
