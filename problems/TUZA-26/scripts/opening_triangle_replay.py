#!/usr/bin/env python3
"""Independent finite-domain and witness replay for triangle restoration.
No author generator import and no optimization. Literal C12 is rebuilt below;
for outside presentations, independent neighbor sets are chosen before bases.
"""
from pathlib import Path
from itertools import combinations, combinations_with_replacement
from collections import Counter
from datetime import datetime,timezone
import json,hashlib,platform,sys,time,signal
START=time.monotonic()
W=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
signal.signal(signal.SIGALRM,lambda *_: (_ for _ in ()).throw(TimeoutError('UNKNOWN_TIMEOUT')))
signal.alarm(45)
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
inputs=[W/'inputs/C12_frozen.json',W/'evidence/opening_checks.json',W/'evidence/matching26_triangle_domain.json',W/'evidence/matching26_triangle_cover_certificates.json']
hashes={str(p):digest(p) for p in inputs}
def edges(v):return frozenset(combinations(sorted(v),2))
def triangles(n,E):return frozenset(t for t in combinations(range(n),3) if edges(t)<=E)
def Eparse(a):return frozenset(tuple(sorted(e)) for e in a)
def rowkey(r):return (r['model'],r['mode'],tuple(r['T']),tuple(r['old_outside_neighbors']))
models=[]
for count in range(1,4):
 for sizes in combinations_with_replacement([4,5],count):
  pieces=[(0,1,2,3)];n=4
  for j,size in enumerate(sizes,1):
   pieces.append((0,j)+tuple(range(n,n+size-2)));n+=size-2
  models.append(('central_K4_star_'+''.join(map(str,sizes)),n,frozenset().union(*(edges(p) for p in pieces))))
models += [('two_K5_edge',8,edges(range(5))|edges([0,1,5,6,7])),('W5',6,frozenset(tuple(sorted([i,(i+1)%5])) for i in range(5))|frozenset((i,5) for i in range(5))),('K5-e',5,edges(range(5))-{(3,4)})]
frozen={r['name']:r for r in json.loads(inputs[0].read_text())}
old={r['name']:r for r in json.loads(inputs[1].read_text())['models']}
assert set(frozen)==set(old)=={name for name,_,_ in models}
domain=json.loads(inputs[2].read_text());cert=json.loads(inputs[3].read_text())
D={rowkey(r):r for r in domain['rows']};C={rowkey(r):r for r in cert['rows']}
assert len(D)==len(domain['rows']) and len(C)==len(cert['rows'])
seen=set();survivors=set();status=Counter();modes=Counter();modelcounts={};maxorder=0

def connected(n,E,deleted):
 V=set(range(n))-set(deleted)
 if not V:return True
 todo=[min(V)]; reached=set(todo)
 while todo:
  u=todo.pop()
  for v in V-reached:
   if tuple(sorted([u,v])) in E: reached.add(v);todo.append(v)
 return reached==V

