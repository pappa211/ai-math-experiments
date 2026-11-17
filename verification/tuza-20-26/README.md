# TUZA-20–26 publication verification

This record separates fresh source builds, exact finite certificate replay, inherited research evidence and ordinary proof review. All review is internal AI review. No external human specialist review, cold dependency rebuild, separate kernel implementation or unrestricted Tuza solution is claimed. The research series is paused.

## Fresh formal source builds

| Archive | Fresh local modules | Actual constants / theorems | Named target closures | Outcome |
|---|---:|---:|---:|---|
| [TUZA-23](formal-23/summary.json) | 31 | 505 / 446 | 27 | PASS |
| [TUZA-24](formal-24/summary.json) | 79 | 1042 / 938 | 19 | PASS |

All copied mathematical source bytes match the authenticated canonical source inventories: [23](formal-23/SOURCE_CORRESPONDENCE.json), [24](formal-24/SOURCE_CORRESPONDENCE.json). Exact types, direct proof/type references and collected transitive axioms are in each `declarations.json`; generated/private constants are included. Local target closures are in `target_local_dependency_closures.json`. The only collected axioms are `propext`, `Classical.choice` and `Quot.sound`.

The compiler is Lean 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`; Mathlib is `0df444a360eaa60ab8c11dca51a86af692955474`. All nine dependency revisions and tracked-clean states were checked. The source trees were rebuilt serially using fresh project objects and existing pinned native dependency objects. The actual process-tree RSS peaks were 2,107,949,056 bytes (23) and 2,257,764,352 bytes (24), below the 2,200 MiB ceiling. Elapsed build/audit times were about 50.46 and 107.92 seconds. One compiler thread and 240-second per-command limits were enforced.

TUZA-23's [missing-B fixture](formal-23/negative_guard.json) was rejected with the expected [application type mismatch](formal-23/MissingBGuard.log) against the fresh objects. This is an API guard, not a proof of mathematical independence. Accepted TUZA-23/24 semantic controls were compiled as part of the accepted closures.

These are fresh source compilation and environment-based axiom audits, not a separately executed object-kernel replay. Native compiler and dependency caches remain the disclosed trust boundary. Exact theorem statements and ordinary semantic review remain necessary: R2 assumes old B; M0 explicitly assumes proper-subgraph CS/minimal failure conditions; forest CS assumes existence of an actual-edge forest triangle cover and does not assert unrestricted cover availability.

Public receipts preserve hashes/types/outcomes while replacing private execution paths with symbolic locations. Repeated per-declaration build receipts are stored once in `commands.json`. Each `RECEIPT_TRANSFORMATIONS.json` records original and public receipt hashes. Raw generated objects and duplicate logs are omitted. Two unsuccessful preparation attempts are retained privately: sandbox denial of process inspection, then a monitor race on a short-lived process; no mathematical acceptance is claimed for either. The corrected runner preflights visibility and distinguishes vanished-process races from actual monitor failures.

## Essential finite replay

The [integrated fresh run](finite/VERIFICATION.json) passed all **24** selected commands in about **13.11 seconds**, with a maximum sampled process-tree RSS of **176,537,600 bytes**. [Commands and fresh output identities](finite/COMMANDS.json), [source hashes](finite/SOURCE_MANIFEST.json), [execution and certificate-identity adapters](finite/ADAPTATIONS.json), and [sanitization mappings](finite/RECEIPT_TRANSFORMATIONS.json) record the exact scope. Each freshly generated compact result is preserved under `finite/fresh-results/`. The portable entry point is:

```sh
python3 tools/check_tuza_20_26.py --repo . --output ../tuza-20-26-finite \
  --lock ../tuza-publication-build.lock
```

This executes selected archived independently authored validators in fresh copies, with assertions enabled, without a network service or external optimizer. It is fresh execution of independent implementations already preserved by the missions, not a claim that all those implementations were newly written during publication. Every changed execution adapter has before/after hashes. Only named certificate source identities are mapped through validated original/public manifest pairs; every literal mathematical check remains active. An initial run exposed stale historical hash pins after sanitization. The adapter now verifies public bytes against their source-manifest identities, preserving the original expected hashes in its transformation record. TUZA-22 validators run in separate fresh copies, so regenerated timestamp metadata cannot silently replace a frozen input. Three explicit TUZA-26 certificate pins receive the same checked rebinding. The corrected integrated command passed without excluding any requested target. The current default run includes the final R12/R-F clarification and all three independently generated Q-interface domains. There are no subsequent source changes recorded in [the post-replay change list](finite/POST_REPLAY_EDITORIAL_CHANGES.json).

- TUZA-20: exact controls, through-six labelled C01 checks and the explicit twelve-vertex C02 counterexample. The structured capped corpus and 512-packing prefix remain partial historical evidence.
- TUZA-21: book discriminator and Clebsch-cone private-page counterexample, including the all-minimum-cover quantifier.
- TUZA-22: 2018 eligible P6, 2422 eligible isolate and 8220 eligible full fourteen-shape interfaces, each with independent domain generation and damaged-certificate controls; 52-vertex D-extension witness. The final ordinary four-branch/apex replacement no longer depends on the earlier 363/374 interfaces. The one-cycle-cover CS proof still depends on the three retained finite interfaces.
- TUZA-25: explicit ring, all C12/nonedge interface, packing-only gain and resilience-descent counterexamples, role CSP, named mixed interface and mocked solver-status control. The mock is control-flow verification only; actual ORTools execution remains NOT_RUN.
- TUZA-26: all 210 named internal nonedge insertions; the 326/8 simplicial interface; all 4096 matching-terminal masks (147 labelled skeletons, 8 orbits, 7 types with extensions); all 512 P3-plus-edge masks (59 labelled skeletons, 21 orbits, 18 surviving); adjacent-restoration witness reconstruction; 6672 triangle-interface presentations; and prescribed book/double-cone controls. These are finite domains; all-size confinement and application remain separate ordinary proofs.

No large historical census is rerun. Reported-unverified Claude totals remain unverified, solver-only outcomes remain solver-only and UNKNOWN remains UNKNOWN. The finite scripts reached no previously unresolved defect-one core. A graph's existence or absence outside the explicit finite domains is not inferred.

## Portable commands and inherited scope

Per-mission [20](../../problems/TUZA-20/REPRODUCTION.md), [21](../../problems/TUZA-21/REPRODUCTION.md), [22](../../problems/TUZA-22/REPRODUCTION.md), [23](../../problems/TUZA-23/REPRODUCTION.md), [24](../../problems/TUZA-24/REPRODUCTION.md), [25](../../problems/TUZA-25/REPRODUCTION.md), [26](../../problems/TUZA-26/REPRODUCTION.md) guides provide supported public entry points. Original instructions remain in each `HISTORICAL_REPRODUCTION.md`, explicitly historical and sometimes intentionally inoperative after private-path removal. New output directories are mandatory; frozen source trees must not be execution destinations.
