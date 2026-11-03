# TUZA-14B ratio audit of the frozen TUZA-13 completed cases

**Status: completed receipt reclassification; no solver replay and no new S/E proof or refutation.** The TUZA-13 generic ledger contains **1,147 unique labelled graphs / 51,945 distinct graph–minimum-cover pairs with 2τ>3ν**. Of those, **18 graphs / 303 covers have positive eligible-packing loss**, always one. Seven of the 18 graphs remain outside the stronger integer sufficiency criterion below. The four large cycle/apex domains add **zero hard-range graphs**: every positive-triangle instance is in 2τ≤3ν.

These are reused exact receipts, with fresh identity, ratio, arithmetic, aggregate and component checks. No million-cover optimizer replay was performed. The 78 unresolved graph identities remain UNKNOWN. Neither S nor E is established universally by this audit.

## Independently reconstructed mathematical lemma

Let G be a finite simple graph, let C be a globally minimum actual-edge triangle cover of size τ, and fix a maximum edge-disjoint triangle packing P of size ν. Every triangle of P meets C. If t members of P are all-red, those t triangles require three distinct selected edges each; each of the other ν−t triangles requires at least one selected edge. Since P is edge-disjoint, all these selected edges are distinct. Therefore

\[
\tau\ge3t+(\nu-t)=\nu+2t,
\qquad t\le\left\lfloor\frac{\tau-\nu}{2}\right\rfloor.
\]

Removing only the all-red members of P leaves ν−t eligible triangles, still pairwise edge-disjoint. Thus, for **every** minimum cover C,

\[
k(G,C)\ge\nu-\left\lfloor\frac{\tau-\nu}{2}\right\rfloor
=\left\lceil\frac{3\nu-\tau}{2}\right\rceil.
\]

If 2τ≤3ν, then 3ν−τ≥τ; monotonicity of the ceiling gives k(G,C)≥⌈τ/2⌉. This proves S in the stated sufficient regime. It does not establish Tuza's inequality for arbitrary graphs or assume τ≤2ν elsewhere.

The exact integer sufficiency test is slightly stronger:

\[
\nu-\left\lfloor\frac{\tau-\nu}{2}\right\rfloor
\ge\left\lceil\frac\tau2\right\rceil
\quad\Longleftrightarrow\quad
2\tau\le3\nu+\mathbf1_{\tau\text{ even}}.
\]

For τ=2a, the left side is ⌈(3ν−2a)/2⌉≥a, equivalent to 3ν−2a≥2a−1. For τ=2a+1, it is ⌈(3ν−2a−1)/2⌉≥a+1, equivalent to 3ν−2a−1≥2a+1. These are respectively 2τ≤3ν+1 and 2τ≤3ν. The mandated ratio strata are kept separate; the extra integer-certified cases are marked separately. A small exhaustive integer check of the implementation covers 0≤ν≤100 and ν≤τ≤3ν; the argument above is the proof.

Define loss=ν−k and allowance=ν−⌈τ/2⌉. Then, without any extra hypothesis,

\[
S\text{ at }C\iff\operatorname{loss}(G,C)\le\operatorname{allowance}(G),
\qquad
E\text{ at }G\iff\min_C\operatorname{loss}(G,C)\le\operatorname{allowance}(G).
\]

The signed **deficit** below is ⌈τ/2⌉−k=loss−allowance; a positive value would refute S at that cover. If τ=2ν or τ=2ν−1, the allowance is zero. Then S requires k=ν for every optimum cover; E requires it for at least one. If ν=0, G has no triangles and τ=k=0, treated separately.

## Exact generic-ledger table

All cover-level figures in this table are exact **as recorded by the completed TUZA-13 optimizer**, deduplicated by the literal graph and cover identities. Optimizer correctness/completeness is reused from that mission and its documented independent checks; it was not newly re-proved for every case.

| Ratio stratum | Unique labelled graphs | Unique graph/min-cover pairs | Graphs with some all-red optimum | Covers with all-red triangles | Loss range | Allowance range | Deficit min/max |
|---|---:|---:|---:|---:|---:|---:|---:|
| ν=0 | 0 | 0 | 0 | 0 | — | — | — |
| ν>0, 2τ≤3ν | 22,606 | 949,546 | 16,896 | 372,697 | 0–2 | 0–7 | −7 / 0 |
| 3ν<2τ, τ<2ν | 867 | 44,497 | 822 | 41,845 | 0–1 | 0–1 | −1 / 0 |
| τ=2ν | 280 | 7,448 | 176 | 6,620 | 0 | 0 | 0 / 0 |
| τ>2ν | 0 | 0 | 0 | 0 | — | — | — |
| Unresolved ratio/optima | 78 | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |

