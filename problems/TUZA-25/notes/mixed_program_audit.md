> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Optional Claude program audit and bounded local replay

Scope: selected files in `workspaces/Claude outputs`, snapshotted by the coordinator and `scripts/source_snapshot.py`. This is source/semantic inspection plus targeted native replay, **not** reproduction of the reported census. No cloud mathematical execution was performed in TUZA-25. Original cloud receipts remain historical reports.

## Actual program semantics

- `mt.c`: reads each short-form graph6 line as a supplied graph, enumerates every triangle-free N (or the first argv[1] N in its deterministic DFS, per graph), minimizes the footprint clutter by inclusion, and computes its exact matching optimum and cover feasibility at 2nu and 2nu-1. Inclusion minimization preserves both optima because footprints are nonempty; any removed superset can be replaced by a contained member without creating a packing conflict. It skips triangle-free input graphs. It does not normalize graph isomorphism or connectedness. Isolates and background edges in an input remain and affect N enumeration. `argv[1]=0` is uncapped. The stated safe domain is n<=9,m<=32; the m guard occurs after triangle edge-mask shifts, so m>32 is **not** a safe rejected input. No such input was supplied in this replay. The code never checks whether N meets a triangle when reporting tightness: nonempty-N tight instances are printed only for the first 400 across the process. Thus active-forbidden strictness is not a directly counted predicate, and its full reported census is not authenticated by this source alone.
- `r0.c`: the PK-all header is stale. The actual main filters to nonempty shared-edge-connected triangle support with every graph edge triangular, computes exact nu, optionally checks every singleton edge deletion (R>=1), checks every pair deletion (R>=2), then computes tau and exact cut-complement size. R=0 disables resilience checks, although the summary field `R1` still counts all retained candidates. Isolated vertices are not explicitly rejected by this program; a `geng -c` source stream would exclude them. No H1 computation exists in this source.
- `r2.c`: same substantive main as r0, except singleton-deletion resilience is checked unconditionally, even if an argument smaller than one is supplied. R>=2 checks all pairs. Again the PK header is stale. No H1 computation is present.
- `eq.c`: its PK header and much unused PK enumeration code are stale. Actual main checks ordinary Tuza at budget 2nu, and on tight graphs tests each shared-edge triangle component for exactly 4 vertices/4 triangles or 5 vertices/10 triangles; these imply literal K4/K5 support in a simple graph. Background edges and isolates are allowed. `TUZA_FAIL` lines are printed, but not separately accumulated in the displayed summary. `tight_nonblock` is a separate predicate.
- r0/r2/eq use 128-bit edge masks and fixed arrays of sizes consistent with n<=16,m<=120, but do not validate input bounds. Their header n<=11 is conservative/stale. This replay used at most 13 vertices and 33 edges, safely inside the actual arrays and shifts.
- `role.py` was not executed or relied upon. Its status-handling corrections remain **NOT_RUN** on this track.

## Provenance and reported counts

`ALT_RESULTS.txt` specifies `geng -c -d2 n` for resilience. It gives order-by-order R1 counts only for n=5,...,10: 2,4,20,159,2531,102094, totaling 104,810. It does not supply generated graph streams, raw stdout/stderr, geng version, or complete resilience/mixed generator commands. The archive README gives commands for PK/equality, not a full resilience/mixed log. The supplied zip does not contain mt.c/r0.c/r2.c or their census logs.

A necessary correction is independently checked: K4 has nu=1,tau=2, connected nonempty triangle support, all edges triangular, and survives every single-edge deletion. Therefore “K5 is the only tight R1 graph through ten vertices” is false without the n>=5 restriction. The n=5,...,10 total excludes K4; adding it would give 104,811 only **conditional on authentication of the remaining reported counts**. K4 is not two-edge resilient. This does not challenge the reported R2 count or the scoped n=5,...,10 R1 claim.

All full totals (including 95 R2 graphs, 104,810 R1 graphs on their actual reported orders, nine defect-one R1 examples, the mixed 2,953,213 pairs, and the H1 statements) remain **REPORTED_UNVERIFIED**. A program's intended universe is not evidence that its full run completed.

## Bounded replay actually run

Commands and exact sources/hashes/stdout/stderr are in `evidence/mixed_claude_replay.json`; input graph6 streams are beside it. The driver `scripts/mixed_claude_replay.py` compiles the four original C files natively with Apple clang, one at a time. Each invocation has a 30-second process timeout, and all completed with exit zero. No timeout was treated as an optimum.

The named universe consists of K3,K4,K5,K4 plus a disjoint background edge,two K5s sharing an edge,two K5s sharing a triangle,the 13-vertex central K4 with three fresh K5 leaves on a star,cocktail-party graphs on 6 and 8 vertices,cones over C5 and C7,and a five-page book. These are explicit labelled controls, not isomorphism representatives of an order census. All actual triangles are generated from their full edge sets.

- mt: full N enumeration on K3,K4,K5,K4+background edge: **518 admissible pairs**, four tight pairs, zero failures. The sole printed nonempty-N tight case forbids only the background edge and is a correct negative control for overly broad strictness.
- r0 mode 0: 12 inputs, 11 supported connected candidates (background-edge control rejected); exact displayed nu/tau values agree with the independent Python checker.
- r0 mode 1: seven one-edge-resilient controls, including K4 and K5.
- r2 mode 2: two two-edge-resilient controls (K5 and edge-glued K5 pair).
- eq: 12 inputs, three tight (K4,K5,K4+background), zero tight nonblock, five defect-one controls.

The independent checker `scripts/mixed_exact.py` derives actual triangle footprints directly and does not import Claude verdicts or inclusion-minimize them. Its completed finite recursions yield exact cover/packing witnesses. It tested **1,983 admissible pairs**: all N for K3/K4/K5; N empty, all singleton and two-edge N for larger controls; additionally the complete spoke set on the two cones. There were zero mixed-inequality failures and zero active-forbidden strictness failures. These small controls validate semantics, not a universal theorem.

`scripts/mixed_semantic_checks.py` separately enumerates all edge-subset covers and triangle-subset capacity packings with finite M=q+1 on the 518 small pairs, checks the exact cover recurrence including inadmissible forbid branches, and checks explicit B-restoration controls. Its receipt is `evidence/mixed_semantic_checks.json` (status and exact completed counts there).

## Failed surrogate and honest coverage

The frozen exploratory surrogate was: if nu(G-e;N)=nu(G;N), then tau(G;N+e)-tau(G-e;N)<=1. It is false. `scripts/mixed_payment_search.py` examined 1,080 triangle-containing graph-atlas representatives through seven vertices with N empty, then the named controls with N empty/every singleton. It reached 8,778 packing-stable branches among 14,461 admissible branches; 2,653 stable branches had positive forbid packing jump. The surrogate failed on 97 branches, first at a six-vertex two-K4 common-edge gluing; maximum observed surcharge was 3. Exact witnesses are retained in `evidence/mixed_payment_search.json`.

The stronger provisional bound tau(G;N+e)<=2nu(G;N) on packing-stable branches had no failure in these tests, but it is **OPEN**, and as a universal claim it already contains ordinary/mixed Tuza via adding a disjoint K4 and choosing e there. It is not recommended as a renamed narrower obligation. The exact peeling/restoration theorem in `notes/mixed_frozen_theorems.md` supersedes that exploratory route.
