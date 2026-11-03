#!/usr/bin/env python3
"""Bounded deterministic falsification search; each graph's full input is retained."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import json,time,random,fcntl,argparse,hashlib,datetime,signal
from core import Graph,BudgetExceeded
W=Path(__file__).resolve().parents[1]

def restoration():
 return [(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)]
def generators(stage,seed):
 rng=random.Random(seed)
 if stage=='controls':
  for n in range(4,11):yield {'name':f'K{n}','n':n,'edges':list(combinations(range(n),2)),'rule':'complete graph'}
  for residual in (False,True):
   es=restoration();es=[e for e in es if not residual or e not in [(0,2),(1,3)]]
   yield {'name':'residual8' if residual else 'restoration8','n':8,'edges':es,'rule':'TUZA12 literal'}
 if stage=='restoration':
  base=set(restoration())-{(4,5),(4,7),(5,6)}
  tip=list(combinations(range(4,8),2))
  for mask in range(64):yield {'name':f'tips_{mask}','n':8,'edges':sorted(base|{e for i,e in enumerate(tip) if mask>>i&1}),'rule':'all 64 tip-edge subsets'}
  for residual in (False,True):
   es=set(restoration())-({(0,2),(1,3)} if residual else set())
   for e in combinations(range(8),2):yield {'name':f'toggle_{residual}_{e}','n':8,'edges':sorted(es^{e}),'rule':'all single edge toggles on restoration/residual'}
   for mask in range(256):yield {'name':f'apex_{residual}_{mask}','n':9,'edges':sorted(es|{(v,8) for v in range(8) if mask>>v&1}),'rule':'all neighborhoods of one new vertex'}
 if stage=='hostile':
  from hostile_families import generate_hostile
  yield from sorted(generate_hostile(),key=lambda g:g['n'])
 if stage=='dense':
  for n in (7,8,9,10,11):
   for j in range(100):
    p=rng.choice([.60,.70,.80,.90])
    yield {'name':f'dense_{n}_{j}','n':n,'edges':[e for e in combinations(range(n),2) if rng.random()<p],'rule':{'bernoulli_p':p,'seed':seed,'index':j}}
 if stage=='blue':
  for n in (8,9,10,11,12):
   for j in range(100):
    # Maximal triangle-free background; no global optimality is assumed.
    es=list(combinations(range(n),2));rng.shuffle(es);B=set()
    for u,v in es:
     if not any(tuple(sorted((u,x))) in B and tuple(sorted((v,x))) in B for x in range(n)):B.add((u,v))
    C={e for e in es if e not in B and rng.random()<rng.choice([.2,.4,.6,.8])}
    yield {'name':f'blue_{n}_{j}','n':n,'edges':sorted(B|C),'generated_blue':sorted(B),'generated_red':sorted(C),'rule':{'seed':seed,'index':j,'background':'random greedy triangle-free; then random red subset; optimum re-solved'}}

def run(stage,seconds,per_graph,limit,seed):
 out=W/'evidence'/f'search_{stage}.jsonl'; summary=W/'evidence'/f'search_{stage}_summary.json'
 begin=time.monotonic();deadline=begin+seconds;counts=Counter();seen=set();worst=[]
 with (W/'evidence/compute.lock').open('a+') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX)
  with out.open('w') as f:
   for j,item in enumerate(generators(stage,seed)):
    if time.monotonic()>deadline:counts['stage_deadline']=1;break
    key=(item['n'],tuple(sorted(tuple(sorted(e)) for e in item['edges'])))
    if key in seen:counts['labelled_duplicates_skipped']+=1;continue
    seen.add(key);counts['attempted_graphs']+=1
    t=time.monotonic();rec={'input':item,'graph_hash':hashlib.sha256(json.dumps(key).encode()).hexdigest()}
    g=Graph(item['n'],item['edges'],min(per_graph,deadline-time.monotonic()))
    try:
     tau,covers,complete=g.covers(limit)
     rec.update(tau=tau,cover_scope='all optima' if complete else 'subset of optima',cover_count=len(covers))
     nu=len(g.packing());rec['nu']=nu
     # Same excluded T3 family gives the same eligible optimum; core memoizes it.
     records=[g.evaluate(c) for c in covers]
     rec.update(status='EXACT',triangles=g.triangles,records=records,
                max_D=max(r['D'] for r in records),min_margin=min(-r['D'] for r in records))
     counts['exact_graphs']+=1;counts['all_optima_graphs' if complete else 'subset_optima_graphs']+=1
     counts['exact_cover_pairs']+=len(covers)
     counts['covers_with_T3']+=sum(r['class_sizes'][2]>0 for r in records)
     counts['covers_requiring_two_red']+=sum(r['private_nu']<r['target'] for r in records)
     if rec['max_D']>0:
      counts['positive_candidates']+=1
      cand={**g.literal(),**max(records,key=lambda r:r['D']),'nu':nu,'input':item,'status':'CANDIDATE_UNCONFIRMED'}
      cp=W/'witnesses'/f'CANDIDATE_{stage}_{j}.json';cp.write_text(json.dumps(cand,indent=2)+'\n')
      print('CANDIDATE',cp,flush=True)
     if len(worst)<20 or rec['max_D']>=worst[-1]['D']:
      rr=max(records,key=lambda r:r['D']);worst.append({'name':item['name'],'n':g.n,'m':len(g.edges),'D':rr['D'],'tau':tau,'nu':nu,'eligible_nu':rr['eligible_nu'],'graph_hash':rec['graph_hash']})
      worst=sorted(worst,key=lambda x:(-x['D'],x['n'],x['m']))[:20]
    except (BudgetExceeded,RecursionError,MemoryError) as ex:
     rec.update(status='TIMEOUT' if isinstance(ex,BudgetExceeded) else type(ex).__name__,nodes=g.nodes)
     counts['unresolved_graphs']+=1
    rec['elapsed_seconds']=time.monotonic()-t
    f.write(json.dumps(rec,separators=(',',':'))+'\n');f.flush()
    if j%25==0 or rec.get('max_D',0)>0:
     print(stage,j,dict(counts),flush=True)
    if counts['positive_candidates']:break
    del g
 summary.write_text(json.dumps({'stage':stage,'seed':seed,'seconds_budget':seconds,'per_graph_seconds':per_graph,'cover_limit':limit,'counts':dict(counts),'worst':worst,'elapsed_seconds':time.monotonic()-begin,'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'dedup':'exact sorted labelled edge list only; no isomorphism quotient claimed'},indent=2)+'\n')
 print(summary.read_text(),flush=True)
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('stage');p.add_argument('--seconds',type=float,default=300);p.add_argument('--per-graph',type=float,default=2);p.add_argument('--limit',type=int,default=10000);p.add_argument('--seed',type=int,default=131102);a=p.parse_args()
 run(a.stage,a.seconds,a.per_graph,a.limit,a.seed)
