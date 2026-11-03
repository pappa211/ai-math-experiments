#!/usr/bin/env python3
from pathlib import Path
from itertools import combinations, product
from functools import lru_cache
import json,time,resource,hashlib
A=Path(__file__).resolve().parents[1]
def es(v):return {tuple(sorted(e)) for e in combinations(v,2)}
def packing(family):
    fs=[frozenset(t) for t in family]
    @lru_cache(None)
    def go(i,used):
        if i==len(fs):return 0
        a=go(i+1,used)
        if not set(used)&fs[i]:a=max(a,1+go(i+1,tuple(sorted(set(used)|fs[i]))))
        return a
    return go(0,())
def cover(family,vertices):
    for n in range(len(vertices)+1):
        for c in combinations(vertices,n):
            if all(set(c)&set(t) for t in family):return n,list(c)
    raise AssertionError
start=time.monotonic()
fano=[(0,1,2),(0,3,4),(0,5,6),(1,3,5),(1,4,6),(2,3,6),(2,4,5)]
assert len({tuple(sorted(e)) for t in fano for e in combinations(t,2)})==21
abstract={'nu':packing(fano),'tau':cover(fano,list(range(7)))[0],'point_deletions':[]}
for v in range(7):
    rem=[t for t in fano if v not in t]
    abstract['point_deletions'].append({'deleted_point':v,'nu':packing(rem),'tau':cover(rem,[x for x in range(7) if x!=v])[0]})
assert abstract['nu']==1 and abstract['tau']==3
assert all(x['nu']==1 and x['tau']==2 for x in abstract['point_deletions'])
abstract['interpretation']='Rank-three incidence hypergraph only, not an actual graph triangle model. Critical-looking deletion pattern does not prove factor two. It also fails combined tightness tau=2nu. The actual proof uses missing endpoint edges, clique closure and residual K4/K5 avoidance.'
twin=[]
for wa,wb in product([False,True],repeat=2):
    g=es('uvabcd')|{tuple(sorted(e)) for e in ['uw','vw','wc','wd']}
    if wa:g.add(('a','w'))
    if wb:g.add(('b','w'))
    x={tuple(sorted(e)) for e in ['ab','bc','cd','da','uw','vw','ua','ub','vc','vd']}
    deleted={e for e in g if 'u' in e or 'v' in e}|{tuple(sorted(e)) for e in ['ab','bc','cd','da']}
    k=g-deleted
    tris=[t for t in combinations('abcdwuv',3) if es(t)<=g]
    uncovered=[t for t in tris if not es(t)&x]
    assert all(es(t)<=k for t in uncovered)
    lost=[t for t in tris if not es(t)<=k]
    assert all(es(t)&x for t in lost)
    twin.append({'wa':wa,'wb':wb,'uncovered_by_increment':[list(t) for t in uncovered],'all_uncovered_are_retained':True,'lost_triangle_count':len(lost),'all_lost_covered':True,'overstrong_full_core_assertion_would_fail':bool(uncovered)})
result={'status':'PASS','assertions_enabled':__debug__,'fano':abstract,'TWIN_lost_vs_retained':twin,'elapsed_seconds':time.monotonic()-start,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(A/'evidence/scope_diagnostics.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
