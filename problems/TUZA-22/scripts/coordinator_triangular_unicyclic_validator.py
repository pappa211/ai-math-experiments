"""Independent domain bijection and literal certificate checker; no producer imports."""
from pathlib import Path
from itertools import combinations
from collections import Counter
from copy import deepcopy
import json,hashlib,time
import networkx as nx
W=Path(__file__).resolve().parents[1];start=time.monotonic()
def digest(p):return hashlib.sha256((W/p).read_bytes()).hexdigest()
def edges(seq):
 out={tuple(sorted(x)) for x in seq}
 assert len(out)==len(seq) and all(len(e)==2 and e[0]!=e[1] for e in out)
 return out
def graph(n,E):
 G=nx.Graph();G.add_nodes_from(range(n));G.add_edges_from(E);return G
def tris(n,E):return {t for t in combinations(range(n),3) if set(combinations(t,2))<=E}
def matching(seq,E):
 M=edges(seq);assert M<=E and len({v for e in M for v in e})==2*len(M)
 return M
def cert(row):
 n=row['n'];E=edges(row['edges']);T=tris(n,E);G=graph(n,E)
 assert set(map(tuple,row['triangles']))==T
 assert nx.is_connected(G) and min(dict(G.degree()).values())>=2
 c=row['certificate'];k=c['kind']
 if k=='ORDINARY_BRANCH_AT_MOST_3':
  B=[v for v in range(n)if G.degree(v)>2]
  assert len(B)<=3 and c['branch_vertices']==B
  assert c['link_degrees']==[G.degree(v)for v in range(n)]
  assert c['dependency_sha256']==digest('notes/three_branch_cs_link_exclusion_v1.md')
  return k
 P=matching(c['P'],E);r=len(P);Q=set(c['Q']);R=E-P
 assert r>0 and len(Q)==len(c['Q']) and Q<=set(range(n))
 assert all(Q.intersection(e)for e in R) and len(Q)<=r
 if k=='STRICT':assert len(Q)<r;return k
 assert len(Q)==r
 if k=='S_COLLAPSE':
  S=set(c['S']);assert len(S)==len(c['S']) and S<=set(range(n))
  assert all(S.intersection(t)for t in T)
  Z={v for e in P for v in e if v not in S and set(e)&S}
  assert Z==set(c['S_mates']) and r>len(S)+len(Z)
  return k
 if k=='B_INCOMPATIBLE':
  b=c['component'];BT=set(map(tuple,b['triangles']))
  assert BT and BT<=tris(n,R)
  supp=set().union(*(set(combinations(t,2))for t in BT))
  assert supp==edges(b['support'])
  V={v for e in supp for v in e};assert V==set(b['vertices'])
  X=nx.Graph();X.add_nodes_from(BT)
  for a,bb in combinations(BT,2):
   if len(set(a)&set(bb))==2:X.add_edge(a,bb)
  assert nx.is_connected(X)
  assert len(V)>5 or any(tuple(sorted(e))not in R for e in combinations(V,2))
  return k
 cliques=[set(vs)for size in range(2,min(5,n)+1)for vs in combinations(range(n),size)if set(combinations(vs,2))<=R]
 Z=matching(c['Z'],E);assert len(Z)>=r
 if k=='RIM':
  t=tuple(c['T']);assert t in T
  te=set(combinations(t,2));assert te&P and not te&Z
  footprint=(te|Z)&R;assert footprint==edges(c['footprint'])
  for V in cliques:
   A={e for e in footprint if set(e)<=V}
   assert len(A)<=2 and (len(A)<2 or bool(set.intersection(*(set(e)for e in A))))
 elif k=='EXTERNAL_CLIQUE_STAR':
  f=tuple(c['f']);assert f in P and f not in Z
  assert not any(set(f)<=set(t)for t in T)
  for V in cliques:
   A={e for e in Z if set(e)<=V}
   assert len(A)<=1
   if A and V&set(f):assert (set(next(iter(A)))&V&set(f))==V&set(f)
 else:raise AssertionError('Unrecognized certificate '+k)
 return k

