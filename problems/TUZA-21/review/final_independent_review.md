> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh adversarial review of the frozen TUZA-21 results

**Verdict: the three reviewed mathematical results are sound at their stated scopes. The principal campaign category is REFUTED_CANDIDATE, with a scoped H-D theorem. No unrestricted proof obligation is discharged.**

Reviewed on 15 November 2026 by a separately spawned AI critic. The critic inherited the coordinator's conversation, including mathematical sketches and the claimed values. Therefore this is an independently reconstructed proof/code review, not blinded discovery, independent model attestation, or external human peer review. I derived the calculations from the literal graph definition before reading the producer checker. No producer mathematical code was imported or executed. The independently authored finite calculation ran through standard input on the local Darwin Mac using the pinned Python environment, and wrote no source files or historical receipts.

## Clebsch cone: both quantifiers are genuinely refuted

Let L have the sixteen even subsets of a five-element set as vertices, adjacent when symmetric difference has size four; let G add a universal vertex z. Translation by symmetric difference preserves adjacency. Translating a possible triangle to contain the empty set leaves two distinct four-subsets, whose symmetric difference has size two. Thus L is triangle-free. Each vertex has five neighbors, so L has forty edges and G has exactly forty triangles, seventeen vertices, and fifty-six edges.

For an independent set, translate one member to the empty set. The remaining members are pairwise-intersecting two-subsets. Such a family has at most four members: either it is a star, or the three pairs ab,ac,bc are the entire possible nonstar family. Hence alpha(L)=5. Equality requires a full four-pair star together with the empty set. This is a vertex neighborhood; translation then shows that all independent five-sets are neighborhoods. There are exactly sixteen: adjacent vertices have zero common neighbors, while distinct nonadjacent vertices have two, so five-element neighborhoods cannot coincide. A vertex outside any such neighborhood has either five or two neighbors in it.

For any triangle-free L, a cover of cone(L) maps to a vertex cover of L without increasing its size: selected spokes pay their endpoints, and each selected rim edge can pay one endpoint. Conversely a vertex cover gives a spoke cover. Consequently tau(G)=16-alpha(L)=11.

The classification of every minimum cover is important for the existential quantifier. Let W denote the omitted-spoke vertices of a minimum cover D. Precisely E(L[W]) must be selected among the rim edges; any extra rim edge would be redundant, because its only triangle already has a selected spoke. Therefore |D|=16-|W|+e(L[W]), so |W|-e(L[W])=5. If L[W] has a vertex of degree at least two, selecting that vertex and then one endpoint for every remaining edge gives a vertex cover of size at most e(L[W])-1. Its complementary independent set has at least six vertices, impossible. Thus L[W] is a matching plus isolates. Selecting one endpoint per matching edge yields an independent five-set U inside W. Any vertex of W outside U would have at most one neighbor in U, contradicting the neighborhood property above. Hence W=U is independent. All sixteen minimum covers are therefore pure spoke complements of maximum independent sets.

All full triangles use two apex spokes, so nu(G)<=8. The involution x -> x xor 15 partitions the sixteen base vertices into eight actual L-edges; their cone triangles give equality. For any minimum cover complementary to U, the private triangle family F_C is precisely the cone on the crossing edges L[U,V minus U]. Its triangles use the five spokes to U, so nu(F_C)<=5. An explicit five-matching exists; for U={0,3,5,9,17}, use rim pairs (0,15),(3,12),(5,10),(6,9),(17,30). Translation carries this certificate to every other maximum independent neighborhood. Thus every minimum cover has |C|=11 and nu(F_C)=5.

This defeats BOTH 'every minimum cover' and 'there exists a minimum cover' versions of 2nu(F_C)>=|C|. It does not defeat unrestricted Tuza, since 11<2*8. It also does not defeat PK or minimum-cover approaches that retain triangles with two or three cover edges. The actual cause is discarding two-cover-edge triangles, not failure to optimize which minimum cover is used.

### Separate literal finite reconstruction

