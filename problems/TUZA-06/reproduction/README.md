# Reproduction tooling and evidence

Use [the complete portable instructions](../REPRODUCTION.md). `verify_sources.py`, `bootstrap.py` and `reproduce_lean.py` are the supported entry points. Fresh publication evidence is in [publication-evidence](publication-evidence/README.md).

`LeanChecker.upstream.lean`, `ReplayExactNative.diff`, `REPLAY_DRIVER_PROVENANCE.json` and `LEAN_TOOL_LICENSE.txt` document the standard-kernel replay adapter. It is an IO tool outside the mathematical source closure. Operational paths in its provenance/diff headers are removed; the upstream body and driver source hashes still identify the unchanged code.
