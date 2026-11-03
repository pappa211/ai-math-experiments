#!/usr/bin/env python3
"""Cross-audit written only AFTER independent.py was authored and run."""
from pathlib import Path
from itertools import combinations
import datetime, fcntl, hashlib, json, random, signal, time
from independent import ExactGraph
from core import Graph, bits
ROOT=Path(__file__).resolve().parents[1]

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def stamp(): return datetime.datetime.now(datetime.timezone.utc).isoformat()

def run():
    begun=stamp(); start=time.monotonic()
    rows=[]; comparisons=0
    original=json.loads((ROOT/'evidence/independent_controls.json').read_text())
    discovery=[json.loads(line) for line in (ROOT/'evidence/search_controls.jsonl').read_text().splitlines()]
    control_audit=[]
    for old in original['examples']:
        new=next(x for x in discovery if x['input']['name']==old['name'])
        assert new['status']=='EXACT' and new['cover_scope']=='all optima'
        assert old['tau']==new['tau'] and old['nu']==new['nu']
        assert old['triangles']==new['triangles']
        left={tuple(map(tuple,x['cover'])):x['nu_eligible'] for x in old['all_minimum_covers']}
        right={tuple(map(tuple,x['cover'])):x['eligible_nu'] for x in new['records']}
        assert left==right
        control_audit.append(dict(name=old['name'],cover_count=len(left),status='EXACT_AGREEMENT'))
    rng=random.Random(13110277)
    all_edges=list(combinations(range(7),2))
    for j in range(100):
        p=(.25,.40,.55,.70,.85)[j%5]
        edges=[e for e in all_edges if rng.random()<p]
        g=ExactGraph(range(7),edges); core=Graph(7,edges,seconds=10)
        C=g.min_cover(); covers=g.all_min_covers(len(C))
        tau,found,complete=core.covers(limit=100000)
        assert complete and tau==len(C)
        translated={tuple(core.edges[i] for i in bits(c)) for c in found}
        assert translated==set(covers)
        nuf=len(g.max_packing()); assert nuf==len(core.packing())
        for c in covers:
            cls=g.classify(c); a=len(g.max_packing(cls[1]+cls[2]))
            r=core.evaluate(core.cover_mask(c)); assert a==r['eligible_nu']
            assert len(g.max_packing(cls[1]))==r['private_nu']
            threshold=(tau+1)//2
            U=sum(1<<i for i in cls[1]+cls[2])
            tested=core.packing(U,target=threshold)
            assert len(tested)>=threshold if a>=threshold else len(tested)==a
            comparisons+=1
        rows.append(dict(index=j,n=7,p=p,edges=edges,tau=tau,nu=nuf,covers=len(covers),status='EXACT_AGREEMENT'))
    # Literal Clebsch witness; no discovery formulas used in generic solver.
    raw=json.loads((ROOT/'witnesses/hostile_Clebsch_cone.json').read_text())
    if 'cover' in raw:
        C=raw['cover']
    elif 'rows' in raw:
        C=raw['rows'][0]['cover']
    elif 'records' in raw:
        C=raw['records'][0]['cover']
    elif 'minimum_covers' in raw:
        C=raw['minimum_covers'][0]
    else:
        C=raw['covers'][0]
    g=ExactGraph(range(raw['n']),raw['edges'])
    clebsch=g.certify(C)
    assert clebsch['specified_cover_is_minimum'] and clebsch['tau']==11
    assert clebsch['nu']==8 and clebsch['nu_eligible']==8
    return dict(started_utc=begun,ended_utc=stamp(),elapsed_seconds=time.monotonic()-start,
                status='PASS',controls=control_audit,seed=13110277,
                random_graph_count=len(rows),random_optimum_cover_comparisons=comparisons,
                random_graphs=rows,Clebsch_one_cover=clebsch,
                hashes={str(p.relative_to(ROOT)):sha(p) for p in
                  (ROOT/'checks/independent.py',ROOT/'checks/core.py',Path(__file__),ROOT/'witnesses/hostile_Clebsch_cone.json')})

if __name__=='__main__':
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        signal.signal(signal.SIGALRM,lambda s,f: (_ for _ in ()).throw(TimeoutError('300 second independent audit cap')))
        signal.alarm(300)
        try:
            result=run()
        except Exception as exc:
            result=dict(status='FAIL_OR_TIMEOUT',error=repr(exc),ended_utc=stamp())
            (ROOT/'evidence/independent_core_audit.json').write_text(json.dumps(result,indent=2)+'\n')
            raise
        finally:
            signal.alarm(0)
        (ROOT/'evidence/independent_core_audit.json').write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps({k:v for k,v in result.items() if k not in ('random_graphs','Clebsch_one_cover')},indent=2))
