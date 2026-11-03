# TUZA-15 public reproduction

From the repository root, with Python 3.10 or newer and assertions enabled:

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```

The output path must be new and outside the checkout. All standard checks use
only the Python standard library and run serially on copies of public inputs.
The suite records per-command results in `REPRODUCTION.json`, with raw local
outputs under `public-copy/` and `logs/`. Those generated outputs may describe
the user's local environment; they are not automatically published.

The [top-level guide](../../REPRODUCTION.md#tuza-1115-ordinary-proofs-and-exact-finite-checks)
explains fresh versus historical evidence. Full ordinary arguments are linked
from [README.md](README.md); finite tests do not replace them.

## Core finite dependency

```sh
python3 tools/check_tuza_11_15.py --only TUZA-15 --output ../tuza-15-replay
```

The certificate SHA-256 is
`bd089f5c18b12799f90828d024705f2b1271afa29c317f9ba1ab1c942a26173f`.
The byte-identical frozen independent checker SHA-256 is
`e043aae98aaf4f351e69ce9a67f0482271f66ffd15ef921096b0cf4223f91064`.
The actual observed domain is 32,768 labelled inputs, 11,982 eligible links,
57 disjoint representative orbits (34 gain, 19 nonclique, four symbolic),
and 12 successful diagnostics. Counts are derived by the checker.

The driver also replays fixed cores, 106 independent mathematical-witness
checks, lost-versus-retained TWIN/Fano scope diagnostics, and the original
small standard-library checkers. Generator mode in
`original_checks/six_link_certificates.py --generate` separately needs
NetworkX 3.7, and must be used only in a scratch copy; it overwrites its data.
Default verification imports no NetworkX and never generates new certificates.

The frozen symbolic output field's historical naming ambiguity is retained.
The public driver separately verifies every canonical-template-to-record map,
including a direction-sensitive nonidentity diagnostic; structural family
recognition in the frozen checker remains independent. This is metadata
clarification, not a changed proof or certificate.

The TWIN historical assertion failure checked an unnecessarily strong
all-core-triangle predicate. Only lost triangles must meet the increment;
the uncovered possibilities remain in the residual and are covered there.
The present diagnostic confirms the accepted interface without changing the
frozen mathematical proof.
