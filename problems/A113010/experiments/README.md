# Computational experiments and certificate generators

Run from `problems/A113010/`. These are preserved experiments, not instructions to extend the research or evidence that the original conjecture is solved. Use a separate `reproduction-output/` directory for new outputs. Preserve the supplied historical results.

## Small exact reproduction

```sh
mkdir -p reproduction-output
python3 experiments/SESSION_02_DIAGNOSTICS.py > reproduction-output/session02.json
python3 -c 'import json; assert json.load(open("reproduction-output/session02.json")) == json.load(open("experiments/SESSION_02_DIAGNOSTICS.json"))'
```

This repeats small integer checks for the retained informal lemmas and the block-support/monotonicity counterexamples. It does not formally prove the general lemmas or extend the A113010 search range. The modular tests confirm the constructed weight-two exponent; its minimality comes from the informal proof, not those finite tests.

## Programs and preserved evidence

| Program | Purpose and retained output |
|---|---|
| `scan_candidates.py` | Exact bounded candidate powers; `scan_1000.json`, `scan_10000.json`. |
| `scan_modular.py` | Exact full-power search with a modulo-nine sieve through 100000 digit counts; `scan_modular_100000.json`. |
| `normalized_families.py` | Rational-log screening of trailing-zero normalized cores; `normalized_100.json`. A necessary-condition survivor is not a fixed point. |
| `residue_barrier.py` | Checks the constructed compatible-residue witnesses; `residue_barrier.json`. These witnesses are not asserted to equal the candidate powers. |
| `tail_search.py` | Outward-rounded 128-bit MPFR exponent enclosure and exact GMP suffix exclusion; `tail_search_5000000.json`. |
| `archive/tail_search_v1.py` | Exact archived source version for `tail_search_1000000.json`; read the archive note before reproducing that run. |
| `tail_search_independent_check.py` | Selected CPython endpoint and suffix cross-checks; `tail_search_independent_large.json`. Sampling is not exhaustive re-verification. |
| `core_equalities.c` | GMP scan of `S(u^s)=s` for cores 2 through 9; `core_equalities_1000000.jsonl`. This is the digital equation, not the full length equation. |
| `gmp_suffix.py` | Large normalized-core suffix calculations; `gmp_suffix_u6_t9.jsonl`. |
| `gmp_suffix_recheck.py` | Full-power/remainder arithmetic path for the same large case; `gmp_suffix_u6_t9_recheck.jsonl`. Both paths use GMP. |
| `generate_finite_lean.py`, `generate_suffix_finite_lean.py` | Witness/certificate generation; the actual proof sources are retained in `../lean/A113010/`. |

Source files are preserved unchanged, including their historical default output paths. Pass explicit output paths as below. Some scripts emit hashes of themselves and helpers; these match the preserved source versions, not a hypothetical rewrite. Historical resource output is retained as structured `.resources.json` records. Raw command transcripts are omitted.

## Historical search commands

The pure-Python bounded searches can be repeated with Python 3.12 or later:

```sh
python3 experiments/scan_candidates.py --max-digits 1000 --output reproduction-output/scan_1000.json
python3 experiments/scan_candidates.py --max-digits 10000 --output reproduction-output/scan_10000.json
python3 experiments/scan_modular.py --max-digits 100000 --seconds 1200 --output reproduction-output/scan_100000.json
python3 experiments/normalized_families.py --bases 2 3 4 5 6 7 8 9 --max-t 100 --output reproduction-output/normalized_100.json
python3 experiments/residue_barrier.py > reproduction-output/residue_barrier.json
```

The larger programs use Linux ABI names `libgmp.so.10` and `libmpfr.so.6` through `ctypes`; the observed versions were GMP 6.3.0 and MPFR 4.2.1. Python and the libraries must have matching architecture. A C compiler and GMP development headers are needed for the C program. These wrappers are not claimed to work unchanged with macOS library names.

```sh
PYTHONPATH=experiments python3 experiments/archive/tail_search_v1.py \
  --start 100001 --limit 1000000 --seconds 300 \
  --output reproduction-output/tail_1000000.json
python3 experiments/tail_search.py --start 1000001 --limit 5000000 \
  --seconds 5400 --output reproduction-output/tail_5000000.json
python3 experiments/tail_search_independent_check.py \
  --coverage-json experiments/tail_search_5000000.json \
  --output reproduction-output/independent_sample.json --seconds 540
cc -O3 experiments/core_equalities.c -lgmp -o reproduction-output/core_equalities
reproduction-output/core_equalities 1000000 1800 > reproduction-output/core_equalities.jsonl
```

The completed five-million extension took approximately 73 minutes in its original environment. A time limit can stop a run before the requested endpoint: inspect `complete` and `last_completed_k`, not merely `requested_limit`. Outward enclosures may admit extra candidates; their count is not claimed to be the exact number of length-compatible powers.

## Large normalized-case calculation

```sh
python3 experiments/gmp_suffix.py --exponent 613612926 \
  --tail-digits 140000000 --memory-mib 1536 --selftest \
  > reproduction-output/gmp_suffix.jsonl
python3 experiments/gmp_suffix_recheck.py > reproduction-output/gmp_suffix_recheck.jsonl
```

The second script reads the retained first-path record for comparison. The historical suffix has digit sum 630014399, exceeding exponent 613612926; both paths returned the same digit-string hash. The decimal expansion itself was not retained as a large dataset: the exact arithmetic source, parameters, result, source hashes, and suffix checksum are preserved. These are finite numerical findings, not Lean certificates. Run memory-intensive jobs serially.

Certificate regeneration commands and the distinction between generated witnesses and kernel checking are in [reproduction/README.md](../reproduction/README.md). Publication validation did not rerun the five-million search or the 140-million-position calculation; its actual bounded checks are recorded in `PUBLICATION_TEST_RESULTS.json`.
