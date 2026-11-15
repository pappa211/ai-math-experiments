"""Independent tiny certificate audit: identification and support-cover gluing.
No atlas, discovery code, or producer optimizer is imported.
"""
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations, product
from pathlib import Path
import json

STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
started=datetime.now(timezone.utc);assert started<STOP
ROOT=Path('SCRATCH_OUTPUT')
def edge(a,b):return tuple(sorted((a,b)))
def te(t):return frozenset(combinations(sorted(t),2))
def triangles(V,E):return tuple(t for t in combinations(sorted(V),3) if te(t)<=E)
def packing(T):
    best=()
    for size in range(len(T)+1):
        found=None
        for Q in combinations(T,size):
            if len(set().union(*(te(t) for t in Q)))==3*size:
                found=Q;break
        if found is None:break
        best=found
    return best
def covers(T,E,all_min=False):
    for size in range(len(E)+1):
        out=[frozenset(C) for C in combinations(sorted(E),size) if all(te(t)&set(C) for t in T)]
        if out:return out if all_min else out[0]
    raise AssertionError('No cover')
def parameters(V,E):
    T=triangles(V,E);P=packing(T);C=covers(T,E)
    return dict(vertices=sorted(V),edges=sorted(E),triangles=T,nu=len(P),tau=len(C),
                defect=len(C)-2*len(P),packing=P,cover=sorted(C))
def quotient(V,E,a,b):
    f=lambda x:a if x==b else x
    return set(V)-{b},{edge(f(x),f(y)) for x,y in E if f(x)!=f(y)}
def compare(r,d):
    assert set(r['vertices'])==set(d['vertices'])
    assert set(map(tuple,r['edges']))==set(map(tuple,d['edges']))
    ts=d.get('triangles',d.get('all_actual_triangles'))
    assert set(r['triangles'])==set(map(tuple,ts))
    for key in ('nu','tau','defect'):
        if key in d:assert r[key]==d[key],(key,r[key],d[key])
def load(name):return json.loads((ROOT/('tuza18_addendum_input_'+name)).read_text())

rootwheel=load('identification_gate.json')['witness']
rootrepair=load('identification_star_repair.json')
rootcycle=next(r for r in rootrepair['literal_rows'] if r['atlas_index']==rootrepair['witness_index'])
wheelV=set(range(6));wheelE={edge(i,(i+1)%5) for i in range(5)}|{(i,5) for i in range(5)}
cycleV=set(range(7));cycleE={edge(i,(i+d)%7) for i in range(7) for d in (1,2)}
identifications=[]
for label,V,E,producer in [('wheel',wheelV,wheelE,rootwheel),('C7_square',cycleV,cycleE,rootcycle)]:
    r=parameters(V,E);compare(r,producer.get('original',producer))
    expected=(2,3,-1) if label=='wheel' else (3,4,-2)
    assert (r['nu'],r['tau'],r['defect'])==expected
    rootrows={tuple(q['identified']):q for q in producer['quotients']}
    assert set(rootrows)==set(combinations(sorted(V),2))
    qs=[]
    for a,b in combinations(sorted(V),2):
        qV,qE=quotient(V,E,a,b);q=parameters(qV,qE);q['identified']=[a,b]
        compare(q,rootrows[(a,b)])
        n=2 if label=='wheel' else 3
        assert q['nu']==q['tau']==n and q['defect']<r['defect']
        qs.append(q)
    star={v:len(packing(tuple(t for t in r['triangles'] if v in t))) for v in V}
    if label=='C7_square':assert set(star.values())=={2}
    # Both graphs have one nonempty shared-edge triangle component with full support.
    seen={r['triangles'][0]};todo=list(seen)
    while todo:
        t=todo.pop()
        for u in r['triangles']:
            if u not in seen and te(t)&te(u):seen.add(u);todo.append(u)
    assert seen==set(r['triangles']) and set().union(*(te(t) for t in seen))==E
    assert len(V)>5
    identifications.append({'name':label,'original':r,'largest_star_by_vertex':star,'quotients':qs})

