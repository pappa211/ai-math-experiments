> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# TUZA-05 targeted prior-art and novelty audit

Prepared 30 October 2026, during the authorized TUZA-05 mission. This is a private research note, not a publication or an assertion of priority.

## Scope and conclusion

The exact target is the conjunction, for every finite simple **5-degenerate** graph G, of tau(G) <= 2 nu(G) and the characterization of equality by K4/K5 triangle components. Components join triangles sharing an **edge**. The packing and cover parameters concern graph edges.

The sources inspected here do not establish that target. The user-supplied Zenodo paper addresses pair-packing number four, not degeneracy or equality. The established sparsity and local reduction results explain substantial parts of the frozen TUZA-04 baseline; they do not justify silently treating the missing K5 and K5-minus-edge links as solved. This is a qualified search finding, not a novelty certificate or a statement that every possible source was checked.

The new mathematical work should therefore continue to focus on equality-preserving handling of dense degree-five neighborhoods, including arbitrary external attachments and positive-slack remainders. A proof of full 5-degenerate inequality would also go beyond the exact hypotheses of the principal sources below. Whether a new argument is substantially new must be assessed after its final statement and proof are available.

## Baseline consulted before searching

Read the actual copied frozen files in baseline-tuza04, especially SOURCE_RECORD.md, LITERATURE_ROUTE.md, EQUALITY_THEOREMS.md, DISCOVERY_REPORT.md, REVIEW_EQUALITY_FRESH.md and BOUNDARY_ROUTE.md. The parent agent independently verified the 23-entry frozen manifest and the public reference revision 97e913008e466de14f61437d8dae774946d92e8f. This audit does not replace the separate TUZA-05 proof audit.

Frozen Theorem A concerns 4-degenerate graphs; frozen Theorem B concerns 5-degenerate graphs excluding K6 minus an edge as an ordinary subgraph. Their equality assertions require project proofs; their inequality mechanisms include deductions from previously published local reductions. No Lean proof was inspected or run in this literature subtask.

## Primary sources and exact comparison

### Yiming Liu: the supplied Zenodo paper

