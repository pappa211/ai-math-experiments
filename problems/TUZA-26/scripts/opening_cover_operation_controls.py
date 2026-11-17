#!/usr/bin/env python3
"""Independent prescribed cover-control replay; no discovery or optimizer."""
from pathlib import Path
from itertools import combinations
from datetime import datetime,timezone
import json,hashlib,time,platform,sys,signal
start=time.monotonic();W=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
signal.signal(signal.SIGALRM,lambda *_: (_ for _ in ()).throw(TimeoutError('UNKNOWN_TIMEOUT')));signal.alarm(45)
def pair(a,b):return tuple(sorted([a,b]))
def clique(v):return frozenset(combinations(sorted(v),2))
def parse(E):return frozenset(tuple(e) for e in E)
def tri(E):
 V=sorted(set().union(*map(set,E)))
 return frozenset(t for t in combinations(V,3) if clique(t)<=E)
def packing(E,P,size):
 P=[tuple(t) for t in P];assert len(P)==size and set(P)<=tri(E)
 assert len(frozenset().union(*(clique(t) for t in P)))==3*size
 return True
def cover(E,F,size):
 F=parse(F);assert len(F)==size and F<=E and all(F&clique(t) for t in tri(E));return True
def components(E):
 T=tri(E);left=set(T);out=[]
 while left:
  todo=[left.pop()];seen=set(todo)
  while todo:
   t=todo.pop();new={u for u in left if clique(t)&clique(u)};todo.extend(new);seen|=new;left-=new
  out.append(seen)
 return out
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
paths=[W/'notes/double_cone_C5_cover_control_v1.md',W/'evidence/double_cone_C5_control.json',W/'evidence/matching26_book_controls.json',W/'evidence/opening_checks.json',W/'inputs/C12_frozen.json']
hashes={str(p):digest(p) for p in paths}
oldcone=json.loads(paths[1].read_text());book=json.loads(paths[2].read_text());baseline={r['name']:r for r in json.loads(paths[3].read_text())['models']}
rim=[0,1,6,4,5]
E=frozenset(pair(rim[i],rim[(i+1)%5]) for i in range(5))|frozenset(pair(h,v) for h in [2,3] for v in rim)|{(2,3)}
assert len(E)==16 and parse(oldcone['edges'])==E
T=tri(E);assert len(T)==15
assert set().union(*(set(clique(t)) for t in T))==set(E) and len(components(E))==1
assert min(sum(v in e for e in E) for v in range(7))==4
assert all(sum(v in e for e in E)%2==0 for v in range(7))
assert {v for v in range(7) if pair(0,v) in E and pair(1,v) in E}=={2,3}
P=[(0,2,3),(2,4,6),(1,3,6),(3,4,5)];assert packing(E,P,4)
K=E-{(0,1)};assert packing(K,P,4)
# Packing upper bound is the ordinary even-degree one-leftover-edge argument.
# Exact tau(Q)=6 is independently proved in the review; six-cover enumeration
# is used only for complete minimum-cover membership witnesses.
KT=tri(K);coversK=[];testedK=0
for F in combinations(sorted(K),5):
 testedK+=1;S=frozenset(F)
 if all(S&clique(t) for t in KT):coversK.append(S)
assert testedK==3003 and len(coversK)==7
PX={(0,2),(1,2)};PY={(0,3),(1,3)}
FX=[F for F in coversK if PX<=F];FY=[F for F in coversK if PY<=F]
assert len(FX)==len(FY)==1
assert FX[0]==parse(oldcone['K']['witness_cover_x']) and FY[0]==parse(oldcone['K']['witness_cover_y'])
AX=FX[0]-PX;AY=FY[0]-PY
assert len(AX)==len(AY)==3 and not AX&AY
assert min(len((F-PX)-(G-PY)) for F in FX for G in FY)==3
coversQ=[];testedQ=0;whole={}
for F in combinations(sorted(E),6):
 testedQ+=1;S=frozenset(F)
 if all(S&clique(t) for t in T):
  coversQ.append(S)
  for t in T:
   if clique(t)<=S:whole.setdefault(t,S)
assert testedQ==8008 and set(whole)==set(T)
assert cover(E,[(2,3)]+[pair(rim[i],rim[(i+1)%5]) for i in range(5)],6)
# Critical edge 24 in K: parity forces a hypothetical four-packing's two
# leftover edges to pair all four odd vertices, and no pairing is available.
D={(0,1),(2,4)};R=E-D;odd={v for v in range(7) if sum(v in e for e in R)%2}
assert odd=={0,1,2,4} and len(R)==14
pairings=[{(0,1),(2,4)},{(0,2),(1,4)},{(0,4),(1,2)}]
assert all(not M<=R for M in pairings)
assert packing(R,[(2,3,5),(1,2,6),(3,4,6)],3)
# Exchange-component structure for the two unique marked covers.
A=FX[0]-FY[0];B=FY[0]-FX[0];common=FX[0]&FY[0];adj={f:set() for f in A|B}
for t in KT:
 m=clique(t)
 if m&common:continue
 for a in A&m:
  for b in B&m:adj[a].add(b);adj[b].add(a)