def check(name,n0,E0,T,I,mode):
 global maxorder
 n=n0+(mode=='one_outside');s=edges(T);E=E0|s
 if mode=='one_outside':E=E|frozenset(tuple(sorted([n0,v])) for v in I)
 key=(name,mode,T,I);assert key not in seen;seen.add(key);assert key in D
 row=D[key];r=old[name]['optimum']['nu'];assert row['n']==n and row['nu_C']==r
 F=triangles(n,E);F0=triangles(n,E-s);assert F0==triangles(n0,E0)
 assert T in F and not s&E0
 masks={t:edges(t) for t in F};used=frozenset().union(*masks.values())
 degrees={v:sum(v in e for e in E) for v in range(n)}
 modekey=mode+'_raw';modes[modekey]+=1;modelcounts[name][modekey]+=1
 result=row['status'];status[result]+=1;modelcounts[name][result]+=1
 if result=='REJECT_MIN_DEGREE':
  v=row['vertex'];assert v in degrees and degrees[v]==row['degree']<4
 elif result=='REJECT_UNSUPPORTED_EDGE':
  e=tuple(row['edge']);assert e in E and e not in used
 elif result=='REJECT_TRIANGLE_PAIR_BLOCKER':
  e=tuple(row['inactive_restored_edge']);pair=Eparse(row['deleted_pair'])
  assert e in s and pair==s-{e} and len(pair)==2
  assert triangles(n,E-pair)==F0
 elif result=='REJECT_VERTEX_SEPARATOR':
  sep=row['separator'];cut=set(sep['deleted_vertices']);A=set(sep['component']);B=set(sep['other_vertices'])
  assert len(cut)<=2 and A and B and not(A&B or A&cut or B&cut)
  assert A|B|cut==set(range(n))
  assert all(not((u in A and v in B) or(u in B and v in A)) for u,v in E)
 elif result=='STRUCTURALLY_RETAINED':
  assert min(degrees.values())>=4 and used==E
  assert all(triangles(n,E-(s-{e}))!=F0 for e in s)
  assert all(connected(n,E,cut) for size in range(3) for cut in combinations(range(n),size))
  survivors.add(key);maxorder=max(maxorder,n);assert key in C
  proof=C[key];assert proof['n']==n and proof['nu_C']==r
  cover=Eparse(proof['cover']);assert len(cover)==len(proof['cover']) and cover<=E
  assert all(cover&m for m in masks.values())
  pack=tuple(tuple(sorted(t)) for t in proof['packing']);assert len(set(pack))==len(pack)
  assert set(pack)<=F and T in pack and set(pack)-{T}<=F0
  assert sum(len(masks[t]) for t in pack)==len(frozenset().union(*(masks[t] for t in pack)))
  L=len(pack);U=len(cover)
  assert L==r+1 and U==2*r and U<=2*L-2
  assert proof['packing_lower_bound']==L and proof['cover_upper_bound']==U
  assert proof['proved_defect_lower_bound']==2*L-U==2
  assert proof['status']=='REJECT_DEFECT_ONE_BY_BOUNDS'
 else:raise AssertionError(result)

for name,n,E in models:
 modelcounts[name]=Counter()
 assert frozen[name]['n']==old[name]['n']==n
 assert E==Eparse(frozen[name]['edges'])==Eparse(old[name]['edges'])
 assert any(all(tuple(sorted([v,u])) in E for u in range(n) if u!=v) for v in range(n))
 assert not any(not(edges(I)&E) for I in combinations(range(n),4))
 for T in combinations(range(n),3):
  if not(edges(T)&E):check(name,n,E,T,(),'all_inside')
 # Independent-I-first enumeration; author instead chooses internal nonedge first.
 for size in [2,3]:
  for I in combinations(range(n),size):
   if edges(I)&E:continue
   other=[v for v in range(n) if v not in I]
   for a,b in combinations(other,2):
    if (a,b) not in E:check(name,n,E,(a,b,n),I,'one_outside')
assert seen==set(D) and survivors==set(C)
assert modes==Counter({'all_inside_raw':160,'one_outside_raw':6512})
assert status==Counter({'REJECT_MIN_DEGREE':3267,'REJECT_UNSUPPORTED_EDGE':2558,'REJECT_TRIANGLE_PAIR_BLOCKER':72,'REJECT_VERTEX_SEPARATOR':645,'STRUCTURALLY_RETAINED':130})
assert Counter(domain['counts'])==modes+status
assert {k:dict(v) for k,v in modelcounts.items()}==domain['model_counts']
assert Counter(k[1] for k in survivors)==Counter({'all_inside':36,'one_outside':94})
assert hashes=={str(p):digest(p) for p in inputs}
result={'status':'VERIFIED_FINITE_INDEPENDENT_REPLAY','utc':datetime.now(timezone.utc).isoformat(),'method':'Independent literal C12 construction, independent-I-first domain generation, actual triangle reconstruction, every supplied rejection witness checked, structural survivors independently filtered, bijective cover certificate matching, direct cover and packing validation. No optimizer or author-script import.','scope':'Exactly 160 internal triples and 6512 one-outside presentations; all-size reduction remains a separate ordinary proof obligation. No classification of arbitrary defect-one or defect-two graphs.','counts':dict(modes+status),'retained_by_mode':dict(Counter(k[1] for k in survivors)),'max_retained_order':maxorder,'source_hashes':hashes,'sources_stable':True,'checker_sha256':digest(Path(__file__)),'python':sys.version,'executable':sys.executable,'platform':platform.platform(),'processes':1,'solver_threads':0,'elapsed_seconds':time.monotonic()-START}
(W/'evidence/opening_triangle_replay.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['status','counts','retained_by_mode','max_retained_order','elapsed_seconds']}))
