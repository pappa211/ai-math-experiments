"""Bounded native replay of authenticated optional Claude sources; no census claim."""
import json,pathlib,subprocess,time,hashlib
from mixed_exact import controls
root=pathlib.Path.cwd(); src=pathlib.Path('PRIVATE_PATH_REMOVED outputs')
binpath=root/'operations'/'mixed_bins';binpath.mkdir(exist_ok=True)
Gs=controls(); (root/'evidence'/'mixed_claude_controls.g6').write_text('\n'.join(G.graph6() for G in Gs.values())+'\n')
small=['K3','K4','K5','K4_background'];(root/'evidence'/'mixed_claude_mt_controls.g6').write_text('\n'.join(Gs[n].graph6() for n in small)+'\n')
records=[]
def run(args,data=None,timeout=30):
    t=time.time()
    try:
        p=subprocess.run(args,input=data,text=True,capture_output=True,timeout=timeout)
        r={'command':args,'exit':p.returncode,'stdout':p.stdout,'stderr':p.stderr,'elapsed_seconds':time.time()-t,'status':'COMPLETED' if p.returncode==0 else 'ERROR'}
    except subprocess.TimeoutExpired as ex:
        r={'command':args,'status':'TIMEOUT','elapsed_seconds':time.time()-t,'stdout':str(ex.stdout),'stderr':str(ex.stderr)}
    records.append(r); return r
for name in ['mt','r0','r2','eq']:
    build=run(['clang','-O2','-Wall','-Wextra','-o',str(binpath/name),str(src/(name+'.c'))])
    if build['status']!='COMPLETED':continue
    if name=='mt':run([str(binpath/name),'0'],(root/'evidence'/'mixed_claude_mt_controls.g6').read_text())
    elif name=='r0':
        for mode in ['0','1']:run([str(binpath/name),mode],(root/'evidence'/'mixed_claude_controls.g6').read_text())
    elif name=='r2':run([str(binpath/name),'2'],(root/'evidence'/'mixed_claude_controls.g6').read_text())
    else:run([str(binpath/name)],(root/'evidence'/'mixed_claude_controls.g6').read_text())
result={'source_hashes':{n:hashlib.sha256((src/(n+'.c')).read_bytes()).hexdigest() for n in ['mt','r0','r2','eq']},'controls':{n:{'graph6':G.graph6(),'n':G.n,'m':len(G.edges),'triangles':len(G.triangles)} for n,G in Gs.items()},'mt_controls':small,'records':records}
(root/'evidence'/'mixed_claude_replay.json').write_text(json.dumps(result,indent=2))
for r in records:print(r['command'],r['status'],r['elapsed_seconds'],r.get('stderr',''))
