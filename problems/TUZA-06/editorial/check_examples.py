#!/usr/bin/env python3
"""Check the two stated class-separation examples and every vector-core adjacency.
Standard library only; no general graph census, Lean run or outside-attachment enumeration.
"""
from pathlib import Path
from itertools import combinations
import json,re,hashlib
root=Path(__file__).resolve().parents[3];p=root/'problems/TUZA-06'
def edge(a,b):return tuple(sorted((a,b)))
C=set(range(5));I=set(range(5,10));E10={edge(a,b) for a,b in combinations(C,2)}|{edge(a,b) for a in C for b in I}
assert len(E10)==35 and 2*len(E10)/10==7
left=C|I;order=list(range(5,10))+list(range(5));degrees=[]
for v in order:
 d=sum(edge(v,u) in E10 for u in left if u!=v);assert d<=5;degrees.append(d);left.remove(v)
assert degrees[:5]==[5]*5
# Any subgraph of K7 has average degree at most6, attained by K7 itself;
# its minimum degree6 prevents five-degeneracy.
assert 2*len(list(combinations(range(7),2)))/7==6
A='abcde';V=['u','v','w',*A]
E={edge(a,b) for a,b in combinations(A,2)}|{edge('u',z) for z in V if z!='u'}|{edge('v',z) for z in 'abc'}|{edge('w',z) for z in 'ade'}
cert=json.loads((p/'checks/final_core_certificates.json').read_text());assert E=={edge(*x) for x in cert['edges']}
svg=(root/'papers/tuza-five-degenerate/final-core.svg').read_text();drawn=[edge(*x.split('-')) for x in re.findall(r'data-edge="([a-z]-[a-z])"',svg)]
assert len(drawn)==len(set(drawn))==23 and set(drawn)==E
tex=(root/'papers/tuza-five-degenerate/main.tex').read_text();texdrawn=[edge(*x) for x in re.findall(r'\\draw\[[^\]]+\]\s*\(([a-z])\)\s*--\s*\(([a-z])\)',tex)]
assert len(texdrawn)==23 and set(texdrawn)==E
triangles=sum(all(edge(a,b) in E for a,b in combinations(t,2)) for t in combinations(V,3));assert triangles==32
print(json.dumps({'status':'PASS','ten_vertex_example':{'vertices':10,'edges':35,'average_degree':7,'five_degeneracy_order':order,'degrees_when_removed':degrees},'K7':{'maximum_average_degree':6,'minimum_degree':6,'not_five_degenerate':True},'core':{'vertices':8,'edges':23,'triangles':32,'SVG_and_TeX_match_certificate':True},'scope':'Only these stated examples and displayed adjacencies; no new Lean run or outside-attachment enumeration.'},indent=2))
