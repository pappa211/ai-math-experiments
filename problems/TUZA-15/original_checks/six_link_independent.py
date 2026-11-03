#!/usr/bin/env python3
# Fresh critic's independent checker, received verbatim and saved by coordinator.
import json, hashlib, time, itertools, collections, sys
start=time.monotonic(); raw=open(sys.argv[1],'rb').read(); data=json.loads(raw)
pairs=list(itertools.combinations(range(6),2)); index={e:i for i,e in enumerate(pairs)}; perms=list(itertools.permutations(range(6)))
def edge(a,b): return tuple(sorted((a,b)))
def eset(es):
 out={edge(*e) for e in es}; assert len(out)==len(es); assert all(a<b and 0<=a<b<6 for a,b in out); return out
def tri(t):
 assert len(t)==3 and len(set(t))==3
 return {edge(a,b) for a,b in itertools.combinations(t,2)}
def connected(vs,es):
 if not vs: return False
 seen={next(iter(vs))}
 while True:
  new=seen|{b for a,b in es if a in seen}|{a for a,b in es if b in seen}
  if new==seen: return seen==vs
  seen=new
def bipartite(es):
 color={}
 for x in range(6):
  if x in color: continue
  color[x]=0; todo=[x]
  while todo:
   a=todo.pop()
   for b in range(6):
    if edge(a,b) not in es: continue
    if b in color:
     if color[b]==color[a]: return False
    else: color[b]=1-color[a]; todo.append(b)
 return True
covered=set(); kinds=collections.Counter(); family=[]; tuple_count=0
for rec in data['records']:
 h=eset(rec['edges']); mask=sum(1<<index[e] for e in h); assert mask==rec['mask']
 deg=[sum(x in e for e in h) for x in range(6)]; assert min(deg)>=2 and min(deg)<=3 and connected(set(range(6)),h)
 cert=rec['certificate']; kind=cert['kind']; kinds[kind]+=1
 if kind=='symbolic_exception':
  f=cert['family']; family.append(f)
  if f=='three-sun':
   core={x for x in range(6) if deg[x]==4}; leaf=set(range(6))-core
   assert len(core)==3 and all(deg[x]==2 for x in leaf)
   assert {edge(*e) for e in itertools.combinations(core,2)}<=h
   assert not ({edge(*e) for e in itertools.combinations(leaf,2)}&h)
   neighborhoods={frozenset(y for y in core if edge(x,y) in h) for x in leaf}
   assert neighborhoods=={frozenset(e) for e in itertools.combinations(core,2)}
  else:
   assert bipartite(h)
   expected={'K2,4':([2,2,2,2,4,4],8),'K3,3-minus-edge':([2,2,3,3,3,3],8),'K3,3':([3,3,3,3,3,3],9)}[f]
   assert sorted(deg)==expected[0] and len(h)==expected[1]
 else:
  m=eset(cert['M']); q=set(cert['Q']); assert len(q)==len(cert['Q']) and q<=set(range(6)); assert m<=h
  assert len(set(itertools.chain.from_iterable(m)))==2*len(m)
  assert len(q)<=len(m) and all(a in q or b in q for a,b in h-m)
  residual=h-m
  if kind=='residual_nonclique':
   tris=cert['triangles']; edges=[tri(t) for t in tris]; assert edges and all(e<=residual for e in edges)
   reached={0}
   while True:
    new=reached|{j for i in reached for j in range(len(edges)) if edges[i]&edges[j]}
    if new==reached: break
    reached=new
   assert len(reached)==len(edges)
   vertices=set(itertools.chain.from_iterable(tris))
   assert len(vertices)>5 or not {edge(*e) for e in itertools.combinations(vertices,2)}<=residual
  elif kind=='local_gain':
   tris=cert['packing']; assert len(tris)>=len(m)+1
   cone=h|{(x,6) for x in range(6)}; used=set()
   for t in tris:
    assert set(t)<=set(range(7)); te=tri(t); assert te<=cone and not te&used; used|=te
   footprint=used&residual
   for size in range(6):
    for vs in itertools.combinations(range(6),size):
     ce={edge(*e) for e in itertools.combinations(vs,2)}
     if ce<=residual:
      f=footprint&ce; assert len(f)<=2
      if size<=4 and f: assert set.intersection(*(set(e) for e in f))
   tuple_count+=len(tris)
  else: raise AssertionError(kind)
 orbit={sum(1<<index[edge(p[a],p[b])] for a,b in h) for p in perms}
 assert not orbit&covered,('duplicate orbit',mask)
 covered|=orbit
eligible=set()
for mask in range(1<<15):
 h={e for i,e in enumerate(pairs) if (mask>>i)&1}; deg=[sum(x in e for e in h) for x in range(6)]
 if min(deg)>=2 and min(deg)<=3 and connected(set(range(6)),h): eligible.add(mask)
assert covered==eligible,('missing',len(eligible-covered),'extra',len(covered-eligible))
print(json.dumps({'certificate_sha256':hashlib.sha256(raw).hexdigest(),'independent_checker':'standard-library-only, did not read or import generator','records':len(data['records']),'kinds':dict(kinds),'symbolic_families':family,'fixed_local_triangles_checked':tuple_count,'labeled_graphs_scanned':1<<15,'eligible_labeled_graphs':len(eligible),'covered_labeled_graphs':len(covered),'all_certificate_predicates_valid':True,'exact_exhaustive_coverage':True,'seconds':time.monotonic()-start},indent=2))
