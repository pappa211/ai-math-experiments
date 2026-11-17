> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Minimum cover consisting of one triangle and a disjoint matching

Coordinator ordinary proof candidate, 15 November 2026. Frozen for fresh AI review. This is an all-size scoped CS theorem, not a statement that arbitrary graphs admit such covers.

## Statement

Suppose a minimum triangle edge cover C of G is the disjoint union, on vertices, of the three edges of a triangle T=abc and a matching M of r edges whose endpoints avoid a,b,c. Then G satisfies CS. In the equality case its nonempty triangle components are one literal K5 and some literal K4s. (Triangle-free background is unrestricted.)

If r is even, the inequality is strict. If r is odd, equality is possible, e.g. a K5 together with (r−1)/2 vertex-disjoint K4s, covered by T plus the matching of their remaining minimum-cover edges.

## Complete triangle partition

A triangle distinct from T either contains exactly one M edge, or contains exactly one edge of T and no M edge. Indeed two matching edges cannot meet in a triangle, and two edges of T would force the third edge of T and the triangle T itself. A triangle cannot contain both an M edge and a T edge, whose endpoints are disjoint. Since C covers all actual triangles, these cases exhaust the family.

Call the triangles with M base i book i, and call the entire family using T edges N. Every book is nonempty because C is minimum and therefore inclusion-minimal. In fact every M edge has a private witness, necessarily in its book. N consists exactly of T and pages on its three bases. There is no triangle using zero C edges.

A selection of one triangle from each M-book has intersection graph a matching plus isolates. A chosen triangle on base uv and apex x can conflict only with the chosen triangle in the unique other M-book whose base contains x, if such a book exists. Intersection with that triangle requires reciprocal endpoint choice. Thus every selected triangle has at most one conflict. A selection of r triangles with t conflicting pairs yields a packing of r−t triangles.

The triangle T is edge-disjoint from every M-book triangle, regardless of its apex. Therefore every such selected packing appends to T.

Also N needs at least three cover edges. Otherwise a cover of N of size at most two, together with M, would cover all G-triangles with at most r+2 edges, contradicting |C|=r+3. Hence N has packing number at least two: if its packing number were one, the pairwise-intersecting triangle family would be a book or lie in a literal K4, and have a cover of size at most two. This is the elementary graph-triangle intersection classification; alternatively it follows from the reviewed R1 theorem on the literal N-support graph.

## Universal perfect-selection rigidity

We use the following fact already reconstructed in the matching-cover theorem. If a family of nonempty books on pairwise vertex-disjoint bases has the property that EVERY one-per-book selection has a perfect matching as its intersection graph, then the books partition into fixed pairs. Each pair's triangles use only its four base endpoints, and every triangle in one book intersects every triangle in its paired book. Proof: fix one triangle of book i, with apex x. Its only possible conflicting book j is the one whose base contains x. Perfect matching for every selection forces every j-choice to meet it. Fix a j-choice and vary i to force all i-apices onto j's base; the reverse statement follows likewise. No other book can belong to this pair.

Such a pair has either exactly three of its four cross edges, giving two triangles with one common cross edge, or all four cross edges, giving the literal K4 faces. When M occurs inside the minimum cover C, the three-cross-edge case is impossible: replace the two matching bases by the common cross edge, retaining T and every other M base. This covers every triangle with one fewer edge. Consequently all rigid pairs are literal K4 families.

## Even r

Write r=2s. If some selection has any isolate, it has at least two, so it gives at least s+1 independent selected triangles. Appending T gives nu(G)>=s+2. Since tau(G)=2s+3, this proves strict Tuza.

It remains the case where every selection is a perfect matching. Rigidity partitions all M-books into s fixed pairs, and minimality makes each pair a literal K4. In particular every M-book triangle uses only M endpoints, so its edges avoid the vertices a,b,c. Every edge of an N-triangle is either inside T or joins a terminal to its page apex, hence is outside the support of every M-book triangle. Thus the two triangle families have disjoint edge support. Their packing numbers add; the K4 pairs supply s and N supplies at least two. Again nu(G)>=s+2 and strict Tuza follows. This includes r=0, with the empty selection and empty paired family.

## Odd r and the equality boundary

Write r=2s+1. Every selection gives at least s+1 packed book triangles, so appending T gives nu(G)>=s+2. Therefore tau(G)=2s+4<=2nu(G), proving Tuza.

Assume equality, so nu(G)=s+2. Every one-per-book selection must have exactly one isolate: having three or more would give at least s+2 packed book triangles, plus T, a contradiction.

If every M-book triangle has apex among M endpoints, then all book supports avoid a,b,c. As above they are edge-disjoint from N. A book packing of s+1 plus an N-packing of two would give s+3, contradiction. Thus some book i has a triangle U whose apex is outside all M endpoints. Such U has no conflict with ANY book triangle.

Fix this U. In every selection of the other 2s books, the intersection graph is a perfect matching; otherwise their at least two isolates, together with U, would violate the exactly-one-isolate condition. Apply rigidity to these other books. They partition into s pairs, all literal K4 families by minimum-cover replacement. Their entire supports use only their respective four M endpoints.

No triangle in the remaining book i can share an edge with one of these K4 supports: it contains the base of i and two spokes incident with its endpoints, while the K4 support contains neither endpoint of that base. The K4 supports are mutually disjoint as well. Consequently H=G−E(T) has exactly these s literal K4 triangle components and the one remaining book component (possibly sharing vertices), plus triangle-free background. There are no other triangles by the original partition.

Apply the reviewed book-residual triangle restoration theorem to H and T. Equality forces the one book to have precisely three pages with apices a,b,c, and restoration completes it to a literal K5; the K4 components remain. Hence B(G). The universal implication B=>equality gives the other direction. QED.

## Exact minimum-CS consequence

If a minimum CS failure has k=4, the independently reviewed eight-edge-cover kernel gives n<=13, using the declared M3/SIX inputs. Choose its minimum cover of eight edges containing a triangle T. If n=13, equality in the endpoint bound 3+2*5 forces the other five edges to form a matching disjoint from T. The present theorem excludes that case. Therefore the combination would sharpen the bound to n<=12. This does not exclude the remaining finite class or establish unrestricted CS.

## Dependencies and review targets

The theorem uses the elementary one-per-disjoint-base conflict rule, minimum-cover replacement, the pairwise-intersecting triangle classification, and the independently reviewed book-residual restoration theorem. The n<=12 corollary additionally uses M0/R1 and the k4 kernel with its explicit M3/SIX inputs. Check in particular that every actual triangle belongs to N or a matching book, that outside-base apices give a fixed isolated selection, and that the K4 families are actual triangle components after deleting T. No maximum-packing enumeration is used.
