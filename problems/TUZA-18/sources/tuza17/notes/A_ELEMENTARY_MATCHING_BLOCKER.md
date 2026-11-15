# Elementary proof supplement to critical apex nonsaturation

This supplement removes the need to leave Tutte–Berge as an unproved dependency for the NS and NS-state deductions in A_CRITICAL_NONSATURATION.md. Those deductions, together with the elementary proof below, are PROVED_ORDINARY. The earlier Tutte–Berge proof is retained as an alternative, not silently rewritten. The matching argument is attributed prior art; NS originality remains UNESTABLISHED. No Lean or separately commissioned final verification was run.

## Attributed elementary matching argument

Reconstructed from Alexander Schrijver's CWI exposition, *The Tutte-Berge formula*, undated one-page author PDF, https://homepages.cwi.nl/~lex/files/tutteb.pdf, inspected 4 November 2026:

Suppose connected F has no vertex covered by every maximum matching. A maximum matching cannot be perfect. If all maximum matchings missed at least two vertices, choose M and unmatched u,v minimizing their distance. They cannot be adjacent. Choose an interior vertex t on a shortest u-v path. Choose a maximum N missing t with |M intersect N| largest. N covers u,v, since otherwise it misses a closer pair. Equal cardinalities imply that at least two M-covered vertices are missed by N; choose one x different from t. Let xy belong to M. Vertex y is N-covered, or xy would augment N. Replace y's N-edge by xy. Cardinality and the omission of t persist, while the intersection with M increases: contradiction. Thus mu(F)=(|V(F)|-1)/2.

For any graph with an edge, select an edge-containing component. If it has a universally covered vertex, delete that vertex. Otherwise the preceding argument applies; delete any two vertices. In both cases its matching number drops, and component additivity gives the required blocker of size at most two.

## Fully explicit bridge to NS

The just-proved blocker lemma holds for every ordinary finite graph with an edge, without any invocation of a classical theorem left unproved in this supplement. In a true edge-minimal Tuza counterexample, every nonisolated v has an edge in its link L. Choose its one/two-vertex blocker U and delete the corresponding one/two spokes from G. Critical deletion resilience preserves nu(G), whereas any packing in the resulting graph has at most nu(G-v) old triangles plus mu(L-U)<=mu(L)-1 apex triangles. Therefore

    nu(G)<=nu(G-v)+mu(L)-1.

Appending the apex pages of any maximum link matching M to a maximum packing of (G-v)-M gives

    mu(L)+nu((G-v)-M)<=nu(G),

so nu((G-v)-M)<=nu(G-v)-1. Matching EDGES are deleted in this last expression. This repeats the short deduction to make the final ordinary dependency chain complete; the substantive new information is the mandatory packing conflict, not the classical matching lemma.

## Limits retained

No true minimal counterexample is known or used in a computation. This condition supplies no cover-saving operation or availability theorem. Our strengthened blow-ups violate it by full apex saturation and hence explicitly fail true criticality despite their other relaxed properties. K4 and K5 satisfy strict apex nonsaturation without being counterexamples; nonsaturation alone is not a sufficient hypothesis for a new positive theorem. The abstract Fano plane has no supplied graph apex/link/matching representation, so no generic hypergraph conclusion is inferred.
