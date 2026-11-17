"""Independent literal/domain verifier for Tsujimura F007/F008.
Written without reading or executing either producer check.py. No graph census.
"""
from pathlib import Path
from itertools import combinations, permutations, product
from collections import Counter
import json, hashlib, time, datetime
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'literature/tsujimura_zenodo_24047493'
START=time.monotonic()

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def canonical(profile, paths):
    b=len(profile); out=[]
    for order in permutations(range(b)):
        if tuple(profile[x] for x in order)!=tuple(profile):continue
        ren={v:i for i,v in enumerate(order)}
        out.append(tuple(sorted((min(ren[a],ren[b]),max(ren[a],ren[b]),l) for a,b,l in paths)))
    return min(out)

def suppressed_models(profile):
    b=len(profile);pairs=list(combinations(range(b),2))
    for loops in product(*(range(x//2+1) for x in profile)):
        rem=[x-2*l for x,l in zip(profile,loops)]
        def rec(k, vals):
            if k==len(pairs):
                if any(rem):return
                seen={0}
                while True:
                    old=len(seen)
                    for (u,v),m in zip(pairs,vals):
                        if m and (u in seen or v in seen):seen.update((u,v))
                    if len(seen)==old:break
                if len(seen)==b:yield loops,tuple(vals)
                return
            u,v=pairs[k]
            for m in range(min(rem[u],rem[v])+1):
                rem[u]-=m;rem[v]-=m
                yield from rec(k+1,vals+[m])
                rem[u]+=m;rem[v]+=m
        yield from rec(0,[])

def required(profile):
    b=len(profile);pairs=list(combinations(range(b),2));signatures=set();models=0;raw=0
    for loops, mults in suppressed_models(profile):
        models+=1; groups=[]
        for u,count in enumerate(loops):
            if count:groups.append([[(u,u,3)]*odd+[(u,u,4)]*(count-odd) for odd in range(count+1)])
        for (u,v),count in zip(pairs,mults):
            if count:
                options=[]
                for direct in range(min(1,count)+1):
                    for even in range(count-direct+1):
                        options.append([(u,v,1)]*direct+[(u,v,2)]*even+[(u,v,3)]*(count-direct-even))
                groups.append(options)
        for choice in product(*groups):
            raw+=1;signatures.add(canonical(profile,[p for group in choice for p in group]))
    return signatures,models,raw

def literal(record):
    n=record['vertices'];raw=record['edges'];E={tuple(sorted(e)) for e in raw}
    assert len(E)==len(raw) and all(0<=a<b<n for a,b in E)
    adj=[set() for _ in range(n)]
    for a,b in E:adj[a].add(b);adj[b].add(a)
    assert all(2<=len(a)<=4 for a in adj)
    seen={0};todo=[0]
    while todo:
        for y in adj[todo.pop()]:
            if y not in seen:seen.add(y);todo.append(y)
    assert len(seen)==n
    M={tuple(sorted(e)) for e in record['M']};Q=set(record['Q'])
    assert len(M)==len(record['M']) and M<=E
    assert len({x for e in M for x in e})==2*len(M)
    assert len(Q)==len(record['Q']) and Q<=set(range(n)) and len(Q)<=len(M)
    assert all(a in Q or b in Q for a,b in E-M)
    branches=sorted((x for x in range(n) if len(adj[x])!=2),key=lambda x:(len(adj[x]),x))
    profile=tuple(len(adj[x]) for x in branches)
    if not branches:
        assert len(E)==n
        return profile,(('cycle',3 if n%2 else 4),),n,len(E)
    assert profile.count(3)<=2 and profile.count(4)<=2
    used=set();paths=[];lookup={v:i for i,v in enumerate(branches)}
    for s in branches:
        for first in sorted(adj[s]):
            e=tuple(sorted((s,first)))
            if e in used:continue
            used.add(e);prior=s;now=first;length=1
            while now not in lookup:
                nxt=next(iter(adj[now]-{prior}));edge=tuple(sorted((now,nxt)))
                assert edge not in used
                used.add(edge);prior,now=now,nxt;length+=1
            if now==s:
                assert length>=3
                cls=3 if length%2 else 4
            else:cls=1 if length==1 else 3 if length%2 else 2
            paths.append((lookup[s],lookup[now],cls))
    assert used==E
    return profile,canonical(profile,paths),n,len(E)

files=['kernels/F007/WKE_KERNELS.json','kernels/F008/KERNELS.json']
allrecords=[]
for fn,key in zip(files,['kernels','records']):
    d=json.loads((SRC/fn).read_text())
    allrecords += [(fn,r) for r in d[key]]
actual={};counts=Counter();maxn={};maxe={}
for fn,record in allrecords:
    profile,sig,n,m=literal(record)
    actual.setdefault(profile,set()).add(sig);counts[(fn,profile)]+=1
    maxn[profile]=max(n,maxn.get(profile,0));maxe[profile]=max(m,maxe.get(profile,0))
profiles=[(),(4,),(3,3),(4,4),(3,3,4),(3,3,4,4)]
assert set(actual)==set(profiles)
report=[]
for profile in profiles:
    if not profile:expected={(('cycle',3),),(('cycle',4),)};models=1;raw=2
    else:expected,models,raw=required(profile)
    missing=expected-actual[profile];extra=actual[profile]-expected
    assert not missing and not extra,(profile,list(missing)[:3],list(extra)[:3])
    report.append({'profile':profile,'labeled_suppressed_models':models,'unordered_path_records_before_branch_symmetry':raw,'canonical_parity_records':len(expected),'saved_records':sum(v for (fn,p),v in counts.items() if p==profile),'max_vertices':maxn[profile],'max_edges':maxe[profile],'domain_sha256':hashlib.sha256(repr(sorted(expected)).encode()).hexdigest(),'missing':0,'extra':0})
out={'status':'PASS','finite_scope':'All F007/F008 literal witnesses and complete suppressed/path parity domains; no other obligations','independent_of_producer_checkers':True,'input_sha256':{fn:sha(SRC/fn) for fn in files},'script_sha256':sha(Path(__file__)),'literal_records_checked':len(allrecords),'invalid_witnesses':0,'unknown':0,'domains':report,'seconds':time.monotonic()-START,'completed_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
(ROOT/'evidence/wke_primary_independent_verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
