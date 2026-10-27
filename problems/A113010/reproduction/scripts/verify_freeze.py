#!/usr/bin/env python3
"""Check unchanged mathematical sources and pinned dependencies in the public layout."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BLOB = "3e217b28b2843b492989b178b041161b0bbd6784"
parser = argparse.ArgumentParser()
parser.add_argument("--source-only", action="store_true", help="Skip installed dependency checks")
args = parser.parse_args()

def mapped(name):
    return ROOT / ("lean/" + name[6:] if name.startswith("proof/") else name)

original = (ROOT / "reference/113010.lean").read_bytes()
assert hashlib.sha1(b"blob " + str(len(original)).encode() + b"\0" + original).hexdigest() == BLOB
frozen = json.loads((ROOT / "reference/frozen-sha256.json").read_text())
for name, expected in frozen.items():
    assert hashlib.sha256(mapped(name).read_bytes()).hexdigest() == expected, f"Frozen file changed: {name}"
sources = json.loads((ROOT / "reproduction/lean-source-sha256.json").read_text())
actual_paths = {p.relative_to(ROOT).as_posix() for p in (ROOT / "lean").rglob("*.lean") if ".lake" not in p.parts}
assert actual_paths == set(sources), "Lean source inventory changed"
for name, expected in sources.items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected, f"Lean source changed: {name}"
pattern = r"def a \(n : ℕ\) : ℕ :=\s*\(\(10\).digits n\).length \^ \(List.sum \(\(10\).digits n\)\)"
assert re.search(pattern, (ROOT / "lean/A113010/Definition.lean").read_text())
assert re.search(pattern, original.decode())
upstream = json.loads((ROOT / "reference/lake-manifest.upstream.json").read_text())
working = json.loads((ROOT / "lean/lake-manifest.json").read_text())
upstream["name"] = "a113010"
assert working == upstream, "Dependency lock differs from the preserved upstream lock"
assert len(working["packages"]) == 9
if not args.source_only:
    for package in working["packages"]:
        directory = ROOT / "lean/.lake/packages" / package["name"]
        revision = subprocess.check_output(["git", "-C", str(directory), "rev-parse", "HEAD"], text=True).strip()
        assert revision == package["rev"], f"Wrong revision: {package['name']}"
        subprocess.run(["git", "-C", str(directory), "diff", "--quiet", "HEAD"], check=True)
print(f"Frozen definition/targets, {len(sources)} unchanged Lean sources, and lockfile: PASS")
print("Installed dependency check: " + ("SKIPPED (source-only mode)" if args.source_only else "PASS (all nine pinned, tracked files clean)"))
