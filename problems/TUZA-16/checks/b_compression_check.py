#!/usr/bin/env python3
"""Exact small controls for B; no installed solvers, no external outputs."""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json, platform, datetime

def edge(a,b): return tuple(sorted((a,b)))
def triangles(n,E):
    return [t for t in combinations(range(n),3) if all(edge(*e) in E for e in combinations(t,2))]
def exact(n,E):
    es=sorted(E); ts=triangles(n,E); ei={e:i for i,e in enumerate(es)}
    masks=[sum(1<<ei[edge(*e)] for e in combinations(t,2)) for t in ts]
    conflicts=[sum(1<<j for j,b in enumerate(masks) if a&b) for a in masks]
    hit=[sum(1<<j for j,t in enumerate(masks) if t>>i&1) for i in range(len(es))]
    @lru_cache(None)
    def pack(A):
        if not A:return ()
        i=(A&-A).bit_length()-1
        a=pack(A&~(1<<i)); b=(i,)+pack(A&~conflicts[i])
        return a if len(a)>=len(b) else b
    @lru_cache(None)
    def cover(A):
        if not A:return ()
        i=(A&-A).bit_length()-1
        opts=[(j,)+cover(A&~hit[j]) for j in range(len(es)) if masks[i]>>j&1]
        return min(opts,key=len)
    P=pack((1<<len(ts))-1); C=cover((1<<len(ts))-1)
    assert all(not(masks[i]&masks[j]) for i,j in combinations(P,2))
    assert all(any(masks[i]>>j&1 for j in C) for i in range(len(ts)))
    return {'n':n,'edges':es,'triangles':ts,'nu':len(P),'tau':len(C),'packing':[ts[i] for i in P],'cover':[es[j] for j in C],'proof':'Exhaustive exact include/skip packing recurrence and three-way triangle-cover recurrence; integer only.'}
def instance(name,s,m,rim,outer=()):
    X=set(range(s,s+m)); S=set(range(s)); E=set(map(lambda e:edge(*e),rim))
    E|={edge(x,u) for x in X for u in S}; E|={edge(*e) for e in outer}
    n=1+max((max(e) for e in E),default=s+m-1)
    R={e for e in E if not(set(e)&X) and e not in set(map(tuple,rim))}
    g=exact(n,E); r=exact(n,R)
    return {'name':name,'X':sorted(X),'S':sorted(S),'rim':rim,'G':g,'R':r,'offsets':{'nu':g['nu']-r['nu'],'tau':g['tau']-r['tau']}}
rows=[
 instance('book_three_pages',2,3,[(0,1)]),
 instance('saturated_triangle_rim',3,3,[(0,1),(0,2),(1,2)]),
 instance('saturated_triangle_with_crossing_and_residual_triangle',3,3,[(0,1),(0,2),(1,2)],[(6,0),(6,1),(6,2),(7,0),(6,7)]),
 instance('K4_threshold_negative_control',3,1,[(0,1),(0,2),(1,2)]),
 instance('half_saturation_triangle_two_apices',3,2,[(0,1),(0,2),(1,2)]),
 instance('diamond_forced_occupancy_negative_control',2,1,[(0,1)],[(0,3),(1,3)])
]
for row in rows[:3]:assert row['offsets']=={'nu':len(row['rim']),'tau':len(row['rim'])}
assert rows[3]['offsets']=={'nu':1,'tau':2}
assert rows[4]['offsets']=={'nu':2,'tau':3}
assert any(3 in t for t in rows[5]['G']['packing']) or any(set((0,3)).issubset(t) for t in rows[5]['G']['triangles'])
assert not rows[5]['R']['triangles']
# Structural obstruction, not an optimization claim for K10-e.
n=10; E=set(combinations(range(n),2))-{(0,1)}
ind=[(v,) for v in range(n)]+[(0,1)]; certificates=[]
for X in ind:
    B=set(); bound=0
    for x in X:
        N={v for v in range(n) if edge(x,v) in E}
        B|={e for e in E if set(e)<=N};bound+=len(N)//2
    assert len(B)>2*bound
    certificates.append({'X':X,'rim_union':sorted(B),'apical_packing_upper_bound':bound})
out={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'python':platform.python_version(),'small_controls':rows,'dense_obstruction':{'name':'K10_minus_one_edge','n':n,'edges':sorted(E),'triangles':triangles(n,E),'complete_independent_nonempty_sets':ind,'certificates':certificates},'status':'FINITE_CHECKED','scope':'Six exact small controls plus complete independent-set obstruction verification on one dense graph. Not a broad census; no unrestricted Tuza claim.'}
Path(__file__).with_name('b_compression_results.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'small':[{ 'name':r['name'],'offsets':r['offsets']} for r in rows],'dense_independent_sets':len(ind)}))
