#!/usr/bin/env python3
from independent import ExactGraph
from pathlib import Path
from itertools import combinations
import datetime,fcntl,hashlib,json,time
ROOT=Path(__file__).resolve().parents[1]

def normalize(index):
    path=ROOT/f'witnesses/nearest_loss_{index}.json';raw=json.loads(path.read_text())
    active=sorted({v for e in raw['edges'] for v in e}); ix={v:i for i,v in enumerate(active)}
    graph=dict(name=f'independent_normalized_nearest_{index}',n=len(active),vertices=list(range(len(active))),
               edges=sorted([sorted([ix[u],ix[v]]) for u,v in raw['edges']]),
               cover=sorted([sorted([ix[u],ix[v]]) for u,v in raw['cover']]),
               source_file=str(path.relative_to(ROOT)),source_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
               original_vertices=list(range(raw['n'])),original_edges=raw['edges'],
               deleted_isolates=sorted(set(range(raw['n']))-set(active)),
               old_to_new=ix,claimed_tau=raw['tau'],claimed_eligible_nu=raw['eligible_nu'],claimed_nu=raw['nu'])
    dest=ROOT/f'witnesses/independent_nearest_{index}_normalized.json'
    dest.write_text(json.dumps(graph,indent=2)+'\n')
    return graph,dest

def run(graph):
    g=ExactGraph(graph['vertices'],graph['edges']); result=g.certify(graph['cover'],all_covers=True)
    assert result['tau']==graph['claimed_tau'] and result['nu_eligible']==graph['claimed_eligible_nu'] and result['nu']==graph['claimed_nu']
    assert result['deficiency']==0 and result['nu_eligible']<result['nu']
    edges=set(g.edges)
    cliques=[tuple(c) for k in range(3,len(g.vertices)+1) for c in combinations(g.vertices,k) if all(e in edges for e in combinations(c,2))]
    maximal=[c for c in cliques if not any(set(c)<set(d) for d in cliques)]
    seen=set();components=[]
    for root in g.vertices:
        if root in seen:continue
        todo=[root];seen.add(root);comp=[]
        while todo:
            v=todo.pop();comp.append(v)
            for a,b in g.edges:
                w=b if a==v else a if b==v else None
                if w is not None and w not in seen:seen.add(w);todo.append(w)
        components.append(sorted(comp))
    result.update(name=graph['name'],maximal_cliques_size_at_least_three=maximal,connected_components=components,
                  input_provenance={k:graph[k] for k in ('source_file','source_sha256','deleted_isolates','old_to_new')},
                  checked_utc=datetime.datetime.now(datetime.timezone.utc).isoformat())
    return result

if __name__=='__main__':
    prepared=[normalize(i) for i in (9,3,0)]
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        summary=[]
        for graph,path in prepared:
            result=run(graph)
            out=ROOT/f'evidence/{graph["name"]}.json';out.write_text(json.dumps(result,indent=2)+'\n')
            row={k:result[k] for k in ('name','tau','nu','nu_eligible','all_minimum_cover_count','maximal_cliques_size_at_least_three','connected_components')}
            summary.append(row); print(json.dumps(row),flush=True)
        (ROOT/'evidence/independent_nearest_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
