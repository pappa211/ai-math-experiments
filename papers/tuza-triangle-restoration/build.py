#!/usr/bin/env python3
"""Compile the canonical paper and derive its complete GitHub Markdown."""
from pathlib import Path
import argparse,re,subprocess,sys
ap=argparse.ArgumentParser()
ap.add_argument('--tectonic',default='tectonic')
ap.add_argument('--pandoc',default='pandoc')
ap.add_argument('--output-dir',type=Path,default=Path('build'))
args=ap.parse_args()
root=Path(__file__).resolve().parent
out=args.output_dir.resolve()
out.mkdir(parents=True,exist_ok=True)
for tool,version in [(args.tectonic,'0.17.0'),(args.pandoc,'3.13')]:
 actual=subprocess.check_output([tool,'--version'],text=True).splitlines()[0]
 if not re.search(r'(?<![0-9.])'+re.escape(version)+r'(?![0-9.])',actual):
  raise SystemExit(f'Expected {tool} {version}; found {actual}')
subprocess.run([args.tectonic,'--untrusted','--keep-intermediates','--keep-logs','--outdir',str(out),str(root/'main.tex')],check=True)
log=(out/'main.log').read_text()
bad=[line for line in log.splitlines() if any(t in line for t in ['Overfull','undefined','Missing character','! LaTeX Error'])]
if bad:raise SystemExit('Resolve compilation diagnostics:\n'+'\n'.join(bad))
subprocess.run([sys.executable,str(root/'render_markdown.py'),'--build-dir',str(out),'--pandoc',args.pandoc,'--output',str(out/'main.md')],check=True)
print(f'Review {out / "main.pdf"} and {out / "main.md"} before updating distributed artifacts.')
