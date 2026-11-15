"""Literal obstruction to two perfect triangle-intersection pieces.
Only finite graph construction, actual triangle closure, exact coloring checks.
The all-orders obstruction is the ordinary proof in notes/triangle_graph_routes.md.
"""
from itertools import combinations
from pathlib import Path
import hashlib, json, platform, time


def mycielski(n, edges):
    out = set(edges)
    for a, b in edges:
        out.add(tuple(sorted((n+a, b))))
        out.add(tuple(sorted((n+b, a))))
    out |= {(n+i, 2*n) for i in range(n)}
    return 2*n+1, out


def coloring(n, edges, k):
    adj = [set() for _ in range(n)]
    for a,b in edges:
        adj[a].add(b); adj[b].add(a)
    assigned = [-1]*n
    nodes = 0
    def dfs(used):
        nonlocal nodes
        nodes += 1
        candidates = [v for v in range(n) if assigned[v]<0]
        if not candidates:
            return list(assigned)
        v = max(candidates, key=lambda v:(len({assigned[w] for w in adj[v] if assigned[w]>=0}),len(adj[v]),-v))
        blocked = {assigned[w] for w in adj[v]}
        for c in range(min(k, used+1)):
            if c in blocked:
                continue
            assigned[v]=c
            result=dfs(max(used,c+1))
            if result is not None:
                return result
        assigned[v]=-1
        return None
    return dfs(0), nodes


def k5_check():
    n=5
    edges=set(combinations(range(n),2))
    triangles=list(combinations(range(n),3))
    ted=[set(combinations(t,2)) for t in triangles]
    comp=[tuple(v for v in range(n) if v not in t) for t in triangles]
    adjacent=lambda i,j:bool(ted[i]&ted[j])
    assert all(adjacent(i,j)==bool(set(comp[i])&set(comp[j])) for i,j in combinations(range(10),2))
    forbidden=[]
    for mask in range(1,1<<10):
        members=[i for i in range(10) if mask>>i&1]
        if all(adjacent(i,j) for i,j in combinations(members,2)):
            common=set.intersection(*(ted[i] for i in members))
            if not common:
                forbidden.append(mask)
    admissible=[]
    for red in range(1<<10):
        blue=((1<<10)-1)^red
        if any(mask&red==mask or mask&blue==mask for mask in forbidden):
            continue
        for color in [red,blue]:
            members=[i for i in range(10) if color>>i&1]
            assert len(members)==5
            degrees=[sum(v in comp[i] for i in members) for v in range(5)]
            assert degrees==[2]*5
            ti_degrees=[sum(adjacent(i,j) for j in members if j!=i) for i in members]
            assert ti_degrees==[2]*5
            # A simple 2-regular graph on five vertices is a single C5.
        admissible.append(red)
    assert len(admissible)==12
    def parameters(support):
        ts=[t for t in ted if t<=support]
        nu=0
        for mask in range(1<<len(ts)):
            selected=[ts[i] for i in range(len(ts)) if mask>>i&1]
            if len(selected)>nu and all(not a&b for a,b in combinations(selected,2)):
                nu=len(selected)
        es=sorted(support)
        tau=next(k for k in range(len(es)+1) if any(all(set(c)&t for t in ts) for c in combinations(es,k)))
        return nu,tau
    assert parameters(edges)==(2,4)
    for edge in edges:
        assert parameters(edges-{edge})[1]==3
    for removed in combinations(edges,2):
        assert parameters(edges-set(removed))[0]==2
    return {'n':5,'m':10,'triangles':[list(t) for t in triangles],'triangle_graph_is_LK5':True,'non_common_edge_cliques':len(forbidden),'all_two_colorings':1<<10,'common_edge_clique_valid_colorings':len(admissible),'all_valid_colorings_have_both_parts_C5':True,'two_perfect_common_edge_partitions':0,'nu':2,'tau':4,'every_single_edge_deletion_tau':3,'every_two_edge_deletion_nu':2,'red_masks':admissible}


def main():
    assert platform.system() == 'Darwin'
    started=time.time()
    n=5; edges={tuple(sorted((i,(i+1)%5))) for i in range(5)}
    rows=[]
    for level in range(3):
        triangles=[list(t) for t in combinations(range(n),3) if all(e in edges for e in combinations(t,2))]
        assert not triangles
        upper,nodes_yes=coloring(n,edges,level+3)
        lower,nodes_no=coloring(n,edges,level+2)
        assert upper is not None and lower is None
        assert all(upper[a]!=upper[b] for a,b in edges)
        rows.append({'mycielski_level':level,'n':n,'m':len(edges),'chromatic_number':level+3,'proper_coloring':upper,'yes_search_nodes':nodes_yes,'lower_unsat_search_nodes':nodes_no})
        if level<2:
            n,edges=mycielski(n,edges)
    hub=n
    graph_edges=edges | {(v,hub) for v in range(n)}
    triangles=[t for t in combinations(range(n+1),3) if all(e in graph_edges for e in combinations(t,2))]
    expected=[(a,b,hub) for a,b in sorted(edges)]
    assert triangles==expected
    triangle_edges=[set(combinations(t,2)) for t in triangles]
    ti_edges={(i,j) for i,j in combinations(range(len(triangles)),2) if triangle_edges[i] & triangle_edges[j]}
    rim_edges=sorted(edges)
    line_edges={(i,j) for i,j in combinations(range(len(rim_edges)),2) if set(rim_edges[i]) & set(rim_edges[j])}
    assert ti_edges==line_edges
    receipt={'status':'PASS','verification':'exact finite check; not formal verification','host':platform.system(),'python':platform.python_version(),'seconds':time.time()-started,'levels':rows,'k5':k5_check(),'cone':{'n':n+1,'m':len(graph_edges),'actual_triangle_count':len(triangles),'triangle_graph_is_rim_line_graph':True,'triangle_intersection_edges':len(ti_edges),'rim_edges':[list(e) for e in sorted(edges)],'graph_edges':[list(e) for e in sorted(graph_edges)],'triangles':[list(t) for t in triangles]},'scope':'Counterexample to universal two-perfect-piece partition only; cone satisfies Tuza by matching endpoint cover argument.'}
    receipt['seconds']=time.time()-started
    here=Path(__file__).resolve()
    receipt['checker_sha256']=hashlib.sha256(here.read_bytes()).hexdigest()
    out=here.parent.parent/'evidence/triangle_graph_routes/literal_check.json'
    out.write_text(json.dumps(receipt,indent=2)+'\n')
    print(json.dumps({key:receipt[key] for key in ['status','host','seconds','levels','k5']},indent=2))

if __name__=='__main__':
    main()
