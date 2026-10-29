#!/usr/bin/env python3
"""Clean TUZA project rebuild and axiom/kernel audits; reuses pinned dependency caches.
No Git mutation, network access, or dependency build. All compilation is serial.
"""
from pathlib import Path
import argparse,datetime,hashlib,json,os,re,shutil,subprocess,sys,time

ap=argparse.ArgumentParser()
ap.add_argument('--source',type=Path,required=True)
ap.add_argument('--output',type=Path,required=True)
ap.add_argument('--packages',type=Path,required=True)
ap.add_argument('--kernel-replay',action='store_true')
args=ap.parse_args(); src=args.source.resolve(); dst=args.output.resolve(); deps=args.packages.resolve()
if dst.exists(): raise SystemExit('Output must be a NEW directory; refusing to overwrite evidence.')
dst.mkdir(parents=True); out=dst/'reproduction-output';out.mkdir(); log=(out/'build.log').open('w')
started=time.monotonic();results=[]
def run(argv,timeout=240):
 print('$ '+' '.join(map(str,argv)),file=log,flush=True)
 t=time.monotonic();r=subprocess.run(list(map(str,argv)),cwd=dst,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=timeout)
 print(r.stdout,file=log,end='',flush=True)
 results.append({'command':list(map(str,argv)),'exit_code':r.returncode,'seconds':round(time.monotonic()-t,3)})
 if r.returncode: raise RuntimeError(f'Command failed ({r.returncode}): {argv}')
 return r.stdout
try:
 for name in ['lean-toolchain','lake-manifest.json','lakefile.toml','Tuza.lean']:
  shutil.copy2(src/name,dst/name)
 shutil.copytree(src/'Tuza',dst/'Tuza',ignore=shutil.ignore_patterns('*.olean','*.ilean','*.c','*.o'))
 (dst/'.lake').mkdir();(dst/'.lake/packages').symlink_to(deps,target_is_directory=True)
 version=run(['lake','env','lean','--version'])
 assert 'version 4.33.1' in version and '819816b2e0a3bf405af45ae5c7af2491d8f5bee6' in version
 manifest=json.loads((dst/'lake-manifest.json').read_text());pins=[]
 for p in manifest['packages']:
  actual=run(['git','-C',deps/p['name'],'rev-parse','HEAD']).strip()
  status=run(['git','-C',deps/p['name'],'status','--porcelain','--untracked-files=no']).strip()
  assert actual==p['rev'] and not status,(p['name'],actual,status)
  pins.append({'name':p['name'],'rev':actual,'tracked_clean':True})
 files=sorted((dst/'Tuza').glob('*.lean'))+[dst/'Tuza.lean']
 forbidden=re.compile(r'\b(sorry|admit|sorryAx|axiom|unsafe|native_decide)\b')
 hashes=[];modules={};theorems=[]
 for p in files:
  text=p.read_text();m=forbidden.search(text)
  if m:raise RuntimeError(f'Forbidden source token {m[0]} in {p.relative_to(dst)}')
  module=str(p.relative_to(dst).with_suffix('')).replace('/','.')
  modules[module]=p
  namespaces=[]
  for line in text.splitlines():
   n=re.match(r'^namespace\s+(\S+)',line)
   if n:namespaces.append(n[1])
   elif re.match(r'^end(?:\s+\S+)?\s*$',line) and namespaces:namespaces.pop()
   d=re.match(r'^(?:@\[[^\n]*\]\s*)?(?:theorem|lemma)\s+(\S+)',line)
   if d:
    name='.'.join(namespaces+[d[1]])
    theorems.append({'name':name,'file':str(p.relative_to(dst))})
  hashes.append({'file':str(p.relative_to(dst)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
 for name in ['lean-toolchain','lake-manifest.json','lakefile.toml']:
  hashes.append({'file':name,'sha256':hashlib.sha256((dst/name).read_bytes()).hexdigest()})
 order=[];seen=set()
 def visit(m):
  if m in seen:return
  seen.add(m)
  for line in modules[m].read_text().splitlines():
   if line.startswith('import '):
    for dep in line.split()[1:]:
     if dep in modules:visit(dep)
  order.append(m)
 for m in modules:visit(m)
 build=dst/'.lake/build/lib/lean';build.mkdir(parents=True)
 for m in order:
  p=modules[m];target=build/p.relative_to(dst).with_suffix('.olean');target.parent.mkdir(parents=True,exist_ok=True)
  run(['lake','env','lean','-j','1','-o',target.relative_to(dst),p.relative_to(dst)])
  print('compiled',m,flush=True)
 imports='\n'.join('import '+m for m in order)
 commands='\n'.join('#check '+t['name']+'\n#print axioms '+t['name'] for t in theorems)
 inputs='\n'.join('#print '+n for n in ['Tuza.AharoniInput','Tuza.HNSInput','Tuza.BipartiteKonigInput','Tuza.ClosedBoundary','Tuza.PackingEdgeStable','Tuza.HasPackingEssentialEdge'])
 (dst/'Verification.lean').write_text(imports+'\nset_option pp.universes true\n'+inputs+'\n'+commands+'\n')
 audit=run(['lake','env','lean','-j','1','-o','.lake/build/lib/lean/Verification.olean','Verification.lean'])
 (out/'declarations-and-axioms.txt').write_text(audit)
 allowed={'propext','Classical.choice','Quot.sound'}
 for t in theorems:
  pattern=re.escape("'"+t['name']+"'")+r' depends on axioms: \[([^\]]*)\]'
  m=re.search(pattern,audit)
  if m:
   raw_axioms=m[1]
   normalized=re.sub(r'\.\{[^}]*\}', '', raw_axioms)
   used={a.strip() for a in normalized.split(',') if a.strip()}
   t['raw_axioms']=raw_axioms
  elif "'"+t['name']+"' does not depend on any axioms" in audit:used=set()
  else:raise RuntimeError('Missing axiom report: '+t['name'])
  if used-allowed:raise RuntimeError('Unexpected axioms: '+t['name']+str(used))
  t['axioms']=sorted(used)
 if args.kernel_replay:
  # Invoke one exact module at a time: the installed checker parallelizes multiple targets.
  for m in order:
   if m == 'Tuza': continue  # imports-only root; prefix replay would parallelize all children
   run(['lake','env','leanchecker','-v',m],timeout=240)
   print('kernel replayed',m,flush=True)
 report={'status':'PASS','finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seconds':round(time.monotonic()-started,3),'compiler':version.strip(),'dependency_pins':pins,'source_hashes':hashes,'theorems':theorems,'build_order':order,'kernel_replay':args.kernel_replay,'method':'fresh project source rebuild; existing pinned compiled dependencies reused; per-module replay is Lean kernel replay, not an external verifier or a cold dependency rebuild','commands':results}
 (out/'verification.json').write_text(json.dumps(report,indent=2)+'\n')
 print('PASS',len(theorems),'theorem axiom reports',flush=True)
except Exception as e:
 (out/'failure.json').write_text(json.dumps({'status':'FAIL','error':str(e),'commands':results},indent=2)+'\n')
 print('FAIL',str(e),file=sys.stderr);raise
finally:log.close()