The critic's standard-input calculation independently constructed all graph edges and all actual triples; visited all 65,536 subsets W; computed min(16-|W|+e(L[W]))=11 and alpha(L)=5; found precisely sixteen equality subsets, equal to the sixteen independent neighborhoods; and found a private five-matching separately for each of the sixteen covers using an augmenting-path bipartite matching routine. Each of the private families had twenty-five triangles. The explicit full eight-packing was also checked as an edge-disjoint family. Runtime was approximately 0.115 seconds. No heavy solver, timeout, partial case, or UNKNOWN result occurred in this check.

The producer finite certificate agrees with these independent values. Its all-W reduction is valid because the ordinary argument above covers every possible ordinary graph-edge cover, including covers that select rim edges. Merely enumerating spoke covers would not have established the existential refutation, but that omission does not occur here.

## H-D at packing number two

This is an ordinary proof for all finite simple graphs satisfying the H-D premises with k=2; no planarity, sparsity, bounded order, or minimal-Tuza-violation assumption is used.

A graph with nu=1 has pairwise edge-intersecting triangles. If they do not all share one edge, choose abc and abx, then a triangle avoiding ab. It must be acx or bcx; the resulting six edges give a literal K4. A triangle outside this K4 cannot meet all four faces in edges. Hence the entire triangle support is that K4. In particular, nu=1,tau=2 forces exactly a K4 triangle family.

Now fix a triangle T in a graph satisfying H-D with k=2. The full triangle family after deleting E(T) is a K4 on U, and |U intersection V(T)|<=1. For each face F of U, the residual after deleting E(F) is a K4 containing T, say V(T) union {w_F}. If two tips w,wprime differ, write T=xyz with x its possible common vertex with U. The triangles xyw and xzwprime are edge-disjoint. A face of U avoiding x is edge-disjoint from both, because y,z are outside U and each of the first two triangles has at most one other vertex in that face. This would give packing number three. Therefore every w_F is the same w, giving one fixed K4 on V.

A triangle Q not inside V must meet every face of U, otherwise it survives one F-deletion and must be a V-face. The only triangles meeting every U-face in an edge are U-faces. Hence every actual triangle is a face of U or V. For every face F of U, all V-edges survive F-deletion; since the U-faces cover E(U), the two K4 supports are edge-disjoint. Any opposite pair in one K4 is a two-edge packing blocker.

This proves the claimed classification and H-D for k<=2. It does not justify replacing an arbitrary tight residual by K4/K5 cells, and it does not prove all-k component availability. The boundary diagnosis in notes/ordinary_scout.md correctly identifies that outside residual triangles can occupy attachment edges; a local three-for-two picture does not automatically extend to a global augmentation.

## Book discriminator: exact stated construction only

I checked the ordinary set geometry in review/book_verification.md. Opposite private pages share a core diagonal, so an edge-disjoint choice has zero, one, or two pages; two selected indices must be adjacent. The opposite/gain edge g_i belongs to owner i+1, and is in C0 precisely when that owner is unpaired. Thus the exact union costs are 12, 10, and 9. There is no hidden duplicate-gain saving in an adjacent pair: exactly one of its two gains is already selected.

The four private bases are forced in every original permitted cover. Four pairwise-disjoint residual two-spoke clauses require four additional edges, and selecting all four bases and all four core cycle edges attains eight. The original permitted set equals the packed support because each owner has only its unique private page and no private K4 completion. The displayed four-packing is maximum by the core-triangle obstruction argument. Thus minimum construction cost nine is larger than c_G(P)=8=2nu.

This refutes only the construction without subsequent deletions or other modifications. It does not refute all book arguments, optional-gain selection, PK-all, PK-exists, or Tuza. I did not repeat the producer's complete book enumeration; the ordinary proof and exact set-union calculation suffice for this audit. The additional ordinary tau=6 value remains the producer's finite certificate and is unnecessary for this refutation.

## Evidence and disposition

