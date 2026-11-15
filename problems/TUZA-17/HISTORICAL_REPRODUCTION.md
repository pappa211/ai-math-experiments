# Reproduction and actual verification

All mathematical computations ran locally on the authenticated Mac using the existing Python3.12.12 executable `LOCAL_ENVIRONMENT`. No solver/package installation, remote compute or floating-point proof was used. Most exact scripts use only the standard library. The ordinary proofs are decisive for unbounded claims; finite scripts test their formulas and witnesses.

## Replay safely in a new private copy

The scripts write their evidence under their own workspace. Preserve this frozen checkpoint: make a separate private copy of checks/, notes/, evidence/ and sources/ before replay, and run from that copy's root. No script needs to write a historical checkout. The source/hash-aware critic program expects the retained frozen input files.

Set a task-specific interpreter variable, then run checks **serially**:

```sh
TUZA_PY=LOCAL_ENVIRONMENT
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_critic.log "$TUZA_PY" -B checks/critic_independent.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_late.log "$TUZA_PY" -B checks/critic_late.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_boundary.log "$TUZA_PY" -B checks/critic_boundary.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_matching.log "$TUZA_PY" -B checks/critic_addenda.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_controls.log "$TUZA_PY" -B checks/controls.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_A_producer.log "$TUZA_PY" -B checks/a_constructive_checks.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_A_verify.log "$TUZA_PY" -B checks/a_verify.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_W5.log "$TUZA_PY" -B checks/a_sls_w5.py
"$TUZA_PY" -B checks/run_bounded.py 60 512 evidence/replay_core.log "$TUZA_PY" -B checks/b_core_glue.py
```

These are replay instructions, not a claim that a second post-freeze run was performed. The mission's actual logs and limits are retained under evidence/. Later optional boundary check scripts, if any, are inventoried there and in STATUS_MATRIX.json.

## Exact algorithms and independence

`checks/exact_core.py` reconstructs all actual triangles from literal graph edges. Triangle packing uses an exact conflict-state recurrence; triangle cover branches on an uncovered triangle's three actual edges. No approximate feasible solution is called an optimum. An explicit packing and cover can be extracted. Rainbow triangle-edge colouring is an exact constraint search over edge colours.

For lambda, the root implementation enumerates vertex sets S⊆X. Let F=E(L[X\S]). A minimum H cover containing F exists exactly when |F|+tau(H−F)=tau(H). Therefore the first feasible |S| equals min over minimum H covers C of vc(L−C). This checks the existential minimum-cover quantifier exactly and uses edge deletion only. It is not an enumeration of one arbitrarily selected old cover.

The fresh critic's `critic_independent.py` and newly authored `critic_late.py` import no producer checker or exact_core.py. They reconstruct triangles, implement separate recurrences and enumerate all minimum covers by cardinality. The initial A verifier is separate code by the same A scout; it is not called an independent AI review. The critic then generated new prescribed-packing cases with a separate completion implementation. Critic contributions to the later deterministic ear and budget-six proof are disclosed in ADVERSARIAL_REVIEW.md.

## Actual finite work and its meaning

| Check | Actual scope/outcome | Interpretation |
|---|---|---|
| A construction and verifier | 116 prescribed-packing certificates; all14640 actual triangles across three small blow-ups;59049 mixed-colour count vectors | PASS controls for the ordinary universal construction; not all possible prescribed pairs |
| Fresh initial critic | 1023 labelled proper-four-colourable five-vertex H, all28996 eligible induced links;330 new A prescriptions; four-port reconstruction | PASS; this finite domain does not prove AC |
| Fresh matching controls | All1023 nonempty labelled five-vertex ordinary graphs have a1/2-vertex matching blocker | PASS; general blocker proved separately |
| Fresh late critic | All10 W5 minimum covers; core stages(2,3),(3,5),(4,7);8112 marked-ear instances including2976 exceptional markings | PASS; ear availability remains unproved |
| Structured B probes | 431 eligible nonempty links on seven small K4-amalgam graphs; K6 ineligible | PASS only on eligible rows |
| Ear producer checks |71 outside-tip-marking and223 arbitrary-marking instances | PASS; superseded as evidence by the broader independent check |
| Random four-partite H |2588 completed eligible interactions;70 H cases timed out; maximum observed AC gap−1 | Completed rows PASS, timeouts UNKNOWN; not decisive hard-boundary evidence |
| C5 intended small-budget probe |4129 attempted;3808 completed;321 timeouts;ZERO intended budget≤2 rows | Target stratum NOT_AVAILABLE in that probe; not evidence for the hard case |
| Initial SMALL-CORE random attachment probe |2304 completed; no new connected witness | Finite nonfinding only; directed construction subsequently REFUTED the claim |
| Targeted eleven-vertex link helper probe |840633 generated Hamiltonian links WITH REPETITION in25seconds;231895 had alpha4; no helper counterexample | Not a census or H realization; ordinary eleven-vertex lemma supersedes this probe |
| Broken double-cone cycle probe |n=5,7,9, fully eligible; (nuH,tauH,nuG)=(4,5,5),(6,7,7),(8,9,9), lambda1 each | These concrete full instances have budgets5,7,9 and do not realize the difficult low-budget stratum |

