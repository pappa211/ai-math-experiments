#!/usr/bin/env python3
"""Fail closed unless every requested declaration has a parsed, permitted axiom set."""
import re
import sys

allowed = {"propext", "Classical.choice", "Quot.sound"}
text = sys.stdin.read()
print(text, end="")
if "sorryAx" in text:
    raise SystemExit("FAIL: sorryAx found")
for name in sys.argv[1:]:
    pattern = re.escape("'" + name + "'") + r" (?:does not depend on any axioms|depends on axioms:\s*\[([^\]]*)\])"
    result = re.search(pattern, text)
    if result is None:
        raise SystemExit(f"FAIL: no axiom report for {name}")
    axioms = set(re.findall(r"[^\s,]+", result.group(1) or ""))
    if axioms - allowed:
        raise SystemExit(f"FAIL: unexpected axioms for {name}: {sorted(axioms - allowed)}")
print("Axiom allowlist check: PASS (sorryAx forbidden)")
