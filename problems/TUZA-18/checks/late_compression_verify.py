"""Fixed-control Kelmans compression discriminator; standard library only.
No graph census. All actual triangles and exact tiny optima are reconstructed.
"""
from itertools import combinations, permutations
from pathlib import Path
from time import monotonic
import hashlib
import json

ROOT=Path(__file__).resolve().parent
if ROOT.name=="checks" and (ROOT.parent/"evidence").is_dir():
    ROOT=ROOT.parent/"evidence"
START=monotonic()

def edge(a,b): return tuple(sorted((a,b)))

def exact(vertices, edges):
    assert len(vertices)<=7 and len(edges)<=14
    ts=tuple(t for t in combinations(sorted(vertices),3)
             if all(edge(*e) in edges for e in combinations(t,2)))
    assert len(ts)<=16
    te=[frozenset(edge(*e) for e in combinations(t,2)) for t in ts]
    best=()
    for mask in range(1<<len(ts)):
        chosen=tuple(i for i in range(len(ts)) if mask&(1<<i))
        if len(chosen)<=len(best): continue
        used=set()
        for i in chosen:
            if used.intersection(te[i]): break
            used.update(te[i])
        else: best=chosen
    es=tuple(sorted(edges)); cover=None
    for size in range(len(es)+1):
        for chosen in combinations(es,size):
            if all(set(chosen).intersection(t) for t in te):
                cover=chosen; break
        if cover is not None: break
    assert cover is not None
    nu,tau=len(best),len(cover)
    return {'vertices':sorted(vertices),'edges':es,'triangles':ts,
            'nu':nu,'tau':tau,'defect':tau-2*nu,
            'packing':tuple(ts[i] for i in best),'cover':cover,
            'packing_subsets_inspected':1<<len(ts)}

def compress(vertices,edges,a,b):
    ns={v:{y if x==v else x for x,y in edges if v in (x,y)} for v in vertices}
    moved=ns[b]-ns[a]-{a}
    if len(ns[a])<len(ns[b]) or not moved: return None
    removed={edge(b,x) for x in moved}; added={edge(a,x) for x in moved}
    assert removed<=edges and not added.intersection(edges)
    new=(edges-removed)|added
    assert len(new)==len(edges) and all(x!=y for x,y in new)
    before=sum(len(ns[v])**2 for v in vertices)
    ds={v:sum(v in e for e in new) for v in vertices}
    after=sum(ds[v]**2 for v in vertices)
    delta=2*len(moved)*(len(ns[a])-len(ns[b]))+2*len(moved)**2
    assert after-before==delta>0
    return new,{'receiver':a,'donor':b,'moved_neighbours':sorted(moved),
                'deleted_edges':sorted(removed),'added_edges':sorted(added),
                'edge_count_before':len(edges),'edge_count_after':len(new),
                'degree_square_before':before,'degree_square_after':after,
                'degree_square_delta':delta}

def star_maxima(vertices, edges):
    ts=tuple(t for t in combinations(sorted(vertices),3)
             if all(edge(*e) in edges for e in combinations(t,2)))
    out={}
    for v in sorted(vertices):
        candidates=[t for t in ts if v in t]; best=()
        for mask in range(1<<len(candidates)):
            selected=tuple(candidates[i] for i in range(len(candidates)) if mask&(1<<i))
            if len(selected)<=len(best):continue
            used=set()
            for t in selected:
                es={edge(*e) for e in combinations(t,2)}
                if used&es:break
                used|=es
            else:best=selected
        out[str(v)]={'size':len(best),'packing':best}
    return out

def main():
    cases={
      'C7square':(set(range(7)),{edge(i,(i+d)%7) for i in range(7) for d in (1,2)}),
      'coneC5':(set(range(6)),{edge(i,(i+1)%5) for i in range(5)}|{edge(5,i) for i in range(5)}),
      'edge_glued_K4s':(set(range(6)),set(combinations(range(4),2))|set(combinations((0,1,4,5),2))),
    }
    records={}
    for name,(vs,es) in cases.items():
        assert monotonic()-START<60
        original=exact(vs,es); rows=[]
        for a,b in permutations(sorted(vs),2):
            result=compress(vs,es,a,b)
            if result is None:continue
            new,details=result; row=exact(vs,new);row.update(details);rows.append(row)
        records[name]={'original':original,'compressions':rows}
    glued=records['edge_glued_K4s']; orig=glued['original']
    assert (orig['nu'],orig['tau'],orig['defect'])==(2,3,-1)
    assert len(glued['compressions'])==8
    assert all((r['nu'],r['tau'],r['defect'])==(3,3,-3) for r in glued['compressions'])
    glued['original']['star_maxima']=star_maxima(*cases['edge_glued_K4s'])
    assert glued['original']['star_maxima']['0']['size']==2
    c7=records['C7square']; assert len(c7['compressions'])==42
    c7['original']['star_maxima']=star_maxima(*cases['C7square'])
    assert all(v['size']==2 for v in c7['original']['star_maxima'].values())
    assert (c7['original']['nu'],c7['original']['tau'])==(3,4)
    orbit_counts={1:0,2:0,3:0}
    for r in c7['compressions']:
        d=(r['receiver']-r['donor'])%7;dist=min(d,7-d);orbit_counts[dist]+=1
        expected=(3,4,-2) if dist==2 else (4,4,-4)
        assert (r['nu'],r['tau'],r['defect'])==expected
    assert orbit_counts=={1:14,2:14,3:14}
    representative=next(r for r in c7['compressions'] if (r['receiver'],r['donor'])==(0,2))
    representative['star_maxima']=star_maxima(set(representative['vertices']),set(map(tuple,representative['edges'])))
    assert representative['star_maxima']['0']['size']==representative['nu']==3
    assert len(records['coneC5']['compressions'])==20
    output={'status':'PASS','scope':'exactly three named fixed controls and their 70 allowed compressions; no graph census',
      'method':'all actual triangles; exhaustive packing subsets and increasing-cardinality actual-edge cover subsets',
      'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
      'requested_model':'GPT-6 Astra','requested_reasoning':'Ultra',
      'actual_runtime_model':'not exposed to this agent','actual_runtime_reasoning':'not exposed to this agent',
      'claims':{'universal_threshold_terminal_compression_availability':False,
                'threshold_plus_common_vertex_maximum_packing_repair':'UNRESOLVED',
                'C7square_refutes_repair':False,'ordinary_Tuza_counterexample':False},
      'records':records}
    path=ROOT/'late_compression_verified.json';path.write_text(json.dumps(output,indent=2)+'\n')
    print(json.dumps({'status':'PASS','allowed_compressions':70,'output':str(path),'elapsed_seconds':monotonic()-START}))

if __name__=='__main__':main()
