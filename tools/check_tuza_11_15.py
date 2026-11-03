#!/usr/bin/env python3
"""Replay the public TUZA-11--15 finite dependencies in fresh output copies.
Python 3.10+ standard library only. No downloads, solver installation, Lean build,
large historical search, or source-tree writes. Assertions must remain enabled.
"""
from pathlib import Path
import argparse, hashlib, itertools, json, os, shutil, subprocess, sys, time

def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def symbolic_mappings(certificate):
    """Validate canonical-template -> record mappings, independently of the
    frozen checker's harmless, historical output-field naming ambiguity.
    Structural family recognition remains in that checker as a separate test.
    """
    templates={
      'K2,4':{tuple(sorted((a,b))) for a in (4,5) for b in (0,1,2,3)},
      'K3,3-minus-edge':{(0,1),(0,5),(1,2),(1,4),(2,3),(2,5),(3,4),(4,5)},
      'three-sun':{(0,1),(0,2),(0,4),(0,5),(1,2),(1,3),(1,4),(3,4),(4,5)},
      'K3,3':{tuple(sorted((a,b))) for a in (0,2,4) for b in (1,3,5)}}
    def image(edges,p):return {tuple(sorted((p[a],p[b]))) for a,b in edges}
    def valid(family,edges,p):
        return (sorted(p)==list(range(6)) and image(templates[family],p)==edges)
    rows=[]
    for record in json.loads(certificate.read_text())['records']:
        c=record['certificate']
        if c['kind']!='symbolic_exception':continue
        E=set(map(tuple,record['edges'])); p=c['permutation']
        if not valid(c['family'],E,p):raise ValueError('Invalid template-to-record mapping')
        rows.append({'family':c['family'],'canonical_template_to_record':p,'mask':record['mask']})
    # Direction-sensitive diagnostic: choose a non-involutory relabelling for
    # which reversing the map reconstructs a different graph.
    E=templates['three-sun']
    for p in itertools.permutations(range(6)):
        inverse=tuple(p.index(i) for i in range(6)); labelled=image(E,p)
        if image(E,inverse)!=labelled:
            assert valid('three-sun',labelled,p)
            assert not valid('three-sun',labelled,inverse)
            break
    else:raise ValueError('Direction diagnostic unavailable')
    return {'status':'PASS','direction':'canonical template label i maps to permutation[i] in record',
            'mappings':rows,'direction_sensitive_negative_control':True}

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--output',required=True,type=Path,help='New directory; refuses existing paths')
    ap.add_argument('--only',choices=['TUZA-15'],help='Lightweight core dependency replay')
    a=ap.parse_args()
    if not __debug__:raise RuntimeError('Do not use python -O')
    root=Path(__file__).resolve().parents[1]; out=a.output.resolve()
    if out==root or root in out.parents:raise ValueError('Output must be outside the checkout')
    out.mkdir(parents=True,exist_ok=False); scratch=out/'public-copy'; scratch.mkdir()
    labels=['TUZA-15'] if a.only else ['TUZA-11','TUZA-12','TUZA-13','TUZA-14','TUZA-14B','TUZA-15']
    source_hashes={}
    for label in labels:
        src=root/'problems'/label
        for p in src.rglob('*'):
            if p.is_file():source_hashes[str(p.relative_to(root))]=sha(p)
        shutil.copytree(src,scratch/'problems'/label,ignore=shutil.ignore_patterns('__pycache__','*.pyc'))
        (scratch/'problems'/label/'evidence').mkdir(exist_ok=True)
    logs=out/'logs';logs.mkdir();results=[];start=time.monotonic()
    env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1','PYTHONHASHSEED':'0'}
    receipt={'status':'RUNNING','scope':'Public finite replay and exact witnesses; symbolic proofs remain ordinary arguments.',
             'python_version':sys.version.split()[0],'driver_sha256':sha(Path(__file__)),
             'source_sha256':source_hashes,'runs':results}
    def run(label,script,*args,cwd=None,timeout=180):
        work=scratch/'problems'/label
        command=[sys.executable,script,*args]
        began=time.monotonic();index=len(results)+1;log=logs/f'{index:02d}-{label}-{Path(script).stem}.txt'
        with log.open('w') as stream:
            p=subprocess.run(command,cwd=cwd or work,env=env,stdout=stream,stderr=subprocess.STDOUT,timeout=timeout)
        row={'label':label,'script':script,'arguments':list(args),'exit_code':p.returncode,
             'elapsed_seconds':time.monotonic()-began,'log':str(log.relative_to(out)),'log_sha256':sha(log)}
        results.append(row);print(json.dumps({k:row[k] for k in ['label','script','exit_code','elapsed_seconds']}),flush=True)
        if p.returncode:raise RuntimeError('Finite check failed; inspect '+str(log))
    try:
        t=scratch/'problems/TUZA-15'
        mapped=symbolic_mappings(t/'evidence/six_link_certificates.json')
        (t/'evidence/symbolic_mapping_validation.json').write_text(json.dumps(mapped,indent=2)+'\n')
        run('TUZA-15','checks/independent_six_links.py','--certificate','evidence/six_link_certificates.json','--output','evidence/portable_six_links.json')
        r=json.loads((t/'evidence/portable_six_links.json').read_text())
        receipt['TUZA15_observed']={'certificate_sha256':r['certificate_sha256'],'frozen_checker_sha256':r['checker_sha256'],
          'labelled_inputs':r['coverage']['labelled_graphs_enumerated'],'eligible':r['coverage']['eligible_labelled_count'],
          'representatives':r['counts_observed_not_acceptance_criteria']['representatives'],
          'categories':r['counts_observed_not_acceptance_criteria']['certificate_kinds'],
          'successful_diagnostics':len(r['negative_controls'])+int(r['coverage']['missing_orbit_negative_control']['rejected']),
          'mapping_validation':mapped}
        run('TUZA-15','checks/coordinator_fixed_core.py')
        run('TUZA-15','checks/scope_diagnostics.py')
        run('TUZA-15','independent_checks/mathematical_witnesses.py')
        run('TUZA-15','original_checks/six_link_certificates.py')
        run('TUZA-15','original_checks/six_link_independent.py','evidence/six_link_certificates.json')
        run('TUZA-15','original_checks/explicit_witnesses.py')
        if not a.only:
            run('TUZA-11','checks/independent_check.py')
            run('TUZA-11','checks/auxiliary_check.py')
            run('TUZA-12','checks/check_a.py')
            run('TUZA-12','checks/check_b.py','--output','evidence/check_b-replayed.json')
            run('TUZA-12','checks/check_c.py')
            run('TUZA-12','checks/check_weighted.py')
            run('TUZA-13','checks/independent.py','--controls','--output','evidence/portable-controls.json','--seconds','60')
            run('TUZA-13','checks/independent.py','--input','witnesses/independent_nearest_9_normalized.json','--output','evidence/portable-nearest.json','--all-covers','--seconds','60')
            run('TUZA-13','checks/independent_auxiliary.py','witnesses/theory_tau_drop.json','evidence/portable-cover-drop.json')
            run('TUZA-14','checks/independent_auxiliary.py')
            run('TUZA-14','checks/exchange_characterization.py')
            run('TUZA-14B','checks/integral_independent.py','controls','--seconds','180',timeout=190)
            run('TUZA-14B','checks/integral_independent.py','local','--seconds','60')
            run('TUZA-14B','checks/integral_independent.py','t1local','--seconds','60')
            run('TUZA-14B','checks/fractional_cut_independent.py','--output','evidence/fractional-cut-replayed.json')
        for rel,digest in source_hashes.items():
            if sha(root/rel)!=digest:raise RuntimeError('Public input changed during replay: '+rel)
        receipt.update(status='PASS',input_files_unchanged=True,elapsed_seconds=time.monotonic()-start,
                       historical_not_rerun=['Liu 154874 RUP steps','TUZA-13 multi-million-cover searches','TUZA-14B exploratory censuses','Historical Lean builds and replays'])
    except BaseException as e:
        receipt.update(status='FAILED',error=str(e),elapsed_seconds=time.monotonic()-start)
        raise
    finally:
        (out/'REPRODUCTION.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print(json.dumps({'status':'PASS','runs':len(results),'TUZA15_observed':receipt['TUZA15_observed']},sort_keys=True))
if __name__=='__main__':main()
