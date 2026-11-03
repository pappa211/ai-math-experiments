# TUZA-13 — aggressive falsification report

**Verdict: SURVIVED_TESTED_DOMAIN. No counterexample to the frozen two-red conjecture was found.** The universal statement remains unproved. Generic solver timeouts are excluded from the passing domain and retain PARTIAL status. General Tuza remains OPEN; this mission establishes neither publication readiness nor historical priority.

The strongest exact near miss is a nine-vertex triangle of K4 blocks with tau=6, unrestricted nu=4 and eligible nu=3. It reaches the required threshold exactly even though discarding all-red triangles loses a packing unit. Two larger independently certified near misses have (tau, full nu, eligible nu)=(7,5,4) and (9,6,5). Exhaustive one/two-edge toggles and all added-vertex neighborhoods around these three examples also survived. See `NEAREST_MISSES.md` for literal witnesses, optimum-cover quantifiers and a short proof of the nine-vertex example.

## Frozen target and exact scope

For EVERY finite simple graph G and EVERY minimum-cardinality actual-edge triangle cover C, the target is

    nu({T in all actual triangles of G : |E(T) intersect C| is 1 or 2}) >= ceil(|C|/2).

Packings use graph-edge disjointness and may share vertices. All-red triangles are excluded; C must be globally minimum. Neither an arbitrary triangle subfamily nor a merely inclusion-minimal cover was substituted. `TARGET_AND_SOURCES.md` and the verbatim `MISSION.txt` freeze these quantifiers.

The general engine completed **24,896 graph jobs and 1,011,344 optimum-cover evaluations**. Exact labelled edge-list/cover deduplication gives **23,753 distinct labelled graphs and 1,001,491 distinct graph/cover pairs**. Every completed generic graph job enumerated all its minimum covers; no cover cap was reached. These are not isomorphism counts. The exhaustive structured domains below are separately counted modulo permutations of independent apices, not modulo all graph automorphisms, and may overlap generic controls. They must not be added into a claimed globally unique census.

| Generic stage | Exact graph jobs | All-optimum cover evaluations | Timed-out jobs |
|---|---:|---:|---:|
| Named clique/restoration controls | 8 | 238 | 1 |
| Restoration family and all added-vertex neighborhoods | 624 | 5,917 | 0 |
| Clique overlaps, cone perturbations and apex joins | 312 | 8,474 | 21 |
| Seeded dense sample | 459 | 2,253 | 40 |
| Triangle-free blue-background constructions | 486 | 1,412 | 14 |
| Cover-preserving deletions, clique unions and mutations | 18,528 | 907,943 | 5 |
| Focused tight-example perturbations | 4,415 | 80,243 | 0 |
| All six-bud attachment subsets | 64 | 4,864 | 0 |

The 81 generic timeout records correspond to 78 graph identities not solved in another generic ledger. K10 was separately discharged by the complete minimum-cover symmetry classification and a literal qualifying packing. K11 and K12 were likewise checked by symmetry and threshold witnesses; their exact eligible maxima were not claimed. Larger dense graphs and several Clebsch multiapex variants remain unresolved. These timeouts are not failures and are not passes.

| Complete structured domain | Apex-neighborhood multiset representatives | All minimum-cover checks |
|---|---:|---:|
| C5 plus 3 independent apices, every neighborhood | 5,984 | 40,923 |
| C5 plus 4 independent apices, every neighborhood | 52,360 | 441,844 |
| C7 plus 2 independent apices, every neighborhood | 8,256 | 60,734 |
| C7 plus 3 independent apices, every neighborhood | 357,760 | 5,006,158 |

These four domains total 424,360 representatives and 5,549,659 minimum-cover checks, with no timeout. They include covers with one or two all-red triangles; they are not only favorable one-cover tests. Eligible packing equals full packing throughout these particular domains. Five triangle-free cone controls additionally enumerate all 47 optima, including all 16 Clebsch-cone covers; six uniform multiapex controls enumerate all 95 optima. Overlap is explicitly retained in the per-domain counts. The 3,815-graph rooted-edge diagnostic is a separate auxiliary search, not another central-conjecture census.

