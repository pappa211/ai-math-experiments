#!/usr/bin/env python3
"""Verify every mathematical source against the original frozen inventory."""
from pathlib import Path
import hashlib,json
root=Path(__file__).resolve().parents[1];lean=root/'lean'
freeze=json.loads((root/'notes/FINAL_PROOF_SOURCE_FREEZE.json').read_text())
hashes=json.loads((lean/'SOURCE_HASHES.json').read_text())
assert hashes==freeze['all_mathematical_sources'] and len(hashes)==280
actual={str(p.relative_to(lean)) for folder in ['Tuza','Tuza06'] for p in (lean/folder).rglob('*.lean')}|{'Tuza06.lean'}
assert actual==set(hashes),'Unexpected or missing mathematical source'
for name,expected in hashes.items():
 assert hashlib.sha256((lean/name).read_bytes()).hexdigest()==expected,name
print('PASS: all 280 mathematical sources match the immutable freeze byte for byte')
