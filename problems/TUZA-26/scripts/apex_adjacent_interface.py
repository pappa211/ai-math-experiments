"""Frozen complete C12 plus one outside center interface, domain/exact phases."""
from apex_exact import *
from collections import Counter
from pathlib import Path
import argparse,json,time,resource,signal
SRC='problems/TUZA-25/evidence/residual_edge_exchange_seeds.json'
def component(V,E):
 if not V:return set()
 seen={min(V)}
 while True:
  nxt=seen|{v for u,v in E if u in seen and v in V}|{u for u,v in E if v in seen and u in V}
  if nxt==seen:return seen
  seen=nxt
def separator(V,E):
 V=set(V)
 for k in [0,1,2]:
  for S in combinations(sorted(V),k):
   rem=V-set(S);part=component(rem,E)
   if part!=rem:return {'deleted_vertices':S,'component':sorted(part),'other_vertices':sorted(rem-part)}
 return None
def domain(seeds):
 rows=[];counts=Counter()
 for seed in seeds:
  E=set(map(tuple,seed['edges']));V=range(seed['n']);a=seed['n']
  assert not any(not(clique(I)&E) for I in combinations(V,4))
  for size in [4,5]:
   for A in combinations(V,size):
    counts['all_size4_or5_neighborhoods']+=1
    ws=[pair for pair in combinations(A,2) if not(clique(set(A)-set(pair))&E)]
    if not ws:counts['no_independent_remainder']+=1;continue
    counts['labelled_neighborhoods_in_domain']+=1;counts['restoration_pair_presentations']+=len(ws)
    Q=E|{edge(a,v) for v in A};row={'seed':seed['name'],'A':A,'outside_center':a,'restored_pair_witness':ws[0],'restoration_pair_count':len(ws)}
    bad=next((v for v in range(a+1) if sum(v in e for e in Q)<4),None)
    if bad is not None:row.update({'status':'REJECT_MIN_DEGREE','vertex':bad,'degree':sum(bad in e for e in Q)})
    else:
     bad=next((v for v in A if not any(v!=w and edge(v,w) in E for w in A)),None)
     if bad is not None:row.update({'status':'REJECT_UNSUPPORTED_APEX_EDGE','vertex':bad})
     else:
      sep=separator(range(a+1),Q)
      if sep is not None:row.update({'status':'REJECT_VERTEX_SEPARATOR','separator':sep})
      else:row['status']='STRUCTURALLY_RETAINED'
    counts[row['status']]+=1;rows.append(row)
 return {'status':'COMPLETE_DOMAIN_GENERATION','source':SRC,'counts':dict(counts),'rows':rows}
def exact(seeds,dom):
 counts=Counter();rows=[];tables=[];unknown=[];start=time.time()
 class Timeout(Exception):pass
 def alarm(*_):raise Timeout()
 signal.signal(signal.SIGALRM,alarm)
 for seed in seeds:
  work=[r for r in dom['rows'] if r['seed']==seed['name'] and r['status']=='STRUCTURALLY_RETAINED']
  if not work:continue
  E=set(map(tuple,seed['edges']));X=Solver(E);r=X.nu();pairs={};table=[]
  for e,f in combinations(X.E,2):
   if set(e)&set(f):continue
   P=X.pack(X.remaining([e,f]));value=len(P);assert value in [r,r-1]
   pairs[(e,f)]=value;table.append({'matching':[e,f],'nu_after_deletion':value,'packing':[X.T[i] for i in P]})
  tables.append({'seed':seed['name'],'nu_C':r,'matching_pairs':table})
  for ent in work:
   A=set(ent['A']);a=seed['n'];row=dict(ent);Q=E|{edge(a,v) for v in A};inside=[e for e in X.E if set(e)<=A]
   M=next(((e,f) for e,f in combinations(inside,2) if not(set(e)&set(f)) and pairs[(e,f)]==r),None)
   counts['structurally_retained']+=1
   if M:row.update({'status':'REJECT_PACKING_GAIN_TWO','matching':M,'nu_lower_bound':r+2});counts[row['status']]+=1;rows.append(row);continue
   counts['exact_required_packing_profile']+=1;Y=Solver(Q)
   try:
    signal.setitimer(signal.ITIMER_REAL,20);C=Y.cover(Y.all);tau=len(C);oldP=X.pack(X.remaining([inside[0]]));assert len(oldP)==r;packing=[X.T[i] for i in oldP]+[tuple(sorted((a,)+inside[0]))];row.update({'nu_Q':r+1,'tau_Q':tau,'cover':C,'packing_lower_bound':packing})
    if tau!=2*r+1:row['status']='REJECT_COVER_PROFILE'
    else:row['status']='DEFECT_ONE_CANDIDATE';row['certificate']=Y.certificate();assert row['certificate']['nu']==r+1
    counts[row['status']]+=1;rows.append(row)
   except Timeout:row['status']='UNKNOWN_TIMEOUT';unknown.append(row);rows.append(row);counts['UNKNOWN_TIMEOUT']+=1
   finally:signal.setitimer(signal.ITIMER_REAL,0);Y.pack.cache_clear();Y.cover.cache_clear()
  X.pack.cache_clear();X.cover.cache_clear();print(seed['name'],dict(counts),round(time.time()-start,3),flush=True)
 return {'status':'PARTIAL_UNKNOWN' if unknown else 'VERIFIED_FINITE_COMPLETE_DOMAIN','counts':dict(counts),'rows':rows,'old_matching_tables':tables,'seconds':time.time()-start,'maxrss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'unknown':unknown}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('phase',choices=['domain','exact']);p.add_argument('output');p.add_argument('--domain-file');args=p.parse_args();start=time.time();seeds=json.load(open(SRC))
 result=domain(seeds) if args.phase=='domain' else exact(seeds,json.load(open(args.domain_file)))
 result['total_seconds']=time.time()-start;Path(args.output).write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({'phase':args.phase,'status':result['status'],'counts':result['counts'],'seconds':result['total_seconds']}),flush=True)
