"""Generate literal upper-bound witnesses for the proved edge-amalgam theorem.
Cover lower bounds and exhaustive minimum-cover classification use the stated ordinary proof.
"""
import itertools,json,networkx as nx
from pathlib import Path
R=Path(__file__).resolve().parents[1]
V=[x for x in range(32) if x.bit_count()%2==0];idx={v:i for i,v in enumerate(V)}
L={tuple(sorted((idx[a],idx[b]))) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4}
e=(idx[0],idx[15]);map1={v:v for v in range(16)};map2={e[0]:e[0],e[1]:e[1]};fresh=iter(range(17,31))
for v in range(16):
 if v not in map2:map2[v]=next(fresh)
apices=[16,31];maps=[map1,map2]
def edge(a,b):return tuple(sorted((a,b)))
Es=[{edge(mp[a],mp[b]) for a,b in L}|{edge(z,mp[v]) for v in range(16)} for mp,z in zip(maps,apices)]
E=Es[0]|Es[1];T=[t for t in itertools.combinations(range(32),3) if all(e in E for e in itertools.combinations(t,2))]
rows=[]
for centers in itertools.product(range(16),repeat=2):
 C=set();Q=[];private_cover=set()
 for mp,z,c in zip(maps,apices,centers):
  I={v for v in range(16) if edge(v,c) in L};S=set(range(16))-I
  C|={edge(z,mp[v]) for v in S};private_cover|={edge(z,mp[v]) for v in I}
  H=nx.Graph();H.add_nodes_from(range(16));H.add_edges_from((a,b) for a,b in L if ((a in I) != (b in I)) and (a,b)!=e)
  M=nx.max_weight_matching(H,maxcardinality=True)
  assert len(M)==5
  Q.extend(tuple(sorted((z,mp[a],mp[b]))) for a,b in M)
 rows.append({'centers':centers,'C':sorted(C),'private_packing':sorted(Q),'private_family_cover':sorted(private_cover)})
fullpacking=[]
for mp,z in zip(maps,apices):
 d=23
 for a in V:
  b=a^d
  if a<b:fullpacking.append(tuple(sorted((z,mp[idx[a]],mp[idx[b]]))))
out={'scope':'Literal graph and upper-bound witnesses; exact lower bounds and exhaustive minC classification in notes/challenger_interacting_clebsch.md','vertices':list(range(32)),'edges':sorted(E),'triangles':T,'shared_rim_edge':e,'piece_vertices':[sorted(set(mp.values())|{z}) for mp,z in zip(maps,apices)],'apices':apices,'tau':22,'nu':16,'private_nu_every_minimum_cover':10,'minimum_covers_count':256,'minimum_full_maximal_extension_lower_bound':12,'full_packing':sorted(fullpacking),'minimum_cover_witnesses':rows}
(R/'evidence/challenger_interacting_certificate.json').write_text(json.dumps(out,indent=2)+'\n')
print('n,m,t',len(out['vertices']),len(E),len(T),'covers',len(rows))