literal=load('late_star_literal_verified.json')
V={0,1,2,3,4,5,7}
E=set(combinations(sorted(V),2))-{(0,5),(5,7),(1,3),(2,4)}
r=parameters(V,E);compare(r,literal)
P=((2,3,7),(0,1,2),(1,4,7),(3,4,5))
assert r['nu']==4 and len(set().union(*(te(t) for t in P)))==12
B=frozenset().union(*(te(t) for t in P));T=r['triangles']
private=[]
for t in P:
    bases={next(iter(te(q)&B)) for q in T if q!=t and len(te(q)&B)==1 and te(q)&B<=te(t)}
    assert len(bases)==1
    private.append(next(iter(bases)))
assert private==[(3,7),(1,2),(4,7),(3,4)]
minimum=covers(T,B,all_min=True)
assert len(minimum)==9 and all(len(C)==8 for C in minimum)
assert set(minimum)=={frozenset(map(tuple,C)) for C in literal['all_minimum_support_covers']}
centres=tuple(next(iter(set(t)-set(b))) for t,b in zip(P,private))
assert centres==(2,0,1,5)
def group_budget(C,cs):
    return all(sum(len(te(t)&C) for t,c in zip(P,cs) if c==v)<=2*sum(c==v for c in cs) for v in set(cs))
def hall(C):
    heavy=[i for i,t in enumerate(P) if len(te(t)&C)==3]
    light=[i for i,t in enumerate(P) if len(te(t)&C)==1]
    def match(at,used):
        if at==len(heavy):return True
        return any(j not in used and set(P[heavy[at]])&set(P[j]) and match(at+1,used|{j}) for j in light)
    return match(0,set())
cover_rows=[]
for C in minimum:
    valid=[cs for cs in product(*P) if group_budget(C,cs)]
    assert bool(valid)==hall(C)
    assert not group_budget(C,centres)
    cover_rows.append({'cover':sorted(C),'costs':[len(te(t)&C) for t in P],
                       'hall_satisfied':hall(C),'compatible_assignments':len(valid)})
assert sum(x['hall_satisfied'] for x in cover_rows)==8
bad=frozenset(map(tuple,literal['bad_minimum_cover']));good=frozenset(map(tuple,literal['good_minimum_cover']))
assert not hall(bad) and hall(good)
assert [len(te(t)&bad) for t in P]==[2,3,2,1]
assert [len(te(t)&good) for t in P]==[2,2,3,1]
goodcentres=(2,0,4,4)
assert group_budget(good,goodcentres)
local=[]
for v in sorted(set(goodcentres)):
    Pv=tuple(t for t,c in zip(P,goodcentres) if c==v)
    Bv=frozenset().union(*(te(t) for t in Pv))
    Ev=E-(B-Bv);Tv=triangles(V,Ev);Cv=good&Bv
    assert all(te(t)&Cv for t in Tv)
    assert len(Cv)<=2*len(Pv) and len(packing(Tv))==len(Pv)
    local.append({'centre':v,'packed_triangles':Pv,'actual_triangles':Tv,'cover':sorted(Cv)})
gluing={'graph':r,'packing':P,'private_bases':private,'support_cover_optimum':8,
        'all_minimum_support_covers':cover_rows,'hall_compatible_minima':8,
        'hall_incompatible_minima':1,'good_local_graphs':local,
        'scope':'Canonical centres fail; one restricted minimum fails Hall; eight restricted minima succeed. No existential SG or PK refutation.'}
finished=datetime.now(timezone.utc);assert finished<STOP
inputs={p.name:sha256(p.read_bytes()).hexdigest() for p in sorted(ROOT.glob('tuza18_addendum_input_*'))}
out={'status':'PASS','started_utc':started.isoformat(),'finished_utc':finished.isoformat(),
     'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'input_sha256':inputs,
     'identification_cases':identifications,'gluing_case':gluing,
     'limitations':['Only the two supplied identification witnesses and their 36 quotients are replayed, not the atlas rows.',
                    'Only the supplied gluing witness and its nine minimum support covers are checked, not the saved source corpus.',
                    'The all-size Hall equivalence is an ordinary proof, not inferred from this finite check.']}
(ROOT/'tuza18_addendum_literal_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'status':'PASS','finished_utc':finished.isoformat(),'script_sha256':out['script_sha256'],
                  'quotients':36,'gluing_nu':r['nu'],'gluing_unrestricted_tau':r['tau'],
                  'support_cover_optimum':8,'minimum_support_covers':9,'hall_compatible':8},sort_keys=True))
