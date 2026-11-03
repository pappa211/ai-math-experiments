#!/usr/bin/env python3
"""Scout A certificate method, saved and input-hardened by coordinator.
Generation uses installed NetworkX representatives; completeness enumerates all32768 masks.
No graph-atlas completeness assumption. Default verification uses stdlib only.
"""
import itertools as it,json,sys,time,hashlib
from pathlib import Path
START=time.monotonic(); CAP=90
ROOT=Path(__file__).resolve().parents[1];CERT=ROOT/'evidence/six_link_certificates.json';RESULT=ROOT/'evidence/six_link_verification.json'
V=tuple(range(6));EDGES=tuple(it.combinations(V,2));EINDEX={e:i for i,e in enumerate(EDGES)}
def tick():
 if time.monotonic()-START>CAP:raise RuntimeError('UNKNOWN:90-second cap exceeded')
def pair(a,b):return tuple(sorted((a,b)))
def mask(E):return sum(1<<EINDEX[tuple(sorted(e))] for e in E)
def edges(m):return {e for i,e in enumerate(EDGES) if (m>>i)&1}
def clique(C,E):return all(e in E for e in it.combinations(sorted(C),2))
def tris(E,vertices=V):return [tuple(t) for t in it.combinations(vertices,3) if clique(t,E)]
def tedges(t):return set(it.combinations(sorted(t),2))
def connected(vertices,E):
 if not vertices:return False
 seen={next(iter(vertices))}
 while True:
  nxt=seen|{v for e in E if set(e)&seen for v in e}
  if nxt==seen:return seen==set(vertices)
  seen=nxt
def eligible(E):return connected(V,E) and all(sum(v in e for e in E)>=2 for v in V)
def matching(M):return len({x for e in M for x in e})==2*len(M)
def star(D):return not D or bool(set.intersection(*(set(e) for e in D)))
def footprint_ok(J,D):
 for k in range(2,6):
  for C in it.combinations(V,k):
   if not clique(C,J):continue
   d=D&set(it.combinations(C,2))
   if (k<=4 and not star(d)) or len(d)>2:return False
 return True
EXCEPTIONS={
 'K2,4':{pair(a,b) for a in (4,5) for b in (0,1,2,3)},
 'K3,3-minus-edge':{(0,1),(0,5),(1,2),(1,4),(2,3),(2,5),(3,4),(4,5)},
 'three-sun':{(0,1),(0,2),(0,4),(0,5),(1,2),(1,3),(1,4),(3,4),(4,5)},
 'K3,3':{pair(a,b) for a in (0,2,4) for b in (1,3,5)}}
def components_of_triangles(J):
 todo=tris(J);out=[]
 while todo:
  comp=[todo.pop()];used=tedges(comp[0])
  while True:
   add=[t for t in todo if tedges(t)&used]
   if not add:break
   for t in add:todo.remove(t);comp.append(t);used|=tedges(t)
  out.append(comp)
 return out
def find_certificate(E):
 BE=E|{pair(6,v) for v in V};BT=tris(BE,tuple(range(7)))
 for r in range(1,4):
  for mt in it.combinations(sorted(E),r):
   if not matching(mt):continue
   M=set(mt);J=E-M;qs=[q for k in range(r+1) for q in it.combinations(V,k) if all(set(e)&set(q) for e in J)]
   if not qs:continue
   Q=qs[0];base={'M':sorted(M),'Q':Q}
   if len(Q)<r:return dict(base,kind='strict')
   for comp in components_of_triangles(J):
    S=set().union(*(set(t) for t in comp))
    if len(S)>5 or not clique(S,J):return dict(base,kind='residual_nonclique',triangles=comp)
   for pt in it.combinations(BT,r+1):
    union=set().union(*(tedges(t) for t in pt))
    if len(union)==3*(r+1) and footprint_ok(J,union&J):return dict(base,kind='local_gain',packing=pt)
 for name,F in EXCEPTIONS.items():
  for p in it.permutations(V):
   if {pair(p[a],p[b]) for a,b in F}==E:return {'kind':'symbolic_exception','family':name,'permutation':p}
 raise ValueError(('No certificate',sorted(E)))
