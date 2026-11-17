#!/usr/bin/env python3
"""Independent set-based P3+edge necessary-interface completeness checker.
Enumerates bare and old graphs directly, not via the author's bitmask code.
The actual bare vertex set excludes unused dummy5. Two generic outside labels
preserve equal/distinct apex intersections on adjacent bases.
"""
from pathlib import Path
from itertools import combinations,permutations,product
from hashlib import sha256
from datetime import datetime,timezone
import json,time,platform,sys,signal
START=time.monotonic();W=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
signal.signal(signal.SIGALRM,lambda *_: (_ for _ in ()).throw(TimeoutError('UNKNOWN_TIMEOUT')));signal.alarm(120)
def edge(a,b):return tuple(sorted((a,b)))
def K(V):return frozenset(combinations(sorted(V),2))
def subs(seq):
 for k in range(len(seq)+1):
  for t in combinations(seq,k):yield frozenset(t)
S=((0,1),(1,2),(3,4));SS=frozenset(S)
X=((0,3),(0,4),(1,3),(1,4),(2,3),(2,4),(0,5),(1,5),(2,5));Z=tuple(sorted(K(range(6))-SS));tri=tuple(K(t) for t in combinations(range(6),3))
def pages(E,i,outside=False):
 a,b=S[i]
 return {x:K((a,b,x)) for x in range(8 if outside else 6) if x not in(a,b) and (x>=6 or {edge(a,x),edge(b,x)}<=E)}
def disjoint3(A,B,C):return not(A&B or A&C or B&C)
def compatible(i,x,j,y):return bool(set(S[i])&set(S[j])) or x==y or x in S[j] or y in S[i]
def conflict(i,x,P,j,y,Q,F):
 if P&Q or not compatible(i,x,j,y):return False
 k=next(z for z in range(3) if z not in(i,j))
 return any(not(T&P or T&Q) for T in F[k].values())
retained={};n=0
for E0 in subs(X):
 n+=1
 if any(T<=E0 for T in tri):continue
 F=[pages(E0,i) for i in range(3)]
 if any(not f for f in F):continue
 used=frozenset().union(*(P-SS for f in F for P in f.values()))
 if used!=E0:continue
 if any(disjoint3(*t) for t in product(*(list(f.values()) for f in F))):continue
 retained[E0]=F
