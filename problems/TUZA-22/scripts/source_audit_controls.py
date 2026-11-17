#!/usr/bin/env python3
"""TUZA-22 independently authored tiny controls; not Claude's missing pk.c replay."""
from pathlib import Path
import hashlib,itertools,json,os,subprocess,time,signal,functools,datetime
R=Path(__file__).resolve().parents[1]
O=R/'evidence/source_audit';O.mkdir(parents=True,exist_ok=True)
MAX_RSS_KIB=2200*1024
receipts=[]
def run(args,stdin=None,seconds=10):
 start=time.monotonic();p=subprocess.Popen(args,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,start_new_session=True)
 if stdin is not None: p.stdin.write(stdin.encode())
 p.stdin.close();p.stdin=None
 peak=0;status='COMPLETE'
 while p.poll() is None:
  out=subprocess.check_output(['/bin/ps','-axo','pid=,ppid=,rss='],text=True)
  proc={}
  for line in out.splitlines():
   z=line.split()
   if len(z)==3: proc[int(z[0])]=(int(z[1]),int(z[2]))
  ids={p.pid}
  while True:
   more={pid for pid,(ppid,rss) in proc.items() if ppid in ids}
   new=ids|more
   if new==ids:break
   ids=new
  rss=sum(proc.get(pid,(0,0))[1] for pid in ids);peak=max(peak,rss)
  if time.monotonic()-start>seconds or rss>MAX_RSS_KIB:
   status='TIMEOUT' if time.monotonic()-start>seconds else 'RSS_LIMIT'
   os.killpg(p.pid,signal.SIGTERM);break
  time.sleep(.01)
 try: stdout,stderr=p.communicate(timeout=2)
 except subprocess.TimeoutExpired:
  os.killpg(p.pid,signal.SIGKILL);stdout,stderr=p.communicate()
 receipt={'argv':args,'timeout_seconds':seconds,'elapsed_seconds':time.monotonic()-start,'sampled_peak_process_tree_rss_kib':peak,'rss_limit_kib':MAX_RSS_KIB,'status':status,'exit_code':p.returncode,'stdout':stdout.decode(),'stderr':stderr.decode()}
 receipts.append(receipt)
 if status!='COMPLETE' or p.returncode:raise RuntimeError(receipt)
 return receipt

def clique(v):return set(itertools.combinations(sorted(v),2))
def graph6(n,E):
 assert 0<=n<=16
 bits=[int((i,j) in E) for j in range(1,n) for i in range(j)]
 bits += [0]*((-len(bits))%6)
 return chr(63+n)+''.join(chr(63+sum(bits[i+j]<<(5-j) for j in range(6))) for i in range(0,len(bits),6))
def triangles(n,E):
 return [frozenset(itertools.combinations(t,2)) for t in itertools.combinations(range(n),3) if set(itertools.combinations(t,2))<=E]
def components(T):
 unseen=set(range(len(T)));comps=[]
 while unseen:
  seed=unseen.pop();c={seed};todo=[seed]
  while todo:
   i=todo.pop();new={j for j in unseen if T[i]&T[j]};unseen-=new;c|=new;todo.extend(new)
  comps.append(c)
 return comps
@functools.lru_cache(None)
def pack(T):
 if not T:return ()
 first=T[0]
 skip=pack(T[1:]);take=(first,)+pack(tuple(t for t in T[1:] if not set(t)&set(first)))
 return take if len(take)>len(skip) else skip
@functools.lru_cache(None)
def cover(T,allowed):
 if not T:return ()
 candidates=set(T[0])&set(allowed)
 if not candidates:return None
 best=None
 for e in candidates:
  rest=cover(tuple(t for t in T if e not in t),allowed)
  if rest is not None:
   candidate=(e,)+rest
   if best is None or len(candidate)<len(best):best=candidate
 return best