The completed rows total **23,753 graphs and 1,001,491 graph/cover pairs**, matching the authenticated earlier manifest exactly. The underlying 24,896 completed graph jobs / 1,011,344 cover evaluations include repetitions and are not added to those totals. All 81 timeout job records were retained; three graph identities also have completed generic receipts, leaving 78 unknown graph identities.

The 2τ≤3ν stratum is mathematically automatic: all 22,606 graphs and 949,546 pairs are covered by the lemma. Outside it, the stronger integer test certifies another **181 graphs / 13,759 pairs at (τ,ν)=(8,5)** and **33 graphs / 99 pairs at (τ,ν)=(2,1)**. Hence **933 graphs / 38,087 pairs** lie beyond the integer bound. This is a classification of the existing completed domain, not a new census.

Positive loss occurs on 896 automatic graphs / 7,540 covers and 18 hard-range graphs / 303 covers. Every tight τ=2ν cover has loss zero despite substantial all-red incidence. The hard one-off τ=2ν−1 subdomain has **646 graphs / 20,506 covers**, including **602 graphs / 18,679 covers with all-red triangles**; every one has loss zero. A further 518 generic one-off graphs / 2,821 covers lie in the automatic stratum; 62 of those graphs/covers contain all-red triangles. Thus “one-off” does not itself imply a ratio above 3/2 for small ν.

## Structured manifests and cross-domain deduplication

The specialized completed manifests retain every literal graph and its all-optimum-cover count. Three retain only max T3 and min k across covers; the C5+3 file also retains the full (k,T3) distribution. Consequently graph-level all-red incidence, all-cover counts, ratio and loss are recoverable; exact cover-level all-red incidence is **UNKNOWN** for many rows of the three compressed aggregate manifests.

| Specialized domain | ν=0 graphs / pairs | Automatic positive-ν graphs / pairs | Hard-range graphs / pairs |
|---|---:|---:|---:|
| C5 + 3 independent apices | 286 / 286 | 5,698 / 40,637 | 0 / 0 |
| C5 + 4 independent apices | 1,001 / 1,001 | 51,359 / 440,843 | 0 / 0 |
| C7 + 2 independent apices | 435 / 435 | 7,821 / 60,299 | 0 / 0 |
| C7 + 3 independent apices | 4,495 / 4,495 | 353,265 / 5,001,663 | 0 / 0 |

Every specialized row records min k=ν, so all its minimum covers have k=ν (always k≤ν). Thus every specialized loss is exactly zero, and its deficit is exactly minus its allowance; no guessed maximum is used. The specialized totals remain 424,360 labelled representatives and 5,549,659 cover checks.

The new audit compares **exact n plus the sorted literal edge list**, including isolated vertices, across all generic and specialized inputs. It finds one overlapping graph/one cover between the generic ledger and C5+3; the other specialized domains add no further repeated literal graph identities. This permits the following genuinely deduplicated union of the specified completed ledgers:

| Union stratum | Unique labelled graphs | Unique graph/min-cover pairs | Graphs with an all-red optimum | All-red cover incidence | Loss | Allowance | Deficit |
|---|---:|---:|---:|---:|---:|---:|---:|
| ν=0 | 6,217 | 6,217 | 0 | 0 | 0 | 0 | 0 |
| ν>0, 2τ≤3ν | 440,748 | 6,492,987 | 42,943 | **UNKNOWN; between 398,939 and 1,878,111** | 0–2 | 0–7 | −7–0 |
| 3ν<2τ, τ<2ν | 867 | 44,497 | 822 | 41,845 | 0–1 | 0–1 | −1–0 |
| τ=2ν | 280 | 7,448 | 176 | 6,620 | 0 | 0 | 0 |
| τ>2ν | 0 | 0 | 0 | 0 | — | — | — |
| Unresolved | 78 | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |

Completed union: **448,112 labelled graphs / 6,551,149 graph–minimum-cover pairs**. The triangle-free row is trivially automatic; the separate positive-ν automatic row is covered by the displayed lemma. These numbers are not isomorphism classes and do not count apex permutations that were not represented in the old manifests.

