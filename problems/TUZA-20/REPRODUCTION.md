# TUZA-20 public reproduction

Run the selected exact validators from a public repository checkout with Python 3.10+, assertions enabled and `psutil` installed:

```sh
python3 tools/check_tuza_20_26.py --repo . --only 20 \
  --output ../tuza-20-finite-fresh --lock ../tuza-publication-build.lock
```

The destination must not exist and must be outside the checkout. The runner copies the archived source and evidence into that destination and executes serially there, preserving all frozen original files. It records the complete copied input hashes, execution-only path/interpreter adapters, literal commands, logs, fresh output JSON hashes, time limits and sampled process-tree memory. The tested publication platform is Darwin; historical platform guards are retained. The default timeout is 240 seconds per checker and the process-tree RSS ceiling is 2200 MiB. No package installation, network, external optimizer, Lean build or large historical search is launched.

Omit `--only` to run all selected TUZA-20/21/22/25/26 checks. TUZA-26's input comparison uses the included TUZA-25 archive and preserves its frozen seed domain. For exact checker names, finite domains and exclusions read [the publication verification guide](../../verification/tuza-20-26/README.md) and the [historical evidence guide](HISTORICAL_REPRODUCTION.md). The old instructions remain a historical record and may contain intentionally inoperative sanitized execution paths.

Successful finite checks do not prove an all-size statement. Ordinary proofs and their separate reviews supply those arguments. UNKNOWN, capped, solver-only and reported-unverified evidence retains its status; no missing census is inferred from the new replay. No external human peer review is claimed.
