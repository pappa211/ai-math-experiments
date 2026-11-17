#!/usr/bin/env python3
"""Independent named-model insertion verification, with checked automorphisms.
The input graphs are regenerated from definitions. Exact graph optimization uses
triangle-mask recursion, not the discovery checker or its claimed verdicts.
"""
from functools import lru_cache
from itertools import combinations,combinations_with_replacement,permutations,product
from pathlib import Path
from collections import Counter
import hashlib,json,platform,sys,time
ROOT=Path(__file__).resolve().parents[1];START=time.monotonic();LIMIT=55
calls=Counter()
def require(ok,msg):
    if not ok:raise ValueError(msg)
def tick():
    if time.monotonic()-START>LIMIT:raise TimeoutError('UNKNOWN_TIMEOUT')
def edge(a,b):return tuple(sorted((a,b)))
def clique(v):return frozenset(combinations(sorted(v),2))
def actual_triangles(n,E):return tuple(t for t in combinations(range(n),3) if clique(t)<=E)
def connected_parts(mask,adj):
    parts=[];left=mask
    while left:
        seed=left&-left;left^=seed;part=seed;front=seed
        while front:
            b=front&-front;front^=b;i=b.bit_length()-1
            add=adj[i]&left;left^=add;part|=add;front|=add
        parts.append(part)
    return parts
@lru_cache(None)
def opt(n,E):
    tick();T=actual_triangles(n,E);te=tuple(clique(t) for t in T);q=len(T)
    incident={e:sum(1<<i for i,t in enumerate(te) if e in t) for e in E}
    adj=[sum(1<<j for j,u in enumerate(te) if i!=j and bool(t&u)) for i,t in enumerate(te)]
    @lru_cache(None)
    def pack(mask):
        calls['packing_states']+=1
        if not mask:return 0
        if calls['packing_states']%1000==0:tick()
        parts=connected_parts(mask,adj)
        if len(parts)>1:return sum(pack(p) for p in parts)
        ids=[i for i in range(q) if mask>>i&1]
        v=max(ids,key=lambda i:(adj[i]&mask).bit_count());b=1<<v
        return max(pack(mask^b),1+pack(mask&~(b|adj[v])))
    @lru_cache(None)
    def cover(mask):
        calls['cover_states']+=1
        if not mask:return 0
        if calls['cover_states']%1000==0:tick()
        parts=connected_parts(mask,adj)
        if len(parts)>1:return sum(cover(p) for p in parts)
        ids=[i for i in range(q) if mask>>i&1]
        pivot=max(ids,key=lambda i:sum((incident[e]&mask).bit_count() for e in te[i]))
        candidates={incident[e]&mask for e in te[pivot]}
        candidates={c for c in candidates if not any(c!=d and c&d==c for d in candidates)}
        best=mask.bit_count()
        for c in sorted(candidates,key=int.bit_count,reverse=True):
            best=min(best,1+cover(mask&~c))
        return best
    return pack((1<<q)-1),cover((1<<q)-1)

require(platform.system()=='Darwin','local Mac required')
require(sys.executable=='PRIVATE_PATH_REMOVED','pinned Python required')
models=[]
for count in range(1,4):
    for sizes in combinations_with_replacement((4,5),count):
        pieces=[(0,1,2,3)];nextv=4;private={};types={i:0 for i in (1,2,3)}
        for i,s in enumerate(sizes,1):
            fresh=tuple(range(nextv,nextv+s-2));nextv+=s-2
            private[i]=fresh;types[i]=s;pieces.append((0,i)+fresh)
        E=frozenset().union(*(clique(p) for p in pieces));maps=[]
        for targets in permutations((1,2,3)):
            perm=dict(zip((1,2,3),targets))
            if any(types[i]!=types[perm[i]] for i in (1,2,3)):continue
            choices=[list(permutations(private[perm[i]])) for i in private]
            for images in product(*choices):
                mapping=list(range(nextv));mapping[0]=0
                for i in (1,2,3):mapping[i]=perm[i]
                for i,im in zip(private,images):
                    for v,w in zip(private[i],im):mapping[v]=w
                maps.append(tuple(mapping))
        models.append({'name':'central_K4_star_'+''.join(map(str,sizes)),'n':nextv,'E':E,'pieces':pieces,'maps':maps})
E=clique((0,1,2,3,4))|clique((0,1,5,6,7));maps=[]
for p in permutations((2,3,4)):
    for q in permutations((5,6,7)):
        maps.append((0,1)+p+q)
