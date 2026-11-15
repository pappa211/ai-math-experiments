#!/usr/bin/env python3
"""Replay selected archived exact checks in a new external output directory.
Python 3.10+ standard library; assertions enabled. No private sources or old logs.
Historical source hashes remain in SOURCE_MANIFEST; explicitly logged adaptations
rebind provenance to public bytes, omit non-distributed provenance-only articles,
and renew expired wall guards in output copies under per-command timeouts.
"""
from pathlib import Path
import argparse,ast,datetime,hashlib,json,os,re,shutil,subprocess,sys,time
TARGETS={
 'tuza16':['TUZA-16/checks/critic_verify.py'],
 'tuza17':['TUZA-17/checks/critic_independent.py','TUZA-17/checks/critic_late.py','TUZA-17/checks/critic_boundary.py','TUZA-17/checks/critic_addenda.py','TUZA-17/checks/critic_catalogue.py','TUZA-17/checks/b_petersen.py'],
 'star':['TUZA-18/review/star_fresh_verify.py'],
 'chain':['TUZA-19/evidence/source_audit/chain_reconstruction_check.py'],
 'tuza18':['TUZA-18/checks/criticality_identification_wheel.py','TUZA-18/checks/criticality_identification_star_repair.py','TUZA-18/checks/apex_role_witness_verify.py','TUZA-18/checks/late_star_connected_chain_verify.py','TUZA-18/checks/late_compression_cone_verify.py','TUZA-18/checks/late_cover_verify.py'],
 'wke':['TUZA-19/review/four_branch_wke_fresh_verify.py'],
 'cp5':['TUZA-19/review/bounded_stars_all_cliques_fresh_base.py','TUZA-19/checks/fresh_clique_link_audit.py'],
 'odd-base':['TUZA-19/checks/batched_odd_cover_fresh_base.py'],
 'controls':['TUZA-19/checks/fresh_tf_light_wedge_verify.py','TUZA-19/review/codegree_two_fresh_checker.py','TUZA-19/checks/fresh_global_private_pair_gate.py'],
 'cksu':['TUZA-19/checks/cksu_prop13_independent.py'],
}
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--output',type=Path,required=True);ap.add_argument('--only',default=','.join(TARGETS));ap.add_argument('--timeout',type=int,default=240);a=ap.parse_args()
 if not __debug__:raise SystemExit('Assertions must be enabled')
 repo=Path(__file__).resolve().parents[1];out=a.output.resolve()
 if out==repo or repo in out.parents:raise SystemExit('Output must be new and outside checkout')
 selected=a.only.split(',');unknown=set(selected)-TARGETS.keys()
 if unknown:raise SystemExit('Unknown selections: '+str(unknown))
 out.mkdir(parents=True,exist_ok=False);copy=out/'work';copy.mkdir();logs=out/'logs';logs.mkdir()
 source=json.loads((repo/'problems/TUZA-16-19-SOURCE_MANIFEST.json').read_text());rows=source['files'];adap=[]
 aliases=sorted({p.split('/')[0] for k in selected for p in TARGETS[k]})
 for alias in aliases:shutil.copytree(repo/'problems'/alias,copy/alias)
 # Explicit old-to-public digest map only for retained source correspondences.
 hmap={};ambiguous=set()
 for row in rows:
  if row['disposition']!='retained':continue
  p=repo/row['destination'];new=sha(p);old=row['source_sha256']
  if old in hmap and hmap[old]!=new:ambiguous.add(old)
  hmap[old]=new
 for old in ambiguous:hmap.pop(old)
 for p in copy.rglob('*'):
  if not p.is_file() or p.suffix not in {'.py','.json'}:continue
  old=p.read_text();new=old
  for digest in set(re.findall(r'\b[0-9a-f]{64}\b',old)):
   if digest in hmap and hmap[digest]!=digest:new=new.replace(digest,hmap[digest])
  if new!=old:p.write_text(new);adap.append({'path':str(p.relative_to(copy)),'action':'Rebind hash references to mapped public source bytes','before':hashlib.sha256(old.encode()).hexdigest(),'after':sha(p)})
 def patch(rel,old,new,reason):
  p=copy/rel;s=p.read_text()
  if old not in s:raise RuntimeError('Expected adaptation not found: '+rel+' '+old[:80])
  p.write_text(s.replace(old,new));adap.append({'path':rel,'action':reason,'old_literal':old,'new_literal':new})
 if 'tuza16' in selected:
  p=copy/'TUZA-16/evidence/critic_start_hashes.json';m=json.loads(p.read_text());original=m['source_hashes'];kept={r:sha(copy/'TUZA-16'/r) for r in original if (copy/'TUZA-16'/r).is_file()}
  omitted={r:v for r,v in original.items() if r not in kept}
  allowed=all(Path(r).suffix in {'.pdf','.html','.txt'} or 'operating/' in r for r in omitted)
  if not allowed:raise RuntimeError('Unexpected missing mathematical source: '+str(omitted))
  m['source_hashes']=kept;p.write_text(json.dumps(m,indent=2)+'\n');adap.append({'path':str(p.relative_to(copy)),'action':'Retained mathematical inputs rebound to public hashes; non-distributed provenance omitted','omitted_original_digests':omitted})
 if 'tuza17' in selected:
  rel='TUZA-17/checks/critic_independent.py';p=copy/rel;s=p.read_text();line=next(x for x in s.splitlines() if x.startswith('INPUTS='));vals=ast.literal_eval(line.split('=',1)[1]);kept=[x for x in vals if (copy/'TUZA-17'/x).is_file()];omitted=set(vals)-set(kept)
  assert omitted=={'MISSION.txt','sources/literature/hns2018.pdf'},omitted
  patch(rel,line,'INPUTS='+repr(kept),'Omit mission and copyrighted article used only for provenance hashes')
  r=next(x for x in rows if x['source_alias']=='TUZA-17' and x['relative_file']=='sources/literature/mckay_ramsey_20261104.html')
  patch('TUZA-17/checks/critic_catalogue.py',"hashlib.sha256((r/'sources/literature/mckay_ramsey_20261104.html').read_bytes()).hexdigest()",repr(r['source_sha256']),'Record historical catalogue digest instead of reading unbundled HTML; graph6 mathematics unchanged')
 if 'star' in selected:
  patch('TUZA-18/review/star_fresh_verify.py',"pathlib.Path('SCRATCH_OUTPUT/tuza18_star_fresh_verifier.json')","pathlib.Path(__file__).resolve().parents[1] / 'evidence/publication_star_replay.json'",'Redirect output to new external execution copy')
  # Parenthesize compound target before the original write_text method.
  p=copy/'TUZA-18/review/star_fresh_verify.py';s=p.read_text().replace("pathlib.Path(__file__).resolve().parents[1] / 'evidence/publication_star_replay.json'.write_text", "(pathlib.Path(__file__).resolve().parents[1] / 'evidence/publication_star_replay.json').write_text");p.write_text(s)
 for group,rel in [('chain','TUZA-19/evidence/source_audit/chain_reconstruction_check.py'),('cksu','TUZA-19/checks/cksu_prop13_independent.py')]:
  if group in selected:
   patch(rel,'STOP=datetime(2026,11,15,9,23,58,tzinfo=timezone.utc)',"STOP=START+__import__('datetime').timedelta(seconds="+str(a.timeout)+")",'Renew historical guard only in execution copy; external timeout also enforced')
   patch(rel,"assert START<STOP and platform.system()=='Darwin'",'assert START<STOP','Remove historical host restriction for portable stdlib checker; actual publication host recorded')
 if 'cksu' in selected:
  r=next(x for x in rows if x['source_alias']=='TUZA-19' and x['relative_file']=='evidence/cksu_source_audit/2001.00257v2.pdf')
  patch('TUZA-19/checks/cksu_prop13_independent.py',"sha256((OUT/'2001.00257v2.pdf').read_bytes()).hexdigest()",repr(r['source_sha256']),'Keep inspected-edition digest as historical provenance; K5 checker needs no PDF')
 (out/'ADAPTATIONS.json').write_text(json.dumps(adap,indent=2)+'\n')
 results=[];env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1','PYTHONHASHSEED':'0'}
 for group in selected:
  for rel in TARGETS[group]:
   script=copy/rel;alias=rel.split('/')[0];label=rel.replace('/','__').removesuffix('.py');log=logs/(label+'.log');start=time.monotonic();status='FAIL'
   try:
    with log.open('w') as f:r=subprocess.run([sys.executable,'-B',str(script)],cwd=copy/alias,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=a.timeout)
    rc=r.returncode;status='PASS' if rc==0 else 'FAIL'
   except subprocess.TimeoutExpired:rc=None;status='UNKNOWN_TIMEOUT'
   row={'group':group,'script':rel,'adapted_script_sha256':sha(script),'status':status,'returncode':rc,'seconds':time.monotonic()-start,'timeout_seconds':a.timeout,'log':str(log.relative_to(out)),'log_sha256':sha(log)};results.append(row);print(json.dumps(row),flush=True)
   if status!='PASS':break
  if results[-1]['status']!='PASS':break
 result={'status':'PASS' if len(results)==sum(len(TARGETS[k]) for k in selected) and all(x['status']=='PASS' for x in results) else 'FAIL_OR_INCOMPLETE','host':__import__('platform').system(),'python':sys.version.split()[0],'selected':selected,'checks':results,'evidence_boundary':'Fresh executions of retained exact checker implementations, not independent new implementations or all-size proofs. No solver-only kernels or historical discovery censuses rerun.','source_copy_policy':'Only public candidate files; outputs and adaptations outside checkout.'}
 (out/'VERIFICATION.json').write_text(json.dumps(result,indent=2)+'\n')
 if result['status']!='PASS':raise SystemExit(1)
if __name__=='__main__':main()
