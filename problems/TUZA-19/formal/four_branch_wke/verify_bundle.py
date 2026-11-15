from pathlib import Path
import json,re,hashlib,datetime
F=Path(__file__).resolve().parent
commands=[json.loads(s) for s in (F/'commands.jsonl').read_text().splitlines()]
generation=json.loads((F/'generation.json').read_text())
expected_input='e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1'
assert hashlib.sha256((F/'inputs/canonical_witnesses.json').read_bytes()).hexdigest()==expected_input
assert len(generation['segments'])==128 and sum(x['rows'] for x in generation['segments'])==5375
accepted=[];axioms={}
for item in generation['segments']:
 name=item['module'];label=name.lower()+'_final'
 matches=[r for r in commands if Path(r['stdout']).stem==label]
 assert len(matches)==1 and matches[0]['returncode']==0 and not matches[0]['timeout']
 r=matches[0];accepted.append(r)
 stdout=Path(r['stdout']).read_text();expected="'FourBranch."+name+".correct' does not depend on any axioms"
 assert expected in stdout
 source=(F/(name+'.lean')).read_text()
 header='def segment : Segment := ⟨'+str(item['branches'])+',['+','.join(map(str,item['head']))+'],'+str(item['suffixLength'])+',rows⟩'
 assert header in source and (F/(name+'.olean')).exists()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',source)
 axioms['FourBranch.'+name+'.correct']=[]
for label in ['core_fixed','domain_final','coverage_pass','negative_checks_pass']:
 r=next(r for r in commands if Path(r['stdout']).stem==label)
 assert r['returncode']==0 and not r['timeout'];accepted.append(r)
 for line in Path(r['stdout']).read_text().splitlines():
  m=re.match(r"'([^']+)' does not depend on any axioms",line)
  if m:axioms[m.group(1)]=[]
  m=re.match(r"'([^']+)' depends on axioms: \[(.*)\]",line)
  if m:axioms[m.group(1)]=m.group(2).split(', ')
for name in ['Core','Domain','Coverage','NegativeChecks']:
 s=(F/(name+'.lean')).read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',s)
allowed={'propext','Classical.choice','Quot.sound'}
assert all(set(xs)<=allowed for xs in axioms.values())
negative=json.loads((F/'negative_receipt.json').read_text());assert len(negative)==3
for n in negative:
 assert n['expected_rejection'] and n['returncode']==1
 s=Path(n['stdout']).read_text();assert 'proved that the proposition' in s and 'is false' in s

def rss(r):
 m=re.search(r'(\d+)\s+maximum resident set size',Path(r['stderr']).read_text());return int(m.group(1)) if m else None
failed=[r for r in commands if r['returncode']!=0]
receipt={'status':'PASS_FINITE_PROOF_BUNDLE','completed_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'128 separately compiled finite certificate/domain theorems plus separate state-enumerator and schedule proofs. No monolithic universal theorem, all-size WKE theorem or core localization formalization.','input_note_sha256':hashlib.sha256((F/'inputs/root_four_branch_wke.md').read_bytes()).hexdigest(),'input_data_sha256':expected_input,'canonical_records':5375,'raw_state_vectors':15756,'segments':128,'per_branch_records':{'1':0,'2':0,'3':10,'4':5365},'certificate_axioms':'none for all128 Chunk.correct theorems','enumerator_axioms':{'mem_vectors_iff':['propext','Classical.choice','Quot.sound'],'vectors_add':['propext','Quot.sound'],'vectors_length':['propext','Quot.sound']},'negative_controls':negative,'accepted_command_count':len(accepted),'accepted_peak_RSS_bytes':max(rss(r) or 0 for r in accepted),'accepted_max_command_seconds':max(r['seconds'] for r in accepted),'all_compiler_commands_time_limited_seconds':240,'all_compiler_commands_serial':True,'configured_max_Lean_memory_MiB':2200,'failed_attempts':[{**r,'observed_RSS_bytes':rss(r)} for r in failed if not Path(r['stdout']).stem.startswith('reject_')],'failed_peak_RSS_bytes':max(rss(r) or 0 for r in failed),'memory_scope':'Lean -M is an allocation setting, not an OS hard RSS limit. Failed monolithic/naive-normalization attempts exceeded the nominal RSS size and are explicitly not accepted. Successful accepted checks fit below2200MiB.','no_new_axioms_or_admissions':True,'native_decide_used':False,'dependencies':'installed Lean Std/core only','all_size_WKE_formalized':False,'core_localization_formalized':False,'original_research_cutoff':'2026-11-15T09:23:58Z','requested_controls':'Astra / Ultra; actual serving identity and applied controls not independently exposed','header_connection':'Each compiled segment definition has the literal header recorded by Coverage; this cross-file correspondence is checked here without a monolithic Lean import.'}
assert receipt['accepted_peak_RSS_bytes']<2200*2**20
(F/'axioms.json').write_text(json.dumps(axioms,indent=2)+'\n')
(F/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps({k:receipt[k] for k in ['status','canonical_records','segments','accepted_peak_RSS_bytes','accepted_max_command_seconds','failed_peak_RSS_bytes']},indent=2))