def inspect(n,E):
 T=triangles(n,E);comps=components(T);rows=[];nu=tau=0;B=True
 for c in comps:
  S=set().union(*(T[i] for i in c));V=set().union(*(set(e) for e in S));literal=len(V) in (4,5) and S==clique(V)
  tt=tuple(tuple(sorted(T[i])) for i in sorted(c));p=pack(tt);cv=cover(tt,tuple(sorted(S)))
  rows.append({'vertices':sorted(V),'edges':sorted(S),'triangles':len(c),'literal_K4_K5':literal,'nu':len(p),'tau':len(cv),'packing':p,'cover':cv})
  nu+=len(p);tau+=len(cv);B&=literal
 return {'n':n,'edges':sorted(E),'triangle_count':len(T),'nu':nu,'tau':tau,'B':B,'components':rows}

cases={
 'empty':(0,set()),'isolates':(4,set()),'path6':(6,{(i,i+1) for i in range(5)}),
 'K3':(3,clique(range(3))),'K4':(4,clique(range(4))),'K5':(5,clique(range(5))),
 'K6':(6,clique(range(6))),
 'disjoint_K4_K4':(8,clique(range(4))|clique(range(4,8))),
 'vertex_shared_K4_K5':(8,clique(range(4))|clique([0,4,5,6,7])),
 'K4_with_trianglefree_edge':(6,clique(range(4))|{(4,5)}),
 'two_K4_edge_shared':(6,clique(range(4))|clique([0,1,4,5])),
}
source=R/'sources/claude/eq.c';binary=O/'claude_eq_original'
run(['/usr/bin/clang','-O2','-Wall','-Wextra',str(source),'-o',str(binary)],seconds=30)
rows={}
for name,(n,E) in cases.items():
 row=inspect(n,E);row['graph6']=graph6(n,E)
 row['original_replay']=run([str(binary)],row['graph6']+'\n',seconds=5)
 expected_tight=int(row['triangle_count']>0 and row['tau']==2*row['nu'])
 expected_slack=int(row['triangle_count']>0 and row['tau']==2*row['nu']-1)
 expected=f'graphs=1 tight={expected_tight} tight_nonblock=0 slack_exactly_one={expected_slack}\n'
 assert row['original_replay']['stderr']==expected, (name,row['original_replay'],expected)
 assert row['original_replay']['stdout']=='', (name,row['original_replay'])
 row['original_matches_independent_classification']=True
 rows[name]=row
# Every actual triangle of the Cartesian product stays in a row or a column.
E=set()
for a in range(20):
 for b in range(a+1,20):
  if a//5==b//5 or a%5==b%5:E.add((a,b))
rows['K4_cartesian_K5']=inspect(20,E)
# Independent PK construction and all-maximum-packing enumeration on tiny controls.
pkrows={}
for name in ['K4','K5']:
 n,E=cases[name];T=triangles(n,E);nu=rows[name]['nu'];records=[]
 for chosen in itertools.combinations(range(len(T)),nu):
  U=set().union(*(T[i] for i in chosen))
  if len(U)!=3*nu:continue
  A=set(U)
  for i in chosen:
   verts=set().union(*(set(e) for e in T[i]))
   for w in set(range(n))-verts:
    K=clique(verts|{w})
    if K<=E and all(len(t&U)==1 for t in triangles(n,K) if t!=T[i]):A|=K
  tt=tuple(tuple(sorted(t)) for t in T);cv=cover(tt,tuple(sorted(A)))
  records.append({'triangle_indices':chosen,'allowed_edges':sorted(A),'permitted_cover_optimum':None if cv is None else len(cv),'budget_2nu_pass':cv is not None and len(cv)<=2*nu,'budget_2nu_minus_1_pass':cv is not None and len(cv)<=2*nu-1})
 pkrows[name]={'maximum_packing_count':len(records),'records':records}
result={'identity':'TUZA22-independent-tiny-source-controls-v1','created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'original_source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'original_binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'original_input_domain':'Explicit short graph6, n<=8; no census completeness asserted','original_controls':rows,'independent_PK_controls':pkrows,'process_receipts':receipts}
(O/'controls.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({name:{k:r[k] for k in ('n','triangle_count','nu','tau','B')} for name,r in rows.items()},indent=2))
print(json.dumps({name:{'maximum_packing_count':r['maximum_packing_count'],'positive_all':all(p['budget_2nu_pass'] for p in r['records']),'negative_all_rejected':not any(p['budget_2nu_minus_1_pass'] for p in r['records'])} for name,r in pkrows.items()},indent=2))
