"""One-time editorial updates; does not touch frozen proofs or evidence."""
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
changes = {
    'REPORT.md': {
        'All mathematical branches are closed and reviewed.': 'Research branches have closed and final independent review is complete.',
        'The [frozen proof and certificates](notes/late_compression_gate.md) are under final independent review.': 'The [frozen proof and certificates](notes/late_compression_gate.md) passed [independent continuation review](review/compression_review.md); the nine-file review package froze at 20:27:31 UTC.',
        'a2nu cover': 'a 2nu cover',
        'a3-uniform': 'a 3-uniform',
        'a260 packing': 'a 260 packing',
        'a376 ordinary cover': 'a 376 ordinary cover',
        'a5-for-4 augmentation': 'a 5-for-4 augmentation',
    },
    'STATUS_MATRIX.md': {
        'An all-N chain has deficiency1 and exact distance2ceil(N/2) to compatibility.': 'An all-N chain has deficiency1 and exact symmetric-difference distance2ceil(N/2), equivalently ceil(N/2) replaced edges, to compatibility.',
    },
}
for name, edits in changes.items():
    path = ROOT / name
    body = path.read_text()
    for old, new in edits.items():
        if old not in body:
            raise RuntimeError(f'Missing expected editorial target in {name}: {old}')
        body = body.replace(old, new)
    path.write_text(body)
print('Updated report review status and clarified ledger distance; frozen evidence unchanged.')
