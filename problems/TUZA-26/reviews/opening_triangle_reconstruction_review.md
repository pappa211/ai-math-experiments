> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: named triangle-residual reconstruction

Verdict: PASS, PROVED_ORDINARY for the complete all-size reduction plus VERIFIED_FINITE_INDEPENDENT_REPLAY for its exact finite interface. This is a new gain-one/cover-two restoration, not the older original-parent restoration and not Lean verification.

## Frozen statements and exact scope

The reviewed statements are notes/matching26_triangle_residual_domain_v1.md and notes/matching26_triangle_residual_result_v1.md, bound to the hashes below. The input Q is the conditional minimum unknown support inside the fixed minimum-CS failure G, with the already accepted triangle support/connectivity, three-vertex connectivity, minimum degree four, saturation and no blocker pair. The supplied triangle residual R=Q-E(T) is assumed single-edge resilient and defect one. The source itself does not establish that premise.

No-blockers and appending T give nu(Q)=nu(R)+1. Proper CS and component additivity supply exactly one defect-one active component and otherwise tight components. Explicit minimum-Q choice names the smaller resilient connected active support C as C12. Proper CS alone does not name it.

For each tight component, all T pairs are absent, so it contains at most one T vertex. Each incident base's whole ordinary-page family contributes at most one old edge, and these at most two edges are adjacent at that T vertex. Every other Q triangle is either an old residual triangle or T itself; no additional two-base triangle exists. Thus the boundary is complete, and the previously paid boundary theorem removes every tight piece. The independent frontier review had separately reconstructed the same observation without a resilience assumption. This step retains shared vertices and all background.

## All-size confinement and terminal count

A vertex outside C and all three terminals can only occur as an ordinary-page apex. Triangle-supportedness therefore gives it at most three neighbors, contrary to minimum degree four. Every support vertex lies in C union the terminals. C is induced in R: an extra internal edge, together with C's universal vertex, would produce an old triangle sharing C edges and enlarge its support. The old neighbor set of any outside terminal in C is independent, since two adjacent neighbors would create an old triangle outside the named support.

Every restored base has an ordinary page. Deleting the other two T edges must preserve nu(Q)=r+1; without a page the remaining triangle family would be exactly R's, with packing r. This is a legitimate and necessary use of no blockers, not an inherited condition on an arbitrary residual.

With zero terminals in C, all new pages use only background spokes, so the new triangle family cannot share an edge with old C. This contradicts Q's triangle connectivity.

With just a in C and b,c outside, put B=N_R(b) intersect C and D=N_R(c) intersect C. They are independent and exclude a. A bc-page exists, so X=B intersect D is nonempty. Triangle connectivity requires an ab/ac-page with a supported C spoke, say apex y. Any bc-page with apex x different from y is disjoint from that supported page; a maximum C packing avoids its single C spoke, giving r+2 triangles. Thus X={y} and every supported ab/ac page has that apex. For z in B outside D, the old edge bz can be supported only by an ab-page, which would force z=y in D, a contradiction. Hence B subset D, and symmetrically D subset B. Therefore B=D={y}; each outside terminal has exactly its two restored triangle neighbors and y, giving degree three. This rules out the one-inside case with all old background accounted for.

With all three terminals inside C, they are an independent triple and Q is exactly C plus those three missing edges. With two inside terminals a,b and outside c, Q is exactly C+ab plus the c spokes to a,b and an independent set I disjoint from a,b. Minimum degree at c gives |I|>=2 and the actual C12 independence bound gives |I|<=3. There are no other vertices or old background edges. Support, active-base and separator conditions remain necessary filters rather than unproved reductions.

## Independently authored completeness and certificate replay

The new checker scripts/opening_triangle_replay.py imports no author generator or optimizer. It rebuilds every literal C12 from its clique pieces (plus W5 and K5-e), compares those exact labeled graphs with frozen inputs and the previously independently checked baseline, verifies universal vertices and absence of independent four-sets, then generates all independent triples. For outside presentations it chooses I first, then every missing internal base disjoint from I, reversing the author's order.