The random probes retain selected record cases plus aggregate counts, not full certificates for every generated row. Seeds are recorded; wall-limited reruns may complete different counts. The large4282-vertex A example is proved symbolically; its5708340 actual triangles were **not materialized**. Exact small graph computations do not instantiate an actual critical Tuza violation.

## Required controls and exclusions

The empty graph, triangle, books and K4 pass exact controls. K5 is a sharp ordinary Tuza control but is **NOT_APPLICABLE** to H's rainbow triangle-edge-3-colouring hypothesis. The four-port graph is eligible only at its four tip-apex decompositions; tuples are (3,3,2,4),(3,3,2,4),(3,4,1,4),(3,4,1,4), where entries are nuH,tauH,lambda,nuG. The core-apex links contain triangles and are ineligible.

The natural Clebsch-cone and27-vertex VB-hub decompositions have triangle-free H and are automatic AC cases, not difficult interactions. Their exact rim cover/packing controls are retained. K4/K5 block and Cartesian K4□K5 controls count all60 actual triangles; the latter decomposes into four K5 and five K4 supports with (nu,tau)=(13,26). It is an equality/control object, not an eligible rainbow-H claim. The abstract Fano plane remains a non-graph hypergraph control illustrating the missing graph-specific input.

The66 TUZA-16 K10/K11 certificates were authenticated as historical results but **NOT_RUN** anew; no new decisive claim uses them. The16-vertex partial-slope optimum20 versus21 remains **UNKNOWN**, not investigated. New Lean formalization and separately commissioned independent final verification are **NOT_RUN**. No broad H census on ten/eleven vertices or million-cover repeat census was run.

## Resource bounds and failures

Darwin rejected the attempted RLIMIT_AS cap with ValueError; this is recorded in the initial logs and never described as an effective cap. Initial A checks had wall/CPU bounds but no working address-space cap. Subsequent decisive independent checks use `run_bounded.py`: a wall timer and sampled aggregate RSS monitor for the owned process group, killing only that group if the threshold is exceeded. This is a watchdog, not an OS-enforced allocation limit. Each log has a corresponding `.limits.json` with command, exit status, wall allowance, sampled RSS threshold, measured runtime and peak sampled RSS. Very short jobs may be undersampled; Python's own reported peak is retained where available.

Principal fresh review:1.660seconds,25.0MB sampled RSS; late review:1.245seconds,18.8MB; link probe:25.204seconds,15.7MB. Random root probe had180second wall budget and about156MB peak; per-H timeouts remain UNKNOWN. All computation was serial at the heavy-job level. No hidden solver or continuing search is needed to read the result; final stopped-process verification is in FINAL_RECEIPT.md.

## Final additional checks

`checks/a_boundary_link_probe.py` checks the explicit C13 and three-C5 matching/cover certificates in a short bounded run. `checks/critic_catalogue.py` independently decodes the one downloaded graph6 record, checks all independence/triangle facts, supplies a verified isomorphism, and checks the displayed matching subset and residual cover. It does NOT re-enumerate Ramsey graphs or certify the catalogue’s completeness. `checks/b_petersen.py` lists all six perfect matchings of the literal Petersen graph and verifies each residual is two C5s; the unbounded q-copy limitation also has a full ordinary proof. All these computations finished, with evidence and watchdog records retained.
