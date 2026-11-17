#!/usr/bin/env python3
"""Stratified independent rechecks, not an exhaustive restoration census."""
from pathlib import Path
from functools import lru_cache
from itertools import combinations
import json,sys,subprocess,time,os,signal,hashlib,datetime
R=Path(__file__).resolve().parents[1];O=R/'evidence/source_audit'
def tri(n,E):
 return [frozenset(combinations(t,2)) for t in combinations(range(n),3) if set(combinations(t,2))<=E]
def comps(T):
 pending=set(range(len(T)));ans=[]
 while pending:
  i=pending.pop();group={i};queue=[i]
  while queue:
   i=queue.pop();linked={j for j in pending if T[i]&T[j]};pending-=linked;group|=linked;queue.extend(linked)
  ans.append([T[j] for j in group])
 return ans
@lru_cache(maxsize=100000)
def pack(T):
 if not T:return ()
 t=T[0];choose=(t,)+pack(tuple(u for u in T[1:] if not set(t)&set(u)));skip=pack(T[1:])
 return choose if len(choose)>=len(skip) else skip
@lru_cache(maxsize=100000)
def cover(T):
 if not T:return ()
 candidates=[(e,)+cover(tuple(u for u in T if e not in u)) for e in T[0]]
 return min(candidates,key=len)
def check(n,E):
 T=tri(n,E);P=[];C=[];B=True;details=[]
 for comp in comps(T):
  es=set().union(*comp);vs=set().union(*(set(e) for e in es));b=len(vs) in [4,5] and es==set(combinations(sorted(vs),2));B&=b
  tt=tuple(sorted(tuple(sorted(t)) for t in comp));p=pack(tt);c=cover(tt);P+=p;C+=c
  details.append({'vertices':sorted(vs),'edges':sorted(es),'B':b,'nu':len(p),'tau':len(c)})
 assert len(set().union(*(set(p) for p in P)))==3*len(P)
 assert all(set(C)&t for t in T)
 return {'nu':len(P),'tau':len(C),'B':B,'triangle_count':len(T),'packing_edge_triples':P,'cover':C,'components':details}
def graph6(n,E):
 assert 0<=n<=16
 bits=[int((i,j) in E) for j in range(1,n) for i in range(j)];bits += [0]*((-len(bits))%6)
 return chr(63+n)+''.join(chr(63+sum(bits[i+j]<<(5-j) for j in range(6))) for i in range(0,len(bits),6))
if len(sys.argv)>1 and sys.argv[1]=='--one':
 row=json.load(sys.stdin);n=row['n'];E=set(map(tuple,row['graph_edges']));H=set(map(tuple,row['H_edges']));F=set(map(tuple,row['added_edges']))
 assert H<=E and E-H==F and not H&F
 r=check(n,E);h=check(n,H);assert h['B']
 for key,ours in [('nu',r['nu']),('tau',r['tau']),('literal_B',r['B']),('triangle_count',r['triangle_count'])]:assert row[key]==ours,(row['id'],key,row[key],ours)
 originalP=[set(combinations(t,2)) for t in row['packing']];assert all(t in tri(n,E) for t in map(frozenset,originalP));assert sum(map(len,originalP))==len(set().union(*originalP))
 assert len(originalP)==r['nu'];assert len(row['cover'])==r['tau'];assert all(set(map(tuple,row['cover']))&t for t in tri(n,E))
 print(json.dumps({'id':row['id'],'name':row['name'],'n':n,'H':h,'G':r,'graph6':graph6(n,E),'source_assertions':'PASS'}));sys.exit(0)
rows=[json.loads(s) for s in (R/'evidence/restoration_cases.jsonl').read_text().splitlines()]
groups={}
for row in rows:groups.setdefault((row['n'],row['name']),[]).append(row)
selected={r['id']:r for rs in groups.values() for r in [max(rs,key=lambda r:r['triangle_count'])]}
selected.update({r['id']:r for r in rows if r['tau']==2*r['nu']})
results=[];start=time.monotonic()
def run(cmd,inp,limit):
 s=time.monotonic();p=subprocess.Popen(cmd,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,start_new_session=True);p.stdin.write(inp.encode());p.stdin.close();p.stdin=None;peak=0;status='COMPLETE'
 while p.poll() is None:
  raw=subprocess.check_output(['/bin/ps','-axo','pid=,ppid=,rss='],text=True);pr={int(q[0]):(int(q[1]),int(q[2])) for line in raw.splitlines() if len(q:=line.split())==3};ids={p.pid}
  while True:
   new=ids|{pid for pid,(ppid,rss) in pr.items() if ppid in ids}
   if new==ids:break
   ids=new
  rss=sum(pr.get(i,(0,0))[1] for i in ids);peak=max(peak,rss)
  if time.monotonic()-s>limit or rss>2200*1024:
   status='TIMEOUT' if time.monotonic()-s>limit else 'RSS_LIMIT';os.killpg(p.pid,signal.SIGTERM);break
  time.sleep(.01)
 try:o,e=p.communicate(timeout=2)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);o,e=p.communicate()
 return {'argv':cmd,'timeout_seconds':limit,'status':status,'exit_code':p.returncode,'elapsed_seconds':time.monotonic()-s,'sampled_peak_tree_rss_kib':peak,'stdout':o.decode(),'stderr':e.decode()}
for ident,row in sorted(selected.items()):
 if time.monotonic()-start>54:results.append({'id':ident,'status':'UNKNOWN_CAMPAIGN_SUBJOB_LIMIT'});continue
 receipt=run([sys.executable,str(Path(__file__).resolve()),'--one'],json.dumps(row),2)
 result={'id':ident,'independent_receipt':receipt,'status':'UNKNOWN'}
 if receipt['status']=='COMPLETE' and receipt['exit_code']==0:
  data=json.loads(receipt['stdout']);result['independent_result']=data
  re=run([str(O/'claude_eq_original')],data['graph6']+'\n',2);result['original_receipt']=re
  r=data['G'];expected=f"graphs=1 tight={int(r['triangle_count']>0 and r['tau']==2*r['nu'])} tight_nonblock=0 slack_exactly_one={int(r['triangle_count']>0 and r['tau']==2*r['nu']-1)}\n"
  if re['status']=='COMPLETE' and re['exit_code']==0 and re['stdout']=='' and re['stderr']==expected:result['status']='PASS'
  else:result['status']='MISMATCH_OR_UNKNOWN'
 else:result['status']='UNKNOWN_OR_FAILED'
 results.append(result)
summary={'identity':'TUZA22-independent-stratified-restoration-recheck-v1','selection':'Every tight record plus maximal triangle count per (order,restoration type) stratum; deterministic tie by input order','input_sha256':hashlib.sha256((R/'evidence/restoration_cases.jsonl').read_bytes()).hexdigest(),'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'elapsed_seconds':time.monotonic()-start,'selected':len(selected),'pass':sum(r['status']=='PASS' for r in results),'unknown_or_failed':sum(r['status']!='PASS' for r in results),'results':results}
(O/'selected_restoration_rechecks.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items() if k!='results'},indent=2))
