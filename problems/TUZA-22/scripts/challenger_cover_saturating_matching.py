#!/usr/bin/env python3
"""Exact bounded falsifier: every minimum vertex cover saturated by a matching."""
import json,time,datetime,functools
from pathlib import Path
import networkx as nx
start=time.monotonic(); cases=0; graphs=0; trianglefree=0; failures=[]; unknown=[]
for index,G in enumerate(nx.graph_atlas_g()):
    if time.monotonic()-start>45:
        unknown.append({'next_atlas_index':index,'reason':'internal_deadline'});break
    n=len(G); E=[tuple(sorted(e)) for e in G.edges()]; em=[(1<<u)|(1<<v) for u,v in E]; full=(1<<n)-1
    indep=[s for s in range(1<<n) if all((s&e)!=e for e in em)]
    alpha=max(map(int.bit_count,indep),default=0); qs=[full^s for s in indep if s.bit_count()==alpha]
    adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    is_tf=not any(adj[u]&adj[v] for u,v in E)
    graphs+=1;trianglefree+=is_tf
    for q in qs:
        cases+=1
        @functools.lru_cache(None)
        def opt(s):
            if not s:return (0,())
            b=s&-s;u=b.bit_length()-1;rest=s^b;best=opt(rest)
            neighbors=adj[u]&rest
            while neighbors:
                d=neighbors&-neighbors;neighbors^=d;v=d.bit_length()-1
                val,edges=opt(rest^d);val+=bool(q&b)+bool(q&d)
                if val>best[0]:best=(val,edges+((u,v),))
            return best
        value,M=opt(full)
        if value<q.bit_count():
            failures.append({'atlas_index':index,'n':n,'edges':E,'minimum_vertex_cover':[v for v in range(n) if q>>v&1],'cover_number':q.bit_count(),'matching_weight_optimum':value,'matching':M,'triangle_free':is_tf})
            break
    if failures:break
result={'claim':'Any specified minimum vertex cover is saturated by a matching','domain':'networkx graph_atlas_g, all simple graph isomorphism types through seven vertices, sequential until first failure or internal45s','graphs_completed':graphs,'trianglefree_graphs_completed':trianglefree,'minimum_covers_tested':cases,'failures':failures,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'evidence':'finite exact independent-set and weighted-matching subset recurrences; not an all-size proof'}
Path('evidence/challenger_cover_saturating_matching.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
