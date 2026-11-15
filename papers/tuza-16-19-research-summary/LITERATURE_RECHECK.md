# Targeted primary-source recheck for TUZA-16–19

Date: 15 November 2026. Scope: attribution and exact source interfaces for the TUZA-16–19 publication. This is an internal AI source review, not external peer review, a literature census, or an independent proof of every cited theorem. Requested model controls were inherited; a distinct serving-model identity was not independently exposed. All local inspection and rendering occurred on Darwin. Frozen research files were read only; no archived checker was executed or modified by this review.

The principal attribution conclusions are clear. The maximum-average-degree inequality, WKE framework, fractional inequalities, asymptotic packing approximation, and incidence construction have published antecedents that must be credited. The four-connectivity conclusion is explicitly in Freitas's thesis. The precise combined normalization, support restrictions, and local first-marginal obstructions are project deductions or reconstructions whose historical originality is unresolved. The CKSU finding concerns one identified arXiv edition and its displayed procedure.

## Source-by-source record

### Puleo: inherited sparsity theorem and WKE reductions

Gregory J. Puleo, *Tuza's Conjecture for Graphs of Maximum Average Degree Less Than 7*, European Journal of Combinatorics 49 (2015), 134–152, [DOI](https://doi.org/10.1016/j.ejc.2015.03.006). Exact inspected preprint: [arXiv:1308.2211v3](https://arxiv.org/abs/1308.2211v3), revised 13 April 2015; [versioned full text](https://arxiv.org/html/1308.2211v3).

Read Theorem 1.2; Definition 2.1 and Lemma 2.2; Definition 4.1; Definitions 4.2 and Lemmas 4.3–4.4; the statements of Proposition 4.8 and the nearby small-link criteria. Theorem 1.2 supplies the inequality for `mad(G)<7`. Definition 4.1 uses a matching `M` and a vertex cover `Q` of `L−M` with `|Q|≤|M|`; `M` need not be maximum. Lemma 4.4 supplies the WKE-link reduction.

Attribution: the TUZA-15 equality classification is distinct from the inherited inequality. TUZA-16 saturated-twin payment and TUZA-19 link/core work use established reduction methodology. The unrestricted four-branch domain is not stated in the inspected passages. The full discharging proof was not reaudited. An automatically generated date in HTML is not the arXiv revision date.

### Freitas: four-connectivity is a prior conclusion

Lucas Ismaily Bezerra Freitas, *A conjectura de Tuza sobre triângulos em grafos*, master's dissertation, Universidade Estadual de Campinas, 2014. [Institutional record](https://repositorio.ufc.br/handle/riufc/9599); [institutional PDF](https://repositorio.ufc.br/bitstream/riufc/9599/1/2014_dis_libfreitas.pdf).

The PDF was obtained directly after the browser fetch timed out. It has 109 PDF pages, including front matter, and SHA-256 `9f07b1a4b04f3b150100622148944c08c316d826da55f52e2fa8413875a0aa15`. Read §5.2, printed pp.67–73; visually checked printed pp.72–73. The four-connectivity statement is **Theorem 5.2.2**, printed p.72, with its proof continuing on p.73. The preceding separator result is **Lemma 5.2.1**, printed pp.67–72.

Attribution: TUZA-17 must describe four-connectivity as a reconstructed known conclusion. Its retained proof with explicit piece/deletion hypotheses remains the operative proof; do not import the thesis lemma as an unqualified gluing rule. This recheck identifies the antecedent and reads its relevant argument, but does not certify the entire thesis or its priority history. The thesis is from UNICAMP; UFC hosts this copy.

### Behrend and Erdős–Frankl–Rödl: classical incidence amplification

