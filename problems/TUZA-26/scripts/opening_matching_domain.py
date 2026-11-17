#!/usr/bin/env python3
"""Independent set-based completeness check of the matching-S finite reduction.
No discovery code is imported. All 4096 crossedge graphs are built by subset size.
The S-preserving group is found by filtering all 720 permutations, and supplied
representatives must partition the independently retained labelled domain.
"""
from pathlib import Path
from itertools import combinations,permutations,product
from collections import Counter
from hashlib import sha256
from datetime import datetime,timezone
import json,time,platform,sys,signal
START=time.monotonic(); W=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
signal.signal(signal.SIGALRM,lambda *_: (_ for _ in ()).throw(TimeoutError('UNKNOWN_TIMEOUT')))
signal.alarm(120)
def edge(a,b):return tuple(sorted((a,b)))
def graph(V):return frozenset(combinations(sorted(V),2))
S=tuple(((0,1),(2,3),(4,5))); SS=frozenset(S)
X=tuple(sorted(graph(range(6))-SS)); TRI=tuple(graph(t) for t in combinations(range(6),3))
def subsets(seq):
 for size in range(len(seq)+1):
  for a in combinations(seq,size):yield frozenset(a)
def pages(E,i,outside=False):
 a,b=S[i]
 return {x:graph((a,b,x)) for x in range(7 if outside else 6) if x not in (a,b) and (x==6 or {edge(a,x),edge(b,x)}<=E)}
def pair_disjoint(P,Q):return not(P&Q)
def triple_disjoint(P,Q,R):return not(P&Q or P&R or Q&R)
def serialize(E):return tuple(sorted(E))
retained={}; tested=0
for E0 in subsets(X):
 tested+=1
 if any(t<=E0 for t in TRI):continue
 families=[pages(E0,i) for i in range(3)]
 if any(not f for f in families):continue
 used=frozenset().union(*(P-SS for f in families for P in f.values()))
 if used!=E0:continue
 if any(triple_disjoint(*P) for P in product(*(list(f.values()) for f in families))):continue
 retained[E0]=families
assert tested==4096
perms=[]
for perm in permutations(range(6)):
 if frozenset(edge(perm[a],perm[b]) for a,b in S)==SS:perms.append(perm)