For an aggregate row with max T3>0, at least one and at most all its optimum covers have T3>0; with max T3=0, exactly none do. Summing these bounds after literal-identity deduplication produces the stated interval. More detailed overlapping receipts take precedence. No unlogged cover distribution is reconstructed. All other requested extrema are recoverable here; all-red triangle-count extrema over the completed union are 0–14 in the automatic stratum, 0–5 in the strict intermediate stratum, and 0–2 at equality.

The separate cone/uniform-apex controls, rooted auxiliary diagnostic and K10–K12 threshold-only symmetry certificates are **not added** to this table. K10's separate threshold proof does not provide an unrecorded exact ν for the timed-out generic job. The absence of a completed τ>2ν row is an observation about this domain, not an assumption about all graphs.

## Hard-range positive-loss seeds and actual interaction

`evidence/ratio_hard_seeds.json` preserves all 18 positive-loss hard labelled graphs, their actual edges, displayed globally minimum cover, eligible packing, recorded τ/ν/k, source ledger and line number. It also includes 12 tight all-red examples and 12 one-off hard all-red examples. These are selection aids, not additional graph counts.

| Recorded (τ,ν,k) on a worst cover | Labelled graphs | Connected triangle-conflict graph | Certified by integer lemma? |
|---|---:|---:|---|
| (8,5,4) | 11 | 10 | Yes |
| (10,6,5) | 2 | 2 | No |
| (11,7,6) | 5 | 5 | No |

Triangle-conflict vertices are **all actual triangles**; adjacency means sharing a graph edge. Fresh direct triangle enumeration and graph traversal show 17 of the 18 are connected. The exception, critical ledger line 6763, splits into a 9-vertex/18-edge/13-triangle component and a K4 component: its apparent hard ratio is partly padding of an automatic loss core. The two (10,6,5) seeds have an 11-vertex, 26-edge, 25-triangle connected support (one original input retains unused labels). The five (11,7,6) seeds have a 12-vertex connected triangle support with 29 or 30 edges and 27, 28 or 30 triangles. These seven are promising structured seeds for separately bounded new work. No claim of seven nonisomorphic constructions is made.

The earlier headline near misses (6,4,3), (7,5,4), (9,6,5), K7 with (τ,ν)=(9,7), and the TUZA-14 20-vertex τ=13, k=9 example are automatic (the last has ν≥9). Their finite evidence remains valid; it should not be presented as evidence about an untested high-ratio regime.

## Provenance, rerun boundary and reproduction

The historical source was the frozen TUZA-13 mathematical packet. Input
content hashes and per-source/stratum counts remain in `RATIO_AUDIT.json`.
Original source Git/zero-remote checks describe the historical private audit;
the portable public recount uses the shipped mathematical data and public
edition label. Current file identities are checked by the root inventories.

**Reused:** every exact optimization result, globally minimum-cover assertion and all-optima completeness assertion from TUZA-13. **Newly run:** source authentication/hashes, literal identity and cover-signature deduplication, counts, ratio/integer arithmetic, consistency checks across overlaps, and direct triangle-conflict classification of selected seeds. **Newly reoptimized graphs/covers: zero.** The audit does not import or execute the original solver. A final recount takes about nine seconds on the local native Python; this is not a claim about a fresh solver run.

Recount from the public repository root with a new output directory:

Publication adapter: from the repository root, use a new output directory.
The original private launcher is replaced here; mathematical arguments and
historical result counts are unchanged.

```sh
python3 problems/TUZA-14B/generators/ratio_audit.py --source problems/TUZA-13 --out ../tuza-ratio-recount
```

The script writes only `RATIO_AUDIT.json`, `evidence/ratio_hard_candidates.json` and `evidence/ratio_hard_seeds.json` under `--out`. The Markdown proof and interpretation are reviewed prose. No dependency installation, external upload, remote execution or publication occurred. Exact generation time and recount elapsed time are in the JSON receipt.

## Focused follow-up: all tight examples are K4/K5 triangle components

A fresh read-only decomposition of **all 280 generic τ=2ν graphs** found that every actual triangle-conflict component has support exactly K4 or K5. There are **zero nonblock tight kernels** in this domain. Counts by component multiset are: K4 alone 33; K5 alone 75; two K4s 66; K4+K5 66; two K5s 32; three K4s 5; two K4s+K5 1; K4+two K5s 2. These count distinct literal input graphs, including labels, isolates and edges outside all triangles. Only 108 have connected triangle-conflict graphs, and those supports are precisely one K4 or one K5. Blocks may share vertices; the relevant triangle edge resources remain disjoint.