models.append({'name':'two_K5_edge','n':8,'E':E,'pieces':[(0,1,2,3,4),(0,1,5,6,7)],'maps':maps})
E=frozenset({edge(i,(i+1)%5) for i in range(5)}|{(i,5) for i in range(5)})
maps=[tuple((a+s*i)%5 for i in range(5))+(5,) for a in range(5) for s in (-1,1)]
models.append({'name':'W5','n':6,'E':E,'maps':maps})
models.append({'name':'K5-e','n':5,'E':clique(range(5))-{(3,4)},'maps':[tuple(range(5))]})
seed_bytes=(ROOT/'evidence/residual_edge_exchange_seeds.json').read_bytes()
reported_seeds={s['name']:s for s in json.loads(seed_bytes)}
require(set(reported_seeds)=={s['name'] for s in models},'seed domain mismatch')
report_bytes=(ROOT/'evidence/residual_edge_exchange.json').read_bytes();reported=json.loads(report_bytes)
rows={(r['seed'],tuple(r['inserted'])):r for r in reported['rows']}
require(len(rows)==len(reported['rows']),'duplicate insertion row')
checked=[];qualifying=[];expected=set();representatives=[];seed_receipts=[]
for model in models:
    tick();name,n,E=model['name'],model['n'],model['E']
    supplied=reported_seeds[name]
    require(supplied['n']==n and frozenset(map(tuple,supplied['edges']))==E,'seed graph mismatch')
    if 'pieces' in model:require([list(p) for p in model['pieces']]==supplied['pieces'],'piece definition mismatch')
    for mapping in model['maps']:
        require(sorted(mapping)==list(range(n)),'not a permutation')
        require(frozenset(edge(mapping[u],mapping[v]) for u,v in E)==E,'unverified automorphism')
    seed_nu,seed_tau=opt(n,E)
    require(2*seed_nu-seed_tau==1,'named seed is not defect one')
    seed_receipts.append({'name':name,'n':n,'m':len(E),'triangles':len(actual_triangles(n,E)),
                          'nu':seed_nu,'tau':seed_tau,'checked_automorphisms':len(model['maps'])})
    by_rep={}
    for missing in sorted(clique(range(n))-E):
        key=(name,missing);expected.add(key);require(key in rows,'missing reported case')
        representative,mapping=min((edge(p[missing[0]],p[missing[1]]),p) for p in model['maps'])
        if representative not in by_rep:
            Jrep=E|{representative};by_rep[representative]=opt(n,Jrep)
            representatives.append({'seed':name,'inserted':representative,'nu':by_rep[representative][0],'tau':by_rep[representative][1]})
        nu,tau=by_rep[representative];J=E|{missing};T=actual_triangles(n,J)
        require(frozenset(edge(mapping[u],mapping[v]) for u,v in J)==E|{representative},'insertion isomorphism mismatch')
        new=[t for t in T if missing in clique(t)]
        completions={t:next((v for v in range(n) if v not in t and all(edge(v,u) in J for u in t)),None) for t in T}
        k4_complete=all(v is not None for v in completions.values())
        r=rows[key]
        require((r['nu'],r['tau'])==(nu,tau),'reported optimum mismatch')
        require(frozenset(map(tuple,r['edges']))==J,'reported inserted graph mismatch')
        require(set(map(tuple,r['new_triangles']))==set(new),'reported new triangles mismatch')
        record={'seed':name,'inserted':missing,'nu':nu,'tau':tau,'defect':2*nu-tau,'new_triangles':len(new),
                'all_triangles_in_K4':k4_complete,'representative':representative,'checked_isomorphism':mapping}
        if 2*nu-tau==2 and k4_complete:
            critical=[f for f in sorted(J) if opt(n,J-{f})[0]<nu]
            critical_triangles=[t for t in T if clique(t)<=set(critical)]
            require(critical==list(map(tuple,r['critical_edges'])),'reported critical edges mismatch')
            require(critical_triangles==list(map(tuple,r['all_critical_triangles'])),'reported critical triangles mismatch')
            require(critical==[missing] and not critical_triangles,'claimed obstruction control failed')
            record.update({'critical_edges':critical,'all_critical_triangles':critical_triangles})
            qualifying.append(record)
        checked.append(record)
require(set(rows)==expected,'extra reported domain cases')
counts={'seeds':len(models),'missing_edge_presentations':len(checked),
        'triangle_bearing_insertions':sum(r['new_triangles']>0 for r in checked),
        'exact_optimization_representatives':len(representatives),
        'defect_two_insertions':sum(r['defect']==2 for r in checked),
        'K4_completed_defect_two':len(qualifying),
        'qualifying_with_critical_triangle':sum(bool(r['all_critical_triangles']) for r in qualifying)}
result={'status':'PASS','scope':'Exactly twelve reconstructed named supports, no background edges or new external vertices, and every labeled missing-edge insertion; no universal availability claim.',
        'counts':counts,'seeds':seed_receipts,'representatives':representatives,'rows':checked,'qualifying':qualifying,
        'method':'Independent triangle-mask maximum-independent-set and minimum-cover recursions with exact component splitting; verified explicit automorphisms reduce repeated optimizations.',
        'states':dict(calls),'seed_sha256':hashlib.sha256(seed_bytes).hexdigest(),'discovery_receipt_sha256':hashlib.sha256(report_bytes).hexdigest(),
        'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'python':sys.version,
        'python_executable':sys.executable,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-START,'timeout_seconds':LIMIT}
(ROOT/'reviews/critic_edge_exchange_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','counts':counts,'states':dict(calls),'elapsed_seconds':result['elapsed_seconds']}))
