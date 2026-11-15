"""Hash-checked import for an additional immutable mission review manifest."""
from pathlib import Path
import json,hashlib,datetime,sys
ROOT=Path(__file__).resolve().parents[1]
source=Path(sys.argv[1]);expected=sys.argv[2];raw=source.read_bytes()
assert hashlib.sha256(raw).hexdigest()==expected
data=json.loads(raw)
for row in data['files']:
    blob=Path(row.get('staged_source',row.get('staged_path'))).read_bytes()
    assert len(blob)==row['bytes'] and hashlib.sha256(blob).hexdigest()==row['sha256']
    dest=ROOT/row.get('target_relative_path',row.get('canonical_relative_path'));dest.parent.mkdir(parents=True,exist_ok=True)
    assert not dest.exists() or dest.read_bytes()==blob,'Refusing to overwrite different frozen bytes'
    dest.write_bytes(blob)
manifest_target=data.get('manifest_target_relative_path') or str(Path(data['manifest_canonical_path']).relative_to(ROOT))
(ROOT/manifest_target).write_bytes(raw)
receipt=dict(time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),manifest_sha256=expected,files=len(data['files']),all_transferred_hashes_match=True)
receipt_path=Path(manifest_target).with_name(Path(manifest_target).stem+'_import_receipt.json')
(ROOT/receipt_path).write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt))