assert n==512
perms=[p for p in permutations(range(6)) if frozenset(edge(p[a],p[b]) for a,b in S)==SS]
assert len(perms)==4
source=W/'evidence/matching26_disconnected_path_geometry_v2.json';auth=json.loads(source.read_text())
covered=set();rows=[];survivors=[];ext_count=0
for ar in auth['skeletons']:
 E0=frozenset(map(tuple,ar['bare_edges']));assert E0 in retained
 bits=sum(1<<X.index(e) for e in E0);assert bits==ar['bits']
 orbit={frozenset(edge(p[a],p[b]) for a,b in E0) for p in perms}
 assert orbit<=set(retained) and not(orbit&covered);covered|=orbit
 F=retained[E0];assert [sorted(f) for f in F]==ar['bare_apices']
 extensions={};considered=0
 for add in subs(tuple(e for e in Z if e not in E0)):
  considered+=1;E=E0|add
  if any(T<=E and T&E0 for T in tri):continue
  actual=[pages(E,i) for i in range(3)];possible=[pages(E,i,True) for i in range(3)]
  if any(conflict(i,x,P,j,y,Q,F) for i,j in combinations(range(3),2) for x,P in actual[i].items() for y,Q in actual[j].items()):continue
  allowed=[]
  for i in range(3):
   j,k=[v for v in range(3) if v!=i]
   f={}
   for x,P in possible[i].items():
    if any(disjoint3(P,A,B) for A,B in product(F[j].values(),F[k].values())):continue
    if any(conflict(i,x,P,z,y,Q,F) for z in range(3) if z!=i for y,Q in actual[z].items()):continue
    f[x]=P
   allowed.append(f)
  witnesses=[]
  for i in range(3):
   j,k=[z for z in range(3) if z!=i]
   pairs=[(x,y) for x,P in allowed[j].items() for y,Q in allowed[k].items() if not(P&Q) and all(T&P or T&Q for T in F[i].values())]
   if not pairs:break
   witnesses.append(pairs)
  if len(witnesses)<3:continue
  extensions[tuple(sorted(E))]={'allowed_ordinary_apices':[sorted(f) for f in allowed],'pairs':witnesses,'two_new_triangle':(0,2) in E}
 assert considered==2**(len(Z)-len(E0))
 oldext={tuple(map(tuple,e['old_edges'])):e for e in ar['extensions']};assert len(oldext)==len(ar['extensions'])
 assert set(extensions)==set(oldext)
 for E,v in extensions.items():
  other=oldext[E]
  assert v['allowed_ordinary_apices']==other['allowed_ordinary_apices'] and v['two_new_triangle']==other['two_new_triangle']
  assert [sorted(t) for t in v['pairs']]==[sorted(map(tuple,t)) for t in other['compatible_pair_candidates']]
 V=set(range(5))|({5} if any(5 in f for f in F) else set())
 bareT=list({P for f in F for P in f.values()});two_covers=[list(C) for C in combinations(sorted(E0|SS),2) if all(set(C)&P for P in bareT)]
 row={'bits':bits,'E0':sorted(E0),'actual_bare_vertices':sorted(V),'orbit':[sorted(E) for E in sorted(orbit,key=lambda e:tuple(sorted(e)))],'bare_apices':[sorted(f) for f in F],'old_supergraphs_considered':considered,'two_edge_bare_covers':two_covers,'extensions':[{'old_edges':E,**v} for E,v in sorted(extensions.items())]}
 if extensions:
  survivors.append(bits);ext_count+=len(extensions)
  if bits==23:assert all(set(v['allowed_ordinary_apices'][0])<={3,4} for v in extensions.values())
  if bits==30:assert all(set(v['allowed_ordinary_apices'][2])<={0,1,2} for v in extensions.values())
  if bits not in {23,29,30}:
   assert all(set().union(*(set(f) for f in v['allowed_ordinary_apices']))<=V for v in extensions.values())
   assert all(not any(K(t)<=set(E) for t in combinations(V,3)) for E in extensions)
   assert all((0,2) not in E for E in extensions)
   if bits not in {63,252,463,478}:assert two_covers
   else:assert not two_covers
  if bits in {63,252,463,478}:
   attach=set()
   for E,v in extensions.items():
    for i,Fam in enumerate(v['allowed_ordinary_apices']):
     for x in Fam:attach.update(K((*S[i],x))-SS-E0)
   assert attach==({(2,5)} if bits==252 else set())
   row['possible_supported_attachments']=sorted(attach)
   Q=E0|SS
   if bits==63:assert Q==K(range(5))-{(0,2)}
   if bits==478:
    rim=(0,4,3,2,5)
    wheel=frozenset(edge(1,x) for x in rim)|frozenset(edge(rim[i],rim[(i+1)%5]) for i in range(5))
    assert Q==wheel
   if bits==252:assert Q==K((1,2,3,4))|K((0,1,5))
   if bits==463:assert Q==K((0,1,3,4))|(K((0,1,2,5))-{(0,2)}) and not any(edge(a,b) in Q for a in (3,4) for b in (2,5))
 rows.append(row)
assert covered==set(retained)
assert sorted(survivors)==[23,29,30,31,55,63,220,221,222,244,252,451,455,460,461,463,477,478]
counts={'bare_domain':n,'retained_labeled':len(retained),'group_size':len(perms),'orbits':len(rows),'surviving_orbits':len(survivors),'retained_extensions':ext_count}
assert len(retained)==59 and len(rows)==21
assert auth['counts']=={'bare_spoke_subsets':512,'retained_labeled_skeletons':59,'unlabeled_skeletons':21,'with_necessary_resilience_extensions':18}
paths=[source,W/'scripts/matching26_disconnected_path_geometry_v2.py',W/'notes/matching26_disconnected_path_classification_v1.md']
out={'status':'VERIFIED_FINITE','method':__doc__,'scope':'Exact necessary P3+edge interface only; outside apex symbols encode equality patterns, not a bound on actual outside vertices. Ordinary all-size confinement and cover/boundary lemmas are reviewed separately.','counts':counts,'permutations':perms,'surviving_types':sorted(survivors),'rows':rows,'source_sha256':{str(p):sha256(p.read_bytes()).hexdigest() for p in paths},'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'python':sys.version,'executable':sys.executable,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-START,'completed_utc':datetime.now(timezone.utc).isoformat(),'processes':1,'threads':1}
(W/'evidence/opening_p3_domain.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'counts':counts,'elapsed_seconds':out['elapsed_seconds']}))