`SEARCH_COVERAGE.json` contains exact generators, ranges, counts, margins and literal inputs for every generic timeout. `SEARCH_LOG.md`, the scripts and compressed lossless manifests record seeds, mutation rules, apex-permutation conventions, budgets and reproducible tested inputs. No whole order-n graph census, global isomorphism quotient or unperformed 2^n enumeration is claimed.

## What was learned mathematically

**Independently reviewed ordinary lemmas.** If a failing pair exists, choose one with the fewest actual graph edges and put k=eligible nu. Then:

- Its minimum cover has size 2k+1>=5; deficiency is exactly one.
- Every graph edge is tau-critical: deleting it lowers tau by one. Equivalently, every edge belongs to some minimum cover.
- Every pair of red edges can be avoided by a maximum eligible k-packing.
- Its triangle-conflict graph can be assumed connected.

The proof starts with the exact identity tau(G-S)=tau(G)-|S| for every subset S of a specified minimum cover. These are necessary conditions under a minimal-counterexample hypothesis, not sufficient conditions or a universal proof. They were independently reviewed and challenged by 180 red-subset and 54 edge-criticality control checks. The deletion search used the equivalent all-optimum-cover union test and re-solved each resulting graph.

A cone over a triangle-free base satisfies the target for every minimum cover: no such cover has an all-red triangle, tau equals the base vertex-cover number and full packing equals the base matching number. The usual endpoints-of-a-maximum-matching cover gives the factor two. Uniform independent-apex joins also have no all-red triangle in any minimum cover; the general no-all-red statement alone is not being promoted into a new proof of Tuza for those joins.

**Two auxiliary claims were refuted exactly.** Discarding all-red triangles need not preserve the covering number: a nine-vertex example has tau(G)=7 and eligible covering/packing number six. Separately, an inclusion-maximal eligible packing can be smaller than the threshold, so an add-only augmentation rule fails. Both examples still satisfy the central target. Their literal inputs, exact certificates and human arguments are in `NEAREST_MISSES.md` and `notes/STRUCTURAL_ATTACK.md`.

The Clebsch control confirms that two-red triangles are genuinely needed: private-only packing is five against threshold six, whereas eligible packing is eight. In the completed domains no all-red triangle was necessary to reach the half-cover threshold. Several examples require all-red triangles to attain the larger unrestricted maximum, which is a different statement.

## Verification, independence and limitations

Discovery used integer bit masks, exact hitting-set branching and a maximum-clique coloring bound for edge-disjoint packing. A separate author wrote a standard-library frozenset checker using a different packing recursion, plus direct edge/triangle-subset enumerations on small cases. It independently matched six reference controls, 100 seeded seven-vertex graphs and all 310 of their covers, 26 specialized unequal-apex graphs and 615 covers, the three normalized nearest misses and all 181 covers, the Clebsch displayed optimum, and the auxiliary cover-drop witness. Relabeling, triangle-free background edges, complete triangle reconstruction, eligibility monotonicity, disjoint unions, the full-packing upper relation and integer comparisons passed. `INDEPENDENT_CRITIC.md` states the exact independent scope.

The agents have separate checking contexts and separately authored algorithms, but share the same local Python runtime and inherited model configuration; actual serving identities were not exposed. No independent human review, Lean proof, formal exhaustion certificate kernel or serving-model attestation is claimed. The owner-requested current Astra selection/reasoning was inherited without override; the actual serving identity/effort was not exposed. The small checker-adapter schema error was preserved and corrected; it was not a mathematical candidate. The auxiliary cover-preservation probe additionally retains 126 K9 timeouts, separate from the 81 generic central-search timeouts.

No positive-deficiency candidate occurred. Thus no central `FALSIFICATION.md` is appropriate. The finite negative searches do not establish the universal statement, and unresolved jobs cannot be used as evidence for it.
