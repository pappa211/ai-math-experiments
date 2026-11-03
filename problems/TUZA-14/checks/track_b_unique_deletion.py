"""Targeted frozen B9 on existing control covers only; source engine read-only."""
from pathlib import Path
import json,sys,time
SOURCE=Path(__file__).resolve().parents[2]/'TUZA-13'
sys.path.insert(0,str(SOURCE/'checks'))
from core import Graph,bits,BudgetExceeded
ROOT=Path(__file__).resolve().parents[1]
start=time.monotonic();records=[];failure=[];cache={};unresolved=[]
data=json.loads((ROOT/'evidence'/'track_a_controls.json').read_text())
for record in data['records']:
    if not record.get('covers_complete'):
        unresolved.append({'name':record['name'],'reason':'input covers incomplete'});continue
    g=Graph(record['n'],record['edges'],seconds=3)
    for ti,test in enumerate(record['cover_tests']):
        C=g.cover_mask(test['cover']);counts=[(m&C).bit_count() for m in g.masks]
        for e in bits(C):
            private=[i for i,m in enumerate(g.masks) if counts[i]==1 and (m>>e)&1]
            if len(private)!=1:continue
            q=private[0];key=(record['name'],q)
            if key not in cache:
                if time.monotonic()-start>20:
                    cache[key]={'status':'UNRESOLVED_GLOBAL_CAP'}
                else:
                    h=Graph(g.n,[edge for i,edge in enumerate(g.edges) if not (g.masks[q]>>i)&1],seconds=2)
                    try:
                        residual_tau,ds,complete=h.covers(limit=1)
                        cache[key]={'status':'EXACT','residual_tau':residual_tau,'residual_cover':[h.edges[i] for i in bits(ds[0])]}
                    except BudgetExceeded:
                        cache[key]={'status':'TIMEOUT'}
            item={'name':record['name'],'cover_index':ti,'n':g.n,'cover':test['cover'],'tau':record['tau'],'red_edge':g.edges[e],'unique_private_triangle':g.triangles[q],**cache[key]}
            if item['status']=='EXACT':
                item['loss']=record['tau']-item['residual_tau'];item['B9_pass']=item['loss']<=2
                assert 1<=item['loss']<=3
                if not item['B9_pass']:
                    item['edges']=g.edges;failure.append(item)
            else:unresolved.append(item)
            records.append(item)
out={'candidate':'B9 frozen in notes/TRACK_B.md before execution','control_graph_count':len(data['records']),'cover_count':sum(len(r.get('cover_tests',[])) for r in data['records']),'unique_witness_checks':len(records),'distinct_residual_graphs':len(cache),'records':records,'failures':failure,'unresolved':unresolved,'elapsed_seconds':time.monotonic()-start,'source_engine':str(SOURCE/'checks'/'core.py')}
(ROOT/'evidence'/'track_b_unique_deletion.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['control_graph_count','cover_count','unique_witness_checks','distinct_residual_graphs','elapsed_seconds']}|{'failures':len(failure),'unresolved':len(unresolved),'loss_counts':{str(d):sum(r.get('loss')==d for r in records) for d in (1,2,3)}}))
if failure: print(json.dumps(failure[0]))
