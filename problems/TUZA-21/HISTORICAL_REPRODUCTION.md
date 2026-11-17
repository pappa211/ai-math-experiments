> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reproduction, pins, resources, and finite evidence

## Host and source identity

All executed computations used the owner’s authenticated Darwin Mac and existing PRIVATE_PATH_REMOVED root. The selected environment is migration/env.sh and native Python3.12.12. No dependency installation, lake update, global setting change, Linux/server execution, SSH/tunnel, GitHub write, author contact, or publication occurred.

Public source commit:4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4; tree:f6716f2578ba5346960cbb69b9b2e0698b834b4f. Read-only git ls-remote found live main at the same commit. TUZA-20 commit:62f522a9b0554ecfc92b1133cdbbfdd7f2eac7d7; tree:09ca7effdb3be4847d6bdc555846fa9ce01a6e16. Both selected source worktrees were clean initially. Their selected33file hashes and closing Git states are in SOURCE_INTEGRITY.json. This is scoped hash detection and operating discipline, not OS-enforced immutability or a full archive audit. Exact Git sources were available; no documentation ZIP substitution was required.

## Safe replay location

Scripts write receipts relative to their own new-workspace location. Replay only from a fresh local copy, leaving this checkpoint and the frozen historical/public sources unchanged. For example, choose a NEW destination under the existing local workspaces root, copy this directory, and run the following commands there after sourcing the pinned environment. Do not run them from TUZA-20 or the public checkout.

```sh
source PRIVATE_PATH_REMOVED
python scripts/book_verify.py
python scripts/book_clebsch_private_verify.py
python scripts/ordinary_cells.py
python scripts/pk_wheel_pair_control.py
python scripts/run_bounded.py --seconds 180 --name private_cover_probe python scripts/private_cover_probe.py
python scripts/book_private_cover_probe.py
python scripts/run_bounded.py --seconds 90 --name pk_successor_probe python scripts/pk_successor_probe.py
```

The first two commands check the load-bearing literal obstructions. The other commands preserve exploratory provenance; replaying or extending their counts is unnecessary for the accepted ordinary arguments. No all133Lean module or unchanged publication-suite replay was performed. No Lean source is needed for this ordinary-proof result.

## Actual finite outputs and limits

- Book discriminator:8vertices,18edges,16actual triangles; nu4, original c(P)8, auxiliary ordinary tau6. All9feasible private-page sets have exact output costs12/10/9. The complete literal graph, covers and unions are in results/book_verification.json.30s internal deadline; about0.107s, peak self RSS18,759,680Darwin bytes. No partial case.
- Clebsch cone:17vertices,56edges,40triangles; alpha(base)5; ordinary tau11,nu8; exactly16minimum covers; private optimum5for each. All65,536 omitted-spoke subsets checked, with explicit full8packing and16private5packings. data/book_clebsch_private_certificate.json records the final0.315s run,30s cap and18,694,144bytes peak self RSS. A separate critic independently repeated the literal reduction in about0.115s with a different matching routine; its ordinary proof and comparison are retained in review/final_independent_review.md.
- Ordinary route:24named literal cell controls, all completed in about0.00455s with90s internal deadline. These are targeted controls, not an atlas or a classification-by-census. data/ordinary_cell_controls.json retains each exact premise result.
- Wheel screen:literal6vertex wheel with specified P, exact nu2,c(P)=tau3. This rejects only the omitted common-tip pair pattern; data/pk_wheel_pair_control.json and its self-contained argument retain the details.
- Root private-cover probe:seed21032026;134named instances and590minimum covers, no cap/UNKNOWN,0.077s computation. Three-second per-case deadline and128cover cap were available. All graph identities are saved; no falsification appeared. operations/private_cover_probe.json records an external180s/2200MiB process-tree limit,0.122s overall,4.297MiB sampled tree RSS. The sampled value is not a true peak. Deterministic corpus identities were subsequently attached without rerunning optimization.
- Independent-scout private probe:seed21003;500random graph records of orders6–9,479triangleful,3032minimum covers, no reported cap or UNKNOWN;29.605s,45s deadline,2000cover cap; peak self RSS692,518,912Darwin bytes. A local external snapshot observed about515MiB. No heavy solver was used. This finite survival did not discover or certify the later counterexample.
- Successor screen:34named cases/31distinct literal edge sets,341minimum covers. One two-K5 vertex-sum cover family stopped at64covers. Those unexamined covers are UNKNOWN. Zero private-deficient states and zero extension states were tested; survival is vacuous for the new repair. External90s/2200MiB monitor finished0.122s,4.297MiB sampled tree RSS. The retained complete_corpus flag means every named case was visited, not that every capped state was examined.

All triangle families are reconstructed from literal graph edges. Maximum cardinality is either proved ordinarily or computed by exact finite recurrence, never inferred from maximality. Exploratory search outputs have conservative SOLVER_ONLY labeling in STATUS_MATRIX.json because they are not independently exported proof certificates; no SAT/ILP or floating-point solver was actually used. Their counts are not added to historic censuses or treated as independent statistical trials. The inherited reported145million census remains REPORTED_UNVERIFIED.

## Resource and process discipline

No heavy Lean or external solver process ran. Local finite Python jobs had explicit deadlines; the largest observed self RSS was about660.4MiB. The two coordinator/scout launches used the new external process-tree monitor, which terminates only its owned process group on cap. Fast tasks can finish between samples, so all reported external RSS is explicitly sampled. Internal Python/Lean memory settings are never described as OS caps. No task raised resource limits or terminated unrelated processes.

## Clock and checkpoint

operations/clock.json retains the actual first local-execution timestamp from the Codex session receipt, the fixed7h30research and8hfinal deadlines, actual early research stop, and final closeout timing. Compaction/agents never reset it. UTC is used in receipts; local display is Europe/Oslo. FINAL_RECEIPT.md describes the non-self-referential commit receipt: the immutable final commit is reported in the owner answer after commit and final clean/zero-remote audit, rather than embedded in itself.