F. A. Behrend, *On Sets of Integers Which Contain No Three Terms in Arithmetical Progression*, PNAS 32(12) (December 1946), 331–332, [DOI](https://doi.org/10.1073/pnas.32.12.331), [primary archive](https://pmc.ncbi.nlm.nih.gov/articles/PMC1078964/). The primary indexed first-page text and publication metadata were read: the equal-norm, restricted-digit construction is classical. The live archive returned a browser challenge; this pass does not claim a fresh full two-page PDF review. No numbered theorem from Behrend is imported.

P. Erdős, P. Frankl and V. Rödl, *The Asymptotic Number of Graphs not Containing a Fixed Subgraph and a Problem for Hypergraphs Having No Exponent*, Graphs and Combinatorics 2 (1986), 113–121, [DOI](https://doi.org/10.1007/BF01788085), [primary scan](https://www.renyi.hu/~p_erdos/1986-17.pdf). Read Theorem 1.7 and §5; visually checked printed pp.117–118, including Lemma 5.1, Claim 5.2, and the progression-block construction. These supply the classical near-quadratic construction; linearity is visible in the construction, not merely in an abbreviated theorem label.

Attribution: TUZA-19's explicit fixed-seed copy accounting and later batching are deductions built on this input. No priority is asserted for the resulting Tuza equivalences. The EFR argument provides the necessary primary mathematical interface despite the Behrend access limitation.

### Krivelevich: mixed fractional bounds and separator precedent

Michael Krivelevich, *On a conjecture of Tuza about packing and covering of triangles*, Discrete Mathematics 142 (1995), 281–286. [Author-hosted journal scan](https://www.math.tau.ac.il/~krivelev/2.pdf). The scan records receipt on 11 January 1993 and revision on 13 September 1993; publication year is 1995.

Read definitions, Lemma 5 (pp.282–283), Theorems 7–8 (p.284), and the selected LP argument on pp.284–285. The p.284 image confirms non-strict inequalities despite faulty OCR: Theorem 7 gives `ν*≤2ν`; Theorem 8 gives `τ≤2τ*=2ν*`. Lemma 5 is the two-vertex separator antecedent and explicitly includes edge-deletion premises in the common-edge case.

Attribution: TUZA-16's optional `τ≤2ν*−1` for a graph containing a triangle is an adaptation of the proof, not the printed statement of Theorem 8. No originality claim is supported. Do not infer a general integral result by interchanging the two mixed inequalities.

### Haxell–Rödl and Yuster: uniform approximation and its boundary

P. E. Haxell and V. Rödl, *Integer and Fractional Packings in Dense Graphs*, Combinatorica 21 (January 2001), 13–38, [publisher](https://link.springer.com/article/10.1007/s004930170003). Publication metadata and preview were checked; the article body remains subscription-only in this pass. Original theorem numbering is not certified.

Raphael Yuster, *Integer and fractional packing of families of graphs*, Random Structures & Algorithms 26 (2005), 110–118; [author manuscript](https://math.haifa.ac.il/raphy/papers/fracpack.pdf). No internal manuscript date was found. Read the no-isolates convention, Theorems 1.1–1.2 (p.2), the uniform quantifier paragraph beginning the proof (p.4), and the scope of Proposition 1.3. The p.4 image confirms: fixed family and fixed positive epsilon determine a threshold valid for **every** sufficiently large graph. Theorem 1.2 supplies the actual TUZA-16 input for triangles; the regularity/nibble proof was not reverified.

Yuster's Theorem 1.1 attributes the single-graph antecedent to Haxell–Rödl. Its numbering belongs to Yuster. Isolates are handled by the project argument. The known `o(n²)` input supplies neither a fixed power saving nor the specific subexponential error assumed in TUZA-19.

### Chen–Diao–Hu–Tang: closely related normalization equivalences

Xujin Chen, Zhuo Diao, Xiaodong Hu and Zhongzheng Tang, *Sufficient Conditions for Tuza's Conjecture on Packing and Covering Triangles*, [arXiv:1605.01816v3](https://arxiv.org/abs/1605.01816v3), 24 May 2016; [full text](https://arxiv.org/html/1605.01816v3).

Read the definition of irreducibility (each edge lies in a triangle), Theorems 1.2–1.3, Theorem 2.1's statement, and the proofs of Theorems 3.3, 3.5 and 3.8. Theorem 1.2 provides sufficient triangle/edge-count ratios. Theorem 1.3 summarizes equivalences with a fixed positive slack below ratios `1/4`, `1/5` and `3/2`; the three proofs add disjoint `K4` or `K5` copies and cancel their exact contributions.

This is direct precedent for defect-preserving normalization arguments and must be cited when presenting TUZA-19 equivalences. It does not state their simultaneous universal-vertex/codegree/TF/non-WKE restrictions or their subexponential scale. Nor do the inspected statements specify TUZA-18's original-packing-support/private-completion cover restriction. These are scope distinctions, not proof of novelty. The paper's full algorithmic and random-graph arguments were not audited.

### Tsujimura: exact v2 comparison

Yasuhito Tsujimura, *Triangle-overlap cores and density bounds for Tuza's conjecture*, [arXiv:2611.11128v2](https://arxiv.org/abs/2611.11128v2), 10 November 2026; [versioned HTML](https://arxiv.org/html/2611.11128v2), [versioned PDF](https://arxiv.org/pdf/2611.11128v2). The v2 record describes a metadata-only update from v1 (8 November), not a changed paper. A fresh versioned download matched the archived PDF hash `2ea5b6166a5d61b20624c34823ad5d40a96f618448431a6fafd5b6f5fd98bb7d`.

Read class definitions, Theorem 1.2, Corollary 1.3, Lemmas 4.1–4.2, the localization proof, and Appendix C.1–C.3; visually checked Lemma 4.1 on p.9 and the subdivision illustration on p.17. Lemma 4.1 permits arbitrary order but requires minimum degree two, maximum degree four, at most two degree-three and at most two degree-four vertices. Appendix C gives the two-vertex subdivision lift. Theorem 1.2 uses the high-codegree **4-core**, with maximum triangle codegree four and maximum degree two in the four-triangle-edge graph.

TUZA-19 credits those methods while proving its own four-branch finite domain and unrestricted high-codegree **5-core** reduction. Both conclusions give a survivor contained in the induced core, not necessarily the whole induced graph. No supplement replay or density-proof audit is claimed. Exact priority remains unresolved.

### Billington–Lindner: complete multipartite packing antecedent

Elizabeth J. Billington and C. C. Lindner, *Maximum packings of uniform group divisible triple systems*, Journal of Combinatorial Designs 4(6) (1996), 397–404. [Publisher and DOI](https://onlinelibrary.wiley.com/doi/10.1002/%28SICI%291520-6610%281996%294%3A6%3C397%3A%3AAID-JCD2%3E3.0.CO%3B2-A).

Read the primary abstract, bibliography and publication record. The abstract addresses maximum triangle packings of complete equipartite graphs with minimal leaves. The version of record's online date is 7 December 1998; the publication year remains 1996. The PDF link did not provide the article body. Statement numbers, exception lists and prescribed-leave embedding details are therefore **not inspected**.

The cocktail-party graph `CP_r=K_(2,...,2)` is the group-divisible packing host of type `2^r`. This makes the classical work directly relevant. TUZA-19's explicit base packings and doubling proof must carry the construction instead of an uninspected exception theorem. The first-marginal polytope argument requires its own proof. The access gap is a nonessential overlap/priority limitation, not evidence of novelty.

### Shiraishi and Guruswami: line-graph maximum-cut antecedents

Shuji Shiraishi, *On the Maximum Cut of Line Graphs*, Combinatorics, Probability and Computing 7(3) (September 1998), 335–337, [publisher](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/on-the-maximum-cut-of-line-graphs/0AB9083FA3CEDBD189291CFF8653E777), [DOI](https://doi.org/10.1017/S096354839800337X). Read bibliographic metadata and abstract. Its Eulerian/non-Eulerian formulas are absent from the accessible HTML, appearing as “formula here.” No exact formula, theorem number, connectivity convention, or full proof was inspected.

Venkatesan Guruswami, *Maximum cut on line and total graphs*, Discrete Applied Mathematics 92(2–3) (June 1999), 217–221, [publisher](https://www.sciencedirect.com/science/article/pii/S0166218X99000566), [DOI](https://doi.org/10.1016/S0166-218X(99)00056-6). The indexed publisher abstract states polynomial-time solvability for line graphs. Direct opening returned HTTP 403; no full proof or statement number was inspected.

These are material antecedents for the Euler-coloring/max-cut part of TUZA-19. Its self-contained packing comparison and exceptional triangle-free-root argument must remain included. The theorem concerns line graphs of finite **simple** roots; the edge-disjoint star-clique decomposition is not transferable to parallel-edge roots. Exact proof overlap and historical priority remain unresolved. No paper is inferred to omit an odd-cover result merely because its abstract does not mention it.

### CKSU: identified local defect, not a global disproof

Parinya Chalermsook, Samir Khuller, Pattara Sukprasert and Sumedha Uniyal, *Multi-transversals for Triangles and the Tuza's Conjecture*. Inspected edition: [arXiv:2001.00257v2](https://arxiv.org/abs/2001.00257v2), 3 February 2021; [PDF](https://arxiv.org/pdf/2001.00257v2), 69 pages, SHA-256 `1ec683cf6d609daf53ee967d9f53a93a87c17286ae20a46191070c7ca5688897`. A fresh versioned download matched the archived bytes.

Read §2.1 setup, private-page taxonomy, Proposition 13 and its proof (p.11), the order-three assignments (p.12), relevant analysis (pp.13–14), and Definition 17/Lemma 18 (pp.16–17). Pages 6, 7, 11, 12, 16 and 17 were visually reinspected. The setup imposes maximum packing, with no relevant `K5` exclusion or tie-break. Proposition 13's printed alternatives omit the reciprocal two-page `K5` configuration; the displayed §3 procedure fails there. Lemma 18 has a singleton-page hypothesis and is not refuted.

The project supplies a separately proved order-three repair. This is not a new numerical target, an author-confirmed erratum, a repair of all later sections, or a refutation of the existential main theorem. Later dependencies require their own stated audit scope.

## CKSU witness and proceedings distinction

For an independent elementary reading of the witness, use `K5` on `{v,a,b,c,d}` and the maximum packing `{vab,vcd}`. A three-packing would leave one edge, contradicting degree parity; thus the packing number is two. The private pages are `{abc,abd}` on base `ab` and `{acd,bcd}` on base `cd`. Triangle `vac` contains neither base and neither owner has a singleton private page. The putative augmentation uses `abd` and `bcd`, which share `bd`. The printed charging rule places weight one on the two bases and one-third on the four spokes; each of `vac,vad,vbc,vbd` receives only two-thirds. Uniform weight one-third on all ten edges is nevertheless a valid fractional cover. This arithmetic reproduces the narrow defect; it does not dispute existence.

The distinct [SODA 2020 proceedings chapter](https://epubs.siam.org/doi/10.1137/1.9781611975994.121) is pp.1955–1974, DOI `10.1137/1.9781611975994.121`, online 23 December 2019. Its publisher abstract and metadata were inspected. The PDF link redirected to the subscription abstract; its advertised author full-version link returned 404. **The proceedings body was not obtained or compared line by line.** Do not transfer arXiv proposition numbering or claim identical defects in the proceedings. The exact arXiv finding remains reportable with this limitation. No contact with the authors was made.

## Publication decisions and limitations

- **Inherited inputs:** attribute Puleo's inequality/reductions, Krivelevich's fractional bounds, the Haxell–Rödl/Yuster approximation, and the Behrend/EFR construction at their use sites.
- **Known conclusion reconstructed:** credit Freitas for minimum-counterexample four-connectivity. Retain the project's explicit separator proof and hypotheses.
- **Adaptations/project deductions:** describe the normalization accounting, support-restricted results, four-branch extension and local first-marginal obstruction by their proved content. Do not use “first” or priority-bearing “new.” Cite Chen–Diao–Hu–Tang and Tsujimura for the relevant earlier interfaces.
- **Nonessential access limits:** Billington–Lindner's complete exception/leave theorem and Shiraishi/Guruswami's full proofs remain unchecked. The standalone project arguments avoid importing these as premises. Missing access cannot support novelty.
- **Edition-specific correction:** identify CKSU v2 on every substantive correction claim. The report must preserve the valid existential target, the singleton restriction of Lemma 18, and the uninspected proceedings/later-section boundary.

This recheck does not establish priority for any project result, validate an entire external paper, replay a source's computational supplement, or resolve unrestricted Tuza. It does not replace the separate ordinary-proof reconstruction, finite replay, formal verification, or publication-candidate review. Other inherited dependencies are governed by their own public dependency records.

Only this review's original prose, bibliographic metadata, and safe source hashes are intended for publication. Consulted article PDFs, page renders, full-text extractions, and publisher HTML are excluded from the public candidate. Their copyright and licensing remain with their respective holders.
