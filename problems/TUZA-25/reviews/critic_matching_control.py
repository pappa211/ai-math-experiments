#!/usr/bin/env python3
from itertools import combinations
from pathlib import Path
import json,platform,sys
ROOT=Path(__file__).resolve().parents[1]
def clique(v):return frozenset(combinations(sorted(v),2))
def values(E):
    T=tuple(clique(t) for t in combinations(range(8),3) if clique(t)<=E)
    for p in range(len(E)//3,-1,-1):
        P=next((f for f in combinations(T,p) if len(frozenset().union(*f))==3*p),None)
        if P is not None:break
    for q in range(len(E)+1):
        C=next((c for c in combinations(sorted(E),q) if all(set(c)&t for t in T)),None)
        if C is not None:break
    return {'nu':p,'tau':q,'triangles':[sorted(t) for t in T],'packing':[sorted(t) for t in P],'cover':C}
if platform.system()!='Darwin':raise ValueError('local Mac required')
pieces=[(0,2,4,6),(0,1,2,4),(0,1,2,3),(1,2,3,5),(1,3,5,7)]
J=frozenset().union(*(clique(p) for p in pieces));S=frozenset({(0,1),(1,2),(2,3)});L=J-S
j,l=values(J),values(L)
if (j['nu'],j['tau'],l['nu'],l['tau'])!=(5,6,2,4):raise ValueError('negative control values differ')
old_support=frozenset().union(*(frozenset(map(tuple,t)) for t in l['triangles']))
if old_support!=clique((0,2,4,6))|clique((1,3,5,7)):raise ValueError('old B support differs')
for t in j['triangles']:
    if not any(frozenset(map(tuple,t))<=clique(p) for p in pieces):raise ValueError('uncompleted actual triangle')
result={'status':'PASS','scope':'One negative control only, independently enumerated.',
        'J_edges':sorted(J),'deleted':sorted(S),'J':j,'L':l,
        'old_background_edges':sorted(L-old_support),'packing_gain':j['nu']-l['nu'],'cover_gain':j['tau']-l['tau'],
        'python':sys.version,'python_executable':sys.executable}
(ROOT/'reviews/critic_matching_control.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','J':[j['nu'],j['tau']],'L':[l['nu'],l['tau']],'old_background_edges':sorted(L-old_support)}))
