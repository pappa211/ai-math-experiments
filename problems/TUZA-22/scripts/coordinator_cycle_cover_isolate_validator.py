"""Independent exact P6 domain and all literal CS certificates; no producer imports."""
from pathlib import Path
from itertools import combinations, combinations_with_replacement
from collections import Counter
from copy import deepcopy
import json,hashlib,time
W=Path(__file__).resolve().parents[1];start=time.monotonic()
def sha(p):return hashlib.sha256((W/p).read_bytes()).hexdigest()
def es(x):
 E={tuple(sorted(e))for e in x};assert len(E)==len(x) and all(len(e)==2 and e[0]!=e[1]for e in E);return E
def ts(n,E):return {t for t in combinations(range(n),3)if set(combinations(t,2))<=E}
def mt(x,E):
 M=es(x);assert M<=E and len({u for e in M for u in e})==2*len(M);return M
def connected(E,n):
 V={0}
 while True:
  N=V|{x for e in E if set(e)&V for x in e}
  if N==V:return len(V)==n
  V=N
def ck(row):
 n=row['n'];E=es(row['edges']);T=ts(n,E);assert T==set(map(tuple,row['triangles']))
 deg=[sum(v in e for e in E)for v in range(n)];assert row['degrees']==deg
 c=row['certificate'];kind=c['kind']
 if kind=='ORDINARY_BRANCH_AT_MOST_3':
  B=[v for v,d in enumerate(deg)if d>2];assert len(B)<=3 and B==c['branch_vertices']
  assert c['dependency_sha256']==sha('notes/three_branch_cs_link_exclusion_v1.md');return kind
 if kind=='ORDINARY_APEX_UNICYCLIC':
  apex=c['w'];assert apex in range(n);V=set(range(n))-{apex};RE={e for e in E if apex not in e}
  assert RE==es(c['remainder_edges']) and len(RE)==len(V)
  reached={min(V)}
  while True:
   nxt=reached|{v for e in RE if set(e)&reached for v in e}
   if nxt==reached:break
   reached=nxt
  assert reached==V and c['dependency_sha256']==sha('notes/apex_unicyclic_full_exclusion_ordinary_v2.md');return kind
 P=mt(c['P'],E);r=len(P);R=E-P;Q=set(c['Q']);assert len(Q)==len(c['Q']) and Q<=set(range(n))
 assert r>0 and len(Q)<=r and all(set(e)&Q for e in R)
 if kind=='STRICT':assert len(Q)<r;return kind
 assert len(Q)==r
 if kind=='WKE_MAX_DEGREE_TWO_RESIDUAL':
  rd=[sum(v in e for e in R)for v in range(n)]
  assert max(rd,default=0)<=2 and rd==c['residual_degrees']
  assert c['dependency_sha256']==sha('notes/coordinator_WKE_degree_two_residual_exclusion_v1.md');return kind
 if kind in ('S_COLLAPSE','PAID_TRIANGLE_COLLAPSE'):
  S=set(c['S']);assert len(S)==len(c['S']) and S<=set(range(n))
  Z={v for e in P if set(e)&S for v in e if v not in S};RT={t for t in T if not set(t)&S}
  assert Z==set(c['S_mates']) and RT==set(map(tuple,c['remaining_actual_triangles']))
  assert r>len(S)+len(Z)+len(RT)
  assert bool(RT)==(kind=='PAID_TRIANGLE_COLLAPSE')
  assert c['dependency_sha256']==sha('notes/wke_residual_triangle_count_collapse_v1.md');return kind
 if kind=='TF_RESIDUAL_EQUAL_MATCHING':
  assert not ts(n,R) and len(mt(c['R_matching'],R))>=r
  assert c['dependency_sha256']==sha('notes/coordinator_TF_residual_equal_matching_exclusion_v1.md');return kind
 if kind=='B_INCOMPATIBLE':
  b=c['component'];BT=set(map(tuple,b['triangles']));assert BT and BT<=ts(n,R)
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
  for vs in combinations(range(n),size):
   CE=set(combinations(vs,2))
   if not CE<=R:continue
   B=A&CE;assert len(B)<=2 and (len(B)<2 or bool(set.intersection(*(set(e)for e in B))))
 return kind

