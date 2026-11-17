> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three matching edges: bare-page terminal confinement

Frozen ordinary proof candidate, 2026-11-16. All actual graph triangles count. This is a necessary global constraint, not yet a paid reduction.

Let S={s1,s2,s3} be three vertex-disjoint edges of a finite simple graph Q, put L=Q-S, assume B(L), nu(Q)=nu(L)+2, and that Q is single-edge packing resilient. An ordinary si-page is a Q triangle containing si. Because S is a matching, every new triangle is ordinary. A page is B-bare when both its L edges belong to no L triangle. Write m=nu(L).

**Claim.** Every B-bare page has its apex among the endpoints of the other two bases. More precisely, if a B-bare si-page has apex at a terminal of sj, then every maximum packing of Q-si contains an sj-page whose apex is one of the endpoints of si, and that sj-page meets the bare page in their terminal crossedge.

**Proof.** Single-edge resilience gives a packing P of Q-si of size m+2. P has at most m old L triangles. Since the remaining two new bases sj,sk are vertex-disjoint, every nonold triangle uses exactly one of them and P contains at most two such triangles. Equality in both bounds is forced: P consists of m old triangles and one page on each remaining base, and those two pages are edge-disjoint. A B-bare si-page is edge-disjoint from every old triangle. It must therefore meet one of the two new pages, or it would append to P and contradict nu(Q)=m+2. Two pages on disjoint bases can share an edge only when each apex is an endpoint of the other's base: their shared edge joins those two apices. This proves both conclusions. The argument applies to every such P.

No minimum-CS, cover eligibility, cover number, connectivity, C12 classification, or finite computation is used in the claim. In the intended profile tau(Q)=2m+3, the accepted whole-page cover lemma separately ensures at least one B-bare page for each base.

## Route and remaining obligation

Fragile blocker-pair residual in the conditional minimum Q -> three-edge B profile: PROVED_ORDINARY in the parent argument. If S is a matching, the terminal-confinement conclusion above follows: PROOF_CANDIDATE. A classification of the confined bare-page patterns together with arbitrary supported spokes and old-clique attachments into C12 or a paid/separator reduction: OPEN. Completion of the other S shapes and the no-blocker branch: OPEN. Exclusion of every conditional minimum Q -> universal CS -> Tuza: first arrow CONDITIONAL on archived setup, second PROVED. This result alone neither classifies resilient defect-one supports nor proves availability in minimum degree at least four.

## Dependencies and execution

Definition and profile: TUZA26 notes/eligibility_saturation_v1.md and reviews/opening_saturation_review.md. Elementary page geometry only; no old R3 gain-one conclusion is imported. Requested configuration Astra/Ultra; actually observable worker model/effort attestation is unavailable in the inherited context. Local Darwin host authenticated; no numerical work or installation was needed for this proof.
