"""Repeat audit of existing records; initial exploratory query explicitly disclosed."""
import json,hashlib
from pathlib import Path
W=Path(__file__).resolve().parents[1]
p=W/'evidence'/'track_a_controls.json';raw=p.read_bytes();records=json.loads(raw)['records']
failures=[];covers=0
for r in records:
    for i,t in enumerate(r.get('cover_tests',[])):
        covers+=1
        if 2*t['forced_unique_k']<r['tau']:failures.append({'name':r['name'],'cover_index':i,'tau':r['tau'],'forced_unique_k':t['forced_unique_k']})
out={'candidate':'A3-threshold literal statement in notes/TRACK_A.md','provenance':'An exploratory audit of the same comparison preceded the literal candidate; this repeat follows it. No pre-exploration freeze is claimed.','input_sha256':hashlib.sha256(raw).hexdigest(),'graphs':len(records),'covers':covers,'failures':failures,'status':'SURVIVED_FIXED_CONTROLS_UNPROVED' if not failures else 'REFUTED_ON_FIXED_CONTROL'}
(W/'evidence'/'track_a_threshold_audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
