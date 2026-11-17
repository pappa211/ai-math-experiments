#!/usr/bin/env python3
"""Independent deterministic stratified replay of root's generated instances."""
from verifier_candidate02 import *
import collections,signal

def main():
 started=time.time();signal.alarm(90)
 rows=[json.loads(x) for x in open(ROOT/'receipts/root_structured_rows.jsonl')]
 groups=collections.defaultdict(list)
 for i,r in enumerate(rows):groups[(r['label'].split('_n')[0],r['n'])].append((i,r))
 picks=[min(v,key=lambda x:(len(x[1]['triangles']),x[1]['label'])) for v in groups.values()]
 for n in range(11,15):
  failures=[(i,r) for i,r in enumerate(rows) if r['n']==n and r['candidate_failures']]
  if failures and failures[0][0] not in {i for i,r in picks}:picks.append(failures[0])
 rows2=[json.loads(x) for x in open(ROOT/'receipts/root_candidate02_rows.jsonl')]
 out=[]
 for index,r in picks:
  E,T=reconstruct(r['n'],r['edges'])
  assert T==tuple(tuple(t) for t in r['triangles'])
  nu,ps=maximum_packings(T);assert nu==r['nu']
  assert r['packings_checked']==min(len(ps),512)
  assert r['all_packings']==(len(ps)<=512)
  test=bad=pkbad=bad2=0
  for P in ps[:512]:
   B,A,priv,K=allowed(r['n'],E,T,P)
   C=cover_at_most(T,A,2*nu);pkbad+=C is None
   c=c01(r['n'],E,T,P)
   if c['eligible']:
    test+=1;bad+=not c['feasible'];bad2+=not c02(r['n'],E,T,P)['feasible']
  assert test==r['candidate_tests'] and bad==len(r['candidate_failures']) and pkbad==len(r['pk_failures'])
  assert rows2[index]['label']==r['label'] and test==rows2[index]['candidate_tests'] and bad2==len(rows2[index]['candidate_failures'])
  out.append({'source_row':index,'label':r['label'],'n':r['n'],'triangles':len(T),'nu':nu,'all_maximum_packings_enumerated':len(ps),'packing_prefix_checked':min(len(ps),512),'candidate01_eligible':test,'candidate01_failures':bad,'candidate02_failures':bad2,'pk_failures':pkbad,'agreement':True})
  print(json.dumps(out[-1]),flush=True)
 signal.alarm(0)
 result={'started_utc':datetime.datetime.fromtimestamp(started,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-started,'selection':'one least-triangle instance per generator family and order, ties by label; plus first Candidate01 failure per represented order','source_instances':len(rows),'distinct_labelled_graphs':len({(r['n'],tuple(map(tuple,r['edges']))) for r in rows}),'results':out,'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'source_sha256':hashlib.sha256((ROOT/'receipts/root_structured_rows.jsonl').read_bytes()).hexdigest()}
 (ROOT/'receipts/verifier_root_sample.json').write_text(json.dumps(result,indent=2)+'\n')
 print('PASS',result['elapsed_seconds'])
if __name__=='__main__':main()
