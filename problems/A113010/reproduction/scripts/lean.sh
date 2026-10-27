#!/usr/bin/env bash
set -euo pipefail
workspace=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
export PATH="$HOME/.elan/bin:$PATH"
export LEAN_NUM_THREADS=1
cd "$workspace/lean"
exec lake "$@"
