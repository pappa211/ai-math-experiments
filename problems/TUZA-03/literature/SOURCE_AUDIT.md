# Fresh published-source and originality audit

Date: 29 October 2026. Role: independent source checking and bounded literature comparison. This review read the selected mathematical arguments rather than relying on the prior executive summaries. It is separate from the reconstruction and adversarial workstreams. No external researcher was contacted. No priority claim follows from a search that found no predecessor.

## Findings

The published inputs used by the selected proofs have the required scope, provided their integer/fractional and graph/hypergraph distinctions are retained. In particular, HKT's flat-graph theorem has no planarity hypothesis. The potentially substantial project contributions are the compatible restoration arguments and the closed-boundary mechanism, not the underlying Aharoni, HNS, HKT, Hall, König, or perfect-graph theorems.

A targeted new comparison matters for the compression claim: linear-size decision kernels for edge-triangle packing and covering already exist. The project's quadratic bound must not be advertised as an improved kernel. Its distinct proposed content is simultaneous, exact preservation of both optimization parameters of both the old and restored graph, with the designated restored edges retained.

The unrestricted two-triangle theorem, OCT five, and the fixed c<3 density extension remain unproved in the supplied arguments. No checked external source fills that gap.

## 1. Sources independently checked

### Aharoni: tripartite matching-cover inequality

Ron Aharoni, *Ryser's conjecture for tripartite 3-graphs*, Combinatorica 21 (2001), 1–4, [publisher record](https://link.springer.com/article/10.1007/s004930170001), DOI 10.1007/s004930170001. The required input is tau<=2nu for finite 3-partite 3-uniform hypergraphs. The publisher record was checked; the accessible HNS author manuscript also explicitly attributes and derives this inequality in Section 3, Proposition 3.2(iii) and its following paragraph. This audit did not independently reprove Aharoni's topological argument. Graph-edge deletion preserves the required tripartition because surviving triangles form a subhypergraph of the full old triangle hypergraph.

### HNS: equality and home-base extraction

P. Haxell, L. Narins, T. Szabó, *Extremal Hypergraphs for Ryser's Conjecture*, JCTA 158 (2018), 492–547, [author manuscript dated 18 March 2018](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf), DOI 10.1016/j.jcta.2018.04.004. Theorem 1.1 characterizes equality by home-base structure. Definitions 7.1–7.4 and Proposition 7.5, manuscript pp. 19–21, support simultaneous disjoint loose-cycle extraction. Three auxiliary matchings saturating the central triples give distinct vertices within each part; distinct parts and the partition ensure all other required disjointness. Parallel hyperedges are allowed, so simple triangle hypergraphs qualify. The conversion of a loose cycle of actual graph triangles into a K4 and exhaustion of all triangles by equality blocks are elementary project deductions, not a direct quotation of HNS. No HNS slack-one classification is supplied by this source.

### HKT: K4-free flat graphs

P. Haxell, A. Kostochka, S. Thomassé, *Packing and Covering Triangles in K4-free Planar Graphs*, Graphs and Combinatorics 28 (2012), 653–662, [author manuscript dated 21 April 2011](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf), DOI 10.1007/s00373-011-1071-9. Theorem 2, manuscript p. 2, assumes K4-free and flat, meaning each graph edge lies in at most two triangles. It proves tau<=3nu/2 and identifies equality with five-wheel components. It does **not** assume planarity. The triangle-component reading is confirmed by Claim 5, Lemma 8, and the proof of Theorem 2 on pp. 3–5: the triangle graph is a disjoint union of C5s. Thus arbitrary overlap at graph vertices and extra triangle-free edges do not invalidate the intended decomposition. A five-wheel here has five rim vertices and a sixth hub vertex.

### HKT: fractional stability

