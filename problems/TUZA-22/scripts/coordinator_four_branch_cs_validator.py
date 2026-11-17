"""Independent literal certificate/domain validator; no producer imports or optimum solver."""
from pathlib import Path
from itertools import combinations, product, permutations
from collections import Counter
import hashlib, json, time, copy
W=Path(__file__).resolve().parents[1]
START=time.monotonic()
PAIRS=tuple(combinations(range(4),2)); INDEX={p:i for i,p in enumerate(PAIRS)}
STATES=('0','D','E2','O3','DE2','DE4')
PERMS=tuple(permutations(range(4)))
TRANS=tuple(tuple(INDEX[tuple(sorted((p[a],p[b])))] for a,b in PAIRS) for p in PERMS)
def canonical(s):
    images=[]
    for tr in TRANS:
        z=[0]*6
        for old,new in enumerate(tr):z[new]=s[old]
        images.append(tuple(z))
    return min(images)
def eligible(s):
    counts=[0,1,1,1,2,2];deg=[0]*4;direct=set();p=0;ev=0
    for (a,b),x in zip(PAIRS,s):
        t=counts[x];deg[a]+=t;deg[b]+=t;p+=t
        if x in (1,4,5):direct.add((a,b))
        ev+=x in (2,4,5)
    if min(deg)<3 or max(deg)<4 or p-3<max(deg) or ev>3 or len(direct)==6:return False
    if not (4 in s or any(all(tuple(sorted(e)) in direct for e in combinations(t,2)) for t in combinations(range(4),3))):return False
    reach={0}
    while True:
        nxt=reach|{b for (a,b),x in zip(PAIRS,s) if x and a in reach}|{a for (a,b),x in zip(PAIRS,s) if x and b in reach}
        if nxt==reach:break
        reach=nxt
    return len(reach)==4

def graph(s):
    edges=set();paths=[];n=4
    for (a,b),x in zip(PAIRS,s):
        if x in (1,4,5):edges.add((a,b))
        length={2:2,3:3,4:2,5:4}.get(x)
        if length:
            path=(a,*range(n,n+length-1),b);n+=length-1;paths.append(path)
            edges.update(tuple(sorted(e)) for e in zip(path,path[1:]))
    triangles=tuple(t for t in combinations(range(n),3) if all(e in edges for e in combinations(t,2)))
    return n,edges,paths,triangles

def matching(es,E,n):
    v=[x for e in es for x in e]
    return all(len(e)==2 and tuple(sorted(e)) in E for e in es) and len(set(v))==len(v) and all(0<=x<n for x in v)

def validate(row):
    s=tuple(row['state_ids']);assert len(s)==6 and all(0<=x<6 for x in s)
    assert row['states']==[STATES[x] for x in s]
    assert row['pairs']==[list(e) for e in PAIRS]
    assert eligible(s)
    n,E,paths,triangles=graph(s)
    assert row['n']==n
    assert [list(e) for e in sorted(E)]==row['edges']
    assert [list(p) for p in paths]==row['paths']
    assert [list(t) for t in triangles]==row['triangles']
    deg=[sum(v in e for e in E) for v in range(4)]
    assert deg==row['branch_degrees']
    r=row['result'];P=r['P'];Q=r['Q'];assert matching(P,E,n)
    assert len(Q)==len(set(Q)) and set(Q)<=set(range(n))
    Pset={tuple(sorted(e)) for e in P};Qs=set(Q)
    assert all(set(e)&Qs for e in E-Pset)
    assert len(Q)<=len(P)
    kind=r['kind']
    if kind=='STRICT':assert len(Q)<len(P)
    elif kind=='LARGER':
        assert matching(r['Z'],E,n) and len(r['Z'])>len(P)
    elif kind=='RIM':
        T=tuple(sorted(r['T']));assert T in triangles
        TE=set(combinations(T,2));assert Pset&TE
        assert matching(r['Z'],E-TE,n) and len(r['Z'])>=len(P)
    else:raise AssertionError('unknown certificate kind')
    return canonical(s)

raw=W/'evidence/four_branch_cs_interface_probe.json';data=json.loads(raw.read_text())
expected=set();labelled=0
for s in product(range(6),repeat=6):
    if eligible(s):labelled+=1;expected.add(canonical(s))
seen=[]
for row in data['rows']:seen.append(validate(row))
assert len(set(seen))==len(seen)
assert set(seen)==expected
assert data['processed']==len(seen)==data['domain_representatives']
assert data['status']=='ALL_FIXED_DOMAIN_CERTIFIED' and data['first_unresolved'] is None
controls=[]
def rejected(name,row):
    try:validate(row)
    except (AssertionError,KeyError,TypeError,ValueError):controls.append({'control':name,'rejected':True});return
    raise AssertionError('negative control accepted: '+name)
bad=copy.deepcopy(data['rows'][0]);bad['result']['P'].append(bad['result']['P'][0]);rejected('duplicate matching edge',bad)
bad=copy.deepcopy(next(r for r in data['rows'] if r['result']['kind']=='RIM'));bad['result']['T']=[0,0,1];rejected('nontriangle rim',bad)
bad=copy.deepcopy(data['rows'][0]);bad['result']['Q']=[];rejected('empty uncovered vertex cover',bad)
assert set(seen[:-1])!=expected;controls.append({'control':'missing domain representative','rejected':True})
out={'status':'INDEPENDENT_LITERAL_AND_DOMAIN_CHECK_ACCEPTED','source_sha256':hashlib.sha256(raw.read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'all_labelled_state_tuples':6**6,'eligible_labelled_profiles':labelled,'canonical_profiles':len(expected),'certificates_checked':len(seen),'kinds':dict(Counter(r['result']['kind'] for r in data['rows'])),'negative_controls':controls,'unknown':0,'elapsed_seconds':time.monotonic()-START,'solver_used':False,'producer_imported':False,'not_checked':'Producer diagnostic matching optima and tested_matchings are not premises and not revalidated; symbolic all-size scope/lift/footprints require separate review.'}
(W/'evidence/four_branch_cs_independent_validation.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
