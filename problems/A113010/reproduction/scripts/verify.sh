#!/usr/bin/env bash
set -euo pipefail
workspace=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
export PATH="$HOME/.elan/bin:$PATH"
export LEAN_NUM_THREADS=1
cd "$workspace"
available=$(df -Pk "$workspace" | awk 'NR==2 {print $4}')
if [ "$available" -lt 20971520 ]; then
  echo 'STOP: less than the reserved 20 GiB free; inspect capacity before building.' >&2
  exit 1
fi
python3 reproduction/scripts/verify_freeze.py
cd lean
lake --wfail build A113010
lake env lean A113010/AxiomAudit.lean | python3 ../reproduction/scripts/check_axioms.py \
  OeisA113010.a_0 OeisA113010.a_1 OeisA113010.a_32
temporary=$(mktemp .lake/edit-smoke-XXXXXX.lean)
trap 'rm -f -- "$temporary"' EXIT
cat > "$temporary" <<'LEAN'
import A113010.Definition
example : OeisA113010.a 32 = 31 := by decide
LEAN
echo 'Intentional negative smoke test; a compiler error is expected below.'
if lake env lean "$temporary"; then
  echo 'FAIL: intentionally incorrect smoke test was accepted.' >&2
  exit 1
fi
echo 'Expected compilation failure was returned clearly: PASS'
cat > "$temporary" <<'LEAN'
import A113010.Definition
example : OeisA113010.a 32 = 32 := by decide
LEAN
lake env lean "$temporary"
echo 'Edit and retest of the same working file: PASS'
python3 -c 'import sys; print("Python exploration runtime:", sys.version.split()[0])'
echo 'Infrastructure verification: PASS'
