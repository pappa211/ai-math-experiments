"""Byte-integrity checks only; no mathematical computation or candidate replay."""
from pathlib import Path
import json,hashlib,datetime,gzip
ROOT=Path(__file__).resolve().parents[1]
rows=[]
def check(path,expected,source):
    p=ROOT/path
    actual=hashlib.sha256(p.read_bytes()).hexdigest()
    rows.append(dict(path=str(path),manifest=source,matches=actual==expected,expected_sha256=expected,actual_sha256=actual))
for manifest in sorted((ROOT/'evidence').glob('*transfer_manifest.json')):
    data=json.loads(manifest.read_text())
    for row in data['files']:
        relative=row.get('target_relative_path',row.get('canonical_relative_path'))
        if relative is None:
            relative=str(Path(row['canonical_path']).relative_to(ROOT))
        check(relative,row['sha256'],str(manifest.relative_to(ROOT)))
fresh=ROOT/'review/star_fresh_manifest.json'
if fresh.exists():
    for relative,row in json.loads(fresh.read_text())['files'].items():check(relative,row['sha256'],str(fresh.relative_to(ROOT)))
late=ROOT/'evidence/late_final_handoff.json'
if late.exists():
    for row in json.loads(late.read_text())['files']:check(row['path'],row['sha256'],str(late.relative_to(ROOT)))
ledger=json.loads((ROOT/'evidence/apex_type1_ledger_receipt.json').read_text())
compressed=ROOT/'evidence'/ledger['compressed_filename']
check(compressed.relative_to(ROOT),ledger['compressed_sha256'],'evidence/apex_type1_ledger_receipt.json')
digest=hashlib.sha256();size=0
with gzip.open(compressed,'rb') as stream:
    while chunk:=stream.read(1024*1024):digest.update(chunk);size+=len(chunk)
decompression=dict(bytes=size,sha256=digest.hexdigest(),matches=size==ledger['uncompressed_bytes'] and digest.hexdigest()==ledger['uncompressed_sha256'])
result=dict(time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='Byte integrity only; no mathematical candidate verification after cutoff',checks=rows,ledger_decompression=decompression,pass_all=all(r['matches'] for r in rows) and decompression['matches'])
(ROOT/'evidence/frozen_artifact_integrity_final.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(pass_all=result['pass_all'],file_checks=len(rows),ledger_decompression_matches=decompression['matches'])))
if not result['pass_all']:raise SystemExit(1)
