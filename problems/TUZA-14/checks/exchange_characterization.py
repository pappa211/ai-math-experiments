"""Targeted exact checks of the frozen blue-replacement characterization.
Uses TUZA-13 core READ ONLY for full-graph optima, and independently implements
ordinary vertex-cover and direct replacement checking. No census.
"""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import sys,json,time,signal,hashlib,datetime
ROOT=Path(__file__).resolve().parents[1]
SOURCE=Path(__file__).resolve().parents[2]/'TUZA-13'
sys.dont_write_bytecode=True
sys.path.insert(0,str(SOURCE/'checks'))
from core import Graph,bits

def timeout(*args): raise TimeoutError('60-second total hard timeout')
signal.signal(signal.SIGALRM,timeout);signal.alarm(60)

@lru_cache(None)
def min_vcs(pairs):
    if not pairs:return (frozenset(),)
    a,b=pairs[0];out=set();best=10**9
    for x in (a,b):
        rest=tuple(p for p in pairs if x not in p)
        for z in min_vcs(rest):
            z=z|{x}
            if len(z)<best:best=len(z);out=set()
            if len(z)==best:out.add(z)
    return tuple(sorted(out,key=lambda z:tuple(sorted(z))))

def inputs():
    for name in ['independent_nearest_9_normalized.json','independent_nearest_3_normalized.json','independent_nearest_0_normalized.json','clebsch_two_red_required.json']:
        p=SOURCE/'witnesses'/name; d=json.loads(p.read_text())
        yield {'name':d['name'],'n':d['n'],'edges':d['edges'],'cover':d['cover'],'source_file':str(p),'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
    yield {'name':'K7','n':7,'edges':list(combinations(range(7),2)),'cover':list(combinations(range(3),2))+list(combinations(range(3,7),2))}
    yield {'name':'restoration8','n':8,'edges':[(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)],'cover':[(0,1),(2,3),(0,7),(1,5),(2,5)]}
    yield {'name':'K4','n':4,'edges':list(combinations(range(4),2)),'cover':[(0,1),(2,3)]}
    yield {'name':'unique_central_red_triangle','n':9,'edges':[(0,1),(1,2),(0,2),(0,3),(1,3),(0,4),(1,4),(1,5),(2,5),(1,6),(2,6),(0,7),(2,7),(0,8),(2,8)],'cover':[(0,1),(1,2),(0,2)]}

def check(d):
    t0=time.monotonic();g=Graph(d['n'],d['edges'],seconds=30)
    c=g.cover_mask(d['cover']);tau,covers,complete=g.covers(limit=100000)
    assert complete and c in covers and c.bit_count()==tau
    evaluation=g.evaluate(c);fullnu=len(g.packing())
    B=((1<<len(g.edges))-1)^c;reds=list(bits(c));reconstructed=set();rows=[]
    for sm in range(1<<len(reds)):
        S=sum(1<<reds[i] for i in range(len(reds)) if sm>>i&1)
        affected=[m for m in g.masks if not m&(c^S)]
        impossible=any(not m&B for m in affected)
        if impossible:
            rows.append({'S':list(bits(S)),'feasible':False});continue
        forced=0
        for m in affected:
            if (m&B).bit_count()==1:forced|=m&B
        pairs=tuple(sorted(set(tuple(bits(m&B)) for m in affected if not m&forced and (m&B).bit_count()==2)))
        zlist=min_vcs(pairs);cost=forced.bit_count()+len(zlist[0])
        assert cost>=S.bit_count()
        replacements=[]
        for z in zlist:
            D=forced|sum(1<<e for e in z);new=(c^S)|D
            assert all(m&new for m in g.masks)
            assert D.bit_count()==cost
            if cost==S.bit_count():reconstructed.add(new);replacements.append(list(bits(D)))
        rows.append({'S':list(bits(S)),'feasible':True,'forced_blue':list(bits(forced)),'auxiliary_pairs':pairs,'cost':cost,'slack':cost-S.bit_count(),'equal_cost_replacements':replacements})
    assert reconstructed==set(covers)
    # Verify private-witness sharing geometry and uniqueness lower bound.
    priv={e:[m for m in g.masks if m&c==1<<e] for e in reds}
    singleton=[(e,ts[0]) for e,ts in priv.items() if len(ts)==1]
    assert all(not a[1]&b[1] for a,b in combinations(singleton,2))
    clashes=0
    for e,f in combinations(reds,2):
        if any(a&b&B for a in priv[e] for b in priv[f]):
            clashes+=1
            assert not any(m&c==(1<<e)|(1<<f) for m in g.masks)
    return {'input':d,'edges':g.edges,'triangles':g.triangles,'tau':tau,'full_nu':fullnu,'designated':evaluation,'all_min_covers':[[g.edges[e] for e in bits(x)] for x in covers], 'reconstructed_min_covers_count':len(reconstructed),'red_subsets':len(rows),'infeasible_red_subsets':sum(not r['feasible'] for r in rows),'unique_private_red_edges':[g.edges[e] for e,_ in singleton],'private_blue_conflict_pairs':clashes,'subset_records':rows,'seconds':time.monotonic()-t0,'status':'PASS'}

if __name__=='__main__':
    start=time.monotonic();out={'frozen_claim':'TARGETS_AND_CLOCK.md + notes/EXCHANGE_CHARACTERIZATION.md','started_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'core_sha256':hashlib.sha256((SOURCE/'checks/core.py').read_bytes()).hexdigest(),'scope':'eight designated graph/minimum-cover pairs, all red subsets; exact reconstruction of all optimum covers per graph','records':[]}
    try:
        for d in inputs():out['records'].append(check(d))
        out['status']='PASS'
    except Exception as e:
        out['status']='TIMEOUT' if isinstance(e,TimeoutError) else 'ERROR';out['error']=repr(e)
    signal.alarm(0);out['seconds']=time.monotonic()-start
    (ROOT/'evidence/exchange_characterization.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({'status':out['status'],'seconds':out['seconds'],'records':[{'name':r['input']['name'],'tau':r['tau'],'full_nu':r['full_nu'],'k':r['designated']['eligible_nu'],'subsets':r['red_subsets'],'minimum_covers':len(r['all_min_covers'])} for r in out['records']],'error':out.get('error')},indent=2))
    if out['status']!='PASS':sys.exit(1)
