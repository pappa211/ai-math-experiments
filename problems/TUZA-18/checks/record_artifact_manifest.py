"""Inventory final private files; excludes its own output and Git internals."""
from pathlib import Path
import datetime, hashlib, json, subprocess

ROOT = Path(__file__).resolve().parents[1]
raw = subprocess.check_output(['git','ls-files','-co','--exclude-standard','-z'], cwd=ROOT)
paths = sorted(set(p for p in raw.decode().split('\0') if p and p != 'ARTIFACTS_SHA256.json'))
files = []
for relative in paths:
    path = ROOT / relative
    if path.is_symlink():
        raise RuntimeError(f'Unexpected symlink in private checkpoint: {relative}')
    data = path.read_bytes()
    files.append(dict(path=relative, bytes=len(data), sha256=hashlib.sha256(data).hexdigest()))
result = dict(time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
              scope='All tracked and unignored private files except this manifest; Git objects and ignored caches excluded',
              files=files)
(ROOT/'ARTIFACTS_SHA256.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(dict(file_count=len(files), total_bytes=sum(row['bytes'] for row in files))))