left=set(adj);ex=[]
while left:
 todo=[left.pop()];seen=set(todo)
 while todo:
  a=todo.pop();new=adj[a]&left;todo.extend(new);seen|=new;left-=new
 assert len(seen&A)==len(seen&B)
 ex.append({'A':sorted(seen&A),'B':sorted(seen&B)})
assert len(ex)==1 and len(ex[0]['A'])==len(ex[0]['B'])==5
# Direct validation of every supplied witness in the two prescribed named
# controls; old exact Q optima are the already accepted opening baseline.
records=[]
for row in book['records']:
 name=row['model'];Q=parse(row['Q_edges']);k=row['Q_nu'];tau=row['Q_tau'];b=baseline[name]
 assert Q==parse(b['edges']) and (k,tau)==(b['optimum']['nu'],b['optimum']['tau'])
 e=tuple(row['deleted_edge']);L=Q-{e};assert L==parse(row['K_edges'])
 assert row['K_nu']==k and row['K_tau']==tau-1 and row['K_defect']==2
 packing(L,row['K_packing'],k);cover(L,row['K_cover'],tau-1)
 assert set().union(*(set(clique(t)) for t in tri(L)))==set(L)
 assert len(components(L))==row['K_triangle_component_count']
 assert {tuple(d['edge']) for d in row['K_single_deletion_packings']}==set(L)
 for d in row['K_single_deletion_packings']:
  assert d['nu']==k;packing(L-{tuple(d['edge'])},d['packing'],k)
 u,v=e;X={z for z in set().union(*map(set,Q)) if pair(u,z) in Q and pair(v,z) in Q}
 assert {d['apex'] for d in row['book_pair_rows']}==X
 for d in row['book_pair_rows']:
  z=d['apex'];sp={pair(u,z),pair(v,z)};assert parse(d['spoke_pair'])==sp
  assert d['nu_after_pair']==k-1 and d['tau_after_pair']==tau-3 and d['defect_after_pair']==2
  packing(L-sp,d['packing_after_pair'],k-1);cover(L-sp,d['cover_after_pair'],tau-3)
  cover(L,d['minimum_K_cover_containing_pair'],tau-1);assert sp<=parse(d['minimum_K_cover_containing_pair'])
 if name=='central_K4_star_555':
  d=row['Q_global_blocker_control'];deleted=parse(d['deleted_pair']);assert deleted=={(0,1),(2,3)}
  packing(Q-deleted,d['packing'],6)
  pieces=[(0,1,4,5,6),(0,2,7,8,9),(0,3,10,11,12)]
  assert all(any(clique(t)<=clique(p) for p in pieces) for t in tri(Q-deleted))
  S=Q-clique((1,2,3));comps=components(S)
  assert {frozenset().union(*(clique(t) for t in c)) for c in comps}=={clique(p) for p in pieces}
 records.append({'model':name,'edge_deletion_witnesses':len(row['K_single_deletion_packings']),'book_pair_witnesses':len(row['book_pair_rows']),'triangle_components':len(components(L)),'status':'ALL_LITERAL_WITNESSES_VALIDATED_WITH_ACCEPTED_Q_BOUNDS'})
assert hashes=={str(p):digest(p) for p in paths}
result={'status':'VERIFIED_FINITE_PRESCRIBED_CONTROLS','utc':datetime.now(timezone.utc).isoformat(),'method':'Literal graph reconstruction and exhaustive direct subset hitting checks for one prescribed seven-vertex graph; no discovery oracle, optimization or author-script import. Named controls replayed by direct witness checking against already accepted exact Q bounds.','double_cone':{'edges':sorted(E),'triangles':sorted(T),'K_five_subsets_tested':testedK,'K_minimum_covers':[sorted(F) for F in coversK],'K_minimum_cover_count':len(coversK),'marked_cover_counts':[len(FX),len(FY)],'outside_exchange_distance':3,'Q_six_subsets_tested':testedQ,'Q_minimum_cover_count':len(coversQ),'whole_triangle_minimum_covers':[{'triangle':t,'cover':sorted(whole[t])} for t in sorted(T)],'exchange_components':ex,'critical_K_edge':[2,4],'nu_Q_K':4,'tau_Q':6,'tau_K':5,'defect_Q':2,'defect_K':3,'K_resilient':False},'named_controls':records,'source_hashes':hashes,'source_hashes_stable':True,'checker_sha256':digest(Path(__file__)),'elapsed_seconds':time.monotonic()-start,'python':sys.version,'platform':platform.platform(),'processes':1,'solver_threads':0}
(W/'evidence/opening_cover_operation_controls.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':result['status'],'K_five_subsets_tested':testedK,'K_minimum_covers':len(coversK),'Q_six_subsets_tested':testedQ,'Q_minimum_covers':len(coversQ),'whole_triangle_witnesses':len(whole),'named_controls':records,'elapsed_seconds':result['elapsed_seconds']}))
