> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: all-two-page triangle components plus matching books

Decision: ACCEPT, ordinary scoped CS theorem. Equality is classified for the stated minimum-cover shape when every triangle component has private packing number2. No assertion about q3 components or universal cover availability follows.

Frozen source: notes/challenger_two_page_triangle_matching_cs_v1.md
SHA256: 5837dcbfa75a432618553a1964102c5a3428ffd2688c6d1a615d933510d13858

## Compatibility reconstruction

The local q2 classification supplies exactly two full apices per triangle core. Retaining those apices and one arbitrary page per matching core gives a POTENTIAL mutual-target graph of maximum degree2; book vertices have degree at most1. Potential targets remain unchanged while full-apex base exclusions are adjusted.

A triangle-to-triangle2,2 pair is isolated and has the accepted conflict-free crossed labeling. A double-slot triangle leaf on a2,1 pair imposes exactly a two-element allowed set on the other triangle's reciprocal exclusion, and can later be completed. A book leaf incident to one triangle slot imposes one fixed exclusion, because the book page cannot change its base endpoints. A book receiving both triangle slots forms an isolated pair: distinct local exclusions can satisfy one of the two identical fixed requirements, leaving at most one actual conflicting page pair. The book/book pair similarly has only one possible conflict.

After those reductions, remaining components are paths or cycles of triangle cores. Cycle orientations give one fixed incoming exclusion per core and can be satisfied. A path has at most two endpoint conditions, as internal vertices already use their two mutual neighbors. Orienting toward a free or two-choice endpoint satisfies all conditions; with two fixed endpoints, at worst the final vertex has identical demanded labels on its two slots. Changing one label then violates only one reciprocal constraint. That constraint is a1,1 pair and creates at most one conflicting page pair, not two. Single-vertex paths with two conditions are handled by the same elementary distinct-label choices. Removed double triangle leaves can still be completed because their two-choice conditions were respected.

Thus each original potential component loses at most one page. For n=t+r>2 the resulting size2t+r-1 exceeds(3t+r)/2 by n/2-1. Singletons are strict, two triangle cores are strict by the full-apex lemma, and a triangle/book pair with only one reciprocal triangle slot is strict by one fixed exclusion. The only potentially tight pairs are exactly those retained in the source.

## Equality and varying choices

For equality, this classification applies to EVERY independent choice of the book pages; otherwise a strict component and the nonnegative bounds on all remaining components give a strict global packing. This universal step is essential and justified.

If a triangle is paired with a book whose endpoints are its two full apices, its only potential mutual target is that book. Any alternative book page with apex outside the triangle leaves the triangle isolated, forcing strictness. Thus all book pages have apices in that triangle, and all three are present. Together the assigned families are the ten actual triangles of K5.

For a book/book pair, fix the page on one side while varying the other. The fixed side has only that core as a possible mutual target. An outside alternative would isolate it. Reversing roles forces every apex of each book into the opposite base. Existing pages guarantee at least three cross edges. Exactly three yield exactly two assigned triangles sharing one cross spoke, so replacing both selected bases by that spoke contradicts minimum-cover optimality. Therefore all four cross edges exist and the assigned families are exactly K4.

The resulting pair families exhaust all actual G triangles because C is a cover. Each pair's identified family stays within its own disjoint core vertex set. No crossing triangle can remain assigned elsewhere without contradicting the corresponding identified family. Hence actual triangle components are precisely the literal K4/K5 patches, with triangle-free background permitted.

This proof accounts for arbitrary outside pages through the minimum-cover classification and universal book-choice argument. No bounded-core enumeration, formal oracle, or unproved equality implication is used. It does not solve the mixed-q3 equality branch.
