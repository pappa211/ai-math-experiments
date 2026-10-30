#!/usr/bin/env python3
"""Prepare exact dependency pins without lake update. Compiled packages may be reused.
For a network bootstrap, clone each manifest Git revision and request official
Mathlib compiled artifacts with --cache. No mathematical proof modules are built.
"""
from pathlib import Path
import argparse,hashlib,json,os,shutil,subprocess
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--source',type=Path,default=Path(__file__).resolve().parents[1]/'lean')
p.add_argument('--output',type=Path,required=True)
p.add_argument('--reuse-packages',type=Path)
p.add_argument('--cache',action='store_true')
p.add_argument('--lake',type=Path,default=Path.home()/'.elan/bin/lake')
a=p.parse_args();src=a.source.resolve();dst=a.output.resolve()
if dst.exists():raise SystemExit('Output must be a new directory')
if a.reuse_packages and a.cache:raise SystemExit('Choose reuse OR official cache acquisition')
manifest=(src/'lake-manifest.json').read_bytes();lock=json.loads(manifest)
shutil.copytree(src,dst,ignore=shutil.ignore_patterns('.lake','__pycache__'))
(dst/'.lake').mkdir()
packages=dst/'.lake/packages'
def run(args,cwd=dst,timeout=900):
 subprocess.run(list(map(str,args)),cwd=cwd,check=True,timeout=timeout,env={**os.environ,'LEAN_NUM_THREADS':'1','OMP_NUM_THREADS':'1'})
if a.reuse_packages:
 packages.symlink_to(a.reuse_packages.resolve(),target_is_directory=True)
else:
 packages.mkdir()
 for item in lock['packages']:
  if item['type']!='git':raise SystemExit('Only pinned Git packages supported')
  q=packages/item['name'];run(['git','init','--quiet',q]);run(['git','remote','add','origin',item['url']],q)
  run(['git','fetch','--quiet','--depth','1','origin',item['rev']],q)
  run(['git','-c','advice.detachedHead=false','checkout','--quiet','--detach',item['rev']],q)
def verify():
 for item in lock['packages']:
  q=packages/item['name']
  head=subprocess.check_output(['git','--no-optional-locks','-C',str(q),'rev-parse','HEAD'],text=True).strip()
  clean=subprocess.check_output(['git','--no-optional-locks','-C',str(q),'status','--porcelain','--untracked-files=no'],text=True).strip()
  if head!=item['rev'] or clean:raise SystemExit('Dependency pin/clean mismatch: '+item['name'])
 if (dst/'lake-manifest.json').read_bytes()!=manifest:raise SystemExit('Dependency manifest changed')
 for name in ['lean-toolchain','lakefile.toml']:
  if (dst/name).read_bytes()!=(src/name).read_bytes():raise SystemExit('Pinned configuration changed: '+name)
verify()
run([a.lake,'env','lean','--version'],timeout=120)
if a.cache:
 # This executable is the pinned Mathlib project's official compiled-cache client.
 run([a.lake,'exe','cache','get'],timeout=1800)
verify()
report={'status':'PASS','method':'existing compiled dependency packages reused' if a.reuse_packages else 'exact manifest Git fetch; official cache requested' if a.cache else 'exact manifest Git fetch; compiled cache still required','manifest_sha256':hashlib.sha256(manifest).hexdigest(),'manifest_unchanged':True,'pins':[{k:i[k] for k in ['name','rev','url']} for i in lock['packages']],'mathematical_modules_built':0}
(dst/'bootstrap-verification.json').write_text(json.dumps(report,indent=2)+'\n')
print('PASS: exact toolchain/configuration and all dependency pins unchanged')
