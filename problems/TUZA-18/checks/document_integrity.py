"""Closeout syntax and link integrity only, with no mathematical replay."""
from pathlib import Path
from urllib.parse import unquote, urlparse
import datetime, json, re, subprocess

ROOT = Path(__file__).resolve().parents[1]
documents = ['REPORT.md', 'STATUS_MATRIX.md', 'REPRODUCTION.md',
             'RESEARCH_LOG.md', 'STATE.md', 'FINAL_RECEIPT.md']
links = []
for name in documents:
    body = (ROOT / name).read_text()
    for target in re.findall(r'\]\(([^)]+)\)', body):
        parsed = urlparse(target.strip('<>'))
        if parsed.scheme or not parsed.path:
            continue
        path = (ROOT / name).parent / unquote(parsed.path)
        links.append(dict(document=name, target=target, exists=path.exists()))

raw_paths = subprocess.check_output(
    ['git', 'ls-files', '-co', '--exclude-standard', '-z'], cwd=ROOT
).decode().split('\0')
paths = sorted(set(p for p in raw_paths if p))
json_files = []
for relative in paths:
    if relative.endswith('.json') and relative != 'ARTIFACTS_SHA256.json':
        json.loads((ROOT / relative).read_text())
        json_files.append(relative)
result = dict(time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
              scope='Document path existence and JSON syntax; no mathematical verification',
              documents=documents, local_links=links, parsed_json_files=json_files,
              pass_all=all(row['exists'] for row in links))
(ROOT / 'evidence/document_integrity_final.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(dict(pass_all=result['pass_all'], local_links=len(links), json_files=len(json_files))))
if not result['pass_all']:
    raise SystemExit(1)