[Version 1.0.2 record](https://zenodo.org/records/23177679), DOI 10.5281/zenodo.23177679, dated 6 October 2026; title: *Generalized Tuza's conjecture for pair-packing number four*. Actual manuscript source inspected, rather than relying on title or metadata.

Theorem 1.2 claims: for every finite 3-uniform hypergraph H, nu_2(H)=4 implies tau_2(H)<=8, sharply. Here pair-packings share at most one vertex and covers consist of vertex pairs. For the triple family of all graph triangles these become the graph edge parameters. No degeneracy hypothesis or equality classification occurs in this theorem.

Lemma 2.4 restricts exterior triples relative to a maximum-union four-triple packing; Lemma 3.1 preserves covers after truncation; Proposition 3.2 gives at most 24 retained vertices; Proposition 5.1 is certificate-assisted exclusion of ten reference shapes. The package reports 154,874 RUP additions. Its README and metadata distinguish independent AI review from external human journal review.

**Status here:** externally reported computer-assisted theorem, with statement and analytic reduction inspected, but certificates not rerun and full proof not independently certified. It may supply a small-packing inequality base case; it does not resolve the present target or automatically give a bounded kernel for unbounded packing number.

### Alex Parker: predecessor of Liu

[Published paper](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v32i2p20/pdf/), *New bounds on a generalization of Tuza's conjecture*, Electronic Journal of Combinatorics 32(2) (2025), P2.20; [DOI](https://doi.org/10.37236/13355); [arXiv](https://arxiv.org/abs/2406.06501).

The primary abstract confirms the generalized bound for nu^(k-1)<=3. This supports the scope of the small-packing predecessor cited in Liu's Theorem 1.1; it does not establish a degeneracy or equality result. Only the relevant statement and attribution were checked here, not Parker's full proof.

### Gregory J. Puleo

[Versioned text](https://arxiv.org/abs/1308.2211v3), *Tuza's Conjecture for Graphs with Maximum Average Degree Less Than 7*; arXiv v3 dated 13 April 2015; European Journal of Combinatorics 49 (2015), 134-152; [DOI](https://doi.org/10.1016/j.ejc.2015.03.006).

Theorem 1.2: mad(G)<7 implies tau(G)<=2nu(G). Lemma 2.6 is robustness of a minimal inequality counterexample. Proposition 5.1 reduces a degree-at-most-six vertex if its link complement has maximum degree greater than one, or exactly two edges. Its proof Case 1 (degree five, two disjoint missing edges) is the known four-triangle/eight-rim-edge construction underlying the K221 part of TUZA-04. Proposition 5.2 handles adjacent vertices of degree at most six. Lemma 7.5 handles a degree-five vertex subsumed by an adjacent degree-seven/eight vertex, under the stated singleton-irreducibility hypotheses.

These are inequality reductions; equality classification and compatibility of remainder packings/covers are additional obligations. The main theorem has a maximum-average-degree hypothesis, not a degeneracy hypothesis.

### Cui, Haxell and Ma

[Published paper PDF](https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf), *Packing and Covering Triangles in Planar Graphs*, Graphs and Combinatorics 25 (2009), 817-824; published online 10 February 2010; DOI 10.1007/s00373-010-0881-5.

Theorem 1.2 and the class definition in Section 2 characterize planar equality graphs by edge-disjoint K4 copies: every triangle is inside a copy, and every edge is either in a copy or belongs to no triangle. This is exactly a planar K4 triangle-component classification. It is not a nonplanar K4/K5 or degeneracy theorem. Their cover-selection observations, Propositions 2.1-2.2, explain the established planar model for equality bookkeeping.

### Botler, Fernandes and Gutierrez

[Version 2](https://arxiv.org/abs/2002.07925v2), *On Tuza's conjecture for triangulations and graphs with small treewidth*, revised 16 July 2020; Discrete Mathematics 344 (2021), 112281; [full text](https://arxiv.org/html/2002.07925v2).

Theorem 3.4 proves the inequality for treewidth at most six. Lemma 3.3 says that in an irreducible robust graph, two vertices of degree at most six whose neighborhoods have union size at most seven must both have degree five, common neighborhood size three, and clique links K5. This is relevant existing local structure when considering dense links. It is an inequality-counterexample lemma, not a classification of equality graphs. Treewidth at most six does not cover arbitrary 5-degenerate graphs.

### Anish Gupta

[Version 1](https://arxiv.org/html/2608.06538v1), *Tuza's conjecture for graphs of maximum degree at most seven*, submitted 6 August 2026; [repository](https://github.com/agupta/tuza-maximum-degree-seven).

Theorem 1.3 asserts tau<=2nu for Delta<=7; Theorem 1.4 treats 7-regular graphs. The paper reports 1,144 codegree-four local certificates and does not provide a human-readable proof of that catalogue. Question 12.3 explicitly asks which Delta<=7 graphs have equality, and specifically whether any 7-regular graph does. Thus the paper does not classify equality even within its degree bound. It does not establish prior publication of the precise global K4/K5 conjecture. Certificate runs were not reproduced here.

### Amrit Kandasamy

[Version 1](https://arxiv.org/html/2610.15269v1), *Tuza's Conjecture for Graphs of Maximum Degree at Most 10*, submitted 11 October 2026.

Theorem 1.1 asserts tau<=2nu for finite simple graphs with Delta<=10. No degeneracy or equality classification was found in the inspected text. This is a recent preprint inequality result; its verification code was not run in this audit. It cannot be substituted for a bound on degeneracy, which allows unbounded maximum degree.

## Scope checks and attribution traps

A concrete elementary separation is K5 joined to an independent set of m vertices. It is 5-degenerate, while its average degree is (10m+20)/(m+5), which exceeds seven when m>=6, and its maximum degree is m+4. Hence neither mad<7 nor a fixed maximum-degree bound covers the target class. This example is only a hypothesis comparison, not a counterexample to Tuza.

A current secondary-source sentence on Wikipedia says the conjecture holds for degeneracy at most six but cites Puleo. The cited primary theorem is mad<7. That sentence cannot support the broader claim. It was used only to locate and reject a scope mismatch, not as mathematical evidence.

The fact that planar graphs are 5-degenerate does not make the planar equality theorem a theorem about all 5-degenerate graphs. Ordinary graph tripartiteness must likewise not be confused with 3-partiteness of the full triangle hypergraph.

No attribution of the global K4/K5 equality conjecture to the four researchers associated with the unrelated Barbados Ramsey problem has been made. The precise source of that exact global formulation remains unestablished by this narrow audit.

## Qualified novelty assessment

- **Established predecessor mechanisms:** Puleo singleton/pair reductions and K221 packing-cover template; planar equality and cover selection; known treewidth inequalities. Restating them as new TUZA-05 theorems would overclaim.
- **Project contribution under proof audit:** extension of equality bookkeeping to frozen nonplanar degeneracy classes; the new K221 compatibility argument, rather than the old 4/8 template itself.
- **Unresolved target in checked sources:** full 5-degenerate inequality plus K4/K5 triangle-component equality. A complete proof would require comparison with its precise final hypotheses, not merely a negative keyword search.
- **No redirection forced by Liu:** its bounded-packing result is complementary. The maximum-union argument may be a useful idea, but a transfer to unbounded packing or arbitrary external attachments is an unproved step.

Searches used exact and variant phrases including “Tuza 5-degenerate,” “five-degenerate,” “degenerate graphs,” and equality/K4/K5, then inspected the primary papers above. This was deliberately a targeted check, not an exhaustive survey. No independent priority claim follows.

## Retained material, verification and failures

The private historical investigation consulted Zenodo metadata, a manuscript PDF, its source/reproduction ZIP and extracted TeX. None of those third-party full texts, source archives or metadata dumps is distributed in this public tree. Historical consultation identities, rather than hashes of public files, were:

- PDF SHA-256: `8303403632de6c70da3bfb793076a361d299d9abd88eef47cf065cb255edc4df`.
- Source ZIP SHA-256: `1457d32fbfce5fccd645fc548d51006f539c7c588c7a6ce6cf5e6ae4ede2a6fe`.
- Extracted TeX SHA-256: `29e715fda9e12b9d83e42a71a0b7b4c561bbb86a489ad57f76f49ea50cb08fed`.

These supporting sources are outside the main theorem's mathematical closure. See the current paper's bibliography and the public source-to-publication inventory for the actual inclusion boundary.

## Final statement comparison after the proof emerged

The authoritative TUZA05 theorem now removes TUZA04's forbidden-K6-minus-edge condition and proves the combined inequality/equality statement for all5degenerate graphs, with no maximumdegree bound. Its decisive addition is equality-aware low-vertex overlap followed by deleting all degree5vertices and using degeneracy again; the forced8vertex interface is resolved with arbitraryexternalpage compatibility. The inequality framework is indebted to Puleo and Botler–Fernandes–Gutierrez; the equality argument additionally uses the planar cover-selection tradition of Cui–Haxell–Ma. Their exact hypotheses and theorem numbers above remain the comparison baseline.

A final lead search for the exact phrases “Tuza5-degenerate”, “Tuza degeneracy equality” and “Tuza degenerate graphs” did not produce an exact primary predecessor. The same secondary degeneracy<=6 claim appeared, without a supporting primary theorem beyond the already checked mad<7 source. This remains a scope warning, not proof that no predecessor exists.

Qualified label: **potentially new theorem and ordinary proof; historical priority not established**. The full5degenerate target was not attributed to any external paper or researcher. The main proof requires none of the recent computer-assisted/preprint results. Its precise statement and ordinary argument, rather than search novelty, are the mathematical deliverable.
