#!/usr/bin/env python3
"""Copy main documents into the owner-requested Desktop ZIP; never overwrite."""
from pathlib import Path
import hashlib,json,zipfile
w=Path(__file__).resolve().parents[1]
plan=json.loads((w/'operations/handoff_plan.json').read_text())
checkpoint=Path(plan['checkpoint_receipt']);assert checkpoint.is_file()
files=['README.md','REPORT.md','THEOREM_SPEC.md','THEOREM_LEDGER.json','DEPENDENCIES.md','AXIOM_AUDIT.md','INDEPENDENT_REVIEW.md','REPRODUCTION.md','RESEARCH_REUSE.md','SOURCE_INTEGRITY.json','PROGRESS.md','FINAL_RECEIPT.md','Research.lean','lean-toolchain','lake-manifest.json','lakefile.toml','operations/clock.json','operations/dependency_pins.json','operations/accepted_source_freeze.json','operations/accepted_build_order.json','operations/audit_targets.json','operations/final_evidence_index.json','operations/final_source_integrity.json','notes/matching_reuse.md','notes/perfect_reorganization.md','review/full_route_semantic_review.md']
index=json.loads((w/'operations/final_evidence_index.json').read_text())
files.append(index['summary'])
entries=[];zpath=Path(plan['desktop_zip'])
with zipfile.ZipFile(zpath,'x',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as z:
 for name in files:
  data=(w/name).read_bytes();z.writestr('TUZA-24_Main_Documents/'+name,data)
  entries.append({'path':name,'sha256':hashlib.sha256(data).hexdigest(),'bytes':len(data)})
 data=checkpoint.read_bytes();z.writestr('TUZA-24_Main_Documents/FINAL_CHECKPOINT.json',data)
 entries.append({'path':'FINAL_CHECKPOINT.json','sha256':hashlib.sha256(data).hexdigest(),'bytes':len(data)})
 z.writestr('TUZA-24_Main_Documents/ARCHIVE_MANIFEST.json',json.dumps({'kind':'Main documents copy; full proof sources and complete verification logs remain in the private workspace','workspace':str(w),'files':entries},indent=2)+'\n')
with zipfile.ZipFile(zpath) as z:
 assert z.testzip() is None
 for e in entries:assert hashlib.sha256(z.read('TUZA-24_Main_Documents/'+e['path'])).hexdigest()==e['sha256']
receipt={'path':str(zpath),'bytes':zpath.stat().st_size,'sha256':hashlib.sha256(zpath.read_bytes()).hexdigest(),'copied_files':len(entries),'crc_and_file_hash_validation':'PASS','originals_preserved':True}
Path(str(checkpoint).removesuffix('.json')+'-archive.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
