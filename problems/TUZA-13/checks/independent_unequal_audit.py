#!/usr/bin/env python3
"""Generic independent solver crosschecks specialized unequal-apex records."""
from independent import ExactGraph
from pathlib import Path
from itertools import product
import datetime,fcntl,hashlib,json,random,time
ROOT=Path(__file__).resolve().parents[1]

def run():
    sources=['witnesses/hostile_C5_apices4_nearest.json','witnesses/hostile_C7_apices2_nearest.json','evidence/hostile_unequal_c5_apices3.json']
    selected=[];hashes={}
    for src in sources:
        p=ROOT/src;hashes[src]=hashlib.sha256(p.read_bytes()).hexdigest();raw=json.loads(p.read_text())
        rows=raw['graphs'] if isinstance(raw,dict) else raw
        if isinstance(raw,dict):
            rng=random.Random(13110233)
            ids=rng.sample(range(len(rows)),12)
            ids += [next(i for i,r in enumerate(rows) if r['max_T3']>0),len(rows)-1]
        else:
            ids=sorted(range(len(rows)),key=lambda i:(-rows[i]['max_T3'],-rows[i]['tau'],len(rows[i]['edges'])))[:6]
        selected.extend((src,i,rows[i]) for i in dict.fromkeys(ids))
    hashes.update({str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in (Path(__file__),ROOT/'checks/independent.py',ROOT/'checks/hostile_unequal_c5.py',ROOT/'checks/hostile_unequal_cycles.py')})
    results=[]
    for src,index,raw in selected:
        g=ExactGraph(range(raw['n']),raw['edges']);opt=g.min_cover();covers=g.all_min_covers(len(opt))
        assert len(opt)==raw['tau'] and len(covers)==raw['all_cover_count']
        assert len(g.max_packing())==raw['nu_full']
        if 'triangles' in raw:assert list(map(list,g.triangles))==raw['triangles']
        counts=[];max3=0;values=[]
        for C in covers:
            cls=g.classify(C);p=g.max_packing(cls[1]+cls[2]);values.append(len(p));max3=max(max3,len(cls[3]))
            counts.append(dict(cover=C,nu_eligible=len(p),T3_count=len(cls[3]),packing=[g.triangles[i] for i in p]))
        claimed=raw['min_eligible_nu'] if 'min_eligible_nu' in raw else raw['nearest']['nu_eligible']
        assert min(values)==claimed and max3==raw['max_T3']
        if 'all_cover_parameterization' in raw:
            ES=tuple(sorted(tuple(sorted((i,(i+1)%5))) for i in range(5)))
            Ns=raw['apex_neighborhood_masks'];expanded=set()
            for entry in raw['all_cover_parameterization']:
                F=entry['base_Fmask']
                for Us in product(*entry['apex_U_options']):
                    C=tuple(sorted([e for j,e in enumerate(ES) if F>>j&1]+[(v,5+i) for i,(N,U) in enumerate(zip(Ns,Us)) for v in range(5) if N>>v&1 and not U>>v&1]))
                    expanded.add(C)
            assert expanded==set(covers)
        results.append(dict(source=src,index=index,vertices=g.vertices,edges=g.edges,triangles=g.triangles,tau=len(opt),nu=len(g.max_packing()),all_minimum_cover_count=len(covers),min_eligible_nu=min(values),max_T3=max3,cover_results=counts,status='EXACT_AGREEMENT'))
    return dict(status='PASS',checked_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),sample_seed=13110233,
                graph_comparisons=len(results),cover_comparisons=sum(r['all_minimum_cover_count'] for r in results),
                graphs_with_T3=sum(r['max_T3']>0 for r in results),source_hashes=hashes,records=results)

if __name__=='__main__':
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        result=run();(ROOT/'evidence/independent_unequal_audit.json').write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps({k:v for k,v in result.items() if k!='records'},indent=2))
