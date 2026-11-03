# Frozen targets (2026-11-02)

Source S is the authenticated TUZA-14B frozen mathematical packet (neutral label `14bd` in the [source manifest](../../TUZA-11-15-SOURCE_MANIFEST.json)). Its primary public proof is [PROOF_AND_OBSTRUCTIONS.md](../PROOF_AND_OBSTRUCTIONS.md). All line references below refer to S/PROOF_AND_OBSTRUCTIONS.md unless stated otherwise. Statements are frozen before independent reconstruction; addenda must preserve these targets.

## Definitions and quantifiers

Every graph is finite and simple. T(G) contains every actual graph triangle. nu is maximum cardinality of graph-edge-disjoint triangles; tau is minimum cardinality of an actual-edge triangle cover. C always denotes a specified globally minimum cover, red edges are exactly C, and all other actual edges are blue. An eligible triangle has one or two red edges, and k(G,C) is maximum eligible packing cardinality using actual graph-edge disjointness. S quantifies over EVERY minimum C, E over SOME minimum C, and both are open in general. tau* is the full triangle fractional edge-cover optimum, equal by finite LP duality to the full fractional triangle-packing optimum. Definitions: lines 1–5; LP: 160–169.

## T1: structural and preservation targets

For every G and every specified minimum C, if C contains an actual all-red triangle and k(G,C)<=3, then tau(G)<=6. Self-contained ordinary theorem: lines 191–350, relying on the fan, two-apex and no-apex reductions at 17–101. Intermediate exact targets: all-red plus k<=2 implies every actual triangle is contained in one induced K5 or K5-e (triangle-free background permitted), with nu=k=2 and tau=4 or 3 respectively (31–43); nu<=3 implies k=nu for every minimum cover (43–45), with no external Tuza input needed for preservation. The nine-vertex K4-ring has designated (tau,nu,k)=(6,4,3) and disproves full preservation at nu=4, without disproving S (45). Private-witness swap must retain triangles meeting both deleted reds (19–23). No prescribed private witness is assumed extendible to a maximum packing.

## T2: small-parameter S

For every G with tau<=8, EVERY minimum C satisfies k>=ceil(tau/2). This uses T1 and the accepted ordinary bound tau<=2nu for nu<=3 (355–357). For every G with nu<=4, S follows using additionally the accepted externally sourced Liu nu<=4 theorem (359). With either exact pair (tau,nu)=(7,4) or (8,4), every minimum C has k=4, using only T1 and the exact pair hypotheses (361). Parker/preceding nu<=3 and Liu's computer-assisted theorem are published/trusted interfaces, not freshly rerun proofs; class-9 printed 378 must be corrected to 389. Source identities to be checked in TUZA-11. E follows only in the same certified ranges.

## T3: literal clique blocks and slack

Blocks are literal complete subgraphs and pairwise EDGE-disjoint, allowing shared vertices and arbitrary additional graph edges/triangles. Saturation: if tau(G)=sum_i tau(B_i) and S holds locally, it holds for G (134). K4/K5 two-slack theorem: summed local cover cost 2b and 2b<=tau(G)<=2b+2 imply S (136–146). Local size<=minimum+1 permits full eligible local packings avoiding ANY specified edge; K5 cover size<=6 permits avoiding any RED root; arbitrary blue-root version at size 6 is false (138–146).

For K3/K4/K5 blocks with summed local cover cost B, B>=tau-1 implies S (148). With B>=tau-2 and r K3 blocks, S holds for r=0, r=2 or r>=4; r=1 and r=3 are not claimed (150–154). The three 12-vertex kernels have one K5 plus five edge-disjoint K3s, B=9,r=5, so this theorem supplies six eligible triangles under EVERY minimum C. The stronger k=7 for every minimum C is a separate finite statement with 210 minima per kernel, not a symbolic consequence of the slack theorem (156). Exact witness inputs will be extracted as data without borrowing checker logic.

## T4: pendant attachments and designated book family

Let H be a graph and D a set of DISTINCT edges. Attach one fresh K4 or K5 on each selected edge, with pairwise disjoint new vertices having no other neighbors. Put b=d4+2d5 and R=H-D. Then tau(G)=2b+tau(R), nu(G)=b+nu(H), and k(G,C)=b+k(H,C∩E(H)) for EVERY minimum C (117–126). The restriction to R and to each attachment is minimum locally; the restriction to H need not be minimum. S inheritance for a specified C and E inheritance are to be made precise using R (128). Repeated roots are outside the frozen theorem.

When one K4 is attached to EVERY core edge, all minimum covers correspond to arbitrary triangle covers of H via opposite-edge pairs, and the all-core-red designated minimum cover has k=m, nu=m+nu(H), tau=2m (130). For the b-page book, source admissible b domain must be authenticated: (tau,nu,k_designated)=(4b+2,2b+2,2b+1), ratio 2-1/(b+1), and triangle-conflict connectedness. This is a designated-cover statement, not a universal k-value for every minimum cover.

## T5: fractional bound and conditional cut algorithm

For every G and EVERY minimum C, k>=ceil((3tau*-tau)/4) (160–169). Derivation uses the FULL LP and the published rank-three Fano-free fractional matching theorem of Füredi (165–171); its transfer to the eligible subfamily must be independently justified. S sufficient gaps: tau-tau*<4/3 for even tau, <2/3 for odd tau. Endpoints excluded by the integer arithmetic; assess actual endpoint examples separately.

Conditional exchange (173): for a prescribed full packing P and deletion set S⊆C containing no complete all-red triangle and meeting each all-red member of P, select added blues so that the result remains a cover and every member of P is eligible. Exact positive/negative clauses and any forced values are to be frozen from underlying derivation. If the COMBINED pair-clause graph is bipartite, Boolean complementation on one side turns both clause signs into implications, and an exact min-cut computes minimum number of selected blues. A feasible optimum of cost |S| is a minimum-cover migration preserving P. No general suitable S or universal zero-excess existence is claimed. Freeze and judge fractional and cut subtargets independently.

## Independence and status discipline

Before this file was written, source identities, receipt, manifest and the primary proof workbook were read. The workbook visibly embeds favorable historical critic claims. No historical critic note, old checker implementation, or final executive report has been used as mathematical evidence. Fresh derivations/checkers precede historical-review comparison and will be committed as the initial independent audit. General S, E and unrestricted Tuza remain OPEN. No Lean result is sought or claimed; novelty is UNESTABLISHED absent a specialized primary-source search.

## Authentication addendum (original targets retained)

The book's exact original domain is integer b>=1, from S/notes/TRACK_B.md77–88; b=0 is outside the target. The exact signed-cut clause source is S/notes/TRACK_B.md211–232: affected one-red triangles give positive blue pairs; affected two-red triangles force their sole blue; unchanged packed two-red triangles forbid their sole blue; unchanged packed one-red triangles forbid selecting both blues. The pair graph is the union of both signs. Equality-cost migration yields a minimum cover, possibly identical for the empty exchange. These clarify previously referenced original definitions without weakening a frozen theorem.
