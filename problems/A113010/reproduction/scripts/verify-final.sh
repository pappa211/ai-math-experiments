#!/usr/bin/env bash
# Future use only: validate a completed, parameter-free theorem against either frozen target.
set -euo pipefail
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 MODULE THEOREM existence|nonexistence" >&2
  exit 2
fi
module=$1
theorem=$2
case "$module:$theorem" in *[!a-zA-Z0-9_.:]*|'') echo 'Use simple Lean identifiers.' >&2; exit 2;; esac
case "$3" in
  existence) target=OeisA113010.ExistenceTarget;;
  nonexistence) target=OeisA113010.NonexistenceTarget;;
  *) echo 'Target must be existence or nonexistence.' >&2; exit 2;;
esac
workspace=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
"$workspace/reproduction/scripts/verify.sh"
export PATH="$HOME/.elan/bin:$PATH"
export LEAN_NUM_THREADS=1
cd "$workspace/lean"
lake --wfail build "$module"
temporary=$(mktemp .lake/final-audit-XXXXXX.lean)
trap 'rm -f -- "$temporary"' EXIT
printf 'import A113010.Targets\nimport %s\nexample : %s := %s\n#print axioms %s\n' \
  "$module" "$target" "$theorem" "$theorem" > "$temporary"
lake env lean "$temporary" | python3 ../reproduction/scripts/check_axioms.py "$theorem"
echo 'Completed theorem matches the frozen target and passes axiom audit.'