Accepted labels: ORDINARY_PROOF for the complete graph arguments, FINITE_CERTIFICATE for the literal finite checks, and REFUTED for the two exact auxiliary targets. No Lean theorem was created or checked in this review. No SAT/ILP oracle or published theorem is an indispensable input. The folded-cube facts and cone identities are proved directly; no historical novelty is claimed for them, the k=2 observation, or the resulting example.

The remaining unrestricted obligations are unchanged: H-D/component peeling for arbitrary k; PK global mixed-state compatibility; and a valid global minimum-cover method retaining all actual triangle types. The reviewed results do not qualify as GLOBAL_MECHANISM_ADVANCE under the mission's definition. Early closeout is mathematically defensible only after the coordinator documents its required regeneration stage and assesses any still-live successor with a concrete next lemma. A larger survival count alone is not such a lemma.

### Compared frozen files

- notes/ordinary_scout.md: SHA-256 45540a8f2aeadf77f98bb766c72031c080a149e8d5a3947fa6d5b8e4d682d4d5
- review/book_verification.md: SHA-256 555e6cab376856df6ae1c1ba7e85149f153c8b182e0a450380ec4307c7988a3a
- review/book_clebsch_private_refutation.md: SHA-256 51378c8781cc4c36258ce3e93e78b7e637273856d23c4e98967b313828971847
- data/book_clebsch_private_certificate.json: SHA-256 a47e966ae958a19e6bd2eb2a3e853e25bc661e0bfba41ddfcf1fb16affb25ec1
- scripts/book_clebsch_private_verify.py: SHA-256 28d8989f901428cbd19674b7fb3c1b3eed6327aa68c1cede8886ff5ac6115ab1

These are compared-file identities, not a claim of OS-enforced source immutability. Only this review file was written by this critic. No source workspace, public checkout, Git history, or remote was changed.

### Root consolidated proof comparison

After the independent reconstruction and finite calculation, I compared the coordinator's frozen PROOFS_AND_OBSTRUCTIONS.md, SHA-256 a42c010b8f0df5853f1cbea5f810a63b1df7b3094dab4e70a8c6aa3d914b559f. Its complete minimum-cover classification, the cyclic five-matching for U=N(0), the all-cover quantifier, and the k<=2/book scope statements agree with this review. The matching uses each missing coordinate i paired with {i,i+1}; each such pair has symmetric difference of size four and the five two-subsets are distinct. No mathematical correction is required in that frozen version.

## Final campaign stopping assessment (governance only)

I reviewed DECISIONS.md, the seven-part successor admission record notes/pk_successor_candidate.md, and the retained results/pk_successor_probe.json scope metadata. The successor screen contains 34 cases representing 31 labelled edge sets and 341 checked minimum covers. One minimum-cover enumeration reaches the 64-cover cap, leaving its other covers UNKNOWN. All examined covers already meet the private-only bound: zero deficient covers and zero extension states were tested. Thus these passing cases provide no evidence for the difficult full-extension implication. The coordinator correctly distinguishes the cone matching argument from a general triangle-packing theorem, and reports no general charging or augmentation mechanism.

The voluntary early-stop requirement is satisfied by the documented mathematical decisions: ordinary-cover A1 received first consideration and reached a precise occupied-attachment obstruction; the PK representation screen exposed an already-known missing pattern; explicit regeneration changed the starting object to minimum ordinary covers, leading to a fully certified refutation even after optimizing the minimum-cover choice; and the substantive full-extension successor was considered with exact quantifiers and a bounded test before being classified STALLED. This is more than a cosmetic optional-gain revision or a stop after two related failures.

Recommendation: **STOP this campaign after coherent closeout.** There is no supported concrete next structural step in the reviewed proposals, and increasing finite survival counts would not resolve their specified gaps. This recommendation retires the refuted mechanisms and suspends the stalled ones for this run. It is neither a proof of impossibility for H-D, PK, minimum-cover research generally, nor a recommendation to terminate the broader Tuza project. Unrestricted Tuza remains unresolved. The eight-hour allowance is a ceiling and imposes no minimum runtime. Final reports should retain the successor's partial case and absence of difficult-state coverage explicitly.
