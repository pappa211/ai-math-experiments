> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reproduction and retained evidence

All original mathematical computation ran on the existing Darwin arm64 Mac. The mission used the existing environment at `PRIVATE_PATH_REMOVED`, with no installation or toolchain update. The current checkpoint is frozen research evidence. Future replays must use a COPY of this workspace because producers and validators write receipts at paths relative to their own scripts; some early discriminators append JSONL. Do not rerun them in the frozen source workspaces.

No mathematical replay or verification was performed during the final documentation period. The commands below describe reproducibility; they were not executed after the cutoff.

## Principal independently checked interfaces

| Interface | Producer / data | Independent validator | Exact scope |
|---|---|---|---|
|P6 two-apex|scripts/challenger_p6_two_apex_interface.py; evidence/challenger_p6_two_apex_interface.json|scripts/coordinator_p6_interface_validator.py|4096raw,2018eligible;5damaged controls|
|One isolate, nonadjacent apices|scripts/challenger_cycle_cover_isolate_interface.py; evidence/challenger_cycle_cover_isolate_interface.json|scripts/coordinator_cycle_cover_isolate_validator.py|26944raw,2422eligible;5damaged controls|
|Complete fourteen-shape cycle domain|scripts/challenger_cycle_cover_residual_interface_v4.py; evidence/challenger_cycle_cover_residual_interface_v4.json|scripts/coordinator_cycle_cover_complete_validator.py|67360raw,8220eligible;8damaged controls|
|D extension counterexample|evidence/challenger_D_counterexample.json; evidence/d_extension_literal_input.json|scripts/d_extension_independent_validator.py|Literal52-vertex witness and exact supplied certificates; ordinary lower-bound proof is a separate dependency|

Example in a copied workspace, using the existing environment:

```sh
source PRIVATE_PATH_REMOVED
python scripts/run_bounded.py --seconds 60 --rss-mib 2200 --name coordinator_cycle_cover_complete_validation python scripts/coordinator_cycle_cover_complete_validator.py
```

The corresponding operations JSON gives literal argv, UTC start/end, external wall cap, sampled process-tree peak, exit status and termination reason. Sampled peak RSS is not an exact continuously measured maximum. The independent full-cycle validation took1.436906seconds and159.96875MiB. Domain completeness and ordinary arbitrary-attachment semantics are distinct obligations; the assembly cites both. Later coordinator validators reuse an independently written literal-checker kernel but import no producer code. A successful process exit alone is not treated as mathematical verification.

The original cycle-domain v1/v2/v3 stopped at a known wheel, a genuinely non-WKE P5 state, and a parallel-thread state respectively. Their UNKNOWNs are retained. V4 changes the certificate vocabulary using accepted theorems, not the domain. The separately verified isolate theorem precedes the global neighboring-link rule, avoiding circularity.

## Finite predecessors retained

The four-branch363-record interface, its independent46656-raw/7113-labelled/363-orbit validator, and the apex-unicyclic374-record interface remain preserved. Ordinary replacement proofs now establish those conclusions without those finite premises. They must not be cited as necessary inputs to the final ordinary four-branch or apex-pseudoforest proofs. Conversely, the2018/2422/8220 interfaces remain necessary declared inputs to the one-cycle-cover CS assembly.

## Samples and failed/capped attempts

The restoration sample contains1145 explicit constructed labelled graphs on11–14 vertices,24 tight and zero retained UNKNOWNs. Runtime21.861664seconds, sampled peak82.59375MiB; corpus seed2215112026. Its command is recorded in operations/restoration_discriminator.json. It is not enumeration of all graphs at those orders. The40 selected stratified rechecks passed in evidence/source_audit/selected_restoration_rechecks.json.

The H-D lower-survivor atlas diagnostic checked the1253 graph-atlas graphs through7vertices. Its18 all-minimum-exact near-tight qualifying graphs all had packing number2; it provides no qualifying higher-packing evidence. Its0.250205second/41.5MiB receipt is operations/hd_survivor_lower_bridge_atlas.json. No expansion followed.

Other exploration receipts include capped, superseded and failed attempts. Their identities, termination reasons and UNKNOWN records are retained; a later proof does not rewrite an earlier failure as a completed census.

## Original Claude source audit

Available: copied/hashed eq.c and PK_RESULTS.txt. Unavailable after the directed targeted search: pk.c, original generation commands and complete input streams. Source hashes are in SOURCE_INTEGRITY.json.

The original equality checker was replayed on11 explicit short-graph6 controls with n<=8. A twelfth retained control, K4 Cartesian K5 on20vertices, was independently reconstructed and was NOT passed to the original checker. Independent PK controls on K4/K5 include the one-unit-lowered rejection budget; these are not a replay of missing pk.c. See evidence/source_audit/controls.json and notes/source_audit.md for exact records.

The audited safe eq.c input scope is prevalidated short graph6 with n<=16. Its output does not count triangle-free graphs as tight despite their vacuous B equality. Preserve mathematical-failure stdout; do not infer PASS from exit zero. The reported12,005,168 equality-domain graphs,5,756 tight graphs and roughly145million PK packings remain REPORTED_UNVERIFIED. No claim of complete historical reproduction is made.

## Integrity and checkpoint

SOURCE_INTEGRITY.json records25 selected copied-source before/after hashes, four additional TUZA-19 selected dependencies, and unchanged clean public/TUZA20/TUZA21 pins. This is scoped detection, not a full-archive or OS-immutability claim. Agent late-phase manifests cover their explicit selected artifacts. The final non-self-referential file manifest and FINAL_RECEIPT.md identify the documentation checkpoint procedure. The actual final Git commit is reported in the owner-facing completion message and an external postcommit receipt, not embedded in its own commit.
