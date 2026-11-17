> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review of the codegree-two defect-one classification

ACCEPTED with the explicitly declared Tutte–Berge and Staton inputs, 2026-11-16. Source: notes/codegree_two_defect_one_classification_v1.md. The coordinator separately opened the author-hosted Heckman–Thomas and Schrijver PDFs and checked their exact theorem statements. Their complete external proof suites are not newly certified here.

The intersection duality is exact: maximum triangle packing is alpha(X), and actual-edge covers correspond to graph-edge/singleton covers with optimum n-mu(X). The lower-bound pair-component argument is valid even with redundant chosen pairs. A triangle in X forces the four literal K4 faces, whose graph-edge codegrees are already saturated at two, so this entire component is isolated. Every other component is triangle-free subcubic.

I independently checked the Tutte–Berge arithmetic. If q1,q3 count small odd components after deleting s vertices, minimum degree two forces 2q1+2q3<=3s. Hence 4q1+2q3<=6s, and the counted vertices imply 5(o-s)<=n. Thus mu>=2n/5. Staton's 5n/14 bound then yields positive defect at least4n/35 in a nonempty minimum-degree-two remainder. Isolate and leaf recurrences each add exactly one defect. This proves positivity for all nonempty triangle-free subcubic components and forces a connected defect-one graph with a leaf to be K2.

In the leafless case n<=8; rounding the matching inequality gives alpha<=2. The elementary six-vertex triangle-free Ramsey argument forces n<=5, and minimum degree two leaves C5 (C4 has defect two). The actual C5 realization cases also check: equal hub choices force the wheel; a mixed choice would share a forbidden earlier edge; the two opposite choices force K5 and extra triangles. No unlabeled-graph census or omitted crossing triangle is used.

The K3/diamond critical-edge and wheel resilience claims are immediate from their intersection graphs. Thus the exact defect-one components, and the distinction from arbitrary near-tight graphs, are accepted.

## Minimum-CS residual consequence

For a minimum CS failure, existing ordinary active-kernel results show each G-e residual has exactly one nonempty defect-one triangle component of packing k, and each G-E(T) residual has one of packing k-1, with k>=5. If such a residual had every actual edge in at most two residual triangles, this reviewed classification would give its unique non-B component packing at most two; connected support excludes extra K4 components. Contradiction. Thus every one-edge and every triangle residual has an edge belonging to at least three of its actual residual triangles. This is an available necessary property, not a classification of the surviving higher-codegree class.