# Independently generate all nonempty path partitions with matching cost<=2.
orders=[]
for count in (1,2):
 for lengths in combinations_with_replacement(range(2,6),count):
  if sum(x//2 for x in lengths)<=2:orders.append(lengths)
assert len(orders)==7
expected={};shape_counts={};raw=0;rejectdc=0;rejectk4=0
for lengths in orders:
 nf=sum(lengths)+1;n=nf+2;offset=0;FE=set()
 for length in lengths:
  FE|={(i,i+1)for i in range(offset,offset+length-1)};offset+=length
 sid='P'+'_P'.join(map(str,lengths))+'_I1'
 stats={'raw':0,'eligible':0,'rejected_degree_connected':0,'rejected_k4':0};shape_counts[sid]=stats
 for mask in range(1<<(2*nf)):
  raw+=1;stats['raw']+=1;am=mask&((1<<nf)-1);bm=mask>>nf
  E=FE|{(v,nf)for v in range(nf)if am>>v&1}|{(v,nf+1)for v in range(nf)if bm>>v&1}
  if any(sum(v in e for e in E)<2 for v in range(n))or not connected(E,n):
   rejectdc+=1;stats['rejected_degree_connected']+=1;continue
  if any(set(combinations(C,2))<=E for C in combinations(range(n),4)):
   rejectk4+=1;stats['rejected_k4']+=1;continue
  stats['eligible']+=1;expected[(sid,am,bm)]=(n,nf,lengths,FE,E)

def check(data):
 assert data['status']=='ALL_FIXED_DOMAIN_CERTIFIED'
 assert data['raw_ordered_states']==raw==26944
 assert data['domain_records']==data['processed']==len(data['rows'])==len(expected)==2422
 assert data['rejected_degree_connected']==rejectdc==24522 and data['rejected_k4']==rejectk4==0
 assert len(data['shape_records'])==7
 for s in data['shape_records']:
  assert s['id'] in shape_counts
  for k,v in shape_counts[s['id']].items():assert s[k]==v
 seen=set();counts=Counter()
 for row in data['rows']:
  key=(row['shape'],row['a_mask'],row['b_mask']);assert key in expected and key not in seen;seen.add(key)
  n,nf,lengths,FE,E=expected[key]
  assert row['n']==n and row['n_F']==nf and row['path_orders']==list(lengths) and row['isolates']==1
  assert row['a']==nf and row['b']==nf+1 and row['ab']==0
  assert es(row['F_edges'])==FE and es(row['edges'])==E
  assert row['a_neighbors']==[v for v in range(nf)if key[1]>>v&1]
  assert row['b_neighbors']==[v for v in range(nf)if key[2]>>v&1]
  counts[ck(row)]+=1
 assert seen==set(expected) and dict(counts)==data['counts'];return counts
D=json.loads((W/'evidence/challenger_cycle_cover_isolate_interface.json').read_text());counts=check(D);controls=[]
def reject(name,fn):
 try:fn()
 except (AssertionError,KeyError,ValueError):controls.append({'name':name,'rejected':True});return
 raise AssertionError('Negative control accepted: '+name)
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='ORDINARY_APEX_UNICYCLIC'));x['certificate']['remainder_edges'].pop();reject('false_unicyclic_remainder',lambda:ck(x))
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='PAID_TRIANGLE_COLLAPSE'));x['certificate']['remaining_actual_triangles']=[];reject('omitted_paid_triangle',lambda:ck(x))
x=deepcopy(next(r for r in D['rows']if r['certificate']['kind']=='TF_RESIDUAL_EQUAL_MATCHING'));x['certificate']['R_matching']=x['certificate']['P'];reject('matching_not_residual',lambda:ck(x))
x=deepcopy(D);x['rows'].pop();reject('missing_domain_record',lambda:check(x))
x=deepcopy(D);x['rows'][0]['a_mask']^=1;reject('wrong_apex_mask',lambda:check(x))
result={'status':'INDEPENDENTLY_VALIDATED_FINITE_SUBDOMAIN','raw':raw,'eligible':len(expected),'rejected_degree_connected':rejectdc,'rejected_k4':rejectk4,'independent_path_partitions':orders,'shape_counts':shape_counts,'counts':dict(counts),'unknown':0,'negative_controls':controls,'elapsed_seconds':time.monotonic()-start,'checker_reuse':'Independent coordinator P6 literal-checker kernel generalized to variable n; no producer code imported','inputs_sha256':{p:sha(p)for p in ['scripts/challenger_cycle_cover_isolate_interface.py','evidence/challenger_cycle_cover_isolate_interface.json','notes/apex_unicyclic_full_exclusion_ordinary_v2.md','notes/coordinator_TF_residual_equal_matching_exclusion_v1.md','notes/wke_residual_triangle_count_collapse_v1.md']},'scope':'Exactlyseven nonempty path partitions of matchingcost<=2, oneisolate, two nonadjacentapices, allorderedneighborhoods. Separateordinarydomain/globaltransport proofs required; no completeoriginal14shape result.'}
(W/'evidence/coordinator_cycle_cover_isolate_validation.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
