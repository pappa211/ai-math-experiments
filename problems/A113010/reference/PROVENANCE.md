# Frozen problem and dependencies

Prepared 2026-10-27 (Europe/Oslo), without mathematical discovery.

- Original mathematical source: https://oeis.org/A113010
- Repository: https://github.com/google-deepmind/formal-conjectures
- Exact checkout: `f153efa8fdc078131e214547781d631e2d257daf`
- Upstream file: `FormalConjectures/OEIS/113010.lean`
- Original Git blob: `3e217b28b2843b492989b178b041161b0bbd6784`
- Unchanged tracked copy: `reference/113010.lean`
- The full upstream repository is not vendored; the exact reference file and license are retained.
- Lean toolchain: `leanprover/lean4:v4.33.1`
- Lean compiler commit: `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`
- Mathlib tag: `v4.33.1`
- Mathlib revision: `0df444a360eaa60ab8c11dca51a86af692955474`

The working package imports Mathlib directly, not the upstream challenge or
FormalConjecturesUtil. Its definition has the same name and exact body as the
upstream `OeisA113010.a`. This removes the upstream placeholder from the working
import graph while preserving the mathematical definition.

The existence target is exactly the upstream existential statement. The
nonexistence target is its negation. They are Prop-valued definitions, with no
assumed or admitted proof of either alternative.

`lake-manifest.upstream.json` and `lakefile.upstream.toml` are unchanged upstream
configuration copies. The working lockfile changes only the root package name
from `formal_conjectures` to `a113010`; every package entry, URL and revision is
unchanged. The working Lake configuration builds only the independent library.
`reproduction/scripts/verify_freeze.py` verifies the reference Git blob, frozen SHA-256 values, unchanged lockfile, and installed dependency revisions. Original `proof/` paths map to `lean/`.

The working definition and targets, toolchain and configurations have hashes in
`frozen-sha256.json`. Do not change them during research. Recover them from this
repository's initial infrastructure commit if accidentally modified.

The upstream challenge includes `sorry`. Preserve it unchanged as an artifact;
never import it into a completed proof. The source and copied definition retain
the upstream Apache-2.0 attribution; the license is included in `reference/LICENSE`.
