# Route B — independent initial note

Frozen before receiving any other scout argument. Initial timestamp 2026-11-03T23:20Z was an estimate and is retracted. Filesystem creation timestamp (UTC): 2026-11-03T23:14:45.559936+00:00.
Baseline: public commit d4029fbafc3dffc250b50ed237ad81c3206cd1a0; tree 575200c778bf84e07bf46801d8c420d3f40b210b. Requested Astra/Ultra is not serving-model attestation.

## Leading candidate: saturated independent-twin compression
Let G be any finite simple graph and X a nonempty independent vertex set whose vertices all have exactly the same neighborhood S, disjoint from X. Put L=G[S], q=|E(L)|, m=|X|, and R=(G-X)-E(L). Require an explicit proper edge coloring of L using at most m colors. Proposed exact identities:

nu(G)=q+nu(R), tau(G)=q+tau(R), hence delta(G)=delta(R)-q.

The transformation deletes X and all rim edges E(L). It has arbitrary outside attachments at S and no restriction on the graph outside X. Its well-founded measure is |V|+|E|, strictly decreased whenever X is nonempty. Exact threshold may be weakened; m >= 2 Delta(L)-1 supplies an elementary greedy edge coloring, while Vizing gives m >= Delta(L)+1 if actually invoked. I will prefer an explicit coloring to importing Vizing.

## Shortest hypothetical complete proof
Choose a smallest Tuza counterexample in |V|+|E|. Prove that every such counterexample outside a known terminal class contains a saturated independent-twin class as above, or another explicitly certified compression. Apply the identity: delta(R)=delta(G)+q>0, contradicting minimality. Terminal graphs satisfy Tuza by the declared input.

## First unproved assertion
The global applicability theorem: every minimal counterexample outside the terminal class has one of the certified compressible structures. The exact identities themselves are the first local proof obligation and are not yet claimed. The existence assertion is neither supplied by minimal criticality nor implied by having a decreasing measure.

## Strongest likely obstruction
Dense twin-free graphs have no such X of size greater than one; requiring twins alone is implausibly narrow. Small X may fail badly because the same apex spokes are needed by several rim triangles. Outside attachments can consume rim edges or carry triangles sharing only vertices; all must be classified. Abstract Fano identities are inadequate: the candidate uses the graphic form of a twin-star triangle and proper edge coloring of the actual rim graph.

## Cheap rejecting test
Exhaust small rim graphs with explicit colorings and arbitrary small outside graphs, compute all actual triangles, and compare nu/tau against q+nu/tau(R). Symbolically, attempt to normalize an arbitrary packing by replacing each triangle meeting a rim edge by its rim-edge copies at X, and normalize an arbitrary cover by replacing X-spokes with rim edges. The same complete coloring must certify the replacement bounds. The four-port graph and Clebsch cone must be checked for applicability rather than treated as automatic counterexamples.

## Progress beyond known identities
A complete proof of exact identities with arbitrary outside attachments, plus an explicit full boundary-state interpretation, is a substantive scoped transfer lemma if not already in the archive/literature. It is not a solution and would merit only limited continuation unless a plausible global source of such modules emerges. A table of examples or the bare inequality tau(G)<=tau(R)+2r would not count. General S/E remain open and will not be assumed.

Timestamp correction: recorded 2026-11-03T23:15:45.338274+00:00. Creation timestamp is metadata evidence; no precise initial sampling clock was read.
