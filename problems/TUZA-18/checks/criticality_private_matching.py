#!/usr/bin/env python3
"""Decisive controls for PM-all/PM-exists, using installed atlas as a test corpus.

No atlas-completeness claim is needed or made. Every reported witness contains a
literal edge list, all actual triangles, an exact minimum-cover enumeration, and
exact private-triangle matching optima. This is independent of actual criticality.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json,time,signal,resource
import networkx as nx

def analyze(graph):
    E=sorted(tuple(sorted(e)) for e in graph.edges())
    ix={e:i for i,e in enumerate(E)}
    ts=tuple(sum(1<<ix[e] for e in combinations(t,2))
        for t in combinations(graph.nodes(),3) if all(e in ix for e in combinations(t,2)))
    g=(1<<len(E))-1
    @lru_cache(None)
    def tau(mask):
        t=next((t for t in ts if t&mask==t),0)
        if not t:return 0
        return 1+min(tau(mask&~(1<<i)) for i in range(len(E)) if t>>i&1)
    @lru_cache(None)
    def covers(mask):
        t=next((t for t in ts if t&mask==t),0)
        if not t:return frozenset({0})
        a=tau(mask);ans=set()
        for i in range(len(E)):
            bit=1<<i
            if t&bit and tau(mask&~bit)==a-1:
                ans.update(c|bit for c in covers(mask&~bit))
        return frozenset(ans)
    @lru_cache(None)
    def packing(family):
        if not family:return ()
        t=family[0]
        return max(packing(family[1:]),
                   (t,)+packing(tuple(s for s in family[1:] if not s&t)),key=len)
    a=tau(g);rows=[]
    for c in sorted(covers(g)):
        private=tuple(t for t in ts if (t&c).bit_count()==1)
        p=packing(private)
        rows.append({'cover_mask':c,'private_nu':len(p),'private_triangles':list(private),
                     'packing':list(p)})
    return {'n':len(graph),'edges':E,'all_triangle_masks':list(ts),'tau':a,
            'nu':len(packing(ts)),'minimum_cover_count':len(rows),
            'minimum_private_nu':min((r['private_nu'] for r in rows),default=0),
            'maximum_private_nu':max((r['private_nu'] for r in rows),default=0),
            'cover_states':rows}

if __name__=='__main__':
    signal.alarm(90);start=time.monotonic();completed=0;all_fail=None;exists_fail=None
    private_gap_hist={};maximum_cover_count=0
    for i,g in enumerate(nx.graph_atlas_g()):
        if g.number_of_edges()==0:continue
        row=analyze(g);completed+=1
        maximum_cover_count=max(maximum_cover_count,row['minimum_cover_count'])
        gap=2*row['minimum_private_nu']-row['tau']
        private_gap_hist[gap]=private_gap_hist.get(gap,0)+1
        if gap<0 and all_fail is None:all_fail={'atlas_index':i,**row}
        if 2*row['maximum_private_nu']<row['tau']:
            exists_fail={'atlas_index':i,**row};break
    result={'status':'COMPLETED','scope':'Installed atlas test corpus; no completeness inference.',
            'graphs_completed':completed,'PM_all_counterexample':all_fail,
            'PM_exists_counterexample':exists_fail,'minimum_private_gap_histogram':private_gap_hist,
            'maximum_number_of_minimum_covers':maximum_cover_count,
            'seconds':time.monotonic()-start,
            'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
    Path('evidence/criticality_private_matching.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if not k.endswith('counterexample')}))
    if all_fail:print('PM-all counterexample atlas index',all_fail['atlas_index'])
    if exists_fail:print('PM-exists counterexample atlas index',exists_fail['atlas_index'])
