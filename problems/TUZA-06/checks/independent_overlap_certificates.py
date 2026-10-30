#!/usr/bin/env python3
"""Bounded separate certificate check from actual Lean literals, not generator data."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import re,json,hashlib,datetime
w=Path(__file__).resolve().parent.parent;d=w/'lean/Tuza06';hashes={}
def read(name):
 p=d/(name+'.lean');s=p.read_text();hashes[str(p.relative_to(w))]=hashlib.sha256(p.read_bytes()).hexdigest();return s
def parse(s):
 toks=re.findall(r'!\[|\{|\}|\]|\d+|∅|,',s);pos=0
 def val():
  nonlocal pos
  t=toks[pos];pos+=1
  if t.isdigit():return int(t)
  if t=='∅':return frozenset()
  assert t in ('{','!['),t
  stop='}' if t=='{' else ']';v=[]
  while toks[pos]!=stop:
   v.append(val())
   if toks[pos]==',':pos+=1
  pos+=1;return frozenset(v) if t=='{' else v
 v=val();assert pos==len(toks),(s,toks[pos:]);return v
def literal(s,n):
 m=re.search(r'^def '+re.escape(n)+r'\b[^\n]*:=\s*([^\n]+)',s,re.M)
 assert m,n
 return parse(m[1])
def edges(t):return frozenset(frozenset(e) for e in combinations(sorted(t),2))
def pack(P,E,n):
 used=set()
 for t in P:
  assert len(t)==3 and t<=set(range(n));es=edges(t);assert es<=E and not used.intersection(es);used.update(es)
 return used
names=['OverlapFiveClique','OverlapFiveNear','OverlapFourClique','OverlapFourNear','OverlapThreeInside','OverlapThreeOutsideArm','OverlapThreeOutsidePair'];patterns={};results=[]
for name in names:
 s=read(name);n=int(re.search(r'def U : Finset \(Fin (\d+)\)',s)[1]);p={k:literal(s,k) for k in ['U','X','P','Upper']};U,X,P,E=(p[k] for k in ['U','X','P','Upper'])
 assert P and len(X)<=2*len(P) and all(len(e)==2 and e<=set(range(n)) for e in X|E);pack(P,E,n)
 tested=0
 for t0 in combinations(range(n),3):
  t=frozenset(t0);es=edges(t)
  if t&U and es<=E:assert es&X;tested+=1
 for t in P:
  for e in edges(t):
   if not e&U:assert e in X
 row={'pattern':name,'order':n,'packing':len(P),'cover':len(X),'center_triangles_checked':tested,'strict':len(X)<2*len(P)}
 if 'def Aug ' in s:
  for k in ['Aug','D','A']:p[k]=literal(s,k)
  Q,D,A=(p[k] for k in ['Aug','D','A']);pack(Q,E,n);assert len(Q)>len(P);assert edges(A)<=X
  for t in Q:
   for e in edges(t):
    if not e&U and e not in X:assert e in D
  assert all(e&A for e in D);inc={str(a):sum(a in e for e in D) for a in A};assert max(inc.values(),default=0)<=2
  row.update(augmentation=len(Q),terminal_edges=len(D),terminal_incidence=inc)
 else:assert row['strict']
 patterns[name]=p;results.append(row)
s=read('OverlapThreeActualFiniteBasic');Nx=frozenset([2,3,4,5,6]);Ny=frozenset([2,3,4,7,8]);xe,ye,stars,xm,ym,orders,kind,targets,choices=[literal(s,k) for k in ['xEdges','yEdges','stars','xMissing','yMissing','orderFn','kind','target','choice']]
assert xe==edges(Nx) and ye==edges(Ny) and len(orders)==24 and len({tuple(o) for o in orders})==24
for o in orders:assert sorted(o)==list(range(9)) and o[0]==0 and o[1]==1 and frozenset(o[a] for a in Nx)==Nx and frozenset(o[a] for a in Ny)==Ny
admiss=[]
ps=[patterns[n] for n in names[-3:]]
for g in range(11):
 for f in range(10):
  known=stars|(xe-{xm[g]})|(ye-{ym[f]})
  if xm[g] not in known and ym[f] not in known:
   admiss.append([g,f]);o=orders[choices[g][f]];k=kind[f];assert frozenset(o[a] for a in targets[k])==ym[f]
   for t in ps[k]['P']|ps[k]['Aug']:
    mt=frozenset(o[a] for a in t);assert len(mt)==3 and edges(mt)<=known
for k in range(3):
 for a in range(9):
  for b in range(9):
   e=frozenset([a,b])
   if e not in ps[k]['Upper']:
    assert a==b or (a==0 and b not in Nx) or (b==0 and a not in Nx) or (a==1 and b not in Ny) or (b==1 and a not in Ny) or e==targets[k]
casepairs=[]
for p in d.glob('OverlapThreeActualCase*.lean'):
 read(p.stem);m=re.fullmatch(r'OverlapThreeActualCase(\d+)_(\d+)',p.stem);assert m;casepairs.append([int(m[1]),int(m[2])])
assert sorted(casepairs)==sorted(admiss);assert len(admiss)==59
out={'status':'PASS','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'method':'standard-library Python parse of actual Lean source literals; seven supplied pattern certificates and 110 missing-edge pair inputs; no graph census or outside-attachment enumeration','patterns':results,'orientation_inputs':110,'admissible_orientation_cases':len(admiss),'permutations':24,'upper_ordered_pairs_checked':243,'admissible_cases':admiss,'source_hashes':hashes}
(w/'checks/independent_overlap_certificates_results.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k not in ['source_hashes','admissible_cases']},indent=2))
