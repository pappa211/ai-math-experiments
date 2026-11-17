"""Certificate-only triangle restoration scan over the frozen complete domain.
Build feasible minimum covers of each literal C12, add one T edge, and test
all actual Q triangles. A failure is UNRESOLVED, never an optimum claim.
No packing/cover optimizer is imported. --benchmark takes one row per
(model,mode); otherwise every structurally retained row is processed.
"""
from pathlib import Path
from itertools import combinations,product
from datetime import datetime,timezone
from collections import Counter
import json,hashlib,sys,platform,time,argparse
root=Path(__file__).resolve().parents[1];start=time.monotonic()
def edge(u,v):return tuple(sorted((u,v)))
def te(t):return frozenset(combinations(sorted(t),2))
def triangles(n,E):return [t for t in combinations(range(n),3) if te(t)<=E]
def hits(C,TT):return all(C&te(t) for t in TT)
def cover_pool(C,tau):
 E={tuple(e) for e in C['edges']};TT=triangles(C['n'],E)
 if 'pieces' not in C:
  pool=[frozenset(D) for D in combinations(sorted(E),tau) if hits(set(D),TT)]
 else:
  root_vertices=set(C['pieces'][0]);RE=sorted(combinations(sorted(root_vertices),2));RT=list(combinations(sorted(root_vertices),3));leaves=[]
  for P0 in C['pieces'][1:]:
   P=set(P0);overlap=P&root_vertices;assert len(overlap)==2
   parent=tuple(sorted(overlap));LE=set(combinations(sorted(P),2));LT=list(combinations(sorted(P),3));local_tau=2*(len(P)-3)
   options={}
   for selected in(0,1):
    needed=local_tau-selected
    options[selected]=[frozenset(D) for D in combinations(sorted(LE-{parent}),needed) if hits(set(D)|({parent} if selected else set()),LT)]
    assert options[selected]
   leaves.append((parent,local_tau,options))
  pool=[]
  for bits in range(1<<len(RE)):
   D=frozenset(RE[i] for i in range(len(RE)) if bits>>i&1)
   if len(D)+sum(t-int(parent in D) for parent,t,_ in leaves)!=tau or not hits(D,RT):continue
   for local in product(*(options[int(parent in D)] for parent,_,options in leaves)):
    full=frozenset().union(D,*local);assert len(full)==tau and hits(full,TT);pool.append(full)
 pool=list(dict.fromkeys(pool));assert pool
 assert all(len(D)==tau and hits(D,TT) for D in pool)
 return pool
parser=argparse.ArgumentParser();parser.add_argument('--benchmark',action='store_true');parser.add_argument('--output',required=True);args=parser.parse_args()
paths=[root/'inputs/C12_frozen.json',root/'evidence/opening_checks.json',root/'evidence/matching26_triangle_domain.json',Path(__file__)]
source_hashes={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
models={r['name']:r for r in json.loads(paths[0].read_text())};opening={r['name']:r for r in json.loads(paths[1].read_text())['models']};domain=json.loads(paths[2].read_text())
work=[r for r in domain['rows'] if r['status']=='STRUCTURALLY_RETAINED']
if args.benchmark:
 seen=set();small=[]
 for r in work:
  key=(r['model'],r['mode'])
  if key not in seen:seen.add(key);small.append(r)
 work=small
pools={};rows=[];counts=Counter();pool_counts={}
for ent in work:
 name=ent['model'];C=models[name];E={tuple(e) for e in C['edges']};r=ent['nu_C'];assert r==opening[name]['optimum']['nu'];tau=2*r-1;assert opening[name]['optimum']['tau']==tau
 if name not in pools:pools[name]=cover_pool(C,tau);pool_counts[name]=len(pools[name])
 T=tuple(ent['T']);S=set(te(T));I=ent['old_outside_neighbors'];n=ent['n']
 if ent['mode']=='all_inside':Q=E|S
 else:
  a,b,c=T;Q=E|{edge(a,b)}|{edge(c,v) for v in (a,b,*I)}
 QT=triangles(n,Q);new=[t for t in QT if not te(t)<=E]
 witness=None
 for D in pools[name]:
  shared=set(S)
  for t in new:
   if not D&te(t):shared&=te(t)
   if not shared:break
  if shared:witness=sorted(set(D)|{min(shared)});break
 row={k:ent[k] for k in ('model','mode','T','old_outside_neighbors','n','nu_C')}
 if witness is None:row['status']='UNRESOLVED_NO_CONSTRUCTIVE_COVER'
 else:
  cov=set(witness);assert cov<=Q and hits(cov,QT)
  P=[tuple(t) for t in opening[name]['optimum']['packing']]+[T];used=set()
  for t in P:assert te(t)<=Q and not(used&te(t));used|=te(t)
  assert len(P)==r+1 and len(witness)<=2*len(P)-2
  row.update(status='REJECT_DEFECT_ONE_BY_BOUNDS',cover=witness,packing=P,cover_upper_bound=len(witness),packing_lower_bound=len(P),proved_defect_lower_bound=2*len(P)-len(witness))
 counts[row['status']]+=1;rows.append(row)
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==v for p,v in source_hashes.items())
result={'status':'BENCHMARK' if args.benchmark else('COMPLETE_RETAINED_DOMAIN_COVER_CERTIFICATES' if counts['UNRESOLVED_NO_CONSTRUCTIVE_COVER']==0 else 'PARTIAL_WITH_UNRESOLVED'),'utc':datetime.now(timezone.utc).isoformat(),'method':__doc__,'counts':dict(counts),'cover_pool_counts':pool_counts,'rows':rows,'source_hashes':source_hashes,'source_hashes_stable':True,'elapsed_seconds':time.monotonic()-start,'python':sys.version,'platform':platform.platform(),'processes':1,'solver_threads':0}
p=Path(args.output);p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:result[k] for k in ['status','counts','cover_pool_counts','elapsed_seconds']}));print(p)
