#!/usr/bin/env python3
"""Independent fixed-control audit; no producer imports or graph search."""
from itertools import combinations
from pathlib import Path
import hashlib,json,platform

W=Path(__file__).resolve().parents[1]
OUT=W/'evidence/k2_join_tf_fresh'
OUT.mkdir(parents=True,exist_ok=True)

def induced_edges(edges,s):
    return sum(bool(s>>u&1 and s>>v&1) for u,v in edges)

def bipartite(n,edges,s):
    adj=[[] for _ in range(n)]
    for u,v in edges:
        if s>>u&1 and s>>v&1:
            adj[u].append(v);adj[v].append(u)
    colors={}
    for r in range(n):
        if not s>>r&1 or r in colors:continue
        colors[r]=0; stack=[r]
        while stack:
            u=stack.pop()
            for v in adj[u]:
                if v in colors:
                    if colors[v]==colors[u]:return False
                else:colors[v]=1-colors[u];stack.append(v)
    return True

def rim_parameters(n,edges):
    full=(1<<n)-1
    e=[induced_edges(edges,s) for s in range(1<<n)]
    sizes=[s.bit_count() for s in range(1<<n)]
    alpha=max(sizes[s] for s in range(1<<n) if not e[s])
    b=max(sizes[s] for s in range(1<<n) if bipartite(n,edges,s))
    vals=[2*sizes[s]-e[s] for s in range(1<<n)]
    M=max(vals);opts=[s for s in range(1<<n) if vals[s]==M]
    t=2*n-M
    q=min(2*sizes[s]+e[s]+e[full^s] for s in range(1<<n))
    eta=min(e[s]+e[full^s] for s in range(1<<n))
    k=n-b
    critical={}
    for edge in edges:
        reduced=[x for x in edges if x!=edge]
        be=max(sizes[s] for s in range(1<<n) if bipartite(n,reduced,s))
        ae=max(sizes[s] for s in range(1<<n) if induced_edges(reduced,s)==0)
        critical[str(edge)]={'oct':n-be,'alpha':ae}
    excludes=[any(not(s>>v&1) for s in opts) for v in range(n)]
    degree=[sum(v in edge for edge in edges) for v in range(n)]
    j=sum(1<<v for v in range(n) if degree[v]==3)
    alpha_j=max(sizes[s] for s in range(1<<n) if not s&~j and not e[s])
    max_bip=[s for s in range(1<<n) if sizes[s]==b and bipartite(n,edges,s)]
    if M==b+1:
        assert b in (2*alpha-1,2*alpha)
        # Every coloring of every largest induced bipartite set is balanced/nearly.
        for s in max_bip:
            for a in range(1<<n):
                if a&~s:continue
                z=s^a
                if not e[a] and not e[z]:assert abs(sizes[a]-sizes[z])<=1
        if b%2:
            assert all(x['alpha']==alpha for x in critical.values())
        else:
            assert all(x['alpha']==alpha+1 for x in critical.values() if x['oct']==k-1)
    if max(degree,default=0)<=3:
        assert q==t==len(edges)-alpha_j
    # Optimizers can always be simplified to induced degree <=1.
    assert any(all(sum((s>>w&1) for edge in edges if v in edge for w in edge if w!=v)<=1 for v in range(n) if s>>v&1) for s in opts)
    return {'n':n,'m':len(edges),'alpha':alpha,'b':b,'k':k,'M':M,'t':t,'q':q,'eta':eta,'minimizer_excludes_each_vertex':excludes,'edge_deletion_parameters':critical,'tie':1+t==n+k,'oct_edge_critical':all(x['oct']==k-1 for x in critical.values()),'condition_3':all(excludes),'alpha_J_degree_three':alpha_j}

def literal_join(n,rim_edges):
    a,b=n,n+1
    edges=sorted(set(tuple(sorted(e)) for e in rim_edges+[(a,b)]+[(z,v) for z in (a,b) for v in range(n)]))
    index={e:i for i,e in enumerate(edges)}
    triangles=[]
    for vs in combinations(range(n+2),3):
        es=[tuple(sorted(e)) for e in combinations(vs,2)]
        if all(e in index for e in es):triangles.append(sum(1<<index[e] for e in es))
    minimum=len(edges)+1;mins=[];odd=len(edges)+1
    mode=[len(edges)+1,len(edges)+1]
    ab=1<<index[(a,b)]
    for c in range(1<<len(edges)):
        size=c.bit_count()
        if size>max(minimum,odd,max(mode)):continue
        if all(c&t for t in triangles):
            if size<minimum:minimum=size;mins=[c]
            elif size==minimum:mins.append(c)
            z=bool(c&ab);mode[z]=min(mode[z],size)
            if all((c&t).bit_count()%2 for t in triangles):odd=min(odd,size)
    full=[any(c&t==t for c in mins) for t in triangles]
    return {'edges':len(edges),'triangles':len(triangles),'tau':minimum,'pi':odd,'minimum_covers':len(mins),'mode_ab_omitted':mode[0],'mode_ab_selected':mode[1],'TF':all(full),'full_triangle_count':sum(full)}

cases={
    'K2':(2,[(0,1)]),
    'P3':(3,[(0,1),(1,2)]),
    'P4':(4,[(0,1),(1,2),(2,3)]),
    'C4':(4,[(0,1),(1,2),(2,3),(0,3)]),
    'C5':(5,[(0,1),(1,2),(2,3),(3,4),(0,4)]),
    'claw':(4,[(0,1),(0,2),(0,3)])}
results={}
for name,(n,edges) in cases.items():
    par=rim_parameters(n,edges);lit=literal_join(n,edges)
    assert lit['mode_ab_selected']==1+par['t']
    assert lit['mode_ab_omitted']==n+par['k']
    assert lit['tau']==min(1+par['t'],n+par['k'])
    assert lit['pi']==min(1+par['q'],n+par['eta'])
    assert lit['TF']==(par['tie'] and par['oct_edge_critical'] and par['condition_3'])
    results[name]={'rim':par,'literal_join':lit}
# A single named larger control exercises the degree-three reduction, not graph search.
pet_edges=[]
for i in range(5):pet_edges.extend([(i,(i+1)%5),(i,i+5),(i+5,5+(i+2)%5)])
pet_edges=sorted(set(tuple(sorted(e)) for e in pet_edges))
results['Petersen']={'rim':rim_parameters(10,pet_edges)}
assert results['Petersen']['rim']['t']==11
assert results['Petersen']['rim']['b']==7
assert results['P4']['rim']['tie']
assert results['P4']['rim']['edge_deletion_parameters']['(1, 2)']['alpha']==2
assert results['C5']['literal_join']['TF']
assert results['C5']['literal_join']['tau']==results['C5']['literal_join']['pi']==6
payload={'status':'PASS','host':platform.system(),'input_sha256':hashlib.sha256((W/'review/k2_join_tf_fresh_inputs/global_routes_k2_join_tf.md').read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'fixed_cases':results,'scope':'Six fixed tiny joins exhaustively enumerated; one named Petersen rim subset control. No producer imports, no expanded graph search.'}
(OUT/'results.json').write_text(json.dumps(payload,indent=2)+'\n')
print(json.dumps({'status':'PASS','input_sha256':payload['input_sha256'],'fixed_join_cases':list(cases),'C5_TF':True,'P4_tie_only_alpha_critical_counterexample':True,'Petersen_t_q':11},indent=2))
