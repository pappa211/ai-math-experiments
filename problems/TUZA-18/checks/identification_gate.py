"""Initial decisive test of the specified defect-preserving identification route."""
from pathlib import Path
from itertools import combinations
import networkx as nx, json, datetime, time, hashlib
from apex_probe import Exact
ROOT=Path(__file__).resolve().parents[1]
STOP=datetime.datetime(2026,11,14,21,0,10,tzinfo=datetime.timezone.utc)
assert datetime.datetime.now(datetime.timezone.utc)<STOP
def block_type(ex):
    todo=set(range(len(ex.tris)))
    while todo:
        seen={todo.pop()};stack=list(seen)
        while stack:
            t=stack.pop()
            new={u for u in todo if ex.tm[t]&ex.tm[u]}
            seen.update(new);todo-=new;stack.extend(new)
        vertices=set().union(*(set(ex.tris[i]) for i in seen))
        edges=set().union(*(set(combinations(ex.tris[i],2)) for i in seen))
        if len(vertices) not in (3,4,5) or len(edges)!=len(vertices)*(len(vertices)-1)//2:return False
    return True
def row(g):
    ex=Exact(g);nu=ex.pack(ex.all);tau=ex.cover(ex.all)
    return dict(vertices=sorted(g),edges=ex.edges,triangles=ex.tris,nu=nu,tau=tau,defect=tau-2*nu)
start=time.monotonic();checked=[];witness=None
for index,g in enumerate(nx.graph_atlas_g()):
    if datetime.datetime.now(datetime.timezone.utc)>=STOP:raise RuntimeError('cutoff')
    ex=Exact(g)
    if block_type(ex):continue
    r=row(g);quotients=[]
    for x,y in combinations(sorted(g),2):
        h=nx.Graph();h.add_nodes_from(v for v in g if v!=y)
        h.add_edges_from((x if a==y else a,x if b==y else b) for a,b in g.edges() if {a,b}!={x,y})
        q=row(h);q['identified']=[x,y];quotients.append(q)
    best=max(q['defect'] for q in quotients)
    checked.append(dict(atlas_index=index,defect=r['defect'],best_quotient_defect=best))
    if best<r['defect']:
        witness=dict(atlas_index=index,original=r,quotients=quotients);break
result=dict(status='VI_REFUTED_CANDIDATE' if witness else 'NO_WITNESS_IN_INITIAL_ATLAS',scope='Initial atlas falsification, not a general proof',time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),elapsed=time.monotonic()-start,checked=checked,witness=witness,networkx=nx.__version__,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/identification_gate.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(status=result['status'],eligible=len(checked),elapsed=result['elapsed'],witness_index=witness['atlas_index'] if witness else None)))
