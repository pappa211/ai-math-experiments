#!/usr/bin/env python3
from itertools import combinations
from pathlib import Path
import json, platform, time
import networkx as nx
from global_routes_deletion_gate import Exact
assert platform.system()=='Darwin'
start=time.time()
def state(G):
    G=nx.convert_node_labels_to_integers(G)
    ex=Exact(G)
    nu=ex.nu(ex.full); tau=ex.tau(ex.full)
    return {'n':len(G),'edges':ex.edges,'triangles':ex.triples,'nu':nu,'tau':tau,'defect':tau-2*nu}
def classes(G):
    D={}
    for v in G:D.setdefault(tuple(sorted(G[v])),[]).append(v)
    return list(D.values())
def clone(G,A,B):
    H=G.copy();N=list(G[B[0]])
    H.remove_edges_from([(u,v) for u in A for v in list(H[u])])
    H.add_edges_from((u,v) for u in A for v in N)
    return H
def tc(G):
    ex=Exact(G)
    if not ex.tri or any(G.degree(v)==0 for v in G):return False
    union=0
    for t in ex.tri:union|=t
    if union!=ex.full:return False
    seen={0};todo=[0]
    while todo:
        i=todo.pop()
        for j,t in enumerate(ex.tri):
            if j not in seen and t&ex.tri[i]: seen.add(j);todo.append(j)
    return len(seen)==len(ex.tri)
qual=0;tested=0;found=None
for idx,G in enumerate(nx.graph_atlas_g()):
    tested+=1
    G=nx.convert_node_labels_to_integers(G)
    if not tc(G):continue
    cs=classes(G);pairs=[(A,B) for A,B in combinations(cs,2) if not G.has_edge(A[0],B[0])]
    if not pairs:continue
    qual+=1;s=state(G);rows=[]
    for A,B in pairs:
        for X,Y in [(A,B),(B,A)]:rows.append({'source':X,'target':Y,**state(clone(G,X,Y))})
    if max(r['defect'] for r in rows)<s['defect']:
        found={'atlas_index':idx,'original':s,'classes':cs,'operations':rows};break
out={'hypothesis':'triangle-connected Zykov defect-monotonicity','status':'REFUTED' if found else 'NO_COUNTEREXAMPLE_IN_FINITE_DOMAIN','atlas_graphs_visited':tested,'qualifiers_tested':qual,'witness':found,'seconds':time.time()-start}
p=Path('evidence/root_zykov');p.mkdir(exist_ok=True)
(p/'gate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
