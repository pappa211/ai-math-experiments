> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Fresh adversarial review of the equality route

Reviewer: the TUZA-04 boundary-route agent, which did not participate in developing the equality proofs. This is a fresh internal AI review, not external expert endorsement and not Lean verification. Agreement is not used as evidence in place of the mathematical checks recorded below.

Initial reviewed artifact: `EQUALITY_THEOREMS.md`, SHA-256 `913d977ab75fd0983cb543999749ef35db5fbc6df928c3878a81423300e4a1e2`.

## Findings on Theorems A and B

No mathematical gap was found in the complete ordinary proofs of:
- Tuza plus K4/K5 triangle-component equality classification for 4-degenerate graphs;
- Tuza plus K4-only equality classification for K5-free 5-degenerate graphs.

The following steps were reconstructed rather than accepted from the other agents' conclusions.

1. **Minimal obstruction and hereditary scope.** A proper edge-subgraph is in the same hereditary class. Additivity over full triangle components excludes disconnected triangle support. A packing-essential edge would immediately give strict inequality. If an edge deletion left equality, its residual clique blocks admit a packing avoiding the two spokes of one restored page, since those spokes cannot belong to one residual clique block. This establishes the tight-critical reduction without assuming global Tuza.
2. **Codegree-one exclusion.** Deleting the other two edges of the unique triangle supplies the exact one-triangle/two-cover-edge budget. Every residual block meets its three vertices at most once, including the subtle use that the retained unique edge is triangle-free. The lost family consists entirely of triangles through the common vertex. The intersecting/no-common-edge case would force a second triangle on the supposedly unique edge. In the nonintersecting case K4 star avoidance and K5 two-edge avoidance apply simultaneously.
3. **Component-local deletion.** For every local link component, all v-spokes into that component are deleted, not all of v unless it is the entire link. A triangle through a deleted spoke with an outside third neighbor would connect link components, so the listed increments cover all lost triangles. Non-v triangles lost through a rim deletion contain that deleted rim edge and are also covered.
4. **Small link types.** Each local packing and cover increment for K3, K4, diamond, C4 was checked directly. The external-page augmentations have respectively the listed residual forbidden edges. In each case every possible pair of forbidden edges in a residual clique either forces a missing/deleted edge or is an allowed adjacent pair; no unexamined three-edge overlap survives. For the C4 case the codegree-two condition gives a retained triangle on bc, allowing a prescribed-edge minimum residual cover and the one-edge saving.
5. **Five-vertex list and dense/sparse tables.** The complement classification follows from maximum degree two and the color-class alternatives. All four dense-table triple packings and every missing/deleted-edge pair test were checked. The bowtie strict budget, K2,3 external-page exclusion, and C5 external-page exclusion all account for full lost families.
6. **K221 local graph.** On W={v,a,b,c,d,e}, the graph is K6 minus ab,cd. The four-packing vac,vbd,ade,bce is edge-disjoint and wholly deleted; the eight rim edges cover every lost triangle. The four-edge local cover va,vb,ec,ed was checked against all local triangle forms. Hence the external family has tau at least four.
7. **K221 external-page lemma.** The four bad pairs partition the eight rim edges into unique bad partners. Thus a third base is good with both bases of a chosen disjoint bad pair. Intersections of external pages on different bases require the same outside apex and a shared rim endpoint. Distinct apices preclude a third base. For ac,bd with common apex x, only ad or bc can be a third base; its presence forces every participating page to have apex x, yielding the stated two-spoke cover. Adjacent bad pairs with one apex would intersect and hence cannot be the chosen disjoint pair. The conclusion tau(F)<=2 under absence of a good disjoint pair is sound.
8. **K221 compatibility.** The four symmetry orbits of good pairs are exhaustive: adjacent cycle pairs, cross-part pairs of e-spokes, and incident/nonincident mixed pairs. Each listed three-packing avoids its two bases. Residual blocks meet W at most once, so their forbidden external spokes form a star of at most two edges; K4 and K5 packings avoid it. The final h+1 augmentation is therefore valid.
9. **Degeneracy deduction.** The 4-degenerate contradiction uses delta>=5. The K5-free 5-degenerate case has a degree-five vertex and a K4-free five-vertex link. A minimal non-3-colorable graph on at most five vertices has minimum degree at least three; its five-vertex complement is a matching, giving only K5, K5 minus one edge, or K221, the last 3-colorable. This validates the link-colorability reduction.

## Required wording correction in the initial artifact

The initial Corollary R-local states degree at least six for every qualifying vertex of an old-edge-minimal counterexample. Old-edge minimality does not eliminate isolated vertices: one can append an isolate without changing the old edge count or the failure. The degree assertion therefore requires either a nonisolated-vertex qualification or explicit normalization discarding isolated vertices in the statement. The assertion about all link components is vacuous at an isolate and is not itself false.

This is a scope/wording defect in the restoration corollary, not a defect in Theorems A or B, whose minimal-obstruction framework explicitly discards isolated vertices. The correction must be verified against a later artifact hash before being marked resolved.

Apart from this point, the restoration induction was checked: v outside the restored triangle with at most one terminal neighbor has only old triangles through it; its local spokes and rim edges are all old; hence every local deletion remains in the one-triangle restoration class and old-edge minimality supplies the residual equality classification. A locally isolated clique cannot contain the restored triangle under this terminal-neighbor condition, contradicting connected T-support normalization.

## Proposed extension B-prime: independently checked

The parent proposed the additional five-link type L consisting of K4 on a,b,c,d and a fifth vertex x adjacent exactly to a,b. Take M={cd,ax}, Q={a,b}; L-Q consists only of cd. The usual component-local deletion gives a residual equality graph with packing h-2. The three triangles

    acd, vax, vbd

are pairwise edge-disjoint. Their residual edges are ac,ad,bd. A block containing ac together with either ad or bd would require deleted cd. The only possible two-edge overlap is ad,bd, a star at d. Thus residual block avoidance gives h+1 triangles, contradiction.

Consequently the equality proof extends to the hereditary class of 5-degenerate graphs containing no K6 minus an edge as a **subgraph**, with K4/K5 triangle components at equality. Indeed every five-vertex link either is 3-colorable, is the just-excluded K4-plus-degree-two-vertex type, or contains K5 minus an edge (including K5); the latter gives a forbidden K6-minus-edge subgraph with v. The word subgraph-free matters: induced-subgraph-free would allow K6 and would not justify this proof.

This checks the proposed extension mathematically; its final wording and integration require a later artifact hash.

## Limits

No literature-priority claim was assessed by this review. No finite enumeration is treated as proving the unbounded induction. No Lean checks were run. The review has no bearing on unrestricted S, R, stable-remainder strictness, or all 5-degenerate graphs unless their remaining local types are separately handled.

## Final integration check

Later reviewed artifact: `EQUALITY_THEOREMS.md`, SHA-256 `b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd`.

The stronger B-prime has now been integrated as **Theorem B**, explicitly forbidding K6-minus-one-edge as a subgraph and retaining K4/K5 equality components. The previous K5-free statement is Corollary B1. Section 5.4 contains the checked extra link certificate, and Section 6 contains the checked hereditary-class deduction.

The isolate wording defect is **resolved** in this reviewed hash: both the normalization and Corollary R-local explicitly discard isolated vertices. The change does not alter the local proof or the main degeneracy theorems.

Final review outcome for this hash: no unresolved mathematical defect identified in Theorems A, B, Corollary B1, or the correctly normalized R-local structural reduction. This remains a fresh internal ordinary-proof review with the stated scope, not formal verification or a novelty certificate.