The checker reconstructs every actual triangle family and verifies that deleting the restored triangle leaves precisely C's triangles in every presentation. It establishes a bijection with all 6,672 frozen domain rows, with no repeated keys:

- 160 internal independent triples;
- 6,512 outside presentations;
- 3,267 valid low-degree witnesses;
- 2,558 valid unsupported-edge witnesses;
- 72 valid inactive-base witnesses, each leaving exactly the old triangle family after the other two base deletions;
- 645 valid vertex-separator certificates of size at most two;
- 130 retained cases: 36 internal and 94 outside, maximum order 13.

For every retained graph, the checker independently verifies minimum degree, support of every edge, activity of each ordinary base, and connectivity after every vertex deletion set of size zero, one or two. It then checks that the cover-certificate rows match the survivors bijectively. Every recorded cover is a set of actual edges hitting every actual triangle. Every recorded packing is edge-disjoint, consists of old C triangles plus T, and has L=r+1 members. Each cover has U=2r edges. Therefore tau(Q)<=U=2L-2<=2nu(Q)-2, directly contradicting the target defect one. No optimum or completeness property of the author's cover pool is needed, and no unused optimizer field is trusted.

Fresh native run: PASS in 1.2894465409917757 seconds, one process, zero solver threads, pinned local Python 3.12.12. The process exited. Input hashes were checked stable during replay. The receipt is evidence/opening_triangle_replay.json. No sampling, orbit quotient or external computation was used.

## Composed consequence and remaining gap

The exact conclusion is that no resilient defect-one triangle residual exists in the accepted minimum Q. Its proof does not assume the separate B-branch exclusion or any later every-triangle-minimum-cover claim. The all-size reduction uses only previously paid constraints, so the dependency order is noncircular.

Separately, the already accepted triangle-plus-edge B theorem proves that EVERY defect-one triangle residual would be resilient. Combining the two independently reviewed implications now excludes every defect-one triangle residual. The accepted dichotomy consequently gives, for EVERY actual Q triangle T,

    nu(Q-E(T))=k-1, tau(Q-E(T))=2k-4, delta=2.

Equivalently each T is contained in SOME minimum Q cover; the cover may depend on T. For each D subset E(T), tau(Q-D)=tau(Q)-|D|. The exact chain recorded in the frontier note is therefore available at this same conditional minimum-Q scope. In K=Q-e, every e-page's spoke pair is a blocker whose deletion leaves defect two, not defect one. It cannot be fed into the old minimum-Q naming rule.

This is a structural restriction, not useful residual availability. Resilient defect-two supports remain unnamed, and critical defect-two residuals may leave resilient defect-one or further-critical residuals with different restoration payments. No unrestricted Tuza/CS conclusion, global R premise, C12 enlargement or historical-originality claim is made.

## Bound source and checker hashes

- notes/matching26_triangle_residual_domain_v1.md: `612cdb1dd9083dce9dd5bd80e298633af296b67bcc28c5f064a1a3e52ec8fdd1`.
- notes/matching26_triangle_residual_result_v1.md: `6834cbd71e9600a04bdfa89cad8613f5a3bd44a657155e3c61d1116556b57926`.
- inputs/C12_frozen.json: `eae0cea592aa0bbcb2b8c1fe3bcdfe596474a0238095cbf8db451fbf3d3af2d7`.
- evidence/opening_checks.json: `c838e6bb94c9bcfad9ea523f599897d856f576b418cab2264ac873e759e08f2a`.
- evidence/matching26_triangle_domain.json: `17c552385b8d60cf830693daa0a2f9bb3bf9010447e2d1d6f72dc64404a75240`.
- evidence/matching26_triangle_cover_certificates.json: `82913ed5901491ba72c4b5e8ba099a48ccc740bf65c7cf821e21cf31c01574ec`.
- scripts/opening_triangle_replay.py: `106dcb2dd83ee073104fc14bfe14059a509d644b60df6a0996e02978a375df33`.
- evidence/opening_triangle_replay.json: `26bfdfe49b7192e8a506495b4d16835b08ed2dc4738e2892847363f05ffa8534`.

Frozen UTC: 2026-11-16T22:33:14.476594+00:00
