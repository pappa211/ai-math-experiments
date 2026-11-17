"""Independent exact P6 domain and all literal CS certificates; no producer imports."""
from pathlib import Path
from itertools import combinations
from collections import Counter
from copy import deepcopy
import json,hashlib,time
W=Path(__file__).resolve().parents[1];start=time.monotonic()
def sha(p):return hashlib.sha256((W/p).read_bytes()).hexdigest()
def es(x):
 E={tuple(sorted(e))for e in x};assert len(E)==len(x) and all(len(e)==2 and e[0]!=e[1]for e in E);return E
def ts(E):return {t for t in combinations(range(8),3)if set(combinations(t,2))<=E}
def mt(x,E):
 M=es(x);assert M<=E and len({u for e in M for u in e})==2*len(M);return M
def connected(E):
 V={0}
 while True:
  N=V|{x for e in E if set(e)&V for x in e}
  if N==V:return len(V)==8
  V=N
def ck(row):
 E=es(row['edges']);T=ts(E);assert T==set(map(tuple,row['triangles']))
 deg=[sum(v in e for e in E)for v in range(8)];assert row['degrees']==deg
 c=row['certificate'];kind=c['kind']
 if kind=='ORDINARY_BRANCH_AT_MOST_3':
  B=[v for v,d in enumerate(deg)if d>2];assert len(B)<=3 and B==c['branch_vertices']
  assert c['dependency_sha256']==sha('notes/three_branch_cs_link_exclusion_v1.md');return kind
 P=mt(c['P'],E);r=len(P);R=E-P;Q=set(c['Q']);assert len(Q)==len(c['Q']) and Q<=set(range(8))
 assert r>0 and len(Q)<=r and all(set(e)&Q for e in R)
 if kind=='STRICT':assert len(Q)<r;return kind
 assert len(Q)==r
 if kind in ('S_COLLAPSE','PAID_TRIANGLE_COLLAPSE'):
  S=set(c['S']);assert len(S)==len(c['S']) and S<=set(range(8))
  Z={v for e in P if set(e)&S for v in e if v not in S};RT={t for t in T if not set(t)&S}
  assert Z==set(c['S_mates']) and RT==set(map(tuple,c['remaining_actual_triangles']))
  assert r>len(S)+len(Z)+len(RT)
  assert bool(RT)==(kind=='PAID_TRIANGLE_COLLAPSE')
  assert c['dependency_sha256']==sha('notes/wke_residual_triangle_count_collapse_v1.md');return kind
 if kind=='TF_RESIDUAL_EQUAL_MATCHING':
  assert not ts(R) and len(mt(c['R_matching'],R))>=r
  assert c['dependency_sha256']==sha('notes/coordinator_TF_residual_equal_matching_exclusion_v1.md');return kind
 if kind=='B_INCOMPATIBLE':
  b=c['component'];BT=set(map(tuple,b['triangles']));assert BT and BT<=ts(R)
  S=set().union(*(set(combinations(t,2))for t in BT));V={v for e in S for v in e}
  assert S==es(b['support']) and V==set(b['vertices'])
  reached={next(iter(BT))}
  while True:
   nxt=reached|{t for t in BT if any(len(set(t)&set(u))==2 for u in reached)}
   if nxt==reached:break
   reached=nxt
  assert reached==BT and (len(V)>5 or any(tuple(sorted(e))not in R for e in combinations(V,2)));return kind
 assert kind=='RIM';t=tuple(c['T']);assert t in T;te=set(combinations(t,2));Z=mt(c['Z'],E)
 assert len(Z)>=r and te&P and not te&Z
 A=(te|Z)&R;assert A==es(c['footprint'])
 for size in range(2,6):
  for vs in combinations(range(8),size):
   CE=set(combinations(vs,2))
   if not CE<=R:continue
   B=A&CE;assert len(B)<=2 and (len(B)<2 or bool(set.intersection(*(set(e)for e in B))))
 return kind
expected={};raw=0
for mask in range(1<<12):
 raw+=1;A={v for v in range(6)if mask>>v&1};B={v for v in range(6)if mask>>(v+6)&1}
 E={(v,v+1)for v in range(5)}|{(v,6)for v in A}|{(v,7)for v in B}
 if any(sum(v in e for e in E)<2 for v in range(8))or not connected(E):continue
 expected[(sum(1<<v for v in A),sum(1<<v for v in B))]=E

def check(data):
 assert data['status']=='ALL_FIXED_DOMAIN_CERTIFIED' and data['raw_ordered_masks']==raw==4096
 assert data['domain_records']==data['processed']==len(data['rows'])==len(expected)==2018
 assert data['rejected_only_min_degree_or_connected']==4096-len(expected)
 seen=set();counts=Counter()
 for row in data['rows']:
  key=(row['a_mask'],row['b_mask']);assert key in expected and key not in seen;seen.add(key)
  assert row['n']==8 and es(row['edges'])==expected[key]
  assert row['a_neighbors']==[v for v in range(6)if key[0]>>v&1]
  assert row['b_neighbors']==[v for v in range(6)if key[1]>>v&1]
  counts[ck(row)]+=1
 assert seen==set(expected) and dict(counts)==data['counts'];return counts
D=json.loads((W/'evidence/challenger_p6_two_apex_interface.json').read_text());counts=check(D);controls=[]
def reject(name,fn):
 try:fn()
 except (AssertionError,KeyError,ValueError):controls.append({'name':name,'rejected':True});return
 raise AssertionError('Negative control accepted: '+name)
x=deepcopy(next(r for r in D['rows']if 'P'in r['certificate']));x['certificate']['P'].append(x['certificate']['P'][0]);reject('duplicate_P_edge',lambda:ck(x))
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='PAID_TRIANGLE_COLLAPSE'));x['certificate']['remaining_actual_triangles']=[];reject('omitted_paid_triangles',lambda:ck(x))
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='TF_RESIDUAL_EQUAL_MATCHING'));x['certificate']['R_matching']=x['certificate']['P'];reject('P_reused_as_residual_matching',lambda:ck(x))
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='RIM'));x['certificate']['T']=[0,0,1];reject('false_rim_triangle',lambda:ck(x))
x=deepcopy(D);x['rows'].pop();reject('missing_domain_record',lambda:check(x))
result={'status':'INDEPENDENTLY_VALIDATED_FINITE_INTERFACE','raw':4096,'eligible':2018,'rejected':4096-2018,'counts':dict(counts),'unknown':0,'negative_controls':controls,'elapsed_seconds':time.monotonic()-start,'inputs_sha256':{p:sha(p)for p in ['scripts/challenger_p6_two_apex_interface.py','evidence/challenger_p6_two_apex_interface.json','notes/coordinator_TF_residual_equal_matching_exclusion_v1.md','notes/wke_residual_triangle_count_collapse_v1.md','notes/three_branch_cs_link_exclusion_v1.md']},'scope':'Exactly P6 with two nonadjacent apices, all ordered neighborhoods, minimumdegree2 and connectedness only. Ordinary all-size reduction and arbitrary-outside certificate semantics are separate premises; no Lean claim.'}
(W/'evidence/coordinator_p6_interface_validation.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
