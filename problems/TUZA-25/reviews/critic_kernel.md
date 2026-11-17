> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: kernel transfer audit

**Verdict: the scoped ordinary transfers pass independent reconstruction.** The crown-exclusion and split-normalization conclusions are valid with the hypotheses stated below. Availability, the paper's kernel-size theorem, and its crown-finding algorithm remain unverified here. This is in-session independent AI reconstruction, not Lean verification or external peer review. No mathematical disagreement remains; one source-scope clarification is recorded.

Reviewed inputs: `KERNEL_TRANSFER_AUDIT.md` (initial review SHA-256 `62162936b170d1c7593487d2ff906818ac107df543d456919de90c6664fccecb`) and the downloaded Sheng–Xiao source `sources/literature/sheng_xiao_2308_16515v1.html` (SHA-256 `c191c7f85c2563587829128f46d8894de61ed254aaf7b3340f118499264ef7a0`). The source hash matches its retrieval manifest. I directly inspected the definition of spanning, the full fat-head crown definition and Lemma 3 in Sections 2–3, Rules 2–4 and the split proof in Section 4.1, and the setup and statement of Rule 9 in Section 4.3. The archived/source files were not edited. No antecedent is needed for the elementary transfers reconstructed here.

## Crown identities

Let C and X partition V(G). Retain every source condition: C is independent; H is exactly the set of graph edges uv for which some c in C is adjacent to u and v; no vertex of C is adjacent to X minus V(H); and there exists an edge-disjoint packing P of |H| triangles, each with exactly one vertex in C and exactly one edge in H. Because C is independent, both endpoints of every head edge belong to X. Put R=G-C-H and r=|H|.

Every triangle not in R contains a head edge. Indeed, it either meets H directly or uses a vertex c of C, in which case its opposite edge belongs to H by definition. This accounts for arbitrary crossing triangles, including triangles on X containing more than one head edge; no unproved region separation is being assumed.

For a packing D of G, select one head edge from each triangle of D not surviving in R. These selected edges are distinct because D is edge-disjoint, so at most r triangles are removed. Thus |D|<=nu(R)+r. Conversely, every edge of the witness packing P is either incident to C or in H, hence outside E(R); append P to any maximum R-packing to obtain nu(R)+r triangles. Therefore

    nu(G) = nu(R) + r.

Every R-cover extends to a G-cover by adding H, giving tau(G)<=tau(R)+r. Conversely every G-cover contains at least r distinct edges in the edge support of P, all outside R. Its intersection with E(R) is an R-cover, so tau(G)>=r+tau(R). Hence

    tau(G) = tau(R) + r,
    delta(G) = delta(R) + r, where delta = 2 nu - tau.

The neighborhood condition is part of the source definition and retained; it is stronger than needed for this identity proof. The proof uses an actual witness packing, not the existence of a candidate independent set or an unverified matching output. A nonempty C alone is not the same as r>0; positive-head reductions are the ones furnishing strict slack and strictly fewer edges.

The source's decision-problem prose sometimes speaks of solutions "of size k". The audit correctly works with extrema and explicit bounds, rather than interpreting this as equivalence for every exact cardinality k without the packing/cover threshold conventions.

## Consequences and their hypotheses

For r>0, R has fewer edges. If R satisfies ordinary Tuza, then delta(G)>=r>0. Thus a minimum-edge ordinary violation cannot have such a crown. For a minimum-CS failure, use the separately established tightness/non-B profile together with CS (hence ordinary Tuza) on smaller R; delta(G)>0 contradicts that tightness. This argument does not establish tightness from the crown identity alone.

For a graph J with delta(J)=1 and one-edge packing resilience, a positive crown of size r=1 is impossible: deleting its unique head edge destroys every triangle through C and leaves precisely the triangle family of R. Thus nu(J-h)=nu(R)=nu(J)-1, contradicting resilience. If r>=2, the identities give delta(R)=1-r<0. That is an ordinary Tuza violation in a proper subgraph. To exclude this second case, one needs the additional premise that every proper subgraph involved satisfies Tuza. A triangle-deletion residual of a minimum-edge CS failure has this premise because R has fewer edges than the original failure. Therefore **those actual residuals are positive-crown-free**. It would be unjustified to declare every arbitrary one-edge-resilient defect-one graph crown-free without that smaller-graph premise.

