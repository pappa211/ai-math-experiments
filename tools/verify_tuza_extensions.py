#!/usr/bin/env python3
"""Fresh source build, literal type/axiom audit, standard-kernel object replay.

Only the supplied pinned dependency object trees are reused. No downloads,
dependency writes, or package updates. One bounded compiler process at a time.
"""
import argparse, datetime, hashlib, json, os, re, shutil, signal, subprocess, time
from pathlib import Path

def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('project',type=Path)
    ap.add_argument('--sysroot',type=Path,required=True,help='Exact Lean 4.33.1 toolchain root')
    ap.add_argument('--packages',type=Path,required=True,help='Pinned native .lake/packages')
    ap.add_argument('--output',type=Path,required=True,help='New output directory')
    ap.add_argument('--deadline-utc',required=True,help='Absolute ISO UTC deadline')
    args=ap.parse_args()
    project=args.project.resolve(); src=project/'lean'; out=args.output.resolve()
    deadline=datetime.datetime.fromisoformat(args.deadline_utc.replace('Z','+00:00')).timestamp()
    if time.time()>=deadline: raise SystemExit('Deadline already passed')
    out.mkdir(parents=True,exist_ok=False)
    work=out/'project'; work.mkdir(); evidence=out/'evidence'; evidence.mkdir()
    cfg=json.loads((project/'verification.json').read_text())
    manifest=json.loads((src/'lake-manifest.json').read_text())
    sysroot=args.sysroot.resolve(); packages=args.packages.resolve()
    lean=sysroot/'bin/lean'; leanc=sysroot/'bin/leanc'
    records=[]
    for module in cfg['modules']:
        rel=Path(module.replace('.','/')+'.lean'); source=src/rel; target=work/rel
        target.parent.mkdir(parents=True,exist_ok=True); shutil.copyfile(source,target)
        records.append({'module':module,'source':str(rel),'sha256':digest(source)})
    for fn in ['lakefile.toml','lake-manifest.json','lean-toolchain']:shutil.copyfile(src/fn,work/fn)
    (evidence/'SOURCE_CLOSURE.json').write_text(json.dumps(records,indent=2)+'\n')
    # Comment-aware static screen supplements, but never replaces, axiom auditing.
    def uncomment(s):
        out=[];i=0;depth=0
        while i<len(s):
            if s[i:i+2]=='/-':depth+=1;i+=2
            elif depth and s[i:i+2]=='-/':depth-=1;i+=2
            elif not depth and s[i:i+2]=='--':
                j=s.find('\n',i);i=len(s) if j<0 else j
            else:
                out.append(s[i] if not depth or s[i]=='\n' else ' ');i+=1
        return ''.join(out)
    forbidden=[]
    for r in records:
        txt=uncomment((src/r['source']).read_text())
        for m in re.finditer(r'\b(sorry|admit|axiom|native_decide|unsafe)\b',txt):
            forbidden.append({'module':r['module'],'token':m[0]})
    (evidence/'STATIC_SCAN.json').write_text(json.dumps(forbidden,indent=2)+'\n')
    assert not forbidden,forbidden
    pins=[]
    for d in manifest['packages']:
        root=packages/d['name']
        head=subprocess.check_output(['git','--no-optional-locks','-C',str(root),'rev-parse','HEAD'],text=True).strip()
        dirty=subprocess.check_output(['git','--no-optional-locks','-C',str(root),'status','--porcelain','--untracked-files=no'],text=True)
        assert head==d['rev'] and not dirty,(d['name'],head)
        pins.append({'package':d['name'],'revision':head,'tracked_clean':True})
    build=work/'.lake/build/lib/lean';build.mkdir(parents=True)
    env=os.environ.copy();env.update({'LEAN_NUM_THREADS':'1','OMP_NUM_THREADS':'1','LEAN_SYSROOT':str(sysroot),'TUZA06_REPLAY_MEMORY_MB':'2200','PYTHONDONTWRITEBYTECODE':'1'})
    env['LEAN_PATH']=os.pathsep.join([str(build)]+[str(packages/d['name']/'.lake/build/lib/lean') for d in manifest['packages']])
    commands=[]
    def run(argv,label):
        remaining=deadline-time.time()
        if remaining<=0:raise RuntimeError('Absolute deadline reached')
        start=time.time(); log=evidence/(label+'.log')
        with log.open('w') as f:
            p=subprocess.Popen(list(map(str,argv)),cwd=work,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
            try:rc=p.wait(timeout=min(240,remaining))
            except BaseException:
                os.killpg(p.pid,signal.SIGKILL);p.wait();raise
        # Public evidence uses portable command descriptions, never machine paths.
        portable=[]
        for a in map(str,argv):
            for root,replacement in [(str(work),'PROJECT'),(str(sysroot),'LEAN_SYSROOT'),(str(out),'OUTPUT')]:a=a.replace(root,replacement)
            portable.append(a)
        rec={'command':portable,'exit':rc,'seconds':round(time.time()-start,3),'log':log.name}
        commands.append(rec)
        (evidence/'COMMANDS.json').write_text(json.dumps(commands,indent=2)+'\n')
        print(label,'exit',rc,flush=True)
        if rc:raise RuntimeError(log.read_text())
        return log.read_text()
    version=run([lean,'--version'],'compiler-version').strip()
    assert '4.33.1' in version and '819816b' in version,version
    for r in records:
        rel=Path(r['source']); obj=build/rel.with_suffix('.olean');obj.parent.mkdir(parents=True,exist_ok=True)
        run([lean,'-DautoImplicit=false','-j1','-M2200','-o',obj,rel],'build-'+r['module'])
    names=json.loads((project/'declarations.json').read_text())
    # Audit all inventoried declarations ourselves, regardless of historical print settings.
    audit=work/'ReleaseAudit.lean'
    audit.write_text('import '+cfg['entry']+'\nset_option pp.all true\n'+''.join('#print '+n+'\n#print axioms '+n+'\n' for n in names))
    literal=run([lean,'-j1','-M2200',audit.name],'literal-types-and-axioms')
    axioms=[]
    for n in names:
        m=re.search(re.escape("'"+n+"'")+r' depends on axioms: \[([^\]]*)\]',literal)
        if m:used={a.strip() for a in re.sub(r'\.\{[^}]*\}','',m[1]).split(',') if a.strip()}
        elif "'"+n+"' does not depend on any axioms" in literal:used=set()
        else:raise RuntimeError('Missing axiom report: '+n)
        assert used<=set(cfg['axiom_allowlist']),(n,used)
        axioms.append({'declaration':n,'axioms':sorted(used)})
    (evidence/'AXIOMS.json').write_text(json.dumps(axioms,indent=2)+'\n')
    objects={str(p.relative_to(work)):digest(p) for p in build.rglob('*') if p.is_file()}
    (evidence/'OBJECTS_BEFORE_REPLAY.json').write_text(json.dumps(objects,indent=2)+'\n')
    repo=Path(__file__).resolve().parents[1]
    driver=repo/'problems/TUZA-06/lean/tools/ReplayExactNative.lean'
    shutil.copyfile(driver,work/'ReplayExactNative.lean')
    run([lean,'-j1','-M2200','-o','ReplayExactNative.olean','-c','ReplayExactNative.c','ReplayExactNative.lean'],'replay-driver-C')
    run([leanc,'-o','replay-exact','ReplayExactNative.c'],'replay-driver-native')
    for r in records:run([work/'replay-exact',r['module']],'replay-'+r['module'])
    assert objects=={str(p.relative_to(work)):digest(p) for p in build.rglob('*') if p.is_file()}
    for r in records:assert digest(src/r['source'])==r['sha256']
    result={'status':'PASS','finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'compiler':version,'dependency_pins':pins,'module_count':len(records),'audited_declarations':len(names),'standard_kernel_replays':len(records),'objects_stable':True,'source_stable':True,'compiled_dependencies_reused':True,'cold_mathlib_or_compiler_build':False,'independent_kernel':False,'replay_driver_sha256':digest(driver),'axiom_allowlist':cfg['axiom_allowlist']}
    (evidence/'VERIFICATION.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__=='__main__': main()
