#!/usr/bin/env python3
"""Target cover-critical cores via exact tau-preserving edge deletion, then mutate."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import json,time,random,fcntl,hashlib,datetime,argparse
from core import Graph,BudgetExceeded,bits
W=Path(__file__).resolve().parents[1]
def key(n,es):return (n,tuple(sorted(tuple(sorted(e)) for e in es)))
def hid(k):return hashlib.sha256(json.dumps(k).encode()).hexdigest()
def main(budget,seed):
 rng=random.Random(seed);start=time.monotonic();deadline=start+budget
 seeds=[]
 for stage in ['hostile','dense','blue']:
  p=W/'evidence'/f'search_{stage}.jsonl'
  if p.exists():
   for s in p.read_text().splitlines():
    r=json.loads(s)
    if r['status']=='EXACT' and r['input']['n']<=12:
     seeds.append((r['input']['n'],r['input']['edges'],{'source_stage':stage,'source_name':r['input']['name']}))
 rng.shuffle(seeds)
 # Random small K4/K5 support unions; overlap patterns are deliberately varied.
 for j in range(1200):
  n=rng.choice([7,8,9,10,11,12,13]);es=set();blocks=[]
  for _ in range(rng.choice([2,3,4,5])):
   vs=sorted(rng.sample(range(n),rng.choice([4,5])));blocks.append(vs);es.update(combinations(vs,2))
  seeds.append((n,sorted(es),{'generator':'random clique-support union','index':j,'blocks':blocks}))
 rng.shuffle(seeds)
 counts=Counter();seen=set();pool=[];critical=[]
 with (W/'evidence/compute.lock').open('a+') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX)
  with (W/'evidence/critical_search.jsonl').open('w') as log:
   j=0
   while time.monotonic()<deadline and j<6000:
    if j<len(seeds):n,es,origin=seeds[j]
    elif pool:
     n,base,parent=rng.choice(pool);es=set(base);changes=[]
     for _ in range(rng.choice([1,2,3,4])):
      e=tuple(sorted(rng.sample(range(n),2)));es^={e};changes.append(e)
     es=sorted(es);origin={'generator':'critical-core toggles','parent':parent,'toggles':changes}
    else:break
    j+=1;counts['chains_started']+=1;previous_tau=None;step=0
    while time.monotonic()<deadline:
     k=key(n,es)
     if k in seen:counts['labelled_duplicates_skipped']+=1;break
     seen.add(k);counts['attempted_graphs']+=1;before=time.monotonic()
     rec={'input':{'n':n,'edges':list(k[1]),'origin':origin,'chain':j,'step':step},'graph_hash':hid(k)}
     g=Graph(n,es,min(1.5,deadline-time.monotonic()))
     try:
      tau,cs,complete=g.covers(10000)
      if previous_tau is not None:assert tau==previous_tau,'tau-neutral deletion failed'
      rec.update(tau=tau,cover_scope='all optima' if complete else 'subset of optima',cover_count=len(cs))
      rs=[g.evaluate(c) for c in cs];nu=len(g.packing())
      union=0
      for c in cs:union|=c
      never=[e for e in range(len(g.edges)) if not union>>e&1]
      rec.update(status='EXACT',records=rs,nu=nu,triangles=g.triangles,max_D=max(r['D'] for r in rs),
                 cover_critical=complete and not never,never_in_optimum_edges=[g.edges[e] for e in never] if complete else None)
      counts['exact_graphs']+=1;counts['exact_cover_pairs']+=len(cs)
      counts['all_optima_graphs' if complete else 'subset_optima_graphs']+=1
      counts['covers_with_T3']+=sum(r['class_sizes'][2]>0 for r in rs)
      if rec['max_D']>0:
       rr=max(rs,key=lambda r:r['D']);C=g.cover_mask(rr['cover']);cand={**g.literal(),**rr,'nu':nu,'origin':origin,'status':'CANDIDATE_UNCONFIRMED'}
       for a in (1,2,3):cand[f'T{a}']=[t for t,m in zip(g.triangles,g.masks) if (m&C).bit_count()==a]
       cp=W/'witnesses'/f'CANDIDATE_critical_{j}_{step}.json';cp.write_text(json.dumps(cand,indent=2)+'\n')
       (cp.with_suffix('.sha256')).write_text(hashlib.sha256(cp.read_bytes()).hexdigest()+'\n')
       counts['positive_candidates']+=1
      if complete and not never:
       counts['critical_graphs']+=1
       critical.append({'graph_hash':rec['graph_hash'],'n':n,'m':len(es),'tau':tau,'nu':nu,'max_D':rec['max_D'],'covers':len(cs)})
       if tau>=3:pool.append((n,tuple(g.edges),rec['graph_hash']))
      if complete and never:
       # Largest triangle involvement first, seeded random tie-breaking.
       rng.shuffle(never);e=max(never,key=lambda a:g.inc[a].bit_count())
       rec['next_deleted_edge']=g.edges[e];es=[x for i,x in enumerate(g.edges) if i!=e];previous_tau=tau
      else:es=None
     except (BudgetExceeded,RecursionError,MemoryError) as ex:
      rec.update(status='TIMEOUT' if isinstance(ex,BudgetExceeded) else type(ex).__name__,nodes=g.nodes);counts['unresolved_graphs']+=1;es=None
     rec['elapsed_seconds']=time.monotonic()-before
     log.write(json.dumps(rec,separators=(',',':'))+'\n');log.flush()
     if counts['attempted_graphs']%100==0:print(dict(counts),flush=True)
     if counts['positive_candidates'] or es is None:break
     step+=1
    if counts['positive_candidates']:break
 summary={'seed':seed,'budget_seconds':budget,'elapsed_seconds':time.monotonic()-start,'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'counts':dict(counts),'input_seed_count':len(seeds),'critical_graphs':critical,'dedup':'exact labelled edge tuple; no isomorphism count claimed','selection':'max triangle-degree never-in-any-optimum edge; seeded ties; 1200 K4/K5 support unions plus prior graphs; after seeds, 1-4 edge toggles of critical pool','reduction_certificate':'complete all optimum enumeration; deleted edge in no optimum iff tau preserved; next tau independently recomputed'}
 (W/'evidence/critical_search_summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items() if k!='critical_graphs'},indent=2),flush=True)
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--seconds',type=float,default=600);p.add_argument('--seed',type=int,default=13110289);a=p.parse_args();main(a.seconds,a.seed)