The same authors, *A Stability Theorem on Fractional Covering of Triangles by Edges*, European Journal of Combinatorics 33 (2012), 799–806, [author manuscript dated 3 February 2011](https://www.kostochk.web.illinois.edu/docs/accepted/frac-ht.pdf), DOI 10.1016/j.ejc.2011.09.024. Theorem 1, p. 2, starts from fractional tau*>=2nu-x, and supplies nu-floor(10x) edge-disjoint K4s plus floor(10x) further triangles. Its following paragraph characterizes fractional equality by K4 triangle components. Neither the premise nor equality may be inferred from integer slack one. Section 2's K4 attachment definition requires exactly one old edge in the new block, not two fresh vertices. Claims about fresh-vertex stars therefore require the additional project argument before they cover general HKT structures.

### Strong Perfect Graph Theorem

M. Chudnovsky, N. Robertson, P. Seymour, R. Thomas, *The strong perfect graph theorem*, Annals of Mathematics 164 (2006), 51–229, [publisher](https://annals.math.princeton.edu/2006/164-1/p02), DOI 10.4007/annals.2006.164.51. A graph with no induced odd cycle of length at least five and no complement of one is perfect. This is the external input in the nine-cycle-page part of the mixed-bowtie proof. The cycle-page intersection-graph analysis and the fact that its cliques admit a common graph-edge cover remain project obligations. Perfectness alone does not identify triangle-edge covers in an arbitrary triangle-intersection graph. The shared-apex subtheorem does not require this source.

### Bilaterally complete tripartite graphs

N. Amarnani, A. De Burgos, W. Broughton, *Packing and Covering Triangles in Bilaterally-Complete Tripartite Graphs*, [arXiv:2307.08824v1](https://arxiv.org/html/2307.08824v1). Definition 1 and Theorem 1 assert tau=nu for ordinary vertex-tripartite graphs having two complete bipartite sides. The paper expressly acknowledges an alternative derivation from older matching results. Consequently the closed join of an independent apex set to a bipartite graph is covered directly. The adjacent-apex join is not ordinary tripartite when it contains a K4, though deleting its apex edge allows an application. This result should be cited for the corresponding supporting material, not presented as a new general two-apex theorem.

### Existing kernels: a necessary originality comparison

Z. Sheng, M. Xiao, *A Discharging Method: Improved Kernels for Edge Triangle Packing and Covering*, [arXiv:2308.16515v1](https://arxiv.org/html/2308.16515v1), 31 August 2023. The definitions in Section 2 are threshold decision problems; the paper gives 3k-vertex kernels for each. Section 4 includes reductions that lower the parameter. Earlier work includes Y. Yang, *Towards optimal kernel for edge-disjoint triangle packing*, Information Processing Letters (2014), [DOI 10.1016/j.ipl.2014.02.003](https://doi.org/10.1016/j.ipl.2014.02.003), with a 3.5k-vertex decision kernel. These sources establish that polynomial or linear bounded reductions for individual triangle problems are not new. Their stated guarantees do not automatically preserve the four original optimum values and six designated restored edges demanded here.

### Other scope comparisons

H. Lu and X. Ma, [*Matching stability for 3-partite 3-uniform hypergraphs*, arXiv:2410.15673v2](https://arxiv.org/html/2410.15673v2), Theorem 1.3, assumes balanced classes of size n>max{m,162}, at least (m-1)n²+3n-m edges, and matching number m; its conclusion is tau=m. A linear tripartite hypergraph has at most n² hyperedges, so for m>=2 this does not supply the graphical slack-one input.

Z. Liu and Q. Zeng, [*Tuza's Conjecture under an Edge-Count Condition*, arXiv:2610.15539v1](https://arxiv.org/html/2610.15539v1), Theorem 1.3, gives fixed c<2 and sufficiently large order under e(G)>=n²/4-cn. Its OCT lemma and density argument do not establish OCT five or c<3. S. Wang, [*A Bound Below 2.8 for Tuza's Conjecture*, arXiv:2609.13831v1](https://arxiv.org/html/2609.13831v1), uses the complete family of triangles with exactly one red edge in Lemmas 2.1–2.3. That premise is not a license to discard mixed restored triangles or to replace a full family by an arbitrary selected family. Neither preprint's separate formalization claims were rerun here.

## 2. Exact project contribution and source boundary

The following assessments are about source validity and additional content. Final proof classifications also require the reconstruction and adversarial reports; this source review alone is not a substitute for those reviews.

| Candidate | Source boundary and additional content | Recommended treatment |
|---|---|---|
| A. Two-triangle exact equality | G finite simple, T1,T2 edge-disjoint, full D(H) tripartite, tau(H)=2nu(H). TUZA-01 publishes one-triangle restoration and K4 avoidance; the two-triangle extension needs the new-family and mixed-bowtie four-edge cover argument. It already appears in the pre-TUZA-02 follow-up preserved in `context/PRIOR_FOLLOWUP_CANDIDATE.md`. | Include as foundation, credit as prior follow-up rather than TUZA-02 discovery. Do not imply it is part of TUZA-01's existing Lean theorem. |
| B. Essential-edge restoration | Requires integer slack one and nu(H-e)=nu(H)-1. Aharoni puts H-e at equality; free-page construction, Hall classification, and the common-apex-pair packing contradiction are additional elementary deductions. | Strong main theorem if the fresh mathematical audit accepts it. Separate its arbitrary-order scope from the known very-small-packing cases. |
| C. Flat-remainder restoration | H need only be flat; no full-triangle tripartition is required. The K4-plus-small-core slack-one classification is a short HKT consequence. The five-wheel compatible augmentation is the substantive extra step. The book case under tripartiteness follows from B; the zero-slack elementary cover argument is inherited from A. | Strong main theorem, citing HKT prominently. Present one full flat theorem with the wheel lemma, not several duplicative claims of new classification. |
| D. Closed-boundary deletion and companion stability | Disjoint independent U,P; uniqueness only for actual edges px with p in P and x outside U union P; A any subset of old U–P edges. König applies separately to the bipartite terminal cones. The new content is simultaneous compatibility with equality K4 faces, then slack accounting or stability contradiction. | Substantive general structural result, no graph-order or packing-number bound. The criterion is conditional on its exact boundary hypotheses. |
| E. Exact-two-apex mixed/shared bowtie | Each **individual** restored family must be exactly the base triangle plus six pages at two universal apices; full new family also includes mixed triangles. The shared-apex branch and mixed disjoint-apex branch are different deductions. The latter uses the nine-cycle-page lemma and SPGT. | Potential main result after complete fresh case audit. If only shared-apex cases are verified, publish precisely that subtheorem and retain the rest as unverified. |
| F. Compression | Finite H with deletion of every one edge preserving nu(H)=h; two restored edge-disjoint triangles. No tripartiteness or slack-one hypothesis is needed for the bound. Preserves nu/tau of G and H, six added edges, full old triangle hypergraph up to irrelevant edges, and edge stability. | Useful appendix or methods lemma; quadratic bound is not a superior packing/cover kernel, not an absolute finite reduction, and not a bound on h. |

### Mathematical spot checks independent of the previous reviews

1. HNS extraction is correctly specialized to a full triangle hypergraph. Three pairwise-intersecting graph triangles with distinct shared edges generate all six K4 edges. Once h edge-disjoint K4s have been extracted from equality, an additional triangle would meet each in at most one edge; choose faces avoiding those edges and append it. This establishes exhaustion. The extra fourth face exists because the model is an actual graph.
2. HKT's equality case applies after K4 isolation in a flat graph: each K4 edge already lies in two faces, so no external triangle can use it. For defect one, the K4-free remainder has nu at most two; its nu=2 case forces equality in the 3/2 bound. The near-equality classification is therefore a deduction, not a newly imported stability theorem.
3. The wheel augmentation in the stated proof genuinely uses component isolation. If an outside terminal b had adjacent neighbors in the wheel, their edge would lie in an extra old triangle. In the two-rim-terminal case the allowed nontrivial neighbor pattern is the one used to construct three pages and one old wheel triangle. Omitting component isolation would invalidate that classification.
4. The boundary uniqueness restriction in D is used twice: it separates edge supports of terminal cones, and prevents a chosen equality face from sharing a P-to-outside edge with a lost triangle at a different terminal. The full lost family must be retained in the companion stability argument even when it uses the subsequently deleted edge.
5. The compression count is not a consequence of ordinary critical-hypergraph order bounds. Its elementary argument instead bounds every old edge codegree by 2h using a maximum packing avoiding that edge; seven representatives per one of at most 64 external-neighborhood types give a strict cover-replacement improvement. Six representatives would require an additional equality-case argument not present in the stated proof. A packing uses at most six new triangles because their added-edge supports are disjoint.

## 3. Search record and limits

Fresh query families on 29 October 2026 included: `Haxell Kostochka Thomasse flat Theorem 2 five wheel`; `Tuza two triangle deletion restoration tripartite equality`; `Tuza closed boundary exact two apex bowtie`; `"two-triangle" "Tuza"`; `"Tuza" "flat" restoration`; `"Tuza" "essential edge"`; `"triangle packing" "edge-stable" compression`; `"triangle-3-colorable" equality K4`; `"triangle-3-colourable" "two" triangles`; `"Tuza" "packing-critical" edge`; `"Tuza" "bowtie" graph`; `Tuza triangle edge deletion odd cycle transversal five graph 2026`; `"triangle packing" "kernel" "edge-disjoint" quadratic vertices`; and the titles of the Aharoni, HNS, HKT, bilateral-complete, SPGT, and Sheng–Xiao papers.

The comparison used author manuscripts, arXiv versions, and publisher pages. Unrelated commercial/person-name hits and secondary summaries were not used as theorem evidence. The search found no exact earlier statement of A–E or of F with its simultaneous exact-preservation guarantees. This is bounded negative evidence only: alternate terminology, unindexed work, unnoticed corollaries, and unpublished work remain possible. No complete citation-graph traversal or specialist originality assessment was performed.

An additional caution: a search result describing an unrelated Lean project incorrectly stated Tuza for all K4-free graphs. It was not used. Repository descriptions and purported formal proofs must not replace exact source and declaration inspection.

## 4. Reproducibility and publication advice

Fresh primary copies and SHA-256 hashes are recorded in `literature/primary/SOURCE_MANIFEST.json`. The HNS and fractional HKT PDFs match the already archived bytes. PDF text was inspected through the web reader; the remote machine lacks `pdftotext`, `pypdf`, `fitz`, and `pdfminer`, so this review does not claim a successful remote text-extraction run. No package was installed for this purpose.

The source folder is private research evidence. Do not copy third-party PDFs or raw HTML wholesale into the sanitized publication tree. Publish citations, concise scope comparisons, and the project's own proof text. Retain the distinction between published inputs, new ordinary deductions, and only those deductions that the final Lean audit actually verifies. The bibliographic recommendation is to lead with B, C, and D if their fresh proof audits pass, use A as a credited foundation, include E only at its independently checked scope, and place F with methodological limitations in an appendix.
