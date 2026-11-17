# TUZA-24 public reproduction

The accepted mathematical source and dependency pin files are unchanged. [Historical instructions](HISTORICAL_REPRODUCTION.md) retain their original execution scope; their old fixed deadlines and private paths are not current entry points.

Use existing Lean **4.33.1**, compiler **819816b2e0a3bf405af45ae5c7af2491d8f5bee6**, native compiled dependency packages at the nine revisions in `lake-manifest.json` (Mathlib **0df444a360eaa60ab8c11dca51a86af692955474**), Python 3.10+ and `psutil`. No installation, download or `lake update` is performed. Run from the public repository root, replacing the paths and deadline with your own:

```sh
python3 tools/replay_tuza_23_24.py --source-root problems/TUZA-24 \
  --output ../tuza-24-fresh --lean /path/to/lean-4.33.1/bin/lean \
  --packages /path/to/pinned/packages --deadline-utc YYYY-MM-DDTHH:MM:SSZ \
  --lock ../tuza-publication-build.lock Research Tuza24.Controls
```

The output must not exist and must be outside the source checkout. The runner uses a fresh local import closure, no historical project objects, one compiler thread, a 240-second per-command cap and a sampled process-tree RSS ceiling of 2200 MiB. It fails before launching if process inspection is unavailable. All source and object hashes, actual theorem types, transitive axioms, compiler identity, dependency revisions and command outcomes are recorded. The existing compiler and dependency objects are the trust boundary: this is not a cold rebuild or a separate kernel implementation.

The full actual-environment audit includes private/generated constants and all accepted semantic controls. To additionally emit selected local dependency closures, append repeated `--target DECLARATION` arguments. The publication audit selects every declaration in `THEOREM_LEDGER.json` having a `declaration` field for TUZA-23, and every name in `operations/audit_targets.json` for TUZA-24. Exact declaration types are stronger evidence than informal headlines; inspect their definitions and semantic reviews too.

Only `propext`, `Classical.choice` and `Quot.sound` are accepted as collected axioms. The source trust scan additionally rejects admission, native proof trust, project axioms and unsafe proof escapes in the accepted closure. Finite semantic controls check interpretation; the symbolic arguments establish the universal quantifiers.

[Publication verification and scope](../../verification/tuza-20-26/README.md). Source preservation and fresh reproduction are distinct from independent human peer review, which is not claimed.