def check(data,domain):
 rows=data['rows'];assert data['status']=='ALL_FIXED_DOMAIN_CERTIFIED'
 assert len(rows)==data['processed']==data['domain_records']==374
 ahu=domain['F_shapes'];assert len(ahu)==12
 shape_rows={}
 for row in rows:shape_rows.setdefault(row['shape_id'],row)
 assert set(shape_rows)==set(range(1,13))
 maps={};used=set()
 for sid,row in shape_rows.items():
  FE=edges(row['F_edges']);nf=row['n_F'];found=[]
  for f in ahu:
   if f['n']!=nf:continue
   GM=nx.algorithms.isomorphism.GraphMatcher(graph(nf,FE),graph(nf,edges(f['edges'])))
   if GM.is_isomorphic():found.append((f['id'],dict(GM.mapping)))
  assert len(found)==1 and found[0][0]not in used
  used.add(found[0][0]);maps[sid]=found[0]
 expected={(x['F_id'],x['apex_mask'])for x in domain['links']}
 seen=set();counts=Counter()
 for row in rows:
  sid=row['shape_id'];rep=shape_rows[sid];nf=row['n_F'];w=row['apex'];n=row['n']
  assert nf==rep['n_F'] and edges(row['F_edges'])==edges(rep['F_edges']) and w==nf and n==nf+1
  A=set(row['apex_neighbors']);assert len(A)==len(row['apex_neighbors']) and len(A)>=2 and A<=set(range(nf))
  FG=graph(nf,edges(row['F_edges']));leaves={v for v in range(nf)if FG.degree(v)==1}
  assert leaves==set(row['F_leaves']) and leaves<=A
  E=edges(row['F_edges'])|{(v,w)for v in A};assert E==edges(row['edges'])
  fid,mp=maps[sid];key=(fid,sum(1<<mp[v]for v in A))
  assert key in expected and key not in seen;seen.add(key)
  counts[cert(row)]+=1
 assert seen==expected
 return counts,{sid:fid for sid,(fid,mp)in maps.items()}

data=json.loads((W/'evidence/triangular_unicyclic_cs_interface_v2.json').read_text())
domain=json.loads((W/'evidence/coordinator_triangular_unicyclic_domain.json').read_text())
counts,mapping=check(data,domain)
controls=[]
def reject(name,fn):
 try:fn()
 except (AssertionError,KeyError,ValueError):controls.append({'name':name,'rejected':True});return
 raise AssertionError('Negative control accepted: '+name)
x=deepcopy(next(r for r in data['rows']if 'P'in r['certificate']));x['certificate']['P'].append(x['certificate']['P'][0]);reject('duplicate_matching_edge',lambda:cert(x))
x=deepcopy(next(r for r in data['rows']if 'P'in r['certificate']));x['certificate']['Q']=[];reject('empty_false_cover',lambda:cert(x))
x=deepcopy(next(r for r in data['rows']if r['certificate']['kind']=='RIM'));x['certificate']['T']=[0,0,1];reject('false_rim_triangle',lambda:cert(x))
x=deepcopy(data);x['rows'].pop();reject('omitted_domain_record',lambda:check(x,domain))
x=deepcopy(next(r for r in data['rows']if r['certificate']['kind']=='EXTERNAL_CLIQUE_STAR'));x['certificate']['f']=[-1,-2];reject('false_external_base',lambda:cert(x))
result={'status':'INDEPENDENTLY_VALIDATED','finite_only':True,'records':374,'F_shapes':12,'counts':dict(counts),'producer_to_AHU_shape':mapping,'negative_controls':controls,'unknown':0,'elapsed_seconds':time.monotonic()-start,'inputs_sha256':{p:digest(p)for p in ['scripts/triangular_unicyclic_cs_interface_v2.py','evidence/triangular_unicyclic_cs_interface_v2.json','scripts/coordinator_triangular_unicyclic_domain.py','evidence/coordinator_triangular_unicyclic_domain.json','notes/three_branch_cs_link_exclusion_v1.md','notes/external_page_clique_footprint_certificate_v3.md']},'limitations':'Ordinary completeness reduction and arbitrary-outside-attachment proof are separate reviewed premises. No Lean formalization, no optimum values trusted, no historical census premise.'}
(W/'evidence/coordinator_triangular_unicyclic_validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
