#!/usr/bin/env python3
"""Two explicitly frozen descent witnesses, independently checked exactly."""
from itertools import combinations
from pathlib import Path
import json,platform,sys,time
ROOT=Path(__file__).resolve().parents[1]
START=time.monotonic()
def clique(v):return frozenset(tuple(e) for e in combinations(sorted(v),2))
def tris(E):
    V=sorted(set(v for e in E for v in e))
    return tuple(clique(t) for t in combinations(V,3) if clique(t)<=E)
def packing(E):
    T=tris(E)
    for k in range(len(E)//3,-1,-1):
        for F in combinations(T,k):
            if len(frozenset().union(*F))==3*k:return k,F
    raise ValueError('empty packing missing')
def covering(E):
    T=tris(E)
    for k in range(len(E)+1):
        for C in combinations(sorted(E),k):
            if all(set(C)&t for t in T):return k,C
    raise ValueError('cover missing')
def metrics(E):
    n,P=packing(E);t,C=covering(E)
    deletions=[]
    for e in sorted(E):
        q,Q=packing(E-{e})
        deletions.append({'edge':e,'nu':q,'packing':[sorted(x) for x in Q]})
    return {'edges':sorted(E),'triangles':[sorted(t) for t in tris(E)],'nu':n,'tau':t,
            'packing':[sorted(x) for x in P],'cover':C,'deletions':deletions,
            'one_edge_resilient':all(x['nu']==n for x in deletions)}
if platform.system()!='Darwin' or sys.executable!='PRIVATE_PATH_REMOVED':raise ValueError('pinned local Mac required')
H1=clique((0,1,2,3))|clique((0,1,2,4))|clique((0,1,3,5))
G1=H1|clique((0,1,2,3,6))
H2=H1|clique((0,2,3,6))
G2=H2|clique((1,2,3,7))
records=[]
for name,H,G,expected in [('seven_vertex_defect_three',H1,G1,(3,4,4,5)),('eight_vertex_defect_two',H2,G2,(4,5,4,6))]:
    h,g=metrics(H),metrics(G)
    if (h['nu'],h['tau'],g['nu'],g['tau'])!=expected:raise ValueError('optimum mismatch')
    if h['one_edge_resilient'] or not g['one_edge_resilient']:raise ValueError('descent behavior mismatch')
    records.append({'name':name,'predecessor':h,'child':g})
result={'status':'PASS','scope':'Two explicitly specified graphs only; no search-count or smallest-order verification.',
        'method':'Independent all-actual-triangle enumeration; exact packing/cover subset search; every single-edge deletion checked.',
        'records':records,'python':sys.version,'python_executable':sys.executable,
        'elapsed_seconds':time.monotonic()-START}
(ROOT/'reviews/critic_bridge_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','elapsed_seconds':result['elapsed_seconds'],'records':[{'name':r['name'],'before':[r['predecessor']['nu'],r['predecessor']['tau']],'after':[r['child']['nu'],r['child']['tau']]} for r in records]}))