assert len(perms)==48 and len(set(perms))==48
def im(E,p):return frozenset(edge(p[a],p[b]) for a,b in E)
source=W/'evidence/matching26_bare_skeletons.json'; authored=json.loads(source.read_text())
covered=set(); rows=[]; ext_total=0
expected_vars=[[(1,3),(1,4),(1,5)],[(0,3),(1,4),(1,5),(3,4),(3,5)],[(1,4),(1,5)],[(1,3),(1,5)],[(0,3),(1,5),(3,5)],[(1,5)],[],[]]
expected_apices=[[[2,3,4,5],[0,1],[0,1,6]],[[2,3,4,5],[0,1],[0,1,6]],[[2,3,4,5],[0,1],[0,1,6]],[[2,3,4,5],[0,1],[0,1]],[[2,3,4,5],[0,1],[0,1]],[[2,3,4,5],[0,1],[0,1]],[[2,3,4,5],[0,1],[0,1]],[[],[],[]]]
for idx,r in enumerate(authored['skeletons']):
 E0=frozenset(map(tuple,r['crossedges'])); assert E0 in retained
 orbit={im(E0,p) for p in perms}
 assert orbit<=set(retained) and not(covered&orbit)
 covered|=orbit
 assert len(orbit)==r['labeled_count']
 fam=retained[E0]
 assert [sorted(f) for f in fam]==r['bare_apices']
 ext={}; considered=0; surviving_old_triangle_filter=0
 for add in subsets(tuple(e for e in X if e not in E0)):
  considered+=1; E=E0|add
  if any(t<=E and bool(t&E0) for t in TRI):continue
  surviving_old_triangle_filter+=1
  possible=[pages(E,i,True) for i in range(3)]; allowed=[]
  for i in range(3):
   others=[j for j in range(3) if j!=i]
   allowed.append({x:P for x,P in possible[i].items() if not any(triple_disjoint(P,A,B) for A,B in product(fam[others[0]].values(),fam[others[1]].values()))})
  witnesses=[]
  for i in range(3):
   j,k=[q for q in range(3) if q!=i]
   good=[(x,y) for x,P in allowed[j].items() for y,Q in allowed[k].items() if pair_disjoint(P,Q) and all(bool(B&P or B&Q) for B in fam[i].values())]
   if not good:break
   witnesses.append(good)
  if len(witnesses)!=3:continue
  ext[serialize(E)]={'allowed_page_apices':[sorted(f) for f in allowed],'deletion_pair_witnesses':witnesses}
 assert considered==2**(12-len(E0))
 oldext={tuple(map(tuple,t['terminal_crossedges'])):t['allowed_page_apices'] for t in r['necessary_extensions']}
 assert len(oldext)==len(r['necessary_extensions'])
 assert {E:v['allowed_page_apices'] for E,v in ext.items()}==oldext
 assert len(ext)==r['necessary_extension_count']
 ext_total+=len(ext)
 variables=sorted(frozenset().union(*(frozenset(E)-E0 for E in ext))) if ext else []
 unions=[sorted(set().union(*(set(v['allowed_page_apices'][i]) for v in ext.values()))) if ext else [] for i in range(3)]
 assert variables==expected_vars[idx] and unions==expected_apices[idx]
 if idx in range(2,7):assert all(not any(t<=frozenset(E) for t in TRI) for E in ext)
 if idx==4:assert all((3,5) not in E or ((0,3) not in E and (1,5) not in E) for E in ext)
 # Terminal edges used by any actual allowed terminal page, excluding bare edges.
 possible_attachment=set()
 for E,v in ext.items():
  for i,apices in enumerate(v['allowed_page_apices']):
   for x in apices:
    if x<6:possible_attachment.update(graph((*S[i],x))-SS-E0)
 if idx in range(2,7):
  expected_attach={2:{(1,4),(1,5)},3:{(1,3),(1,5)},4:{(0,3),(1,5)},5:{(1,5)},6:set()}[idx]
  assert possible_attachment==expected_attach
 # In the no-old-component case, Q=S+E0 has the asserted two-vertex separation.
 if idx in range(2,7):assert not any(edge(a,b) in (E0|SS) for a in (2,3) for b in (4,5))
 rows.append({'type':idx,'E0':sorted(E0),'bare_apices':[sorted(f) for f in fam],'orbit_size':len(orbit),'all_labeled_orbit_members':[sorted(E) for E in sorted(orbit,key=serialize)],'terminal_supergraphs_considered':considered,'old_triangle_filter_survivors':surviving_old_triangle_filter,'retained_extensions':len(ext),'additional_edge_union':variables,'page_apex_union':unions,'extensions':[{'edges':E,**v} for E,v in sorted(ext.items())]})
assert covered==set(retained)
counts={'terminal_graphs':tested,'retained_labeled_skeletons':len(retained),'group_size':len(perms),'representative_orbits':len(rows),'types_with_extensions':sum(bool(r['retained_extensions']) for r in rows),'retained_extensions':ext_total}
assert len(retained)==147 and len(rows)==8 and counts['types_with_extensions']==7
assert authored['counts']['terminal_crossedge_subsets']==tested and authored['counts']['retained_labeled_skeletons']==len(retained)
assert authored['counts']['unlabeled_skeletons']==len(rows) and authored['counts']['with_necessary_resilience_extensions']==7
sources=[source,W/'scripts/matching26_bare_skeletons.py',W/'notes/matching26_terminal_confinement_v1.md',W/'notes/matching26_three_connected_exclusion_v1.md']
result={'status':'VERIFIED_FINITE','scope':'Exact necessary six-terminal matching-S interface and full retained terminal-supergraph tables. Not a census of Q and not a proof of the ordinary boundary reduction. External apex6 is a symbolic edge-intersection type, not a bound of one real outside vertex.','method':__doc__,'counts':counts,'S':S,'crossedge_domain':X,'permutations':perms,'types':rows,'source_sha256':{str(p):sha256(p.read_bytes()).hexdigest() for p in sources},'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'python':sys.version,'executable':sys.executable,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-START,'completed_utc':datetime.now(timezone.utc).isoformat(),'processes':1,'threads':1}
(W/'evidence/opening_matching_domain.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':result['status'],'counts':counts,'elapsed_seconds':result['elapsed_seconds']}))