For a K4/K5 component collection with a K4s and b K5s, exact additivity gives (τ,ν)=(2a+4b,a+2b), and the minimum-cover count is 3^a·10^b. Each K4 minimum cover is a two-edge matching; every K5 minimum cover is a triangle plus its disjoint edge. Hence every global optimum has exactly b all-red triangles, and has an eligible maximum packing. The fresh structure audit verifies these formulas against every tight receipt, including its cover count and all-red incidence. Thus the **176 tight graphs / 6,620 covers with all-red triangles are entirely explained by K5 components**. These are useful controls, not evidence of nonblock tight interactions.

The **646 hard one-off τ=2ν−1 graphs** each have exactly one component whose support is neither K4 nor K5; 315 are already triangle-conflict connected. Removing all K4/K5 components leaves an automatic core for 307 inputs: residual (τ,ν)=(1,1) for 250 and (3,2) for 57. It leaves a genuinely hard core for 339 inputs: (5,3) for 242, (7,4) for 82 and (9,5) for 15. The residual values follow exact triangle-family additivity, subtracting (2,1) for each K4 and (4,2) for each K5. These are counts of original labelled inputs, **not distinct residual cores or isomorphism classes**; 24 of the 339 have extra block components.

Receipt: `evidence/ratio_tight_structure.json`; reproducible companion: `checks/ratio_audit_tight_structure.py NEW_WORKSPACE`. It enumerates actual triangles and their conflict components, reuses the prior exact optima, and performs no optimization. Runtime about 2.6 seconds. The original `RATIO_AUDIT.json` counts were preserved unchanged.
## Newly executed targeted domains (kept separate from the reused ledger)

The fresh runs are recorded in `evidence/new_domain_summary.json`, with literal inputs and per-cover information in the three domain JSONL ledgers. The table below deduplicates only those new runs by normalized labelled graph identity. It does **not** add these counts to TUZA-13: old seeds were deliberately rerun, and the full old/new overlap was not computed. Residual graph inputs from the kernel and coupled searches are distinguished from their original preimages.

| New-run stratum | Graph inputs | Minimum-cover pairs | Graphs / covers with all-red triangles | Loss range | Allowance range | Deficit range |
|---|---:|---:|---:|---:|---:|---:|
| nu=0 | 1 | 1 | 0 / 0 | 0 | 0 | 0 |
| Positive-nu automatic ratio | 5,800 | 547,807 | 5,629 / 543,491 | UNKNOWN exact extrema | 0–5 | UNKNOWN exact extrema; at most 0 |
| 3nu<2tau and tau<2nu | 774 | 202,084 | 774 / 202,084 | 0–1 | 0–2 | −2–0 |
| tau=2nu | 3 | 23 | 2 / 20 | 0 | 0 | 0 |
| tau>2nu | 0 | 0 | 0 / 0 | — | — | — |
| Unresolved new optimizer jobs | 0 | 0 | — | — | — | — |

Total: **6,578 fresh-run graph inputs**, including **777 hard inputs / 202,107 minimum-cover pairs**. Eligible optima were computed exactly for every minimum cover in the hard rows. Automatic rows enumerate minimum covers and colors but generally use the proved threshold without optimizing each eligible packing; their exact loss/deficit extrema remain UNKNOWN. No new optimizer timeout or cover cap was reached. These are bounded domains, not an exhaustive family classification or isomorphism census.

The coupled-block generator has 704 original preimages but 671 distinct residual inputs. Only three originals have a hard ratio, while every residual is automatic or triangle-free. The complete preimage receipt is `evidence/coupled_preimages.jsonl`; its original optima use exact attachment formulas and full packing optimization, not a claim that original minimum covers were enumerated. New-run receipt validation is separately preserved by the independent critic.

A final focused check selects the 82 historical one-off inputs whose nonblock residual has (tau,nu)=(7,4). After removing isolates and exact labelled duplicates, they yield 63 distinct literal cores. **All 63 admit the proved pendant K4/K5 reduction to a residual certified by the integer lemma.** Thus those retained near-tight examples do not test the unresolved leaf-free nu=4 frontier either. This is a structural audit of existing evidence, not 63 additional search cases. Receipt: `evidence/nu4_old_frontier_audit.json`; the script reuses the literal reduction function, historical tau/nu and a bounded exact residual packing calculation.