def verify_certificate(E,c):
 assert E<=set(EDGES) and eligible(E)
 if c['kind']=='symbolic_exception':
  p=c['permutation'];assert sorted(p)==list(V)
  assert E=={pair(p[a],p[b]) for a,b in EXCEPTIONS[c['family']]};return
 M={tuple(e) for e in c['M']};Q=set(c['Q']);r=len(M);J=E-M
 assert Q<=set(V) and len(c['M'])==len(M) and len(c['Q'])==len(Q)
 assert M<=E and matching(M) and len(Q)<=r and all(set(e)&Q for e in J)
 if c['kind']=='strict':assert len(Q)<r;return
 assert len(Q)==r
 if c['kind']=='residual_nonclique':
  T=[tuple(t) for t in c['triangles']]
  assert T and all(set(t)<=set(V) and len(set(t))==3 and clique(t,J) for t in T)
  adj={pair(i,j) for i in range(len(T)) for j in range(i+1,len(T)) if tedges(T[i])&tedges(T[j])}
  assert connected(tuple(range(len(T))),adj)
  S=set().union(*(set(t) for t in T));assert len(S)>5 or not clique(S,J);return
 assert c['kind']=='local_gain'
 BE=E|{pair(6,v) for v in V};P=[tuple(t) for t in c['packing']]
 assert len(P)==r+1 and all(set(t)<=set(range(7)) and len(set(t))==3 and clique(t,BE) for t in P)
 union=set().union(*(tedges(t) for t in P));assert len(union)==3*len(P)
 assert footprint_ok(J,union&J)
def verify_exception_auxiliaries():
 out={}
 for name,E in EXCEPTIONS.items():
  if name=='three-sun':continue
  part=(4,5) if name=='K2,4' else (0,2,4);r=len(part)
  assert all(len(set(e)&set(part))==1 for e in E)
  matchings=[set(m) for m in it.combinations(sorted(E),r) if matching(m)];assert matchings
  assert all(any(f in m for m in matchings) and any(f not in m for m in matchings) for f in E)
  out[name]={'r':r,'matching_count':len(matchings),'all_edges_contained_and_avoided':True}
 E=EXCEPTIONS['three-sun'];a,b,c,x,y,z=0,1,4,2,3,5
 M0={pair(a,z),pair(b,x),pair(c,y)};M1={pair(a,x),pair(b,y),pair(c,z)};J=E-M0;Q={a,b,c}
 assert matching(M0) and matching(M1) and all(set(e)&Q for e in J)
 for f in M0:
  Kmax=J|{pair(7,u) for u in V};D=M1|{pair(7,u) for u in f}
  for k in range(2,6):
   for C in it.combinations((*V,7),k):
    if not clique(C,Kmax):continue
    d=D&set(it.combinations(C,2));assert len(d)<=2 and (k>4 or star(d))
 BE=E|{pair(6,u) for u in V};Z={pair(6,u) for u in Q}|set(it.combinations(sorted(Q),2))
 lost=[t for t in tris(BE,tuple(range(7))) if not clique(t,J)]
 assert len(Z)==6 and all(tedges(t)&Z for t in lost)
 assert clique(Q,J) and set(it.combinations(sorted(Q),2))<=Z
 out['three-sun']={'page_footprints_all_checked':True,'lost_local_triangles_covered':len(lost),'residual_triangle_overlap':True}
 return out
if '--generate' in sys.argv:
 import networkx as nx
 records=[]
 for H in nx.graph_atlas_g():
  if len(H)!=6:continue
  E={pair(*e) for e in H.edges()}
  if not eligible(E):continue
  F=set(EDGES)-E
  if all(sum(v in e for e in F)<=1 for v in V):continue
  c=find_certificate(E);verify_certificate(E,c)
  records.append({'mask':mask(E),'edges':sorted(E),'certificate':c});tick()
 data={'scope':'Connected six-vertex links with minimum degree>=2 and complement maximum degree>=2.','generator_networkx_version':nx.__version__,'records':records}
 CERT.write_text(json.dumps(data,indent=2)+'\n')
data=json.loads(CERT.read_text());records=data['records'];orbit={};kinds={}
for i,rec in enumerate(records):
 E={tuple(e) for e in rec['edges']};assert mask(E)==rec['mask'];verify_certificate(E,rec['certificate'])
 kind=rec['certificate']['kind'];kinds[kind]=kinds.get(kind,0)+1
 for p in it.permutations(V):orbit.setdefault(mask({pair(p[a],p[b]) for a,b in E}),i)
 tick()
counts={'all_labelled_graphs':1<<15,'connected_min_degree_two':0,'complement_matching_cases':{},'covered_labelled_links':0}
for m in range(1<<15):
 E=edges(m)
 if not eligible(E):continue
 counts['connected_min_degree_two']+=1;F=set(EDGES)-E
 if all(sum(v in e for e in F)<=1 for v in V):
  key=str(len(F));counts['complement_matching_cases'][key]=counts['complement_matching_cases'].get(key,0)+1
 else:
  assert m in orbit,('Missing labelled graph',m,sorted(E));counts['covered_labelled_links']+=1
 if m%1024==0:tick()
aux=verify_exception_auxiliaries()
result={'status':'PASS','runtime_cap_seconds':CAP,'elapsed_seconds':time.monotonic()-START,'template_count':len(records),'certificate_kinds':kinds,'coverage':counts,'symbolic_exception_auxiliaries':aux,'certificate_sha256':hashlib.sha256(CERT.read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'scope_limit':'Finite local certificate coverage only; unbounded theorem needs the separate symbolic proofs. No Lean claim.'}
RESULT.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
