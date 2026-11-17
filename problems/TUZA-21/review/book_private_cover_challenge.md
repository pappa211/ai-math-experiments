> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent challenge of the regenerated private-witness hypothesis

The coordinator proposed the following provisional strengthening: for every minimum ordinary triangle cover C of every finite simple graph G, the family F_C of all actual triangles meeting C in exactly one edge has an edge-disjoint packing of size at least `ceil(|C|/2)`. If true, this implies Tuza immediately. This review neither proves nor refutes the full statement.

## Literal finite challenge

The independently authored `scripts/book_private_cover_probe.py` constructs random literal graphs on 6–9 vertices, reconstructs all their triangles, computes exact ordinary minimum-cover size by a memoized branching recurrence, enumerates all minimum covers, and computes exact packing numbers in each F_C by an include/exclude recurrence. No producer checker, external solver, or historical census is imported.

Seed 21003 generated 500 graphs, of which 479 contained triangles. The full minimum-cover enumeration for every triangleful graph completed: 3,032 minimum covers, zero capped cases, zero UNKNOWN cases, and no refutation. The per-graph cover cap was 2,000, but no case reached it. The run used 29.605 seconds, peak self RSS 692,518,912 bytes on Darwin, with an external process RSS snapshot of 527,232 KiB during execution. The internal 45-second guard was reached only at enumeration nodes, so it was not a hard external process deadline; this limitation did not affect the completed sub-30-second run. The exhaustive recurrences have no solver trust dependency beyond ordinary Python execution. This is a cheap finite falsification attempt, not evidence of a global mechanism.

`results/book_private_cover_probe.json` retains the seed, ordered labels and probabilities, case sizes, exact minima, cover counts, and outcomes. The literal graph sequence is reproducible from the preserved script and Python version (3.12.12). There were no partial graph cases requiring separate retention.

## A small ordinary base case

**Lemma.** If C is a minimum ordinary triangle cover and `nu(F_C)<=1`, then `|C|<=2`. This proves only the first nontrivial packing-number case of the provisional statement. It does not remove an unrestricted proof obligation.

If F_C is empty, C is empty: each edge of an inclusion-minimal cover must have a private witness triangle, or could be deleted. Assume F_C is nonempty and pairwise edge-intersecting.

A pairwise edge-intersecting family of graph triangles either has a common edge or is contained in the four faces of one K4. For completeness, choose two different triangles uvx,uvy. If uv is not common to the family, a third triangle meeting both without uv must be uxy or vxy; assume uxy. Any triangle meeting all three in graph edges is then one of the four triples on {u,v,x,y}. This proves the classification. Families with fewer than two distinct triangles have a common edge.

In the K4 case, every edge of C has a private witness, so C lies in the edges of that K4. Every actual triangle with one C-edge is already a member of F_C, hence lies in the K4. Every triangle with at least two C-edges also lies in the K4, since two different triangle edges determine all three vertices. There are no actual triangles with zero C-edges. Thus every actual triangle lies in this K4 and two opposite K4 edges cover all of them. Minimum cardinality of C gives |C|<=2.

In the common-edge case, write the common edge uv. If uv belongs to C, every private witness uses uv as its unique C-edge. As every C-edge has a private witness, C={uv}.

Suppose uv does not belong to C. Every C-edge has a private witness containing uv and must therefore be uw or vw for some w. Define A={w:uw in C} and B={w:vw in C}. These sets are disjoint: if both uw and vw were red, the only possible private witness containing uv for either edge, namely uvw, would have two C-edges. For w in A, vw exists and is outside C; for w in B, uw exists and is outside C.

There is no edge between two vertices a,a' in A: it could not belong to C, and otherwise vaa' would be a triangle avoiding C. Similarly there is no edge inside B. There is no edge ab with a in A,b in B: again it would be outside C, and uab would then be a private witness triangle avoiding uv, a contradiction. Thus no actual triangle contains two C-edges: two same-endpoint red spokes have no joining edge, and red spokes at opposite endpoints are disjoint unless they share a tip, which disjointness of A and B excludes. Every triangle therefore has exactly one C-edge and belongs to F_C. The single edge uv covers them all, so |C|=1.

This proves the lemma.

## Remaining obstruction

Let Q be a maximum packing in F_C. Each Q triangle consists of one C-edge and two edges of the triangle-free complement H=G-C. A private witness for a C-edge not used by Q must meet Q, necessarily on one of its two H-edges. This is a genuine endpoint formulation, but it does not yet construct a cheaper cover if `|C|>2|Q|`.

Replacing many C-edges by H-edges that cover their private witnesses can uncover actual triangles with two or three removed C-edges. Minimum cardinality of C controls the complete replacement family, not only the one-C-edge triangles. Decomposing the private-witness intersection graph does not automatically decompose these additional triangles. A successful proof needs a structural theorem handling these multi-C-edge triangles and their coupling across private-witness components. Simply retaining all exact replacement constraints would restate the problem.

The finite survival and the packing-number-one lemma do not supply that missing theorem. No recommendation to expand the census follows.
