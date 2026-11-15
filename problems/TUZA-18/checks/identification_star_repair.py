"""One substantive VI repair using the independently proved star terminal class."""
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
            t=stack.pop();new={u for u in todo if ex.tm[t]&ex.tm[u]}
            seen.update(new);todo-=new;stack.extend(new)
        vertices=set().union(*(set(ex.tris[i]) for i in seen))
        edges=set().union(*(set(combinations(ex.tris[i],2)) for i in seen))
        if len(vertices) not in (3,4,5) or len(edges)!=len(vertices)*(len(vertices)-1)//2:return False
    return True
def values(g):
    ex=Exact(g);nu=ex.pack(ex.all);tau=ex.cover(ex.all)
    return dict(vertices=sorted(g),edges=ex.edges,triangles=ex.tris,nu=nu,tau=tau,defect=tau-2*nu)
start=time.monotonic();rows=[];witness=None;counts=dict(atlas_seen=0,block_terminals=0,star_terminals=0)
for index,g in enumerate(nx.graph_atlas_g()):
    if datetime.datetime.now(datetime.timezone.utc)>=STOP:raise RuntimeError('cutoff')
    counts['atlas_seen']+=1;ex=Exact(g)
    if block_type(ex):counts['block_terminals']+=1;continue
    nu=ex.pack(ex.all)
    stars={v:ex.pack(sum(1<<i for i,t in enumerate(ex.tris) if v in t)) for v in g}
    if nu in stars.values():counts['star_terminals']+=1;continue
    row=values(g);row.update(atlas_index=index,largest_star_packings=stars,quotients=[])
    for x,y in combinations(sorted(g),2):
        h=nx.Graph();h.add_nodes_from(v for v in g if v!=y)
        h.add_edges_from((x if a==y else a,x if b==y else b) for a,b in g.edges() if {a,b}!={x,y})
        q=values(h);q['identified']=[x,y];row['quotients'].append(q)
    row['best_quotient_defect']=max(q['defect'] for q in row['quotients']);rows.append(row)
    if row['best_quotient_defect']<row['defect']:witness=row;break
result=dict(status='VI_STAR_REFUTED_CANDIDATE' if witness else 'NO_WITNESS_IN_INITIAL_ATLAS',time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),elapsed=time.monotonic()-start,counts=counts,eligible=len(rows),literal_rows=rows,witness_index=witness['atlas_index'] if witness else None,scope='One fixed-domain falsifier; finite survival is not a universal theorem',networkx=nx.__version__,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/identification_star_repair.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='literal_rows'}))
