#!/usr/bin/env python3
"""Check all archived TUZA-01 text files against the committed SHA-256 inventory."""
import hashlib
from pathlib import Path

root = Path(__file__).resolve().parents[1]
inventory = root / 'reproduction/FILES.sha256'
expected = {}
for line in inventory.read_text().splitlines():
    digest, name = line.split('  ', 1)
    path = Path(name)
    assert not path.is_absolute() and '..' not in path.parts, name
    expected[name] = digest

def retained(path):
    relative = path.relative_to(root)
    return not any(part in {'.lake', '__pycache__', 'reproduction-output'}
                   for part in relative.parts) and path != inventory and not path.name.startswith('._')

actual = {str(path.relative_to(root)) for path in root.rglob('*') if path.is_file() and retained(path)}
assert actual == set(expected), {'missing': set(expected) - actual, 'extra': actual - set(expected)}
for name, digest in expected.items():
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == digest, name
print(f'PASS: {len(expected)} archived files match SHA-256 inventory (inventory excludes itself).')
