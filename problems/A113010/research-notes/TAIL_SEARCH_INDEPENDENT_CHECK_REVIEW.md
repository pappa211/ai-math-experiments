> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent review of the sampled tail-search cross-check

2026-10-27, Session 01. Read-only code review begun at 12:45:46 UTC, without running the script or any large arithmetic. Reviewed initial SHA-256 `b8fd91c8b6096a6da0ea523c916505703bcb0dc6b24737e40a2ee7f420e23572` and then revised SHA-256 `439cec0e7fb2b32cb635d4d7d70e52567d784bde83426a2b881094e59c6dbb98` of `experiments/tail_search_independent_check.py`, together with the relevant `Enclosure` and GMP helper interfaces. Final assessment below refers to the revised version.

## Verdict

No arithmetic soundness defect was found for the hard-coded positive sample bases. The script independently recomputes exact exponent intervals with CPython integers and compares entire sampled suffix residues byte for byte against GMP. It is appropriately labeled as sampled evidence rather than exhaustive verification or a Lean certificate.

The initial provenance mismatch was corrected before execution: all revised samples lie within the supplied coverage interval, and source-hash checks now bind the current helpers to that production record. No blocking issue remains for the planned sampled check. The root also specifies an external wall timeout of 610 seconds with five seconds kill grace, in addition to the script's 540-second soft limit; this supplies the hard elapsed-time guard absent from the script itself.

## Exact exponent boundaries

For every sampled `k>=2`, `low=10**(k-1)` and `high=10*low` are exact integers. The floating-point logarithm supplies only a starting exponent; it does not decide an endpoint.

Starting from `n=k**s`, the upward correction stops with `n>=low`. The downward correction divides only while the preceding exact power remains at least `low`; it preserves `n=k**s` and `n>=low`, and terminates with the least nonnegative exponent reaching the lower boundary. Enumeration then records precisely the exponents whose powers are strictly below `high`. Equality at the lower endpoint is included and equality at the upper endpoint is excluded. An initially excessive seed is corrected as well as an insufficient seed.

Consequently `assert all(lo<=s<=hi for s in exact)` checks that the MPFR enclosure omitted no exact candidate for each sample. It intentionally permits conservative extra candidates. It is not an exact-equality test of the two candidate sets, which is appropriate for an outward enclosure.

The six suffix samples are initially chosen using the same MPFR enclosure being tested. This is a selection dependence, not independence of the arithmetic calculation. The later independent exact interval and modulo-9 filter ensure a genuine survivor exists before a suffix check. If an enclosure-only false positive were selected, the `valid` assertion would fail instead of silently testing it. The five predetermined boundary cases provide selection independent of the enclosure. These design choices still cannot establish absence of omitted candidates at untested bases.

## Suffix arithmetic and evidence

The decomposition loop obtains exact `k=10**t*u` with `10` not dividing `u`. The width `(s+3)//4+32` is exactly `ceil(s/4)+32`, matching the production initial suffix width. CPython evaluates

    residue = pow(u, s, 10**m)

and converts that exact integer to its canonical decimal string. The comparison against `bytes(buf[:length])` checks the complete GMP residue, not merely its hash or digit sum. Both paths omit leading zeros; omitted zeros do not affect the digit sum. The value `excludes = digit_sum > s` is the correct sufficient exclusion condition, since a decimal suffix cannot have greater digit sum than the full positive core.

The exponent-bound path, modular exponentiation, decimal conversion, and digit summation on the Python side are independent of GMP arithmetic. The checker still shares the production MPFR enclosure and imports the same GMP helper for the comparison; it is not an implementation independent of every production component. It checks newly recomputed selected arithmetic, not every count or residue from the original search record.

`complete` means all planned sample cases completed. It does not by itself mean all suffixes excluded their candidates: the report must separately inspect each recorded `excludes` flag. A false flag is faithfully retained rather than mislabeled as an exclusion. Likewise, eleven planned entries need not always be eleven distinct bases, since a selected anchor survivor could coincide with a predetermined boundary case. The actual `planned_cases` record is the authoritative count and selection list.

## Provenance and recommended adjustment

At review time `tail_search_5000000.json` contained `start_k=1000001`, `requested_limit=5000000`, `last_completed_k=4380000`, `complete=false`. The checker correctly refuses to run its large mode until it receives a completed record with last endpoint at least 5,000,000. This review did not run it against the incomplete record.

The initial version checked completion and the high endpoint but not interval membership. Its first suffix anchor (1,000,000, searched downward) and two boundary samples lay below the current run's start. This was reported and fixed before any execution.

The revised suffix anchors are 1,200,000; 1,960,000; 2,720,000; 3,480,000; 4,240,000; and 5,000,000. The boundary-only bases are 1,000,001; 1,000,002; 1,999,999; 2,000,000; and 5,000,000. A new assertion checks all planned bases against `record['start_k'] <= k <= record['last_completed_k']`. Thus the previous provenance objection is resolved.

The revised output retains the coverage path, file hash, and actual covered interval. It also asserts that the coverage record's source and helper hashes equal the hashes of the currently imported implementation files. During this review those recorded/current hashes matched:

- tail search: `5479577cb02d131edb35caace25138c03cd48e67101e4d47221888939caf0adc`;
- GMP helper: `f313566343237927f2627bd3be6b41cf56b924e68803c48fe2d774bdae11b4f5`.

Reading the coverage file once into bytes and deriving both JSON and its hash from those bytes would also bind them unambiguously. The planned requirement to run only after the current producer finishes avoids the practical concurrent-write issue in the present session.

## Stopping and checkpoints

The loop checks the stop flag and elapsed wall time before each entire case. Neither long exact exponentiation nor decimal conversion is interrupted by the soft deadline. The signal handler also only sets a flag; SIGTERM received in a long case does not immediately stop the calculation. Selection before the first saved checkpoint is small but likewise has no stop check.

After a completed case, atomic temporary-file replacement preserves all finished cases. A stopped or failing current case is not counted as completed. An ordinary Python exception records an error with the prior completed cases and re-raises; `finally` closes the enclosure. CPU-limit termination or SIGKILL need not execute that exception path, but the earlier atomic checkpoint remains valid.

`RLIMIT_CPU=(590,600)` limits process CPU time, not elapsed wall time, and is independent of a smaller `--seconds` value. The root's planned outer timeout of 610 seconds with five seconds kill grace supplies the bounded wall guard; its launch must leave that margin before the original session checkpoint. A partial output is usable only as a list of completed sample checks, not as completion of the planned set.

No builds, large computations, or new persistent processes were launched for this review. The root's ongoing production search was only observed through its JSON metadata and was not altered.

Final status: revised source reread, no outstanding blocking issue, no checker execution performed by the critic, and no owned running processes.