This is a necessary restriction. It neither finds a crown in an unresolved graph nor proves that a remaining crown-free graph has a different useful reduction.

## Rule 4 and equality structure

For a genuine split, both parts E1 and E2 of the incident edges are nonempty, and no actual triangle contains edges from both parts. Replace the vertex v by nonadjacent vertices v1,v2 and move each incident edge according to its part. Each old graph edge has exactly one image. Any old triangle through v has both incident edges in one part and survives exactly once. Conversely a new triangle cannot contain both nonadjacent split vertices, and its image is an old triangle. This is an incidence isomorphism of edges and actual triangles, giving exact nu and tau preservation and preservation of shared-edge triangle components.

The extra B claim needs more than abstract equality of optimum values, but it is valid. In a literal K4 or K5 triangle component, every pair of incident component edges at v lies together in a triangle, so all those edges stay in one split part. Thus a literal clique component remains the same literal clique after splitting. Conversely a literal clique component after splitting cannot contain both split vertices, so the map back to original vertices is injective on that component and gives the identical literal clique support. Incidence preservation ensures that no triangle component is merged or lost. Therefore B(G) iff B(G'). Vertex-sharing between different components and triangle-free background edges do not invalidate this argument.

Discard isolated vertices, or simply define v to count nonisolated vertices. Every finite simple graph satisfies 0<=v<=2m. Lexicographic order on

    (m, 2m-v)

is a well-founded order in nonnegative integers. An edge deletion decreases its first coordinate. A genuine split preserves m and increases the number of nonisolated vertices by one, decreasing its second coordinate. This is a legitimate smaller-object induction even though the split increases the ordinary vertex count. Choosing a minimum CS failure under this order also chooses a minimum-edge failure, so previously proved lemmas depending only on minimum edge count still apply. Empty split parts would not decrease this measure and must remain excluded.

## Rule 3 and the exact algorithm scope

The six edges in Rule 3 support a literal K4, and the source hypothesis excludes any other triangle using any of those six edges. Thus this is a complete shared-edge triangle component even if its vertices have other incident edges. Removing those edges gives exact increments nu(G)-nu(R)=1 and tau(G)-tau(R)=2. The removed component is a permitted B component, so B(G) iff B(R); both ordinary Tuza and the full equality classification transfer. Rule 2 likewise preserves the actual triangle incidence and B; isolated-vertex removal is treated as normalization rather than falsely claimed to decrease m.

**Source-scope clarification:** the paper's actual Rule 9 does not search over all crowns without restriction. After its packing adjustments it defines labeled edges L, then searches for a crown with nonempty C subset V minus V(L) and H subset L. The general identity above holds for any supplied crown satisfying the definition, but this must not be conflated with a proof that the paper's particular search finds every possible crown. The coordinator was notified. The exact algorithmic availability claim and its matching/expansion justification are outside this audit.

Rules 1 and 5 are decisions, and Rules 6–8 alter only the selected packing, not the graph. They do not independently furnish smaller graph objects for Tuza induction. Separate 3k decision kernels do not by themselves give a universal Tuza-safe graph reduction sequence.

The forced-cover identity min{|C|: C covers G and X subset C}=|X|+tau(G-X), for X subset E(G), is also correct: triangles hit by X disappear, and the other triangles must be covered in G-X. A response table over all X describes that given graph's boundary responses only. It does not locate a proper region or construct a smaller equivalent graph.

## Remaining obligations

The retained results are ordinary transfer lemmas and conditional normalizations. No crown availability theorem, discharging proof, kernel bound, finite graph census, unrestricted Tuza result, or universal CS result was independently established in this review. In particular, a legitimate reduction plus a strict payment does not answer whether a useful reduction exists in every unresolved residual. That is the unresolved bridge.
